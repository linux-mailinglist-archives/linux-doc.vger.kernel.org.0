Return-Path: <linux-doc+bounces-26374-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 777EE98E70C
	for <lists+linux-doc@lfdr.de>; Thu,  3 Oct 2024 01:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F193C1F24206
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2024 23:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554851C232D;
	Wed,  2 Oct 2024 23:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uE5LA/th"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD101A7043
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 23:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727912070; cv=none; b=PrNBzuiN9CLKKTQiv7uL/2rlDx0LFb/48wbYq1ufdOevd7OdYnfQfiRsSuYVkZ/q5zp8H6CrrWKJ5y8F6xrD9M1AW8AZBzXDhX/IO/MFdXurujD+E0O9NsBeR/pF9q0YnvhSpMf3ICrOhgHIBL8ux4B082vJ0BcHbRdUz96mfKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727912070; c=relaxed/simple;
	bh=TfH9pGj8JDl+Aaof/nrcmhyRJuPoerK+wbLPSo061QU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=CiiHja7OGJHNl0X2aP60vxgYn3cHVvwGSmVs83BN6vm8dXNloTkfPv0kaOt2qKVJg8lzZb687RICi69diXu7WRvTJqiFfnDBSsnn4TQF8ZvOvYpt5CxJBukZ6DZtgvpzy06KlpTwH60TKV/+qFocZOst/JY3l9Gs1NeBX/dc890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uE5LA/th; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e2acec0109so9647727b3.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 16:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727912067; x=1728516867; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gf2t9bmrSErOVfsrBNPXAQs5s7MnOlbk17b3fEGLpOY=;
        b=uE5LA/thBBNefH1cPH6y72vPPeQaRpjyW1zrZgo86JROgEf68JMw/hQIg2tdsvRvVk
         13UR7+bEdopym89iEUzRh0A9IfiQuRXUZhkXogueHvZCtB2uVlDeUY5qGGWPBpQj7xXt
         EXMqLsKL6k+IH6GJo3lzlVivvCr4MKcHXrhxmI4Pwu+Amo0ahUYIsFhfmDzPG3OScoZ5
         fhckwky/9Wbe8v0T6uIyp1ZocAIJB3ZQJl2t3OAu9DcL1Z0uzVkGeFqjjp5Vxu/tMIPm
         KBjNswNQfMB/BmwSi+oqajO+YLEUJyCSCjiVbBB16LCgJ6BMz63RqzBw+AO5Z2fuVMJR
         4DDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727912067; x=1728516867;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gf2t9bmrSErOVfsrBNPXAQs5s7MnOlbk17b3fEGLpOY=;
        b=K7UyNqbs+S49Vkl6pEMkTsDts/HqphybdMxWBVu+GY+MntVZNCHPfrs5kolVlEBOWi
         fLr6V7IU7lGG4uaVJOENH6icigJXESV1OoLsZvLNvOw0xKqY9uQy/aG5n9wNdAeojO88
         lFBdW2/DDeikcXKYSN0GUS+8dG4fyJR/UY6ZIzZY1RjjvJQ6sXWAYBse6rubCpxBp5pm
         KkkpGgOpndhGKPYlS8wXoTIk2BldAvH3QveO6S+Njt3yz3/U0Zsaz6p777uLR8zOZwss
         FG+BCGhjNtrmI5TgxwZfpoaY6FOVlMavS/E2M66WvD7H+ocAuuIspria6zmGCrkCBfhi
         bruA==
X-Forwarded-Encrypted: i=1; AJvYcCVa6oBO9wY6/4mRs4Md4ZFZpzFkLwunNlZFuk+5BmAFV8HpJctwEdzdsxlvE0pfAXIPIsl0/fGSds0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDIw1ksKBEpIcl9T/wbRRtnOmZohtBXelMfwIKJmVthCD2ggoD
	owfLkUXsd5rM2w2k+/B+VDGlaO3P5ZWTDyl419SsHk6TnGL6yibFo48Ib8t/wDSxAw==
X-Google-Smtp-Source: AGHT+IH7n5TnZZKl1p5XBw74fsA3I5CI+Qm3oY/OY6wfantpUFtmuhzgkxj4i5TBuYuTlUnEBB8GoCA=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:4988:b0:6dd:bc07:2850 with SMTP id
 00721157ae682-6e2a3048277mr1088157b3.6.1727912066877; Wed, 02 Oct 2024
 16:34:26 -0700 (PDT)
Date: Wed,  2 Oct 2024 16:34:04 -0700
In-Reply-To: <20241002233409.2857999-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20241002233409.2857999-6-xur@google.com>
Subject: [PATCH v2 5/6] AutoFDO: Enable machine function split optimization
 for AutoFDO
From: Rong Xu <xur@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, x86@kernel.org, 
	"Xin Li (Intel)" <xin@zytor.com>
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
2.46.1.824.gd892dcdcdd-goog


