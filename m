Return-Path: <linux-doc+bounces-27475-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ECF99D928
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 23:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E2CCB220BE
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 21:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEE91D9A47;
	Mon, 14 Oct 2024 21:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RNEU24Lw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A01D8DE8
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728941636; cv=none; b=bZgCiu74ztv5CnxpfvpVXe09LkGaBzNQowLZJHftcett57ZtVYqDGuk1jBjfEWdg+CPQ+nALJbeb01JHFxU3LpFGyTmrBwtgIoBbNRbVfboZlAasR/QO93hC2C7nFDOfcZzB4c1O8tHpk9UXn+Rsi+02NRIXA4tMRfLobsxzKdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728941636; c=relaxed/simple;
	bh=sTdPsc9TlDcP9fj9qZnzf9a6N2MHYfNB5acRtfCguZg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DF6GfU2XWqzTUQw5M013nVBit1MUcN7rnn6ebkRfwq+Q0kEvSJWcrhckiMeC95hAHHWdcNo/2D1r/0nf+2/lRPl8dNqd3ZJxcjfD1UXV21K9ZHVdA21G+QcGYcqlFux438CvEx1ufPWa7jmzW0OOz7VG8BEdwg5F2KmFYozhv9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RNEU24Lw; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e32f43c797so41113087b3.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 14:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728941634; x=1729546434; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=56GXdyw+jn4VfhhYEfGPQRjvArCzv+g18r0M8mTXpxs=;
        b=RNEU24LwnTXLNS72FqCmv4KscOL5uv+OvUTIFJ04Pm65a0YDPMeUtD5yXWX3nwzfOQ
         aoSSLhzocsZIxE08bUgINjyLuleO59iaeChKRlIaoXnzTPBxJqJvcgunYs5vJ7jTPVNM
         vekKSk1cCMtzzGAgnktS91vJSLKwhOntrpaacYnvgxeDki78uZbCf/pSozvILUAN2DuQ
         2di421Tkvt/WNCkjLVJYpG8JuJiGr4UFWE2SkvyCMVTjBLmv06x8x4wTWCTNmznZPq7F
         VEGZ0aHJ3dOcwMgjmS3LveNHlUd7cga9chwB6DCW2KiMiVsXlJaKW5rXo4HcXra8mSdz
         4bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728941634; x=1729546434;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56GXdyw+jn4VfhhYEfGPQRjvArCzv+g18r0M8mTXpxs=;
        b=mPKiyyGKUW7DX+hl23S6bNqIYubsW8PLhrG1MS49GUqaoJGwlQcRmIWVI2wS/criYE
         SNFC9dRe6Yx8q741sGxDzdk/z0xjSiXQGxuxbesCwXSLRPEjTFk6Zq6PBNH8My5aBzWe
         KCwjAYXsgHftLOIkv1DtP/w+4ltC9qeQ36X24D4ZE1lD5sUumiT4rZZ5Hxyojrbm5aPb
         lSnT87thutdekmI89PCUbtbOehY/BS2KmnfU1poJ8g/mxG7R3M4f5K6d7Bvtc7rwGaYw
         g7CjfORdBHckRkGRL6TT3bBt3iVPza3wgKBYVCyWZA35HGAozAg9V1vJ+MY7dCceophg
         cWqA==
X-Forwarded-Encrypted: i=1; AJvYcCWeuoqvXZEQ3TeT3y5cbZAVSz44xqbGzqK84tNU1tADet2uwS5uwLAKCRnHExfNNE0qcMT5GwudAws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy32XGacG/HN25JPnPlkQh2bR0+BlCjZSM66d3lMTn70m4bNemX
	78cekF6kcOdFvh9y1C9i88xdLEonf0AAnTaNN8tg3PqstJ0MALskWVXi2gCrYWG5IA==
X-Google-Smtp-Source: AGHT+IElzDMKPKvXfqSTVX42FLXp5sHgQoCjK84xdRuQSAgc4VkenrdwOMQ7N05Dp0YV3GIQSofstCY=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:2a48:b0:620:32ea:e1d4 with SMTP id
 00721157ae682-6e3444b40ddmr1107757b3.0.1728941633949; Mon, 14 Oct 2024
 14:33:53 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:33:39 -0700
In-Reply-To: <20241014213342.1480681-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014213342.1480681-6-xur@google.com>
Subject: [PATCH v4 5/6] AutoFDO: Enable machine function split optimization
 for AutoFDO
From: Rong Xu <xur@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
Content-Type: text/plain; charset="UTF-8"

Enable the machine function split optimization for AutoFDO in Clang.

Machine function split (MFS) is a pass in the Clang compiler that
splits a function into hot and cold parts. The linker groups all
cold blocks across functions together. This decreases hot code
fragmentation and improves iCache and iTLB utilization.

MFS requires a profile so this is enabled only for the AutoFDO builds.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
---
 include/asm-generic/vmlinux.lds.h | 6 ++++++
 scripts/Makefile.autofdo          | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ace617d1af9b..20e46c0917db 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -565,9 +565,14 @@ defined(CONFIG_AUTOFDO_CLANG)
 		__unlikely_text_start = .;				\
 		*(.text.unlikely .text.unlikely.*)			\
 		__unlikely_text_end = .;
+#define TEXT_SPLIT							\
+		__split_text_start = .;					\
+		*(.text.split .text.split.[0-9a-zA-Z_]*)		\
+		__split_text_end = .;
 #else
 #define TEXT_HOT *(.text.hot .text.hot.*)
 #define TEXT_UNLIKELY *(.text.unlikely .text.unlikely.*)
+#define TEXT_SPLIT
 #endif
 
 /*
@@ -584,6 +589,7 @@ defined(CONFIG_AUTOFDO_CLANG)
 		ALIGN_FUNCTION();					\
 		*(.text.asan.* .text.tsan.*)				\
 		*(.text.unknown .text.unknown.*)			\
+		TEXT_SPLIT						\
 		TEXT_UNLIKELY						\
 		. = ALIGN(PAGE_SIZE);					\
 		TEXT_HOT						\
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 9c9a530ef090..380042a301cc 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -11,6 +11,7 @@ endif
 
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
+  CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
@@ -18,6 +19,7 @@ ifdef CONFIG_LTO_CLANG_THIN
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
+  KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions
 endif
 
 export CFLAGS_AUTOFDO_CLANG
-- 
2.47.0.rc1.288.g06298d1525-goog


