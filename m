Return-Path: <linux-doc+bounces-26372-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7276B98E705
	for <lists+linux-doc@lfdr.de>; Thu,  3 Oct 2024 01:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 988A5B247B0
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2024 23:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AD51A2C32;
	Wed,  2 Oct 2024 23:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CgU1LzY+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87061A0712
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 23:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727912067; cv=none; b=FBF85EVEfKTdNRJprS4ztdkkSBa/nNJu3qoHtm9u/nLqRzaFmkw68fvQhjoUHpFjXWcJPVuyYv1twJorlY02kwO2OfM+QmuH0itrz1bjGWaETp08fzyQhjuAggswprBxwC19s56KGbY1OrWR9DeKuPYHnJ2nIJlgC3aMdJcGy3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727912067; c=relaxed/simple;
	bh=MJusZT5SU1zAmoXsj3BVQuj0Qp9hPOCt3MKAiX5TJpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=V32ysB6qA9bbYh8mqvb97TjCMW8SPpogvbA9gJBwvVddUjiRyQ2/2xYCpB/XeEf5QNffVB5C8d/79WYvu1sjXCcDS5VdPsJcNdgPPSU4VX2muAIhS1VOzx2S+GgcAaoY9FtweEssd7k/88WZBSLkJZ2wm/LX9Oj38HHh9koPk7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CgU1LzY+; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so617701276.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 16:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727912063; x=1728516863; darn=vger.kernel.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDJQx6+NqQEMtRG5A8ZzhqTLfwfDzLHdvQlCAg24+ko=;
        b=CgU1LzY+yGAAmD2DhsFi0GuElq8U5t15TSgdhbmjhKMUFaU+8LCZnShZUp8nWyj34t
         53U2Q3hoYzTXwML50E++d60HYfNJYym5tMK5nVM+yDVtpH1hdvoc9+qdDHdUXndtHv3E
         VYLVsDgEgSRAIgR9q409v+aCkR12FnRk7VHE8UDSEby6Q8hzT1yw7EdtUSRlj9ay3V3r
         FijOmYw6DUaXg0yk6CPriK44b6cDmmXqm1z20gafCw6w8FsJEy/BOSBHNfaYl6Y2PLzY
         P/EG2plriYvIi5cGtmcZpJPAgeXMUiX5vtQziS3qZUSxol4vuNPfoS0CMy0fGLSxbC7X
         bH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727912063; x=1728516863;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IDJQx6+NqQEMtRG5A8ZzhqTLfwfDzLHdvQlCAg24+ko=;
        b=vxw5l7AD7omZIJ44CIB8L4rLlS8mRrG2ZKuelMNJLRRzNfyJs/1s1Xjt+BkkdCZa5V
         3LucunZKiChtstk11vnI71x2lZ1DXoMo5SfP06K3QVvZp2/KSv5uAfKDnL5zfAS251yO
         uyF6E0P9y63JDAG4uTDj/yHhkDXCGEOMwmFeHO86/DYP4VWQeZzZgTm4/UtJWauxhRUZ
         4DYjGVBly9uwMegPIKyjabiRPYzQliQD5OSqWMaExWiH5kOkyf9vh2bJuFlN7RZJr2fR
         tkVazi8/5fLw8+69HM1AI9PN+x88CwOd/NvSXjjjjixRPGTDsy2FuBRQZQEDt6ze9quQ
         GynA==
X-Forwarded-Encrypted: i=1; AJvYcCUYcHzlf+Ak0qqqQ4Uwspcg5l2fO0YhZsu5WdeW/gD2mIvDPCuoBvNDYJckh0NwQJ5kgWwkk3dhZnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysQsTn/dDVBqM3P6vYLEmFPfvzX4UGx5agtc0K5aFPulv6krtF
	U4itS9rdSxvyEo9WNiAxMchpPm+t5ABkWXFrO79hZcm3YeG4nVNmgL4eg1vDcH1KBA==
X-Google-Smtp-Source: AGHT+IFNUFPkKsM/GwGBb2O2n7BjNQboPuqSWiDTY7/JXcmWwhOx3Fzua6Sfxz92XF91oinyvvfA5m0=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:a509:0:b0:e25:d596:484c with SMTP id
 3f1490d57ef6-e26383818aemr13450276.2.1727912062857; Wed, 02 Oct 2024 16:34:22
 -0700 (PDT)
Date: Wed,  2 Oct 2024 16:34:02 -0700
In-Reply-To: <20241002233409.2857999-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20241002233409.2857999-4-xur@google.com>
Subject: [PATCH v2 3/6] Change the symbols order when --ffuntion-sections is enabled
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
Content-Transfer-Encoding: quoted-printable

When the -ffunction-sections compiler option is enabled, each function
is placed in a separate section named .text.function_name rather than
putting all functions in a single .text section.

However, using -function-sections can cause problems with the
linker script. The comments included in include/asm-generic/vmlinux.lds.h
note these issues.:
  =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if dead
   code elimination is enabled, so these sections should be converted
   to use ".." first.=E2=80=9D

It is unclear whether there is a straightforward method for converting
a suffix to "..". This patch modifies the order of subsections within the
text output section when the -ffunction-sections flag is enabled.
Specifically, it repositions sections with certain fixed patterns (for
example .text.unlikely) before TEXT_MAIN, ensuring that they are grouped
and matched together.

Note that the limitation arises because the linker script employs glob
patterns instead of regular expressions for string matching. While there
is a method to maintain the current order using complex patterns, this
significantly complicates the pattern and increases the likelihood of
errors.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
---
 include/asm-generic/vmlinux.lds.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index eeadbaeccf88..5df589c60401 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -554,9 +554,21 @@
  * during second ld run in second ld pass when generating System.map
  *
  * TEXT_MAIN here will match .text.fixup and .text.unlikely if dead
- * code elimination is enabled, so these sections should be converted
- * to use ".." first.
+ * code elimination or function-section is enabled. Match these symbols
+ * first when in these builds.
  */
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CL=
ANG)
+#define TEXT_TEXT							\
+		ALIGN_FUNCTION();					\
+		*(.text.asan.* .text.tsan.*)				\
+		*(.text.unknown .text.unknown.*)			\
+		*(.text.unlikely .text.unlikely.*)			\
+		. =3D ALIGN(PAGE_SIZE);					\
+		*(.text.hot .text.hot.*)				\
+		*(TEXT_MAIN .text.fixup)				\
+		NOINSTR_TEXT						\
+		*(.ref.text)
+#else
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
 		*(.text.hot .text.hot.*)				\
@@ -566,6 +578,7 @@
 		NOINSTR_TEXT						\
 		*(.ref.text)						\
 		*(.text.asan.* .text.tsan.*)
+#endif
=20
=20
 /* sched.text is aling to function alignment to secure we have same
--=20
2.46.1.824.gd892dcdcdd-goog


