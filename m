Return-Path: <linux-doc+bounces-28423-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F0C9AD80B
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 00:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4E1A2828BC
	for <lists+linux-doc@lfdr.de>; Wed, 23 Oct 2024 22:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A2E204932;
	Wed, 23 Oct 2024 22:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s2cvdcp+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E712003DE
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 22:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723482; cv=none; b=ezKqYIfjSn/Pn0/zF4jXp3ck73wIO2ApVd00WF/JSmRt+9ctprGkspYht+RsyzvKxaWZmPC+Xf/mxpc9KtFwFjchva4i87jWhooF5yDKW1fArUqHJJPb6f8sXsPGKReJWHg8vyZA8XaGkW3QwWJ1GQLjP3vNp5qZQN+kOaJMeZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723482; c=relaxed/simple;
	bh=H4lcvNRWWp5Lvo05ibGrfHme5e5tOfikXGSVIBw0qWc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QLFVDcLYqk/G4VRurFyemobqtr0S9qLIu3NHFWa3PLS38nRMh7CxB/cKOIdQ5vAH3bML7p1NdbZN5f6DwzgA+FbSB0KX4xiZLwPFVDOjctBIiw+gYB1Mp0XWCjPI0mtrR0QuyA0KfHKP8GaGU2FosUqDG6I2q8vBgKDdaDH7brY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s2cvdcp+; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e3d6713619so4277717b3.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 15:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729723478; x=1730328278; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/o6/DndgQ3P7eudJq9ncllOp+Irl9ebDBBJXtIKGGvg=;
        b=s2cvdcp+1hQbM1gYYfK1N0T8QcDTG6mNuxH7KC5KnmewoNzxLxWWcM+y9sZbrlAeNh
         lEsPXdREIs8IiJzGwZqon3qDa1YdWlXe27Ha04ekNGqgVsU+7pIAwtoHTFICDdreJ3zE
         m8961rTWablQCaEJHVKa2a6LcYWAicN8i4pGpkHW334oq0iIpwwGEm5RdJrdNmFavo9x
         a/BTHaBhnIaHwUJaSUtppv71SwWv2djt8YYY1Rc0O/wRXVzUBYNrFTZJII4av58rqucg
         0957lHvdewmF1DwX5EThxiAEcTi5XxXdOB8hkBeO2etL18idF6jspOqg7fS0QzVEt2zt
         1e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723478; x=1730328278;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/o6/DndgQ3P7eudJq9ncllOp+Irl9ebDBBJXtIKGGvg=;
        b=jH5kFcAFZmu1EpAXe4Bz6j7ZD2R7ciTf/fYTXHnLMnshmoWSSA+NEgYpD2g+khf790
         xx6YfHSVKanK7VhjFyWLOxORiAMppO+LvDtdK4CRLxvj/mIM3KxwKLwmSk57+jAV+1eH
         +PIGUomMy1npmq21gT5pNZb8oTHOICLUFVs58qYpvOYfS3Uk2LNQGS8ivO9EGAXsyXoo
         MeGEfs1J8xJtvUH4Z1CC5iWBlZyi6gfriDbVVUEZ/dWBmHPu2ySTUhssHxjWb78EgsTX
         UGJFTUmoM/HXTRCd6y7GhUkL2l1OCpJ4S49wakj4k2PaVDDySYCF2gZdPivqBaIIRRhs
         Mm2g==
X-Forwarded-Encrypted: i=1; AJvYcCXzbcdPXqVDJuxowhpSs81CtLhOsenAV9KYWtklyB1yFUDHZBUMTG+CH5lLY3EesLO4ChbRUx1KYQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+djHqwIaIhspUxzrOVI4d2jJJxJtcaj2PcC2zEIBBHVTwQTuM
	2dViuzME2A1VspyKGgfrI+dptKUni7iNnu8eajgRduCdZ+dKi8jEy75rG06RSOKU5A==
X-Google-Smtp-Source: AGHT+IEZ2bJZoc3fE0PnlkpIXazq/Jm9LegpEpa1x+gCSUhRMhoSRkZxAdl7JyNNZ/Ll96oGjpgocA4=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:904:0:b0:e28:fdfc:b788 with SMTP id
 3f1490d57ef6-e2e3a6dd6damr2088276.9.1729723478113; Wed, 23 Oct 2024 15:44:38
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:44:05 -0700
In-Reply-To: <20241023224409.201771-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241023224409.201771-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023224409.201771-7-xur@google.com>
Subject: [PATCH v5 6/7] AutoFDO: Enable machine function split optimization
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
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
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
---
 include/asm-generic/vmlinux.lds.h | 7 ++++++-
 scripts/Makefile.autofdo          | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index bd64fdedabd2..8a0bb3946cf0 100644
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
index 6155d6fc4ca7..1caf2457e585 100644
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
2.47.0.105.g07ac214952-goog


