Return-Path: <linux-doc+bounces-32157-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 320159E6392
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2024 02:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D978D28311F
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2024 01:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EFC364A9;
	Fri,  6 Dec 2024 01:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gYFejM7l"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C318B09
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 01:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733449759; cv=none; b=EtTrkP4lOb34egF+m9eJqTyHm2UfHiPHXSZcEcux+5ZC2bDMfrODdZdbuJvY27wyuyX4ge0YIIsxc4K5T9hqYTqhPqZOm2uUG/4mg78eT0dHlYhd71U8XXSf+aJvdBMCXQjKmTl2K3TxZSiS0yIdzEfnSeDzUvxhhuRLcNRSFV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733449759; c=relaxed/simple;
	bh=LMmlWKNmVBwdw/whPUOfRU56EnAaGuw/30vVRzfcLnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ae3i1iYyXk0Y7FI2pwCB1NfPnKrBvvFVHErLtYsrTwR4pIxjP48MAuwv5D5KGHgiqcI9Wo0shc39LVIWjmdgjjjEF1iJLqqzcLlmRYQkfTcGTsWGuxpfIkQfciop4sq/k6PZe/9GoXB88nGSsSaFr/P+Ii58EMJ7mhNX9gEUH6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gYFejM7l; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d0d71d7f00so2446146a12.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 17:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733449756; x=1734054556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/v1bu1qzcHSaRbclvMhL2gHRSj6sckPpuptjguLzmU=;
        b=gYFejM7liyM2SqJq+cgAKPRopd+rXD0WPBlcIa47nuFvnXomjpA5B5FVPI8lShjXWj
         pVqJswMdRGm4YljFwxq6v2AtbuRE6NjHoPZ3Jpg4Jx7bNvFpPDaYuJJ+EFEMFPWFfxp5
         vNM3I0MGN6gnLY72V4dlSaB8JXtluw6/3xqKkVi6UYWBT2K/0pGJUo8YBShfsqSZqpzS
         35lpDTptkLN7fybTEC7hLhVNSTVEeMCoWdOpe389L9Tg+bh1scSByoYCpeABrocHudfN
         4fkCfZEVRReebBynFPS0iIlBRXgUyUlKo38Tfdbaz36zAgmKhr9mUPIm64jgnjuruFLQ
         0HgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733449756; x=1734054556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/v1bu1qzcHSaRbclvMhL2gHRSj6sckPpuptjguLzmU=;
        b=d7xB4g6bTrvbu4JP2yk/SPObP4zmb4Lo0Elm3SsPjYeLWBvd5Tq5s3WJ7tcbcRlP6u
         B5YA8vgSpGG23PCHoptK1M9r/qg5U4nsn11DcaFG96C97eANTqYFs3N7haaSVUQ6A+Tl
         twGKpp1jGkmzd0X+6SWf/IXVHfmRn3/7Uwl8kNg/ZAfL/SyUrzbyQmN8HL9pQT5pbSyB
         TkOISwWkvPcqkfupMlJ1494/detd3HfzdiYCjH4zk1YGXunNshN/o+tfMw/sNw0e9bsO
         hQQ4LyzOsYi82HbgTRdvNBdAAUd623xZZGN1G1TiLnsjPoQvP728IhJ53oVDbJrMg65X
         i+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7osn/9WEa7kF/6zDRsalteCQfTpt+tboHAPUEt34aLFyjlf2r8jHGXIru9bELzF5ngQxS27/k7BU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvpOIj98j2xywamT8YMzRAW2RJM7P31qq5ZgCnsOrLeRtGysN/
	4r1tXRM4KETwcUszY2luWW0ITyI/zijHsdwD4UoJKhHK2ZXObw6xmVgY8IGJUWL9pmVO/+WzSrj
	+80ASg7SKH8PGk1VCoCFCN9e3r5fnHWrWJesi
X-Gm-Gg: ASbGncsURi4eSkjubW/b34IF+pxu6jMw0ZSifG1jsKK5DP2th+oH5nfloeIK0ptQMnY
	vaSEIRv9bT0cwmDiFvGje0G3RVFV92CZQuZW7BifRhOEGfvYfuSn2qLRBzi1LefHu
X-Google-Smtp-Source: AGHT+IHWoFKow2oW9dCX31mwU7asjyqdFAGshEQB6zNAgVBklECaZ8FGAbU3zPEKbfahKyrrE3z9TE1WY+b0pveDS+8=
X-Received: by 2002:a05:6402:320d:b0:5d1:2677:b047 with SMTP id
 4fb4d7f45d1cf-5d3be720dd8mr1350471a12.28.1733449755904; Thu, 05 Dec 2024
 17:49:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org> <CAABy=s1u75ywAECbkCmGfyt+Yp5khnF0UVcezA-_BEDWUVrHkw@mail.gmail.com>
 <CAK7LNAQJUdubjkvV0T0XRU8=336rV88b7+t6BP4xR9v_g38eKQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQJUdubjkvV0T0XRU8=336rV88b7+t6BP4xR9v_g38eKQ@mail.gmail.com>
From: "Hong, Yifan" <elsk@google.com>
Date: Thu, 5 Dec 2024 17:48:38 -0800
Message-ID: <CAABy=s3ONLwVugBSc=DhC8MdGa9YaAM6ZL5yrWRciLDLLtKmrw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 5:28=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Dec 6, 2024 at 8:40=E2=80=AFAM Hong, Yifan <elsk@google.com> wrot=
e:
> >
> > On Tue, Nov 12, 2024 at 10:45=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org=
> wrote:
> > >
> > > From: HONG Yifan <elsk@google.com>
> > >
> > > These are flags to be passed when linking proc macros for the Rust
> > > toolchain. If unset, it defaults to $(KBUILD_HOSTLDFLAGS).
> > >
> > > This is needed because the list of flags to link hostprogs is not
> > > necessarily the same as the list of flags used to link libmacros.so.
> > > When we build proc macros, we need the latter, not the former (e.g. w=
hen
> > > using a Rust compiler binary linked to a different C library than hos=
t
> > > programs).
> > >
> > > To distinguish between the two, introduce this new variable to stand
> > > out from KBUILD_HOSTLDFLAGS used to link other host progs.
> > >
> > > Signed-off-by: HONG Yifan <elsk@google.com>
> > > Link: https://lore.kernel.org/r/20241017210430.2401398-2-elsk@google.=
com
> > > [ v3:
> > >
> > >   - `export`ed the variable. Otherwise it would not be visible in
> > >     `rust/Makefile`.
> > >
> > >   - Removed "additional" from the documentation and commit message,
> > >     since this actually replaces the other flags, unlike other cases.
> > >
> > >   - Added example of use case to documentation and commit message.
> > >     Thanks Alice for the details on what Google needs!
> > >
> > >   - Instead of `HOSTLDFLAGS`, used `KBUILD_HOSTLDFLAGS` as the fallba=
ck
> > >     to preserve the previous behavior as much as possible, as discuss=
ed
> > >     with Alice/Yifan. Thus moved the variable down too (currently we
> > >     do not modify `KBUILD_HOSTLDFLAGS` elsewhere) and avoided
> > >     mentioning `HOSTLDFLAGS` directly in the documentation.
> > >
> > >   - Fixed documentation header formatting.
> > >
> > >   - Reworded slightly.
> > >
> > >          - Miguel ]
> > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > > ---
> > > Masahiro: if Kbuild wants to pick this up, that is great. Otherwise, =
I am happy
> > > picking this up early next cycle, if you give an `Acked-by` since thi=
s is
> > > changing the interface for Kbuild users given we are introducing a ne=
w
> > > environment variable. Thanks!
> > >
> > > Note that the `or` means if the string is empty, we will use the defa=
ult rather
> > > than nothing. I didn't change that from Yifan's version, but maybe we=
 want to do
> > > otherwise. Users can still provide e.g. an empty space to avoid any f=
lag.
> >
> > I am not sure if I understand the implications here.
> > https://www.gnu.org/software/make/manual/html_node/Conditional-Function=
s.html
> > says:
> >
> > The or function provides a =E2=80=9Cshort-circuiting=E2=80=9D OR operat=
ion. Each
> > argument is expanded, in order. If an argument expands to a non-empty
> > string the processing stops and the result of the expansion is that
> > string. If, after all arguments are expanded, all of them are false
> > (empty), then the result of the expansion is the empty string.
> >
> > I am assuming that this means:
> > - If PROCMACROLDFLAGS is not empty, KBUILD_PROCMACROLDFLAGS evaluates
> > to PROCMACROLDFLAGS
> > - Otherwise if KBUILD_HOSTLDFLAGS is not empty,
> > KBUILD_PROCMACROLDFLAGS evaluates to KBUILD_HOSTLDFLAGS
> > - Otherwise KBUILD_PROCMACROLDFLAGS is set to empty.
>
> I think your understanding is correct.
>
> $(or A,B) works like $(if A,A,B)
>
> Commit 5c8166419acf shorten the code.
>
>
>
> > What do you mean by "use the default"?
>
>
> "use the default" means,
> "use $(KBUILD_HOSTLDFLAGS)"

Thank you for confirming. I think this is my original intention. If
PROCMACROLDFLAGS (a new API) is not set, the code should have the same
behavior as before this patch, i.e. cmd_rustc_procmacro uses
-Clink-args KBUILD_HOSTLDFLAGS. This minimizes surprises for existing
users.


>
>
> --
> Best Regards
> Masahiro Yamada

