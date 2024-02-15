Return-Path: <linux-doc+bounces-9526-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D68855FDC
	for <lists+linux-doc@lfdr.de>; Thu, 15 Feb 2024 11:45:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0AFBB2E0FF
	for <lists+linux-doc@lfdr.de>; Thu, 15 Feb 2024 10:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23C769D0A;
	Thu, 15 Feb 2024 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V8I2WIF0"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6799969D01
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707992807; cv=none; b=Yra0/DIsg8vVUHpl9lkkjcvcO253+bezgV/+S70cCN7/Ir57zUUI+J12x+HvArUY+Z6NGWLD3kgZ9U3aZ/YP5iwJUSz/iu+D9cxBh05xzQvKvf6o5Io7lN2k0jT8kN8gxbDdhymS4XeswR/0xGs5swpl+yKLFS/246awfBZ8yKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707992807; c=relaxed/simple;
	bh=VlVepo/NDpXDvIFU4Rid0oX2XIVrdjuPr3NAtWZLA5A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pl8G0i7o6xNgadPZzyInh1GXjP4kDVVaNMfJcnUmIkYD8vj2I44t1y1TfYxGn5ei9wlFW8X7Rts3dPBMvzhAFjNMU3x+Dbo2h0fRE1oq67EdvjEwarHrgvRfPc3woL0WvQ0PtebGD3zWIzsl/5von/a1vBBVrxNbcz9Iex+/85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V8I2WIF0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707992805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VlVepo/NDpXDvIFU4Rid0oX2XIVrdjuPr3NAtWZLA5A=;
	b=V8I2WIF0mlU3iq02ve4Hv+Y6Hl8u/h4WjSTCQ+nPxAQur8MJuk7s8Y8vC3TTjf6HfNjq0u
	UXcEA7V0o+0F2BWXacTsBK6dFCVOXjcCaUtfdiLbTIWbmlGb1AlAv7B6PWQQ36S+USLUW3
	iMawvXcDzFcqg1zlq3Hb+pLQEX7bSzk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-FNs1edi6MEWAzVp5Eyf4PA-1; Thu, 15 Feb 2024 05:26:43 -0500
X-MC-Unique: FNs1edi6MEWAzVp5Eyf4PA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40e4303fceaso1617355e9.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 02:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992802; x=1708597602;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlVepo/NDpXDvIFU4Rid0oX2XIVrdjuPr3NAtWZLA5A=;
        b=gUXqAJLLgWVeL9ilEFKMEwVxfXJ5kkjiNFpsVKmejQlj1plLZxZ7TYkVcNaBrF6UYb
         0oJ7BABhOCy7flK6bhegXtpZROKwfOX7+OWyGwmxg5Uej3yRaCKo2L4QRrgZjWkxXvPL
         QtMwuqv2V5vXB6FaOLTqinXZoBuxk6oTS+5DaXt8i+Apge9nHi04AHL+ZatlFdpoXdu4
         yodpGO/PhCsxi46ODMB8QoXHjucVC4kfMT7Ef4nA4FXFqMFZylp04/DC7Y8dn5n9UlM+
         hzB+7Ysnm7T+kOrwisikDmSygl9JtdFgk5OBeqqee1nkCcBNPPrwqhMifRM/yNa3edmV
         xGUg==
X-Forwarded-Encrypted: i=1; AJvYcCU2EP3sm2o44bXpbTMg2l2Y8yQZhEbixTVwAnvCBzr/5XR6Aa9+AWzy1zDLmCzO7p4HkNJe0Ky2LDDNOX3S4Jh2tdit6uGeFzrV
X-Gm-Message-State: AOJu0Yxxo2OvObQJdqbQXrhFCcgnzPXVdvl1jqYnH5jFC0M0um3KWLaG
	2L3rgHzGeR8Oy1SucdtfUWK07QvXFIFyLIj3aD5B1hSnKOzeqcKarY0hyOP5CqERoqSSONWOr/k
	pAfkU/aiUbL1pap/bCZqmaN1rSgxkzKx3CcY5z/QM8/mjSFc6ZIsYU+BnWg==
X-Received: by 2002:a05:600c:3550:b0:411:de28:bb58 with SMTP id i16-20020a05600c355000b00411de28bb58mr1000557wmq.2.1707992802039;
        Thu, 15 Feb 2024 02:26:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmte3W9zihZAN6S/rvlMjLTydWTOdUxVztjFWSwq+qHrZwZRrHKFoM8N930oI9WOaYDu809g==
X-Received: by 2002:a05:600c:3550:b0:411:de28:bb58 with SMTP id i16-20020a05600c355000b00411de28bb58mr1000540wmq.2.1707992801729;
        Thu, 15 Feb 2024 02:26:41 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-227-156.dyn.eolo.it. [146.241.227.156])
        by smtp.gmail.com with ESMTPSA id j4-20020a05600c1c0400b004120537210esm2488937wms.46.2024.02.15.02.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 02:26:41 -0800 (PST)
Message-ID: <8eb6384a82fc4c4b9c99463a6ff956f04c9d5e33.camel@redhat.com>
Subject: Re: [PATCH net-next v8 1/2] ethtool: Add GTP RSS hash options to
 ethtool.h
From: Paolo Abeni <pabeni@redhat.com>
To: Takeru Hayasaka <hayatake396@gmail.com>, Jesse Brandeburg
 <jesse.brandeburg@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mailhol.vincent@wanadoo.fr, vladimir.oltean@nxp.com, laforge@gnumonks.org, 
	Marcin Szycik <marcin.szycik@linux.intel.com>
Date: Thu, 15 Feb 2024 11:26:39 +0100
In-Reply-To: <CADFiAcL+2vVUHWcWS_o3Oxk67tuZeNk8+8ygjGGKK3smop595A@mail.gmail.com>
References: <20240212020403.1639030-1-hayatake396@gmail.com>
	 <CADFiAcL+2vVUHWcWS_o3Oxk67tuZeNk8+8ygjGGKK3smop595A@mail.gmail.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Thu, 2024-02-15 at 17:44 +0900, Takeru Hayasaka wrote:
> As previously advised, the patch has been divided.
> I apologize for the inconvenience, but I would appreciate it if you
> could take the time to review the patch.
> I understand you may be busy, but your confirmation would be greatly
> appreciated.

The series LGTM. I *think* the series should go first in the intel
tree, so it can be tested on the relevant H/W. @Tony: do you agree?

Thanks,

Paolo


