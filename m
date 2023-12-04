Return-Path: <linux-doc+bounces-3906-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0987802D06
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 09:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCB8C1C20A20
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 08:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5F8D527;
	Mon,  4 Dec 2023 08:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N8w96T/q"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE88CB
	for <linux-doc@vger.kernel.org>; Mon,  4 Dec 2023 00:20:48 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-46487cb65f4so198663137.2
        for <linux-doc@vger.kernel.org>; Mon, 04 Dec 2023 00:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701678048; x=1702282848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28cyFAoKbjfR/kdzsJO4rKA0W8Gwei+uNVU1U+mLnOY=;
        b=N8w96T/qdSKRauf4IQYWf51yYd7AUPub2Xz3wbmAkfYCAHdPYC3QnCSxZHrYt7B78L
         B8DnsnFqZQbN+pMBV4SBogerVfO55Oi/ZNQE5tu2SZwfdnZF0TKN5Fqt5uWoRVxx/gC4
         YCp9FfEQBuHqBW8/MeMuJdCOyD/G0GlqyDbH8vEkLLUda+I+ijlCcRaAgUskUzvmri9b
         4F6z4HE3e5+sCVPV6XyAcv8tmfwGwNWAEmtMUi8Ts5QIl2PYx0MTzv8hgmTP/ARaPCIR
         miekL2a9cebjExQN6GoYqn7Hobxzf/97mdNxr38L5YpLByG4RG5zVHn2+V0X4O5+j10k
         SRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701678048; x=1702282848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28cyFAoKbjfR/kdzsJO4rKA0W8Gwei+uNVU1U+mLnOY=;
        b=gOTvLSqq9qDcCU9N6wjr7UbEWr/Av2mVz0kb5GWElPLUJuYmmL2OukR+Smpfr0LfVP
         g6zos1pvbv6yP/0rslSPJ5dCOR+Pu+heKKTbfzYo63MyTJYvJg2OPrJgaJFj84eGbpAA
         i8sMHmfgZbgdFxsO3wMfPcbG0ackmtzw6A2RLEYPYDObXfk9NrwHtq8KMpFr2NOw+sFX
         FgRgmOvCiJgt73kXkRDxzVhKIrt0ceLMd6MCPXQ/SoyVam7cn7V21p9A4d8OyBVlNMFX
         opG0VRmRMTchdZJ9co9dTakZfNXE3kcmm285a1PDTodzNO/pIxU5LhLuohMTontsLpfX
         yOOg==
X-Gm-Message-State: AOJu0YySWl0EXE20rCCbuUoN5g0htx0GXEEN62hwTMkJ31UHgnoSP9Wv
	rq30gmzkuJ2DL6J4W2H9wGQSJIZOHSQjZ7rRaJeflg==
X-Google-Smtp-Source: AGHT+IFN6y9qVR68yPdmtEVkrffiZvx/PZkLrVxoEmSzgloE8lDnAEu7zQvU5ulZRB2pdnQGBoz5tKZCHvsO1wQm0SY=
X-Received: by 2002:a05:6102:34e2:b0:462:c2e9:6dda with SMTP id
 bi2-20020a05610234e200b00462c2e96ddamr1269374vsb.31.1701678047986; Mon, 04
 Dec 2023 00:20:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
 <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
 <ZWiP3i80KnVk9qyx@smile.fi.intel.com> <a4bd59df0c5bc1be5d0d6f11b968fd61a59ee2e0.camel@gmail.com>
 <CACRpkdYz+qi42Pz8CgeWybksC0edaVux6rcEhwzjDWnWe9Jr1g@mail.gmail.com>
 <61a8f54835c10db7a9c650ee2e3706b47382c634.camel@gmail.com>
 <CACRpkda55HzPqus5KR-t=xEBkkdND5kYZj1sHdxK+j6QwDUPRg@mail.gmail.com>
 <b761d2497462664d541779857398b2aa893cbee5.camel@gmail.com>
 <ZWoABzufPkdXnrMT@smile.fi.intel.com> <7dc3f137-6073-4262-afb5-439d024bbbd2@roeck-us.net>
 <986fb7dc2a34602fa9c2d57a7a3e06a71cfdc0a0.camel@gmail.com>
 <66454ca2-d5cb-4701-a237-03b3991a791f@roeck-us.net> <ba123831d7956b0437158a6928ddafb4510ab62b.camel@gmail.com>
 <CACRpkdYfe68aVNcnvfmLz8y3QOfsyA9vFHsaTL6Y9mZJ31wKRg@mail.gmail.com>
In-Reply-To: <CACRpkdYfe68aVNcnvfmLz8y3QOfsyA9vFHsaTL6Y9mZJ31wKRg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 4 Dec 2023 09:20:37 +0100
Message-ID: <CAMRc=Mc9dbyNEdg2W9WdptjnuG_bFsBFXuimyU9gccqUVsqTxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Andy Shevchenko <andy@kernel.org>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 12:09=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Sat, Dec 2, 2023 at 10:42=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.c=
om> wrote:
>
>  Hopefully, I'll get into the gpio stuff later on. From a brief look,
> the auxiliary
> > bus might feet and easier than mfd.
>
> You can also just spawn a random platform_device from the HWMON driver
> and let that probe a driver down in drivers/gpio/*.
>

Please don't. A "random platform_device" even reads like a bad idea.
Conceptually the GPIO part is not a child but one of the modules. It
should be an MFD device IMO.

Bart

> static struct platform_device my_gpio_device =3D {
>         .name =3D "my-gpio",
>         .id =3D -1,
> };
>
> my_gpio_device.dev.platform_data =3D ... ;
> my_gpio_device.dev.parent =3D dev;
> return platform_device_register(&my_gpio_device);
>
> You can then pass any accessors as platform data. This in a way is what
> the MFD or aux buses do just more organized.
>
> Yours
> Linus Walleij

