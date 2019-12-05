Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD4311393E
	for <lists+linux-doc@lfdr.de>; Thu,  5 Dec 2019 02:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbfLEBXQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 Dec 2019 20:23:16 -0500
Received: from mga05.intel.com ([192.55.52.43]:11477 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727146AbfLEBXQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Dec 2019 20:23:16 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Dec 2019 17:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,279,1571727600"; 
   d="scan'208";a="385977676"
Received: from spandruv-mobl3.jf.intel.com ([10.252.134.55])
  by orsmga005.jf.intel.com with ESMTP; 04 Dec 2019 17:23:12 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     rjw@rjwysocki.net, lenb@kernel.org, rui.zhang@intel.com,
        corbet@lwn.net
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [UPDATE][PATCH] ACPI / fan: Display fan performance state information
Date:   Wed,  4 Dec 2019 17:23:09 -0800
Message-Id: <20191205012309.23868-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When _FPS object indicates support of variable speed fan, thermal cooling
devices for fan shows max performance state count using attribute
"max_state" greater than or equal to 1.

But the thermal cooling device doesn't display properties of each
performance state. This is not enough for smart fan control user space
software, which also considers speed, power and noise level.

This change presents fan performance states attributes under acpi
device for the fan. This will be under:
/sys/bus/acpi/devices/devices/INT3404:00
or
/sys/bus/platform/devices/PNP0C0B:00.

For more information refer to:
Documentation/acpi/fan_performance_states.txt

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Tested-by: Sumeet Pawnikar <sumeet.r.pawnikar@intel.com>
---
updated version:
	Removed one unnecessary platoform_device* conversion from
	acpi_device* in the function argument.

 Documentation/acpi/fan_performance_states.txt |  39 +++++++
 drivers/acpi/fan.c                            | 106 ++++++++++++++++--
 2 files changed, 138 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/acpi/fan_performance_states.txt

diff --git a/Documentation/acpi/fan_performance_states.txt b/Documentation/acpi/fan_performance_states.txt
new file mode 100644
index 000000000000..06fd8eb002f2
--- /dev/null
+++ b/Documentation/acpi/fan_performance_states.txt
@@ -0,0 +1,39 @@
+When the optional object _FPS is present for ACPI devices PNP0C0B or INT3404,
+additional attributes are displayed under acpi device object. These attributes
+display information about each performance state.
+
+For example
+$ ls /sys/bus/acpi/devices/INT3404\:00
+description        fan_perf_state_11  fan_perf_state_5  fan_perf_state_9  physical_node  uevent
+fan_perf_state_0   fan_perf_state_2   fan_perf_state_6  hid               power          uid
+fan_perf_state_1   fan_perf_state_3   fan_perf_state_7  modalias          status         wakeup
+fan_perf_state_10  fan_perf_state_4   fan_perf_state_8  path              subsystem
+
+Each fan_perf_state_* contains the information about the fields for each state as
+defined by the ACPI specification.
+
+For example
+$ grep . /sys/bus/acpi/devices/INT3404\:00/fan_perf_state_1/*
+/sys/bus/acpi/devices/INT3404:00/fan_perf_state_1/control_percent:25
+/sys/bus/acpi/devices/INT3404:00/fan_perf_state_1/noise_level_mdb:12500
+/sys/bus/acpi/devices/INT3404:00/fan_perf_state_1/power_mw:1250
+/sys/bus/acpi/devices/INT3404:00/fan_perf_state_1/speed_rpm:3200
+/sys/bus/acpi/devices/INT3404:00/fan_perf_state_1/trip_point_index:invalid
+
+Fields
+control_percent: Indicates the value to be used to set the fan speed to a
+specific level using the _FSL object. The value here is from 0-100 percent.
+
+noise_level_mdb: Indicates the audible noise emitted by the fan. By the
+specification the value represents the noise in 10ths of decibels. Here
+it is multiplied with 100 to present in milli-db, to avoid loss of
+precision. When not populated, "not-defined" is displayed.
+
+speed_rpm: Indicates the speed of the fan in revolutions per minute.
+
+power_mw: Indicates the power consumption in milliwatts. When not populated,
+"not-defined" is displayed.
+
+trip_point_index: The active cooling trip point number that corresponds to this
+performance state. The range is from 0-9. For any other values, "invalid" is
+be displayed.
diff --git a/drivers/acpi/fan.c b/drivers/acpi/fan.c
index 816b0803f7fb..f5e9f67e6a5f 100644
--- a/drivers/acpi/fan.c
+++ b/drivers/acpi/fan.c
@@ -50,6 +50,7 @@ struct acpi_fan_fps {
 	u64 speed;
 	u64 noise_level;
 	u64 power;
+	struct kobject kobj;
 };
 
 struct acpi_fan_fif {
@@ -265,6 +266,64 @@ static int acpi_fan_speed_cmp(const void *a, const void *b)
 	return fps1->speed - fps2->speed;
 }
 
+#define to_fps_state(k) container_of(k, struct acpi_fan_fps, kobj)
+
+#define DEFINE_ONE_FPS_ATTR_RO(_name)\
+	static struct kobj_attribute _name =\
+		__ATTR(_name, 0444, show_##_name, NULL)
+
+#define FPS_INFO_SHOW(name, object, multiplier)\
+static ssize_t show_##name(struct kobject *kobj,\
+			   struct kobj_attribute *attr,\
+			   char *buf)\
+{\
+	struct acpi_fan_fps *fps = to_fps_state(kobj);\
+\
+	if (fps->object == 0xFFFFFFFF)\
+		return sprintf(buf, "not-defined\n");\
+\
+	return sprintf(buf, "%llu\n", multiplier * fps->object);\
+}
+
+FPS_INFO_SHOW(control_percent, control, 1)
+FPS_INFO_SHOW(speed_rpm, speed, 1)
+FPS_INFO_SHOW(power_mw, power, 1)
+FPS_INFO_SHOW(noise_level_mdb, noise_level, 100)
+
+static ssize_t show_trip_point_index(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     char *buf)
+{
+	struct acpi_fan_fps *fps = to_fps_state(kobj);
+
+	if (fps->trip_point > 9)
+		return sprintf(buf, "invalid\n");
+
+	return sprintf(buf, "%llu\n", fps->trip_point);
+}
+
+DEFINE_ONE_FPS_ATTR_RO(control_percent);
+DEFINE_ONE_FPS_ATTR_RO(trip_point_index);
+DEFINE_ONE_FPS_ATTR_RO(speed_rpm);
+DEFINE_ONE_FPS_ATTR_RO(noise_level_mdb);
+DEFINE_ONE_FPS_ATTR_RO(power_mw);
+
+static struct attribute *fps_attrs[] = {
+	&control_percent.attr,
+	&trip_point_index.attr,
+	&speed_rpm.attr,
+	&noise_level_mdb.attr,
+	&power_mw.attr,
+	NULL
+};
+
+static struct kobj_type fps_ktype = {
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_attrs = fps_attrs,
+};
+
+#define ACPI_FPS_NAME_LEN	20
+
 static int acpi_fan_get_fps(struct acpi_device *device)
 {
 	struct acpi_fan *fan = acpi_driver_data(device);
@@ -295,12 +354,13 @@ static int acpi_fan_get_fps(struct acpi_device *device)
 	}
 	for (i = 0; i < fan->fps_count; i++) {
 		struct acpi_buffer format = { sizeof("NNNNN"), "NNNNN" };
-		struct acpi_buffer fps = { sizeof(fan->fps[i]), &fan->fps[i] };
+		struct acpi_buffer fps = { offsetof(struct acpi_fan_fps, kobj),
+						&fan->fps[i] };
 		status = acpi_extract_package(&obj->package.elements[i + 1],
 					      &format, &fps);
 		if (ACPI_FAILURE(status)) {
 			dev_err(&device->dev, "Invalid _FPS element\n");
-			break;
+			goto err;
 		}
 	}
 
@@ -308,6 +368,21 @@ static int acpi_fan_get_fps(struct acpi_device *device)
 	sort(fan->fps, fan->fps_count, sizeof(*fan->fps),
 	     acpi_fan_speed_cmp, NULL);
 
+	for (i = 0; i < fan->fps_count; ++i) {
+		char name[ACPI_FPS_NAME_LEN];
+
+		snprintf(name, ACPI_FPS_NAME_LEN, "fan_perf_state_%d", i);
+		status = kobject_init_and_add(&fan->fps[i].kobj, &fps_ktype,
+					      &device->dev.kobj, name);
+		if (status) {
+			int j;
+
+			for (j = 0; j < i; ++j)
+				kobject_put(&fan->fps[j].kobj);
+			break;
+		}
+	}
+
 err:
 	kfree(obj);
 	return status;
@@ -331,13 +406,13 @@ static int acpi_fan_probe(struct platform_device *pdev)
 
 	if (acpi_fan_is_acpi4(device)) {
 		if (acpi_fan_get_fif(device) || acpi_fan_get_fps(device))
-			goto end;
+			goto err_end;
 		fan->acpi4 = true;
 	} else {
 		result = acpi_device_update_power(device, NULL);
 		if (result) {
 			dev_err(&device->dev, "Failed to set initial power state\n");
-			goto end;
+			goto err_end;
 		}
 	}
 
@@ -350,7 +425,7 @@ static int acpi_fan_probe(struct platform_device *pdev)
 						&fan_cooling_ops);
 	if (IS_ERR(cdev)) {
 		result = PTR_ERR(cdev);
-		goto end;
+		goto err_end;
 	}
 
 	dev_dbg(&pdev->dev, "registered as cooling_device%d\n", cdev->id);
@@ -365,10 +440,21 @@ static int acpi_fan_probe(struct platform_device *pdev)
 	result = sysfs_create_link(&cdev->device.kobj,
 				   &pdev->dev.kobj,
 				   "device");
-	if (result)
+	if (result) {
 		dev_err(&pdev->dev, "Failed to create sysfs link 'device'\n");
+		goto err_end;
+	}
+
+	return 0;
+
+err_end:
+	if (fan->acpi4) {
+		int i;
+
+		for (i = 0; i < fan->fps_count; ++i)
+			kobject_put(&fan->fps[i].kobj);
+	}
 
-end:
 	return result;
 }
 
@@ -376,6 +462,12 @@ static int acpi_fan_remove(struct platform_device *pdev)
 {
 	struct acpi_fan *fan = platform_get_drvdata(pdev);
 
+	if (fan->acpi4) {
+		int i;
+
+		for (i = 0; i < fan->fps_count; ++i)
+			kobject_put(&fan->fps[i].kobj);
+	}
 	sysfs_remove_link(&pdev->dev.kobj, "thermal_cooling");
 	sysfs_remove_link(&fan->cdev->device.kobj, "device");
 	thermal_cooling_device_unregister(fan->cdev);
-- 
2.17.2

