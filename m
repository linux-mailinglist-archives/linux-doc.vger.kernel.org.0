Return-Path: <linux-doc+bounces-14055-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CAC8A3875
	for <lists+linux-doc@lfdr.de>; Sat, 13 Apr 2024 00:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676BA1F22A5F
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 22:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686A8152195;
	Fri, 12 Apr 2024 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nnL+S1om"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8972C4438E
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 22:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712959751; cv=none; b=DuSknwcBZpl3z0UKeUiSmzZji80E69pQfaHJrFMNozp0jstfMF6mm1hMk+jWXMHLaAbZsm1IeqXsyazdrnDo6U9yuPBa9ezMQ4L+abmonHkDRKANBo67sJhr71TThCofvE2k3HEU9lf24MhuQ72m/qfEKP9tgT0F4o1w7xR72M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712959751; c=relaxed/simple;
	bh=2MgrN6DIBk4r15lQzhiuJv78bk5vHq4Hl6rKok+6bn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIbwVIXkORu2Bgpd9o2s+J3hfwc14Ol3GuespQ9z2ZefG6AFvlMTKZGVhKN7GL4zLBxq9psxyG8zbu4nqhXCb1AC78wbRG4etBOLnO67gdz3XRL7QKh3z+SHf+lk87x6XofgdXGczdRQb0aQ6Ol64OwFY86qOJfG5udNmE+i5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nnL+S1om; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d9fe2b37acso16788231fa.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 15:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712959748; x=1713564548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/M8t1HBqBUuifShlatgwWqMHKd8yfGcHLyOfE8iWiY=;
        b=nnL+S1oml4+lR9EdxQSSRhszMKIGAJuLXJtOHyB1iUb6ys8Z++hGioLVzCRJHE7d0O
         r9mnGHjxfC9CTTVfOYQHV1a0mfqq/CrjeAtH3P6kzTWgAljeIjg8pWTStVXD60BhySc+
         0u7irjPEn34bk1iKL0Rcte7AUrUUvTaLRsmBvoPJfbwF4fSYwOIL4BuT3xfRoIUDwc4u
         2FfqNPJDOMsxGfvzAGzW0YzYmAXSfh+SyR8RRZ9Dw/yhi2rdfA9n/agGvJV2Q9GBCCSZ
         LGiGMFRx8w7sxTAG1B0Z0kQUNnLkWxC+Bc+Dq/86bixsQi63rzoqfZ8zee6lXb0ydqlj
         xpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712959748; x=1713564548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/M8t1HBqBUuifShlatgwWqMHKd8yfGcHLyOfE8iWiY=;
        b=pIk8XyOTOBnvqnCpdPWqBUeKGtBdga2sUlwP+rlJt6mPVvppzN1hQGqlm9+pcK3u01
         HwuTnunAGcLQ71x2B7SGlcCQ9w0Y9URtWB7bJPtUa7w8G0M0YxAH6orZhdKbtn03dgdH
         aPl/KATokE60YNQB5Bt3psQdwmq+y0IHzmg/+BTlTgKcxdTBbsPnE8FWtjIQd+7K0+n9
         w5u5kkfS3viptH9ZWo3JC/xp5Co7pHHmzj1yC7u+JmefWlTFrJ/EcjmkGlGTh0cGUGcL
         1M2Fu8/pWis3HT13ASLpwmX6LGunMchNZZ/fBkO4OnPQ11DKzEvovtiZPhsxxN4PwxNF
         RhlA==
X-Forwarded-Encrypted: i=1; AJvYcCWXGwpyWtWlmjTY1CnsaspgTIAfNSKf8V4qOG/RjtjhPD/19u5FXHLCh62pmz8nZ+dwdFTmdLZyPeYLVEpkqSfaXKeO5Pa2zMOS
X-Gm-Message-State: AOJu0YyC/THaMK/0vVJ8kNmOCCliuqo/JZK6tDoGCgaybeDWd+9HxcTU
	qh9ZnYDyoeCF5fw7GAJOaWItBPyvQe616w63ilzWokAIusoeY5/lHi+sJt1fln9ucSEgW+YH/ek
	c2y16YRKp+aTdnd4VnD5A8q8iKfoBZlf4wnEOyw==
X-Google-Smtp-Source: AGHT+IF5C2wBUyoWGN92/R3KsVleYtMZwSgDPoheRn1Rem16KloXuSobCZbrLHetSul7X4faQjk9YDXOny1oTJbkyFo=
X-Received: by 2002:a2e:9e93:0:b0:2d4:6aba:f1a3 with SMTP id
 f19-20020a2e9e93000000b002d46abaf1a3mr2395096ljk.6.1712959747751; Fri, 12 Apr
 2024 15:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-14-4af9815ec746@rivosinc.com>
 <20240412-moonshine-acting-0df1a90b86d2@wendy> <CALs-HsviR8E-sRvzz7pd5eVGb4+XsAdG1hhbZOPf+m3Cu4JP_Q@mail.gmail.com>
 <Zhl717rsQ7XLBe2F@ghost>
In-Reply-To: <Zhl717rsQ7XLBe2F@ghost>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 12 Apr 2024 15:08:31 -0700
Message-ID: <CALs-HsuL8A87mCRU2+1F2sEPYmZWTz_MFwAys0h=1uKhb7EYqg@mail.gmail.com>
Subject: Re: [PATCH 14/19] riscv: hwprobe: Disambiguate vector and
 xtheadvector in hwprobe
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 11:22=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.=
com> wrote:
>
> On Fri, Apr 12, 2024 at 10:04:42AM -0700, Evan Green wrote:
> > On Fri, Apr 12, 2024 at 4:35=E2=80=AFAM Conor Dooley <conor.dooley@micr=
ochip.com> wrote:
> > >
> > > On Thu, Apr 11, 2024 at 09:11:20PM -0700, Charlie Jenkins wrote:
> > > > Ensure that hwprobe does not flag "v" when xtheadvector is present.
> > > >
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >  arch/riscv/kernel/sys_hwprobe.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sy=
s_hwprobe.c
> > > > index 8cae41a502dd..e0a42c851511 100644
> > > > --- a/arch/riscv/kernel/sys_hwprobe.c
> > > > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > > > @@ -69,7 +69,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe=
 *pair,
> > > >       if (riscv_isa_extension_available(NULL, c))
> > > >               pair->value |=3D RISCV_HWPROBE_IMA_C;
> > > >
> > > > -     if (has_vector())
> > > > +     if (has_vector() && !riscv_has_vendor_extension_unlikely(RISC=
V_ISA_VENDOR_EXT_XTHEADVECTOR))
> > >
> > > Hmm, I think this is "dangerous". has_vector() is used across the ker=
nel
> > > now in several places for the in-kernel vector. I don't think that
> > > has_vector() should return true for the T-Head stuff given that &
> > > has_vector() should represent the ratified spec. I'll have to think
> > > about this one and how nasty this makes any of the save/restore code
> > > etc.
> >
> > Yeah, my nose crinkled here as well. If you're having to do a
> > vendorish thing in this generic spot, then others may too, suggesting
> > perhaps this isn't the cleanest way to go about it. Ideally extensions
> > are all additive, rather than subtractive, I guess?
>
> This was the "easiest" way to support this but I agree this is not
> ideal. The vector code is naturally coupled with having support for
> "v" and I wanted to leverage that. The other concern is all of the
> ifdefs for having V enabled. I can make all of those V or XTHEADVECTOR;
> that will increase the surface area of xtheadvector but it is probably
> the right(?) way to go.

For the ifdefs, if you've got a Kconfig somewhere for THEAD_VECTOR,
can't that just depend on the V config? We'd end up with the
limitation that you can't add V 0.7 support without also dragging in
V1.0 support, but that's probably fine, right?

-Evan

