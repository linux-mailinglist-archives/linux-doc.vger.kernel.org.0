Return-Path: <linux-doc+bounces-95414-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j45BEMImTWp1vwEAu9opvQ
	(envelope-from <linux-doc+bounces-95414-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:18:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A5871DBF5
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:18:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NsmMBdlN;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95414-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95414-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB3FB300D9CD
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 16:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654B532B10E;
	Tue,  7 Jul 2026 16:13:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2D313272;
	Tue,  7 Jul 2026 16:13:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440816; cv=none; b=cTiyYUnYNTDy41Su5I1KZtjYVuHeO3T+svz50E9f0IBU/vtWfxaT0OlZSyNfRQNmFO8oAnwcYkA1l6hcT8ylPBFVHpdEDw3yFXYqgdzq39w0mFpAYXU//gLmrpjrba/ndb418K7mcmqGzWKwQ4QcXEbHhBA2449YG7S5AJTR7Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440816; c=relaxed/simple;
	bh=OyXuIF6I3/jkDTY6XNE3oW/wU6zr2NJjpANQ4ZiDCkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGWoMZMc8SzQhTdanYBDJ23giydI6sZXPARGV0oxGo8t5of22qsShx7lamSuGaDMNo8bxdvUq6QTGzWOl0lJqMnvwwfV7i1B1M5uC50Ne39SaiSd9E98ozvNfCGiXCTOhN/A6KInmpErPl8wtujSDxLde8h57hN1yMNaVFF9NMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsmMBdlN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FF91F00A3A;
	Tue,  7 Jul 2026 16:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440814;
	bh=yuBXNxnNPliMXdQZxsx8yJF2LozAOukUOOOwAkzKONY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NsmMBdlNKF47zH1+EJHfgLW3r36aGPmvrl/1C5oDwxOUWITpUjjWiQD6ipqt8sjng
	 uZi9k8AjJYzGtQIudEm+HdC1SBwmdlMIa+ba6iC91x7Me7UzZ8gr/6BJRrWhKMEimC
	 tNaQjOo71601dVBVNThULRLnWPaDUTTLGimA3HvOHXsoTmtUAraqUMU7uCvVlHTGkC
	 rzl4X56JZtTIp76bmGEriqCfyL0d7zaCVY1z2uYpGF57Xqb81SEUllsjQwK05YYStV
	 8FPFz3RdjJUVDlM6Sc17QlQccWBYpQC8QFvZuHY/n+1jlPVHm4Ht0GyhpeTd3GQ5WS
	 fYd5X6WO59EMg==
Date: Tue, 7 Jul 2026 17:13:29 +0100
From: Conor Dooley <conor@kernel.org>
To: rodrigo.alencar@analog.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v7 09/17] dt-bindings: iio: frequency: add ad9910
Message-ID: <20260707-situation-tidal-6552236f0898@spud>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
 <20260707-ad9910-iio-driver-v7-9-a4ec30f63700@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JsgybDgrBlzr2RMw"
Content-Disposition: inline
In-Reply-To: <20260707-ad9910-iio-driver-v7-9-a4ec30f63700@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95414-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,spud:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85A5871DBF5

--JsgybDgrBlzr2RMw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2026 at 03:04:30PM +0100, Rodrigo Alencar via B4 Relay wrote:

Actually,

> +dependencies:
> +  adi,charge-pump-current-microamp: [ 'adi,pll-enable' ]
> +  adi,refclk-out-drive-strength: [ 'adi,pll-enable' ]
> +  lock-detect-gpios: [ 'adi,pll-enable' ]
> +  interrupts: [ interrupt-names ]
> +  clocks: [ clock-names ]

This is pointless because of the required list.

> +  pwms: [ pwm-names ]

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - dvdd-io33-supply
> +  - avdd33-supply
> +  - dvdd18-supply
> +  - avdd18-supply

--JsgybDgrBlzr2RMw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak0lqQAKCRB4tDGHoIJi
0k5aAQDqNVxmoTC5V6A9crrucCZtgmHaT65lzRzOwBrwadp9dAEA5rjQKaau02aZ
Qr6VHt66YtyP+gKsu1gsveJn/8mzGAA=
=OGjh
-----END PGP SIGNATURE-----

--JsgybDgrBlzr2RMw--

