Return-Path: <linux-doc+bounces-28696-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD4C9B1511
	for <lists+linux-doc@lfdr.de>; Sat, 26 Oct 2024 07:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61DFD1C21116
	for <lists+linux-doc@lfdr.de>; Sat, 26 Oct 2024 05:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867CD1991A0;
	Sat, 26 Oct 2024 05:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yjb1BEm5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D5189910
	for <linux-doc@vger.kernel.org>; Sat, 26 Oct 2024 05:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729919667; cv=none; b=rjhDlyzWpHoEXzDLV2mOxLKiJ2tKfWOUM3PQ0+65xMY5kTgClmGh/BPMApwRC0l7mTMMReGQbNKItyojqbPWlcH1188GNhRhws2WzlWHCUjElpNB8UzieuQraYNx5gPpLQNa3zxoaHmLwKZcSyX8mumdB/TsnqI9YuEzool566U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729919667; c=relaxed/simple;
	bh=gX6C+xmPZI4vviIG2gcRmXQgQ4QuSRea9Xum6Y8PdvA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sw8vibsHkNfYVKR2vkA1KwhxBaMPAPjsixh/R6LUrwyoeTAvk6Q/17cJJ2gRg6e9iJM30EflQweaQLdpvS9ABAODn20VMUOBlKLy/TsP0ZdPrR3yo0b75ZvHlQ9HlZqkS3ZYUYhWi1S+aUmtOLXubnrxyE62PiccRd4PG/huld4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yjb1BEm5; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e3c638cc27so55221187b3.0
        for <linux-doc@vger.kernel.org>; Fri, 25 Oct 2024 22:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729919663; x=1730524463; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHmgx0WMT0WJm/0bRZiTBO3ZfS/7yoeScA7PHXz66a0=;
        b=yjb1BEm52l9vEo993Pr9ASeOKs91j9kbETemKEKs8yLmkWf5NBKxhGqvwGXprjX1zd
         mpvj2bvbDNdPCubRXJPRVCWZskpmL5yu8kcmXSkz3w//LSFxfuT5toRGefI87FcLOXg0
         r7DJqS45tcyHLN1auEr22Rh2+pBCG1JJbc8DpQkwf1jRLzwDQvR/MgYTzbdQuhPAbihV
         pef/g/oKoqFzqANf1Dhwv0eOMDgzUKXKaztymBnpF/EXDkW549xgGfPn7ZXsCQguAiyF
         NtpOwG1cFiUQ5J2g/UQqWLPMnk16jGg9htwq3Eiu0fq+oQnjUGdPubAUeQ5APCNa5ifb
         PZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729919663; x=1730524463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHmgx0WMT0WJm/0bRZiTBO3ZfS/7yoeScA7PHXz66a0=;
        b=lAPt7MGEoxCTQrcFhQCWIpJPCGftO+GroPjAdob3g4MVRr1YBfQ7JvQhfzAcUxVt+4
         Vj1Dreo+SehlvCoDYalrqqSVXrEayCpmnSc5ZIHYw11OGwsWYv2f296Fn2WYMCSTyRjL
         jAKsLbxixdORyy1AXz1iruOxy8RVX5mweyoo1EM2q2nInptAWfCya8IpowZOa1qkyFOa
         Pen6qPq+/1XaRDGsIV3LgY0aVViGJLy7t1NoN530oNQLAAGq0x7D7v3Q2IgcAR8fWjKk
         6GY95qciVPcNQVeOG5B+3GuccglB6stv1lKjd2LSHEENIsUTBx576OzRMFEO6+0jfwFp
         gQrA==
X-Forwarded-Encrypted: i=1; AJvYcCUN1LJxUItoycBtheyLKQt8pALgnktzOSwb3w+1C/f0r6mUrfZqQYw4rgiH7Hhvi+/kiGZFTRoGpOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyldTyucYHRyGeNrErhZGJ7dHAuOTs+2Niz9wUVbRNB8lBVJkx5
	sKPPrxQJeyLD0dN3Qary5dOKe6ECrGOu9ftRpd2toNI8YvpIfyruAEzY6UDfH4XXLA==
X-Google-Smtp-Source: AGHT+IFwdCF0m/L8cOwxhS25nb8LXGI1xFUxVkPvvMAds6km/RMLSYmvagpwqP7CwRbJFodaTTB7c0k=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:9704:0:b0:e2b:d404:7acb with SMTP id
 3f1490d57ef6-e3087c0c240mr5801276.9.1729919663197; Fri, 25 Oct 2024 22:14:23
 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:14:07 -0700
In-Reply-To: <20241026051410.2819338-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241026051410.2819338-6-xur@google.com>
Subject: [PATCH v6 5/7] AutoFDO: Enable -ffunction-sections for the AutoFDO build
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

Enable -ffunction-sections by default for the AutoFDO build.

With -ffunction-sections, the compiler places each function in its own
section named .text.function_name instead of placing all functions in
the .text section. In the AutoFDO build, this allows the linker to
utilize profile information to reorganize functions for improved
utilization of iCache and iTLB.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Change-Id: I6dc9150c46983a576f4d4f1415dbdcab78a48021
---
 include/asm-generic/vmlinux.lds.h | 11 +++++++++--
 scripts/Makefile.autofdo          |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e02973f3b4189..bd64fdedabd2f 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -95,18 +95,25 @@
  * With LTO_CLANG, the linker also splits sections by default, so we need
  * these macros to combine the sections during the final link.
  *
+ * With AUTOFDO_CLANG, by default, the linker splits text sections and
+ * regroups functions into subsections.
+ *
  * RODATA_MAIN is not used because existing code already defines .rodata.x
  * sections to be brought in with rodata.
  */
-#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG)
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG) || \
+defined(CONFIG_AUTOFDO_CLANG)
 #define TEXT_MAIN .text .text.[0-9a-zA-Z_]*
+#else
+#define TEXT_MAIN .text
+#endif
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG)
 #define DATA_MAIN .data .data.[0-9a-zA-Z_]* .data..L* .data..compoundliteral* .data.$__unnamed_* .data.$L*
 #define SDATA_MAIN .sdata .sdata.[0-9a-zA-Z_]*
 #define RODATA_MAIN .rodata .rodata.[0-9a-zA-Z_]* .rodata..L*
 #define BSS_MAIN .bss .bss.[0-9a-zA-Z_]* .bss..L* .bss..compoundliteral*
 #define SBSS_MAIN .sbss .sbss.[0-9a-zA-Z_]*
 #else
-#define TEXT_MAIN .text
 #define DATA_MAIN .data
 #define SDATA_MAIN .sdata
 #define RODATA_MAIN .rodata
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index ff96a63fea7cd..6155d6fc4ca7f 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -9,7 +9,7 @@ ifndef CONFIG_DEBUG_INFO
 endif
 
 ifdef CLANG_AUTOFDO_PROFILE
-  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE)
+  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
-- 
2.47.0.163.g1226f6d8fa-goog


