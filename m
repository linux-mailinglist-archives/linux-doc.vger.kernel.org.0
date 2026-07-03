Return-Path: <linux-doc+bounces-94725-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2DymBxIlR2rBTgAAu9opvQ
	(envelope-from <linux-doc+bounces-94725-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 04:57:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3866FE054
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 04:57:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=leHP0gq8;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94725-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94725-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 347EE3017BD6
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 02:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77BB263C8F;
	Fri,  3 Jul 2026 02:57:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1D34A0C;
	Fri,  3 Jul 2026 02:57:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047437; cv=none; b=LgmURw3OB6B1QJ/EFb3cnKvnqt/XQvLFN74PMvZvsUeEwpiwtcuyBNfcH5t4UeKrYwEkEYSrm7memZYCGTHm/1LTNO851bGpkXJPJz9nztaiZEGIjVMOTsjHer9ymmoYTt5ez0harMJhWtXbPAKmvCI34Wrs8Pyd8WuPOjKoEpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047437; c=relaxed/simple;
	bh=7eEtysxGbmymy/jSaQd8axsMqhM8uyWZQuAFE9QMcos=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GdTOLcTHViUFepB/leNJsW8NKKHc/pl8wR4XcSIEypqRAA1pRYWJycHqwTvpgjZV4rfIqOhgCVjk4q71LhSIpRlXBlXLbJXXHy2+yMRhQppaJ0fdNgSZ2Myde4Ibbh31dp+VH8iCnEMi+5+z6thWO1BD6r5kSOS19SHoKQXS/VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=leHP0gq8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20F31F000E9;
	Fri,  3 Jul 2026 02:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783047436;
	bh=TZHw31F2l4u3GAfqqOMYW8ORUSErLxJZiA5q7Zc2J0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=leHP0gq8EksNBVQO0Ebx1kll9W9+yBrj0+k+Jn58s5nwdEyIJO2zQg8utJnk2wieC
	 CxhoMHTy/WbJhxtbKmi/ONVQb6seO6VpW0QA1vNuYnq7ylSqDiY4UDeD0vpybEG6em
	 0WZRmpIwxo434OA5kJizhweGXITLDWao0HCN9WyS/7ZwBN2YC5zYWHq2K4FVKEbAyt
	 nFCJAaNFATsuRqmCFhteW076Alk/cVHIGy8KfJPV0XfMulRcYZtimpWDYi2KXPkLik
	 W/134O4dOHKLB8ijJop5VlHgoxplD+pwEGCNs+tz7QofYogblfNWpSemYzgSnmcT0Z
	 d/H+sYCxkrtSw==
Date: Fri, 3 Jul 2026 03:57:10 +0100
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
Subject: Re: [PATCH v6 10/16] iio: frequency: ad9910: add basic parallel
 port support
Message-ID: <20260703035710.08af256a@jic23-huawei>
In-Reply-To: <20260618-ad9910-iio-driver-v6-10-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
	<20260618-ad9910-iio-driver-v6-10-79125ffbe430@analog.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+rodrigo.alencar.analog.com@kernel.org,m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:devnull@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	TAGGED_FROM(0.00)[bounces-94725-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A3866FE054

On Thu, 18 Jun 2026 14:27:26 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add parallel port support with amplitude, phase and frequency channels.
> Those will be buffered capable channels, but only basic control of offset
> and scale are implemented at this point. There are separate amplitude
> and phase control for polar destination, which will provide different scan
> types. Enabling and disabling of parallel mode will be implemented with
> buffer setup ops or with update_scan_mode() once IIO backend integration
> is in place.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
Hi Rodrigo

Just a couple of comments on perhaps pushing the introduction of switch
statements on chan->address to the earlier patch to improve readability
of this one. + What looks to be a duplicated range check to me.

Jonathan
> ---
>  drivers/iio/frequency/ad9910.c | 187 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 178 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad9910.c
> index 95b01295e4a0..262702b62738 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
...
>  
>  static int ad9910_read_raw(struct iio_dev *indio_dev,
> @@ -640,11 +702,60 @@ static int ad9910_read_raw(struct iio_dev *indio_dev,
>  			return -EINVAL;
>  		}
>  	case IIO_CHAN_INFO_SCALE:
> -		tmp64 = (u64)st->data.output_current_uA *
> -			AD9910_NANO_MILLIAMP_PER_MICROAMP;
> -		*val = 0;
> -		*val2 = tmp64 >> 14;
> -		return IIO_VAL_INT_PLUS_NANO;
> +		switch (chan->address) {
> +		case AD9910_CHAN_IDX_PHY:
> +			tmp64 = (u64)st->data.output_current_uA *
> +				AD9910_NANO_MILLIAMP_PER_MICROAMP;

Similar to below - I think I'd introduce a very minimal switch
in the earlier patch to reduce churn and make this patch
a tiny bit simpler.

> +			*val = 0;
> +			*val2 = tmp64 >> 14;
> +			return IIO_VAL_INT_PLUS_NANO;
> +		case AD9910_CHAN_IDX_PARALLEL_PHASE:
> +			*val = 0;
> +			*val2 = AD9910_PI_NANORAD >> 15;
> +			return IIO_VAL_INT_PLUS_NANO;
> +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> +			tmp32 = FIELD_GET(AD9910_CFR2_FM_GAIN_MSK,
> +					  st->reg[AD9910_REG_CFR2].val32);
> +			tmp64 = st->data.sysclk_freq_hz << tmp32;
> +			tmp64 = ad9910_rational_scale(tmp64, NANO, BIT_ULL(32));
> +			*val = div_s64_rem(tmp64, NANO, val2);
> +			return IIO_VAL_INT_PLUS_NANO;
> +		case AD9910_CHAN_IDX_PARALLEL_POLAR_AMP:
> +			tmp64 = (u64)st->data.output_current_uA *
> +				AD9910_NANO_MILLIAMP_PER_MICROAMP;
> +			*val = 0;
> +			*val2 = tmp64 >> 8;
> +			return IIO_VAL_INT_PLUS_NANO;
> +		case AD9910_CHAN_IDX_PARALLEL_POLAR_PHASE:
> +			*val = 0;
> +			*val2 = AD9910_PI_NANORAD >> 7;
> +			return IIO_VAL_INT_PLUS_NANO;
> +		default:
> +			return -EINVAL;
> +		}
> +	case IIO_CHAN_INFO_OFFSET:
> +		switch (chan->address) {
> +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> +			tmp64 = (u64)st->reg[AD9910_REG_FTW].val32 * MICRO;
> +			tmp64 >>= FIELD_GET(AD9910_CFR2_FM_GAIN_MSK,
> +					    st->reg[AD9910_REG_CFR2].val32);
> +			*val = div_s64_rem(tmp64, MICRO, val2);
> +			return IIO_VAL_INT_PLUS_MICRO;
> +		case AD9910_CHAN_IDX_PARALLEL_POLAR_AMP:
> +			tmp32 = FIELD_GET(AD9910_ASF_SCALE_FACTOR_PP_LSB_MSK,
> +					  st->reg[AD9910_REG_ASF].val32);
> +			*val = 0;
> +			*val2 = MICRO * tmp32 >> 6;
> +			return IIO_VAL_INT_PLUS_MICRO;
> +		case AD9910_CHAN_IDX_PARALLEL_POLAR_PHASE:
> +			tmp32 = FIELD_GET(AD9910_POW_PP_LSB_MSK,
> +					  st->reg[AD9910_REG_POW].val16);
> +			*val = 0;
> +			*val2 = MICRO * tmp32 >> 8;
> +			return IIO_VAL_INT_PLUS_MICRO;
> +		default:
> +			return -EINVAL;
> +		}
>  	default:
>  		return -EINVAL;
>  	}
> @@ -737,12 +848,63 @@ static int ad9910_write_raw(struct iio_dev *indio_dev,
>  	case IIO_CHAN_INFO_SAMP_FREQ:
>  		return ad9910_set_sysclk_freq(st, val, true);
>  	case IIO_CHAN_INFO_SCALE:
> -		if (val != 0 || val2 < 0)
> +		switch (chan->address) {
> +		case AD9910_CHAN_IDX_PHY:

Perhaps it's worth adding the switch in the earlier patch
(with just this and default) so that we get a nicer
diff here?

> +			if (val != 0 || val2 < 0)
> +				return -EINVAL;
> +
> +			tmp32 = DIV_U64_ROUND_CLOSEST((u64)val2 << 14,
> +						      AD9910_NANO_MILLIAMP_PER_MICROAMP);
> +			return ad9910_set_dac_current(st, tmp32, true);
> +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> +			if (val < 0 || val2 < 0)
> +				return -EINVAL;
> +
> +			tmp64 = ad9910_rational_scale((u64)val * NANO + val2, BIT_ULL(32),
> +						      (u64)st->data.sysclk_freq_hz * NANO);
> +			tmp64 = roundup_pow_of_two(max(tmp64, 1ULL));
> +			tmp32 = min_t(u32, ilog2(tmp64), FIELD_MAX(AD9910_CFR2_FM_GAIN_MSK));
> +			tmp32 = FIELD_PREP(AD9910_CFR2_FM_GAIN_MSK, tmp32);
> +			return ad9910_reg32_update(st, AD9910_REG_CFR2,
> +						   AD9910_CFR2_FM_GAIN_MSK,
> +						   tmp32, true);
> +		default:
> +			return -EINVAL;
> +		}
> +	case IIO_CHAN_INFO_OFFSET:
> +		if (val < 0 || val2 < 0)

This is the check I mention below as being duplicated (val2 < 0 part)

>  			return -EINVAL;
>  
> -		tmp32 = DIV_U64_ROUND_CLOSEST((u64)val2 << 14,
> -					      AD9910_NANO_MILLIAMP_PER_MICROAMP);
> -		return ad9910_set_dac_current(st, tmp32, true);
> +		switch (chan->address) {
> +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> +			tmp64 = (u64)val * MICRO + val2;
> +			tmp64 <<= FIELD_GET(AD9910_CFR2_FM_GAIN_MSK,
> +					    st->reg[AD9910_REG_CFR2].val32);
> +			tmp64 = min_t(u64, DIV_U64_ROUND_CLOSEST(tmp64, MICRO),
> +				      U32_MAX);
> +			return ad9910_reg32_write(st, AD9910_REG_FTW, tmp64, true);
> +		case AD9910_CHAN_IDX_PARALLEL_POLAR_AMP:
> +			if (val != 0 || val2 < 0)

Isn't val2 < 0 rejected already above?

> +				return -EINVAL;
> +			tmp32 = DIV_U64_ROUND_CLOSEST((u64)val2 << 6, MICRO);
> +			tmp32 = min(tmp32, AD9910_ASF_PP_LSB_MAX);
> +			tmp32 = FIELD_PREP(AD9910_ASF_SCALE_FACTOR_PP_LSB_MSK, tmp32);
> +			return ad9910_reg32_update(st, AD9910_REG_ASF,
> +						   AD9910_ASF_SCALE_FACTOR_PP_LSB_MSK,
> +						   tmp32, true);
> +		case AD9910_CHAN_IDX_PARALLEL_POLAR_PHASE:
> +			if (val != 0 || val2 < 0)
> +				return -EINVAL;
> +
> +			tmp32 = DIV_U64_ROUND_CLOSEST((u64)val2 << 8, MICRO);
> +			tmp32 = min(tmp32, AD9910_POW_PP_LSB_MAX);
> +			tmp32 = FIELD_PREP(AD9910_POW_PP_LSB_MSK, tmp32);
> +			return ad9910_reg16_update(st, AD9910_REG_POW,
> +						   AD9910_POW_PP_LSB_MSK,
> +						   tmp32, true);
> +		default:
> +			return -EINVAL;
> +		}
>  	default:
>  		return -EINVAL;
>  	}



