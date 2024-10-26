Return-Path: <linux-doc+bounces-28697-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9819B1517
	for <lists+linux-doc@lfdr.de>; Sat, 26 Oct 2024 07:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 942D02820A2
	for <lists+linux-doc@lfdr.de>; Sat, 26 Oct 2024 05:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042D01C233A;
	Sat, 26 Oct 2024 05:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D49GIZaR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F77D14EC47
	for <linux-doc@vger.kernel.org>; Sat, 26 Oct 2024 05:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729919669; cv=none; b=lqrtkW8SFJ0ud2EbotQJh1UQV8JewsiaKJvm2W5xAZB+56WOvmCN7FmqiFHJNqIgC4EL/vEdzmDyeLvPjYf0RsDOwEBmYasjBrMCI5vPYpgpUVNYBfNJs4AqYuUFNGwvif0KyG8B6dFNfv0gJzhUQ5SxF+RqK387rPy9KCZG91A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729919669; c=relaxed/simple;
	bh=NLLY5VApu1/3ZEIf01tgeRphmT7Uug94LuXMgvVVpNo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K1363uc4YOz81HGKLZ1m7jNVLSSrcMbG6ut5fGT+Ll4M3M1+ssdeUgivrUCAhp589p8bl0bmohqtQp/QTrsOyxk1tWZhLJkO7K8A7gmBcaRerK2ArVARZgXCO8ICCr+cRMbDHBYIb3Rf6HRV5eudB7Ocje4bEzQSI9obVrK3O18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D49GIZaR; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e9e8978516so937477b3.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 22:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729919665; x=1730524465; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NsmO41bchPNgq+4yaZYutwfxnbmoF8h5v0vIdGoDSHg=;
        b=D49GIZaRLYjekm+mJUoc4DI+VuWPlClOmJr645OLvtSdHjGHdQXJvo4UuwFJ9h/acQ
         gB/B8qrOxMFQ5+IB+BidNiffMsR21BZnifLSjSuxLz7lWzWQhMBU/X1T6JQ072JrZ/aL
         5iciMoLhG9PuKqKLbVGzFJLr2YhrBR5ytIi+FGWYBjEWI5fo6aBoC6homb+S5BAxkR5I
         7kS2AYTSzUzIhW3Q+/udqeuilgA/SJzX0Q9Zem+wJju3vTdABNi+i3bDnA+ThFNrddch
         kq2SNT/Ap9rxzBU4A3ThM1Q12vBMa4myH2mLxUV2YGIOLeQMw9M0hKrHFDRbn9LUUIPp
         cn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729919665; x=1730524465;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsmO41bchPNgq+4yaZYutwfxnbmoF8h5v0vIdGoDSHg=;
        b=k6JK70AQoZgd2CtZfKZB1d2r+pnmqsvide5VhHJRnubRUWDSbxZLyZXd6uFpemEdSy
         YuTZQ2KryP7fPnLTKIjgM6LP1I6NZqYpp30RJMPlPoSFxCWR7LxLwUhdY7vSdWMw+sa9
         vrDVEi6AYk827fbsDyUoLlCzzZBcwIsU27Kl/UlpWHoZsKe6YasR3y3AfyIiTf+t2Hky
         n6K76uVSmAEloqPKS6Vm5cQ0B2sV7pDzAl1+P7OnOcbcWa2FBtfqIpuw5mjmOqj0aaaI
         xDUXTJV9jjBEQVe5tI+7F6/GTJxL3mbFczkjZoqJvnBMnivziQpLYgrS02m69NMH1ety
         Poiw==
X-Forwarded-Encrypted: i=1; AJvYcCUizDbXMVUfqMWgIzJdn8HHzX/kR2TGHEQo+PLgcYa7PjixidZ2dE/ENgeHJc60nkACkLio+ftyLuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qldT2CZW97VSiCqFPWJBhSO+CQS87qBh93ojsP2q3EIeZCLi
	AgxYwYt1moOirCqD/TjglrSiwHOWRAcSn9HIEfbgNB73SKE+RLysa+w9yNcJupXCjQ==
X-Google-Smtp-Source: AGHT+IFaNug4zYT82V2JkP1oB1hTfsHJ07DjU4iLK9egYH6wsEyiKtTxNH4cedxNJIt2W6rfdo72DsE=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:6789:b0:6e3:6597:222f with SMTP id
 00721157ae682-6e9d8ae01cbmr630047b3.6.1729919665241; Fri, 25 Oct 2024
 22:14:25 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:14:08 -0700
In-Reply-To: <20241026051410.2819338-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241026051410.2819338-7-xur@google.com>
Subject: [PATCH v6 6/7] AutoFDO: Enable machine function split optimization
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
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
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
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Change-Id: Iece9b36d37162c0cf66b8efba7e81d04b4768254
---
 include/asm-generic/vmlinux.lds.h | 7 ++++++-
 scripts/Makefile.autofdo          | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index bd64fdedabd2f..8a0bb3946cf05 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -556,6 +556,11 @@ defined(CONFIG_AUTOFDO_CLANG)
 		__cpuidle_text_end = .;					\
 		__noinstr_text_end = .;
 
+#define TEXT_SPLIT							\
+		__split_text_start = .;					\
+		*(.text.split .text.split.[0-9a-zA-Z_]*)		\
+		__split_text_end = .;
+
 #define TEXT_UNLIKELY							\
 		__unlikely_text_start = .;				\
 		*(.text.unlikely .text.unlikely.*)			\
@@ -582,6 +587,7 @@ defined(CONFIG_AUTOFDO_CLANG)
 		ALIGN_FUNCTION();					\
 		*(.text.asan.* .text.tsan.*)				\
 		*(.text.unknown .text.unknown.*)			\
+		TEXT_SPLIT						\
 		TEXT_UNLIKELY						\
 		. = ALIGN(PAGE_SIZE);					\
 		TEXT_HOT						\
@@ -589,7 +595,6 @@ defined(CONFIG_AUTOFDO_CLANG)
 		NOINSTR_TEXT						\
 		*(.ref.text)
 
-
 /* sched.text is aling to function alignment to secure we have same
  * address even at second ld pass when generating System.map */
 #define SCHED_TEXT							\
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 6155d6fc4ca7f..1caf2457e585c 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -10,6 +10,7 @@ endif
 
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
+  CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
@@ -17,6 +18,7 @@ ifdef CONFIG_LTO_CLANG_THIN
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
+  KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions
 endif
 
 export CFLAGS_AUTOFDO_CLANG
-- 
2.47.0.163.g1226f6d8fa-goog


