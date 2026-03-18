Return-Path: <linux-doc+bounces-79977-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBxVOF3Iumm6bwIAu9opvQ
	(envelope-from <linux-doc+bounces-79977-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 16:44:29 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B92BE7F9
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 16:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BCB753093048
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 15:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0CA3E1212;
	Wed, 18 Mar 2026 15:03:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3343DE424
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846194; cv=none; b=ObJdJYT3aireo/F1J6k/9xoU4LyBSjNiJB2mtzg/Xj4o9ifJMNb+ylQ80LdEZietQ9Hqf+Nm4+aFsR7BZj/xPR2ClILKhIAR9XuPM/wMpLNK+sONJkMOwdHZ+ZUox+aZ/Xyq7f7aFKIjzh3eXEE1D/BbFUQG4cesqnUVCM0C8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846194; c=relaxed/simple;
	bh=h0p10z8eZpClUXYtUVukCJgrHGYSRkh1nSA6pgFkCig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jzgvfMkwqL2Tm24YV2v4EDVBXK5Xolqcbdauzdozn0ELut6srvMrdatafrKQJrXDMHVUuz+0uvTQ5wryYoBI9yoYK6b9aK2AQ46kGPxUC+5ulfiNh0lN+MAU58Yj0aK7hDsZb46rQH/iVh9ubRTunMb3t6V30wJfd3eUC55EgUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-127380532eeso191866c88.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 08:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846190; x=1774450990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bCbPYXsJyjrslfVQf+TqWui1no/uksX6ojvJaHIhI9s=;
        b=D2hklwaYZXxPTUvAKFu26a2HWR7gKvm9xmvhIODNoMAi1+bG6Mp98AX0Uczfzy8AgR
         zPQWMBp0vcYEPtI+1pGN06sxUgrRxQoYh02kJnXheZXrsQ1RtXR4gj+xzGrOhPp6T2Bc
         9yE1WkOAeE94Nu2s8KcbIMtdxO82YBcaFD5eDKInqnJBKvp9g5e5ykH0Em0sRDLTwyFR
         qzEzKBEDQpIBn86T1Eu3tv13t/ucq1HsdyYr5XEHphr9/vgD7GUot49F8IO4oYn0z+AB
         aVY5WXpwvIbUaANEcvM6ISxlQnkteqLaTo+VUX3aIAw5ey/XySCsA81KU17X04nStVnJ
         fa7A==
X-Forwarded-Encrypted: i=1; AJvYcCU/Ey0Iu4AKYB8o1t9tvDAY7ZRJ84Dv12i0sm/aRBmIjEnhm3d6gLJv755ET0Z1SWmKzXJwX030PW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh5hl7QJrQxTG2IUSpy0fWbubqCE7ED+UCHyNFHdO5QUyX36tM
	o6fyY8cVMlsDcI6oy3Df/Y2Sf1rpLJuaT2GsHwt8i6c7C0b77ePgweY=
X-Gm-Gg: ATEYQzyvByDpnDVkSVRKOko01AG0rDJKJvVUdVvm6+hJFqNIgSjHlC2tS0tRgWOGRHo
	LR4zifxTIUMUL1HsVs5I25QfnBsyAYUjiTPONfoo5gaP+4vJXUqALx1e2rC0AB7piK442ktqL51
	FZC8Ei21T2lwmQbKa4IR/qbpqShu6rPaRnwNSY85WBGG4ZB4ZKvPv5ZYd9YpIi9CvDMPxWPud6U
	WgPgyhnuHtKqAaBoQe0ZdWWoHp4w0C3o1GU4DOL1DXhAE5VGJMxiCTVbesVLCpu/3G71G/B/RKH
	FOhKzGYIGdpUhPtyoXLkIHv0JLcNNjLEYXrBrynBafDcY9sB0hNCQlQYq79o2p0JlEqsbRvSgyh
	5OiP/WLuchJabcFM8aVCb0JwhAVEnTSpgVWgl9tSy8o6hpgLQXYzvYHEiTceiONYXywaTFS0uGz
	scARK2NHfrlhaBuijxl1sPPUzhdLmAypFQD1PxSIqknLK9P5Fg0ViZBUhbG8LU2qAZHHgGF4qC9
	W63ERJcFGROjL+sBg==
X-Received: by 2002:a05:7022:6a5:b0:122:153:d161 with SMTP id a92af1059eb24-1299ba3e35fmr1920293c88.17.1773846189957;
        Wed, 18 Mar 2026 08:03:09 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b413930esm3529158c88.13.2026.03.18.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:03:09 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v2 02/13] wifi: cfg80211: use __rtnl_unlock in nl80211_pre_doit
Date: Wed, 18 Mar 2026 08:02:54 -0700
Message-ID: <20260318150305.123900-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318150305.123900-1-sdf@fomichev.me>
References: <20260318150305.123900-1-sdf@fomichev.me>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79977-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[fomichev.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,lwn.net,linuxfoundation.org,lunn.ch,broadcom.com,intel.com,nvidia.com,fb.com,meta.com,sipsolutions.net,queasysnail.net,fomichev.me,gmail.com,vger.kernel.org,lists.osuosl.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sdf@fomichev.me,linux-doc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.376];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fomichev.me:email,fomichev.me:mid]
X-Rspamd-Queue-Id: EE9B92BE7F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

nl80211_pre_doit acquires rtnl_lock and then wiphy_lock, releasing
rtnl while keeping wiphy_lock held until post_doit. With the
introduction of rx_mode_wq and its flush in netdev_run_todo, calling
rtnl_unlock here creates a circular lock dependency:

  Chain exists of:
    (wq_completion)rx_mode_wq --> rtnl_mutex --> &rdev->wiphy.mtx

   Possible unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(&rdev->wiphy.mtx);
                                 lock(rtnl_mutex);
                                 lock(&rdev->wiphy.mtx);
    lock((wq_completion)rx_mode_wq);

Switch to __rtnl_unlock to skip netdev_run_todo in nl80211_pre_doit.
This seems safe because we run before the op.

Link: http://lore.kernel.org/netdev/69b5ad67.a00a0220.3b25d1.001a.GAE@google.com
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/wireless/nl80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 2225f5d0b124..ce5f25d4c87e 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18192,7 +18192,7 @@ static int nl80211_pre_doit(const struct genl_split_ops *ops,
 		__release(&rdev->wiphy.mtx);
 	}
 	if (!(internal_flags & NL80211_FLAG_NEED_RTNL))
-		rtnl_unlock();
+		__rtnl_unlock();
 
 	return 0;
 out_unlock:
-- 
2.53.0


