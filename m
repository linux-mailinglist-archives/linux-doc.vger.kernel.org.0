Return-Path: <linux-doc+bounces-37654-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE1A2FA38
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 21:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2696016835B
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A622586CF;
	Mon, 10 Feb 2025 20:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Ll3+ZyEm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C61257ADA
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219227; cv=none; b=F4KItwMgGtGL0dfbbO6Hdvm03fCjziEJ0/rqVpXKsTPEzbFTszd5j33tGOsyAc9j0FfyDfCEd27F6wpw9YewnM5x9I27ZBO2LB/Vpn0Bg5BPaCdMNnVWSbfjE/5e3yk7xwl3+hiVflVrH0wViB5qzCVsky1HjJ+cMgUwH4U/ZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219227; c=relaxed/simple;
	bh=e2JFB4Jy2B8PEfrSQ43O9FncAUYVFHD+Rwfp/3fLFok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfMMFtECkIpSiXL86A7sHTXxtuVPV1sq1lV+5QiJMJ4ou6TzqRibv326/LydlilzXBB87usdk69zNFTKhn5SVtiCPmTYz1WTRDYObvZiGj2lQ2UevumB4WJalT73JrMCCTt2fqXSlDyZ+W9ebQWJpYwX+ea+acKzlb9QGPbDz2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Ll3+ZyEm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f6d2642faso58708305ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 12:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219224; x=1739824024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kL+yIoSlkTX0SokBaTv1DsPGjl4jKUPC0i4GBiCWGFY=;
        b=Ll3+ZyEmtUbP+eDX8EcdA33F9dF8V/msXOHig307eT9gKX5lx224doanFu0xM8KYnQ
         yq1nKT3FQ8g/0ioIOXkTfn54Gq3fCQ7XWKudJmoA5bWC3ch+fpRbpNIgDKLU92YW+6ec
         oCBVP0RGRAt7hG4Mo1lMCBdcBdcxPkHA/7MIW86ZoKDrqDpcsUCR7bqlIymLvgRNtOxu
         eOCGEYOmSWa4nyH1cdwiws74k2zKrEjy5bYscZ85pECnK8tXHEP/cSKkXqd6poZ020gU
         BBaUTF/ZYTIEtgg2E5CcKAf/VhhvxQ+ot/lPcDIZ4ndcm1YrsrUZJab7yevaaADBISu9
         frmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219224; x=1739824024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL+yIoSlkTX0SokBaTv1DsPGjl4jKUPC0i4GBiCWGFY=;
        b=kWTO1Q//cmb+tWkw/U2aTDzmdsUCoDuvwsg9kjxvn72danRNlwfJWreoV77kTE5hyq
         eHAjq9ckNlX5qOV6iC42lR2TC6pmdH57Pe1ExKxFd6HrB41gxSlRs7cUv2O7BGLog/bu
         fKxa7trET8fXOlfmoGmZJh1opeORQkHv7wb2XxI09NHTTCKmE4XZtPT4znZhF4HE3s6I
         sLrvB47DLwvklkyUCbqnVK/WM/+8ix2p9KdMcf8moTTRXHDixt/Iyot9/wp50a9f7Nrt
         HBCcSjCmHVA4mwM6p+T29l19x4M5spgLPg4WcYIJhhMFxANB0GeXSRl2AVHvfD2IvSpp
         hSgg==
X-Forwarded-Encrypted: i=1; AJvYcCUcNPRvF9k3qdRUjjFAD2ewMPlmkM6+PPTNV8Xt7VBre+vaYMHjAKaUpsZ9RAs/9QQI/+RWghh9vp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMHaDHLU4HBaee8gdMD4orzoeXN1F00aKo4hWAX/FozVWOkXO
	IuO9fAvyYGBT7zWW4Rz3ILCWoj94EeGt1Ex7e0Jew0GFJPsSzSys4wWPCZH7VPk=
X-Gm-Gg: ASbGncsxe4vqGAgt/6shA2J+jJRZWFQhgsDo2CnBWJ0fiMM+jTht2fkL746pPbMQwxY
	4TAHsyWQ5bwGfrRO9XNwFiyZP3UT3Li+goqxlFmQye/IXUhG4+bbHmVDc3hTFKfVBcfeXpx3xhx
	y/Kxc0c/y3A3q+lNN5JAZo0s6Q7v4I0rJDkCVsHCjIMCgYtkD5JOKq4CI7PRbJnqypblkNwtfIu
	8qnAQJWNbGSXUPJ1aD77JZ0U6ytIpeg7HGeAKhJzm3MF4NXc6JFA+SxgRQWjFdkRk41Qbx4IRX8
	dCMIPVTH/F5/0qvaEnmalaHWYg==
X-Google-Smtp-Source: AGHT+IH51GCkumMcFJPAZ0u0Kjg1gihjqDbfZuYLpqygtJdnaOIjAF7ExdTAshwwxxeYa5aWxibyKg==
X-Received: by 2002:a17:903:2282:b0:216:48f4:4f20 with SMTP id d9443c01a7336-21f4e6bf3e8mr230190345ad.16.1739219224426;
        Mon, 10 Feb 2025 12:27:04 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:04 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:42 -0800
Subject: [PATCH v10 09/27] riscv mmu: write protect and shadow stack
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-v5_user_cfi_series-v10-9-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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


