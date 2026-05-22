Return-Path: <linux-doc+bounces-89061-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNmNO1KbEGpuagYAu9opvQ
	(envelope-from <linux-doc+bounces-89061-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 20:07:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8BA5B8CB0
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 20:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84A6F3003D22
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 18:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B024368D7F;
	Fri, 22 May 2026 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGhe9Fbg"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4F931F99B;
	Fri, 22 May 2026 18:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473027; cv=none; b=Tp1NttRKCmKQ5VUa+gm4ZEb7a1T4sxfssSuKLEwitLVJeUKtOweMF8Ar3qSmUKdwN8xJuQdyDU56wBUoCeelmhA7BANSxJRZ2KFe9GpJByu7s5gdq6PgMkqS0amLEfeLZ5zSLF64ulSsFyY0G4C3luGBawR8pAt5k99VZlHLvuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473027; c=relaxed/simple;
	bh=z53a4gqpEk/X3UbyUGH777b17vYlgYy0BODsjW5LmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTVVoniydhSexRprY7927dNo0ILS1fwkTZBiP2OSXkzH29QqTRjQFyP0yC+GttqPy7vJWJF6ZB3EO74yrTbshatWV/Ovyck7fSOpLF22I7PfODHXFFrIZ5VGE95Y2eMkZaPpe0kn4OFGn/Q2knj7X5YKmY5KezXuW7wtvJsWj8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGhe9Fbg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A08121F000E9;
	Fri, 22 May 2026 18:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779473024;
	bh=U4OSPkWvEDib0ziOqdfG0qmy9Whb9UNfa8I+lAK9N3Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=TGhe9FbgbwPImNuvj/lP6aTUOlrHwL1frR9sWUBr3fpCG0IpfqKC/M25+GWRDr3Ax
	 XeymvsSwv+49kK1+p2avJUTn55sCT44oz/+iud+HOyTFmWX+dyT3xLCR3JswCkobPE
	 AwxVz8dvEs/yBF2hoU3U28k1aaxaa7dGItVANPj0ONCeMTNWdffxrMRWT7D2nTS7g8
	 WvkpQBABnXKCUkf720b1lYR0Z+UU6I5gSY0qy1m2oGKL3aFDSHFShAvNFy4J4vXom1
	 PqcmH2KGVXj3l/LAmBbc1mjvAbGmMkVl1QJWEwrFpSHnNKTwI0lpRGOCPUjE5yWB7e
	 yZ2oihPhXxEUQ==
Date: Fri, 22 May 2026 19:03:32 +0100
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
Subject: Re: [PATCH v5 06/13] iio: frequency: ad9910: initial driver
 implementation
Message-ID: <20260522190332.1f4affba@jic23-huawei>
In-Reply-To: <20260517-ad9910-iio-driver-v5-6-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com>
	<20260517-ad9910-iio-driver-v5-6-31599c88314a@analog.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89061-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,rodrigo.alencar.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BC8BA5B8CB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 17 May 2026 19:37:50 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add the core AD9910 DDS driver infrastructure with single tone mode
> support. This includes SPI register access, profile management via GPIO
> pins, PLL/DAC configuration from firmware properties, and single tone
> frequency/phase/amplitude control through IIO attributes.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
Hi Rodrigo

A couple of potential nice to haves.

Jonathan


> +
> +static int ad9910_parse_fw(struct ad9910_state *st)
> +{
> +	static const char * const refclk_out_drv0[] = {
> +		"disabled", "low", "medium", "high",
> +	};
> +	struct device *dev = &st->spi->dev;
> +	u32 tmp[2];
> +	int ret;
> +
> +	st->data.pll_enabled = device_property_read_bool(dev, "adi,pll-enable");
> +	if (st->data.pll_enabled) {
> +		tmp[0] = AD9910_ICP_MIN_uA;
> +		device_property_read_u32(dev, "adi,charge-pump-current-microamp", &tmp[0]);
Might be a good idea to move to the pattern that seems to be becoming
the preferred way to do this and do
		if (device_property_present()) {
			ret = device_property_read_u32()...
...
		} else {
			...
		}

That is slightly nicer ad picks up malformed DT.  I know I was the advocate for
the set a default and don't check ret but I'm learning!


> +		if (tmp[0] < AD9910_ICP_MIN_uA || tmp[0] > AD9910_ICP_MAX_uA)
> +			return dev_err_probe(dev, -ERANGE,
> +					     "invalid charge pump current %u\n", tmp[0]);
> +		st->data.pll_charge_pump_current = tmp[0];
> +
> +		ret = device_property_match_property_string(dev,
> +							    "adi,refclk-out-drive-strength",
> +							    refclk_out_drv0,
> +							    ARRAY_SIZE(refclk_out_drv0));
> +		if (ret < 0)
Similarly good to know if failure to match actually means wasn't there or not.

> +			st->data.refclk_out_drv = AD9910_REFCLK_OUT_DRV_DISABLED;
> +		else
> +			st->data.refclk_out_drv = ret;
> +	}
> +
> +	tmp[1] = AD9910_DAC_IOUT_DEFAULT_uA;
And similar again.

> +	device_property_read_u32_array(dev, "output-range-microamp", tmp,
> +				       ARRAY_SIZE(tmp));
> +	if (tmp[1] < AD9910_DAC_IOUT_MIN_uA || tmp[1] > AD9910_DAC_IOUT_MAX_uA)
> +		return dev_err_probe(dev, -ERANGE,
> +				     "Invalid DAC output current %u uA\n", tmp[1]);
> +	st->data.dac_output_current = tmp[1];
> +
> +	return 0;
> +}


> +static const struct spi_device_id ad9910_id[] = {
> +	{ "ad9910" },

Request to simplify what Uwe is busy doing (assuming he'll get to spi
at somepoint). Please use a named initializer like we always do for
of_device_id.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, ad9910_id);


