Return-Path: <linux-doc+bounces-96936-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xb/gIduLV2qyWgAAu9opvQ
	(envelope-from <linux-doc+bounces-96936-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 15:32:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FAE75EB57
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 15:32:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hPR1zZy4;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96936-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96936-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2622C307C690
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 13:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB19432BC9;
	Wed, 15 Jul 2026 13:29:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8732A472791
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 13:29:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122183; cv=none; b=rfYoU9Wn0woFYBXI8m11h60d7CKBOsuGJFzfoVQ8GT+PssoFGNc630bmwNAEeu195Joy705OuUVJEiLsbmFWiF9ZN24OompBycCjRp1qqAX1Frdf3lLYNrYtfnYh/nGfXFQXdy4WfJi6m5d4/BdrMxw654XKuVyvJFtV1ABkpLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122183; c=relaxed/simple;
	bh=zRo/gK16oMS7vWD/0v0ZdzYrGb0S0hZPcGmBlokvCc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDsgxeOtkS0GVVbHZpvDSL/V8kZxBWA00Iwi2u0DUV595e4CMSGjdm9esit9Qvj5h7ANQfAKHGmIDPhJG7kkX2p7ZzstUZKA/p3/PVGXCkPVIy3FBAQjC6RtKOvJ4pnlqv915EitPjIo2K+M8tu1eQufuqhamv373oiLmFOoPVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPR1zZy4; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b27c7451so8442385e9.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122176; x=1784726976; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fC/uQJ/wM6LfyAr0O1pyfwfICQNJXf2TkvnQK+M76HI=;
        b=hPR1zZy4M3LuHP21XWihI6AeAL8VIXcmNwNUtnN4SUCZjQncROFRPqgAzQvhlEoYeQ
         lP9tlVKpieD9v9jHgPk8VuthTpRQvi5qMu1PdT689AOe4zbBdog/hcs/uQRaAnhnuzeb
         JUW5pxBz3pabKUBzx/fdiAFrY+RVOJsL2XfBugyy92sFye9UvotJXkUHFL4UQ0J1fzkd
         nUjJQVY52tDwbCQiKo43QMWPch0IxZp75S9PgxnbHV+M/qY55UQ9OJMnVYZzANry0fIX
         o3wLCNF5QULucWjeTj63b6tCYbqx9FC0PUMJhVAwqBJJuNrnK3Hfl1rFxdHtNLcughx2
         oM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122176; x=1784726976;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fC/uQJ/wM6LfyAr0O1pyfwfICQNJXf2TkvnQK+M76HI=;
        b=Rtn5pwOpYot5fQn37svGgjwXeINNhzsb5N8KO4zBxNDH19YZHt3YPx0+reN0OwFUko
         CsR13yZ8v9+h/PPMn4Y+IC8priQtlHe6lOqOJ35K/MpKKzQy/KwdqsGouJDRPaGW/n3D
         jTtDwcadPQA246biyky8xUAsyuexSRJtiO1FujIwXvHLzNDliFl2rPcxYMEK8j0+t0yI
         6sB1RP5QcI76AHJXUBXRrsJfwNvtW+3xDTCcORMah4Twm6GRQZLI5O/GAWDHzAV5yMJu
         Oj1NZ8713fRfXPPYxsunFXeoq4lQDOX+siihHZo/LBdpH4Z3qESMh/eatlkNSbFShi42
         wv/w==
X-Forwarded-Encrypted: i=1; AHgh+Rp3NeL8PqksT8SkAGtmhFPUPLHyQkIOLgQV9okLHubJsXSBei1drXVLIc2mEEYTbCCONORUP4Dgtak=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb2ikR8vBxheMIiBK7jQgBQ6kQ8rMMNHUB9RluOQhcCfg4hSUf
	92CbBq5ag1+3gvzM7WI6tVkC2ZRtwy6W2+3r5hVHST+VtCsoMx7lT2mq
X-Gm-Gg: AfdE7cmspv+3D+zfbno/YARWF40fhL/tA9RT0Gc4nRwOcVpRcCLSxctSNxjF2CGJUAC
	tOG2j1BkKmbotzdRmFVBXGh3J2HdZihQyCRHlTA+9uPoS0TI6NaOuyUAif8buMaS8okso6H7ihi
	FCHRLBX7tD8hXG7Q19mxL1NR4FXsExXk9iWRaFkjfPYpetQIhEQaRGBry5HF5CBX5rsLvdiGcQA
	d7OIkXw1e0Ut31S+LKBSJ93vBc1JHu49hod2lD+sgT6yqo0jjUdvVMVKRolHhyXttu+Hz+30hKt
	iVOOv2hEXliufYLTMBjmw9b3lzAa5DSiqrQ4sLdcfRscOrm6SZXrif3E7V8oDuXaDERaxM6c+oW
	/eRPYzbBPOuJzB3bdbnFz1iuipbOrqlzuVugrd5q+3AyNpj3vbzFavOBCLTMTdTOTLQZ8RbPqKX
	WZyupYXiCUZyg2eYTdhStEwAKV/3E=
X-Received: by 2002:a05:600c:4e16:b0:492:714d:8c4 with SMTP id 5b1f17b1804b1-49400818cd7mr135805335e9.11.1784122176062;
        Wed, 15 Jul 2026 06:29:36 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495087366c0sm274958745e9.7.2026.07.15.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:35 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:29:32 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Marius Cristea <marius.cristea@microchip.com>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Janani Sunil <jan.sun97@gmail.com>, linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>
Subject: Re: [PATCH v6 1/5] spi: dt-bindings: Add spi-device-addr peripheral
 property
Message-ID: <lpbqk3wv6emhdtxhnczrgufzzxprcfpfgenfepnmzhzfj3b3ci@rdphuko7ikti>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
 <20260715-ad5529r-driver-v6-1-cfdf8b9f5ee3@analog.com>
 <1c4af9b1-9937-4cbb-b57f-52ac575b8b89@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c4af9b1-9937-4cbb-b57f-52ac575b8b89@sirena.org.uk>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96936-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nonamenuno@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:marius.cristea@microchip.com,m:marcus.folkesson@gmail.com,m:kent@minoris.se,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jan.sun97@gmail.com,m:linux-spi@vger.kernel.org,m:nedo80@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:marcusfolkesson@gmail.com,m:jansun97@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[analog.com,metafoo.de,kernel.org,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org,microchip.com,gmail.com,minoris.se,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rdphuko7ikti:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21FAE75EB57
X-Rspamd-Action: no action

On Wed, Jul 15, 2026 at 02:09:19PM +0100, Mark Brown wrote:
> On Wed, Jul 15, 2026 at 01:41:04PM +0200, Janani Sunil wrote:
> > Some SPI devices support sharing a single chip select across multiple
> > physical chips by encoding a device address in the SPI frame itself.
> > Add the generic spi-device-addr property for describing these hardware
> > addresses. The property is placed on the SPI peripheral node and may
> > contain multiple addresses.
> 
> This really isn't a generic SPI thing, if nothing else you need *far*
> more information in there about how exactly this would be put onto the
> bus.  If it belongs anywhere outside of the specific device's binding it
> feels like it might be regmap.

Just for some context,

For the analog chip, it can share the same CS line with another 3
identical chips. It has two pins that depending on how they are set act
as the device address (so only one replies to a given transfer -
naturally the peripheral driver needs to setup the correct transfer
and that depends on these pins setup and hence dt property). 

This property reflects that. Apparently some microchip chips are doing something
very similar so Conor proposed a generic property given that we would have at
least 3 users of it.

- Nuno Sá


