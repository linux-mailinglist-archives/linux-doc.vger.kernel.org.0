Return-Path: <linux-doc+bounces-29603-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF1E9B97C2
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2024 19:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D7171F22F1B
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2024 18:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33D71CDFDE;
	Fri,  1 Nov 2024 18:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oltBx3FM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97431CEAA2
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 18:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730486250; cv=none; b=jWzm17pabN21xKUMMitvHwSgcvYShTPSHB9vc4gYk7U2F2kOqL5br7RJEgoSkHVC4ExIEYO9YZ+dkjv8iGCBeNXRzbbPQAUIsnRNDrb83IdXoHUXzrmWF8eV1HgWAhuyuTlbXjSgfsQHdqdEuIWNa3+HcnJ7Sw+bBKzO8PMIjLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730486250; c=relaxed/simple;
	bh=jKoboGztv7bSsKkIlP79WvPeyrvZcZXc4ISTP2ydXJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stFVJulqBsIeaT0IqGTaA309nm8lsucr1fLm4nHRHXCs058V3VrsK+vtMzr2Tgx6r5v6rOMytW7yGkX12Hfm3Bc9MgYH/+vv3xc1OV2s7HEJKMDpFPiopgBIPlTOuuv+1+yHhaDvEuhycTrIbI2h8eRdBmGHyKTsd1lB7rAfLP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oltBx3FM; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460969c49f2so48881cf.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730486247; x=1731091047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra0xT/SkPUuyvhZ+lS69adyS93PRUWclgK8p/jLJodM=;
        b=oltBx3FM9RjUFhJ3FKiKhEBsEHo5X60UjnD7Ejme7FJqLN2lxXoMUGvE2LGNYkqoU1
         GlP8V9+o45STfQwHcQv/EuPMorA9lXVxAIpluQK4mQwfFdlB2xUkUrsM4KEe2sHuxnqF
         pwe36gOFfaXeaQlYGxKrul0OnGpndwpcEYykqrFlmeCQzmT/cIO8xByYYf0o7RBOAVAQ
         agx77Vwr18pr8bt9osuYzixhgZzFLNZUQ/vTQzKbyTkXVJHFkNRheozCJw12f9m8yzuK
         nLDB5FxyOjrbp1awvbrbITv6EvkMqb4OPSUaNb8DI1yHEzBm1vCFWyhOOZ6WqOzQ0yX4
         rjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730486247; x=1731091047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ra0xT/SkPUuyvhZ+lS69adyS93PRUWclgK8p/jLJodM=;
        b=EQ22brfGFj3gkNkZ6PA+FjE1rwgab3Z5YWH/vjteTVjJ/o/OF2UkGJjY9e61SFWV+E
         6YJ3Bvh8U7k96wKlW3s2j5WE9HX6rEWY/dkdbX0vDplrCWmduoJKVaBV8UYOm07554/+
         ERMTPBDqWXGdSrdlmWrgA9WGu/J5F7parjdMFoL4coDdX3S74gmYukV2glYN35DYDb1f
         m8yQr1TUnJbVAyDryUrk6KDs5dXT50MnzBICDh1XcZ8sSzwsLUKGlgaOtooIlWaMe7KI
         861X5Vz+XhnRgmbeT4k9RYKRZ+3Fb7DUaWKY2KH8w+VHPSvUnvkL30JxU/pqInF4Zq6s
         lgig==
X-Forwarded-Encrypted: i=1; AJvYcCVN6NsPI7XsFbmp/OGekHeIWKYYAlG3WBUqzqMIhxHTPFADf7sUneTBNdCeArRDEOUSTK2zUtp5dGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhbWTlaN5BH+I1QnuFQJ2D1ZUb6vBNCFIhtrzourGRPfGa23Rl
	GUhBUPkUoVXVnaGo/K0zgOcvelvjfr+1OiUd8M/OW0VzptreXH4yyY+GvL/Pr47FQGY2o1/crir
	LiGMPdLdml5Ul0ZyjN5mpnyP4tECp9RzzaS3A
X-Gm-Gg: ASbGnctXLBTCihPA7Gn1WzrnYfz5hgitI9OqJ2/O50qsRG6DWySRX0It92MFZEW7F4V
	aE9/1nj73TM40DYuyBZQ7NWGR5gef9UB5NPtQsd9AwAN1kLIBsIfILoQJbMAv
X-Google-Smtp-Source: AGHT+IFXHlNZolCtvQqrkR9hwhUI8RViuIj2smBYH8pafbRsbRshQf8L/zWcjJGkwIIhtoJd28KJvaEPAg+jH8b1gU0=
X-Received: by 2002:a05:622a:1350:b0:462:b6c6:8246 with SMTP id
 d75a77b69052e-462c5f02ebamr346081cf.14.1730486247209; Fri, 01 Nov 2024
 11:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-4-xur@google.com>
 <CAK7LNAR6Ni5FZJBK_FZXWZpMZG2ppvZFCtwjx9Z=o8L1e-CyjA@mail.gmail.com>
In-Reply-To: <CAK7LNAR6Ni5FZJBK_FZXWZpMZG2ppvZFCtwjx9Z=o8L1e-CyjA@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 1 Nov 2024 11:37:13 -0700
Message-ID: <CAF1bQ=TjpUrEgiqepyaGAiDoFM8jzozzxW=0YvTXpFY64YoTzw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] Adjust symbol ordering in text output section
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current order is:
.text.hot, .text, .text_unlikely, .text.unknown, .text.asan

The patch reorders them to:
.text.asan, .text.unknown, .text_unlikely, .text.hot, .text

The majority of the code resides in three sections: .text.hot, .text, and
 .text.unlikely, with .text.unknown containing a negligible amount.
.text.asan is only generated in ASAN builds.

Our primary goal is to group code segments based on their execution
frequency (hotness).

First, we want to place .text.hot adjacent to .text. Since we cannot put
.text.hot after .text (Due to constraints with -ffunction-sections,
placing .text.hot after .text is problematic), we need to put
.text.hot before .text.

Then it comes to .text.unlikely, we cannot put it after .text
(same -ffunction-sections issue) . Therefore, we'll position .text.unlikely
before .text.hot.

.text.unknown and .tex.asan follow the same logic.

This revised ordering effectively reverses the original arrangement (for
.text.unlikely, .text.unknown, and .tex.asan), maintaining a similar level =
of
affinity between sections.

I hope this explains the reason for the new ordering.

-Rong

On Fri, Nov 1, 2024 at 11:06=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Oct 26, 2024 at 7:14=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > When the -ffunction-sections compiler option is enabled, each function
> > is placed in a separate section named .text.function_name rather than
> > putting all functions in a single .text section.
> >
> > However, using -function-sections can cause problems with the
> > linker script. The comments included in include/asm-generic/vmlinux.lds=
.h
> > note these issues.:
> >   =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if =
dead
> >    code elimination is enabled, so these sections should be converted
> >    to use ".." first.=E2=80=9D
> >
> > It is unclear whether there is a straightforward method for converting
> > a suffix to "..".
> >
> > This patch modifies the order of subsections within the text output
> > section. Specifically, it repositions sections with certain fixed patte=
rns
> > (for example .text.unlikely) before TEXT_MAIN, ensuring that they are
> > grouped and matched together. It also places .text.hot section at the
> > beginning of a page to help the TLB performance.
>
>
> The fixed patterns are currently listed in this order:
>
>   .text.hot, .text_unlikely, .text.unknown, .text.asan.
>
> You reorder them to:
>
>   .text.asan, .text.unknown, .text.unlikely, .text.hot
>
>
> I believe it is better to describe your thoughts
> about the reshuffling among the fixed pattern sections.
>
> Otherwise, It is unclear to me.
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

