Return-Path: <linux-doc+bounces-76855-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMdWEu/onWlDSgQAu9opvQ
	(envelope-from <linux-doc+bounces-76855-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 19:07:43 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D147918AF9B
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 19:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A440830D8DE6
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 18:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525053AA1B6;
	Tue, 24 Feb 2026 17:58:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2727D3ACF09;
	Tue, 24 Feb 2026 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955937; cv=none; b=JOcSKiGM3kbInZ1UKopt11rMKPybHeooiNBbwY+GkXjRAdc8+H+6+SEeooqP8/MjKMHpvdOjQCQ9iewGSvT+58cspj6aLspH4Zbs8Pxd21Bgxo8wg8IoEGYmqoHRMNBdd1cynQzbinYxw9G/TDrPfV4xYNvaugeg9wiDFvTovOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955937; c=relaxed/simple;
	bh=X6P01CyoKPuCNJkwpdv/6Jdxg5nLXrW2UT7CbM8CSYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMFgXav7DoeBYXCEcbQGdlWvXDf/QlXZIjOZn64KhFIViSVkD/xxfOhHTxDyv/E48fPwvHZ1UGfgXibBaoxfJ3qTiUHoRAQXTReapEFJuUC2+uMn2L9VkqaFXl3T9nhYh4vzMtUo6pTOFdmXj7LXnTYFSq51bZJAoXK2Bi8gNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BF251595;
	Tue, 24 Feb 2026 09:58:49 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA9273F59E;
	Tue, 24 Feb 2026 09:58:50 -0800 (PST)
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
Subject: [PATCH v5 16/41] arm_mpam: resctrl: Add resctrl_arch_get_config()
Date: Tue, 24 Feb 2026 17:56:55 +0000
Message-ID: <20260224175720.2663924-17-ben.horgan@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-76855-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,huawei.com:email,fujitsu.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D147918AF9B
X-Rspamd-Action: no action

From: James Morse <james.morse@arm.com>

Implement resctrl_arch_get_config() by testing the live configuration for a
CPOR bitmap. For any other configuration type return the default.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Tested-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5f482c6293e7..d5caab6b8545 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -168,6 +168,49 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	return comp->comp_id;
 }
 
+u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
+			    u32 closid, enum resctrl_conf_type type)
+{
+	u32 partid;
+	struct mpam_config *cfg;
+	struct mpam_props *cprops;
+	struct mpam_resctrl_res *res;
+	struct mpam_resctrl_dom *dom;
+	enum mpam_device_features configured_by;
+
+	lockdep_assert_cpus_held();
+
+	if (!mpam_is_enabled())
+		return resctrl_get_default_ctrl(r);
+
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
+	cprops = &res->class->props;
+
+	partid = resctrl_get_config_index(closid, type);
+	cfg = &dom->ctrl_comp->cfg[partid];
+
+	switch (r->rid) {
+	case RDT_RESOURCE_L2:
+	case RDT_RESOURCE_L3:
+		configured_by = mpam_feat_cpor_part;
+		break;
+	default:
+		return resctrl_get_default_ctrl(r);
+	}
+
+	if (!r->alloc_capable || partid >= resctrl_arch_get_num_closid(r) ||
+	    !mpam_has_feature(configured_by, cfg))
+		return resctrl_get_default_ctrl(r);
+
+	switch (configured_by) {
+	case mpam_feat_cpor_part:
+		return cfg->cpbm;
+	default:
+		return resctrl_get_default_ctrl(r);
+	}
+}
+
 void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 {
 	struct mpam_resctrl_res *res;
-- 
2.43.0


