Return-Path: <linux-doc+bounces-88179-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDtREIkXC2o5/wQAu9opvQ
	(envelope-from <linux-doc+bounces-88179-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 15:43:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FCE56DDD6
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 15:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4B7E303F73A
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2026 13:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9886448A2AB;
	Mon, 18 May 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwI1Db6T"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1C9481FCB;
	Mon, 18 May 2026 13:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111737; cv=none; b=SnDdLcJfiytYnLv71u+beVI3IXxBDyr+NEWgWrP8mFQIbjY+pvxenc1ifuCkvOH0ujkqwhQ/2yhKnRGa7oSIcgMH644JMc14nqXXSka+QAbN5iEVgStOrAgjzL7kD02k8KsdSiwL1Sq2/TWgwIxmXWW4ZVzKFprMlAvOF9BX++s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111737; c=relaxed/simple;
	bh=/cKjp+lN7lfgaOIhnPq3azQJjuWDv5JvIceAfXmKznY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p9QvPX0XvP0a7hAQRgpVaMAE1RdjOa61w6bjMbHg+MnYor9iOr0OBZIl68ZTqgQk1A4PnQgzc7wflhPrLOyUgz/+lP37lE06VvWXBYYPn7/Hfbjn+QJEdbMC3Cm7ujQPIefBhTmpL58SpqXfHdUGUR+G3fNlRjenapF3/OJmyX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwI1Db6T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0762BC2BCB7;
	Mon, 18 May 2026 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779111735;
	bh=/cKjp+lN7lfgaOIhnPq3azQJjuWDv5JvIceAfXmKznY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mwI1Db6Tp/sgdSSAY4bszf0MkqG7WXBL7PskvwnfqzSlJUC/Xt0qaCT0Yg3MIMLjg
	 1sBJd0tGOSI54W/Lyr1Z8RXs1MObVAbKlXxq954ZufxV/DGWXUVzcTjGKq4Z3/4xVp
	 dCu1qhfYUhzGJjDNgCkT//7rPW9kJAMlY2OvTQez27wAlWcfC39HshhOawhqXOGUUk
	 uNdR0udhAaaRRzTjYEOJrn0knDtdJzGgArTvPwJp5VsosZfY432PmbeX6g/uPfUIVE
	 shI2WIFT7Wo0xaH6vVZ0/rFqY8f62eeu/uWM0eVsjl1J19nhKqzO+njopy9EGbCKYh
	 ITD1sedYK8H3g==
Date: Mon, 18 May 2026 14:42:02 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>,
 rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v4 03/10] iio: frequency: ad9910: initial driver
 implementation
Message-ID: <20260518144202.07b8351e@jic23-huawei>
In-Reply-To: <is4rbxohz5icbaslatmjmzhb5oztnh6ytmntgkn3rssjijppb3@mur2heagprdi>
References: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
	<20260508-ad9910-iio-driver-v4-3-d26bfd20ee3d@analog.com>
	<20260517154745.5fbfcabf@jic23-huawei>
	<is4rbxohz5icbaslatmjmzhb5oztnh6ytmntgkn3rssjijppb3@mur2heagprdi>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88179-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B2FCE56DDD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> > > +	case IIO_CHAN_INFO_FREQUENCY:
> > > +		switch (chan->channel) {
> > > +		case AD9910_CHANNEL_PROFILE_0 ... AD9910_CHANNEL_PROFILE_7:
> > > +			tmp32 = chan->channel - AD9910_CHANNEL_PROFILE_0;
> > > +			tmp64 = FIELD_GET(AD9910_PROFILE_ST_FTW_MSK,
> > > +					  st->reg[AD9910_REG_PROFILE(tmp32)].val64);
> > > +			break;
> > > +		default:
> > > +			return -EINVAL;
> > > +		}
> > > +		tmp64 *= st->data.sysclk_freq_hz;
> > > +		*val = tmp64 >> 32;
> > > +		*val2 = ((tmp64 & GENMASK_ULL(31, 0)) * MICRO) >> 32;  
> > 
> > Why in this particular case have this outside the switch / case whereas in others
> > you do the full maths and set inside? I'd put it inside and not worry about slightly
> > long lines.  
> 
> for frequency, those calculations are going to be common for the other channels that are
> going to be populated by other patches...
> 
> DRG up/down and RAM will have tmp64 populated with a FTW value.

Makes sense. Thanks,

