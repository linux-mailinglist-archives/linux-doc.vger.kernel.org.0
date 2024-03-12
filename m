Return-Path: <linux-doc+bounces-12032-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E9879DA6
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 22:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FB071F21A79
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 21:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD7C1448D5;
	Tue, 12 Mar 2024 21:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqj1fk+m"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F536144039;
	Tue, 12 Mar 2024 21:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710279782; cv=none; b=FLmuUbZeSx3nwnfq04JydC7pk1/7aqMfpCbRsrfuqqjSAVMeOQubEB6GKtvOCPTAK45Gyshvsd5EYPdI4n1hVmyuqDJYC4CKMwZ7Db386/2ZkXk//Hr/xVnrkhnWp6TR3K2uI2QfAUelo0qXIXOTayRZ0iU1XINmIFYmZ1EnV2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710279782; c=relaxed/simple;
	bh=Cb2+kj+10Z7ZbqPfE8SGV00mNdpsvMnsrGPxqL5A+vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8r4TmYCOg9m9FktLbuVPJdOMK1xlD1KpLqYSX8FddTdFX7c4i4EB63zON5+2eA2s+cyP9QGJC1FrOp4nLQqR8e8Cl/OQM0HqvmL5cZDOVFSaM11Z/GU5Hfs/DtBQe5xqFDEa5Irqy1IcvdIFv0IswngJXyLqKm94fKHCpvdd7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqj1fk+m; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710279781; x=1741815781;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cb2+kj+10Z7ZbqPfE8SGV00mNdpsvMnsrGPxqL5A+vA=;
  b=gqj1fk+mn/63gwU3k6VcFdRpWLGlemB2oRe8QeaYeuPD34/NRnBZf3/g
   DjFL1y8lGFi+grlWDk7ynCCD/0W7ThwCWfK6SKik3XN8ssbuUiSZzvbjU
   RRPkDLZ5QpNCdBsq7XH/OR5XUKxKt2EMV7usvI7ZU5mVlyqH/IF/DGqpH
   U9uRXFOuwVWsZFtBSn1XaqCLoaG8okyNMRVszxxobZrewnqe36bSO36z5
   dj0lrBFHzbouvA6Gc1kuDDZT5MPW9C1xM02qHlIVoYmNNt9chm3i4DfmO
   am/S4LTYyFO0CETS0qrWnSTS6yMVvyxGXhdBnhriSAS6f6bl76BSb1xvx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4884853"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4884853"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 14:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="12280159"
Received: from agluck-desk3.sc.intel.com ([172.25.222.105])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 14:42:56 -0700
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Peter Newman <peternewman@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	x86@kernel.org
Cc: Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Babu Moger <babu.moger@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Drew Fustini <dfustini@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v16 7/9] x86/resctrl: Sub NUMA Cluster detection and enable
Date: Tue, 12 Mar 2024 14:42:45 -0700
Message-ID: <20240312214247.91772-8-tony.luck@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312214247.91772-1-tony.luck@intel.com>
References: <20240312214247.91772-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There isn't a simple hardware bit that indicates whether a CPU is
running in Sub NUMA Cluster (SNC) mode. Infer the state by comparing
the ratio of NUMA nodes to L3 cache instances.

When SNC mode is detected, reconfigure the RMID counters by updating
the MSR_RMID_SNC_CONFIG MSR on each socket as CPUs are seen.

Clearing bit zero of the MSR divides the RMIDs and renumbers the ones
on the second SNC node to start from zero.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/include/asm/msr-index.h   |   1 +
 arch/x86/kernel/cpu/resctrl/core.c | 119 +++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 05956bd8bacf..b54c26016c93 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1158,6 +1158,7 @@
 #define MSR_IA32_QM_CTR			0xc8e
 #define MSR_IA32_PQR_ASSOC		0xc8f
 #define MSR_IA32_L3_CBM_BASE		0xc90
+#define MSR_RMID_SNC_CONFIG		0xca0
 #define MSR_IA32_L2_CBM_BASE		0xd10
 #define MSR_IA32_MBA_THRTL_BASE		0xd50
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index cb181796f73b..65cec8c45047 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -21,7 +21,9 @@
 #include <linux/err.h>
 #include <linux/cacheinfo.h>
 #include <linux/cpuhotplug.h>
+#include <linux/mod_devicetable.h>
 
+#include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/resctrl.h>
 #include "internal.h"
@@ -744,11 +746,42 @@ static void clear_closid_rmid(int cpu)
 	      RESCTRL_RESERVED_CLOSID);
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
+ * must adjust RMID counter numbers based on SNC node. See
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
 static int resctrl_arch_online_cpu(unsigned int cpu)
 {
 	struct rdt_resource *r;
 
 	mutex_lock(&domain_list_lock);
+
+	if (snc_nodes_per_l3_cache > 1)
+		snc_remap_rmids(cpu);
+
 	for_each_capable_rdt_resource(r)
 		domain_add_cpu(cpu, r);
 	mutex_unlock(&domain_list_lock);
@@ -988,11 +1021,97 @@ static __init bool get_rdt_resources(void)
 	return (rdt_mon_capable || rdt_alloc_capable);
 }
 
+/* CPU models that support MSR_RMID_SNC_CONFIG */
+static const struct x86_cpu_id snc_cpu_ids[] __initconst = {
+	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_X, 0),
+	X86_MATCH_INTEL_FAM6_MODEL(SAPPHIRERAPIDS_X, 0),
+	X86_MATCH_INTEL_FAM6_MODEL(EMERALDRAPIDS_X, 0),
+	X86_MATCH_INTEL_FAM6_MODEL(GRANITERAPIDS_X, 0),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_CRESTMONT_X, 0),
+	{}
+};
+
+/*
+ * There isn't a simple hardware bit that indicates whether a CPU is running
+ * in Sub NUMA Cluster (SNC) mode. Infer the state by comparing the
+ * ratio of NUMA nodes to L3 cache instances.
+ * It is not possible to accurately determine SNC state if the system is
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
+	int cache_id;
+
+	if (!x86_match_cpu(snc_cpu_ids))
+		return 1;
+
+	node_caches = bitmap_zalloc(num_possible_cpus(), GFP_KERNEL);
+	if (!node_caches)
+		return 1;
+
+	cpus_read_lock();
+
+	if (num_online_cpus() != num_present_cpus())
+		pr_warn("Some CPUs offline, SNC detection may be incorrect\n");
+
+	for_each_node(node) {
+		cpu = cpumask_first(cpumask_of_node(node));
+		if (cpu < nr_cpu_ids) {
+			cache_id = get_cpu_cacheinfo_id(cpu, 3);
+			if (cache_id != -1)
+				set_bit(cache_id, node_caches);
+		} else {
+			mem_only_nodes++;
+		}
+	}
+	cpus_read_unlock();
+
+	num_l3_caches = bitmap_weight(node_caches, num_possible_cpus());
+	kfree(node_caches);
+
+	if (!num_l3_caches)
+		goto insane;
+
+	/* sanity check #1: Number of CPU nodes must be multiple of num_l3_caches */
+	if ((nr_node_ids - mem_only_nodes) % num_l3_caches)
+		goto insane;
+
+	ret = (nr_node_ids - mem_only_nodes) / num_l3_caches;
+
+	/* sanity check #2: Only valid results are 1, 2, 3, 4 */
+	switch (ret) {
+	case 1:
+		break;
+	case 2:
+	case 3:
+	case 4:
+		pr_info("Sub-NUMA cluster detected with %d nodes per L3 cache\n", ret);
+		rdt_resources_all[RDT_RESOURCE_L3].r_resctrl.mon_scope = RESCTRL_NODE;
+		break;
+	default:
+		goto insane;
+	}
+
+	return ret;
+insane:
+	pr_warn("SNC insanity: CPU nodes = %d num_l3_caches = %d\n",
+		(nr_node_ids - mem_only_nodes), num_l3_caches);
+	return 1;
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
2.44.0


