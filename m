Return-Path: <linux-doc+bounces-36921-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BA5A280DF
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 02:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 380393A117D
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 01:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5228222AE76;
	Wed,  5 Feb 2025 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="I+bIfjk1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC0022ACF2
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718535; cv=none; b=qd9LKylDYjYuunCPD0tis/t4BV59NyEhiYr0Q+J/lKLPRJXNjmZ601pBU0EIfva2AWqIVRoppdhMx+3zx2GOXKu1FjN9BaxjgSBh1GpOldihwdcldGMWT/1i/gnDPEej9lbZX8M+Mpi/3mU/FfhnVZAiKpGe2VY/Vv/z2vcpGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718535; c=relaxed/simple;
	bh=d4Cya/UiG1tB2moIkhGHDZ8HTCssqhlwu9hzntgTXwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNjrL78PbycL7PX5K6bMmBv3KqpE/o8840Rc0Y1g0fd+jU1az8wnvSLa1d6Yx4PUCuiDP7VNuMOanIBz4vjgqojjdYddrg7cNseaR6dMwnyOWu8Mb2eCpmN2BG4lu3L3BCVBFavFzRFOjSW/jmpM+eqthtfxCAeYyjWv07WkkW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=I+bIfjk1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f0bc811dbso5060895ad.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 17:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718533; x=1739323333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjuyUsrRmjsdgE2eHiV1ew63cZ7gXvE8Gyqp5e7FHmI=;
        b=I+bIfjk1HpicG4fCzonsfvpWBOxSbVapXLnJVDfgToxhF7ndJKU90bjGHr1XtHxYYt
         sIlrTmtMcWGZN2X6uqNYmjCwugj67OvOCAI9a5kRcXVPbEWgo+XZ+pkJDuEAD8hpTJXE
         PIDjnOMkN8u3wSElyPo9vuW7U6GSDFuNgSy8/xRXHjKkO7Ay3UbAYlrf6b6USbeSh3Mf
         MljvrR5EfiJzbBdi2ZvbnCXSihYhwuUCpczMVuhQLrj2C0z1RYpLoh+JNR2/AKjrH0RD
         2zmT8ngmS6OOGkfb+eHECWOHAqUl9U6WoDybQxt6PniVZV4dF01qwRl6f5xPdznx9CQF
         jI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718533; x=1739323333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjuyUsrRmjsdgE2eHiV1ew63cZ7gXvE8Gyqp5e7FHmI=;
        b=Yt/kLHviFtmgf3CuUTH3vG2atNBy2gRXP+qX7rC8bk6uK4u+fw9nxjhs8gV/HZOLW6
         GJEswIPfxCBFiQO1gD4wlgvl8NU/iMGSTR72QWgy7Y3UR9P1UlCnKRDsgBx7DS6CVTru
         +rZZlTDKuzDciY3/FLcjvr7lbi/T1xvYp+Zx9BpWkl38g+PaFPW5LMLvDua1lVRZhJUr
         rOq7C+S9E5i2vfIXGYAuzBLbAjjXgmS3vyIQXY2lj4yF/PRu63K5ouJ88Es0a1f9nWZs
         vkF4VuwwWcf+QFXUNt3AAqGXqgo1/2Y1cIJb4nlItkLBJ7HSzaKBTuNE0g7db4qHqmIv
         4hQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwXydnpH1RXnIwo0Nj3gydST0ZPFemA4RAo6/FgubQV9k38JgKweQLSh6EQJ2z+eM11/uSbRIwYhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5ML02H4cIlbDtwyheTaOAkqRRS6RexsBuafBcPar1HaVvC+5
	Y6FuWCTcH3lI1gYxNksPMgez3NhcWlKTbx4byz2cVChhsoooQoqBXleRuBklFQM=
X-Gm-Gg: ASbGncsYxP2vMN3Ep72Blt1mTlS2pPW1x/bLYigrghkbq430gjxAEL0ChH9SLFHREUw
	AmKxRdFRRs5dBiV6FnfeBUbYcPsD8eAA5XFx/V90gVKURo2tExnPn5K1MOoUmK9Qdhc5eriWmVO
	Ba8CfwtNlZb3Os7kTus6AQWD4/Tx4MrLQxaONiVmPi89m8K8IK9gi9v4KCEXsHXcRZ6V2yscUd7
	K0kwUvwip8pATFkaF75igWWlHBVivREyVNspY/rscUVdDvfMF6oLCps8zpkTnZ+QJmOxzC00nUa
	aNFuqG4ay3apWaXRG0AHZXqr2A==
X-Google-Smtp-Source: AGHT+IHlwnAptZSky9Y1DYo277tRu5dBk5BHHEzzWIoM+u4E8FH3BeXq2ANIOmZF+k6xGQHG5TCG8g==
X-Received: by 2002:a05:6a00:2306:b0:725:4915:c10 with SMTP id d2e1a72fcca58-73027296652mr8559134b3a.10.1738718531190;
        Tue, 04 Feb 2025 17:22:11 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:10 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:56 -0800
Subject: [PATCH v9 09/26] riscv mmu: write protect and shadow stack
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-v5_user_cfi_series-v9-9-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on shadow stack pages, clearing up W bit makes them XWR =
000. This will result in wrong PTE setting which says no perms but V=1 and
PFN field pointing to final page. Instead desired behavior is to turn it
into a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ccd2fa34afb8..54707686f042 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -411,7 +411,7 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -612,7 +612,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t read_pte = READ_ONCE(*ptep);
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH

-- 
2.34.1


