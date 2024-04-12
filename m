Return-Path: <linux-doc+bounces-13954-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A198A26FD
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 08:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9BC01F23DBE
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 06:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542E1335D3;
	Fri, 12 Apr 2024 06:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EfP5Y3JD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91DB48CF0
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712904552; cv=none; b=f2tmd9HzDsolK4LwofjrS4VBFO5034Hf17K20d1+iQGWldJNKGk0xUrHdD0DLDGlvGYrb3rzQmCTK9sJv+2EcQf2WUDw28WpkPw5KmEL10NrwbQTJcnoOc734lZtJKLurGEujA4Dq6TISVpDTIQFRN8cNpGJTN37wXY5v80ut7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712904552; c=relaxed/simple;
	bh=NsUylxIFobwN7mTvqQ5dHkwxBlT1LzawwF+eu4628ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8QaJjHNqdnTyQ0pJ9/z3omqhhIPl5R5xQzQCu70BPudRLDojPPmQ3Z7WMf+wlvX/iwZf4xSF05DbTbQf7Tsm/qOSdsTLgCR/oqAf84CQ+harQpRzN78KMghrqIn64wn2y9Zt5hTeF57xKUFy6OTMQ5JCO1VM9JdbMjlFa+oli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EfP5Y3JD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e3dda73192so4557905ad.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 23:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904550; x=1713509350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IE7PNdtEhi9KW+zIWld3aHVp99xlyaQhdGOlf9pdhFA=;
        b=EfP5Y3JDJcAe3tp3DTSUggpyZaJor/q98gZCEQUdgAz2B742tFl7gL6XB5A8jPl83X
         t/cq5/mYqlupYPA2nkkEpGi58eeWbDOGCxgJHkkun7ryfQxJ6vDhrSVUVKci8XR5ZST0
         pNDXJHSW9aaZUQeaIosZ3lsU6vbL/4V0ZqG3HhDPStFEQK2hinQgXGdMDRttpm4R9Vmt
         lcxA26iVYR3qfUH5yyNDQf6j8/Yz5aGXwVa8FbV6i/pRDzPWzeKwpJIpFoZkeBsFOy16
         AsD6uyniZIXyAt8ttgQpv9CWkodxziNibHSHr1pM6PyfjaMUQk60nNtsJ5J+KsEdGJ0q
         wN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904550; x=1713509350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE7PNdtEhi9KW+zIWld3aHVp99xlyaQhdGOlf9pdhFA=;
        b=slJKlRVeCViH5nHs188dEbiRINxbP/W/NHMp94aoa8/TnXuj11Ytnem/sMUBq3CQve
         7oRgDz8kgcKf1H4GbVksCxwKOOBbY4XW9x6LxWboj1H5XSIbGmVMsQout+gxPXPHMkIB
         iGjNejD89pf2s0YVWkWomSmlg4a+Lt4U1C4xzdyfSfatRIT+f2uBGgUXKK9uSC4alVSf
         OvPYKjC9GHZ3Tx4MGo14nFO1flclRWVYQ8P2Pkz5SnEeWARC9VT3qr/sX+cRNydCQbGT
         Aix7G9uS9P9+Ahok5oJV7m9tXcpAp/uPXzzJhFAwtvUSR0OuhIl1rVPWUPG5o2mVBwLN
         bEvg==
X-Forwarded-Encrypted: i=1; AJvYcCW72Sbbt2fydIkBgw3EPisc4Rw5mWY7VhAQxFAEuROSeBNFz3iE37e1E7FghGQ2f/HUKplDeHl3pTDZCMaiApdiDQFuh+yZDzVb
X-Gm-Message-State: AOJu0Yy+Y0iKsNUNVsFNUM+nrtlrn2OIPjLWvYUXNyYRmz1AjkeSKsL9
	GTkuihvBoQriP/uY0FUjuQwtZPsh9dUOmzRzeXU60U82dP+b7dEg66u1nqJBswQ=
X-Google-Smtp-Source: AGHT+IE8CTAbzbIbDZAwGKJBJYZimAcWW4i3f7cikqAXGoGmEwow1T9cytWYxzK5BB3Uu6leAZrAPw==
X-Received: by 2002:a17:903:1210:b0:1e2:adad:75f4 with SMTP id l16-20020a170903121000b001e2adad75f4mr2046388plh.28.1712904550318;
        Thu, 11 Apr 2024 23:49:10 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:10 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:48:58 +0800
Subject: [PATCH v4 2/9] riscv: smp: fail booting up smp if inconsistent
 vlen is detected
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
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
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
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


