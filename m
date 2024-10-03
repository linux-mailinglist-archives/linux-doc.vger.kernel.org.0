Return-Path: <linux-doc+bounces-26419-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76098F3AB
	for <lists+linux-doc@lfdr.de>; Thu,  3 Oct 2024 18:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1315F28134A
	for <lists+linux-doc@lfdr.de>; Thu,  3 Oct 2024 16:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF521A705C;
	Thu,  3 Oct 2024 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="htZCYnHn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B191A4F3B
	for <linux-doc@vger.kernel.org>; Thu,  3 Oct 2024 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971909; cv=none; b=OqLebtLMaGDNB9hugbgtjQJAipwngYHaGwbprafBIwRvUD8MZODKMTH2q6fDHc5xtyQh9fvdNMTT5R1V86FcLILPZSPA7HFrNiGJfTwFMufehEIaSukry6rABQCHx7vsvW0p/A6aqX3IkG95bi5PjIDL/+Pffa21tJuA6ydadxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971909; c=relaxed/simple;
	bh=KAJhNktsKQBL31h4FFeDeoZJgORcWmVqd2YZcjRTjio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEAPy+CPA+DtsWBIbhDokFLn3LCygPvz/1hCkol3LK1o/ZRgq52r82nONtKdMGdzTBxg+rnXATDF5bLxIiz5OWi8WDGta/TQwySCfEuQsQXdagh98YuE16EssbZGml+PKetzffQrzm2Ie22in0qBsM2Q+ddzlEYDAtVn8tSNCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=htZCYnHn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37cd831ab06so732744f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2024 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727971906; x=1728576706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8M94Szf86aflf7GYtGP4IFREoq5t6mzeSASTe2kb0E=;
        b=htZCYnHnXDGWCP+6zbxUw779bJe8vH6gOTcHBU0FS6B+yhLxoYKbh3SeI9QwfA95m7
         OUUCpDRNaFtGYJMc84CNmcWcJNAJc/2pnjuJkMQy1CbQJbZVmfsl9/udA67Zkr33hyMV
         YKJtPC0B25j8jGWbG5CZy1BRX9K4QgmsZ0fZ0/PUX/wBVk+12sHBFBI+mMCdnWM2A/xB
         M4D995eTb2Op1U6It1TzoW4+rp9IkCmpbZMGxDK1CICnRODHIhNEHZJGj7Z7UFMssR1s
         rqfaObnFpqU9kAN5Uxw0VzHDv5ddSv4E3HJR0/I62I0XkCHnUfnG3tTcQmeas7S1199s
         SxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971906; x=1728576706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8M94Szf86aflf7GYtGP4IFREoq5t6mzeSASTe2kb0E=;
        b=nC9POaZ4rCYi/a9BI8G+rC2FizpAWmYNYu5hMC6uKTofXIiOv5ELvUoxFHN5OJOH0E
         Obc3qEibP6eqienE3Hji47wv9jQv6D6mKbeFPBGkPkNtLctmne+fqdqANy3j4XtEuuZO
         3ID30HuR7dB381EhcTKzkr8UHaTCNhzs66qBLCD7dsX6QYwu1GxkFN818+S+j6QgxWc3
         iZ3lXKBCGZRiZO049Fgf7OK3FOIER6lidkCQABwluMJnlX0hsfaQKjgRHdUetZ3B2N+K
         nAHdiPKpojvAYSVKKbkAPXWY54OxB+q9p8/8ypp5JqU6x1qX3JS2eg9jTX1/XcqpOWF9
         GSSg==
X-Forwarded-Encrypted: i=1; AJvYcCV7+ToSmCz45zCd1fZtOOafh6/R+1uG1vsV+Ncf1EGTN3tcKllrD7lf4b+giDfD5xApKUTELnPJ/vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAalEErfvYt/LMSsuy6J4aXjeu1JvTB3z5OkyaC/SL7luHm/CC
	RAcH5aQln9z7+AKj1RyauM3KygDbe3iP0qdSnBlq0lGP7RONPrvilfxrXQI4H2GhtFuS90HooGv
	5+hZm9iZIK7htdkEnwp7fl6x1eJVQIkuIyv4D
X-Google-Smtp-Source: AGHT+IGsVwokVwDnq0q9EW2iHbb+PYH+PmCbmotDyShkoPWSykbINIhoAZtW8xfR6197nX/vMfmDWCNcz9sMeU0B/yE=
X-Received: by 2002:a05:6000:4009:b0:37c:c605:218b with SMTP id
 ffacd0b85a97d-37cfb9c8d6cmr4943794f8f.35.1727971905843; Thu, 03 Oct 2024
 09:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <CAKwvOdnS-vyTXHaGm4XiLMtg4rsTuUTJ6ao7Ji-fUobZjdBVLw@mail.gmail.com>
 <20241003160309.GY5594@noisy.programming.kicks-ass.net>
In-Reply-To: <20241003160309.GY5594@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Oct 2024 09:11:34 -0700
Message-ID: <CAKwvOd=CRiHitKeYtHH=tmT8yfDa2RSALbYn5uCC8nRq8ud79g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
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
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, x86@kernel.org, "Xin Li (Intel)" <xin@zytor.com>, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 9:03=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Oct 03, 2024 at 08:51:51AM -0700, Nick Desaulniers wrote:
> > On Thu, Oct 3, 2024 at 8:42=E2=80=AFAM Peter Zijlstra <peterz@infradead=
.org> wrote:
> > >
> > > On Wed, Oct 02, 2024 at 04:34:00PM -0700, Rong Xu wrote:
> > > > +6) Rebuild the kernel using the AutoFDO profile file with the same=
 config as step 1,
> > > > +    (Note CONFIG_AUTOFDO_CLANG needs to be enabled):
> > > > +
> > > > +      .. code-block:: sh
> > > > +
> > > > +         $ make LLVM=3D1 CLANG_AUTOFDO_PROFILE=3D<profile_file
> > > > +
> > >
> > >
> > > Can this be done without the endless ... code-block nonsense?
> >
> > Dunno, I think it looks pretty nice once rendered. Makes it
>
> It makes it absolute crap for all of us who 'render' text documents
> using less or vi.

"It hurts when I punch myself in the face."

https://docs.kernel.org/ is where we point people to, and what we
should be optimizing for (IMO).  Jonathan, do we have a policy about
using code-block consistently throughout the kernel docs or not?
Otherwise, this complaint smells like "non-technical non-sense" to me.

--=20
Thanks,
~Nick Desaulniers

