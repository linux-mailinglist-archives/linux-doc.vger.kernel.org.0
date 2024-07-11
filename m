Return-Path: <linux-doc+bounces-20555-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A194692F172
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 23:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D4EE1F258A1
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 21:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460171A01A1;
	Thu, 11 Jul 2024 21:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dDS0T3lD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD3F38F83
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720735163; cv=none; b=nMlKGdDt8tq5ou3AuEvvN37bBiXcB943YoYe3VLf77G2DdpHfx9W2eVPSa2mWgJD37m9ttzEfBdA49N+ODecbPVeFnQjij1Y8qBj3czod+qktVS3lH3BAKRr8P0gVactKV7udlW8fgmarhpb1MJEWeprIq9QrygL3hyLXo4iIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720735163; c=relaxed/simple;
	bh=NeaoRhZkFYYgiNqKFbS/dAos7KPcJHgvAQkdo5ndd3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTJacvVH4Q6DibqhkAH/0W1IUJsx99c0JNFAM+SkbCFaMUizaGIYqN9ghZJHZT+zmvmwrwhP3sGz0aornTMXzSuvrkdbpeARkfuQNjMZ+q1TxlZMEBvKLnM1pmkQXBFYBR3qt6skN1xBTIDrFcXcRxEMwgxWydX91LS6ZBWIopk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dDS0T3lD; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-78135be2d46so1067653a12.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720735160; x=1721339960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTFSqE5vXy0qV3DlEoEXLdFSwHLEQLaBDzVSc2RdwhU=;
        b=dDS0T3lDSXXpURxn1Wct+w+kbQ1aP+XKIM5aD0qOynah6MnwV843ld/uykMgJhXyDa
         kEHyKYGJNnwamFCrcpaqmPsJOSWiSvQSSn8W31fjHn7Do9yIK8e8SdmBxCcyi0S/e8cM
         TeEBSq+DA61mxo+UcvWcC6IPbssXMiVrtOv5NtX468Kxbyx01LS5t7460lR7XfOe9p+i
         HIX+RpJowRUY5TA4T9I4Zjuh9BwtV/WztZK5PWdFYEAmv8i7KJzngv+63NESa+zFWDMc
         Miyw6RVXq0WD9Rnfqw9fHsYM82IUSBqedlorsv9EDXJF+W5R8mu/Bmyq4qXhL30fGVkO
         Yh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720735160; x=1721339960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTFSqE5vXy0qV3DlEoEXLdFSwHLEQLaBDzVSc2RdwhU=;
        b=QRxxJRqcgqZfGtt/1lHl2/DqfVZikg2YHPlHNZZxUoLVzXV4AMQmYSqoFFh+1ArMOB
         zYX4RXUy7olLFVyuVj92Tp5cq/0s0LeEe3MdvBQQ3/SnjJfdx+G1d8B0+9qrXS5ggC7K
         MoqQcGFYXq8LcmDzwXDtIX7eqZ3+xNhm+doOzDUZlXUy/yfPDwGHOE2TU3Cf/QDouShY
         YwXnQflSGvS/eVYotyu6O3LC8jyIqXWrdB0Uf17DIhK7PttI2pYf37o5CLV4oqGaG4+y
         YQ41hojBruJPh4/JxZ2UAEhlrKb7Pn0+YHPtAlZkmOQPT/loEIXpxp3Tq9DgkJoMuS9f
         0PdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHzU6nvLNLoRDz5ADVgTa/ciWawMD31VooY6g+T/OkqBgZUkrfqN1Wv1Dxwu2zmc7b82a46i7i2sX0xWIm1YrJVYrQb0ojxuY5
X-Gm-Message-State: AOJu0Yx8mEtBV06npNhODGUeztod3ff7xxaKxfGsFpX1J8qYpLihyUXT
	2F2TUh5V5FVY3l7/BBN74B3Im63iZCpTOO5PA/OMJT4xskyAVy2ToKfmYfhUO/Y=
X-Google-Smtp-Source: AGHT+IGCwJ+t1NC6qyNtNLRiaDb2n98a8LyyAtIvv0vVOkIfTf5qGEYfkG/WakD3ua1QTyvV7XHDWg==
X-Received: by 2002:a05:6a21:6e4b:b0:1c3:b211:67e3 with SMTP id adf61e73a8af0-1c3b211680fmr4178031637.50.1720735160398;
        Thu, 11 Jul 2024 14:59:20 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b43898b10sm6169431b3a.7.2024.07.11.14.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 14:59:20 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/7] RISC-V: Add Zicclsm to cpufeature and hwprobe
Date: Thu, 11 Jul 2024 17:58:40 -0400
Message-ID: <20240711215846.834365-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711215846.834365-1-jesse@rivosinc.com>
References: <20240711215846.834365-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Zicclsm Misaligned loads and stores to main memory regions with both
> the cacheability and coherence PMAs must be supported.
> Note:
> This introduces a new extension name for this feature.
> This requires misaligned support for all regular load and store
> instructions (including scalar and vector) but not AMOs or other
> specialized forms of memory access. Even though mandated, misaligned
> loads and stores might execute extremely slowly. Standard software
> distributions should assume their existence only for correctness,
> not for performance.

Detecing zicclsm allows the kernel to report if the
hardware supports misaligned accesses even if support wasn't probed.

This is useful for usermode to know if vector misaligned accesses are
supported.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
---
V1 -> V2:
 - Add documentation for Zicclsm
 - Move Zicclsm to correct location
V2 -> V3:
 - No changes
V3 -> V4:
 - Add definitions to hwprobe.rst
---
 Documentation/arch/riscv/hwprobe.rst  | 5 +++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 9 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index df5045103e73..78acd37b6477 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -207,6 +207,11 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZVE64D`: The Vector sub-extension Zve64d is
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`:  The Zicclsm extension is supported as
+        defined in the RISC-V RVA Profiles Specification. Misaligned support for
+        all regular load and store instructions (including scalar and vector) but
+        not AMOs or other specialized forms of memory access.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
      classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f64d4e98e67c..0b3bd8885a2b 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -86,6 +86,7 @@
 #define RISCV_ISA_EXT_ZVE64X		77
 #define RISCV_ISA_EXT_ZVE64F		78
 #define RISCV_ISA_EXT_ZVE64D		79
+#define RISCV_ISA_EXT_ZICCLSM		80
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 2fb8a8185e7a..023b7771d1b7 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -65,6 +65,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
 #define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
 #define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 42)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1d6e4fda00f8..83c5ae16ad5e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -283,6 +283,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index e4ec9166339f..e910e2971984 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -96,6 +96,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZBB);
 		EXT_KEY(ZBS);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICCLSM);
 		EXT_KEY(ZBC);
 
 		EXT_KEY(ZBKB);
-- 
2.45.2


