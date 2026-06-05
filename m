Return-Path: <linux-doc+bounces-91052-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9p7FOEaOImqmaAEAu9opvQ
	(envelope-from <linux-doc+bounces-91052-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 10:52:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AB6646984
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 10:52:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="r/bmu2rs";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91052-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91052-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E1D33013D5D
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 08:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0603D7D9C;
	Fri,  5 Jun 2026 08:42:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAA83D9049
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 08:42:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648967; cv=none; b=bCa/1H1vTlJKy09rq9om5k01Svz3K+uUc7JB1pGbwh422QcC2s/uUtp5FNPtRbiidTaL+Al+YtDN4gtneAa2TL6nXT1xtavETyVfkNT0KuaHN1lmzkytUXogaoFPRxiVDumeCvP3DEimgWhaWa3md/G7BANjHdn5Mu+SxKCTM4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648967; c=relaxed/simple;
	bh=oHIXLuYzIBw7a37yAfN6c/LniYTZOWunKxnbo9VfqHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V3FX+uLjoj4+iUb8Uc8AcqcHbJw0IerlMPeZZEnzK0ToNY8Tkw/7vA4bebCAq/oFxDQBAO0gTDQ9viNOvBqyIlogR51SdzfsBWBahsUNDC9DWrnF3saByXpeTtv2WdejiSLJmy7bj+POJZhjb4I/EiREU9NDgQTDFXXxMMYcGk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/bmu2rs; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c2d792c8so11427135ad.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780648965; x=1781253765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FvqlHjcbwyGRdhAJkKALJZgP3oME5pVGmYOXUhA+Uvs=;
        b=r/bmu2rs3dnQsOBuVakQSMW5GAFMCCGiscmhletwaZDO5wku2b3R5M+U/2+7GjXHB0
         M4UZXkaP5+ahXbGMdrcuQeTEE2QGoqUEEjCTyRUsRIOgeYuP7L2nlJI8Yn8g+37bk56W
         DFZjDIfMR+Tl2jty+bRjjtt5lHOY7J1lC6thUvT2qC/UHucINdMj8DgTVQ710+yIti0o
         ejVLPgrwgxEx+n3PVq38hPJATKJodhug7E2iFVctAPXIuuYEAec0zZCwLk+Uql0dHsaB
         VJcvwQJ3KYrZ7AliDNps36pHpZqB0e+BobKaaSjOwMxtn5CS+wPz7XOGDQLhKzBBC8aA
         yF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780648965; x=1781253765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvqlHjcbwyGRdhAJkKALJZgP3oME5pVGmYOXUhA+Uvs=;
        b=gy7CVkvGOt+Q+bgjxmWVfCbQR6VZ68WinXT4Hg2H5iRm4v8KX0lZ+4Ir/xwm/Lx/Gx
         SkoyfPWlhzLEaWEtL0Px5oE6t5rkxUmlPRUzzxIXRisj2rb/8ylNX8oiiRHx0ScVA+gv
         OIBe3p7phI61ITXCOzGT6VQlxZuZ+X8I9IQ32rDr0ujvtFHmpf1lNvij3WmovzfPCqVQ
         U4V7XMMkLe6GF7jDIgtVYNddwf5g8/3EUO4Q7KGSzFIL4MLawJcPa3+dEE6ggExO5k8U
         QBJ+7kjsjENPNbfVwYXv9xkVv4eqPJ4CS6uLbxPPBtUBcp1FyUF1lu+7HOXdGnvKnCQa
         rQyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RvHvYbbi9twH/RI9VXvFEhYQ+f1zVt5QVXHhOZ+Kux8Z+xdNGU+hlkSFXx1+JAT+iKj69QAsmB5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxUfQQ7yIotBp3dH1uw7AuDpVg5EZFv3Cud1tNK2CSxahqdxDH
	5o7xRfTwJDQ+pqx/MUEuan3g7jqOUyau09suCIEbp7C8PEFwksCi0kdgZoGGD0JUQAU=
X-Gm-Gg: Acq92OEAEiC9zdWxV2qovhojLnIBdCaUVkVW6vKZpu4pSd896qASo4fanPbZVrPuqfz
	LVjeZsifYosTIAxB25nKXFNTNeNqBjXUaF4t1afRZsaABB/ln7581QxF5dTGCp6dIKONa7EKOkk
	Sgt9tHh8zkJ7po23u2rwGhsdNRVauY2w+llHcGaUHolDVPgcRjb2mIk9OJHw18g4DXDdV/lPeXY
	1CW/kS1qTPB9PckWUpskO1KYwRd9/7pWGCdOUP5X0isF4AyEkkZOroH9BhoCrKAz1vzPZTV0Sji
	NpotT22Z363T9e6Z0nAazelTkMoZ09nkj53GRPKvEayQHdw1Euen7fApQypaXYHJpnukAlizp03
	62/PHi3Ql1m2fKI2lBmx6oHZ9FZ/j/KkapNN5w7EW3Rjy0TAwGMp3VfW6XGtHFiVmReVmauAnXI
	pWwdkRyAA+q92nyyjNul9pOcf4TxqXljtzAVmOdItxlhNBn0IZQnl2jNyTs5svupiL+0HeQhmb9
	HPKt21ywDI7B9gC2YbXGB3OOQ==
X-Received: by 2002:a17:903:3504:b0:2c0:ab82:6b9d with SMTP id d9443c01a7336-2c1e80edc43mr25916515ad.29.1780648964638;
        Fri, 05 Jun 2026 01:42:44 -0700 (PDT)
Received: from urbaner-laptop.. ([61.70.109.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e096sm84879065ad.44.2026.06.05.01.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 01:42:44 -0700 (PDT)
From: "[Ko Han Chen]" <urbaner3@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"[Ko Han Chen]" <urbaner3@gmail.com>
Subject: [PATCH] Document: Fix missing reference pages
Date: Fri,  5 Jun 2026 16:41:30 +0800
Message-ID: <20260605084130.13363-1-urbaner3@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91052-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:corbet@lwn.net,m:horms@kernel.org,m:skhan@linuxfoundation.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:urbaner3@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[urbaner3@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[urbaner3@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hackmd.io:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2AB6646984

Today, my friend and I are discussing a wwan driver produced by
Mediatek. I am reading the related document and reference link,
then I found the page is missing. So after a short search I am
giving the better link and test the two pages with my bash
program for more dead links. It turns out only this one. I check
the page and the following documents. Details are covered in
this markdown [page](https://hackmd.io/@Urbaner/lk_patch_doc).

Signed-off-by: [Ko Han Chen] <urbaner3@gmail.com>
---
 Documentation/networking/device_drivers/wwan/iosm.rst | 2 +-
 Documentation/networking/device_drivers/wwan/t7xx.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/device_drivers/wwan/iosm.rst b/Documentation/networking/device_drivers/wwan/iosm.rst
index 6f9e955af984..d28a922391ce 100644
--- a/Documentation/networking/device_drivers/wwan/iosm.rst
+++ b/Documentation/networking/device_drivers/wwan/iosm.rst
@@ -84,7 +84,7 @@ session 1.
 References
 ==========
 [1] "MBIM (Mobile Broadband Interface Model) Errata-1"
-      - https://www.usb.org/document-library/
+      - http://usb.org/document-library/mobile-broadband-interface-model-v10-errata-1-and-adopters-agreement
 
 [2] libmbim - "a glib-based library for talking to WWAN modems and
       devices which speak the Mobile Interface Broadband Model (MBIM)
diff --git a/Documentation/networking/device_drivers/wwan/t7xx.rst b/Documentation/networking/device_drivers/wwan/t7xx.rst
index e07de7700dfc..fd532a7e225a 100644
--- a/Documentation/networking/device_drivers/wwan/t7xx.rst
+++ b/Documentation/networking/device_drivers/wwan/t7xx.rst
@@ -187,7 +187,7 @@ References
 ==========
 [1] *MBIM (Mobile Broadband Interface Model) Errata-1*
 
-- https://www.usb.org/document-library/
+- http://usb.org/document-library/mobile-broadband-interface-model-v10-errata-1-and-adopters-agreement
 
 [2] *libmbim "a glib-based library for talking to WWAN modems and devices which
 speak the Mobile Interface Broadband Model (MBIM) protocol"*
-- 
2.48.1


