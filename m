Return-Path: <linux-doc+bounces-76491-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDLWNV/+mmlKpQMAu9opvQ
	(envelope-from <linux-doc+bounces-76491-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 14:02:23 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 866CC16F193
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 14:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E35230101C1
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 13:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6F6263F5E;
	Sun, 22 Feb 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="li173GMg"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7DD261B98;
	Sun, 22 Feb 2026 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771765330; cv=none; b=MBq4lS8VnRwvvmu6dxM3T/91zjiCyZM3q9aHoWyCEnK5zcYZGhqwjKd0DxcS6DXE5cj6Mtorm62VdeEG64R10+wdI0hljrRJnnX44sI45n7oiABSvefoM3IafQ2BsLkeanxsiXhR1uypBbP/m0MQc6bOPbkz09b9POgz3A3TZvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771765330; c=relaxed/simple;
	bh=4BQrp84Wg0bvJnpacRYsrgjFC1+YwUZbsSz4WB1KmsA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/UNI4Wh5VuuD+fqH5U6MHbfID8evnV9l7zGAu2T2KATO9ywNuP0ucxO31ahtrLcYTHNqcJ5GUim6RcaaBJvBtX0NUeViyzB64JNmJ12M6+BPsLUUghB0EBKJe8x2LZtHUFTvVoEB23el5Mw+rearP6R79mXoF8y5/DSuTb8YuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=li173GMg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E5BC116D0;
	Sun, 22 Feb 2026 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771765329;
	bh=4BQrp84Wg0bvJnpacRYsrgjFC1+YwUZbsSz4WB1KmsA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=li173GMgpYhuY1FGnTVowEKr73b3Lf2p+sR+TNhRaf/UXYaF0+lBWa0fc1ywZlgy6
	 q5RhprqbpXTAEBC0Qxj5W5j0lbLvL87OaHkE0asVHbRignG8gtngHXG/Ch+SenHvOK
	 acSsfuIwPR14m16CAVhFRzEqp7i64IAMDVoB6xcib88J8jybqSuep6ZPr+gDgmlfZy
	 h/xDvbP7u6qDI3zQmn2uGg/LuDXacDP8Un6iQfXBbYWYczcacXYGmKf52VyMwKrGJh
	 YGGW4aGeyFBhTRBpriU3Bb+NqO1ibVFexrwakFRdbixfgLV8k5tADDJg7edSxr/grJ
	 5Ra0o9WSbu0aw==
Date: Sun, 22 Feb 2026 13:01:44 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <michael.hennerich@analog.com>, <nuno.sa@analog.com>,
 <eblanc@baylibre.com>, <dlechner@baylibre.com>, <andy@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <corbet@lwn.net>, <marcelo.schmitt1@gmail.com>, David Lechner
 <dlechner@baylible.com>
Subject: Re: [PATCH v9 8/8] iio: adc: ad4030: Support common-mode channels
 with SPI offloading
Message-ID: <20260222130144.012d7918@jic23-huawei>
In-Reply-To: <e6599ac890ed7447a4378f129d0101e7a20eb38b.1771253601.git.marcelo.schmitt@analog.com>
References: <cover.1771253601.git.marcelo.schmitt@analog.com>
	<e6599ac890ed7447a4378f129d0101e7a20eb38b.1771253601.git.marcelo.schmitt@analog.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76491-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,analog.com,baylibre.com,kernel.org,lwn.net,gmail.com,baylible.com];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,baylible.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 866CC16F193
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 12:01:27 -0300
Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:

> AD4030 and similar devices can read common-mode voltage together with
> ADC sample data. When enabled, common-mode voltage data is provided in a
> separate IIO channel since it measures something other than the primary
> ADC input signal and requires separate scaling to convert to voltage
> units. The initial SPI offload support patch for AD4030 only provided
> differential channels. Now, extend the AD4030 driver to also provide
> common-mode IIO channels when setup with SPI offloading capability.
> 
> Reviewed-by: David Lechner <dlechner@baylible.com>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>


>  static int ad4030_regulators_get(struct ad4030_state *st)
> @@ -1409,43 +1422,19 @@ static int ad4030_spi_offload_setup(struct iio_dev *indio_dev,
>  static int ad4030_setup_pga(struct device *dev, struct iio_dev *indio_dev,
>  			    struct ad4030_state *st)
>  {
> -	unsigned int i;
> -	int pga_gain_dB;
> -	int ret;
> +	/* Setup GPIOs for PGA control */
> +	st->pga_gpios = devm_gpiod_get_array(dev, "pga", GPIOD_OUT_LOW);
> +	if (IS_ERR(st->pga_gpios))
> +		return dev_err_probe(dev, PTR_ERR(st->pga_gpios),
> +				     "Failed to get PGA gpios.\n");
>  
> -	ret = device_property_read_u32(dev, "adi,pga-gain-db", &pga_gain_dB);
This had me confused, but I guess is patch break up stuff you mention in reply
to Andy in patch 7.  So I'll wait for v10 before taking another look.

> -	if (ret == -EINVAL) {
> -		/* Setup GPIOs for PGA control */
> -		st->pga_gpios = devm_gpiod_get_array(dev, "pga", GPIOD_OUT_LOW);
> -		if (IS_ERR(st->pga_gpios))
> -			return dev_err_probe(dev, PTR_ERR(st->pga_gpios),
> -					     "Failed to get PGA gpios.\n");
> +	if (st->pga_gpios->ndescs != ADAQ4616_PGA_PINS)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Expected %d GPIOs for PGA control.\n",
> +				     ADAQ4616_PGA_PINS);
>  
> -		if (st->pga_gpios->ndescs != ADAQ4616_PGA_PINS)
> -			return dev_err_probe(dev, -EINVAL,
> -					     "Expected 2 GPIOs for PGA control.\n");
> -
> -		st->scale_avail_size = ARRAY_SIZE(adaq4216_hw_gains_db);
> -		st->pga_index = 0;
> -		return 0;
> -	} else if (ret) {
> -		return dev_err_probe(dev, ret, "Failed to get PGA value.\n");
> -	}
> -
> -	/* Set ADC driver to handle pin-strapped PGA pins setup */
> -	for (i = 0; i < ARRAY_SIZE(adaq4216_hw_gains_db); i++) {
> -		if (pga_gain_dB != adaq4216_hw_gains_db[i])
> -			continue;
> -
> -		st->pga_index = i;
> -		break;
> -	}
> -	if (i == ARRAY_SIZE(adaq4216_hw_gains_db))
> -		return dev_err_probe(dev, -EINVAL, "Invalid PGA gain: %d.\n",
> -				     pga_gain_dB);
> -
> -	st->scale_avail_size = 1;
> -	st->pga_gpios = NULL;
> +	st->scale_avail_size = ARRAY_SIZE(adaq4216_hw_gains_vpv);
> +	st->pga_index = 0;
>  
>  	return 0;
>  }

