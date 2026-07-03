Return-Path: <linux-doc+bounces-94727-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZTV4NVknR2o6TwAAu9opvQ
	(envelope-from <linux-doc+bounces-94727-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 05:07:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2E66FE195
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 05:07:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="ICsHuU/2";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94727-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94727-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFAAB30C50ED
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 03:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9404A29ACCD;
	Fri,  3 Jul 2026 03:01:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C6B2868B4;
	Fri,  3 Jul 2026 03:01:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047700; cv=none; b=JlvJCsCEMIDNOsSNXIYz6XtdT5W88skBdv7ONJzNxZcQFiKNIYIieBV1mnLMTN1UelgL5QORA4Y8LuKlZeXgFhERwiXJLcGvBOjInb9IePyd2vUOBnGtSTnahlhPsQGYYZD6TRiISohGcLSzH9U25mPXgJoA5QZy63s6qTjx504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047700; c=relaxed/simple;
	bh=BubYEQyZuePYcsRWebmd+oLqpLeDltmkwuhtw+a5pd4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZASSX1mbAKdUsPBKu+E5AxktURg2Tj2byu7eQP0HaJ2b32FM/tqnz/lVBwQYFGeoTKyRk7uEqqFRtBc0J1yuxZIGgra1WMXhWpCShlOzirvOnsJTeM0ot8DNUWzbpldnCqnT6M7QgvBKxiRd5jCw7xT0d7oTbUdvK8+d8nWmSZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICsHuU/2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488061F000E9;
	Fri,  3 Jul 2026 03:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783047698;
	bh=WnejnQyL8arFMPrw76b5gPTo8JqP1AJphjMfCQzKsIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ICsHuU/2LjMNnFtTO1vWleC0zYag9kP7AKDxBk0IMfXpACyKCcrwoI6VjpjQsjKeK
	 v3HmFu8uZTbb6YiMvX8DfTR3m06x+xSv0rE99xEx0jSOYcct7WP8fHrS3NrUMBK/bx
	 lLyz0ZArz6jojjKhrigDaixUeaNs+23r7d+y22TMt0C5JLU9kqUsJCoa1AdPtS4/0f
	 Q82IHvyTjK2Fpbj99qZm7ZTBr0VBpEc/gonqQJY7/jrdCB7v/sxL7lSWdWOsa7MAZB
	 XMvJBH43oKgc9VEqbCS25M/CStRevajxQyAws2MruIDinX4wq1OlDjsgADypiqQw0V
	 WDF0XFRfsMNfg==
Date: Fri, 3 Jul 2026 04:01:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v6 11/16] iio: frequency: ad9910: add digital ramp
 generator support
Message-ID: <20260703040131.09de8178@jic23-huawei>
In-Reply-To: <20260618-ad9910-iio-driver-v6-11-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
	<20260618-ad9910-iio-driver-v6-11-79125ffbe430@analog.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:devnull+rodrigo.alencar.analog.com@kernel.org,m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:devnull@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94727-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,analog.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D2E66FE195

On Thu, 18 Jun 2026 14:27:27 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add Digital Ramp Generator channels with destination selection (frequency,
> phase, or amplitude) based on attribute writes, dwell mode control,
> configurable upper/lower limits, step size controlled with rate of change
> config, and step rate controlled as sampling frequency.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

End of day, so I'm running out of steam, but one case in here where
I think tweaking an earlier patch will make this one simpler without
costing anything much there.

> ---
>  drivers/iio/frequency/ad9910.c | 345 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 340 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad9910.c
> index 262702b62738..3fe97aa887c3 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
> @@ -831,22 +1108,62 @@ static int ad9910_write_raw(struct iio_dev *indio_dev,
>  			return -EINVAL;
>  		}
>  	case IIO_CHAN_INFO_RAW:
> -		if (val < 0)
> -			return -EINVAL;
> -
>  		switch (chan->channel) {
>  		case AD9910_CHANNEL_PROFILE_0 ... AD9910_CHANNEL_PROFILE_7:
> +			if (val < 0)
> +				return -EINVAL;

Push it there in the earlier patch.  Which level it is at is a fairly
arbitrary decision in that earlier patch, so let's put it where it ends
up from the start.

> +
>  			tmp32 = chan->channel - AD9910_CHANNEL_PROFILE_0;
>  			tmp64 = FIELD_PREP(AD9910_PROFILE_ST_ASF_MSK,
>  					   min_t(u64, val, AD9910_ASF_MAX));
>  			return ad9910_reg64_update(st, AD9910_REG_PROFILE(tmp32),
>  						   AD9910_PROFILE_ST_ASF_MSK,
>  						   tmp64, true);

