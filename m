Return-Path: <linux-doc+bounces-79269-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM1NAVsjtGl7hwAAu9opvQ
	(envelope-from <linux-doc+bounces-79269-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 15:46:51 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A622D285422
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 15:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 74305300C30B
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 14:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9374C349B0C;
	Fri, 13 Mar 2026 14:46:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB633A7595;
	Fri, 13 Mar 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773413198; cv=none; b=rLIilhAbzk4pQ+UbchlwzpMPydIDpsltLNK28ZkJUT7Lhfgm1/47DvfvaSHCltwJ7NW325z6uVOdO7ubP2+Q2cRj8HWvT1V7oD+UOThhThHqtAkfZHjfURFqspC3xBbsEPOupeTqbOd8Mq0WGFYoYj142V+ktrHPDWlxO33DxJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773413198; c=relaxed/simple;
	bh=xC0Yq1ZbdGjnBX5wivQCW4ujMMu9CmwEvYOnydNtC08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLBG8UF4IABu86hmxEHxCBEdICBvdTkGfnCE06S9yWOghD/uuVgZMrB06VYratXdrF/cfH/+UR+aW8zNc8CDp1PXThr+KFt9hkfcgicLPAjYXIZ2Zu39bRoFwOj6kiFyzb0RZBbGJ1FHjrxIC9Lu4IN93R47L4QpkviX9YyznA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B1D91E7D;
	Fri, 13 Mar 2026 07:46:30 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 861153F7BD;
	Fri, 13 Mar 2026 07:46:32 -0700 (PDT)
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
Subject: [PATCH v6 01/40] arm_mpam: Ensure in_reset_state is false after applying configuration
Date: Fri, 13 Mar 2026 14:45:38 +0000
Message-ID: <20260313144617.3420416-2-ben.horgan@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79269-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,arm.com:mid,huawei.com:email]
X-Rspamd-Queue-Id: A622D285422
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zeng Heng <zengheng4@huawei.com>

The per-RIS flag, in_reset_state, indicates whether or not the MSC
registers are in reset state, and allows avoiding resetting when they are
already in reset state. However, when mpam_apply_config() updates the
configuration it doesn't update the in_reset_state flag and so even after
the configuration update in_reset_state can be true and mpam_reset_ris()
will skip the actual register restoration on subsequent resets.

Once resctrl has a MPAM backend it will use resctrl_arch_reset_all_ctrls()
to reset the MSC configuration on unmount and, if the in_reset_state flag
is bogusly true, fail to reset the MSC configuration. The resulting
non-reset MSC configuration can lead to persistent performance restrictions
even after resctrl is unmounted.

Fix by clearing in_reset_state to false immediately after successful
configuration application, ensuring that the next reset operation
properly restores MSC register defaults.

Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Acked-by: Ben Horgan <ben.horgan@arm.com>
[Horgan: rewrite commit message to not be specific to resctrl unmount]
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Subject was originally:
arm_mpam: Fix MPAM reset on resctrl unmount by clearing in_reset_state
---
 drivers/resctrl/mpam_devices.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 1eebc2602187..0fd6590a9b5c 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2692,6 +2692,7 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 					 srcu_read_lock_held(&mpam_srcu)) {
 			arg.ris = ris;
 			mpam_touch_msc(msc, __write_config, &arg);
+			ris->in_reset_state = false;
 		}
 		mutex_unlock(&msc->cfg_lock);
 	}
-- 
2.43.0


