Return-Path: <linux-doc+bounces-26131-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470DB98C290
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 18:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED1A72859A3
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 16:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0B41CBE96;
	Tue,  1 Oct 2024 16:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="R3G2S/uv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EC91CDFDA
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 16:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727798854; cv=none; b=S3X2LIJeWXCEISLGxb+Lp1BNqp3Y5eSGhQgBBAc9J7a4HERIN8PassgcAatG6+SwDaT2O6Q3sPyu7wVX91gJ551MAxKccAUJMc5uex8NqxGtW8meXvvMahRGxgYBCZffebnU8RrmXvq05VmTdpafphpgHxOnH1/eqMpdCtIsXmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727798854; c=relaxed/simple;
	bh=0P0H7tyzucv3KISYxlKm6qbY67oBbop+zQ8AHryx3GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eTgqm8jRt6GrCz+EYnHSVgNZMtKPg0NJJZcsv96lhQkjE1aAYVffcmZRhZdMATmhLJHcGtZuOF+bMM5X28QraWxFx/BPUb4xbFq8UPgJ7tkRqlB5wDs9uHC7bXO7+6m2Me6fvtXfV0ip8ubSuM3C45oFefOF7dPFRc55UfUhAhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=R3G2S/uv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e0b9bca173so3404464a91.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2024 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798853; x=1728403653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvFaRabdOYgj/FaUxHA5lpjBxuSoaWHPSkkVGjDU8NY=;
        b=R3G2S/uvOFDZBl5pLDC+WWBYGEfPbFhi1qD4GiaxGCxeGAmVgPU9t4cBQi50L1n5qR
         iQH0hheTLRXU6hjf+UrnY85FsKzz9Ar46gplx/PmFXZeTit0Z4cvZ/jZPKqZBSUuL+Ep
         6AOCg4gRYPPh8Aca4BojOunksW7mp+iJa0EAVVapSQwpzH3hHgEUlRbOsRvdoYnh+sz8
         cmw7Ot8QCovLNyLxSa8+UzogNZa68QVOjACr53BsR9N1rkBptUWCheABDV5ESYMr1KGK
         Gu2RlmYR7NUvUJob6pvhWH9G7ZfhIvjSy5eq9QLaZEpRisBYdB1eBOQdiiYVB7JHdRaH
         M8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798853; x=1728403653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvFaRabdOYgj/FaUxHA5lpjBxuSoaWHPSkkVGjDU8NY=;
        b=uflhnA/M3V5vUuM6SnQhaZJ1rYqrNK1TjjkBr+2Uuqsce8PRQfLWaFwYSwuryP2nJ0
         /EdmnAn22AsQZYV82qtVC2NHIM6X1OkJT7jujxigAUG4QOXYeknQybpEXJKEtjYuYh6l
         Xo2U9X3IEOeCGvSeSaQfe5CTj55tD6XSEpRmIo15OZlrFp7paa1lrhrrLm6NkZmN9Vps
         TCRNI9ENinhJ5MsljdWmqUWPpqyvJxv9hwgoC00nBCJZ5XYCTtc7a0mQ8ed+NqJaFU61
         j/8H2P/QU4BPn+7+VEHa9wXMdc7CzqfqoB7iHiD6zHuXk6EPGOe/Rfqz+d4wdLqPjbxL
         geCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMgFDSkHudY5hFIoD/TKhh/eS0eg9ar0NcogwnTo3rfJKlvix4ynXF8jWJkieGDZZ86f6qsYDlBOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrtyNVr96KjuB81HsUr9rWCei+3Svrpx1pLKXC26u02zwQnl87
	e6O1ldsvEwjc26nnG/gbkM/eLbcXgSNcbKsS0QI9rrlQD8kb8pEXiqPUH+EKXfY=
X-Google-Smtp-Source: AGHT+IG9catzJvE6iZhMcet9lnrBEGB4mWrgVfEl6Aw7Bwjo8k2vC5A57va5s4Xp67KUnf9ZyIG6qQ==
X-Received: by 2002:a17:90a:ba88:b0:2e0:f81c:731f with SMTP id 98e67ed59e1d1-2e18481a282mr222726a91.24.1727798852879;
        Tue, 01 Oct 2024 09:07:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:32 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:17 -0700
Subject: [PATCH 12/33] riscv mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-v5_user_cfi_series-v1-12-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4948a1f18ae8..2c6edc8d04a3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -421,6 +421,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -738,6 +743,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.45.0


