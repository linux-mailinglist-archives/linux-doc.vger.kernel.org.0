Return-Path: <linux-doc+bounces-16098-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD278C12B7
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 18:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A71B8282E2D
	for <lists+linux-doc@lfdr.de>; Thu,  9 May 2024 16:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5E817084D;
	Thu,  9 May 2024 16:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l9+fwEGr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB5F16E893
	for <linux-doc@vger.kernel.org>; Thu,  9 May 2024 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272053; cv=none; b=qBPcuGDT4p46X93f2ZSUBzv9zJrRZ9RC96IoMo4G2r/Tw5wOwq02uFKrwGsCCO7CMiRvqeji4jC9ReuyBVd1efaoCnBj4lXCNX/23TXZKeZKTi9P2R3fhMpBQLu6orCC+IfKdmCrrz4kFme0bkQvoO+92ymsB9uSMQ4wkfDctmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272053; c=relaxed/simple;
	bh=j77Tw75idPqnKN46bj9iqg1hk2k8cqdua4UmgD7kwl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2QYq1mRbN8yYZgFjifppw5PqCSO2JDa+TyuabjOCgYO7wm+AN/22VaEvRN8uQodT27hOagtU6sirjSjPlpHbHs9h2CFIAL/kygHgwm0339+GqpDcoOVemFPvyBazHhwNw/iWMouKFhVX5dc1P4BndgyYg4Ylx/RuM5bkCt/P80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=l9+fwEGr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ee7963db64so7801985ad.1
        for <linux-doc@vger.kernel.org>; Thu, 09 May 2024 09:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272050; x=1715876850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsGZj+6+RwBmlu/KXoHPz6YMlsBFjDj3jnnuVWHIhdk=;
        b=l9+fwEGrZxbJroim7VJZfIEUiQJdKsmrbfmw2qEYCUXgoERrwgd4doU3URaW8qevGq
         5qY7hF8x25/GX8e0srVmPbOHcE27NblQ5gX1xOazAR2ATLThlBK9pdEtYj3NaDn7lhAh
         eTULG5KrwcHpKOre6melkYigK5ml+l33a5cBo+Ewja+miDuWu8FbSoi2Ii02jX3cImLF
         Z7tppiJQ5me1kjWP9CNojvR+TFBJg2Q2XGuo8YgOCmdMF8K+UxoiAso32MyxkJXLPylz
         JcMJOvfdnoG6gr77822ZAugQSPnYJhOe5amHr+bYV02+NQD9uQIL/zIB+F+/dTEEx6jm
         cr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272050; x=1715876850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsGZj+6+RwBmlu/KXoHPz6YMlsBFjDj3jnnuVWHIhdk=;
        b=YaCUSAdWwn860tMptxziF1j5j6nhjtlERWm2lcjLebSsTcLW9tC+1hRP4HcW0G+4m1
         6XHMy2IRJdmhMhTna/ObrgqcgnSRrmS88BWiJ/gWci+0yr/Mlzi2IbGBkPV8ki7kvQNt
         w/8PrER/ElFDqWAdaSG1BiKCGPNsiMvnMmlrvoz1AY799rbBu94Zyc24JicxmJxNd89r
         0jadlPR6elNrMqxUhYJrujSjhUcyGRCZVUpcHie6hda2kZk78nVFBRJKSQdWxsYzjTVV
         MHKfyjzxafaWO3TKAgQ46esAfPaAnjg5AKZ7vqIh5eLdxvzbHC96ASnZdCPU1kKM8vor
         5PGg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Hf7iVpoAugraXqAudty75R3ZkhuWnnDhnPbIfM9jUbe+0KiYcWlfGgKUHqKOu7D3eZKhUy0oYSz1MqfKVZu2x2j8UrDN/OtE
X-Gm-Message-State: AOJu0YzX9LhaF0Ns+ogzOfnLw5qhtv2cXpSy5bA7p9J1O+sLDKft47Di
	VGiUo5X9bDISgfnyp6m0Pm86bbnUvp95xNA+K3bciL8dE7fIjF9j03qE7aDCs5M=
X-Google-Smtp-Source: AGHT+IHfn6hT/473i2wtO2K43xZtY/ybBEPEsMcrOoIPQowXqA7gpNfiBN0DjkayLmip8ShtXDqthA==
X-Received: by 2002:a17:902:e541:b0:1eb:1af8:309f with SMTP id d9443c01a7336-1ef43d13820mr1827245ad.4.1715272050172;
        Thu, 09 May 2024 09:27:30 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:29 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:52 +0800
Subject: [PATCH v5 2/8] riscv: smp: fail booting up smp if inconsistent
 vlen is detected
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-zve-detection-v5-2-0711bdd26c12@sifive.com>
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yunhui Cui <cuiyunhui@bytedance.com>
X-Mailer: b4 0.13-dev-a684c

Currently we only support Vector for SMP platforms, that is, all SMP
cores have the same vlenb. If we happen to detect a mismatching vlen, it
is better to just fail bootting it up to prevent further race/scheduling
issues.

Also, move .Lsecondary_park forward and chage `tail smp_callin` into a
regular call in the early assembly. So a core would be parked right
after a return from smp_callin. Note that a successful smp_callin
does not return.

Fixes: 7017858eb2d7 ("riscv: Introduce riscv_v_vsize to record size of Vector context")
Reported-by: Conor Dooley <conor.dooley@microchip.com>
Closes: https://lore.kernel.org/linux-riscv/20240228-vicinity-cornstalk-4b8eb5fe5730@spud/
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
Changelog v4:
 - update comment also in the assembly code (Yunhui)
Changelog v2:
 - update commit message to explain asm code change (Conor)
---
 arch/riscv/kernel/head.S    | 19 ++++++++++++-------
 arch/riscv/kernel/smpboot.c | 14 +++++++++-----
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..a00f7523cb91 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -165,9 +165,20 @@ secondary_start_sbi:
 #endif
 	call .Lsetup_trap_vector
 	scs_load_current
-	tail smp_callin
+	call smp_callin
 #endif /* CONFIG_SMP */
 
+.align 2
+.Lsecondary_park:
+	/*
+	 * Park this hart if we:
+	 *  - have too many harts on CONFIG_RISCV_BOOT_SPINWAIT
+	 *  - receive an early trap, before setup_trap_vector finished
+	 *  - fail in smp_callin(), as a successful one wouldn't return
+	 */
+	wfi
+	j .Lsecondary_park
+
 .align 2
 .Lsetup_trap_vector:
 	/* Set trap vector to exception handler */
@@ -181,12 +192,6 @@ secondary_start_sbi:
 	csrw CSR_SCRATCH, zero
 	ret
 
-.align 2
-.Lsecondary_park:
-	/* We lack SMP support or have too many harts, so park this hart */
-	wfi
-	j .Lsecondary_park
-
 SYM_CODE_END(_start)
 
 SYM_CODE_START(_start_kernel)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index d41090fc3203..673437ccc13d 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -214,6 +214,15 @@ asmlinkage __visible void smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 	unsigned int curr_cpuid = smp_processor_id();
 
+	if (has_vector()) {
+		/*
+		 * Return as early as possible so the hart with a mismatching
+		 * vlen won't boot.
+		 */
+		if (riscv_v_setup_vsize())
+			return;
+	}
+
 	/* All kernel threads share the same mm context.  */
 	mmgrab(mm);
 	current->active_mm = mm;
@@ -226,11 +235,6 @@ asmlinkage __visible void smp_callin(void)
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
 
-	if (has_vector()) {
-		if (riscv_v_setup_vsize())
-			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
-	}
-
 	riscv_user_isa_enable();
 
 	/*

-- 
2.44.0.rc2


