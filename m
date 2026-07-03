Return-Path: <linux-doc+bounces-94722-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sc/KLxcbR2odTQAAu9opvQ
	(envelope-from <linux-doc+bounces-94722-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 04:14:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBB16FDDF7
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 04:14:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YbGpht5m;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94722-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94722-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 736913029ACD
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 02:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C5B2494F0;
	Fri,  3 Jul 2026 02:13:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F820241C8C;
	Fri,  3 Jul 2026 02:13:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044806; cv=none; b=NmrVyznvTkizmMw0IaJ6g7lTv1f3cF/Uk7poTNwgA4VvnAAckJCrX9gXk2Pm8hKkeHuTQ4pBmCWd8R+E7rGQhmqTs3wS3S5SRnZDzcDga09+8ZX4wQOYW+OoydW7lS3Bq49cr2tYTao7GyZOSwtQlsXlU371hQTFlqxiI6iKrME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044806; c=relaxed/simple;
	bh=D+uSMRZNCAJohaZANJi+fcozrpSGbQCo3IAxm7Bs4jY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qi5NncxWc0ZaUGuU72tZMmq6jWX4vcRh4Dt4ELg+WdnGcqtqR0D2/19YtlV3ubvx53aK1xMdKFIdkkUpXbfnoX+057dvBfxtDyT0zRJ10rBIyJj2CWA79KZKjYrWS8rvqGEqKncypZKCWhN5+iDC0aXv3KI+1nSAtGnp2ugf4dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbGpht5m; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C631F000E9;
	Fri,  3 Jul 2026 02:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783044804;
	bh=B8J5N5ATqqb/sQ5E0nqBZmkphsVSEKcvcog9noD71Hs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YbGpht5mgbRgVduEX9F6SdQ+Wg/iHhHcajnkN6qzJ7bozq9se5YMpiyK1ZBIAJDEn
	 PeeTpfzS47iuDNb8bOh8Cu4+AaxjEXqPGVMwOcQclk4jloF0TBZoGFwh+mu9P/fMvW
	 K3j4kBy86nfjzNfpuyIOKvWrICR6BJqFSPM+8+Suf+9N1czW+xoKM6gNkEPWA0l1Zh
	 ywL6jetBF+xP0X/V3S8Lfm+dRKiaY2uwlzzBBKBR7SUwN97+EiMZFOdPgCOZuniSS+
	 9oMZUSlgTODNt47l24r0xSfG2VOvOJvq9uoOjniaqK37hZBR3UjY7GfJQINQ16vOeD
	 snKrc8WyDXUMQ==
Date: Fri, 3 Jul 2026 03:13:16 +0100
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
Subject: Re: [PATCH v6 09/16] iio: frequency: ad9910: initial driver
 implementation
Message-ID: <20260703031316.0b4edbcd@jic23-huawei>
In-Reply-To: <20260618-ad9910-iio-driver-v6-9-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
	<20260618-ad9910-iio-driver-v6-9-79125ffbe430@analog.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-94722-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,analog.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DBB16FDDF7

On Thu, 18 Jun 2026 14:27:25 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add the core AD9910 DDS driver infrastructure with single tone mode
> support. This includes SPI register access, profile management via GPIO
> pins, PLL/DAC configuration from firmware properties, and single tone
> frequency/phase/amplitude control through IIO attributes.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

Hi Rodrigo, just a couple of things that are really really trivial.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad9910.c
> new file mode 100644
> index 000000000000..95b01295e4a0
> --- /dev/null
> +++ b/drivers/iio/frequency/ad9910.c

> +static int ad9910_parse_fw(struct ad9910_state *st)
> +{
> +	static const char * const refclk_out_drv0[] = {
> +		"disabled", "low", "medium", "high",
> +	};
> +	struct device *dev = &st->spi->dev;
> +	const char *prop;
> +	u32 tmp;
> +	int ret;
> +
> +	st->data.pll_enabled = device_property_read_bool(dev, "adi,pll-enable");
> +	if (st->data.pll_enabled) {
> +		tmp = AD9910_ICP_MIN_uA;

Perhaps move to an else rather than doing it as set then override? 


> +		prop = "adi,charge-pump-current-microamp";
> +		if (device_property_present(dev, prop)) {
> +			ret = device_property_read_u32(dev, prop, &tmp);
> +			if (ret)
> +				return dev_err_probe(dev, ret, "property read: %s\n", prop);
> +
> +			if (tmp < AD9910_ICP_MIN_uA || tmp > AD9910_ICP_MAX_uA)
> +				return dev_err_probe(dev, -ERANGE,
> +						     "invalid charge pump current %u\n", tmp);
> +		}
> +		st->data.pll_charge_pump_current = tmp;
> +
> +		prop = "adi,refclk-out-drive-strength";
> +		if (device_property_present(dev, prop)) {
> +			ret = device_property_match_property_string(dev, prop,
> +								    refclk_out_drv0,
> +								    ARRAY_SIZE(refclk_out_drv0));
> +			if (ret < 0)
> +				return dev_err_probe(dev, ret, "property read: %s\n", prop);
> +
> +			st->data.refclk_out_drv = ret;
> +		}
> +	}
> +
> +	return 0;
> +}


