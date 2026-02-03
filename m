Return-Path: <linux-doc+bounces-75171-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLzkI5lvgmlkUAMAu9opvQ
	(envelope-from <linux-doc+bounces-75171-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 22:58:49 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C1DF0B7
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 22:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D58630C938D
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 21:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88218374751;
	Tue,  3 Feb 2026 21:47:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263E9371070;
	Tue,  3 Feb 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770155276; cv=none; b=iOatI1pxCaoUX5+PypeIWp0Xt9iGnEPLTlgNCGu4P/MHJBhveZqPVYGK3Uoo9oIpFkFc191Chqc12lRYHG9LcV470lJS7G6PBoXNmLHToyDkIUUeVaU2QeLu+zuVQz6Af5k/WukjZ4ujqDHgSefJb32/eQqUcJc4zfu7p47W1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770155276; c=relaxed/simple;
	bh=sOBd2oS2DYf+Hk7hjEniDIjNZvEj1gZUMIpQnk+8TWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYSYpC5odU+QDCB/WW2uoO/Wh/6939MAQzFFZ29Hj1Td2ZdcXpLQx8WPXv9ciMRbab2DCSVgG2wKMMhogMPodn8qkj3U0aaYwi+SX6VU8WbQYu6o+0pjSG/mlJnAb2LeGHGvTc9OaDbjdWGZlMWv+EEqfP5U7YzmiDIh46i4RPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6693A1063;
	Tue,  3 Feb 2026 13:47:48 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6005E3F778;
	Tue,  3 Feb 2026 13:47:49 -0800 (PST)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v4 40/41] arm_mpam: Quirk CMN-650's CSU NRDY behaviour
Date: Tue,  3 Feb 2026 21:43:41 +0000
Message-ID: <20260203214342.584712-41-ben.horgan@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-75171-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 490C1DF0B7
X-Rspamd-Action: no action

From: James Morse <james.morse@arm.com>

CMN-650 is afflicted with an erratum where the CSU NRDY bit never clears.
This tells us the monitor never finishes scanning the cache. The erratum
document says to wait the maximum time, then ignore the field.

Add a flag to indicate whether this is the final attempt to read the
counter, and when this quirk is applied, ignore the NRDY field.

This means accesses to this counter will always retry, even if the counter
was previously programmed to the same values.

The counter value is not expected to be stable, it drifts up and down with
each allocation and eviction. The CSU register provides the value for a
point in time.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v3:
parentheses in macro
---
 Documentation/arch/arm64/silicon-errata.rst |  3 +++
 drivers/resctrl/mpam_devices.c              | 12 ++++++++++++
 drivers/resctrl/mpam_internal.h             |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index e810b2a8f40e..3667650036fb 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -213,6 +213,9 @@ stable kernels.
 | ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | CMN-650         | #3642720        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
++----------------+-----------------+-----------------+-----------------------------+
 | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_845719        |
 +----------------+-----------------+-----------------+-----------------------------+
 | Broadcom       | Brahma-B53      | N/A             | ARM64_ERRATUM_843419        |
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 51cf29bda66e..460ea98a1c92 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -691,6 +691,12 @@ static const struct mpam_quirk mpam_quirks[] = {
 	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
 	.workaround = T241_MBW_COUNTER_SCALE_64,
 	},
+	{
+	/* ARM CMN-650 CSU erratum 3642720 */
+	.iidr       = MPAM_IIDR_ARM_CMN_650,
+	.iidr_mask  = MPAM_IIDR_MATCH_ONE,
+	.workaround = IGNORE_CSU_NRDY,
+	},
 	{ NULL } /* Sentinel */
 };
 
@@ -1003,6 +1009,7 @@ struct mon_read {
 	enum mpam_device_features	type;
 	u64				*val;
 	int				err;
+	bool				waited_timeout;
 };
 
 static bool mpam_ris_has_mbwu_long_counter(struct mpam_msc_ris *ris)
@@ -1249,6 +1256,10 @@ static void __ris_msmon_read(void *arg)
 		if (mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, rprops))
 			nrdy = now & MSMON___NRDY;
 		now = FIELD_GET(MSMON___VALUE, now);
+
+		if (mpam_has_quirk(IGNORE_CSU_NRDY, msc) && m->waited_timeout)
+			nrdy = false;
+
 		break;
 	case mpam_feat_msmon_mbwu_31counter:
 	case mpam_feat_msmon_mbwu_44counter:
@@ -1386,6 +1397,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 			.ctx = ctx,
 			.type = type,
 			.val = val,
+			.waited_timeout = true,
 		};
 		*val = 0;
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 7a3a46b94913..b6d083a73fe2 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -222,6 +222,7 @@ enum mpam_device_quirks {
 	T241_SCRUB_SHADOW_REGS,
 	T241_FORCE_MBW_MIN_TO_ONE,
 	T241_MBW_COUNTER_SCALE_64,
+	IGNORE_CSU_NRDY,
 	MPAM_QUIRK_LAST
 };
 
@@ -247,6 +248,11 @@ struct mpam_quirk {
 				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)	 | \
 				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x36b))
 
+#define MPAM_IIDR_ARM_CMN_650	(FIELD_PREP_CONST(MPAMF_IIDR_PRODUCTID,   0)	 | \
+				 FIELD_PREP_CONST(MPAMF_IIDR_VARIANT,     0)	 | \
+				 FIELD_PREP_CONST(MPAMF_IIDR_REVISION,    0)	 | \
+				 FIELD_PREP_CONST(MPAMF_IIDR_IMPLEMENTER, 0x43b))
+
 /* The values for MSMON_CFG_MBWU_FLT.RWBW */
 enum mon_filter_options {
 	COUNT_BOTH	= 0,
-- 
2.43.0


