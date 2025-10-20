Return-Path: <linux-doc+bounces-63945-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DF197BF3682
	for <lists+linux-doc@lfdr.de>; Mon, 20 Oct 2025 22:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5B2E2341962
	for <lists+linux-doc@lfdr.de>; Mon, 20 Oct 2025 20:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4490E3346BC;
	Mon, 20 Oct 2025 20:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="XPP/CeFm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00752333751
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991776; cv=none; b=Zif6Lo4xuuzg8cOY9MTNEl+ISUmAeZb+a6mcquECxyMemlEVaLEjbyJ1vJiQEpFewmCjtpLW811kQOMOCbWfea03IfQahm121XLapHhMshlZ82LHruNJK6VqWxSsNudMgP2K96s2KJexL7QZ9tB4VZc/p+WMQd8si6QkxBLkPk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991776; c=relaxed/simple;
	bh=w8K8YWqvQ+k+ul0JfJs7USW+kWSgKZqY/8VTLLDGvdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6/Zp+ucmcMlJdPas827rQoKQP9MRKPC/ojd1CI/nWQPO9xT+eRcM1CGUzW08XEmfsiV4/7qr68U+iMcoIUuqmrtFkncLkshK6YFVD46wj9F6VrvavFVCnUS4BLfvbWQJIzo4FQ/jSYe5F6T6qqDECjUZM0TPMmx9/NhpQSRCx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=XPP/CeFm; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781206cce18so4889359b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991773; x=1761596573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRwldBzHIQH4g/MXesqTddRa2wH3mKxscowbsdJ3rFs=;
        b=XPP/CeFm0Hi/WJJwiw1rXrmau3NkKsOl0GHaqNM+IKyIRfn4NJjHR/qC0HdV4s0MID
         N5d3YzGxOLBfFKGCa3ZGtVRFW7qk8TnpAjyDIPgZ95xkYyIDqIjSpJ91BW1hr+w0/KSc
         D0WUSYcp8ia/IqXMb6TPEFKmOYHLUelS5PYS+wxl+PI+NSn4Fm4bp31wAFf3bUweXNvF
         SUR52RUPQtOXcnimFzgrqyfSDsb8IWenem9VLjxK74NE+gq/s93daxbURM0JrNBpXhDq
         yqOG4/oUnSpg6bYynqaf19nqVIj6oGt+weNS3mkJFj9USHlG3UPsOWMnIcIPrKqWNJq5
         +pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991773; x=1761596573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRwldBzHIQH4g/MXesqTddRa2wH3mKxscowbsdJ3rFs=;
        b=PujDkdXjsObMQ9NN53cOhwAo4fw0XnN1BnFLX5riSsMPFB/BtoDEp6Fz6OCQnDwkE7
         QauaGIP/mFuUEoEYRmSMM+htPokagP91gE2bGn8+4Mqyk2EARrV0e8dWsjUAp6wrqazO
         iy+SdU+F+7dnXMAVtPmMZguH9PLewyow2VJe61K/vWeTjikePf4aAqtiEAsH5EBPvsrm
         Jo2jS+xDh/TFHM4fxZlh8b6yX8OKglFJlvp2WRsVhacK86I7hdbnkSfMSfZV1jdYpJWd
         cnjD8KDjXXrXNkyxO0NyMpgi8wQY5mJXvPUvgn1LStsxeUhKz8hEW7rss5XUKV9kcAsC
         yn+g==
X-Forwarded-Encrypted: i=1; AJvYcCVRTE6qqENIJopcmNcGFE+NyCPlmD57LreK5yCy+EkB+tfBfH5E02UDFFU8yVkLJLKnps9i+hkuPgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJQpaV+LtJn9r5wQniu5cFWHP1POaj7yp7Ruer+TprwB4O+jN
	WtDny2SWD2b5SIaYdyrHav31QfkT81e+kMQqKfG2B1/LOq3HE2txAmYPr7KsdnsuPpk=
X-Gm-Gg: ASbGncvVnyaWMR+WUpdeM7qjF25F4plu7cLVU1IKDmCm3y8qDEK4zFSCS6gGKVfLXHO
	39iQiaS4pqmycOkHnOgji2tAQoVRP2g7axszpG4uOjPGofMTESQ/Wq1itz8BN5K0Dj/VLFudzMn
	hS3kVLWe/M6D6vfmqmHNgMLtAdRV97hUp0A8Tr5wajIx/M6yCJvl5wGBcgOy6pZJYZy4oLUj5no
	RTzN/PSXMgWWysxyzznYhRjGKJVTDTUSzjB7o2xjKjuBR62CSqSjkgMld6KSO40Dbbmv4USuDvf
	8Jn7YF/SjOzoZyKOhiLkBAdpaE7+F4qTSiRxLfvYO081OuzIJ6MR3fL4dZYq9LE+r2b2q8xzw+E
	CpQkgsiPKcM+P43BHqRG9gsoruJbzZkMnNxA9RYeKgEEjCKDmjQmd+RIMl8weLdzCOHu+d+BLVk
	ZTci6TyqyQCQ==
X-Google-Smtp-Source: AGHT+IEWBLf7wq6f3FV6257yUouPbLkY/Mk/oWHqmnpiJ0fcsMsMtz1kgTZV512lCf/qTagDTur4QA==
X-Received: by 2002:a05:6a20:9148:b0:2be:8ead:1bec with SMTP id adf61e73a8af0-33495e6781fmr24121585637.24.1760991773177;
        Mon, 20 Oct 2025 13:22:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:52 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:36 -0700
Subject: [PATCH v22 07/28] riscv/mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-7-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4c4057a2550e..e4eb4657e1b6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -425,6 +425,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -765,6 +770,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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


