Return-Path: <linux-doc+bounces-54808-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CEAB17962
	for <lists+linux-doc@lfdr.de>; Fri,  1 Aug 2025 01:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6CB94E1DAD
	for <lists+linux-doc@lfdr.de>; Thu, 31 Jul 2025 23:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EE127F4CE;
	Thu, 31 Jul 2025 23:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Ls5EFU40"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82427EC73
	for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 23:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754003963; cv=none; b=mimjgi/ZdE90YkJzvY9sq5TTxmtS/75fgdd0i5pXQRBw349WB70aEZEum7OgTgXVrO5D2bhb4MM03Ik9ZpmpMwX66J40OSNx+n37cHdCRL1yb8sf+p2b6t8XKCkHJg+XMwWIeRI73g2Pzf+4GmP7gUeshwQoE/LHbiwQXNSnKb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754003963; c=relaxed/simple;
	bh=3XZTvPjvB4R6wnDsFDBTbHp2HDNWsnF4EUoOhsYeC0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3Jh7inlX+zG5bQ212tzE6Rb+wxU1UgUKgS9co5g7z4sxTSDF7RS6PaP0vfCpmaItDJpgNs/aFTTkWeX8tA0iWjF5VnSAmBpeoqj4Lb10/xwym+VbV6iKyti+aZEuC7NuWAvF53dSnPKCVn2DDvjtUG0+eRPx1M9uFgWbCK7Ylk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Ls5EFU40; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso198239a91.1
        for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 16:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754003961; x=1754608761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5+3IuIbTGtFY2nGYSuEXP86kkX+tfkAPCryfH6oHp8=;
        b=Ls5EFU40Z3FkisFJrRdk3B+3DtrTyTYaU6nftkDNvXyCu4Wa/5aaYdgInk1iYs4mts
         ffxp7hZ3TgwoBNFeybK9mg3sNxmzb0ekBzfRheVJUlFkKlB6AZy7lwooY0m8O2L6+rPE
         y9ZTMZgcBA9d7Qa+i8K13T6I+0pSGLp+M2LOC1jPYL54QeLjm1zlaZN6IgmYL8oSEAe8
         T+oZRustfsicVCXRQzkFXQjr9c7opMzoszGmAHxWX90a5aJBP1Ko/Sgt0TQqfG9aSQ1r
         /VGqEDD3f1MOyLxiiGl16McJIKuNnccOtFzPeOr1n6jXenKKWTb6Fjj0yTtt2Noieuzh
         oDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754003961; x=1754608761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5+3IuIbTGtFY2nGYSuEXP86kkX+tfkAPCryfH6oHp8=;
        b=u1xniZ9a5fq9x/j0kMuKJUVAVh3JQA9jJjN9dnhDAiEWmuvGi8lRZQoROe5cjObV6M
         SqtEo0sCdKus4GEJnI586snnixfX5bLp6O61w5iKd1cwJ9QqYIs9M5qg+wgYvCtNcmuf
         egx/Z/rGbhYUq/daPoQJntqSwP0K0hdOV2i9CGXQLa075s3qoBJjTB3wyBLi6U4+fS1I
         D2P+JYak/V5bqIOthOSyMyJCE4ssPNTB5KscRGYU+nruLI+6CTQrUi7G/iLkSB/7tW2f
         SMqMNp9RQMHRHmiJI5BJuOA1d27S/FqINVOir76RXqErE6pF2EahA16fsPHpm7iku0HA
         FLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe659DZ2qD998HUkak0taKYa4IEqUZtMp+oa0JDh2ntWNFEppe8LZzgW7e3umBg35m3fnCrckC10g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9sHScF9d4SI9NJE00GxTWyI/sn01y1WV6uCFYK578zoyOjHXR
	u+66EftL0t712Xk0b7GSBZLmOuedJ1uBSDoKPSA82Ilo0MK637LioDhl2787TrA0qk4=
X-Gm-Gg: ASbGncvpw9/FZHd9hsZuvRPKEHVB4YXfEpCjVRxsh1+dKuaWA6518cT9udGuiai/tmA
	x/LpUJMJ0KEDBdVSQMHsTUNU94If+Q4U7pDrjmSAhhcas5Q3bVHrGZOR4rDcrCkjP3hw217iIZl
	JQbE8FaxXpXfAuDqkkpVncloprRSmviXJuSR1xMJehmyJ76OzWoKvxPoj6fQbArdMlQBkbZ4lA+
	Pv/Dmwor0SkGaHS8ciFxS1LKHyuZFV94sCgYqhfYcVr6Q98Qv4yV/Lf3idHtaqSVvCS9gMZDbgT
	y5zjQ4iNnC1CtzqY3q/4c7lnasZCbrXbpYqnUZNREeYaoPmTuArmd9E9pxMB4F0XT3fbR4btpsd
	DPwyf0w8Azb9FCtwQOAoCrj+oN5doiDst
X-Google-Smtp-Source: AGHT+IEH44+OPKURq8+T8AnOKShWurctpSh+ROm/XJMSmxz+G/vZXXdz2Ne+7bhpwqTninNTw5WBuQ==
X-Received: by 2002:a17:90b:55c8:b0:311:f05b:869b with SMTP id 98e67ed59e1d1-31f5de58622mr12166749a91.30.1754003961009;
        Thu, 31 Jul 2025 16:19:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:19:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:11 -0700
Subject: [PATCH v19 01/27] mm: VM_SHADOW_STACK definition for riscv
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-v5_user_cfi_series-v19-1-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0ef2ba0c667a..eb48924105c4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -353,6 +353,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.43.0


