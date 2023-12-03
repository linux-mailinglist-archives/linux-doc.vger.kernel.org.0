Return-Path: <linux-doc+bounces-3894-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A590A8028E9
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 00:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ED8E280C8E
	for <lists+linux-doc@lfdr.de>; Sun,  3 Dec 2023 23:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D5A1A712;
	Sun,  3 Dec 2023 23:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6tUc4FB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7046AD3
	for <linux-doc@vger.kernel.org>; Sun,  3 Dec 2023 15:09:03 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-db54611b920so1913559276.3
        for <linux-doc@vger.kernel.org>; Sun, 03 Dec 2023 15:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701644942; x=1702249742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n0yeFoRGU0FTZSqIuyxEoTKmmtJdn1QWuVidYm9OV4=;
        b=M6tUc4FBPI9dt+S16w8lFp1U1j5qcZSFEmmAa4Up8JYTrp8yWoT8H/i+DWEEJSxOJ7
         LPlx10MLExqfLk+N7BnqItX9BkmrxZbmAO9Se8P223voJiR0wPt2ZFQ+uotyjiVxLOi1
         /RNVnl9fRSEwykysqlC3LpbwxhPk4pg77dbwbaet2mNP/dxPkotuKCgCm0U3j3vJ3VLh
         RTr5TOFu3iKGk2037kxO83CjGPWggZG7t4qN4pIJsdQEz45SwEXdaJfstDRDw/SEYRMw
         atxfl9j8J86/s6lW4P5iHD8+Q0dq8Zug6OH5kz+X02VhXFztSoUn0p4TSTpHIk1n9jaQ
         R3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701644942; x=1702249742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4n0yeFoRGU0FTZSqIuyxEoTKmmtJdn1QWuVidYm9OV4=;
        b=TC4PUVHPeJwNN/sCt0z5JZh0Oipqxr3ZftnBOr2d5mjmmMLwedULf0qDQXpyvnPhh8
         dBEEJUkSNn/BnHqGD2xE2WlsbA2SGRtwuFV8krN/erB2OaqM+Pua0CEanod1N8hFQSdd
         shIM9XkjR1ivA+hyuYt4+wAEr//gsbq6rG+EiTco7vLtDchKtxhEGNOyBYn8tSw8T0gg
         wngRRiOW6Xwujl1sDB4mvXmGOizI7jznHCS7UgssIAbTRc68UUgQNjg7FPeW7x9gySI0
         LKRwbscc4VVxsxIegGG4ghNo3UhHfSX6oZX4PoLJgIs18auLUagdFsfe79+2z5I8DDR0
         ds4A==
X-Gm-Message-State: AOJu0YxAE4mCbivC3qhFRfKVfVSTGmr4l/dumoY1t/7o2vEbGGfGYCyS
	//C0E3mUoTJMBKn6lEydcGZgtVECpYYQnKSQU3NWeQ==
X-Google-Smtp-Source: AGHT+IFKwL9XjQOio2aM0nIHXvV+LqDJAQsj586dCvFCnDyPpVGAYCPas+78bTi1GwtoWVsyPmywwjtKlbZOkCSepZU=
X-Received: by 2002:a81:8485:0:b0:5d7:1940:53c5 with SMTP id
 u127-20020a818485000000b005d7194053c5mr1927535ywf.61.1701644942703; Sun, 03
 Dec 2023 15:09:02 -0800 (PST)
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
In-Reply-To: <ba123831d7956b0437158a6928ddafb4510ab62b.camel@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 00:08:51 +0100
Message-ID: <CACRpkdYfe68aVNcnvfmLz8y3QOfsyA9vFHsaTL6Y9mZJ31wKRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Andy Shevchenko <andy@kernel.org>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 2, 2023 at 10:42=E2=80=AFAM Nuno S=C3=A1 <noname.nuno@gmail.com=
> wrote:

 Hopefully, I'll get into the gpio stuff later on. From a brief look,
the auxiliary
> bus might feet and easier than mfd.

You can also just spawn a random platform_device from the HWMON driver
and let that probe a driver down in drivers/gpio/*.

static struct platform_device my_gpio_device =3D {
        .name =3D "my-gpio",
        .id =3D -1,
};

my_gpio_device.dev.platform_data =3D ... ;
my_gpio_device.dev.parent =3D dev;
return platform_device_register(&my_gpio_device);

You can then pass any accessors as platform data. This in a way is what
the MFD or aux buses do just more organized.

Yours
Linus Walleij

