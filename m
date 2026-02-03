Return-Path: <linux-doc+bounces-75147-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CixNqNtgmlkUAMAu9opvQ
	(envelope-from <linux-doc+bounces-75147-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 22:50:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C0DEF84
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 22:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BD0630891C1
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 21:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895343793D7;
	Tue,  3 Feb 2026 21:45:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261AE37107F;
	Tue,  3 Feb 2026 21:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770155135; cv=none; b=m9aVtJVXRObypd0Twc1f8dwAyhiDqxbCjOCl8qPRaFGVDFxDfY8lfRMa1Ds4OPJF7WYR8RWWzYwpC5rWFQ4C5PD81qwYj9G9L48gQRGMmbyGbqLx/b2VUYaKoaIJ8b743O/hEz6P+bL7lVpC7ThYPnVfrlZ+TDZmKLWZ4O4NTCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770155135; c=relaxed/simple;
	bh=03HMlr5YT/YpkyMeh6H9mXUvQ5CDummroAAEiQGkVzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UVj6awP30VflDdSFPynu7tbs/QRn5HKXS8Vwk7GonbRbB3Dsy0pS0S+QL2Pbv3ZF1/MWuogmLa1HgQJgMKti4z+x566v17JyajBhWWGMlqbmRA3bMGUexkMY4WZaxHGEI4w9dfyGT5Xlgu/Rh6z/n9JKfa5tLMxM/AXJEUmSaTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41159339;
	Tue,  3 Feb 2026 13:45:27 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 193643F778;
	Tue,  3 Feb 2026 13:45:27 -0800 (PST)
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
Subject: [PATCH v4 16/41] arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
Date: Tue,  3 Feb 2026 21:43:17 +0000
Message-ID: <20260203214342.584712-17-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-75147-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fujitsu.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:mid,arm.com:email,huawei.com:email]
X-Rspamd-Queue-Id: 820C0DEF84
X-Rspamd-Action: no action

From: James Morse <james.morse@arm.com>

We already have a helper for resetting an mpam class and component.  Hook
it up to resctrl_arch_reset_all_ctrls() and the domain offline path.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Cc: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Don't expose unlocked reset

Changes since v3:
Don't use or expose mpam_reset_component_locked()
---
 drivers/resctrl/mpam_devices.c  |  2 +-
 drivers/resctrl/mpam_internal.h |  3 +++
 drivers/resctrl/mpam_resctrl.c  | 13 +++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b81d5c7f44ca..bf99c37a80a7 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2568,7 +2568,7 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
 	}
 }
 
-static void mpam_reset_class_locked(struct mpam_class *class)
+void mpam_reset_class_locked(struct mpam_class *class)
 {
 	struct mpam_component *comp;
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index a9d89d9e18a8..21ade1620147 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -389,6 +389,9 @@ extern u8 mpam_pmg_max;
 void mpam_enable(struct work_struct *work);
 void mpam_disable(struct work_struct *work);
 
+/* Reset all the RIS in a class under cpus_read_lock() */
+void mpam_reset_class_locked(struct mpam_class *class);
+
 int mpam_apply_config(struct mpam_component *comp, u16 partid,
 		      struct mpam_config *cfg);
 
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index a59d1659fe12..7fc0b515cfa4 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -169,6 +169,19 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
 	return comp->comp_id;
 }
 
+void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
+{
+	struct mpam_resctrl_res *res;
+
+	lockdep_assert_cpus_held();
+
+	if (!mpam_is_enabled())
+		return;
+
+	res = container_of(r, struct mpam_resctrl_res, resctrl_res);
+	mpam_reset_class_locked(res->class);
+}
+
 static void mpam_resctrl_domain_hdr_init(int cpu, struct mpam_component *comp,
 					 struct rdt_domain_hdr *hdr)
 {
-- 
2.43.0


