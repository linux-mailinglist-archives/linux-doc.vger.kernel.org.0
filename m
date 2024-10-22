Return-Path: <linux-doc+bounces-28204-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 321909A9425
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2024 01:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ED821C21227
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 23:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4F51FF02B;
	Mon, 21 Oct 2024 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HSu4SRoJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8E11FE11F
	for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 23:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729553303; cv=none; b=UJaWxvC4ixBccMEF5vWDLfXlGcDwBcu6fCA9pOScxROUzjRA8PrEOutqGBna95TUF3oxm8ZGSFR7TAZCatvp5zcGmPJPZVWDQ4xGWg/v6eHm686dH10eLCj3L1Wr94+B9t0kgCiWUGcueQGBgNiC5M6Z52iizT6i2RgHHIx+S6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729553303; c=relaxed/simple;
	bh=Zff+RWbA2FT88lk3jSWQqGKGPHCgQFk2oW3h5uX7IeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZA+3JNwPBWTftFjBnaLDse+/YpsmG8q96G0GoxsS76Ob/RLZFgO7MlkqItgR6reymbyZnbZYGvrmySh99VaFy8+ZAOF/bVV74PjM79UEH55PPUFrd4EacgLEeYn/XInJCbNo0IzRopiijOVqiokAQ7hBzInJ8lML4ANjzK39ToI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HSu4SRoJ; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4608dddaa35so150341cf.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 16:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729553301; x=1730158101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7g9rImT4RZY0eWuCNKQmXqLXLyfWgLkLWLrUC8CYD4=;
        b=HSu4SRoJsW8fiTfLNoPfWtmsST46EkuJlHkjES1+/95VKhqN6z816FGc4rm9uWnMb/
         VJ3ppoKimFUlHoXvGXX2AfWR/jtFel0iuPDF1mhGnSCH11gSzLun0/FuCtIv7ignLa3G
         bogy8wfBdAbTEWcEIMLlAf/KLo1InWk7wFyJODV+4xpxwqWUafSk1xFxcIILHB14UZWF
         0s8NWDbERo26AlnUM0qrUDhB+Y8GIq/lp1VwmK3qHBgTHLJFTZNEP6zf1AiRYR7H3OqA
         12tseM+/pynF9DXeZM81eyu4n9NZ54i2Sm8PaedyrR32Fh+1ohfR+LMVZlKBCjYTiIJG
         8xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729553301; x=1730158101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7g9rImT4RZY0eWuCNKQmXqLXLyfWgLkLWLrUC8CYD4=;
        b=Xqn0IZl01PGMpWmD0VlSqP33XO12sBFKvE4rdNv0j3KDqqzi9EfQDflq0Se2ouhzFE
         pT2ub9sv1LtCYlqAb1xo2MYVzb/gF6CO2w+AlAhMwKIa/HEohmYyOu1vJCdv69um0k0p
         8kpdMtxRsGIM+xznT5HIRomiSGCu4Wp6beawLtnD1B8JucWubvk8eIEuZ0Jg6728cPkt
         hONA5HaW7zJakM5ImNtuoXXVOETLgEfTLlzuHAwKmFYjL7DDq1HxZNKsVC0lmmXeAKsn
         WV4AnsejFGuUS3ApFXDht1uTnWMVYt3jAbK63Ql3wxnwbTfp3c2bWE68rY/3P/Jsw4IH
         kz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEYokrBBsSWdsa84Wc45fTlqTkQ7n+h1jyKXF8uQw5w+rWW+ePGmapVxl3HPIXZ9qC+kM87+dygUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiJZZmA3jCBX+4naIURZBq6fwfISO1wG/gvROeWAjrb/wgdmri
	s5F4W4+oXaZ1NcNMz9ZLUwhKbwQAPSYGM6oXnbN/KQXIzI92SeyrpgTech6qr61oNN+NnCDMbNa
	HlP3gCMZ5Ei6rNVz0AQBeYAAz9BHKqtL6QJEz
X-Google-Smtp-Source: AGHT+IHlHILW/VtCMnIvRhHu4MUnVCebk8xwRyaArpHaBD/sb8cKitt+/rPJqdaQ95G0uL5u4b+WEZY+T68Iy0r6+2Q=
X-Received: by 2002:a05:622a:303:b0:460:f093:f259 with SMTP id
 d75a77b69052e-46100b89943mr1430991cf.22.1729553300622; Mon, 21 Oct 2024
 16:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-6-xur@google.com>
 <CAK7LNAQ0RwJYkCXHj8QMH3sqXgY2LBTiYV8HnKD8oANB8Bb+Yg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ0RwJYkCXHj8QMH3sqXgY2LBTiYV8HnKD8oANB8Bb+Yg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 21 Oct 2024 16:28:07 -0700
Message-ID: <CAF1bQ=RuLmO9S1W6ofmgVQZR7pBqR3iN7gCuUO2TkwGQwM76Kw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] AutoFDO: Enable machine function split
 optimization for AutoFDO
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
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2024 at 8:18=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Tue, Oct 15, 2024 at 6:33=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > Enable the machine function split optimization for AutoFDO in Clang.
> >
> > Machine function split (MFS) is a pass in the Clang compiler that
> > splits a function into hot and cold parts. The linker groups all
> > cold blocks across functions together. This decreases hot code
> > fragmentation and improves iCache and iTLB utilization.
> >
> > MFS requires a profile so this is enabled only for the AutoFDO builds.
> >
> > Co-developed-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Rong Xu <xur@google.com>
> > Suggested-by: Sriraman Tallam <tmsriram@google.com>
> > Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 6 ++++++
> >  scripts/Makefile.autofdo          | 2 ++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vm=
linux.lds.h
> > index ace617d1af9b..20e46c0917db 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -565,9 +565,14 @@ defined(CONFIG_AUTOFDO_CLANG)
> >                 __unlikely_text_start =3D .;                           =
   \
> >                 *(.text.unlikely .text.unlikely.*)                     =
 \
> >                 __unlikely_text_end =3D .;
> > +#define TEXT_SPLIT                                                    =
 \
> > +               __split_text_start =3D .;                              =
   \
> > +               *(.text.split .text.split.[0-9a-zA-Z_]*)               =
 \
> > +               __split_text_end =3D .;
> >  #else
> >  #define TEXT_HOT *(.text.hot .text.hot.*)
> >  #define TEXT_UNLIKELY *(.text.unlikely .text.unlikely.*)
> > +#define TEXT_SPLIT
> >  #endif
>
>
> Why conditional?

The condition is to ensure that we don't change the default kernel
build by any means.
The new code will introduce a few new symbols.

>
>
> Where are __unlikely_text_start and __unlikely_text_end used?

These new symbols are currently unreferenced within the kernel source tree.
However, they provide a valuable means of identifying hot and cold
sections of text,
and how large they are. I think they are useful information.

>
>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

