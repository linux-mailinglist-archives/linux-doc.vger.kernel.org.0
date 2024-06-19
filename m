Return-Path: <linux-doc+bounces-18916-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEFA90E9B9
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 13:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F881F2166B
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 11:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B23D14F117;
	Wed, 19 Jun 2024 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="h5A2VoSH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE44D14E2E2
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796951; cv=none; b=jtI+JP5Jv455tnIXd34HGWiXnNLJ7WxVDndFxWIzemMjFCNh2Oj9tMCRkSwFNWhsj9HAG0IOy+41uhh+78xxLzhMEjk1zAiIgEvkV5dCSctdz1iFUgMOYHby25NakHn0qOayu7aQxWukmGGbfKCYnb3yOJt1In6smHE88fLcbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796951; c=relaxed/simple;
	bh=Ii56uJPfHAST0VAwRgpQKI504lzfW4OE+ZxnC8nzGIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EP+tOG8CGabhVu5h9thW+1jFwxnXwQSu4lkvt9BFqVi8eoZsFbqEhDJU2rfbHHtOKep+3bXBMclNigIa7xfVc0XAEV71zg4lmtjeT/YX0h0iXQXaEvhttcDL2pJrRsH8nMN0XCVQjjtqT42dzAc7rdKwG6QfreOO6ktH21URTZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=h5A2VoSH; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebc724e1fdso7522871fa.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796948; x=1719401748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNRHzoAv2tzJ98f4aZ+tvGJ/9WIogU2JNMbeWGeAmys=;
        b=h5A2VoSHheWoimdcAaz3E/7GM9x8ZwtiWPQA3/kEXvUhwO7FWyr3WyV1wxJZ64xY12
         SUPGFxiZYTscCstjFtS1gXLaFNPAThT8Lu4R78UkH2bIzCPyOMT9aac7dy+xXBRihcFL
         CUEouYYEJac6AWCV73SSwOxHpu74zNf+9yrACCohOAoX0KKGjpI/RaYl08TKxSbnW3QW
         E2JF7UFKhTixEFCL21PPvGU1rucVO3/CPcuyrYCFw7S6oZ0675sMysJre0yBDYw1wGsG
         FVTuRCja2tOKfoO4yEkPP+hYZzdwFs0GPGwrLYGcuNfH0c7CaZrRmse+jXUwK4fK1H2m
         gYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796948; x=1719401748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNRHzoAv2tzJ98f4aZ+tvGJ/9WIogU2JNMbeWGeAmys=;
        b=RHGHtxg6s0yOaqiARGEIguhR1qYpZkZpgZzZScbSxh9pSdHWT5rm/44wTS27+qJuAn
         kUu+ZrCQPjsVKqX3A9lUJ2CnUBXXOe/z/M8YWAN17kqwqMrdK66LQcaSJJhAgtqFi2He
         v7eLlidTPchL4cyj3dL8jqFJA/fzXtiBgwaVhxjIZLgbMBAlogeVk256+/n5wPZYjGeo
         Rs7xxgkUqyiA07YJ4yrmlZ95h50kXdsw0qH4sHr2CgfKlv2ovfVbjjrE6hSiMB8sVP/5
         4Z21kd1XYLcLiCZWCxXwymW1XsCMExn6TanyoL0aT1XTuCcTwgRmkJy8XbkoduC83lUI
         coQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlXukGkDq+/MdokXc1iPI/ypIvXktfKM5ZPeX9Jex0/ttSpxEwjHSs8IdfH1IEmgSaeQUzxZ4dQpWLOlSvDwZbi9fv+7+QsF/A
X-Gm-Message-State: AOJu0Yw1M0F3InjcKty4aGFNvsFgA0PU9LU1RPGbA/IrGSwW3Poh9IUP
	o3b1c0ICBRbRhiyjldZ7P96ii2LQwmFXIPQ8zRgnGh/zE4IHq8C+iIPxqAGftAw=
X-Google-Smtp-Source: AGHT+IEglhe+wLVr2vUr1MIQVumBoAo5/7EbT9pjlwDp5yKvOdUU36tJ3TRsu6Nvsx4qLFShB9NrtQ==
X-Received: by 2002:a2e:8511:0:b0:2ec:daf:85d2 with SMTP id 38308e7fff4ca-2ec3cff89ebmr12681911fa.5.1718796948055;
        Wed, 19 Jun 2024 04:35:48 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:46 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 09/16] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
Date: Wed, 19 Jun 2024 13:35:19 +0200
Message-ID: <20240619113529.676940-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export Zca, Zcf, Zcd and Zcb ISA extension through hwprobe.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 20 ++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
 3 files changed, 28 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2b7f1d05b2e3..4d9b4ed34c96 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -211,6 +211,26 @@ The following keys are defined:
        supported as defined in the RISC-V ISA manual starting from commit
        58220614a5f ("Zimop is ratified/1.0").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCA`: The Zca extension part of Zc* standard
+       extensions for code size reduction, as ratified in commit 8be3419c1c0
+       ("Zcf doesn't exist on RV64 as it contains no instructions") of
+       riscv-code-size-reduction.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCB`: The Zcb extension part of Zc* standard
+       extensions for code size reduction, as ratified in commit 8be3419c1c0
+       ("Zcf doesn't exist on RV64 as it contains no instructions") of
+       riscv-code-size-reduction.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCD`: The Zcd extension part of Zc* standard
+       extensions for code size reduction, as ratified in commit 8be3419c1c0
+       ("Zcf doesn't exist on RV64 as it contains no instructions") of
+       riscv-code-size-reduction.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCF`: The Zcf extension part of Zc* standard
+       extensions for code size reduction, as ratified in commit 8be3419c1c0
+       ("Zcf doesn't exist on RV64 as it contains no instructions") of
+       riscv-code-size-reduction.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 538c404938e6..c38f3f2b8382 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -66,6 +66,10 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
 #define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
 #define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 42)
+#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 43)
+#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 44)
+#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
+#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 04a2ed4ee415..89e03cdf38b7 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -113,6 +113,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTPAUSE);
 		EXT_KEY(ZIMOP);
+		EXT_KEY(ZCA);
+		EXT_KEY(ZCB);
 
 		/*
 		 * All the following extensions must depend on the kernel
@@ -142,6 +144,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZFH);
 			EXT_KEY(ZFHMIN);
 			EXT_KEY(ZFA);
+			EXT_KEY(ZCD);
+			EXT_KEY(ZCF);
 		}
 #undef EXT_KEY
 	}
-- 
2.45.2


