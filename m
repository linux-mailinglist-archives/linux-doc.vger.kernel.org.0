Return-Path: <linux-doc+bounces-13930-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5741C8A24C2
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 06:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89381F23768
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 04:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3420E17C95;
	Fri, 12 Apr 2024 04:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="g9C9xdad"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028F1BC37
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 04:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895102; cv=none; b=KdPqCuF79eQEn6OoA7SBqs4DcuaXJ2dH7FftbqHqHeAk8TvmMso1GDrL53jYYcu9/CQnZS2udl6tb+vum9M4zdBu0og53+wiV029HNNno39EKcr7vb+WIyQ9/aSAdue8XIyHZTbm5V2CsGHEEeg2mZ00YnRz84ReiskV0Nd/H7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895102; c=relaxed/simple;
	bh=l5D95hH8FM7SAtXGBZJnPbxh68jDhVeawec/Y+8YVoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u0euJoScAgEQ2ywJIKd5ZvGJ8LAjtnstKPv1PKN/al0cGGwpV2dA3CEt5Uqlw8RwxaMH0VtBwN/foC9HbpttLUFRRh81ofpm7cwResrHFeU3SFjUO33ER4Dch/MO6npwz96NcHwiB8v+MKtdWnJzZM0J0wkuOKitLwSJ9NlyQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=g9C9xdad; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso479369b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 21:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895099; x=1713499899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWqc2R+QwLGH/IfsTNU6nT9Ab7JPZj7mZyuCi9mmuFw=;
        b=g9C9xdadKU0HskGpqwcZtOZHzoVvnmMmGXV8PKDvyJiHJY/b3gBwbeqVg31X/OEriw
         9vqXCl6PQGEQjWe0bs2HRhjCRHDng5vZOYsZGkG07b7GeLEdG3k+fXegV6NwOWv/hy5e
         yrlP2u/TIO0QWWRn1Z88ougTwJ1xov5mvARwDHSanedI8gfDIcMaa+0ngPB+x+ozxQii
         pqMlVQaK4QL37eaRdKMrnZdWOboDFwZLthoAPNbZvvRliwnVl0ENM9x7dfsWLyikyK4H
         yLktLVKI840V69GfmJB4ZoXWRUNIfmSAeVaDAoj1rDm2LRCl4W3mNiOIpts1993bjt3w
         KCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895099; x=1713499899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWqc2R+QwLGH/IfsTNU6nT9Ab7JPZj7mZyuCi9mmuFw=;
        b=HGgG1TqQiKBy17YMBPNEwDWZWxDTYePHUTdu8+TWyoEw8G1A/MK4MoKfSKwAs95seB
         SFyJAbHht0PqBwGpkZmVQknaGq2c3P33xwvqWFFGyQRYG4emE6URm6rxTOy1W3KyYOX+
         iL0UpwNh/0EynmwuQUSvnh1HxGEpl8MDgRnxYrnVPLYxasz046DuiYV5oWZCgHxusZEg
         Fdt6pYEhCqWRzDMq7sHtLDNfOHsmazY5TMHcfpy518rugr+InnD9vcR/sulqvjC6RZcB
         KMmu1GOQRQQzNZK9dYo1s0Rl+qoYaqVRk38N9zRg4yX6UNPLVjdmczXKsBWHGeGPxFs6
         PGKg==
X-Forwarded-Encrypted: i=1; AJvYcCUY6gL1Fry8IIqi+hm3ikoGUn1MChkLMLzAMcS0uCde9z08tyxm2YQdb3M7g0WWAnwTPDFXJJB8ECY4qAb4ZQTSN1k8mjHljM8U
X-Gm-Message-State: AOJu0YyoKNTCUmf/1jv0lYCCzraDa7yW3Z+nslo0kzS+rw1Y9S5Oioxl
	8DCC/NgAsOzIvL7DRdP5Is5aQnNJAVmX91dK3OuszDES02qmP7bRRDjruKpK1CY=
X-Google-Smtp-Source: AGHT+IHR8fyFIq+7WC6olvISWPBZK+gSc8ZAQhMIz1TmsOcAmc6LE/xL4APsxczTe2i3JCQDGgyNtw==
X-Received: by 2002:a05:6a00:806:b0:6ec:ebf4:3e8a with SMTP id m6-20020a056a00080600b006ecebf43e8amr2047750pfk.15.1712895099099;
        Thu, 11 Apr 2024 21:11:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:09 -0700
Subject: [PATCH 03/19] dt-bindings: riscv: Add xtheadvector ISA extension
 description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-3-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1501;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=l5D95hH8FM7SAtXGBZJnPbxh68jDhVeawec/Y+8YVoI=;
 b=g99SP4A1lgLMiz1vYVHPQl2CSYAS31y2/mI95/W4kMq8xSrBcd147B21RPTt1pu84X46SsDbu
 sCCD1ypar9sBo0X1VI4kzwjHCwYOf738ze2tE7vdJ3RSGPYSdl2CrhM
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1].

[1] https://github.com/T-head-Semi/thead-extension-spec/blob/master/xtheadvector.adoc

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..3fd9dcf70662 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,10 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation.
+
 additionalProperties: true
 ...

-- 
2.44.0


