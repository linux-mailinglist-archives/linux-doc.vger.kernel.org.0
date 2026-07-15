Return-Path: <linux-doc+bounces-96932-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 508yDb6IV2rSWQAAu9opvQ
	(envelope-from <linux-doc+bounces-96932-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 15:18:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D64AA75E95F
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 15:18:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JtslR5ur;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96932-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96932-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88CD2300C269
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 13:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F22420494;
	Wed, 15 Jul 2026 13:09:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8746A420488;
	Wed, 15 Jul 2026 13:09:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120967; cv=none; b=L5c3Fyk9USNDqxzqdUCI4wsohIugdHU+hDQfpzCFXiP2lvPa4L6aXEAvsLY9LQBagrKtZ4Sg0E3xSReyMkxAda7XbphUNxekT6OEeg0F9hmJxWqlN2e1i+YUi7rhBKLlxGqsdoMrgphDpvScYx9E9yNttu03aH7Rt40v8KZqxps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120967; c=relaxed/simple;
	bh=SUMb3zBausmevnB9x4UBudVXKBEKviMAQn5Mu6iQJHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVudPTGIz9dALiKIumvlQnXezQ+Jagaa9Jv85DKEwWRPoFVZWVuRcMrvzXEaFHrRVQYRL7LEMZYlAEUlc54bby+9oCKD9NU53jZIVw1mL3Rf4lgYDlWGc4jTf6YfTPMGQB4Z46DYsQn9fH06M+0m+ECJ+VxrvetwQpCk3lVroJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtslR5ur; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4571F000E9;
	Wed, 15 Jul 2026 13:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784120966;
	bh=wsxT5Nei/pXNtplqSgGgPoBP3RgXHfqBbo9yCD3QM0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JtslR5urgE8vRtnO1BH1g02FkzXrLeKcugJNT7sTtuf8PzfknP/FcA4mHau0guwP+
	 3nsEo8dd/9WCqSrq+f+jU5AyYtqh5jqm9ox0u2tnswWTN8xg9yO+x6Iv/VPTbG3fyX
	 +qk53BgvB1EKmygznECPhz+JOK21NoWJH4blxU/y89Qwe5CSiWE11uBmM0ro/kSjSS
	 X5ldXZrHuMfAXVpIXCF99+Tl3hoPqvSOeBQxowYbQqkmgPl7o1LkgxXcFuu7CUiArA
	 7JD6W3GP2fxspXU1M7F9w6kbhd8m9/LoebxtxZzLnP3X9P1GY+tENpqLmcX9e09gYv
	 W4g1x9Dvwqa4Q==
Date: Wed, 15 Jul 2026 14:09:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marius Cristea <marius.cristea@microchip.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Kent Gustavsson <kent@minoris.se>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>,
	linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>
Subject: Re: [PATCH v6 1/5] spi: dt-bindings: Add spi-device-addr peripheral
 property
Message-ID: <1c4af9b1-9937-4cbb-b57f-52ac575b8b89@sirena.org.uk>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
 <20260715-ad5529r-driver-v6-1-cfdf8b9f5ee3@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IzXuoKuv/ubtdJzE"
Content-Disposition: inline
In-Reply-To: <20260715-ad5529r-driver-v6-1-cfdf8b9f5ee3@analog.com>
X-Cookie: "Speed is subsittute fo accurancy."
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-96932-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:marius.cristea@microchip.com,m:marcus.folkesson@gmail.com,m:kent@minoris.se,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jan.sun97@gmail.com,m:linux-spi@vger.kernel.org,m:nedo80@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:marcusfolkesson@gmail.com,m:jansun97@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[metafoo.de,analog.com,kernel.org,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org,microchip.com,gmail.com,minoris.se,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sirena.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D64AA75E95F
X-Rspamd-Action: no action


--IzXuoKuv/ubtdJzE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2026 at 01:41:04PM +0200, Janani Sunil wrote:
> Some SPI devices support sharing a single chip select across multiple
> physical chips by encoding a device address in the SPI frame itself.
> Add the generic spi-device-addr property for describing these hardware
> addresses. The property is placed on the SPI peripheral node and may
> contain multiple addresses.

This really isn't a generic SPI thing, if nothing else you need *far*
more information in there about how exactly this would be put onto the
bus.  If it belongs anywhere outside of the specific device's binding it
feels like it might be regmap.

--IzXuoKuv/ubtdJzE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXhn4ACgkQJNaLcl1U
h9BFywf9GLhvPMx/zAqARTHV92Ikz3iIvmqmLKbDbwynI8niYLhI1ulnhUTHaxfw
Jvy+H+ofBMkjIBeveoiRHtBiDTEnAh9cHA9NNVnBi43qj+cbPRXc03veBrBftD9X
vH/cSYWZ98Mj5dhlroXb6gXBYBrTifANkv9ivpOwE2j/EvL+bC51rGzhqc+T+8tt
gesKevaEmBXvRr7OSivPlAbgQfbm3kcBZJo5CYu9cD/aUkoSlISgTXt5nQN2/RZB
RftQ3HVKiji4b6iC7RSH1PhJh94fTMK7j+zlyNEBHhdjUlI+dRqZR2t1Zt5MbpLA
qiYYA6j6lEuJK09nt1WazNul6jP95Q==
=zhQI
-----END PGP SIGNATURE-----

--IzXuoKuv/ubtdJzE--

