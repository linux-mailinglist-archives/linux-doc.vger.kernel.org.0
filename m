Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90BF4485F00
	for <lists+linux-doc@lfdr.de>; Thu,  6 Jan 2022 03:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345026AbiAFCtg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Jan 2022 21:49:36 -0500
Received: from mga04.intel.com ([192.55.52.120]:35152 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344988AbiAFCt2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Jan 2022 21:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641437368; x=1672973368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gZmRMIKxlf7LcHtSUmkipQ1RzL8FDpQ6atjg41K8JhI=;
  b=n+925q/AB0U63H4etacTENDPDh2D1IQJkPIJf1BxxxkVYNIyuBdROwsc
   Vc88BjDop2bm0XhTN07lx/kNujMsAJAntNy08xyYvJ+mBaJwlBLhkEGT6
   4sGmwsI83ozwbPdbyxUsOSN0c/FBTePFDun1HmBCF9ZbRSROJ4RcR7OSq
   Jc1h0o1lQXwtItawK2szykLeLnybQY10egbg3mF5LaDY6mAaqZnxa6wEz
   Rrp10a4PdQ3qJEAwhiLaOl6/+JMbRIq1qgvJERt6e10n49nwaFeCHEJjm
   LdTrSxo0hXbD0IB+wCko9xdRu500CWnxdpn95CM00V3l6pa77cjCdU9Gi
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241397541"
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="241397541"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 18:49:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,265,1635231600"; 
   d="scan'208";a="488796553"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orsmga002.jf.intel.com with ESMTP; 05 Jan 2022 18:49:23 -0800
From:   Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org
Cc:     x86@kernel.org, linux-doc@vger.kernel.org,
        Len Brown <len.brown@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Aubrey Li <aubrey.li@linux.intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Ricardo Neri <ricardo.neri@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] thermal: intel: hfi: Notify user space for HFI events
Date:   Wed,  5 Jan 2022 18:50:59 -0800
Message-Id: <20220106025059.25847-8-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220106025059.25847-1-ricardo.neri-calderon@linux.intel.com>
References: <20220106025059.25847-1-ricardo.neri-calderon@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

When the hardware issues an HFI event, relay a notification to user space.
This allows user space to respond by reading performance and efficiency of
each CPU and take appropriate action.

For example, when performance and efficiency of a CPU is 0, user space can
either offline the CPU or inject idle. Also, if user space notices a
downward trend in performance, it may proactively adjust power limits to
avoid future situations in which performance drops to 0.

To avoid excessive notifications, the rate is limited by one HZ per event.
To limit the netlink message size, parameters for only 16 CPUs at max are
sent in one message. If there are more than 16 CPUs, issue as many messages
as needed to notify the status of all CPUs.

In the HFI specification, both performance and efficiency capabilities are
set in the [0, 255] range. The existing implementations of HFI hardware
do not scale the maximum values to 255. Since userspace cares about
capability values that are either 0 or show a downward/upward trend, this
fact does not matter much. Relative changes in capabilities are enough. To
comply with the thermal netlink ABI, scale both performance and efficiency
capabilities to the [0, 1023] interval.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Aubrey Li <aubrey.li@linux.intel.com>
Cc: Lukasz Luba <lukasz.luba@arm.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Reviewed-by: Len Brown <len.brown@intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
Changes since v2:
  * None

Changes since v1:
  * Made get_one_hfi_cap() return void. Removed unnecessary checks.
    (Rafael)
  * Replaced raw_spin_[un]lock_irq[restore|save]() with raw_spin_
    [un]lock_irq() in get_one_hfi_cap(). This function is only called from
    a workqueue and there is no need to save and restore irq flags.
  * Scaled performance and energy efficiency values to a [0, 1023] interval
    when reporting values to user space via thermal netlink notifications.
    (Lucasz).
  * Reworded commit message to comment on the scaling of HFI capabilities
    to comply with the proposed thermal netlink ABI.
---
 drivers/thermal/intel/Kconfig     |  1 +
 drivers/thermal/intel/intel_hfi.c | 57 ++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/intel/Kconfig b/drivers/thermal/intel/Kconfig
index e9d2925227d4..6cf3fe36a4ae 100644
--- a/drivers/thermal/intel/Kconfig
+++ b/drivers/thermal/intel/Kconfig
@@ -104,6 +104,7 @@ config INTEL_HFI_THERMAL
 	bool "Intel Hardware Feedback Interface"
 	depends on CPU_SUP_INTEL
 	depends on X86_THERMAL_VECTOR
+	select THERMAL_NETLINK
 	help
 	  Select this option to enable the Hardware Feedback Interface. If
 	  selected, hardware provides guidance to the operating system on
diff --git a/drivers/thermal/intel/intel_hfi.c b/drivers/thermal/intel/intel_hfi.c
index c76611bd9715..87dbcf3642d6 100644
--- a/drivers/thermal/intel/intel_hfi.c
+++ b/drivers/thermal/intel/intel_hfi.c
@@ -40,6 +40,7 @@
 
 #include <asm/msr.h>
 
+#include "../thermal_core.h"
 #include "intel_hfi.h"
 
 #define THERM_STATUS_CLEAR_PKG_MASK (BIT(1) | BIT(3) | BIT(5) | BIT(7) | \
@@ -162,6 +163,60 @@ static struct hfi_features hfi_features;
 static DEFINE_MUTEX(hfi_instance_lock);
 
 #define HFI_UPDATE_INTERVAL	HZ
+#define HFI_MAX_THERM_NOTIFY_COUNT	16
+
+static void get_one_hfi_cap(struct hfi_instance *hfi_instance, s16 index,
+			    struct hfi_cpu_data *hfi_caps)
+{
+	struct hfi_cpu_data *caps;
+
+	/* Find the capabilities of @cpu */
+	raw_spin_lock_irq(&hfi_instance->table_lock);
+	caps = hfi_instance->data + index * hfi_features.cpu_stride;
+	memcpy(hfi_caps, caps, sizeof(*hfi_caps));
+	raw_spin_unlock_irq(&hfi_instance->table_lock);
+}
+
+/*
+ * Call update_capabilities() when there are changes in the HFI table.
+ */
+static void update_capabilities(struct hfi_instance *hfi_instance)
+{
+	struct cpu_capability cpu_caps[HFI_MAX_THERM_NOTIFY_COUNT];
+	int i = 0, cpu;
+
+	for_each_cpu(cpu, hfi_instance->cpus) {
+		struct hfi_cpu_data caps;
+		s16 index;
+
+		/*
+		 * We know index is valid because this CPU is present
+		 * in this instance.
+		 */
+		index = per_cpu(hfi_cpu_info, cpu).index;
+
+		get_one_hfi_cap(hfi_instance, index, &caps);
+
+		cpu_caps[i].cpu = cpu;
+
+		/*
+		 * Scale performance and energy efficiency to
+		 * the [0, 1023] interval that thermal netlink uses.
+		 */
+		cpu_caps[i].performance = caps.perf_cap << 2;
+		cpu_caps[i].efficiency = caps.ee_cap << 2;
+		++i;
+
+		if (i >= HFI_MAX_THERM_NOTIFY_COUNT) {
+			thermal_genl_cpu_capability_event(HFI_MAX_THERM_NOTIFY_COUNT,
+							  cpu_caps);
+			i = 0;
+		}
+	}
+
+	if (i)
+		thermal_genl_cpu_capability_event(i, cpu_caps);
+}
 
 static void hfi_update_work_fn(struct work_struct *work)
 {
@@ -172,7 +227,7 @@ static void hfi_update_work_fn(struct work_struct *work)
 	if (!hfi_instance)
 		return;
 
-	/* TODO: Consume update here. */
+	update_capabilities(hfi_instance);
 }
 
 void intel_hfi_process_event(__u64 pkg_therm_status_msr_val)
-- 
2.17.1

