Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E9A7B6E11
	for <lists+linux-doc@lfdr.de>; Tue,  3 Oct 2023 18:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbjJCQId (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Oct 2023 12:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240302AbjJCQI3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Oct 2023 12:08:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1626AD;
        Tue,  3 Oct 2023 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696349298; x=1727885298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L/07qK3RivaXgr8+/bckLeXt73AIA+F9oksv2sUBzm8=;
  b=XeqgBi5FFLFHYHJ8TkPlDzDuhoWf+U1dIdJ3CF1piA5lm2EPcYLishW/
   pYBRNi9Tfucmn0o1TTO6m0oWH7jRHgv3V0K8ZGV/FzzpxhojsZ8Blg3OR
   0mNXTZS9tvldykQW865StLBMCQX1O4MPV9C/3iYWe03+cZOQ/++9tYkPx
   zXMC/PeF/X6LyORVxdR31HxGisEziFp+GY35qdF4VT01T+VUuzs91oJn6
   +t/fvIeK+u/QDF8RcbrIojqJU0h9hLUa36P4TcVnPcupa1AlOWwAY+aQS
   gLZfA6uyZXu777VwdT5BM0PKhACYgn2t700YFCdioWxvr7Ly7khkLbPva
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="447083318"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="447083318"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 09:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="998098114"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="998098114"
Received: from agluck-desk3.sc.intel.com ([172.25.222.74])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 09:08:11 -0700
From:   Tony Luck <tony.luck@intel.com>
To:     Fenghua Yu <fenghua.yu@intel.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Peter Newman <peternewman@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org
Cc:     Shaopeng Tan <tan.shaopeng@fujitsu.com>,
        James Morse <james.morse@arm.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Babu Moger <babu.moger@amd.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        patches@lists.linux.dev, Tony Luck <tony.luck@intel.com>
Subject: [PATCH v7 7/8] x86/resctrl: Sub NUMA Cluster detection and enable
Date:   Tue,  3 Oct 2023 09:07:58 -0700
Message-ID: <20231003160800.8601-8-tony.luck@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003160800.8601-1-tony.luck@intel.com>
References: <20230928191350.205703-1-tony.luck@intel.com>
 <20231003160800.8601-1-tony.luck@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There isn't a simple h/w bit that indicates whether a CPU is
running in Sub NUMA Cluster (SNC) mode. Infer the state by comparing
the ratio of NUMA nodes to L3 cache instances.

When SNC mode is detected, reconfigure the RMID counters by updating
the MSR_RMID_SNC_CONFIG MSR on each socket as CPUs are seen.

Clearing bit zero of the MSR divides the RMIDs and renumbers the ones
on the second SNC node to start from zero. An earlier commit includes
all the required changes in Linux to operate in this reconfigured mode.

Signed-off-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Peter Newman <peternewman@google.com>

---

Changes since last version:

Moved kfree(node_caches); earlier, to the earliest point where it
is no longer needed.

Added Granite Rapids to list of CPU models that support SNC mode.

 arch/x86/include/asm/msr-index.h   |  1 +
 arch/x86/kernel/cpu/resctrl/core.c | 92 ++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 1d111350197f..393d1b047617 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1100,6 +1100,7 @@
 #define MSR_IA32_QM_CTR			0xc8e
 #define MSR_IA32_PQR_ASSOC		0xc8f
 #define MSR_IA32_L3_CBM_BASE		0xc90
+#define MSR_RMID_SNC_CONFIG		0xca0
 #define MSR_IA32_L2_CBM_BASE		0xd10
 #define MSR_IA32_MBA_THRTL_BASE		0xd50
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index cd189b7ca6ea..dff294529f27 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -16,11 +16,14 @@
 
 #define pr_fmt(fmt)	"resctrl: " fmt
 
+#include <linux/cpu.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/cacheinfo.h>
 #include <linux/cpuhotplug.h>
+#include <linux/mod_devicetable.h>
 
+#include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/resctrl.h>
 #include "internal.h"
@@ -751,11 +754,42 @@ static void clear_closid_rmid(int cpu)
 	wrmsr(MSR_IA32_PQR_ASSOC, 0, 0);
 }
 
+/*
+ * The power-on reset value of MSR_RMID_SNC_CONFIG is 0x1
+ * which indicates that RMIDs are configured in legacy mode.
+ * This mode is incompatible with Linux resctrl semantics
+ * as RMIDs are partitioned between SNC nodes, which requires
+ * a user to know which RMID is allocated to a task.
+ * Clearing bit 0 reconfigures the RMID counters for use
+ * in Sub NUMA Cluster mode. This mode is better for Linux.
+ * The RMID space is divided between all SNC nodes with the
+ * RMIDs renumbered to start from zero in each node when
+ * couning operations from tasks. Code to read the counters
+ * must adjust RMID counnter numbers based on SNC node. See
+ * __rmid_read() for code that does this.
+ */
+static void snc_remap_rmids(int cpu)
+{
+	u64 val;
+
+	/* Only need to enable once per package. */
+	if (cpumask_first(topology_core_cpumask(cpu)) != cpu)
+		return;
+
+	rdmsrl(MSR_RMID_SNC_CONFIG, val);
+	val &= ~BIT_ULL(0);
+	wrmsrl(MSR_RMID_SNC_CONFIG, val);
+}
+
 static int resctrl_online_cpu(unsigned int cpu)
 {
 	struct rdt_resource *r;
 
 	mutex_lock(&rdtgroup_mutex);
+
+	if (snc_nodes_per_l3_cache > 1)
+		snc_remap_rmids(cpu);
+
 	for_each_capable_rdt_resource(r)
 		domain_add_cpu(cpu, r);
 	/* The cpu is set in default rdtgroup after online. */
@@ -1010,11 +1044,69 @@ static __init bool get_rdt_resources(void)
 	return (rdt_mon_capable || rdt_alloc_capable);
 }
 
+/* CPU models that support MSR_RMID_SNC_CONFIG */
+static const struct x86_cpu_id snc_cpu_ids[] __initconst = {
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_X, 0),
+	X86_MATCH_INTEL_FAM6_MODEL(SAPPHIRERAPIDS_X, 0),
+	X86_MATCH_INTEL_FAM6_MODEL(EMERALDRAPIDS_X, 0),
+	X86_MATCH_INTEL_FAM6_MODEL(GRANITERAPIDS_X, 0),
+	{}
+};
+
+/*
+ * There isn't a simple h/w bit that indicates whether a CPU is running
+ * in Sub NUMA Cluster (SNC) mode. Infer the state by comparing the
+ * ratio of NUMA nodes to L3 cache instances.
+ * It is not possible to accurately detemine SNC state if the system is
+ * booted with a maxcpus=N parameter. That distorts the ratio of SNC nodes
+ * to L3 caches. It will be OK if system is booted with hyperthreading
+ * disabled (since this doesn't affect the ratio).
+ */
+static __init int snc_get_config(void)
+{
+	unsigned long *node_caches;
+	int mem_only_nodes = 0;
+	int cpu, node, ret;
+	int num_l3_caches;
+
+	if (!x86_match_cpu(snc_cpu_ids))
+		return 1;
+
+	node_caches = bitmap_zalloc(nr_node_ids, GFP_KERNEL);
+	if (!node_caches)
+		return 1;
+
+	cpus_read_lock();
+	for_each_node(node) {
+		cpu = cpumask_first(cpumask_of_node(node));
+		if (cpu < nr_cpu_ids)
+			set_bit(get_cpu_cacheinfo_id(cpu, 3), node_caches);
+		else
+			mem_only_nodes++;
+	}
+	cpus_read_unlock();
+
+	num_l3_caches = bitmap_weight(node_caches, nr_node_ids);
+	kfree(node_caches);
+
+	if (!num_l3_caches)
+		return 1;
+
+	ret = (nr_node_ids - mem_only_nodes) / num_l3_caches;
+
+	if (ret > 1)
+		rdt_resources_all[RDT_RESOURCE_L3].r_resctrl.mon_scope = RESCTRL_NODE;
+
+	return ret;
+}
+
 static __init void rdt_init_res_defs_intel(void)
 {
 	struct rdt_hw_resource *hw_res;
 	struct rdt_resource *r;
 
+	snc_nodes_per_l3_cache = snc_get_config();
+
 	for_each_rdt_resource(r) {
 		hw_res = resctrl_to_arch_res(r);
 
-- 
2.41.0

