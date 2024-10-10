Return-Path: <linux-doc+bounces-27111-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD682999264
	for <lists+linux-doc@lfdr.de>; Thu, 10 Oct 2024 21:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DB04B27289
	for <lists+linux-doc@lfdr.de>; Thu, 10 Oct 2024 19:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0991E3DE0;
	Thu, 10 Oct 2024 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PSJSPEGc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F081E1C3A
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588257; cv=none; b=A3gzWn5MDp7jw0KLroQzy4M1jPYDwHbSeMNhMwrnCBFDrUNm25+k+SJIWF79s3DIz+/NN4mHuFKSSfNz4KXWYi1RdhzdxBNWOGFEPmNOC4deMdUfPnQwgvJNxoNC95Oct60gBXGC+2QaHNeMyQf5NU4ZLDvg/mjeE5dTDMLSRmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588257; c=relaxed/simple;
	bh=sTdPsc9TlDcP9fj9qZnzf9a6N2MHYfNB5acRtfCguZg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u4QdCuwPc3XfjMHMvWw3Kdoyacrzomhf/DukMufa37KbvwbkzfWdu+WrfsYv/mwsFIphvKttqWm4uQUco/mvnpc7zmlaOfo37nvijXGfKBghlOviBc9MTKlsqaaPixBbIqzcfy1HGVq5QwMRsrll/QsZTN4E99gOe6Jp/pxPT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PSJSPEGc; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e28fc8902e6so1881013276.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 12:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728588254; x=1729193054; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=56GXdyw+jn4VfhhYEfGPQRjvArCzv+g18r0M8mTXpxs=;
        b=PSJSPEGc1ICrZR4kXlEtx0Rwvct4gMl1FL6geWt9CoeT31Aj1Htur6L9rMoVeQUSnC
         wEOAUkj+OzZnmuAf4Er9O7m3jfET+nuGYRjubK6+XOeQrQA+zLwWOnKBkfB1zdtEIUQS
         mgbaw9Y22REIA/D7bfTUQqn+aK9Tv/1SnHgJhzD9VjnmGHFKZdu34Z9BBTgphuBcq/4D
         JnsHDFbOrBdjbPqQUOL4F2Q/mwSaCXVWXMlN+cKk8SKoAwd5kfM93RRC2jbFfEC0EUFN
         BltEnFDFdo8lesO9AY4SZAtg374VFe6aKn5iV0MgCINFELLDM548NlZtxIZbqTQxV53/
         eX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588254; x=1729193054;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56GXdyw+jn4VfhhYEfGPQRjvArCzv+g18r0M8mTXpxs=;
        b=LfUEHxPvmo14DbOegeritxiYEY/rzQP1ihMmkYSLWs+bI4trIS0sLuAO7/1qx24bSJ
         g6AI44n+Zhb6qrEciUi9FJDLr7fqhx688EG7cMDXjYrzGaJ/p2ryL3klzw4u/buSADJ8
         UNbUBN9WpcRLOZVLRtFUBW99F+AHF5wANuoVCQLfvfQOZ0IyVzUcvk/TAiOV31Xvcujo
         phONdP8baHRWsXYUeBL/yP+fvrlxicdOhHghe0x4iQ8m1ndxJ9Tktg09Dw+I68JMths9
         uUCSIQfvBjYJbFs47qNUQita+rZnmQ3yrqoAX+U1Ll7djveeriaaeVwc/AEA/hWmbk3c
         nffg==
X-Forwarded-Encrypted: i=1; AJvYcCXbwT+dWanH4I2mcOHFpssi4YgfGlcFmnRWr5mt+Bz9BK/jSO50r2Er5P+nX61HA1N6ZIwGh6vyAqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhBP+I4ZzuNxlb7/hPlCi0pS4IDXxgwAsCGbw+exA2SCBZOIM
	kcenlnguYRUZDKi2LP9hxEV9d8M5nL+u1a/MQMwhdlirIY5mGK14+Q0dLy6LIdYpXg==
X-Google-Smtp-Source: AGHT+IFESUDnoxkBRGGFEsil5vwwqQnr0M2E/rzO5Ah3pXUbKQzjO+St/IUq3wX79za0eMMedUk/mMc=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a5b:94c:0:b0:e28:ef8f:7424 with SMTP id
 3f1490d57ef6-e28fe44d418mr60122276.11.1728588254050; Thu, 10 Oct 2024
 12:24:14 -0700 (PDT)
Date: Thu, 10 Oct 2024 12:23:57 -0700
In-Reply-To: <20241010192400.451187-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010192400.451187-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010192400.451187-6-xur@google.com>
Subject: [PATCH v3 5/6] AutoFDO: Enable machine function split optimization
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


