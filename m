Return-Path: <linux-doc+bounces-76871-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QARIFMnrnWncSgQAu9opvQ
	(envelope-from <linux-doc+bounces-76871-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 19:19:53 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A7318B37B
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 19:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 126EE31525E2
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 18:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07A53AE6FE;
	Tue, 24 Feb 2026 18:00:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CCF3AE6FA;
	Tue, 24 Feb 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956031; cv=none; b=D/8G52Asmvyhx6hHHg/kvVRzz+8sGpnFJRY96O3FDkyfdQ6luIHGK+R8BiA990szg0Elkg5RWIKKb9RQC4mpVNhKkw8x4nfyF+djLTkhu+kw1eJbn8DkDHKH1dDYPlYtvRqTo54jTR6w3JwXQkgQJY9XFIKGpV1/wzMe6wsh70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956031; c=relaxed/simple;
	bh=cseq00kRjNx3fggme8HCr8shCJtrtn9eS1iuvgLwRzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9Etc4iA04VloKNAqhgIeSaDFuv/FyBYszyV/wAZxMKH3Pv0YCRszJp+kYSLIiAPGqVGukth4AV9xy48l8zXH3weknGn77sgJeSESZBc36tymrd0XQv92sRCRhza57MMcO7kcnmzBaU2RxX8bjJ/dlI9fFkKxFxd564qxITOYsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E29E3339;
	Tue, 24 Feb 2026 10:00:23 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B8D53F59E;
	Tue, 24 Feb 2026 10:00:24 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v5 32/41] arm_mpam: resctrl: Update the rmid reallocation limit
Date: Tue, 24 Feb 2026 17:57:11 +0000
Message-ID: <20260224175720.2663924-33-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-76871-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fujitsu.com:email,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: A1A7318B37B
X-Rspamd-Action: no action

From: James Morse <james.morse@arm.com>

resctrl's limbo code needs to be told when the data left in a cache is
small enough for the partid+pmg value to be re-allocated.

x86 uses the cache size divided by the number of rmid users the cache may
have. Do the same, but for the smallest cache, and with the number of
partid-and-pmg users.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Move waiting for cache info into it's own patch

Changes since v3:
Move check class is csu higher (just kept to document intent)
continue -> break

to squash update rmid limits
use raw_smp_processor_id()
---
 drivers/resctrl/mpam_resctrl.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 99b6ad89f1ab..d4fdad875d95 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -495,6 +495,42 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_domain *d
 	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
 }
 
+/*
+ * The rmid realloc threshold should be for the smallest cache exposed to
+ * resctrl.
+ */
+static int update_rmid_limits(struct mpam_class *class)
+{
+	u32 num_unique_pmg = resctrl_arch_system_num_rmid_idx();
+	struct mpam_props *cprops = &class->props;
+	struct cacheinfo *ci;
+
+	lockdep_assert_cpus_held();
+
+	if (!mpam_has_feature(mpam_feat_msmon_csu, cprops))
+		return 0;
+
+	/*
+	 * Assume cache levels are the same size for all CPUs...
+	 * The check just requires any online CPU and it can't go offline as we
+	 * hold the cpu lock.
+	 */
+	ci = get_cpu_cacheinfo_level(raw_smp_processor_id(), class->level);
+	if (!ci || ci->size == 0) {
+		pr_debug("Could not read cache size for class %u\n",
+			 class->level);
+		return -EINVAL;
+	}
+
+	if (!resctrl_rmid_realloc_limit ||
+	    ci->size < resctrl_rmid_realloc_limit) {
+		resctrl_rmid_realloc_limit = ci->size;
+		resctrl_rmid_realloc_threshold = ci->size / num_unique_pmg;
+	}
+
+	return 0;
+}
+
 static bool cache_has_usable_cpor(struct mpam_class *class)
 {
 	struct mpam_props *cprops = &class->props;
@@ -1000,6 +1036,9 @@ static void mpam_resctrl_pick_counters(void)
 			/* CSU counters only make sense on a cache. */
 			switch (class->type) {
 			case MPAM_CLASS_CACHE:
+				if (update_rmid_limits(class))
+					break;
+
 				counter_update_class(QOS_L3_OCCUP_EVENT_ID, class);
 				break;
 			default:
-- 
2.43.0


