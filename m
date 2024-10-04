Return-Path: <linux-doc+bounces-26532-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79839909F1
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 19:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 019D9B2431C
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 17:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8281D9A51;
	Fri,  4 Oct 2024 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gj5z4rIy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877D41CACE5
	for <linux-doc@vger.kernel.org>; Fri,  4 Oct 2024 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728061607; cv=none; b=Jh+4ce9Q4Qsl52keGD2OkFwPWUpzFaQh9kYyY3Il6vAIEVSSO1T0TSpOoTEvfBMQlr2x2xxgNRVQ6cP4aKZIWgdyTydrgBSwmPgALGVW0D8NywhzcBz6ZAwH9JKff2ijQNfqTu/gBsIgsBcn1Qk263qoaZsc6WAwCUdoYpsFIDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728061607; c=relaxed/simple;
	bh=BjiMOaBbb0faHgkP9UM7KVpOSCigooWaCDDnmSzqOfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qNjLBkp1mE8+Fe3TfUdTKe9Rk6z/HJsCkNY43W7GBgAhnaq02SrVJB3m2ix/ZkSV5wOftTfhkf3mtjqi3jPPkydvnKjyHBHhlOn2kTm2jh30g/JKeLsTCCVSt66Jqo7/L/VbSqARgGVvvCbIUvY7FMWkKA8JwycL2ezi6fmNyJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gj5z4rIy; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a1a662a633so7375ab.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Oct 2024 10:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728061605; x=1728666405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6cu0/usr2tJa4vPbaqm37ZxgrIgWX+DZr/8ABHb5Pg=;
        b=gj5z4rIyOyRyAXbqPZWbhSX2yvMCkAWjN3h4rPTxJruWjLP8LhuYwYC1mFdHWJBE81
         vbNCpO8uIWyYg1B1mMPg7h5f8wXO6VvnpRAqUibA+9W8B0XyKDsMEABkgUBgLJ1QumVn
         Z7v2Dblc/iXgsAJNJr1LgR13J6lEJcbvj2OzgiBo24kbhJjTU+cYxTqN8s7zXbfq8sU/
         /6QJduLy19AIFaWOZECTzfaanppfRJIou11SM39yq1EgZctZ+BUrFpQzVYAkgRZ/tPz6
         MLs1lz4xh9I/X3G2RotLeMfiJTzgzhzUAUZErD8X0rP6FwU2a/1KjkgmpmhPEMcMaAw8
         QJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728061605; x=1728666405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6cu0/usr2tJa4vPbaqm37ZxgrIgWX+DZr/8ABHb5Pg=;
        b=Yz0IAtAckGlxO/fbCqZGDGBoYKQQY7BIh0jAOnUPEyvXINARLeTie6FDeJxs5ef+m2
         e4R65wC9dmn9tMXFq5x5hCP237ylcC+aQRYgpv3WtvUv+NJ0QYyrmaDgCFxWcfYWDn4y
         aiwnw71hG+3/QS2Wo8Ycz4OofPwrWN9oS7i0aemU/rt6CJm+kI8MgIZbp18XCrNLzARS
         ayMGqgUj/bDv2FPph5cu7ucaHtnx02iufMDvc0X0HXDBazYMJ7jjSxDcWX5qrB/oP2dW
         +Gj1o924pMCQ6cnucdl/x6y9z2YWokpGM9dAVrg6F6HyJYwBkoACoaa7+DeYLjWl9Hnu
         4aGg==
X-Forwarded-Encrypted: i=1; AJvYcCXYAOKjaQo9qoW3Fy7YDUVYZcIXP2M5dgBwMGTPfb157IPY0ERRahr4QAFGCWdJkKX6HFSn2nsc130=@vger.kernel.org
X-Gm-Message-State: AOJu0YywW2zko3LWBhOW+x9jYtNPNMeDgjYcYHg0ILXtPdL6AIwp15Vk
	7eQZiRCJxVvsAi8Hc7IfMhkCmejg3mdDvQf6rSwidxTfKrmYl9vp7smJp+/CQvpTPb6aYmIX61m
	e84grHTggYBul0nrSzzq2SgGw5fzSlTj5uv9s
X-Google-Smtp-Source: AGHT+IErDf6Ln07o0AdPteE4Z2MSQLZR5z2/ayMLVov/t1OUkBR776jawppVTTQuFQ07+1/nFJ6gPgMV9aMQcWHF+14=
X-Received: by 2002:a05:6e02:154f:b0:3a0:a3cd:f23d with SMTP id
 e9e14a558f8ab-3a3767de7e9mr3340835ab.5.1728061604302; Fri, 04 Oct 2024
 10:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <CAKwvOdnS-vyTXHaGm4XiLMtg4rsTuUTJ6ao7Ji-fUobZjdBVLw@mail.gmail.com>
 <20241003160309.GY5594@noisy.programming.kicks-ass.net> <CAKwvOd=CRiHitKeYtHH=tmT8yfDa2RSALbYn5uCC8nRq8ud79g@mail.gmail.com>
 <20241003161257.GZ5594@noisy.programming.kicks-ass.net> <CAF1bQ=RAizpP-T_sRGpE2-Kjsk_RZD3r_iz_dpn25W+uDzpWOw@mail.gmail.com>
 <Zv-Fy4hnuscnLH1k@kernel.org> <CAF1bQ=S8Hg0FUThaDU0snVqerVos6ztzVvN6sm1Ng3FnTpJt_A@mail.gmail.com>
 <ZwAZPklXayA1gbQw@kernel.org>
In-Reply-To: <ZwAZPklXayA1gbQw@kernel.org>
From: Rong Xu <xur@google.com>
Date: Fri, 4 Oct 2024 10:06:30 -0700
Message-ID: <CAF1bQ=Q=nnoq4jfLWMK8S_uUuTZncRT1K8af_-yBWTU1R_=uaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Mike Rapoport <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, x86@kernel.org, 
	"Xin Li (Intel)" <xin@zytor.com>, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 9:38=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Fri, Oct 04, 2024 at 09:28:36AM -0700, Rong Xu wrote:
> > On Thu, Oct 3, 2024 at 11:09=E2=80=AFPM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > On Thu, Oct 03, 2024 at 11:20:17AM -0700, Rong Xu wrote:
> > > > Writing the doc with all these code-blocks was not fun either.
> > > > We are happy to change if there is a better way for this.
> > > >
> > > > -Rong
> > > >
> > > > On Thu, Oct 3, 2024 at 9:13=E2=80=AFAM Peter Zijlstra <peterz@infra=
dead.org> wrote:
> > > > >
> > > > > On Thu, Oct 03, 2024 at 09:11:34AM -0700, Nick Desaulniers wrote:
> > > > >
> > > > > > > It makes it absolute crap for all of us who 'render' text doc=
uments
> > > > > > > using less or vi.
> > > > > >
> > > > > > "It hurts when I punch myself in the face."
> > > > >
> > > > > Weirdly enough I have a job that entails staring at text document=
s in
> > > > > text editors all day every day :-) sorry for thinking that's a sa=
ne
> > > > > thing to do.
> > >
> > > Something like this should do:
> > >
> > > > +- For enabling a single file (e.g. foo.o)::
> > > > +
> > > > +        AUTOFDO_PROFILE_foo.o :=3D y
> >
> > Do you mean we don't use ".. code-block:: " here and just use indented
> > text separated with blank lines?
>
> The double column (::) in the end of a paragraph means that the next para=
graph
> is a literal block:
>
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#l=
iteral-blocks
>
> You'd loose the coloring, but other than that it won't be different from
> the ".. code-block::" and easier to read in a text form.

Sorry that I did not notice the (::) in your suggestion.

This is great. I'll change the docs in this patch to use this method.

-Rong
>
> > -Rong
>
> --
> Sincerely yours,
> Mike.

