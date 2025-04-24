Return-Path: <linux-doc+bounces-44161-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A88A9A35C
	for <lists+linux-doc@lfdr.de>; Thu, 24 Apr 2025 09:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 808137AD142
	for <lists+linux-doc@lfdr.de>; Thu, 24 Apr 2025 07:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB949207A32;
	Thu, 24 Apr 2025 07:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hC0kaWUU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A952066F7
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 07:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479247; cv=none; b=M1MtGzng2jpxkwK9yKXc+HphYxuW3qrUFtkWaJh7/VDYUXKeYhEx+/wy5CBLRAPpU8/q6ge0XW0iMHuaoNSWIXKf2Y8X6k3V0Q9m5pafQdwWrE2qCfFGGSnp9qkMCXeJYY2/MUNVO3ZSm5smZ1Cp3VzRYjkbMiHg755AseJNbq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479247; c=relaxed/simple;
	bh=R7oEwbD3/y5k7o3aqwxIBGjnZGUlgVxW90n9VyI9wfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJTwrPO317FcLuusIlMLT+/GqNG8IxYQJlF+UlMuUgOr99MofHi5iQwkhj8jo58nQ1bqP1jNmeBec15eJuDGEPlV1mfjk6m8jGxPfs2DtN2DbbV0sDfqoyeYeAnuoL3Ax8Z+ME8JPNMu2kAbxZQHdoCaPrj91UcOcmKYEIRHKGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hC0kaWUU; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so527203a12.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 00:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479244; x=1746084044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwh9x6lD2MO9lJ//kvPDhOJNTq6ZrmIfW44uUh8vro0=;
        b=hC0kaWUUvw8UhWRSNIv3VogUZl5cUyWKZmn6QViXD2eyqwp4Ov5EEJHafUNWpcedgQ
         bOPoxvR07fIIgDTC7B+pi8+EuSx2ZeioOjg/6N7XZ4hX3qO5MgIA/5zZzONP1LzjxtBz
         zIKnwNx4kPgpDLM19/uy14ebsFN4Fu6h3BV68Zns6GSZwQP9Dboz3fuJ/EBwcO5SAsme
         5ijwjAzBdb5fjt7uVw4XqZd4RrQbiWs6FwHOn2w2eylm1WZXQPpahAQIFD/5JcZ6EEEy
         RP1DmzM5dRhopw2j6ZjPw+yhQJINjT9e3GG9nDHDrBAhLcxQ2Sp3ZLNk0glcB9qCX02X
         icGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479244; x=1746084044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwh9x6lD2MO9lJ//kvPDhOJNTq6ZrmIfW44uUh8vro0=;
        b=MrMKVhLglWVKtGxsMuksFustpj1elN3mgJp1Ksmdvcldm6eydMEB9+u3zuM7YRKBqf
         fc4WSay1CRp+eBX6k3SL/rRfNX6ym2zZXOOlQ2dnOoBJQKhW03ime1TsIOdNhyzzqUfN
         vu4B2Sf50/1A8anUqnJaV1hqNS5BUTFn0zy5NjiPQ0B/Jr/e/d/bVTJjHMBGMboMhvGg
         DEIElogl9JJRaMTmU+ngSDqE1LAgZOXmqP0gZc5uwjPemQrrIopao1SY8FOAC4pfPXkQ
         PKK8WUi/F1lOQMyl4M36/1JLsqNxe1K7eoN2VVE15lg7+dkpbSTWJusJbQ9tVz1NfwAU
         Tweg==
X-Forwarded-Encrypted: i=1; AJvYcCWbj5yF7jGLen3U6YeB9RDwsN57NN+0pyUrdMkcUn94dk/9sr0W0rbJQHHfeymc7Hj1WYYuXpkz+ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxpqKXAIXdFWBVttlOUth8ii2mRFqkV7eUgNu9FhFsCx6gvJc5
	ZemhEQQg3rASKonV2iZwRVaxfNenWHDFN/zZqtzDJ9DHRHpwzsLQD8Qrs08+7tbJJ9m3lBcrKZ3
	Q
X-Gm-Gg: ASbGncuuwDNyrb2e7usMN+eZtKLsJxv7bjfsQzjEW9HtHk9LkszUKfjrvv5i13hFWZN
	Vq10QqPPmohkQy/gdH8UvW5cl++wm6DJTf4G22vTTWvHqbPF5sYOrKwixt+1MzwafKNgtN1NqHB
	m0x9Ddls3i7AETZEkBF10zX6cOF27bZtsJHh/psnVnogAG44kNbECVIyfSN+Q1yV7O9FIXSsdLc
	f09w5AIl8zZC0u/kvanvFEoIa1m55GoBF7T6LOdXHmfeO1zdV6ydlUGaqfckcDqT1KTMGDHp13t
	pWNheSq8pvukZnYkPYZI5U7+zyx62vUM+U+POsy5b7eqRI52trA=
X-Google-Smtp-Source: AGHT+IEC5A9t3KljY5+oPEDMiuLjjOrgYWWUXALnuXXsSvtsWmrcbar9Dh97NMWpjDuX0nmNsvCGcA==
X-Received: by 2002:a17:90b:6c3:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-309ed31aeeemr2671578a91.24.1745479244474;
        Thu, 24 Apr 2025 00:20:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:44 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:22 -0700
Subject: [PATCH v13 07/28] riscv mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-v5_user_cfi_series-v13-7-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8c528cd7347a..ede43185ffdf 100644
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
@@ -749,6 +754,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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
2.43.0


