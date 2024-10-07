Return-Path: <linux-doc+bounces-26696-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7562993734
	for <lists+linux-doc@lfdr.de>; Mon,  7 Oct 2024 21:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32A3FB2292D
	for <lists+linux-doc@lfdr.de>; Mon,  7 Oct 2024 19:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0551DE2C7;
	Mon,  7 Oct 2024 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lwciJ3fA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A291DD861
	for <linux-doc@vger.kernel.org>; Mon,  7 Oct 2024 19:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728328927; cv=none; b=OUTsjJCn7tfTVTknn+T0o0pc0ChANzrs66wp0BuUQN07XDDICkoLEdm4WD6zdLlVS+QZy04CQR1UNH1q/iOSm9OwsAmKFux8dEZ8vZBw8QF7IRgsRdlLMQYm0HnGsjO7Vt9/9KhvjQKpGkwV9qn2lm/B4Sz+LVo6u7NBRPpSudw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728328927; c=relaxed/simple;
	bh=UBceWOcwbLap1fCOhukpD4Mo5RG5YgxK5J16S8Ai3Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=trEwhT2ow3gxr0NOlBr7eUuG+br//MHvICUpKgQfUNHZgNgFLyUEhcgCoZ8oX+9V+Em8t43c7k3LRX787mb6AoHgPg4lCKweux8szRLMkGsryNfTdB9qT3f5aF/c/MJ7I/w6QPdN4MVAK13s9PZmh0d8awNrRCcMSgmnsGEDEVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lwciJ3fA; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4582a5b495cso56101cf.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 12:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728328925; x=1728933725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c52BAD3vzPw3xxGKfNNAH/Yruho8GrfSNRqDdGOTxvI=;
        b=lwciJ3fAOfiEmpzuGEmZbS4bTh0ssgjsWBR5v+cjvbmquTjH0FUiMxoKvRQgQk7lYq
         6oY6j52HLbK9jHUSkSf1qnUC/vmiSAP0PQJdEShPNXI1ZbJcA+gCQkS8vVlun8a2phci
         8SMSImOfG4pykQCRex/YTzC3xInGBLKmfkN3UQmYwLBX8Cpw8jTJFddP9/SEz34DuTpY
         UkxTxpCrXg1t/8bjX+miMpyz7/oYhuaN82u+XuDNBcniidHlDlu22HA2x2hUCaD7IwOL
         FMCattmCYDjwpZS97938V1GDLayiIVUqtvl/UwAPrbGb05mW7HtujaD4710Zgv7R+Y8K
         9nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728328925; x=1728933725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c52BAD3vzPw3xxGKfNNAH/Yruho8GrfSNRqDdGOTxvI=;
        b=FLTjO/r1KEPH8CH4D94VPAJCVZgI028HkmNQfxRkst7rzl4xmJSWbjMJhpxB9+A9z5
         x3maPBTx8XeXsEPR91C/hwoCXfomTyRqpvTxn0N/hrZ5lNa6FPrWMjp/wOMg+UCSI05j
         i0/t+8BCVYZRY326oyDklxPPuEvsANCzF1vhHi09EdOzWlugDotxVViK7fuiiKHohvhY
         qTVtxsxbp8ClwJt5yoXDt5BIFlYFpQ1zYw7s6SjrzUGKbtXTpuZx/b4PLrYNLvWzUHB4
         0tYwM1SUluuDAh1tZgdGGDzpPsMVs5sh7cv24S7dsS4J6ZLVKctYwL2TDBOsJEJlAIZq
         YOlg==
X-Forwarded-Encrypted: i=1; AJvYcCV/xs0Bi5N9BB8jpWxWwOZW2g/G7IplI5LjA8oWpfWJnfFVJIg7AcQhAGPKO3NgVyHAynu2GGa8hU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhrsuWeB4dw6bxChDhu/57CaqKIb0fAnm45oyzqG9bYFNRNxwP
	BueVo9OGIlE+GOSLRncI98xU0x4vG+c7NrkcSK2O7D39Xl29lKUMbhQTfM1loTEHO+g3zJTQH3V
	mz+ifWxek9hC59P7d2Ms2ZbL8tDChsb9EHeE0
X-Google-Smtp-Source: AGHT+IH7a2e4lsSgI4DFA4CW4H450JT8FmNGOQK1jt/YIR4/ypVzFlvPFzdBRbm39KDlJueZQ9ohBhaDeFALD+cZzbQ=
X-Received: by 2002:a05:622a:458b:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-45e173ab174mr577261cf.26.1728328925088; Mon, 07 Oct 2024
 12:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <202410041106.6C1BC9BDA@keescook>
 <87setapq4s.fsf@trenco.lwn.net> <CAF1bQ=S7HfvXw+hczmQrSYcBf_DHsZo2k59JSL8T_9J9HitHuQ@mail.gmail.com>
 <CANiq72m7dkcy=0+ut=rM6Heo4tQSNyUrejBDWCvtwGQVVvLhWw@mail.gmail.com>
In-Reply-To: <CANiq72m7dkcy=0+ut=rM6Heo4tQSNyUrejBDWCvtwGQVVvLhWw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 7 Oct 2024 12:21:50 -0700
Message-ID: <CAF1bQ=S8PzBGDy1uF+4GrvoVtMSFjUjeByhLmqSdY_zDEyY4=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, x86@kernel.org, "Xin Li (Intel)" <xin@zytor.com>, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 11:33=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 7, 2024 at 8:04=E2=80=AFPM Rong Xu <xur@google.com> wrote:
> >
> > I removed the "code-block" directives from the rst files,
> > and used "::" suggested by Jonathan. The rst files themselves are now
>
> I think it was Mike.

Sorry for mixing up the names.

>
> > (1) The text that was previously in code-block no longer indents. It al=
igns
> >       with the preceding text, regardless of how many spaces I add.
>
> Did you try with a tab? At least in Doc/rust/ all those three ways
> (i.e. `::`, `.. code-block::` and a single `:` for indented non-code)
> seem to work fine, e.g. the following document uses all of them:
>
>     https://docs.kernel.org/rust/coding-guidelines.html

I looked at run/coding-guidelines.html generated by "make htmldocs".
It has the same issue
of indentation for "::" text. I also tried tab, nothing changed for me.

-Rong

>
> I hope that helps!
>
> Cheers,
> Miguel

