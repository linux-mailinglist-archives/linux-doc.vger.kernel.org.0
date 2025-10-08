Return-Path: <linux-doc+bounces-62697-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B53BC520B
	for <lists+linux-doc@lfdr.de>; Wed, 08 Oct 2025 15:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6506E3A9B34
	for <lists+linux-doc@lfdr.de>; Wed,  8 Oct 2025 13:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B7F25FA2D;
	Wed,  8 Oct 2025 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aticjHYl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359A1257422
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928812; cv=none; b=ntfjYoq20gEbAQGBtYkwRWqnfRWMQ+hC2lWYc09r7gwATYutYAI00FsLGpQ6fwyuEzjUEqx25ZKi4HcUELqjpYfzSsY08jWeUbqACBIxOtYCt5xYDErBRIl+eRMl5gZL9Go9gRB6waMqyaElrwGUa1FoSk0XXdsqp+GYEaM6aTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928812; c=relaxed/simple;
	bh=F/KLc0AJ5qXXCxdc7wYUMS/kUrn3DDkOw+Xg9ewXk84=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uqWfnugHFnAZEuxiygJkyZVsuRCAyfMI38A6Wz+ZX8e195ZId3IThJdsUR2AZ5rBcBVWXnBmv5qa7O2DJEvVr/Ue0MfqBI6L7UaAko0eN065Z336HE2awl2rBNOegD01t5a7brsMFnbMR450Pyk/qKYw9AZoyAW+vf3X5BlNPQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aticjHYl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e47cca387so77728555e9.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759928809; x=1760533609; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F/KLc0AJ5qXXCxdc7wYUMS/kUrn3DDkOw+Xg9ewXk84=;
        b=aticjHYlXfEiVK9zv8gtiCSG++sw5pjXRsCdnK6qeDkWDKmzGsg5xZpudCfgB6bH7w
         q+SB6P2FbQYVGhn/7VZu0wCM5gBMTVOb+WBEjcAAFbEaa7G1eF6+qz0di8aDHBwtKPfy
         5II0FDkHZvmIYuUXGsw/nl4ZPwy4nXIGt2oeuTZsxC09EuKFovK+PNQ9PksZDkeIGQw/
         EbXXqpRhguQuOrkwdf1qypfzAF9Ji4g+2Co3+cs+Q+EY7pAOeStv9BZATMOqHGloQAXe
         bxT5oNz7OE7kjBCLO4fqsio9N+VP8ZcAJCy/RWRAcEHpVS3qGtHS6Y5+8FIpz6e1nTzh
         ywjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928809; x=1760533609;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F/KLc0AJ5qXXCxdc7wYUMS/kUrn3DDkOw+Xg9ewXk84=;
        b=ryKqBZcn0eQpoNj3Z3BcwRvotZ9mxvLuW/NxfK9WqPCO9AojZhJ07BPzZW5Uuo4xsX
         h+56HbSoZmPA4LvAYXl9jLZDYAN+Brb69GCf9j6Zm9lxhlJgp4VRHTF7gJNUwcIKAhbC
         pNWB6SJ3cWFcbL0i9dcCbPd24ARkGGBFV0IqiABUkxGjVeXjB4Ax4FWOeEIPFpZGfIuW
         DAn4K/No70cFcv71D4l3GB44XqvI1YcQJAh03Iyyi3mHB2tizZ2i5pv388ubTJDkcwJ3
         HHDyuQzl3+Z0dXNKG+j7aQ9WhJFB4QvMQAmRcvk4CNgSS7Rl1UJMC3b36U6KTVUoereS
         7ytw==
X-Forwarded-Encrypted: i=1; AJvYcCWq8/P6zZXaMdnqgW2+RAJcf1wShj7n1DqGqytAT/TrBb0TRAG3qJnsMpHU6nKgbGZpzLpnqYX4Wkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfKQYRobywXRCpKYmLiqiC/1oXBYEoe+r3Mhz0FIwXR6L5HJ99
	olzI9COZp0YA03Gyo0v6/YxA9xuHLLVv9qxeG4033NSdBrhl0eB38986
X-Gm-Gg: ASbGncs/95h1zREdzCph/ZULDF3816oEz/cLatPBU11DuSjV2aD3rXu1xx4sMxrC6Gw
	Gpe9+8U/0NcRP/vIir1pSdzrRIAbwFcs7gusNibDjq+33eihqbA7MvgE9isw7WsBx0rnRnxuTbS
	DcsQqjzGS+ZBRT3wDaUzbFhP8ztTk6CSpn6XFGFz8C733I92f6YLGMs/aX9+iBZRwyV9GqW3P9m
	CwF4EZ+H4HDqOfJ26LBngmQcQi/7rr2Z0yt61ghcQtiNxdqzXNE1RaNB2jWhpbtGqnddhSmJWIO
	lAGpwX+HDdcZDopo0jrVWCqehjo4meyZTG7+6ao4qlZqHG4PW9duI/dmeWdPXhOjTbPBLoULwtZ
	HSTOCvM1x/wcZzID9a77xJabdCHhJy4Hx4wDy/3rd6g022WALS+BtzTY=
X-Google-Smtp-Source: AGHT+IGs9TvNL0rmTcrQDR+AU/z45s+tapDQMkY0alK/pD4CF+hA5wLEMmSe5+LpHyH6FGvPYm6apw==
X-Received: by 2002:a05:6000:420a:b0:3ee:1521:95fc with SMTP id ffacd0b85a97d-42666ac6a8emr2097091f8f.14.1759928809216;
        Wed, 08 Oct 2025 06:06:49 -0700 (PDT)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6b40sm29969759f8f.2.2025.10.08.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 06:06:48 -0700 (PDT)
Message-ID: <35733a7a33301330260c01b1e59af904c8c4da6b.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jean Delvare	 <jdelvare@suse.com>, Jonathan
 Corbet <corbet@lwn.net>, Linus Walleij	 <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 14:07:19 +0100
In-Reply-To: <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
	 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
	 <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
	 <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>
	 <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-09-13 at 04:02 -0700, Guenter Roeck wrote:
> On Fri, Sep 12, 2025 at 03:00:22PM +0100, Nuno S=C3=A1 wrote:
> ...
> >=20
> > i2cdump -y -r 0x41-0x79 1 0x15 w
> > =C2=A0=C2=A0=C2=A0=C2=A0 0,8=C2=A0 1,9=C2=A0 2,a=C2=A0 3,b=C2=A0 4,c=C2=
=A0 5,d=C2=A0 6,e=C2=A0 7,f
> > 40:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b004 0000 b00c a03e a03e a03e 2501
> > 48: 0000 1a03 e07f e07f f07f e07f e07f e07f
> > 50: e07f e07f e07f e07f e07f e07f 0000 0000
> > 58: 0000 7002 7002 7002 b07e b07e b07e a030
> > 60: 9030 a030 0000 0000 802f 1000 1000 f0ff
> > 68: a004 a004 0014 a004 a004 c004 0000 0000
> > 70: 0000 0000 0000 0000 0000 0000 0000 0000
> > 78: 0000 0000
> >=20
> Thanks - this should do. Note that I am traveling and will be away from m=
y
> systems until September 25, so I'll only be able to look into this furthe=
r
> after I am back.
>=20
> Guenter

Hi Guenter,

I was planning in letting merge window to come to an end but I might just a=
sk
now. Have you forgotten about this one or do you want me to send v3 with th=
e
superficial review and then you go deeper on v3?

Thx
- Nuno S=C3=A1

