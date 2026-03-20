Return-Path: <linux-doc+bounces-80282-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLlXIFuivGns1gIAu9opvQ
	(envelope-from <linux-doc+bounces-80282-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 02:26:51 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 024282D4B3C
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 02:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16A9F304EEA4
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 01:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ABB30276A;
	Fri, 20 Mar 2026 01:25:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BB22F60CC
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 01:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969917; cv=none; b=mQBZGcO7K200tlZyV3In62jW060hQprqST2ARKKcp2Tf3GEEMsg9gKleG2iNQmXXUyAD84gFRVCkdlMDk1Lzn8R3Y0KZWL/Kjhs5VEqgiCyeX34h0PxDi03SYnHsD9ebw9ZQfeJFwvxbkYjRROxfeKeahVRrfq/2i1duKI1Ax2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969917; c=relaxed/simple;
	bh=xGyWKie5gSXUQg2y/Hf3EG3CM8UetOjX320TtPqkLhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gvpv0CyZD8gZDZWDfBqBH0fZbNhAQVYP98XJjCtTWHxRnF9InCntHwufVhtcVStCxB5WpVjxJiDikFqmF1J6K9SIz7jsQjcknZd2nbdF8eOzoF4psftuIkG7FMKaEl3W0KGRdN67nP+Xam/6KbTYDyIFhV1sAPjN5DfDHoIFOxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-126ea4e9694so1191577c88.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 18:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969913; x=1774574713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/QYC4SzEuyGRG+kJyCDzSpHDYzTJ7+UZHrEymifymEA=;
        b=KW1rqEcntMjdACgwoRPmPnfnf0fpLWzYONrE0IdWhR3GJTtQoYF1l4SMnl2rL5EF/w
         zilXch1wFMMt83nl6/JsUdsUo6ptnIf1KqnPON2alnE7XRXEuUCXYAYyoLhRnwp2wJRm
         3Eu68o7O4b9WRabxnyXt4b6S14BybgwEkPo03yDwhTGaUrBy8iarN428J8IsI5ph4DVN
         fVLPFIF4k0KeBP5FN+C4M2Zr9s7pm5gJf8L81PcSyXbIUBHVQ+0uA3FJk/iNXxTXTW56
         7Sr2DjLpvBhDxfNPAex6AzbN2Y5BTzc9N4h1thuYaQzje7WlscCQlfYf+j/i7ZcIPTAM
         7zXw==
X-Forwarded-Encrypted: i=1; AJvYcCVkNnze1kV9Lb/maQkv8sAC3not9WKNQdBJ1/vF76MJizAQFLZPJIcgrhkO7+VL8s0Q6N4Ugzb0cCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy8Y5Rgmc0yirZDnbsUpkGrcxxAXZsMXf3YPJ6cVjt65+FAAwY
	ZPvwaAIvNgeaMlbEut9WetvzXuWZepkUsc/5x7m8zCpR5gU+2P0r8A0=
X-Gm-Gg: ATEYQzxF3wpu/yULtXhzbLbB0Y0K5UAEt6HOMmLpASuyQ2YAIoVoN+Sg+TgclLj7oJN
	YCT1qHaJkHiKE8fyvVKMjNbMdZxAfqmyqPYSjhJTFU9qz70SnJE2zA0//LStoo3tDAR7WyubXL6
	5rqQmpilO1RMfRHaUOxbPk3ebRhl5KrojN88UtoS7aS48RDKdNiby8J46NrOf29nKF02jZn44Ab
	vMQ+TkYSxq6d6u/Wq32EQQp9q2ECQNRE8CxAQlGpm1tS/bNkLlcpiDIkfXtEbV2A1VJzNWTJCOY
	Qxjpu/LffJP6/RVaudM9CPihh/zlMGnXPMlrKORfnXK0W3uq+mWIwMw7X9KMXuVPie35Ee/ufiT
	lo8+9oAZ5GSFJ4XVpF8Fg1NZatA0e4yFXYxOAGZeA3CIL65zMkaXNRiBU0WZ+3MsSfJLE3sevj4
	fn/pYuvEpVO+S5Ho7lZSdZMMYu9qRLjD/NcBKMFHWdNi87Tfx2C7h0JN0UH/Z2g+OFSzBNSeVky
	//l4a8npvWDMdKXAwmf8Rl6zzOd
X-Received: by 2002:a05:7022:6893:b0:11b:ca88:c4f7 with SMTP id a92af1059eb24-12a726dd982mr607975c88.40.1773969912989;
        Thu, 19 Mar 2026 18:25:12 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733e794esm803266c88.6.2026.03.19.18.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:12 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 08/13] bnxt: use snapshot in bnxt_cfg_rx_mode
Date: Thu, 19 Mar 2026 18:24:56 -0700
Message-ID: <20260320012501.2033548-9-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320012501.2033548-1-sdf@fomichev.me>
References: <20260320012501.2033548-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80282-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[fomichev.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,lunn.ch,broadcom.com,intel.com,nvidia.com,fb.com,meta.com,sipsolutions.net,queasysnail.net,fomichev.me,gmail.com,vger.kernel.org,lists.osuosl.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sdf@fomichev.me,linux-doc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.395];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,fomichev.me:email,fomichev.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 024282D4B3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the introduction of ndo_set_rx_mode_async (as discussed in [0])
we can call bnxt_cfg_rx_mode directly. Convert bnxt_cfg_rx_mode to
use uc/mc snapshots and move its call in bnxt_sp_task to the
section that resets BNXT_STATE_IN_SP_TASK. Switch to direct call in
bnxt_set_rx_mode.

0: https://lore.kernel.org/netdev/CACKFLi=5vj8hPqEUKDd8RTw3au5G+zRgQEqjF+6NZnyoNm90KA@mail.gmail.com/

Cc: Michael Chan <michael.chan@broadcom.com>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 26 ++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 225217b32e4b..12265bd7fda4 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -11039,7 +11039,8 @@ static int bnxt_setup_nitroa0_vnic(struct bnxt *bp)
 	return rc;
 }
 
-static int bnxt_cfg_rx_mode(struct bnxt *);
+static int bnxt_cfg_rx_mode(struct bnxt *, struct netdev_hw_addr_list *,
+			    struct netdev_hw_addr_list *);
 static bool bnxt_mc_list_updated(struct bnxt *, u32 *,
 				 const struct netdev_hw_addr_list *);
 
@@ -11135,7 +11136,7 @@ static int bnxt_init_chip(struct bnxt *bp, bool irq_re_init)
 		vnic->rx_mask |= mask;
 	}
 
-	rc = bnxt_cfg_rx_mode(bp);
+	rc = bnxt_cfg_rx_mode(bp, &bp->dev->uc, &bp->dev->mc);
 	if (rc)
 		goto err_out;
 
@@ -13610,11 +13611,12 @@ static void bnxt_set_rx_mode(struct net_device *dev,
 	if (mask != vnic->rx_mask || uc_update || mc_update) {
 		vnic->rx_mask = mask;
 
-		bnxt_queue_sp_work(bp, BNXT_RX_MASK_SP_EVENT);
+		bnxt_cfg_rx_mode(bp, uc, mc);
 	}
 }
 
-static int bnxt_cfg_rx_mode(struct bnxt *bp)
+static int bnxt_cfg_rx_mode(struct bnxt *bp, struct netdev_hw_addr_list *uc,
+			    struct netdev_hw_addr_list *mc)
 {
 	struct net_device *dev = bp->dev;
 	struct bnxt_vnic_info *vnic = &bp->vnic_info[BNXT_VNIC_DEFAULT];
@@ -13623,7 +13625,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
 	bool uc_update;
 
 	netif_addr_lock_bh(dev);
-	uc_update = bnxt_uc_list_updated(bp, &dev->uc);
+	uc_update = bnxt_uc_list_updated(bp, uc);
 	netif_addr_unlock_bh(dev);
 
 	if (!uc_update)
@@ -13639,10 +13641,10 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
 	vnic->uc_filter_count = 1;
 
 	netif_addr_lock_bh(dev);
-	if (netdev_uc_count(dev) > (BNXT_MAX_UC_ADDRS - 1)) {
+	if (netdev_hw_addr_list_count(uc) > (BNXT_MAX_UC_ADDRS - 1)) {
 		vnic->rx_mask |= CFA_L2_SET_RX_MASK_REQ_MASK_PROMISCUOUS;
 	} else {
-		netdev_for_each_uc_addr(ha, dev) {
+		netdev_hw_addr_list_for_each(ha, uc) {
 			memcpy(vnic->uc_list + off, ha->addr, ETH_ALEN);
 			off += ETH_ALEN;
 			vnic->uc_filter_count++;
@@ -14600,6 +14602,7 @@ static void bnxt_ulp_restart(struct bnxt *bp)
 static void bnxt_sp_task(struct work_struct *work)
 {
 	struct bnxt *bp = container_of(work, struct bnxt, sp_task);
+	struct net_device *dev = bp->dev;
 
 	set_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
 	smp_mb__after_atomic();
@@ -14613,9 +14616,6 @@ static void bnxt_sp_task(struct work_struct *work)
 		bnxt_reenable_sriov(bp);
 	}
 
-	if (test_and_clear_bit(BNXT_RX_MASK_SP_EVENT, &bp->sp_event))
-		bnxt_cfg_rx_mode(bp);
-
 	if (test_and_clear_bit(BNXT_RX_NTP_FLTR_SP_EVENT, &bp->sp_event))
 		bnxt_cfg_ntp_filters(bp);
 	if (test_and_clear_bit(BNXT_HWRM_EXEC_FWD_REQ_SP_EVENT, &bp->sp_event))
@@ -14680,6 +14680,12 @@ static void bnxt_sp_task(struct work_struct *work)
 	/* These functions below will clear BNXT_STATE_IN_SP_TASK.  They
 	 * must be the last functions to be called before exiting.
 	 */
+	if (test_and_clear_bit(BNXT_RX_MASK_SP_EVENT, &bp->sp_event)) {
+		bnxt_lock_sp(bp);
+		bnxt_cfg_rx_mode(bp, &dev->uc, &dev->mc);
+		bnxt_unlock_sp(bp);
+	}
+
 	if (test_and_clear_bit(BNXT_RESET_TASK_SP_EVENT, &bp->sp_event))
 		bnxt_reset(bp, false);
 
-- 
2.53.0


