Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11A227B25BC
	for <lists+linux-doc@lfdr.de>; Thu, 28 Sep 2023 21:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbjI1TON (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 28 Sep 2023 15:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231954AbjI1TOH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Sep 2023 15:14:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3551A2;
        Thu, 28 Sep 2023 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695928445; x=1727464445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CjDzME9E1sh2o1kULbVTBnwuHu5JOjSatiCrJ26MprE=;
  b=cWsdEcPQAIpIuhqVoaSjAEkIakuoiLzBoxYqN5DCFZvOqHjqJkzy97Xa
   RpLVynXb8g46cngoQxd1B5EZZvfou2jb9r+hga8OD2B1gOxv8fS4GHW+t
   h/f8oladaqGqXhFB5vBppX163QqTLLH0AZG21vYeDX2gNmyaXkhNDk2fv
   vKH9JPt1Hyge6/9wWVkel4wLshoUIvjZKuxCxLZ8f8g3PR7CZbKDPFokY
   kPkjThW30AxRxdWAsLG4o9IAHgCf8Rs4+fX0cVLJMfVk9NQr8OkncyWXl
   CH0vWYlosm6Jr/vva44tcdh4QhNhwS/XdfolaesAlkHZfRNZzOXZ9uh5c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="367213943"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="367213943"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 12:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="779020039"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="779020039"
Received: from agluck-desk3.sc.intel.com ([172.25.222.74])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 12:14:00 -0700
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
Subject: [PATCH v6 6/8] x86/resctrl: Introduce snc_nodes_per_l3_cache
Date:   Thu, 28 Sep 2023 12:13:47 -0700
Message-ID: <20230928191350.205703-7-tony.luck@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928191350.205703-1-tony.luck@intel.com>
References: <20230829234426.64421-1-tony.luck@intel.com>
 <20230928191350.205703-1-tony.luck@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Intel Sub-NUMA Cluster (SNC) is a feature that subdivides the CPU cores
and memory controllers on a socket into two or more groups. These are
presented to the operating system as NUMA nodes.

This may enable some workloads to have slightly lower latency to memory
as the memory controller(s) in an SNC node are electrically closer to the
CPU cores on that SNC node. This cost may be offset by lower bandwidth
since the memory accesses for each core can only be interleaved between
the memory controllers on the same SNC node.

Resctrl monitoring on Intel system depends upon attaching RMIDs to tasks
to track L3 cache occupancy and memory bandwidth. There is an MSR that
controls how the RMIDs are shared between SNC nodes.

The default mode divides them numerically. E.g. when there are two SNC
nodes on a socket the lower number half of the RMIDs are given to the
first node, the remainder to the second node. This would be difficult
to use with the Linux resctrl interface as specific RMID values assigned
to resctrl groups are not visible to users.

The other mode divides the RMIDs and renumbers the ones on the second
SNC node to start from zero.

Even with this redumbering SNC mode requires several changes in resctrl
behavior for correct operation.

Add a global integer "snc_nodes_per_l3_cache" that will show how many
SNC nodes share each L3 cache. When this is "1", SNC mode is either
not implemented, or not enabled.

A later patch will detect SNC mode and set snc_nodes_per_l3_cache to
the appropriate value. For now it remains at the default "1" to
indicate SNC mode is not active.

Code that needs to take action when SNC is enabled is:
1) The number of logical RMIDs per L3 cache available for use is the
   number of physical RMIDs divided by the number of SNC nodes.
2) Likewise the "mon_scale" value must be adjusted for the number
   of SNC nodes.
3) The RMID renumbering operates when using the value from the
   IA32_PQR_ASSOC MSR to count accesses by a task. When reading an RMID
   counter, code must adjust from the logical RMID used to the physical
   RMID value for the SNC node that it wishes to read and load the
   adjusted value into the IA32_QM_EVTSEL MSR.
4) The L3 cache is divided between the SNC nodes. So the value
   reported in the resctrl "size" file is adjusted.
5) The "-o mba_MBps" mount option must be disabled in SNC mode
   because the monitoring is being done per SNC node, while the
   bandwidth allocation is still done at the L3 cache scope.
   Trying to use this feedback loop might result in contradictory
   changes to the throttling level coming from each of the SNC
   node bandwidth measurements.

Signed-off-by: Tony Luck <tony.luck@intel.com>

---

Changes since v5:

Major overhaul to the commit message. Starts with high level overview
of what SNC is, before going into details on changes needed.

Begin with definiton of the SNC acronym.

Clarify in point "1" that available RMIDs are per L3 cache.

Add extra detail in "5" why mba_MBps is incompatible with SNC mode.

Code changes:

Reformat a comment to use longer lines.

Added a period at end of sentence for a comment.
---
 arch/x86/kernel/cpu/resctrl/internal.h |  2 ++
 arch/x86/kernel/cpu/resctrl/core.c     |  6 ++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 16 +++++++++++++---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c |  4 ++--
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index ee38249c6f1d..0a17ace5811e 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -446,6 +446,8 @@ DECLARE_STATIC_KEY_FALSE(rdt_alloc_enable_key);
 
 extern struct dentry *debugfs_resctrl;
 
+extern int snc_nodes_per_l3_cache;
+
 enum resctrl_res_level {
 	RDT_RESOURCE_L3,
 	RDT_RESOURCE_L2,
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index e61bf919ac78..1f94b7b11f3e 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -48,6 +48,12 @@ int max_name_width, max_data_width;
  */
 bool rdt_alloc_capable;
 
+/*
+ * Number of SNC nodes that share each L3 cache.  Default is 1 for
+ * systems that do not support SNC, or have SNC disabled.
+ */
+int snc_nodes_per_l3_cache = 1;
+
 static void
 mba_wrmsr_intel(struct rdt_ctrl_domain *d, struct msr_param *m,
 		struct rdt_resource *r);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 97d2ed829f5d..e6e566921a60 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -148,8 +148,18 @@ static inline struct rmid_entry *__rmid_entry(u32 rmid)
 
 static int __rmid_read(u32 rmid, enum resctrl_event_id eventid, u64 *val)
 {
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
+	int cpu = smp_processor_id();
+	int rmid_offset = 0;
 	u64 msr_val;
 
+	/*
+	 * When SNC mode is on, need to compute the offset to read the
+	 * physical RMID counter for the node to which this CPU belongs.
+	 */
+	if (snc_nodes_per_l3_cache > 1)
+		rmid_offset = (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->num_rmid;
+
 	/*
 	 * As per the SDM, when IA32_QM_EVTSEL.EvtID (bits 7:0) is configured
 	 * with a valid event code for supported resource type and the bits
@@ -158,7 +168,7 @@ static int __rmid_read(u32 rmid, enum resctrl_event_id eventid, u64 *val)
 	 * IA32_QM_CTR.Error (bit 63) and IA32_QM_CTR.Unavailable (bit 62)
 	 * are error bits.
 	 */
-	wrmsr(MSR_IA32_QM_EVTSEL, eventid, rmid);
+	wrmsr(MSR_IA32_QM_EVTSEL, eventid, rmid + rmid_offset);
 	rdmsrl(MSR_IA32_QM_CTR, msr_val);
 
 	if (msr_val & RMID_VAL_ERROR)
@@ -783,8 +793,8 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	int ret;
 
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
-	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale;
-	r->num_rmid = boot_cpu_data.x86_cache_max_rmid + 1;
+	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
+	r->num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index b0901fb95aa9..a5404c412f53 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1357,7 +1357,7 @@ unsigned int rdtgroup_cbm_to_size(struct rdt_resource *r,
 		}
 	}
 
-	return size;
+	return size / snc_nodes_per_l3_cache;
 }
 
 /**
@@ -2590,7 +2590,7 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->enable_cdpl2 = true;
 		return 0;
 	case Opt_mba_mbps:
-		if (!supports_mba_mbps())
+		if (!supports_mba_mbps() || snc_nodes_per_l3_cache > 1)
 			return -EINVAL;
 		ctx->enable_mba_mbps = true;
 		return 0;
-- 
2.41.0

