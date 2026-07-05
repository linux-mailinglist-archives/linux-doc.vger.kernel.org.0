Return-Path: <linux-doc+bounces-94987-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p63TMrBjSmoYCQEAu9opvQ
	(envelope-from <linux-doc+bounces-94987-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 05 Jul 2026 16:01:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8C70A32B
	for <lists+linux-doc@lfdr.de>; Sun, 05 Jul 2026 16:01:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eS3dlMNg;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94987-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94987-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EABB301833D
	for <lists+linux-doc@lfdr.de>; Sun,  5 Jul 2026 14:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827103815CA;
	Sun,  5 Jul 2026 14:01:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6813815D0
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 14:01:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783260071; cv=none; b=QOTvjRi6vTSGashJ7w1L1df6tj5j8Y0DjLeCDoGLW84Whd1gHZdkKwB2qfJzMyL1x0+aCvsDQNKnBz45wjDI50kuqj1A++oIFAqankwSxmsWv7XYj9e4lSYt4t2DBIABW4qXljWx2OVUusnTbCP5WbmJNwq7NeQHJDs54h9+HkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783260071; c=relaxed/simple;
	bh=wtktcBb0elwPMxNsNeyK28wVa40Q4Q8PglfLTyE8noM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S38JpAPK+gqPRc+R3s0hOoBhA7E5BDenM4BfmncQMoIa309UwYbUCN3FWXjaX5SuNwimW3l7d8dJAyDjy/hU9EKo/kJmsBI/GBVsgXQmDKwWpVas12Tkhyw+/zquGD2e3d5bWD0fOaoq7YK9T7P4yX7lJZlVXDyWJqTGyqGA57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS3dlMNg; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so2374425e9.2
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783260068; x=1783864868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcARrbs/xdLGk7+Pwn2pFBUUtRITiV3oWliffDjtOxk=;
        b=eS3dlMNg05RZEX+CzcpLOWHGw9AZ8538yUoRs5s7+owYCs3xLJP5CWySRZ2w9AYrlK
         gnZHN3UvTxdVPU8yTpfJYIEz8Lx1ug+nMXXoDrb3JrxB914PF4J06wPV1vmBeToBZIhc
         w7p3gS6ZsQzbFS3MzAED65pTx+5fANmnNKJzbL5NUrINlgpRZrpPAz48IrAmB6ZCMqmE
         yckGvYt/NfRXp0TkaFaqGIoyUky9qj3PlyuwEoIMeMWeNeLA+m9zq0HGTzpcCTjpz+GZ
         3Z34hD7lr/esmSwXPbkyRqKH1qjq2m1LXhc6ZwF+IO9Ecqu/OGJITXizSnvAjD6Ai1xm
         +RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783260068; x=1783864868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcARrbs/xdLGk7+Pwn2pFBUUtRITiV3oWliffDjtOxk=;
        b=DqnW3FUdNe18Fk6swxaxMsO0bPCH2Fec7YvO48tBIG9cvAFfpNRD6T/ojJ9wUFVrq4
         s62VCoa6Nu/rrm3oW4AKD1E1saUkaNh817hSg2OQMV+q23sXH/YJy5e3aWfJN+nKnNJr
         7sBpwwi9JtOmy1mZfv6RRVArI1LmmQj5lofhx/+yV42CRxQMm+4VlOOGe8ZeKH0joTP0
         lMvN/U+f+m/+VOfXKE3XYf61sR3o0Z5FAVbtLOzYVk9XKTiQyWJq6S5jrfHM/Hg3/972
         e7UsQSnXK2c0O7h7VyZLSadc3JEh1jbIR0UXO/hvLFtgvrL47sLCvCPuJVzxGMozofmg
         q5wA==
X-Forwarded-Encrypted: i=1; AFNElJ/4mU4gjbSq5Migk3hTbZU1Qm0eXfJxEWvBBUwVEBhUtTGHUmgker+hcibVEweWOPR0bPl3X70qCY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnF3i4hB/fZvcb7B53EkriK4zKwqGJs5bUxMRGvTrStZhdOF6
	hqcknplgWcg3OZaFMfVppdiHkHcjPsj37DIiHLpUoaHwgYjgNs5lNtbO
X-Gm-Gg: AfdE7ckqPbVRY9ZP+RmFmWrz0zjhEXcsNquhWV/y5E6/gRk5L2yo985q0GPu7c86OZy
	3nr9N7glW1+h3MRIJBVJRxCiuAFqv8URiWMAuwsMqN0loaHeScISI60h56y5Yl610oceFC6tabu
	EZw6ZSVWxk41WMA7u/o9YuZ9hMGVaj/uxXChqNxY7lvTuLKqpU/IfYNm2Nna31zlwjYTjNd9cyX
	WT0L+WQPc5pHg8fjBDbOww1hEccIAxK7o5uhZuAyTst5WLfbBwMnJ0c+41zt7bx+F6YlnZzd5Z6
	FSvHR6IfDfEnZa+971m9nJy79HkeJqkhvn+CnmYhjzs40U9FYoV1JzOqL8nIQGx3DKbz1lP5czD
	InDFh71YFML9RxE2/EvVK/3bjwueXnwR2VdL+E9ZrrTSWfdVxTpaz+LKIi8A0xpZyw/awoWUIs7
	6stsZqfcaWgRYQxpkAOOOJ6vY=
X-Received: by 2002:a05:600c:6792:b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-493d11d7dd2mr74212545e9.16.1783260068120;
        Sun, 05 Jul 2026 07:01:08 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm275911115e9.10.2026.07.05.07.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 07:01:07 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
Date: Sun,  5 Jul 2026 17:00:58 +0300
Message-Id: <20260705140100.1543486-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260705140100.1543486-1-tmaimon77@gmail.com>
References: <20260705140100.1543486-1-tmaimon77@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,jms.id.au];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94987-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joel@jms.id.au,m:krzk@kernel.org,m:conor@kernel.org,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71E8C70A32B

NPCM750 and NPCM845 latch watchdog reset indications in the SoC
GCR block rather than in the watchdog block itself.

Add the optional nuvoton,sysgcr phandle so watchdog nodes can
reference the shared GCR reset-status registers that hold those
latched watchdog reset indications.

This is needed by the following reset-status support, which reads
those latches and reports watchdog-caused resets through bootstatus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..99c225f166db 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -40,6 +40,12 @@ properties:
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


