Return-Path: <linux-doc+bounces-40893-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F02AA61EAE
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 22:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7F0D463037
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 21:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841B0209F53;
	Fri, 14 Mar 2025 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YiIpxgzH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D933206F3E
	for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 21:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741988393; cv=none; b=tAC+8t7c7d9bgmLRwxxkd0Xk2j750OxKa/+KCsP93BPgAc5J5lbC4voivEQ62OuY+vAKjkreXeANTHO0JTa1XONajx9unVId7bKLXLDoJst3STjEwpyOhPZT1g5M23UmKdBL0Ltg+kB1lJHmkmosoorWOdve/wL0Jq9ifBh2/5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741988393; c=relaxed/simple;
	bh=7zfZLJ7M+OWrE8KdRCq6y8BDi4FBVzklOgBAPWj0EFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gMnd3N5Kk3Dew7ivCGikw1ETDODcGJiJ16W4P5euvha4n9tLTYsojonHcpIdpEhWplQhNroUhpmtd1y1F89P6oArJMsTLjdFYJQdMw9Kl4wjAsNNNE8WxEIFVNjKiBL6xI/oOQEjwSb1SmXA8yp+AX1jaoKL0hj8U8GD7vkDtmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YiIpxgzH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2232aead377so57922215ad.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 14:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988390; x=1742593190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XcHZdxwrXOxfjvym0f4ldwiX/cDoifADRl7Uwkj6t8=;
        b=YiIpxgzHWrddDU0fM95rJJoaG8rMVye8XwTyr7omjfn+ZXGm4Z4mnbpuSy78fVXVSf
         C8tuyp/+YRzYF9DUfmmeIhzGixZ3qEzYAvk21Ws9s0BG8P6yh+pcWn4/LNjUzScys6Qq
         54BI3znm6I9PK+Oom1NCn4H3sQlFjCv8te/Xy26h/Hu4XSw13I/YbL0RL/gDR8QPAag7
         l6i78Oh8WJOtsGYoJNeW7yXDtruFCjI/7X7FlhwwoHIBeukGUm9I9X/ZC0WBejj4hq+f
         VoSdeGVrCh4LdI5jMq7P7BcmiPV7bcl1zCo77okDRpawPOZ688k/4xrtYopi83bzBl5D
         eXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988390; x=1742593190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XcHZdxwrXOxfjvym0f4ldwiX/cDoifADRl7Uwkj6t8=;
        b=hgCVEiFfMR125Yk3ors0y95GIABvhmjGP6188iENjJH7A3JyXu+4v41fduViKnGNGe
         ESTZvraMeez3j5bNsenBY0+QZDrJ8A42qr61cHR2f9CxUvLZP4SB/aVp9pizG0mD2cVg
         SvBbU6YWniGN9OKLpdvyInHQJ9SMZzFUuU/IzG9Zt1zSaTaJl2yoS9DNE4HtPQ2tG7LB
         XmLU8aqu+f4JWuqnotVJ9Cm5TI5EIjbB7KtG7BnwzFSfNc/Zt/FlycmOPvxsndPiB7kj
         fJjaJ6+RkNgbxZUDbMefkiGbFmUnqsKWx+3mhWoJoQ2d+yU7xuPW5qNZNvV//PaZkVji
         7y3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjU8Lh6ZMmHqwJgDpyaPlE8NJxfQUAEuyygXJHCLaMtK5PQ4grY331Xtce+rHM8WHSjGeZcZ/TevE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVe0zo07Icx4/LBmUdaL5vTIH6hOpFjSQYnWvskTDJyE9yXASH
	/bW2jKwmTEzTk4xvToQDTHC/z6rsPecsPLkdT+2CSz7+LAMUBqvQqhvCfBsAihU=
X-Gm-Gg: ASbGncv4ZZ+sNcG8NP1+gZCpmYoOYRCiLFJpFocPsgV2zCY0LQCu7BmPFkMdloGfRXT
	FmxlCI3xFdxidalX8s17tExqKzhQ8nfVuFiulAk/Tz6NTkU3LFTT6VoI1NBRVdIIXxCcppigWhu
	z1Ph/xTrXWgjsf4WR1jfL6muIiCzSZ66M5HyK8Tla8gdDEvEQOwPn87ry0Ev6BcZqmjOesZM7Hf
	TIfMtBlVw0GPwTvQqCSUPHAx4R2HSos3Xpv1vGxYyfQsIezmxwJuNL9kgQoFBPKBda7Gv3/ETCp
	sWBjTh1kL4J89+tO3xlUV/h7X4SNk62hogc92www6cfxJort9GXzfpQ=
X-Google-Smtp-Source: AGHT+IFpAfWeI9aPllc1CwqYl/66ArnIXE3uKAZ+LvLNawWnKsDtpPp8xhAGnGFewoMM9kaYyptgHA==
X-Received: by 2002:a17:903:2b0f:b0:220:e655:d77 with SMTP id d9443c01a7336-225e0aee8bemr51023205ad.36.1741988390643;
        Fri, 14 Mar 2025 14:39:50 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:39:50 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:28 -0700
Subject: [PATCH v12 09/28] riscv mmu: write protect and shadow stack
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-v5_user_cfi_series-v12-9-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
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


