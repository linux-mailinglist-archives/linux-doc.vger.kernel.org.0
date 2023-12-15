Return-Path: <linux-doc+bounces-5298-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFCB8151E9
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 22:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D2E01F24474
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 21:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57ED247F77;
	Fri, 15 Dec 2023 21:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bTLc9lOv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1B82ED1
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-54f4b31494fso1963117a12.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 13:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702675718; x=1703280518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cC1bTSXVCMzouBImm4Lunm53BHd7q+29uIzARRshG/Q=;
        b=bTLc9lOvky3hnqhxyB3qjrvvSj24oJ76O9Fo+kz4prIC3/67Zr4hbepSfTtZEIYb8D
         CQKUltMB8EkpS6plbFJ+q2luSKHC398Yun0LQDsXDz5dTENqVvzLXfx2vz9mDMQtO5rf
         KUzX/KmZQDoCM3blBuw8dz4kpHPKL+2+lhvf2lgUTqX8/uqBeAKZUhlLKdGvDOyfBEMx
         cwfcd1KmOzTdWzVcUoVH15MorVl1u4ZfQfoipHMRBL0MzluTEdFhiGdIYu8Nm/5fN8dk
         9lD4NxpADZHaU2sI7aQSVOrjHGzslfcma3kCM5keLM9VFEchS+ugTPURdgoTwWIa50wC
         AtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702675718; x=1703280518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cC1bTSXVCMzouBImm4Lunm53BHd7q+29uIzARRshG/Q=;
        b=O8BfoyPulrvNwgzGsBh8ZwBa1TVeljg0J+cFOJNYCzDz2+xjOyb4g+FuTRdU5gnoIc
         xoHUrfLH1SVjr2y1rULYzPYWYQpK4G/iRLTfchaS03OaI3RTxJ2mPuKwjxDb6BG45cSv
         eCvpTYYSRrv5TnrnmKqOELzt3a6kc19aah13duIc78/kEcpmJebUPFd/atxeUb90KsV2
         6U20IDNkelTZITHdisJ037lN7A6y0HwnKgenl0B6CMGOMNyczYcnjf3Bwe+drEa1Ud/o
         bfx1jEbj/5qbx48FKp9tEJYhvM74wo175TWJvVzKXX34rIJPpFovadwhY4808EVMn8qa
         lQJw==
X-Gm-Message-State: AOJu0YzIzyfVN3pCjC2w6X7Fx7tk2DCkrz0HGkRw0gkMjZGYlYZqX5+L
	bBtjxENeGqhm6OQYEEE0+sH7RxUMMfJ4erauadzs6g==
X-Google-Smtp-Source: AGHT+IE2mXg2+E2jLeKihSLfRCnuQkYt+4zI+WvSBMFz2WgpbdwhTo/O+qkSxIF4jSezpRGJphrMSKQXA2O0/0ant9E=
X-Received: by 2002:a50:cd53:0:b0:551:cfab:5538 with SMTP id
 d19-20020a50cd53000000b00551cfab5538mr6411620edj.32.1702675718126; Fri, 15
 Dec 2023 13:28:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231215124751.175191-1-ojeda@kernel.org>
In-Reply-To: <20231215124751.175191-1-ojeda@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 15 Dec 2023 13:28:26 -0800
Message-ID: <CAFhGd8pHtfuMYfx=uEzssvesQDZ-BS0BzPwn06WbasXKUfPBJg@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: remove `CC=clang` mentions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 15, 2023 at 4:48=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Nowadays all architectures except s390 recommend using `LLVM=3D1` instead=
 of
> `CC=3Dclang`, and since commit a3c6bfba4429 ("Documentation/llvm: refresh
> docs") the Kbuild LLVM documentation makes `LLVM=3D1` the way to go:
>
>     We want to encourage the use of ``LLVM=3D1`` rather than just
>     ``CC=3Dclang``. Make that suggestion "above the fold" and "front and
>     center" in our docs.
>
> In particular, that commit removes the examples with `CC=3Dclang`.
>
> Thus do the same in the Rust Quick Start guide, i.e. remove the `CC=3Dcla=
ng`
> mentions, especially since the architectures that have had their Rust
> support upstreamed (or soon to be upstreamed) are all `LLVM=3D1` ones
> anyway. And perhaps by the time Rust is supported for s390 (or new
> architectures), it may have moved to `LLVM=3D1` anyway. Otherwise,
> this can be added back if needed (or perhaps an extra link to
> Documentation/kbuild/llvm.rst).
>
> This should also help avoiding potential confusion around `CC=3Dclang` [1=
].
>

Yes!


> Link: https://lore.kernel.org/rust-for-linux/6df6e8e5-8d5b-4d3d-91b5-bc0e=
90c424ea@nvidia.com/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  Documentation/rust/quick-start.rst | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quic=
k-start.rst
> index f382914f4191..75faa987079a 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -76,7 +76,7 @@ libclang
>
>  ``libclang`` (part of LLVM) is used by ``bindgen`` to understand the C c=
ode
>  in the kernel, which means LLVM needs to be installed; like when the ker=
nel
> -is compiled with ``CC=3Dclang`` or ``LLVM=3D1``.
> +is compiled with ``LLVM=3D1``.
>
>  Linux distributions are likely to have a suitable one available, so it i=
s
>  best to check that first.
> @@ -229,10 +229,6 @@ at the moment. That is::
>
>         make LLVM=3D1
>
> -For architectures that do not support a full LLVM toolchain, use::
> -
> -       make CC=3Dclang
> -
>  Using GCC also works for some configurations, but it is very experimenta=
l at
>  the moment.
>
>
> base-commit: a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
> --
> 2.43.0
>

Thanks
Justin

