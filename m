Return-Path: <linux-doc+bounces-94426-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9bY+LoRfRWpu/AoAu9opvQ
	(envelope-from <linux-doc+bounces-94426-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 20:42:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2705A6F0AAF
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 20:42:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ik2U7ntW;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94426-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94426-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 619B53019B8A
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 18:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A4E391E60;
	Wed,  1 Jul 2026 18:41:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7614025B08A;
	Wed,  1 Jul 2026 18:41:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931269; cv=none; b=KH8vF8kElN11pBvRv5E3nNyGlfS9aQw2ANW3FpZ5ygwyUS4PVwJAgIA3EPT1w/CQew9Zs0Kj6zF2QB2zRw/mhtHxmkKo46ciH7BFxDGOIKFx7q9MfSxmtiIvtu3j55GUFV4N3l/D543Oq3k+Bs4pnOjS3OnNtnWeRD6vntzNzHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931269; c=relaxed/simple;
	bh=qXJldM6BUh03weti5x2Wx+CwtFDpxI/BSec/nZO2YAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MO1vlPDJb9/6waYb84mvlSJRTt70zFyIoAE0b6IhBup49ewOQcEGeFncHsbhJTsgRAxdlhgeUItESqmd/DXSo6Z/qv0UXQDgrJj/qfcpbzqlOlj9B2T+W6cvpGS5Q4QtvMNBw/Sipt8D7DhqNyWwJ6AJ64jN0eVRJSabUy3d7hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ik2U7ntW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CCB1F000E9;
	Wed,  1 Jul 2026 18:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782931268;
	bh=RtBAYlNvKsaOrj0DVhmIZREtE8lCqKZwKuktgqgnPs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ik2U7ntWPPmeip+BSU5qfzGjqrawJ4SmYad/YxAhMlYySU5qVmeurjBl5nwiSeWCu
	 O4uHwgjLviRKnDibIc9TdSQds1U7FUtlb96/rrgEE4dan5Q9azt5nQ5GGPJxTt7d0E
	 ppJzHpUslCAIeCjiBN76Qo75mZYSUQH3CowNg4qB1o8n4gaqaQQQ1RzMW7mBGWJ/mF
	 8o9xUSlNIPjgXktoKXRfzmmQJWMNm5luvrz5f7A1Bv8fM98RLhlbPGD6odO3NZEmJo
	 6/Z4ONTUHZtEAxpzrjM6PNNX41IQxW0fSw0n+ROulQ0iqlTlkrTDr/LWNON17i0x7s
	 YlP3r+MjbJXRQ==
Date: Wed, 1 Jul 2026 19:41:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, "David Lechner" <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, "Jonathan Corbet" <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Janani Sunil
 <jan.sun97@gmail.com>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: dac: Add AD5529R
Message-ID: <20260701194103.45541cbe@jic23-huawei>
In-Reply-To: <20260701-ad5529r-driver-v5-2-ed087900e642@analog.com>
References: <20260701-ad5529r-driver-v5-0-ed087900e642@analog.com>
	<20260701-ad5529r-driver-v5-2-ed087900e642@analog.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94426-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:broonie@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jan.sun97@gmail.com,m:linux-spi@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jansun97@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[metafoo.de,analog.com,baylibre.com,kernel.org,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2705A6F0AAF

On Wed, 1 Jul 2026 08:40:40 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
> buffered voltage output digital-to-analog converter (DAC) with an
> integrated precision reference.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
Putting aside our device address discussions as being handled elsewhere
one minor thing inline

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
> new file mode 100644
> index 000000000000..97075b1c919d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml

> +properties:
> +patternProperties:
> +  "^channel@([0-9a-f]{1,2})$":
> +    type: object
> +    description: Child nodes for individual channel configuration
> +
> +    properties:

> +      adi,output-range-microvolt:
> +        description: |
> +          Output voltage range for this channel as [min, max] in microvolts.
> +          If not specified, defaults to 0V to 5V range.

No way to specify the default as part of the binding rather than a comment?
I haven't checked but does
       default: [0 5000000]
not work?
> +        oneOf:
> +          - items:
> +              - const: 0
> +              - enum: [5000000, 10000000, 20000000, 40000000]
> +          - items:
> +              - const: -5000000
> +              - const: 5000000
> +          - items:
> +              - const: -10000000
> +              - const: 10000000
> +          - items:
> +              - const: -15000000
> +              - const: 15000000
> +          - items:
> +              - const: -20000000
> +              - const: 20000000
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false




