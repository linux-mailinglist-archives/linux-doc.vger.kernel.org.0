Return-Path: <linux-doc+bounces-77458-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLxkNP38o2krTwUAu9opvQ
	(envelope-from <linux-doc+bounces-77458-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 09:46:53 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9C1CEE4A
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 09:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3910530151F9
	for <lists+linux-doc@lfdr.de>; Sun,  1 Mar 2026 08:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7053328FB;
	Sun,  1 Mar 2026 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QA+iCvNl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4B3328FC
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772354206; cv=none; b=a8rAe3gKbyi//wZwIopU4oIvsfYuwkhNH5ziiIe8w0fhDD3yngKkLMBWzxpkuvuB0EU90k/DG80K0ki3hBRHxiezne4SGnvq7xmmGKEGrf7di0wHlPEif3B+4ks7QKmn+70Qwo6TB/M4oLV6UDv5vBGSnJRj/e1wtXIEPtCd+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772354206; c=relaxed/simple;
	bh=2JEqUjPCmOPhLW0+NpsR7KgG/zG0nQevkRUZFK/LX5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fh/zkQH/+yW3Z+QcfCed5n2e80+5nZcUuqLu4J0pm/Xb7214Ev32T6gOMwWbYkf79lEkMtu8asiYdqH6sh9Dpdw1yklrVPp2q0aKpD1Wrz/aKIfvPZjtsJZo0ixQi6O2PFJEKVWjH2kWNAybF7f3KA7YXlHGOIazYGrWV9eMjhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QA+iCvNl; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c6e5998f90dso1286887a12.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 00:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772354205; x=1772959005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WrlNKEOMaeq04+2BcaqNmbBtuVSrRRKkFaIhN+u7TNs=;
        b=QA+iCvNlBMtohRA6uMzfy9WjBlHFq9cieXJX/lds0GiosBAgLIgVDZpnKTo0qfOtXQ
         nSO/JOItzJimE7SXJ9ibeDx7jhvmolAYFUyPdSw9Cd31/JSiXdaTGXDFbUsq8iELRG1U
         7FWdAE0lOiRkuXL1WrMZBEvsZi1aCbFzKwntax7Kl3zgj+HlciqjV+FlbHGm2972VATt
         S8uiG9Szf97AjSyXzQ4e4Og1R8kCPYu4zt/RrJJPZdWalcdKJIKj67wsuTXjhM3HL9Pp
         oOq/DBVrFYAIGF0PCtwWeB7FlWielEoY+K9vmk5nkf3xJAO8TuQFylmpye6AilxyuA6Z
         rLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772354205; x=1772959005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrlNKEOMaeq04+2BcaqNmbBtuVSrRRKkFaIhN+u7TNs=;
        b=HPT4LLv3BuGV93yu5/vSHW37KEXobqrGBtM0gTfOCmC/3FIb/j8GxM/wNprWbNEHS7
         /pr97v5NzfvNCHSQFKaH2dX4IyhZFQsjyww2OlP+c0g78Knb0SIddrOvkOd28SHGeqBz
         RGlrsrD0APOnFkcGkEkCUFBZNb/R0Wu4X/NftU8GJ5RMWa0rzBQgu4290NnpzruA502w
         0Gr1BSE7xlyDCUMenfSgh/1FN5TDdaXkgQ9Gx+uwIyZwXfEAsSQNGb+fWefqYk2qef0o
         SjkbhZ6soIp4ZCDyAMaIr22e9d0pQI/4pp/mSIYuK2VPImlxBWTCgfbv/C03KXj9bYLP
         o2Og==
X-Forwarded-Encrypted: i=1; AJvYcCUp4jRpHzlPdutBit3F5nI2bv5Z8jJ6oa4rMcCiHzpAyh0wXx1dEJOqRPsL3giPIGgL0pQmYxIvamo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx03DyDmealf+psgYuODemF9VzFLeusO0WZLfR9E97NTJRITbIg
	J7R9M8HU15EBi8NhOaeGDgdya2ALU4QGDcWpKVTHEDaf6jb8QTzyhf6J
X-Gm-Gg: ATEYQzx1obSaGgx86Y37hQEOzH0msxft8kLLr0hhhz3Q8fo9NbWbEd5lue51KsPCT31
	aH2b1U+bGOv1FRywnhszbjPLHdgKRR1ZLl6SBWN03JxTtElDdwvvWl9YWfZTlzoshTDBZxrIrRe
	7DD67Fyi1feibs8P6nyoZPXiUnFRlwJ90ZG7BskMVrL1l9KMaDyO8u2wm7FJq5GWxZwZR1gzrd3
	j0XF75P9wvH13bd7mXOn67uUU4R+1v6wFJQqG0Xqocu92WjR2NOUMgARQY9BBxyl1IveY3HjLz/
	m8X1l8DvPhFqyzCzfybAynnZLo7WWjmuAmCJop3N14PQo/TS72CZfMuUdjZPsKv9rquMqOHGUNb
	AoQ1p1WpLO+YrVwM4clsbhBONlZfuSi4zKRmmua9H83g/zTYfrnZGx46Yo0BSykBg1vZ+06CAP7
	+2/KWPhVJ1b326Vg9o4RbjlsjSNDg=
X-Received: by 2002:a17:90b:544b:b0:354:bd08:480c with SMTP id 98e67ed59e1d1-35965d029fcmr7491393a91.30.1772354204874;
        Sun, 01 Mar 2026 00:36:44 -0800 (PST)
Received: from linux-dev.. ([104.28.153.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912ff8a92sm6385615a91.6.2026.03.01.00.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:36:43 -0800 (PST)
From: Afkari Zergaw <afkarizergaw12@gmail.com>
To: pbonzini@redhat.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Afkari Zergaw <afkarizergaw12@gmail.com>
Subject: [PATCH] Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
Date: Sun,  1 Mar 2026 08:36:12 +0000
Message-ID: <20260301083612.11661-1-afkarizergaw12@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[104.28.153.21:received];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-77458-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.847];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afkarizergaw12@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 74E9C1CEE4A
X-Rspamd-Action: no action

firewire: net: fix FIXME comment punctuation

Add a missing colon after the FIXME tag in the comment to follow
the standard kernel comment style.

Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
---
 drivers/firewire/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index f1a2bee39bf1..70ceab772208 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -121,7 +121,7 @@ struct fwnet_partial_datagram {
 	struct list_head pd_link;
 	struct list_head fi_list;
 	struct sk_buff *skb;
-	/* FIXME Why not use skb->data? */
+	/* FIXME: Why not use skb->data? */
 	char *pbuf;
 	u16 datagram_label;
 	u16 ether_type;
-- 
2.43.0


