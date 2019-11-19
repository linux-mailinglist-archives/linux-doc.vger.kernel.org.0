Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50FBA102FEB
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2019 00:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfKSXT3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 18:19:29 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43395 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfKSXT3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 18:19:29 -0500
Received: by mail-wr1-f66.google.com with SMTP id n1so25903662wra.10
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 15:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bmTN1C+IahLw+ZT5vTARoHDF3oLVbgY/dBEOCXH3uIE=;
        b=TtJqFFfjaiK+yOHLpbXl4jBfChMe1b9MGx2lQoPzhAyrCf6EiCHZV91Cmuxb+eSpj9
         4AaHqdwIxTIzeJdY96cJ8pXPzX6ybQwvxs1SLKTdiUpRV0a0jWClBBzYrBDDHkvrsW0h
         f5l8yNvf/o6FSduNPmXwpzKR1bzFpbgGSsbZrWVLEPeMbm8pbSTiozXsbM8cLBZbgu+v
         MtTQ3/ADk2jRdYSZIAUPDS1C9d3VRNkLDmckcm9r1WjInZkfA92ICXLcqtNM5qpA9np+
         CQAA0ou+2iBAhlT39Mxs3iZ20VZ3SvFqrwuLMBr5Jy3SwR0WkIx+CTzjqdSd+ayAkiRs
         pdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bmTN1C+IahLw+ZT5vTARoHDF3oLVbgY/dBEOCXH3uIE=;
        b=RbRxSGMkdkbLNIT8BxsF6PimnlcSCUuNJEkgS3bKEEenTAnuBJ6twDqOlWUohqxG1G
         +Vz6da9+oGBi2XTpw72a2ZL18BHiNGAOC1TvWXWEib81EcflG1oVO4f+3vccbhhpkuoI
         ZRAH9xtW2YhRfzRW3d5sCO8l1gXZMiwfR6tH4AOqdk6UAYFbJbvr2EV40Ws7YQlmE6yN
         8YejPBfqR7oJqoltpcLmtNiTW/tCE1WEuTPQUyBvEln0uYY7BxHv3w5UyqvSL0e8HDhz
         DWtxl32sNcaf/vl17hy8UOfbo0VFOf83F7TgmCHPluaenDq8Hf3E+OkfdYME96hGn3my
         QtvA==
X-Gm-Message-State: APjAAAWyjwlHgbJ6D2DOCo3+TCgHiNXPXCdYRlyZ9Lbkh91jw/68YoFv
        pJhB8T0W7jziLD1zHnEw7DZeJQ==
X-Google-Smtp-Source: APXvYqx/OMoFZJBBwPwGgwoT5T1Ag3yKPulcbGaWAwBJT3X/zRV8/bR91QDkNDcp9d5jZnYiiiR12w==
X-Received: by 2002:adf:f20f:: with SMTP id p15mr34726322wro.370.1574205565648;
        Tue, 19 Nov 2019 15:19:25 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a19d:4139:292b:19a0])
        by smtp.gmail.com with ESMTPSA id m15sm15746717wrj.52.2019.11.19.15.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 15:19:25 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com
Subject: [PATCH v5 06/14] coresight: cti: Add device tree support for v8 arch CTI
Date:   Tue, 19 Nov 2019 23:19:04 +0000
Message-Id: <20191119231912.12768-7-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119231912.12768-1-mike.leach@linaro.org>
References: <20191119231912.12768-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The v8 architecture defines the relationship between a PE, its optional ETM
and a CTI. Unlike non-architectural CTIs which are implementation defined,
this has a fixed set of connections which can therefore be represented as a
simple tag in the device tree.

This patch defines the tags needed to create an entry for this PE/ETM/CTI
relationship, and provides functionality to implement the connection model
in the CTI driver.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-cti-platform.c        | 205 ++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index 665be86c585d..790dd30b85f5 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -3,10 +3,208 @@
  * Copyright (c) 2019, The Linaro Limited. All rights reserved.
  */
 
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include <linux/of.h>
 
 #include "coresight-cti.h"
 
+/* Number of CTI signals in the v8 architecturally defined connection */
+#define NR_V8PE_IN_SIGS		2
+#define NR_V8PE_OUT_SIGS	3
+#define NR_V8ETM_INOUT_SIGS	4
+
+/* CTI device tree connection property keywords */
+#define CTI_DT_V8ARCH		"arm,cti-v8-arch"
+#define CTI_DT_CSDEV_ASSOC	"arm,cs-dev-assoc"
+
+/*
+ * Find a registered coresight device from a device fwnode.
+ * The node info is associated with the AMBA parent, but the
+ * csdev keeps a copy so iterate round the coresight bus to
+ * find the device.
+ */
+static struct coresight_device *
+cti_get_assoc_csdev_by_fwnode(struct fwnode_handle *r_fwnode)
+{
+	struct device *dev;
+	struct coresight_device *csdev = NULL;
+
+	dev = bus_find_device_by_fwnode(&coresight_bustype, r_fwnode);
+	if (dev) {
+		csdev = to_coresight_device(dev);
+		put_device(dev);
+	}
+	return csdev;
+}
+
+#ifdef CONFIG_OF
+/*
+ * CTI can be bound to a CPU, or a system device.
+ * CPU can be declared at the device top level or in a connections node
+ * so need to check relative to node not device.
+ */
+static int of_cti_get_cpu_at_node(const struct device_node *node)
+{
+	int cpu;
+	struct device_node *dn;
+
+	if (node == NULL)
+		return -1;
+
+	dn = of_parse_phandle(node, "cpu", 0);
+	/* CTI affinity defaults to no cpu */
+	if (!dn)
+		return -1;
+	cpu = of_cpu_node_to_id(dn);
+	of_node_put(dn);
+
+	/* No Affinity  if no cpu nodes are found */
+	return (cpu < 0) ? -1 : cpu;
+}
+
+static const char *of_cti_get_node_name(const struct device_node *node)
+{
+	if (node)
+		return node->full_name;
+	return "unknown";
+}
+#else
+static int of_cti_get_cpu_at_node(const struct device_node *node)
+{
+	return -1;
+}
+
+static const char *of_cti_get_node_name(const struct device_node *node)
+{
+	return "unknown";
+}
+#endif
+
+static int cti_plat_get_cpu_at_node(struct fwnode_handle *fwnode)
+{
+	if (is_of_node(fwnode))
+		return of_cti_get_cpu_at_node(to_of_node(fwnode));
+	return -1;
+}
+
+static const char *cti_plat_get_node_name(struct fwnode_handle *fwnode)
+{
+	if (is_of_node(fwnode))
+		return of_cti_get_node_name(to_of_node(fwnode));
+	return "unknown";
+}
+
+static int cti_plat_create_v8_etm_connection(struct device *dev,
+					     struct cti_drvdata *drvdata)
+{
+	int ret = -ENOMEM, i;
+	struct fwnode_handle *root_fwnode, *cs_fwnode;
+	const char *assoc_name = NULL;
+	struct coresight_device *csdev;
+	struct cti_trig_con *tc = NULL;
+
+	root_fwnode = dev_fwnode(dev);
+	if (IS_ERR_OR_NULL(root_fwnode))
+		return -EINVAL;
+
+	/* Can optionally have an etm node - return if not  */
+	cs_fwnode = fwnode_find_reference(root_fwnode, CTI_DT_CSDEV_ASSOC, 0);
+	if (IS_ERR_OR_NULL(cs_fwnode))
+		return 0;
+
+	/* allocate memory */
+	tc = cti_allocate_trig_con(dev, NR_V8ETM_INOUT_SIGS,
+				   NR_V8ETM_INOUT_SIGS);
+	if (!tc)
+		goto create_v8_etm_out;
+
+	/* build connection data */
+	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
+	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
+
+	/*
+	 * The EXTOUT type signals from the ETM are connected to a set of input
+	 * triggers on the CTI, the EXTIN being connected to output triggers.
+	 */
+	for (i = 0; i < NR_V8ETM_INOUT_SIGS; i++) {
+		tc->con_in->sig_types[i] = ETM_EXTOUT;
+		tc->con_out->sig_types[i] = ETM_EXTIN;
+	}
+
+	/*
+	 * We look to see if the ETM coresight device associated with this
+	 * handle has been registered with the system - i.e. probed before
+	 * this CTI. If so csdev will be non NULL and we can use the device
+	 * name and pass the csdev to the connection entry function where
+	 * the association will be recorded.
+	 * If not, then simply record the name in the connection data, the
+	 * probing of the ETM will call into the CTI driver API to update the
+	 * association then.
+	 */
+	csdev = cti_get_assoc_csdev_by_fwnode(cs_fwnode);
+	if (csdev)
+		assoc_name = dev_name(&csdev->dev);
+	else
+		assoc_name = cti_plat_get_node_name(cs_fwnode);
+	ret = cti_add_connection_entry(dev, drvdata, tc, csdev, assoc_name);
+
+create_v8_etm_out:
+	fwnode_handle_put(cs_fwnode);
+	return ret;
+}
+
+/*
+ * Create an architecturally defined v8 connection
+ * must have a cpu, can have an ETM.
+ */
+static int cti_plat_create_v8_connections(struct device *dev,
+					  struct cti_drvdata *drvdata)
+{
+	struct cti_device *cti_dev = &drvdata->ctidev;
+	struct cti_trig_con *tc = NULL;
+	int cpuid = 0;
+	char cpu_name_str[16];
+	int ret = -ENOMEM;
+
+	/* Must have a cpu node */
+	cpuid = cti_plat_get_cpu_at_node(dev_fwnode(dev));
+	if (cpuid < 0) {
+		dev_warn(dev, "CTI v8 DT binding no cpu\n");
+		return -EINVAL;
+	}
+	cti_dev->cpu = cpuid;
+
+	/* Allocate the v8 cpu connection memory */
+	tc = cti_allocate_trig_con(dev, NR_V8PE_IN_SIGS, NR_V8PE_OUT_SIGS);
+	if (!tc)
+		goto of_create_v8_out;
+
+	/* Set the v8 PE CTI connection data */
+	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
+	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
+	tc->con_in->sig_types[1] = PE_PMUIRQ;
+	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
+	tc->con_out->sig_types[0] = PE_EDBGREQ;
+	tc->con_out->sig_types[1] = PE_DBGRESTART;
+	tc->con_out->sig_types[2] = PE_CTIIRQ;
+	scnprintf(cpu_name_str, sizeof(cpu_name_str), "cpu%d", cpuid);
+
+	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, cpu_name_str);
+	if (ret)
+		goto of_create_v8_out;
+
+	/* Create the v8 ETM associated connection */
+	ret = cti_plat_create_v8_etm_connection(dev, drvdata);
+	if (ret)
+		goto of_create_v8_out;
+
+	/* filter pe_edbgreq - PE trigout sig <0> */
+	drvdata->config.trig_out_filter |= 0x1;
+
+of_create_v8_out:
+	return ret;
+}
+
 /* get the hardware configuration & connection data. */
 int cti_plat_get_hw_data(struct device *dev,
 			 struct cti_drvdata *drvdata)
@@ -14,6 +212,13 @@ int cti_plat_get_hw_data(struct device *dev,
 	int rc = 0;
 	struct cti_device *cti_dev = &drvdata->ctidev;
 
+	/* check for a v8 architectural CTI device */
+	if (device_property_read_bool(dev, CTI_DT_V8ARCH)) {
+		rc = cti_plat_create_v8_connections(dev, drvdata);
+		if (rc)
+			return rc;
+	}
+
 	/* if no connections, just add a single default based on max IN-OUT */
 	if (cti_dev->nr_trig_con == 0)
 		rc = cti_add_default_connection(dev, drvdata);
-- 
2.17.1

