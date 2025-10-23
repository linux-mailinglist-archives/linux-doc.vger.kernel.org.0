Return-Path: <linux-doc+bounces-64313-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06459C0165F
	for <lists+linux-doc@lfdr.de>; Thu, 23 Oct 2025 15:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C67793AE964
	for <lists+linux-doc@lfdr.de>; Thu, 23 Oct 2025 13:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFADF3321BD;
	Thu, 23 Oct 2025 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="cmsoPmt3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6E2330B08
	for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761225959; cv=none; b=Q2Ny0zOE7y30ThVOcaOpRwiRuiNCqW3ZScZoN9g9hIXpmLCxkUl0saU0qErc004rGSL+dHF0tww4XwGyjSP7sy7PkzipJL6VykMtU8HibK7WP/ZPHIKdPJEOl+0DDmZ3RNPTO3bAih9ZGChNgM8fK0zpqvVGd7KaulEBGB9JahU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761225959; c=relaxed/simple;
	bh=zG1PvbsubgVB7UstpLjRtN915FxsRLFbcnYegAn0YwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FilNbgBHpsasY5VDlerKsklkGEE9yvmywit8w4cLFkteu9QuT0seJJQ4TLt/X3uYFy65n2RxCmxKr5jiKkndxaQysH/lZyIPhLx1KcojZTvLatEF7oiej0Hc/4Pl/64WiH++ZBzC0swpwJLWPs4ZnirVFAjswumtWmdAL+pnGQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=cmsoPmt3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-279e2554c8fso7791515ad.2
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 06:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761225957; x=1761830757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=cmsoPmt3WnpHb10/2FNrmKG78VZ9aoLv6vFMHV0rIFxucXIfEG6oFMMHfqXwe2lXlg
         +tCfZb0rKNfPbR+h7sHTJP7JMvbBHz9ECHvBdFWtixO6W6CbiTPbuRhEX5oIA8yydjOh
         5T1mAiz3mkdzeMqKvUFs5Oe8pMYAxGhQdwcwBYKiO8D/ja3uBoK9BV2zWKjOzNQfiaBA
         wX/rFOO4lEEXtDY75tMVINKyxDtMR2GREwtwj3ps/elZKOpfk3ugjY5x+Bby991naG08
         8B1e7XVIGygbl4yXW5Iulp/drEhHWW+0mSu/9WzsjRfoi1zG891nYmYVGNNCNO0Z+kB6
         vfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761225957; x=1761830757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=mvDyXszkwuBE254BHpqGmt6ldthA9PiT8Oxev9bhqS2cBs4XRaWw0jlR6Vrl101o+0
         RC84wqkRAodXm2WAbquZ+rEXBouAzRbncqoi38pY/N9vOeYcz9ZUVMTWqh00JiV98oiJ
         lXP/52mYBwcNdgF6gmAaQa3kINqH6z3RJc7kjhR1xUdpyXdSd87JEn6f6cCkZnmk6nCx
         5Sg+KldhbqwZrAM885UaD4m5nSnbtkKbbHmSwitAsI1kIrkmXPs27huKnF/TF3RL/nEr
         ipdDalz5aPnfQzMTwpr8FBjj6TOPUgF7AAXylFFl9lFG5fiiSaWXknoTcxYcr+l6Boxy
         EUfA==
X-Forwarded-Encrypted: i=1; AJvYcCVzhMzxTJ7J5z6tiUaproyhldE4w/fhED55gYI/6n1cuLPU9IteU3wmldhDsvPzBnCHsAJ74pmj8Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQd5mQom3nRk42ubTr0kzMFvWsW4KNGpwDnZR2YFHFXSQju4w/
	givBZrpzlNck6f/ZKAfDpqobxoa9i3bj+VwbS/Ib52iGi1MWE1Kw4ZPJ3HLPhetHLAk=
X-Gm-Gg: ASbGncsWJsBsXFSFTVIhszH3IYYsrAFqmAeOKiMpfXnd5Uv4boB36FK0ICH/w8j4zpy
	EA1CZNCtcGgHdYlTjyeIJ5I1+UOzXzLoUaP543Uy7xZm8j4U+GW8EBwfX+kgDzvfLRQL7MzG1pv
	VdAVAkXnI2L+htETE9kth1lbWWSI2E99zvExS3DHTwSPnkkKp69MIzs4dvohadNBCGdOuNyE1+f
	OZgYIGZQr8kHQhERbvSWEk2svMP8QUk1b01bJjSQZkY9GkxjaiR0/b6+5SE+NRF4Njmp+EO0t2L
	eVNsLlH+KKJHPzusrn1fdTRBWxVrEJCYXuIDB0alfXtPdwModRWxIzBQTVb1tF5UjsMnlvx8TNG
	riUdQgmnSFuB/hrAnsHKXeLIFiLp8KzNSG9AIijrPOWVdc/IuWvRVI/4eeCpptxWCqBiFsjBwza
	biPAxwvJEyuw==
X-Google-Smtp-Source: AGHT+IHQNsgbR9ZhvUDO+8XIqhhB5S0bPoonwHjZoVYPjQlap3Ktgwx5TRlqv2xhIowva8Uttq5czA==
X-Received: by 2002:a17:903:22c1:b0:278:704:d6d0 with SMTP id d9443c01a7336-290c9cb2666mr309074665ad.19.1761225957249;
        Thu, 23 Oct 2025 06:25:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm23432035ad.103.2025.10.23.06.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:25:56 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 23 Oct 2025 06:25:38 -0700
Subject: [PATCH v22 09/28] riscv/mm: write protect and shadow stack
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-v5_user_cfi_series-v22-9-1d53ce35d8fd@rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
In-Reply-To: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

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
index b03e8f85221f..df4a04b64944 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,7 +415,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -611,7 +611,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
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
2.43.0


