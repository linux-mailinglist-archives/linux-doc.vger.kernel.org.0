Return-Path: <linux-doc+bounces-15216-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4F8B4136
	for <lists+linux-doc@lfdr.de>; Fri, 26 Apr 2024 23:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D0561C21355
	for <lists+linux-doc@lfdr.de>; Fri, 26 Apr 2024 21:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACDD3FBAD;
	Fri, 26 Apr 2024 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Y5CluNA9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1F83D969
	for <linux-doc@vger.kernel.org>; Fri, 26 Apr 2024 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714166983; cv=none; b=ruje/EnMJ7y8olSAAUrRKx8BGkK1EuVMujCc8W72gH0vXRvHH1ptDpS/HFWuiPy4HGobFpJz6tVkDy35YnrW6ZnMDiZva/DerK/fQ2dTUUL2UUMdmsr8y1NIa3FtrBmIphbwwwNp8Q7vubJaU1kuCpc1P7+o4YijShlaBw/DyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714166983; c=relaxed/simple;
	bh=A6k81C7FxsmNoqoavIBbrnW4r4mB4PacamBwQyM/jjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWhH5AWxNCyXBU6+n4s9A/m4PbrxYuDtjRkKKpP/xPUMyXqcSpe3O/XDEuR+jrdYEm2ADMLiZRbS9oOJeU/q7WhKEZTaYH6rfqaY0fhPz/r5YcAxhmGp2k4vvLB0agYdikydcLCBq+AeTQ4LsMh8s+jnSMZiTGmBE7O/+TOsXK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Y5CluNA9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e50a04c317so15339705ad.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Apr 2024 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714166980; x=1714771780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnd8rNFnY2oBrsoxHY22v155J4bh/Yy+LJ625H6rNJ0=;
        b=Y5CluNA98GJKHOL0pfuHgUT3aH8HzMLUgSjueh8bVRGfT7HmH1ffe9ZQ07m7APg3eW
         AC3zWelR9/+2BSeNfFnateuFr49S/1erYGq8BfzEwf0SaGhW/uqHW0Su/1d1JIF5xRR9
         W0xAdSQN8XzYrYsH9NaaBybYC8gDpT8cwauYN9UL3zPd49n+SUv+/f/MNJqTV+tr16aF
         v0Z2X2Gh48pg8YlaVTCCNmRWbhSc7kHiZqWSKsTe3W1O+V6+kDyC0epTjS+00ngwIL8K
         sJ7NPppDLB6+Ev7xJrMgN4Rg2oEGbWWHtCgIkJLK6yAGOAAOMl9oilGwHqtE0t5IOkDO
         zShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166980; x=1714771780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnd8rNFnY2oBrsoxHY22v155J4bh/Yy+LJ625H6rNJ0=;
        b=ad/UIkws1a06GjyuQwMztaBT4gWBA6O91Ov2+YjZZLMF0/S2tn58xjZBxw0gLSwOrr
         1o5VZ5GdwcMDouKJp2YpvNJVUBg8Fie1X7bv4+nTQ1F+aW43IW8WFJ0RwTsZt6Zf7xbi
         5k2vQZIdHklMzPYuE/CM7Tit1FUEP8qsHPqXiFuPOcKicIZ5s5Ckn2k/mNbXa1yYQGpq
         V3EDIpAjcNVs9NtZLpaIiUGul7zJrQTIpz2qv+J2+Q3tzFrD3rmp1xp+YQsbhGTJxG4h
         h2e35PDRF3g4wNZis6kFCpnckJzuTC2YioBc4VQd415mVFSyjSRQfzssrmWJk18yAlTn
         HP2w==
X-Forwarded-Encrypted: i=1; AJvYcCU9JCQMxShEHzmN5XR+wNmJqBmXblWPd2tQLnB8QeKB/hEafAioN69hAcCeA83AdJqTPY3MXdLqwK59L7xj8QnDaukpKtj9gJkL
X-Gm-Message-State: AOJu0YwwmwRE0F3ULhyq+mIJp+hCvfl/IeWQfew3Dg2gqjythGp0bFuN
	/ZNdOUW5UHdM8Yh5Ld/kbJoRgx1acZN2EktyH/j5z5pYhYoYwy4jZt8KZIwh5Q0=
X-Google-Smtp-Source: AGHT+IHGmA/Acl9ZxBw37gJW7Pi300LKvvPAAE69i5oy56v+5uxyPhgZUleYd/RihhL/nkxzf/+y+Q==
X-Received: by 2002:a17:903:1105:b0:1e2:5e32:4444 with SMTP id n5-20020a170903110500b001e25e324444mr5053212plh.10.1714166980595;
        Fri, 26 Apr 2024 14:29:40 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001ea2838fa5dsm7226720plk.76.2024.04.26.14.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:29:39 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:29:21 -0700
Subject: [PATCH v4 07/16] riscv: cpufeature: Extract common elements from
 extension checking
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-7-b692f3c516ec@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714166962; l=5582;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=A6k81C7FxsmNoqoavIBbrnW4r4mB4PacamBwQyM/jjA=;
 b=bROWKaLJhqghwCFXAHWXtg9dC8GbBGAfkAcNnrM5klRVdnmDmGRDaRsuqO08FX3oQppBmAYkG
 ISO0sia6inrBjVi+CZx99e7twSM3dsdyVL/GMSH2FNRNcNSwaNTT7tp
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The __riscv_has_extension_likely() and __riscv_has_extension_unlikely()
functions from the vendor_extensions.h can be used to simplify the
standard extension checking code as well. Migrate those functions to
cpufeature.h and reorganize the code in the file to use the functions.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h        | 78 +++++++++++++++++-------------
 arch/riscv/include/asm/vendor_extensions.h | 28 -----------
 2 files changed, 44 insertions(+), 62 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index fedd479ccfd1..17896ec9ec11 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -98,59 +98,66 @@ extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
+#define EXT_ALL_VENDORS		0
+
 bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned int bit);
 #define riscv_isa_extension_available(isa_bitmap, ext)	\
 	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
 
-static __always_inline bool
-riscv_has_extension_likely(const unsigned long ext)
+static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
+							 const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_no);
-	} else {
-		if (!__riscv_isa_extension_available(NULL, ext))
-			goto l_no;
-	}
+	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_no);
 
 	return true;
 l_no:
 	return false;
 }
 
-static __always_inline bool
-riscv_has_extension_unlikely(const unsigned long ext)
+static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
+							   const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_yes);
-	} else {
-		if (__riscv_isa_extension_available(NULL, ext))
-			goto l_yes;
-	}
+	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_yes);
 
 	return false;
 l_yes:
 	return true;
 }
 
+static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely(EXT_ALL_VENDORS, ext);
+
+	return __riscv_isa_extension_available(NULL, ext);
+}
+
+static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely(EXT_ALL_VENDORS, ext);
+
+	return __riscv_isa_extension_available(NULL, ext);
+}
+
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_likely(EXT_ALL_VENDORS, ext))
 		return true;
 
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
@@ -158,7 +165,10 @@ static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsign
 
 static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_unlikely(EXT_ALL_VENDORS, ext))
 		return true;
 
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index 74b82433e0a2..880bb86ec890 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -39,34 +39,6 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, \
 					       RISCV_ISA_VENDOR_EXT_##ext)
 
-static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
-							 const unsigned long ext)
-{
-	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
-	:
-	: [vendor] "i" (vendor), [ext] "i" (ext)
-	:
-	: l_no);
-
-	return true;
-l_no:
-	return false;
-}
-
-static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
-							   const unsigned long ext)
-{
-	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
-	:
-	: [vendor] "i" (vendor), [ext] "i" (ext)
-	:
-	: l_yes);
-
-	return false;
-l_yes:
-	return true;
-}
-
 static __always_inline bool riscv_has_vendor_extension_likely(const unsigned long vendor,
 							      const unsigned long ext)
 {

-- 
2.44.0


