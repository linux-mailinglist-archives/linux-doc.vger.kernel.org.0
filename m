Return-Path: <linux-doc+bounces-18483-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C824906926
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 11:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92A981C22403
	for <lists+linux-doc@lfdr.de>; Thu, 13 Jun 2024 09:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4928B13FD62;
	Thu, 13 Jun 2024 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3YJu6hGE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A893813F452
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271807; cv=none; b=URk2XZRYaxD2E9lPjFCgGFDvQf937VKX2k8S8eLNWDdPfm99cBLiep9gZS8ixktCAbFvCyjWbe0Y23qlKtej0SgrI+rx5pfhHK6/ADqmZ4wpl4WliF+iNJmF7dqoV6mQO8m0s5YWbdGjWwsUPHcFAamVNVafQsjF2jEUnafcs30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271807; c=relaxed/simple;
	bh=XdWD7NDBH2MZHT7kAWuCQTYJgCqR+oT+j023LwQheaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lMKLqsE7OPOR+tqW1rEcr3vS1hra3kqGB0HalTYG2bDZxWpEUm73Qe+PEoQGpTGhRDgKJ9O4/HDoYnEvzBug0OR92PA72KY+KPfWHMyldfqnridMtIZMvIlHGO4PUtOUD+ioWJMDg235FBwJS0y/mD2gah/inOmC+lVqgeU87BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3YJu6hGE; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ead2c6b50bso7852081fa.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718271804; x=1718876604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdWD7NDBH2MZHT7kAWuCQTYJgCqR+oT+j023LwQheaU=;
        b=3YJu6hGEBkE71HsHYCKIrKkNtaQN/4hBsqkccMN6SZBLJO59BLWxMJQy5bT5h02rwL
         cPPYOKSRhEm3xNhUkNv0uXp/8CeXGeB5cFetfBsz+kJj0EQrbQ3pedWuG6/uDeYr7GsP
         NP2H9S6HfLG4GXONcEEFfbsXio2jnZ6O7wKQVaB0aNUow3AQfwHBphf1dxr40a+uTila
         D/Jw0rX9QDsjIyExB3dVaCm3nPp0s5vZM8jozZ/f18EBHvfYCy02JS+Muji0dsU3/16c
         Inj6DJ4HlMJZFRC+SY27FnD3Q+lfPckmTYmS3HH8TKkTnPqcQsFwjfRTa5b99pvwHkob
         GaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718271804; x=1718876604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdWD7NDBH2MZHT7kAWuCQTYJgCqR+oT+j023LwQheaU=;
        b=e3Q6wTM1tzGGfkUrhFkF1da/DqVpVhnrysa9EIYRWwTDfanMm3+eBmwZ0BUcmcbI4s
         cEdnlNNYX6/FkiBkJBnkHgXWnsJNuVOh4f8R6WOaIyoyWwomkIkhNYLmzGcJhlf1ekYp
         OpiOT/l2DCmSdiwaEVUBFXPV3DbBXx8fv4iJaOGiha6a02S5r6LeIbJsEfQOxNey50iH
         hX+REeVviRaSyxLxUXL1s0ZF+2Spd+lQyKnUWlhQZ1I/gLfyF9wcJtljzW9+o082cnV4
         CvU+qG8uDtS2oWd2/9j8wOyWtO9wd8txscDAr3Tpw6prlatnLbNwrYicWfKk9uEwJeeP
         g01w==
X-Forwarded-Encrypted: i=1; AJvYcCX/DhxqOLswybYKYh+v+klS1ZqZfWtQX9u79lc4l6mbGdmRCSx9jH58qfe8/Fnv2LK36G/SVGAiKN+H5+PeBLcLdXxP+/VDup/d
X-Gm-Message-State: AOJu0YxrqDSlDohGlNIo2JxB1M/dLeZRKK85+VhiyLGulKYwheTU4Fp7
	8sKQLpq1RuEcH/rv5YwL+TOzUEUkTTMGIX5hvy2BHgVeGxfPZIB7yE3RaggpPkoou7RcuuDYAq1
	jHPXw4Cd+tctGkPQwXPmcuFVD8e/OoLjr8LjDjw==
X-Google-Smtp-Source: AGHT+IEXw894d4CqHfrKT7vpJjkQQa/77wKxL0xzaPs5YVHkjP7iOr6p77hXjXiPE5IhzrRyBwBwHczJBb44uDNP3AE=
X-Received: by 2002:a2e:8891:0:b0:2eb:d9a3:2071 with SMTP id
 38308e7fff4ca-2ebfc964d08mr25060641fa.50.1718271803787; Thu, 13 Jun 2024
 02:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com> <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com> <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
In-Reply-To: <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Jun 2024 11:43:12 +0200
Message-ID: <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 10:50=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Thu, Jun 13, 2024, at 10:27, Linus Walleij wrote:
> > On Thu, Jun 13, 2024 at 10:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> >
> >> On second thought
> >> though: are you sure drivers/gpio/ is the right place for it?
> >
> > Actually that is something I requested.
> >
> > I think it fits in drivers/gpio as it is such a clear cut usage of GPIO
> > lines, and it doesn't really fit into any other subsystem.
> >
> >> May I suggest moving it over to drivers/misc/?
> >
> > Misc is a bit...
> > messy. I remember Arnd being very sceptical about putting stuff there
> > rather than creating new subsystems, so since I've tried to avoid it,
> > albeit recently more and more stuff gets merged there again :/
>
> Right, and that is mostly to avoid having code in there because
> there is no other place for it. Some parts of drivers/misc should
> have been a separate subsystem, some should have use an existing
> subsystem, and other parts should have never been merged.
>
> The parts of drivers/misc that make the most sense to me are
> those that expose a one-of-a-kind piece of hardware as a
> single character device.
>
> This one would probably fit into drivers/misc/ better than
> some other drivers we have in there, but leaving it in
> drivers/gpio/ also seems fine.
>

This is my point. This really is a one-of-a-kind module that also
doesn't register with any particular subsystem. If anything fits into
drivers/misc/ then it's this.

To prove this point, I even moved the gpio-virtuser driver I'm working
on to drivers/misc/ too as it isn't a GPIO provider either and merely
a GPIO consumer with a one-shot user-space interface not conforming to
any standards.

> I could also imagine the functionality being exposed
> through drivers/iio/ in a way that is similar to an
> adc, but I don't know if that would work in practice or
> how much of a rewrite that would be.
>

I could see it using configfs instead of DT for configuration and iio
for presenting the output but - from what Wolfram said - insisting on
this will simply result in this development being dropped entirely.

Bart

