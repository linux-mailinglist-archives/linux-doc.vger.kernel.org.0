Return-Path: <linux-doc+bounces-95161-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uPNBGofJS2oGaQEAu9opvQ
	(envelope-from <linux-doc+bounces-95161-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 17:28:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACE71294A
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 17:28:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bENr7Prm;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95161-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95161-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 551A130CB2E1
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 14:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AC73E00A0;
	Mon,  6 Jul 2026 14:48:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CDF37E304
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 14:48:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349320; cv=none; b=uVilzGC5cyywOsfFkAgW4UNZ3ypxH4FfZ9es9GWxqIjnSPV9jB9vdaHAL+uCtnDqxkGxuON9fX/Pl0YVgXENptnDh2oeM1FyVg1R8vBhTUueZpv3n2AJtrv0tW+sVqvHijVH2ZvKl3LEjyv5r39E+rQfJZ74TSyCtSACq+4nIDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349320; c=relaxed/simple;
	bh=JUJG5Grow4ynAAXlgwL43WqrOFCddT6+gQAxPmGjgds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZVTmaLjnKEe+p/61arcOF4Dyv/Iz/ffYecZlULxsslN1SEZRnpZeKyh/hwU50+PjglSgskSj4U1/yCyM6wHVJZsMwhFEqKHfS6rCK2kbivZf4V0jnnE+q5/OtbmY2avV6WEcNTma96S/ToRAK8CeMVUhh+lj4oUyo3Uck9r92UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bENr7Prm; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4720d22c94aso3087898f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 07:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349317; x=1783954117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqvnsBC1QnHy0BgYcjusDNjgJMCaD3QUZ4+Za8Z0104=;
        b=bENr7PrmgS7b57cOFH1CvyEzupl31QFfsdXmZNnifkjqtaKB0pkaIVrVhEzNK33CwO
         RBmNqjWHh/TTn4PojZ+AeavMTPQfzVR6tq8l2e17HuLvpa2K8PxRfOEHY6870GXQ+070
         9mNWbqRrGvYRLNd3/L6ua/CeEDXe8qeXuur4TjaBgH1+CzBrV/UU9aMkWZ/oMf+3uVfX
         VxZQtwEtKZJiaiP+Rh6M5Uw2gibdHdNbfYjzAG53j7+ZITgviZsOjarShD0iE9X1/hH3
         NqFbaokMZ1ckotDALUJ0CvCQe4g06Xqa+JfKJeyWe5fig3D29L6ASWWrqBknfVen5uQU
         gm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349317; x=1783954117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jqvnsBC1QnHy0BgYcjusDNjgJMCaD3QUZ4+Za8Z0104=;
        b=oAE8j1q2FZQccQiTPTFHTCNUkxTVQ3NPeXDm5zpFfEtwSjYWUXz7QS5vC3nPlg+Xiv
         5cnPYNJJ4UvYXryR6vWLz1vP2DKcom+OKJWWplNBBOQpbDUUFSTpKjH5JDPAHcfTaYsG
         pB59O9khyeu2ZZAytjuYJ19rlH+Udg72qu17a0JGX9Zb/7a5JjxFdb2b4HOLLAmaLnEB
         nCYt/xHkG1+Qqc0egr8J+bzcGzpbELNPoeo1fZHsDcWBAcEGSnI397aehyXBolRicnQB
         eHA+rs1X+13J2GeuSejlF+mkA2toAa4dDqwWiHgBfEI+0egqpeshRinzZYDgydU8hsQw
         5MyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAHBkgIikqLA2vJxbAUvPvN5Ovl2qFha6Ni1gQuYvOQOoDzKgBaQarTEXBGi9GbLsqo6IOpcN+u+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnVDRiVjy/S4alIzIapKh7WJTEZfoaHpXwdTe/EvVSTzdZE+WL
	hVvxCzTXwkUlZaqn6wzq9Pd2be3gJ5MtOGMopILNFW0XIIOkBJngJGQn
X-Gm-Gg: AfdE7cmFpcgZ6olIIVJYhGBt/N3po6my2UNplqI5cFvxgyj4vPUrB/EaqrsFXIBPHyH
	0aUpPsMANwvYh6IDtm8ENWiJ6v4q5whh6bj1NasNfAygwWbgLi9ezutorGI4goMXMN5mPR4qGdU
	dIaNE2upqlKsO9iYfprKuIitAoiNnWwUgxFGRik92h0WXe6LVUI/nexZRr9aP8qKouSOEa4Nqar
	bMWhAnkAJy19YuKs0t2s+oeSmxsNRAJK9tqGsS21PYe3RQEuX2jvEHQ4X/E6dNDODAr+JQKk1V2
	sL8pcZ7/r+ohOUUmDVBWya/3wlw0hBcKGeRNcZI38jzTw5b9BgvZhlmw2/jcTG/8TyxGXQ4b4Q7
	WgyuOlamykJU6OW4KH8J4l7J3IZ4OhWcyAMormj31H87aTzuUBYWgHIIGDubr3lVVnzUL/AWP3P
	pVt4QKgbSDcX59EwvADSjxf42LPVuh7ObQIw==
X-Received: by 2002:a05:6000:186e:b0:476:d52b:b85 with SMTP id ffacd0b85a97d-47de6695ff5mr680196f8f.16.1783349317101;
        Mon, 06 Jul 2026 07:48:37 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm26798473f8f.26.2026.07.06.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:48:36 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v4 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
Date: Mon,  6 Jul 2026 17:48:26 +0300
Message-Id: <20260706144828.3517631-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706144828.3517631-1-tmaimon77@gmail.com>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,jms.id.au];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95161-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joel@jms.id.au,m:krzk@kernel.org,m:conor@kernel.org,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFACE71294A

NPCM750 and NPCM845 latch watchdog reset indications in the SoC
GCR block rather than in the watchdog block itself.

Add the optional nuvoton,sysgcr phandle so watchdog nodes can
reference the shared GCR reset-status registers that hold those
latched watchdog reset indications.

This is needed by the following reset-status support, which reads
those latches and reports watchdog-caused resets through bootstatus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/watchdog/nuvoton,npcm750-wdt.yaml     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..81269fdc81a5 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -16,6 +16,14 @@ description:
 
 allOf:
   - $ref: watchdog.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,wpcm450-wdt
+    then:
+      properties:
+        nuvoton,sysgcr: false
 
 properties:
   compatible:
@@ -40,6 +48,12 @@ properties:
   clock-frequency:
     description: Frequency in Hz of the clock that drives the NPCM timer.
 
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      a phandle to access the GCR reset-status registers that latch
+      watchdog reset indications on NPCM750 and NPCM845.
+
 required:
   - compatible
   - reg
-- 
2.34.1


