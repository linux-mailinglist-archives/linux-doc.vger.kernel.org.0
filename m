Return-Path: <linux-doc+bounces-14705-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2688ABDFE
	for <lists+linux-doc@lfdr.de>; Sun, 21 Apr 2024 03:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 922571F22789
	for <lists+linux-doc@lfdr.de>; Sun, 21 Apr 2024 01:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C25E10A0D;
	Sun, 21 Apr 2024 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="S9rhk12Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC552FC12
	for <linux-doc@vger.kernel.org>; Sun, 21 Apr 2024 01:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661497; cv=none; b=ZUIECSVO5FhaLorb+RIU/1dWaxv2OVNWiIPQhzCifBmLhR7bQ16ruV1rIXgnbyjwn3/LQg6Rh7HSioK6gvnIBNNcSpl9/ukFCYKyveTnySNSEuW2OLpOX8W4b1AwiWkfxn9FsfcLCStepxIoxhsqDuQGJa5MvRZjcpFaw+3X4FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661497; c=relaxed/simple;
	bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHev3PuRwyu9itgBC3M5eJ1p/cN8qejpNXLO6AFPe0JdTLLvc0xzM0pqaJYBk0rORTDIDmyJMEC0JsQ/kHYDtA8MvMpyacr6eypSNSkgS52kSoWGLAYKUnXaHCBFZS0+ssWZUXPf7VU+FNo7BJIhwjPsC78Uj10P0iJvs00qyyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=S9rhk12Y; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ed627829e6so3688734b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Apr 2024 18:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661495; x=1714266295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=S9rhk12YagI1DUk4AD44hLo/yH/Km8qxEnpd8ITuOrcbUjUN2BMPI5R3jLrNW5ebvL
         aKg+kPnU2wsBIf7UrXkHO+GXU3jh1Jw0YFZ1+vH+EGyWfrEMS25O9BAy/V6Rr7E2w9l4
         jO4H0hSYeQwVKLJlnqej9QveIsQZ3UMc2CWSyOg1W5R6glJwqZQCEqAl+ULa6ffkR267
         pZ8SUny7KVgmq7SLsiGzLxKDBqh8gIVjMciiKC4/z10vAHFe26HNWz7F/vPccGrkFMmq
         Gp6APLaCHYtaEFJfT2sAqjv8gfPZlrQHIRQGb2b+WMLFTnVV7DqVC9C5UaxXv/+z26lS
         BZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661495; x=1714266295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=YU419KzQcijaW312sidBl/z14P8PDr8oE3sZQjYp0KV2UH6FcU/ZKOBHF8wc/ucR/c
         zeCclVy7HEw2q9W2W2VYyjkOsx8DLD+QF0irdjK8ouBiMX6C9sukEC8BvdySCRjbHrSR
         eROHAYAhg7OXwFo8iHAL5cYZosCmv/pcmf2ZUfeAWoctnjfsn9DPakSX6unW3bU7xxFA
         HmtUgHLL8pBn9vOHa9gspfegVFL9nKyI1yyDvBmBgRTkbUD4Qmq7zNxOQbmO4C25kcPO
         ulhfSaljRGxAePTXo5Cqp/t2rDJqyOI3fC2XZ+7m/g6wvdJKPaJwEACOIWgtNjHMlZW8
         XlAw==
X-Forwarded-Encrypted: i=1; AJvYcCVXfrsB3otGMrp89UoiQKBkt6e9qOQqHWHjVWy6FQKuzaL1+py04ceKuh7hmACIdi2se9MJMrjI3XogeJrS4dwx8cszpZWwkeJ7
X-Gm-Message-State: AOJu0Yy0DjK0SwUSUbhTkV1WOjnsWFlikoR4Zm0TyNVSftG+di2Ywsum
	1LgTb0RLVHKa5jmkPRueDygcwLoJAwTwgp+kdvl4NlAdSgCtjq15KgJWSBFQmR0=
X-Google-Smtp-Source: AGHT+IEFz0EIsCfMN1kGF/wQXfftvTTUxdm975Lo9/cXHpjBlb+AqzCdg7gjhE8/LDpE+0gp44E+1A==
X-Received: by 2002:a05:6a00:10d4:b0:6ea:d114:5ea1 with SMTP id d20-20020a056a0010d400b006ead1145ea1mr8547967pfu.17.1713661495007;
        Sat, 20 Apr 2024 18:04:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:54 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:37 -0700
Subject: [PATCH v3 05/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-5-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=kZB/gcvpdY88mM3BCpDWs4dP4AKzfkcUQrEei7evf3AAbBAZdLZh9RDC+cGSOoMpXUpY+epQ/
 BrXAER33w+vB259xFs7+rySg+Y/OSVCHSvRLoNArK0nYqNYuINYlX8t
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..50c9f4ec8a7f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


