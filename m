Return-Path: <linux-doc+bounces-93064-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4zSzEEECOWpolQcAu9opvQ
	(envelope-from <linux-doc+bounces-93064-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 11:37:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8A6AE4D2
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 11:37:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VeXe5Ab5;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93064-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93064-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE64A300E619
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 09:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B7D39B4A5;
	Mon, 22 Jun 2026 09:31:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576CB36B043;
	Mon, 22 Jun 2026 09:31:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120715; cv=none; b=P0HUcLb/psHFPyW0SF0HfWBIBlM0sMiAUNr8BXbaGvqhuBbnSWjBXrK6rEkwnVwMxl8BNLR72XDTR8ag8ATsP1pTqcjmmZsPFHcR+7MRZ2ztEbtZyaoxoyB6c3zk6zgzmOKPqqV3kKEpZrFeykvua1lFovS9+zF3TvoYuJ6aT34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120715; c=relaxed/simple;
	bh=UnPOkMHd8BdlyvKoh71myAbOqirYWTq1WL7l4K6f9XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekgh81xPEPGCc565ZBz7ObQoEgMQNbzqMoNYffPwqlPKlf7GPvQbzr8lZZfKUWuRn0C8JarAJdBoVvuK2RokqOxVa4l6xuTKbzc4q/ld2NZdW98QQoCJHKE55Tz1jhPxBa6JxkJeQsnQoA6vqrA5DJ1nr8IopXO0UwV4XzDjueg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeXe5Ab5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4A01F000E9;
	Mon, 22 Jun 2026 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782120714;
	bh=/wMrvTFn+e96PT0RdnbzBYhT8emMG2peC8487LRRtEo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VeXe5Ab5e+QhHiix2HoTicpbtNT94rMahMAl0j1PTPC0WOz/Lo3IyT5Eap0VbvU3r
	 gQKDXu5FKAnj+fkk2MeyqgGWlQOpPnVTLCSoCa0yprclnfBlHKED8lqY9pHdbIjqlk
	 cduC91pF593Y6++eIvBYShaIYtUOGwyMKBz57ZzWYS8yVu0BmMcoIaUgOiBsvS0Iu7
	 Vwp+1TnpSyVDD1R2wbd5P8pvPzUpY6+VX9FQ1N7WK/oaTQh/kK8kUi0Sk6uNbs9481
	 WTI9maGJtI9/fP2H+8pAxy8bzb7sWad9hIMjLkqqfrH1iE3pEnWiLatbmMcK0i04pu
	 2te4rpy/NBU3g==
Date: Mon, 22 Jun 2026 10:31:42 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Janani Sunil <janani.sunil@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, David
 Lechner	 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko	 <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet	 <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Janani Sunil  <jan.sun97@gmail.com>
Subject: Re: [PATCH v3 2/2] iio: dac: Add AD5529R DAC driver support
Message-ID: <20260622103142.0cf5dc2d@jic23-huawei>
In-Reply-To: <9c5104eb504e390c2267e0a17762fdb6d73d75a4.camel@pengutronix.de>
References: <20260519-ad5529r-driver-v3-0-267c0731aa68@analog.com>
	<20260519-ad5529r-driver-v3-2-267c0731aa68@analog.com>
	<9c5104eb504e390c2267e0a17762fdb6d73d75a4.camel@pengutronix.de>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jan.sun97@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jansun97@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93064-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,metafoo.de,baylibre.com,kernel.org,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6B8A6AE4D2

On Mon, 22 Jun 2026 11:12:19 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Di, 2026-05-19 at 17:42 +0200, Janani Sunil wrote:
> > Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> > 
> > Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> > ---
> >  MAINTAINERS               |   1 +
> >  drivers/iio/dac/Kconfig   |  17 ++
> >  drivers/iio/dac/Makefile  |   1 +
> >  drivers/iio/dac/ad5529r.c | 527 ++++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 546 insertions(+)
> >   
> [...]
> > diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> > new file mode 100644
> > index 000000000000..9bb63030db95
> > --- /dev/null
> > +++ b/drivers/iio/dac/ad5529r.c
> > @@ -0,0 +1,527 @@  
> [...]
> > +static int ad5529r_reset(struct ad5529r_state *st)
> > +{
> > +	struct reset_control *rst;
> > +	int ret;
> > +
> > +	rst = devm_reset_control_get_optional_exclusive(&st->spi->dev, NULL);  
> 
> Consider using devm_reset_control_get_optional_exclusive_deasserted()
> to save a few lines, and to make sure the reset line is asserted again
> when the driver is unbound.

Given we can't assume it's a gpio reset at this level (it is but meh,
we shouldn't use the API that way), we can't guarantee it was ever asserted
so we probably have to do a dance of assert then deassert.

This is one of Sashiko's favourite things to complain about so
we ended up doing some digging into that path a few weeks back.

I'd really like that not to be the case so maybe that analysis is wrong.

Jonathan




> 
> > +	if (IS_ERR(rst))
> > +		return PTR_ERR(rst);
> > +
> > +	if (rst) {
> > +		ret = reset_control_deassert(rst);
> > +		if (ret)
> > +			return ret;  
> 
> This branch could then be removed.
> 
> > +	} else {
> > +		ret = regmap_write(st->regmap_8bit, AD5529R_REG_INTERFACE_CONFIG_A,
> > +				   AD5529R_INTERFACE_CONFIG_A_SW_RESET);
> > +		if (ret)
> > +			return ret;
> > +	}  
> 
> regards
> Philipp


