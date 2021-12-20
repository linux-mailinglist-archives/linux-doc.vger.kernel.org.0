Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D089547AFFF
	for <lists+linux-doc@lfdr.de>; Mon, 20 Dec 2021 16:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239975AbhLTPXd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Dec 2021 10:23:33 -0500
Received: from mga11.intel.com ([192.55.52.93]:58460 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238564AbhLTPWh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Dec 2021 10:22:37 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="237732823"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="237732823"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 07:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="484086900"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orsmga002.jf.intel.com with ESMTP; 20 Dec 2021 07:16:05 -0800
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
        linux-kernel@vger.kernel.org,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: [PATCH v2 3/7] thermal: intel: hfi: Minimally initialize the Hardware Feedback Interface
Date:   Mon, 20 Dec 2021 07:14:34 -0800
Message-Id: <20211220151438.1196-4-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211220151438.1196-1-ricardo.neri-calderon@linux.intel.com>
References: <20211220151438.1196-1-ricardo.neri-calderon@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Intel Hardware Feedback Interface provides guidance to the operating
system about the performance and energy efficiency capabilities of each
CPU in the system. Capabilities are numbers between 0 and 255 where a
higher number represents a higher capability. For each CPU, energy
efficiency and performance are reported as separate capabilities.

Hardware computes these capabilities based on the operating conditions of
the system such as power and thermal limits. These capabilities are shared
with the operating system in a table resident in memory. Each package in
the system has its own HFI instance. Every logical CPU in the package is
represented in the table. More than one logical CPUs may be represented in
a single table entry. When the hardware updates the table, it generates a
package-level thermal interrupt.

The size and format of the HFI table depend on the supported features and
can only be determined at runtime. To minimally initialize the HFI, parse
its features and allocate one instance per package of a data structure with
the necessary parameters to read and navigate a local copy (i.e., owned by
the driver) of individual HFI tables.

A subsequent changeset will provide per-CPU initialization and interrupt
handling.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Aubrey Li <aubrey.li@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Reviewed-by: Len Brown <len.brown@intel.com>
Co-developed by: Aubrey Li <aubrey.li@linux.intel.com>
Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v1:
  * Renamed X86_FEATURE_INTEL_HFI as X86_FEATURE_HFI. (Boris)
  * Reworked parsing of HFI features using bitfields instead of bitmasks.
    (PeterZ).
  * Removed hfi_instance::parsed as hfi_parse_features() is called only
    once via intel_hfi_init() via thermal_throttle_init_device().
    (Rafael)
  * Converted pr_err() to pr_debug(). (Srinivas, Rafael)
  * Removed unnecessary dependency on CONFIG_SCHED_MC.
  * Renamed hfi_instance::ts_counter as hfi_instance::timestamp.
  * Renamed hfi_instance::table_base as hfi_instance::local_table and
    relocated its definition to this patch.
  * Wrapped hfi_instance::timestamp and hfi_instance:local_table in an
    anonymous union, since both point at the same location.
---
 drivers/thermal/intel/Kconfig       |  12 ++
 drivers/thermal/intel/Makefile      |   1 +
 drivers/thermal/intel/intel_hfi.c   | 175 ++++++++++++++++++++++++++++
 drivers/thermal/intel/intel_hfi.h   |  11 ++
 drivers/thermal/intel/therm_throt.c |   3 +
 5 files changed, 202 insertions(+)
 create mode 100644 drivers/thermal/intel/intel_hfi.c
 create mode 100644 drivers/thermal/intel/intel_hfi.h

diff --git a/drivers/thermal/intel/Kconfig b/drivers/thermal/intel/Kconfig
index c83ea5d04a1d..1a21ff60fdc7 100644
--- a/drivers/thermal/intel/Kconfig
+++ b/drivers/thermal/intel/Kconfig
@@ -99,3 +99,15 @@ config INTEL_MENLOW
 	  Intel Menlow platform.
 
 	  If unsure, say N.
+
+config INTEL_HFI
+	bool "Intel Hardware Feedback Interface"
+	depends on CPU_SUP_INTEL
+	depends on X86_THERMAL_VECTOR
+	help
+	  Select this option to enable the Hardware Feedback Interface. If
+	  selected, hardware provides guidance to the operating system on
+	  the performance and energy efficiency capabilities of each CPU.
+	  These capabilities may change as a result of changes in the operating
+	  conditions of the system such power and thermal limits. If selected,
+	  the kernel relays updates in CPUs' capabilities to userspace.
diff --git a/drivers/thermal/intel/Makefile b/drivers/thermal/intel/Makefile
index 960b56268b4a..1a80bffcd699 100644
--- a/drivers/thermal/intel/Makefile
+++ b/drivers/thermal/intel/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_INTEL_PCH_THERMAL)	+= intel_pch_thermal.o
 obj-$(CONFIG_INTEL_TCC_COOLING)	+= intel_tcc_cooling.o
 obj-$(CONFIG_X86_THERMAL_VECTOR) += therm_throt.o
 obj-$(CONFIG_INTEL_MENLOW)	+= intel_menlow.o
+obj-$(CONFIG_INTEL_HFI) += intel_hfi.o
diff --git a/drivers/thermal/intel/intel_hfi.c b/drivers/thermal/intel/intel_hfi.c
new file mode 100644
index 000000000000..375d835cc5e3
--- /dev/null
+++ b/drivers/thermal/intel/intel_hfi.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Hardware Feedback Interface Driver
+ *
+ * Copyright (c) 2021, Intel Corporation.
+ *
+ * Authors: Aubrey Li <aubrey.li@linux.intel.com>
+ *          Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
+ *
+ *
+ * The Hardware Feedback Interface provides a performance and energy efficiency
+ * capability information for each CPU in the system. Depending on the processor
+ * model, hardware may periodically update these capabilities as a result of
+ * changes in the operating conditions (e.g., power limits or thermal
+ * constraints). On other processor models, there is a single HFI update
+ * at boot.
+ *
+ * This file provides functionality to process HFI updates and relay these
+ * updates to userspace.
+ */
+
+#define pr_fmt(fmt)  "intel-hfi: " fmt
+
+#include <linux/slab.h>
+
+#include "intel_hfi.h"
+
+/* CPUID detection and enumeration definitions for HFI */
+
+#define CPUID_HFI_LEAF 6
+
+union hfi_capabilities {
+	struct {
+		u8	performance:1;
+		u8	energy_efficiency:1;
+		u8	__reserved:6;
+	} split;
+	u8 bits;
+};
+
+union cpuid6_edx {
+	struct {
+		union hfi_capabilities	capabilities;
+		u32			table_pages:4;
+		u32			__reserved:4;
+		s32			index:16;
+	} split;
+	u32 full;
+};
+
+/**
+ * struct hfi_cpu_data - HFI capabilities per CPU
+ * @perf_cap:		Performance capability
+ * @ee_cap:		Energy efficiency capability
+ *
+ * Capabilities of a logical processor in the HFI table. These capabilities are
+ * unitless.
+ */
+struct hfi_cpu_data {
+	u8	perf_cap;
+	u8	ee_cap;
+} __packed;
+
+/**
+ * struct hfi_hdr - Header of the HFI table
+ * @perf_updated:	Hardware updated performance capabilities
+ * @ee_updated:		Hardware updated energy efficiency capabilities
+ *
+ * Properties of the data in an HFI table.
+ */
+struct hfi_hdr {
+	u8	perf_updated;
+	u8	ee_updated;
+} __packed;
+
+/**
+ * struct hfi_instance - Representation of an HFI instance (i.e., a table)
+ * @local_table:	Base of the local copy of the HFI table
+ * @timestamp:		Timestamp of the last update of the local table.
+ *			Located at the base of the local table.
+ * @hdr:		Base address of the local table header
+ * @data:		Base address of the local table data
+ *
+ * A set of parameters to parse and navigate a specific HFI table.
+ */
+struct hfi_instance {
+	union {
+		void			*local_table;
+		u64			*timestamp;
+	};
+	void			*hdr;
+	void			*data;
+};
+
+/**
+ * struct hfi_features - Supported HFI features
+ * @nr_table_pages:	Size of the HFI table in 4KB pages
+ * @cpu_stride:		Stride size to locate capability data of a logical
+ *			processor within the table (i.e., row stride)
+ * @hdr_size:		Size of table header
+ *
+ * Parameters and supported features that are common to all HFI instances
+ */
+struct hfi_features {
+	unsigned int	nr_table_pages;
+	unsigned int	cpu_stride;
+	unsigned int	hdr_size;
+};
+
+static int max_hfi_instances;
+static struct hfi_instance *hfi_instances;
+
+static struct hfi_features hfi_features;
+
+static __init int hfi_parse_features(void)
+{
+	unsigned int nr_capabilities;
+	union cpuid6_edx edx;
+
+	if (!boot_cpu_has(X86_FEATURE_HFI))
+		return -ENODEV;
+
+	/*
+	 * If we are here we know that CPUID_HFI_LEAF exists. Parse the
+	 * supported capabilities and the size of the HFI table.
+	 */
+	edx.full = cpuid_edx(CPUID_HFI_LEAF);
+
+	if (!edx.split.capabilities.split.performance) {
+		pr_debug("Performance reporting not supported! Not using HFI\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * The number of supported capabilities determines the number of
+	 * columns in the HFI table. Exclude reserved bits.
+	 */
+	edx.split.capabilities.split.__reserved = 0;
+	nr_capabilities = hweight8(edx.split.capabilities.bits);
+
+	/* The number of 4KB pages required by the table */
+	hfi_features.nr_table_pages = edx.split.table_pages + 1;
+
+	/*
+	 * The header contains change indications for each supported feature.
+	 * The size of the table header is rounded up to be a multiple of 8
+	 * bytes.
+	 */
+	hfi_features.hdr_size = DIV_ROUND_UP(nr_capabilities, 8) * 8;
+
+	/*
+	 * Data of each logical processor is also rounded up to be a multiple
+	 * of 8 bytes.
+	 */
+	hfi_features.cpu_stride = DIV_ROUND_UP(nr_capabilities, 8) * 8;
+
+	return 0;
+}
+
+void __init intel_hfi_init(void)
+{
+	if (hfi_parse_features())
+		return;
+
+	/* There is one HFI instance per die/package. */
+	max_hfi_instances = topology_max_packages() *
+			    topology_max_die_per_package();
+
+	/*
+	 * This allocation may fail. CPU hotplug callbacks must check
+	 * for a null pointer.
+	 */
+	hfi_instances = kcalloc(max_hfi_instances, sizeof(*hfi_instances),
+				GFP_KERNEL);
+}
diff --git a/drivers/thermal/intel/intel_hfi.h b/drivers/thermal/intel/intel_hfi.h
new file mode 100644
index 000000000000..8fa3f7c0a64b
--- /dev/null
+++ b/drivers/thermal/intel/intel_hfi.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _INTEL_HFI_H
+#define _INTEL_HFI_H
+
+#if defined(CONFIG_INTEL_HFI)
+void __init intel_hfi_init(void);
+#else
+static inline void intel_hfi_init(void) { }
+#endif
+
+#endif /* _INTEL_HFI_H */
diff --git a/drivers/thermal/intel/therm_throt.c b/drivers/thermal/intel/therm_throt.c
index dab7e8fb1059..ac408714d52b 100644
--- a/drivers/thermal/intel/therm_throt.c
+++ b/drivers/thermal/intel/therm_throt.c
@@ -32,6 +32,7 @@
 #include <asm/irq.h>
 #include <asm/msr.h>
 
+#include "intel_hfi.h"
 #include "thermal_interrupt.h"
 
 /* How long to wait between reporting thermal events */
@@ -509,6 +510,8 @@ static __init int thermal_throttle_init_device(void)
 	if (!atomic_read(&therm_throt_en))
 		return 0;
 
+	intel_hfi_init();
+
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "x86/therm:online",
 				thermal_throttle_online,
 				thermal_throttle_offline);
-- 
2.17.1

