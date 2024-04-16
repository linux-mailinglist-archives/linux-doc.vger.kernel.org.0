Return-Path: <linux-doc+bounces-14270-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 693F78A622F
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 06:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2C46B23DC4
	for <lists+linux-doc@lfdr.de>; Tue, 16 Apr 2024 04:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4A36BB29;
	Tue, 16 Apr 2024 04:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Qa9eSp7H"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73A55B697
	for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 04:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240739; cv=none; b=KOiWdYf7qt4YYBFLBTjeV5Z37yi3BHxYTlx53kgt0jqs8fyRw8hR6M5Zpe7gBChTNYVvaYV2zCaYxuT7XwgnHMfCZDyo8T63eN6z31vIRPF/L825JXCcKMkuZ5uj9kBtnCmZJumKyZARagMB6AkAYYmN7ELyt4EZf1zzsz32t0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240739; c=relaxed/simple;
	bh=pB2VSPvj33lI/8AQbCi/3smUxH+y5ljsCL7cqqiQMp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHz5k/DYnT1jI1Xqdve3RpuGbFY47TNkUv4gANtjphFAnHIBelK1iEKSNSS2gbPVxoXfK3drlgfJegS1zYMR2x3flr9DOeUPUap6fJKg7LJk3dlwR0MLAB6PWscf/7PaKhulyABxvUsTvt75frDzL4mAQ5dGjmiOHNIKbEDSs4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Qa9eSp7H; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso1657180b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 21:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240737; x=1713845537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt9+WFFQa5ypEuNBueQsHraOx3Sw6YlRb9NPkxzQDbc=;
        b=Qa9eSp7HEMvyb/z5skEPZ7hdYXGhHogvjum8g7rKG6Hn4Aw6D743nMlCeLdQDOenbb
         SmQs1DUKgy6Nf0okAxZNgDYHgN36m/hArC1TiAtu0BYUcQeJLyIdWmoTT8w9HyGrAEQg
         /enYdahEHcCQOyktQScWF6/l3+u6y5VHaZeJMC73FAfj2OIhRfxA8b/wDGVL63J1qrcd
         /+gn/FMnQsSFVLCiVWykKTLavVggrzelij9fIaRqWQzVAerd3zsb8ehNtfeE8Y83j4Cq
         abureW3D6jMnEp8QWqvspYozb2stcB8SBQfj1gEA5kr7vVr69KSiRME8aZ9CS+ISUsuN
         8ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240737; x=1713845537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lt9+WFFQa5ypEuNBueQsHraOx3Sw6YlRb9NPkxzQDbc=;
        b=pncLciFStlm39bMJfbsNDLQhvFtQ36GU64ewxYCblEvsiIpKz16Xbs0JWU8kSTy0lr
         OXJRhTGxztjpCnkylDHXIXylPFtJQ1o8vnn5op9xxGlzehbDEO8GBrvNPPdgeaY9jO2f
         FWVnWOsgnBLyquh7L0I+ys6kJywExNmapxzcXs6bXx94Tbr5VK8aPFwo7EW5S866nTwm
         gwzL6oaSC9VikyDeLStwp9AqaZFkdGyySsEZOWWNIZNkuuBIDMlB5vYlGoQXWuq1DTtn
         xIxqBpZ2CrMlOn3g70uthWbMrwL+s3V0sFZ2NeSRVIw+KJFqi9BRGdJvNUr6F/c8xBri
         xdNw==
X-Forwarded-Encrypted: i=1; AJvYcCUyyQrgnN3kDRDSbU7nGcBf89U69rRrKYxTliXCFU70Ywz1HtwZOxfIZettkqGwb+a4ZqeKCEn5+9ZU8dTXoY0uyLtOcZUtwQfX
X-Gm-Message-State: AOJu0YwCW8k09uwgRWPgE/x4TKrd0xqz5DfFvh220tI4lGATmSiBTJsX
	zwGYiRSnHGJ/0+ppW43s6byv65UbAUoA9g2wPbiv42Dwoby5kUmWIJh2HZAGPvE=
X-Google-Smtp-Source: AGHT+IHCNCA1HXhs7dCFTKMFTWnzq8i+GYhA6+4Dbcx+4s0UknMRIzl057VqWDeyJSsM3TdjS4r2BA==
X-Received: by 2002:a05:6a00:2308:b0:6e7:3223:4556 with SMTP id h8-20020a056a00230800b006e732234556mr11616992pfh.32.1713240735967;
        Mon, 15 Apr 2024 21:12:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:06 -0700
Subject: [PATCH v2 09/17] riscv: uaccess: Add alternative for xtheadvector
 uaccess
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-9-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1060;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=pB2VSPvj33lI/8AQbCi/3smUxH+y5ljsCL7cqqiQMp0=;
 b=dG18cYHtMBrx7rXL/eDJ2J/MEkXppkdVPVqNGAzWfC+Il8JQEsduUE1vvr/F4ONbgf1PyHIwe
 CJzJ8zZcdQTAxXdraBfQwbJEfD2R9/JWH+8NHRtQIw3nfMBSlLS4cMj
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

At this time, use the fallback uaccess routines rather than customizing
the vectorized uaccess routines to be compatible with xtheadvector.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/lib/uaccess.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bc22c078aba8..1fe798666aee 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -5,6 +5,7 @@
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
+#include <asm/vendorid_list.h>
 
 	.macro fixup op reg addr lbl
 100:
@@ -15,6 +16,7 @@
 SYM_FUNC_START(__asm_copy_to_user)
 #ifdef CONFIG_RISCV_ISA_V
 	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	ALTERNATIVE("nop", "j fallback_scalar_usercopy", THEAD_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XTHEADVECTOR, CONFIG_RISCV_ISA_XTHEADVECTOR)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
 	tail enter_vector_usercopy

-- 
2.44.0


