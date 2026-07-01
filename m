Return-Path: <linux-doc+bounces-94352-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8+x7E54SRWrs6QoAu9opvQ
	(envelope-from <linux-doc+bounces-94352-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 15:14:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4527B6EDEB4
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 15:14:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tFqaSibk;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94352-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94352-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81F6730909F2
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 12:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EB148C3FA;
	Wed,  1 Jul 2026 12:54:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6748A2A8
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 12:53:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910440; cv=none; b=S9W5a3tpZouFMhD6hCVJzAx9h4itL3D4qowUA+jvVI90cZhPgW8cW68eb4gJGg3nRgxPzKgUNJmVotG5J2fvcqsJOc4Cg+es/Sh0I2T0zesw8rIs+zSLwYPutqnKnCeWEZN3nyRF6tPOs2d3t6sQEAR37cm0UNAxquBaMKB8gi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910440; c=relaxed/simple;
	bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9SBKWGP3hQK07hRqDbNXC9TolgPajy8q+60Sq3gmHFrhqnngVzMAyAMmDeqlTKF8O+6RRvCldEZWsNPjlG8fGMQrC4AUCMZwmm9dJ8+U198ped01F1aF+pFreb8Tqx9p87z/F1VE1IqcbtYzVC6HFJevChnCrBcpF/zcb1muqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFqaSibk; arc=none smtp.client-ip=209.85.210.179
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8454160043aso418455b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910438; x=1783515238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=tFqaSibkO/LnJt2Grjo50J/1DOsfWCmB7D81oitMZPQORju65myzOUl6KVwRDzg+6h
         dzOh7hfDEjeyXO2W5n2ynSj6gO7d8HBgb4Wh0WvJK1EU+WJnLf8fMGRg5cah509LVlMH
         V09xdH2rvuvCDU238HlaHsRd57Eldw0HL4zKhwxdGTDSeMwLSFVhHAj9uO/3zdlkURpY
         8D/C5O1NPeNKReQYBuwBQbFt0xI2NJw4zgPzUaEdGO3vCeAImD7r5Tx0FQqokJN+sw3p
         0M509RPkuQrNM9hanI0w8TV+kz2VrdrO4LW4dshH2ah9y+nbkJYu2uEKMNRqOtUuTdjH
         kE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910438; x=1783515238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=AIZRWt3thqxi/xKXSAhBSpQX/jJ4EVEIrn9UBHuIC+KAHeJqLdkij+ftZ6/7T0xye/
         Ebt8kIcXm+ckXJKBdiPyUHKDDiCt4ir9rXAlaXzP2aoJyg8CkR5dLYYZfSEYicLKoKOK
         JQQZaq9Q2Q+LNpDixeh7M7J3xuckNM6HSseg1m0ktfkzjYEBjJQjSWthpaKnSDhN139x
         FCppQw2GgdiOqOegLy2awYEBnthwps3/cE8ZO2jPT5BxtpUm9MPx2GelBO4GxPQeFmmZ
         aloBP9MPsC2sRYfTaQniEMf8at9BvdsJmD7wJ9Q9o1fcGDa3iyr1+5Lx49AJNCAJ6GdK
         NyMw==
X-Gm-Message-State: AOJu0YzMyoFlewkxP+MHTBmL2DiEsjzQvSj/UpIX3aOOUpol1nDEWGB4
	DjlREWHIZzdDdsn6SPQvIRwKJtv6+2yolvNRtl25fDxmPTWw0uv4hF+3
X-Gm-Gg: AfdE7cnLf4kVkdAEMGsIpMp1Eul6XYJlccrGsb2//rYj7xVgFGr2oOSyugtZ9kscEbn
	okMaeZJonv5mVvA/WcLMeZQ58Wag244idjzHEYAz1EgguE115d9+25kmmPQQqLRJ5QzfqVCgHvd
	VAf5dkPyo6RCeDKIBEWmsrklaGtIFxc6QZGbmCDxMF/iFlFpO+Kl9p2wl8cwSLSDt/iGX869Ntb
	XPSoJoaQRWpqOkFp9x7gIzXHgiJNHL9CCob6+Q3Hfa7f9IxBIyPrMZkEP/trTEKwIaCLFce+YOR
	W/wwuCBLtLFFOljZqZnzBqUNf6nSExxLaruUFM4pOTBUn53F8T+XKQmiW/ry7z/UHrbUdC1C0wA
	REvpG2PeOmaK2C6rGQp5PBBNnY6anFjFC0uGb1KMyAKtKs1kWhfBBaKLaRh6wm0EcObYCJfA7SI
	9S+v7FASEuOzgjTb3n6fAz
X-Received: by 2002:a05:6a00:1807:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-847c07c470bmr1460384b3a.26.1782910438134;
        Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:57 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:21 -0400
Subject: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tZJ0Su79v3RdX58lNmxpiXmJtcKlQyZK/LSqzvea
 TYzF0p2lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQkuxkZOua7fZ3pvVejxeEy
 +4eeNdKc7+brz377VsVu1amK7kMbXjH8007YqzrX6+sFsXM73URmzGLLvRK68UNyxWSL+++Ufmz
 W4wEA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94352-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:zong.li@sifive.com,m:debug@rivosinc.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@kernel.org,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:chen.wang@linux.dev,m:linux-doc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kvm@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:paul.walmsley@sifive.com,m:conor@kernel.org,m:jtaubepe@redhat.com,m:thecharlesjenkins@gmail.com,m:andrew.jones@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:spacemit@lists.linux.dev,m:sophgo@lists.linux.dev,m:linux-kselftest@vger.kernel.org,m:docular.xu@gmail.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:docularxu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[docularxu@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,sifive.com,rivosinc.com,brainfault.org,linux.dev,outlook.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,sifive.com,kernel.org,redhat.com,gmail.com,oss.qualcomm.com,lists.linux.dev,microchip.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[docularxu@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,microchip.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4527B6EDEB4

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..f4dd34d446c02 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1142,6 +1142,32 @@ allOf:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0


