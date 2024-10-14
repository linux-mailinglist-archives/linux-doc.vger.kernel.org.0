Return-Path: <linux-doc+bounces-27472-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CDE99D91E
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 23:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAADD1F22CCC
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 21:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DF91D5AB8;
	Mon, 14 Oct 2024 21:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mceuKyIu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247FC1D27A9
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 21:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728941632; cv=none; b=RWV2oj+R+UdMdDqHETW8BNKbSGfmPtUIO1nboZnki9Nr+rdZalioC0BCze11vRnoPV6D+MGMoRxjfCcWpquB7+WX1ct5i4f4R+7D3+pNfuXzJz9gM+cQMv8R3ZUE2+QFKmYjRDPVdGRLaDWiQcYvt0Sa+U/v4dNyg/4s0R+rs5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728941632; c=relaxed/simple;
	bh=B/fTpCzd8QlJMQ3iEfz2aTZvNZTM1lTyUzt5b6yEoHA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GYSgxpFM80tUU/PXE14Z7vGuO6zSQavXtiXYcTesAAE7WwswDKWQKocttYUREKus4lUsMoqQLDTtGHX8jsgAlmfkFRn2G46oQajzFZkzv84iTdRXQZvH4oHHiysXat/seM5u+OpO34t17W4NSo6psj67QAPxVqD2azwBI36fYMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mceuKyIu; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e3705b2883so27428347b3.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 14:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728941629; x=1729546429; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pwVGeNhEiYELCNV51bxA2EzTaJbA2K5Fr027Br3jO4Q=;
        b=mceuKyIuYEIao7sBaH5jE90kGfIwXnxHwdK8kxHPDvoRo5kNoOYYMKa+7+RlpOFfD1
         Xp6x7b0lyfp/Um/3Rc7R3nDJcNseqmCl3YIfUMf3Vi+Zu26Aiwd68ZE9fWcTLnyyE5O5
         NYktho08yjXzf/GyCB8udFpEjPMV6vbGk7Nf4hh+kd8mS7C3wRlmWfVoFUfEsk6tDLrd
         X3LLu1APcNfVH+33KF9Ac7NXmE9DX4Wp5VUrJzWdi/KPjnrNuhzhsMrp6QlbZcJ6kgcX
         un+ne2OXhC/D9jca6Mx6pAB6BHH9zKuiyTYtBhlax4cMj+PfQEBD67V91CmL0X4ToQMp
         7HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728941629; x=1729546429;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwVGeNhEiYELCNV51bxA2EzTaJbA2K5Fr027Br3jO4Q=;
        b=BEFJ7gQIEEGGnRddiT+zy2na3W50t+YT9OZ1O9ClgX2u2GqaDWPHguSq2vrU7lRf7w
         MakcwWaV/wq+d9KO0I/3Hs60/nRhy49aVu5BuGNblYef+R8W59Aih7gI04wP9Kfv4Rpo
         sHpEorihixMiGxy01grNYWw2c0QwCqNN7V23b3t/D3bx5xX4X4YxWLEHe4mK6ZM4kQoj
         0gh8YJqtgHGq4OmbZksXJYMATmLf0YTfGFGqT3E8kOINcaQDM4kSI3PoOle3eA+MSnFh
         yKafbjC9ov/t5ihIaOQhRKxJaCOTBMlPLkcD8Rvu04gLXplVivjoUJHETHB5FSJyGB7f
         pdEA==
X-Forwarded-Encrypted: i=1; AJvYcCVMH6SjNtrLezqcq5ytcuVke42B2t24CwZbVCFFQIhtxI2pjWuYJcB6j94OxYRr6Omie0ej58n4Nv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdSDriEJJ1E1LRWvydtUNvjiMxxftl2lguSYKKMyMfC8kD/2fg
	3Z0hjDqjt/YzawD/JRAFKZUfDYLgOYzs/ghnaf5TzJohz+Cm65YIZ1P25rHsmBZEaw==
X-Google-Smtp-Source: AGHT+IFUKTeXqpaUOk0Z0APd70DOqysQRG8JxMrO/LvGlIxawbmDpAaHxV2vTna5EnMdkvTVSZ0ezWE=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:dc2:b0:6e3:39e5:f0e8 with SMTP id
 00721157ae682-6e347c4e59fmr2635117b3.6.1728941629183; Mon, 14 Oct 2024
 14:33:49 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:33:36 -0700
In-Reply-To: <20241014213342.1480681-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014213342.1480681-3-xur@google.com>
Subject: [PATCH v4 2/6] objtool: Fix unreachable instruction warnings for weak funcitons
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

In the presence of both weak and strong function definitions, the
linker drops the weak symbol in favor of a strong symbol, but
leaves the code in place. Code in ignore_unreachable_insn() has
some heuristics to suppress the warning, but it does not work when
-ffunction-sections is enabled.

Suppose function foo has both strong and weak definitions.
Case 1: The strong definition has an annotated section name,
like .init.text. Only the weak definition will be placed into
.text.foo. But since the section has no symbols, there will be no
"hole" in the section.

Case 2: Both sections are without an annotated section name.
Both will be placed into .text.foo section, but there will be only one
symbol (the strong one). If the weak code is before the strong code,
there is no "hole" as it fails to find the right-most symbol before
the offset.

The fix is to use the first node to compute the hole if hole.sym
is empty. If there is no symbol in the section, the first node
will be NULL, in which case, -1 is returned to skip the whole
section.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
---
 tools/objtool/elf.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908..6f64d611faea 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -224,12 +224,17 @@ int find_symbol_hole_containing(const struct section *sec, unsigned long offset)
 	if (n)
 		return 0; /* not a hole */
 
-	/* didn't find a symbol for which @offset is after it */
-	if (!hole.sym)
-		return 0; /* not a hole */
+	/*
+	 * @offset >= sym->offset + sym->len, find symbol after it.
+	 * When hole.sym is empty, use the first node to compute the hole.
+	 * If there is no symbol in the section, the first node will be NULL,
+	 * in which case, -1 is returned to skip the whole section.
+	 */
+	if (hole.sym)
+		n = rb_next(&hole.sym->node);
+	else
+		n = rb_first_cached(&sec->symbol_tree);
 
-	/* @offset >= sym->offset + sym->len, find symbol after it */
-	n = rb_next(&hole.sym->node);
 	if (!n)
 		return -1; /* until end of address space */
 
-- 
2.47.0.rc1.288.g06298d1525-goog


