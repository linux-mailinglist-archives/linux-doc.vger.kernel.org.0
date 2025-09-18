Return-Path: <linux-doc+bounces-56738-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AAEB2C3F8
	for <lists+linux-doc@lfdr.de>; Tue, 19 Aug 2025 14:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A1BF188550B
	for <lists+linux-doc@lfdr.de>; Tue, 19 Aug 2025 12:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05866305070;
	Tue, 19 Aug 2025 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BGCcAq80"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143943043B4
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607026; cv=none; b=o65J/S/v39gUoW7KJuv7yiybqO/9bCnVh1L+9ZzuD8K0xpBdFgXXK444OpUBdq7ofWgb6BMyt/fkKXieTp90ew7FZcRv2lR90NQ2u/rkaTy+xKCf38cyWEV3S0YmFiLV8CpgL/+meYoKWSPje0/8mGg4WMa7mMOYHgDhAzZKLjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607026; c=relaxed/simple;
	bh=kN8PO+yKJPtjoWwliqsS5UIbKU7Fz3RgcBRi7ndKNpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Janft8dZTxReoejqoTHaLzNZKsf+4o6N215lCPpXyYZaNyXqqb7PgSbnXnxzOn4hF5LFUjkHejaI7DMG68pqKtnX14GShsKU8Dqcw245M04qaTGGpdJbyAzFW1g/kJgsl0SSwci2DzqIYBtfirMKyR4iJTAKqKQ6g6v/TKDGzzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BGCcAq80; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55cdfcc0ceaso5525572e87.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755607023; x=1756211823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN8PO+yKJPtjoWwliqsS5UIbKU7Fz3RgcBRi7ndKNpc=;
        b=BGCcAq807utLEGokMXk9xTPzJ2PItinwPONnVrP7/PpnAc9Y7qVssUNIxhJvzDuTiE
         srgbAai4+DoRNGsxFpzoC/tVQYScCyT31uIKdMTCvgr3Mg8QEpQZe1GrBmmg2tCaeJD7
         Tol+Mhj9Pbh0FOs4NxaSE9I0FLiruWqPBAYM6FjSpgU8FGVBNAl2VKHfPtmwuqk/rTCs
         bFgwxI+Or7+bkUYpg7c0cGODH17Jh0Ejz5HK0uW1Wc+PhxLRe6RJIu9yPwSwzY0cwuXl
         R2umaS1ZoHl1FIvkS1GtJVZ1CJxyifpGvVFETgZE5ZhYh6TGUiuOeyeTl7GdSVLjJU7J
         5EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607023; x=1756211823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kN8PO+yKJPtjoWwliqsS5UIbKU7Fz3RgcBRi7ndKNpc=;
        b=w6gMrYbGnHQ+atudiBchhCjKFP4TObtSmemwV9cMGBRq4uoFUe50bOfUjaXxarhiVX
         Z+TbP9+Pyyab6qHWa4CLha4Rjtdl7b5jSOnbz//kmwEX33zPteS0ZMCug6JV+QvNCNYi
         2tb5MglfJieLbiaB2tlscYqDJwE+zbmpFg5YWHjjC8lg2UI9F0gQOPKIt6X+bjYLfJKR
         IvP675LNaiSIYIt+4h9tgdW+0FSQxk+f/qtX5R2d70r6c3+xcwQxI4p6QIY5OrU3/cbE
         CpnY5Qz5PAp8QB4agqhMx0oPItq2Ql6hlAoy6NzRARr4DnDW8f7mH4H8yuA6umYbOhGQ
         yO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXMhkRuTHFT5J8I4H3rzsgcBdba/WwZm1yNed+ZemAhsYWTklFnyXekrG9a0vxNqkoiB3mhao4jK4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx780TNR6pBdWqQ8Ip2PVqM/63wDXkzAnB5ZB3a1h6CjpgR60Jt
	lNNKdPTMcT6e0t6Z8uFU91VVXcH+eUSx56XafXoATuS4gfz9h3rXPbYCkv2pLaJDhJjblYD1KzY
	wTyAp61cWZUB+zlIZ+XyFKxZcEbCKR0quF27r8qXvHQ==
X-Gm-Gg: ASbGncvFl/9q6NsPtpRXrWnYs7p3Gz4WF3QIpYsq9CuMUx7W4EqApp24QH0ln83+QbN
	W2gcN31iydVsFD5u0hPxZjgC7kNyC9paZ+6T00htzQ9rkKJ4qetha02U04UvgtFw/TZcH6ydwa6
	0tii1yv/m/Ib/wzJNtgGBNE5xpUKuv7pfB8DfnoqotRUk2br35PloMV7Xw/ulaTqZbpEv8QUD9C
	P5IJ5uoXfR/
X-Google-Smtp-Source: AGHT+IF60h4WVMQ3B1KL8q6jLUasLc8BlggUoJR4OlVpazMLoejvJn79GNV6qXgLhSQX6llyrVFMUqcEDHaass7Rvi4=
X-Received: by 2002:a05:651c:419c:b0:329:136e:300f with SMTP id
 38308e7fff4ca-33531447abemr5458501fa.13.1755607023091; Tue, 19 Aug 2025
 05:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:36:52 +0200
X-Gm-Features: Ac12FXxreBRNMQ-2ir2X10nBf7B7qy9Abw0x-1rD12XgK0TSMm41kUIDeST3KoY
Message-ID: <CACRpkdYWNgU8PxVaxDe3F6Cbb15J5cgEV1-kgDooOHdBoXXs3g@mail.gmail.com>
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
To: nuno.sa@analog.com, Jonathan Cameron <jic23@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 12:52=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> The LTC4283 device features programmable current limit with foldback and
> independently adjustable inrush current to optimize the MOSFET safe
> operating area (SOA). The SOA timer limits MOSFET temperature rise for
> reliable protection against overstresses.
>
> An I2C interface and onboard ADC allow monitoring of board current, volta=
ge,
> power, energy, and fault status.
>
> It also features 8 pins that can be configured as GPIO devices. But since
> the main usage for this device is monitoring, the GPIO part is optional
> while the HWMON is being made as required.

This main device just screams Industrial I/O, IIO.

(I think it's fine to use an MFD core and split off GPIO to a
separate driver, and I suggest maybe you merge MFD and
GPIO ahead of the main driver.)

Jonathan (Cameron) will have the last word on it but IMO this firmly
belongs below drivers/iio.

Perhaps not in one of the existing subdirs there but then it is time to
be brave and create a new one.

It will take some time and consideration, but I think it would be better
for everyone.

Yours,
Linus Walleij

