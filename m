Return-Path: <linux-doc+bounces-6570-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75833829C83
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jan 2024 15:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 823011C222CB
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jan 2024 14:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B0B4A9BC;
	Wed, 10 Jan 2024 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+tYxfnj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3A1D53F
	for <linux-doc@vger.kernel.org>; Wed, 10 Jan 2024 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5f70c085d64so36077667b3.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jan 2024 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704896881; x=1705501681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHA6IOQJZCL8fY8165RHfI6p058wfxTW2v55pDomW+w=;
        b=v+tYxfnjhwoNBifO6jtJw0Yki4TQPdwi/2ZcssbVujC07QmpH2NeoccyuNuKOGrB/T
         qSh1ujTy0QP/RQ0Rwqbnb3XH6NAqmaUzTJd7UOFFHWlo2PWr5wAqvHKyOGHd89nODxNJ
         +YJNuryu3JmySz2W821/jKNd9P4lVKDObH3HnoQ42ZinNsuAwVhW4lbyCGntDOe6sgXw
         ZNPbpiFfPe35a0J9yRLrP1738ab7JQts40e7O7cQwu5oecCamWvJwBSVrIwKXjaP1EGt
         u4HLRo34nThnuGkqCnYYRSjXhmlCWF+joVZ6WZpm7pGBabYZVGVD403Rgf7QCIYLQDA5
         DXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704896881; x=1705501681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHA6IOQJZCL8fY8165RHfI6p058wfxTW2v55pDomW+w=;
        b=SsmBA4tiO2myed9USoNXGNSuRBIVa90IeOIZQDZox13Nwz6par6CEDBgpDyS0HJzG8
         ZgVEX6tVw7lzNvh8P6s4nAvg5rM40rknmm+L+J6IL4BPCGu5bYLvz5puNda80m6It0tg
         qqYKzkLCSRPgcUbJWoZ66fNzyLeiKv3qjW6ky7K+8Hq5W/7kP2hhVMdChqu6S/CCEJzf
         ndWZNV0RHe6vqnaPgMBBWwMsBlSSYhMAy5AJ/wOaZtFtkHvkwu7FNAF/Io9pnFGWolTR
         iRkaiVkIUbps22aLxgtONDOTt3bbTfK/S06OZiSYKHV5XIdCy6is6ydfNZeGWIXlH9SP
         D8dQ==
X-Gm-Message-State: AOJu0Yz+/nuy4Y8Mn6g+5/ByW3tqgb50UnaIMgkTdWaAP8zyJlHmN/K+
	H3Z2CBIfI95mYkO9XCePE/vc6qHU13TFqeao7nviroYxIgIlBQ==
X-Google-Smtp-Source: AGHT+IFHHLat3O+W0WYf5WHd6ImU3yS67+/EVACzLX2Kkev9l/R9s5KpgLgW/8nAqkOLZbtYBZ8dGhISQuyiqahhs6I=
X-Received: by 2002:a81:5486:0:b0:5d7:1940:b382 with SMTP id
 i128-20020a815486000000b005d71940b382mr1126705ywb.78.1704896881673; Wed, 10
 Jan 2024 06:28:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109135952.77458-1-warthog618@gmail.com> <20240109135952.77458-2-warthog618@gmail.com>
 <CA+kSVo_347gS+w_7ZXFDi9qDtT1aw15qoWRJZAVSkfbHShz7kQ@mail.gmail.com> <20240110130158.GA28045@rigel>
In-Reply-To: <20240110130158.GA28045@rigel>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Jan 2024 15:27:50 +0100
Message-ID: <CACRpkdY9yXknHVQMq09Ep_y_Hk6iOkNqDS8icAKFW+fLDdwi-Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] Documentation: gpio: add chardev userspace API documentation
To: Kent Gibson <warthog618@gmail.com>
Cc: Phil Howard <phil@gadgetoid.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, brgl@bgdev.pl, 
	andy@kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 2:02=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
> On Wed, Jan 10, 2024 at 11:40:34AM +0000, Phil Howard wrote:

> > You catch more flies with honey than with vinegar, so I'd probably soft=
en to:
> >
> > Before abusing userspace APIs to bitbash drivers for your hardware you =
should
> > read Documentation/driver-api/gpio/drivers-on-gpio.rst to see if your d=
evice has
> > an existing kernel driver. If not, please consider contributing one.
> >
>
> The note is is a rewording of a section of the existing sysfs documentati=
on:
>
>     DO NOT ABUSE SYSFS TO CONTROL HARDWARE THAT HAS PROPER KERNEL DRIVERS=
.
>     PLEASE READ THE DOCUMENT AT Subsystem drivers using GPIO TO AVOID REI=
NVENTING
>     KERNEL WHEELS IN USERSPACE. I MEAN IT. REALLY.
>
> So I've already toned down the vineger.

I wrote that and I recognized the strong wording.

I have come with great regret to the conclusion that it is better to
shout like this,
note that the sentence is not directed to any specific person and that mean=
s
it is more OK to be harsh. It is not feedback to anyone, it is black-and-ye=
llow
warning tape to not go into this dangerous area.

I like the current wording.

Yours,
Linus Walleij

