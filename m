Return-Path: <linux-doc+bounces-76136-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJs7GptilGlfDQIAu9opvQ
	(envelope-from <linux-doc+bounces-76136-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Feb 2026 13:44:11 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C509614C127
	for <lists+linux-doc@lfdr.de>; Tue, 17 Feb 2026 13:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5830E3028033
	for <lists+linux-doc@lfdr.de>; Tue, 17 Feb 2026 12:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8D63542F3;
	Tue, 17 Feb 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DevOiFDD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140D91482E8;
	Tue, 17 Feb 2026 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771332248; cv=none; b=ecZEQEzbHeSlemcLxy7wthCuC2oITPeN4hwJLfTK/n9Ka0cZjKaKYwfa9g3A+TVYpnEyaW/u8sOm4rW/VTuxAyj2DfpvAHn1ornRBmud5rb9fUEY7jq+1umlOxU0enZqeHLjovoJp6GgHQDio39+BS0f71P6SRDqgsIiAHCaPfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771332248; c=relaxed/simple;
	bh=67SrCM1lwbP+lX5wyl7Ff9GnEgQBCeiC6gJUPYRWYT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2xmPCGU7tekmSMqqFDNWfAm6q9J9QyHVHnFjIxi6L0eGKW2LaC/o4dU7ya1ta9gKjigU8UUthNmbGd4N8bTOVVU/GYEXzSbnf3WSlZKFBm2XCqFcEB3c9K9whDGyxP76aXSRxBDsm0mxOVj7CZRfRv8oEAi2kzi+DYL69G7wo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DevOiFDD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771332248; x=1802868248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=67SrCM1lwbP+lX5wyl7Ff9GnEgQBCeiC6gJUPYRWYT0=;
  b=DevOiFDDK+ZG8BigvaDvrEUBySnqB9jPGkx/8qRhaf7NFhdZ8e4S6jPi
   +7/iO3aHbHh4IXNQ8nVWDDak9l/om2NA0CZhQW07IvCTdS4vPelESID1+
   WOJ4UeDLdD5/atovTnem2FgEI3yIpX+9GwvAih3yOObeL99+C80Z6oVcS
   k+OW2Intw6j/Fg7iIF9uHW+G1G5o388dfSM9S51MqgsAqfHgEj7ozOAA7
   P9pNuOY/YlARcS/AFM0JeTpkIdv7r4n9jQodUL+cwy3zF+hPhSpfICPIL
   tqUzy/l+fJkdlgEDAx6coL3oeA8h6FOa7HX/Wk+xnbfg6EYHHzgpGTS6t
   A==;
X-CSE-ConnectionGUID: +aO3gtuCRGC2bLE1Ajl7vQ==
X-CSE-MsgGUID: 21jt1tzMQVGP+7W+//0nVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76020690"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="76020690"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 04:44:07 -0800
X-CSE-ConnectionGUID: sKTR50wtTdW3UJbxeblodw==
X-CSE-MsgGUID: VrY0/QIrQaWUbfbEIv9SjQ==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.123])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 04:44:02 -0800
Date: Tue, 17 Feb 2026 14:44:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jic23@kernel.org, michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v9 7/8] iio: adc: ad4030: Add support for ADAQ4216 and
 ADAQ4224
Message-ID: <aZRikNMXKxW0JjTC@smile.fi.intel.com>
References: <cover.1771253601.git.marcelo.schmitt@analog.com>
 <39ebbb49619d5d588efe590560046d747dd46ad5.1771253601.git.marcelo.schmitt@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39ebbb49619d5d588efe590560046d747dd46ad5.1771253601.git.marcelo.schmitt@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,analog.com,baylibre.com,lwn.net,gmail.com];
	TAGGED_FROM(0.00)[bounces-76136-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: C509614C127
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:01:12PM -0300, Marcelo Schmitt wrote:
> ADAQ4216 and ADAQ4224 are similar to AD4030, but feature a PGA circuitry
> that scales the analog input signal prior to it reaching the ADC. The PGA
> is controlled through a pair of pins (A0 and A1) whose state define the
> gain that is applied to the input signal.
> 
> Add support for ADAQ4216 and ADAQ4224. Provide a list of PGA options
> through the IIO device channel scale available interface and enable control
> of the PGA through the channel scale interface.

...

> +static void ad4030_fill_scale_avail(struct ad4030_state *st)
> +{
> +	unsigned int mag_bits, int_part, fract_part, i;
> +	u64 range;
> +
> +	/*
> +	 * The maximum precision of differential channels is retrieved from the
> +	 * chip properties. The output code of differential channels is in two's
> +	 * complement format (i.e. signed), so the MSB is the sign bit and only
> +	 * (precision_bits - 1) bits express voltage magnitude.
> +	 */
> +	mag_bits = st->chip->precision_bits - 1;
> +
> +	for (i = 0; i < ARRAY_SIZE(adaq4216_hw_gains_frac); i++) {

Can be

	for (unsigned int i = 0; i < ARRAY_SIZE(adaq4216_hw_gains_frac); i++) {

which is still under 80 and makes the top definition cleaner and code robust
by not exposing loop iterator out of the loop's scope.

> +		range = mult_frac(st->vref_uv, adaq4216_hw_gains_frac[i][1],
> +				  adaq4216_hw_gains_frac[i][0]);
> +		/*
> +		 * If range were in mV, we would multiply it by NANO below.
> +		 * Though, range is in µV so multiply it by MICRO only so the
> +		 * result after right shift and division scales output codes to
> +		 * millivolts.
> +		 */
> +		int_part = div_u64_rem(((u64)range * MICRO) >> mag_bits, NANO, &fract_part);
> +		st->scale_avail[i][0] = int_part;
> +		st->scale_avail[i][1] = fract_part;
> +	}
> +}

...

> +static int ad4030_set_pga(struct iio_dev *indio_dev, int gain_int, int gain_fract)
> +{
> +	struct ad4030_state *st = iio_priv(indio_dev);
> +	unsigned int mag_bits = st->chip->precision_bits - 1;
> +	u64 gain_nano, tmp;
> +
> +	if (!st->pga_gpios)
> +		return -EINVAL;
> +
> +	gain_nano = gain_int * NANO + gain_fract;
> +	if (!in_range(gain_nano, 1, ADAQ4616_PGA_GAIN_MAX_NANO))
> +		return -EINVAL;
> +
> +	tmp = DIV_ROUND_CLOSEST_ULL(gain_nano << mag_bits, NANO);

> +	gain_nano = DIV_ROUND_CLOSEST_ULL(st->vref_uv, tmp);

This (second one only) doesn't sound like a 64-bit division.
Can tmp be bigger than 32-bit?

> +	st->pga_index = find_closest(gain_nano, adaq4216_hw_gains_vpv,
> +				     ARRAY_SIZE(adaq4216_hw_gains_vpv));
> +
> +	return ad4030_set_pga_gain(st);
> +}

...

> +static int ad4030_setup_pga(struct device *dev, struct iio_dev *indio_dev,
> +			    struct ad4030_state *st)
> +{
> +	unsigned int i;
> +	int pga_gain_dB;
> +	int ret;
> +
> +	ret = device_property_read_u32(dev, "adi,pga-gain-db", &pga_gain_dB);
> +	if (ret == -EINVAL) {

Actually instead of custom error hunting, this should be rather

	if (device_property_present(dev, "adi,pga-gain-db")) {
		ret = device_property_read_u32(dev, "adi,pga-gain-db", &pga_gain_dB);
		if (ret)
			return dev_err_probe(dev, ret, "Failed to get PGA value.\n");
	} else {

> +		/* Setup GPIOs for PGA control */
> +		st->pga_gpios = devm_gpiod_get_array(dev, "pga", GPIOD_OUT_LOW);
> +		if (IS_ERR(st->pga_gpios))
> +			return dev_err_probe(dev, PTR_ERR(st->pga_gpios),
> +					     "Failed to get PGA gpios.\n");
> +
> +		if (st->pga_gpios->ndescs != ADAQ4616_PGA_PINS)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Expected 2 GPIOs for PGA control.\n");
> +
> +		st->scale_avail_size = ARRAY_SIZE(adaq4216_hw_gains_db);
> +		st->pga_index = 0;
> +		return 0;

> +	} else if (ret) {
> +		return dev_err_probe(dev, ret, "Failed to get PGA value.\n");
> +	}

(this goes above)

> +	/* Set ADC driver to handle pin-strapped PGA pins setup */
> +	for (i = 0; i < ARRAY_SIZE(adaq4216_hw_gains_db); i++) {
> +		if (pga_gain_dB != adaq4216_hw_gains_db[i])
> +			continue;
> +
> +		st->pga_index = i;
> +		break;
> +	}
> +	if (i == ARRAY_SIZE(adaq4216_hw_gains_db))
> +		return dev_err_probe(dev, -EINVAL, "Invalid PGA gain: %d.\n",
> +				     pga_gain_dB);
> +
> +	st->scale_avail_size = 1;
> +	st->pga_gpios = NULL;
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



