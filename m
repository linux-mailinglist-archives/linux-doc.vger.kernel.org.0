Return-Path: <linux-doc+bounces-13942-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8478A24F1
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 06:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09114283B6C
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 04:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C488502A7;
	Fri, 12 Apr 2024 04:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jbxZ8/MJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BCC50292
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 04:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895121; cv=none; b=HIlHOYiQKGMlA5D7M2cETLCiZWgsXqRkAqUttez9VwPJkQrSCR7H9YhKCeMlmQQNTa71OhQV2Rn2I2fqKXbJbVAbS6EU0XwNDM596cXVlUT0RM48JytCdrsHAVcu+kWgKGKSn8lXZLpGk5T+T0EO/ttfvq4t9xdV18JQF/lx5gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895121; c=relaxed/simple;
	bh=lbXM7gEz8TjX6THMhyqDltfPVCT1kYIv/wwg0eIvR1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJgfQOky/BqzE6FErNPF+uc/Jf1dorFVLc+Dj8heJr7fIGtPcg7P78PIWcgI6+W2qmbmJasIWWGNbp3JyD4buidgWRE/GtumZpMmCMxiz9NIClL4cYUDpfjm/oeSJBATuXz9cSXX3lDaIy25HSzwJaHCjIzA+Q1ZzueuabzHdQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jbxZ8/MJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e782e955adso539457b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 21:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895120; x=1713499920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plhzSwBN2tg2hM/OGJHCzSMFajymGFMMB5gXR65w0nY=;
        b=jbxZ8/MJJwdztU4lNZbbgOTWxWLfRlqsKpFkB4RpSYUet0MCfAK/u+16iU0bnaKBwF
         pcwOlVwBpRG4AegnfLUP7laWO3w17p3gdtFpc9EhXC8T/IKomsz4qPPzAU2unvYdJ1kg
         84koAenGqiS1w5TGkTnPbfFeMXbguLSFzePNGOr0n7sIJ3ZrwP6zv5VVbdHTvqofRMDa
         kXRtr+vq0MF54iSXpKqAp29Qw79G+ry3WpM2XNzesEqR48mEZ4qyh0PiZM2j1kz49z0d
         GUo4iL0Aw8qrJ84/tpN3iinFPnuCch+4rbtNkTf5I3oE3myMpJ/NUIO9zCL8aK0w8ry3
         lgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895120; x=1713499920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plhzSwBN2tg2hM/OGJHCzSMFajymGFMMB5gXR65w0nY=;
        b=HqE8uPiGFkLhXeodXxodkXYdbGmGg1zXpTMFt/osfk6rLFucz1Vg8foKOAc/UUhEmH
         K1hwYo7BCyWusZH4fYMguK8/ZKV1Zmxx3LyEtIFhkaiw0LAdr+9szRNSQuyS8j1crwG/
         +M5PVr+1DhC1dXmxkX7IRk1Lk+j/uSpQwBjRcsCPcrMPOF3X58FH/i3AVv2GX4e0WZ8f
         lNjjKBQYoQhGkAbkPZ1vwLGcJAd6aR1Q/pAtgIPNC1FOCzs7/xapNzXNt3m1+UqI945q
         oQ1THspOs6sZVYkGCdPwj/d6OMJ2okhsKz338mWkXXRDFm4kqDR2s/xsS2F/U6B1ZrYG
         gupw==
X-Forwarded-Encrypted: i=1; AJvYcCXjMsLvddmKpOY7FEktYZhR5pnWETiYnMvmbL55uOwkvpmoFjDnAPVyxcNZ6w0V9hPF43yoTUrZv3RMhj+W2pehamg6O+4uPH5m
X-Gm-Message-State: AOJu0YyuTbVMXaLxfbMuAF8KLxeeRVre1FjCQJwneY2AHxmcABx7ZO68
	sD/8P+PVFcqMgv+dkt2BsV3sQODMT/5BWe4pgg8wyyHIznDl437TcPfkEMYMyR0=
X-Google-Smtp-Source: AGHT+IGB7qEzfffwtlvMeSArFRe5b2IbJWtk76uBcLMkAO0+GhaFRMgJf/WL0fMJial1eSC+YOsckw==
X-Received: by 2002:a05:6a00:4b56:b0:6ea:7647:282d with SMTP id kr22-20020a056a004b5600b006ea7647282dmr1404792pfb.29.1712895119945;
        Thu, 11 Apr 2024 21:11:59 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:21 -0700
Subject: [PATCH 15/19] riscv: hwcap: Add v to hwcap if xtheadvector enabled
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-15-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=2034;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lbXM7gEz8TjX6THMhyqDltfPVCT1kYIv/wwg0eIvR1o=;
 b=gL8I89W2iPbnp9JhxSnVt0+YsdfyK3XR6HPgX62u6VidPvO2DFakfFikn+qtu3GgFR+cwPIl7
 u5WOsb8FluDDKKVd3JMS+Bqr6mmxoegGLXkHjjZWJ1mhV6fSumSV/y8
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

xtheadvector is not vector 1.0 compatible, but it can leverage all of
the same save/restore routines as vector plus
riscv_v_first_use_handler(). vector 1.0 and xtheadvector are mutually
exclusive so there is no risk of overlap.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 41a4d2028428..59f628b1341c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -647,9 +647,13 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * Many vendors with T-Head CPU cores which implement the 0.7.1
 		 * version of the vector specification put "v" into their DTs.
 		 * CPU cores with the ratified spec will contain non-zero
-		 * marchid.
+		 * marchid. Only allow "v" to be set if xtheadvector is present.
 		 */
-		if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
+		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
+							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
+			this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
+			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
+		} else if (acpi_disabled && this_vendorid == THEAD_VENDOR_ID &&
 		    this_archid == 0x0) {
 			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
 			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
@@ -776,6 +780,15 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 		of_node_put(cpu_node);
 
+		/*
+		 * Enable kernel vector routines if xtheadvector is present
+		 */
+		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,
+							   RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
+			this_hwcap |= isa2hwcap[RISCV_ISA_EXT_v];
+			set_bit(RISCV_ISA_EXT_v, isainfo->isa);
+		}
+
 		/*
 		 * All "okay" harts should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't.

-- 
2.44.0


