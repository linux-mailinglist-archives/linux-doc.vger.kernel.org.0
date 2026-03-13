Return-Path: <linux-doc+bounces-79283-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPCQOW8ltGl7hwAAu9opvQ
	(envelope-from <linux-doc+bounces-79283-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 15:55:43 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88318285629
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 15:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7734312D395
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 14:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4D63AD532;
	Fri, 13 Mar 2026 14:47:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D983AA4E6;
	Fri, 13 Mar 2026 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413258; cv=none; b=ELV0dxx20N9v4FRB3+dWC3R7scsg2dqRX35/ezEIBMOwm9rJvFTATt+AnYzbn+44FEe8ztjfXiFq/QphQg8LpN0Qa3SkeD0nFcRZUvetyauPT5pBcNei76TAmv33nZF5gqxIqUFukdsXo8F5vFTrjz12UU6pMre3csRMY5uGPxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413258; c=relaxed/simple;
	bh=VwbBa/cxcCL/sLbGXgviZq3hdumiZXxV3RjYd4k75RU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f2DziMAD61Z707kYOuWxcpIAisQKjr2J8d0/SaT9HRmC0ggOMM9Tm75Z7ZcS6kpezQZiWyRVGK4j8TaVTFCvYgWKEUVouf41JX1VqFHpmaRumTg0msWbYJ/MW7HpR+DjW+8mREppYDNIG1ruGt7YCAoL4V6cUCrtvpkXnaSMP5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B77D1CC4;
	Fri, 13 Mar 2026 07:47:29 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5AA623F7BD;
	Fri, 13 Mar 2026 07:47:31 -0700 (PDT)
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
Subject: [PATCH v6 15/40] arm_mpam: resctrl: Pick the caches we will use as resctrl resources
Date: Fri, 13 Mar 2026 14:45:52 +0000
Message-ID: <20260313144617.3420416-16-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-79283-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.928];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fujitsu.com:email,qualcomm.com:email,arm.com:email,arm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,huawei.com:email]
X-Rspamd-Queue-Id: 88318285629
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: James Morse <james.morse@arm.com>

Systems with MPAM support may have a variety of control types at any point
of their system layout. We can only expose certain types of control, and
only if they exist at particular locations.

Start with the well-known caches. These have to be depth 2 or 3 and support
MPAM's cache portion bitmap controls, with a number of portions fewer than
resctrl's limit.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Reviewed-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
Jonathan:
Remove brackets
Compress debug message
Use temp var, r

Changes since v2:
Return -EINVAL in mpam_resctrl_control_init() for unknown rid

Changes since v4:
Set alloc_capable after other settings (Reinette)

Changes since v5:
Missing 'have' in comment
Set cdp_capable to true for L2 and L3
---
 drivers/resctrl/mpam_resctrl.c | 91 +++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index e698b534e3db..b41b72200590 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -65,9 +65,95 @@ struct rdt_resource *resctrl_arch_get_resource(enum resctrl_res_level l)
 	return &mpam_resctrl_controls[l].resctrl_res;
 }
 
+static bool cache_has_usable_cpor(struct mpam_class *class)
+{
+	struct mpam_props *cprops = &class->props;
+
+	if (!mpam_has_feature(mpam_feat_cpor_part, cprops))
+		return false;
+
+	/* resctrl uses u32 for all bitmap configurations */
+	return class->props.cpbm_wd <= 32;
+}
+
+/* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
+static void mpam_resctrl_pick_caches(void)
+{
+	struct mpam_class *class;
+	struct mpam_resctrl_res *res;
+
+	lockdep_assert_cpus_held();
+
+	guard(srcu)(&mpam_srcu);
+	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
+				 srcu_read_lock_held(&mpam_srcu)) {
+		if (class->type != MPAM_CLASS_CACHE) {
+			pr_debug("class %u is not a cache\n", class->level);
+			continue;
+		}
+
+		if (class->level != 2 && class->level != 3) {
+			pr_debug("class %u is not L2 or L3\n", class->level);
+			continue;
+		}
+
+		if (!cache_has_usable_cpor(class)) {
+			pr_debug("class %u cache misses CPOR\n", class->level);
+			continue;
+		}
+
+		if (!cpumask_equal(&class->affinity, cpu_possible_mask)) {
+			pr_debug("class %u has missing CPUs, mask %*pb != %*pb\n", class->level,
+				 cpumask_pr_args(&class->affinity),
+				 cpumask_pr_args(cpu_possible_mask));
+			continue;
+		}
+
+		if (class->level == 2)
+			res = &mpam_resctrl_controls[RDT_RESOURCE_L2];
+		else
+			res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
+		res->class = class;
+	}
+}
+
 static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
 {
-	/* TODO: initialise the resctrl resources */
+	struct mpam_class *class = res->class;
+	struct rdt_resource *r = &res->resctrl_res;
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L2:
+	case RDT_RESOURCE_L3:
+		r->schema_fmt = RESCTRL_SCHEMA_BITMAP;
+		r->cache.arch_has_sparse_bitmasks = true;
+
+		r->cache.cbm_len = class->props.cpbm_wd;
+		/* mpam_devices will reject empty bitmaps */
+		r->cache.min_cbm_bits = 1;
+
+		if (r->rid == RDT_RESOURCE_L2) {
+			r->name = "L2";
+			r->ctrl_scope = RESCTRL_L2_CACHE;
+			r->cdp_capable = true;
+		} else {
+			r->name = "L3";
+			r->ctrl_scope = RESCTRL_L3_CACHE;
+			r->cdp_capable = true;
+		}
+
+		/*
+		 * Which bits are shared with other ...things...  Unknown
+		 * devices use partid-0 which uses all the bitmap fields. Until
+		 * we have configured the SMMU and GIC not to do this 'all the
+		 * bits' is the correct answer here.
+		 */
+		r->cache.shareable_bits = resctrl_get_default_ctrl(r);
+		r->alloc_capable = true;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 }
@@ -292,7 +378,8 @@ int mpam_resctrl_setup(void)
 		res->resctrl_res.rid = rid;
 	}
 
-	/* TODO: pick MPAM classes to map to resctrl resources */
+	/* Find some classes to use for controls */
+	mpam_resctrl_pick_caches();
 
 	/* Initialise the resctrl structures from the classes */
 	for_each_mpam_resctrl_control(res, rid) {
-- 
2.43.0


