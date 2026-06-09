Return-Path: <linux-doc+bounces-91708-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMZ1H5U/KGr8AwMAu9opvQ
	(envelope-from <linux-doc+bounces-91708-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 18:30:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC0266263D
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 18:30:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DqOm3wHc;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91708-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91708-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF49D308BF39
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 15:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5D74963BF;
	Tue,  9 Jun 2026 15:58:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00135AC34;
	Tue,  9 Jun 2026 15:58:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781020730; cv=none; b=OuqmezioVk4vEmOD4ka1ZYuegsU94m9XTotG+zEUMtVI1rW9JnU5khNoVA+ikXUdORBmsA7MePdi2ujIqyVlu6ePmxw1k/MMuHJ94eECPoxxMz3e5ZvaUjFRVbE7W/66I8ny9bPAd86HU4fD4M1+oBwMeCyYjRlpbHzLZwK+7n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781020730; c=relaxed/simple;
	bh=cOaIJdTFqq83MKwZKsyyJUkczQcNRszHqogFq+0mymA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWWY5+LQtBnk1bRhaWF/SQyukTFTqqud+7Mmig7gO0S53PUkYHWMGKjvqk6AYKRW+qX8ynmZtc2QgJIUj5zP/dR7b0Rj+2Zng27tnJuPZbm+oARPWuyuqi1IqepIpQui3QW7en4HiglRlGEFJMe1zpsWvn61DTHkectYaKYaqk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqOm3wHc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4471F00893;
	Tue,  9 Jun 2026 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781020728;
	bh=cOaIJdTFqq83MKwZKsyyJUkczQcNRszHqogFq+0mymA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DqOm3wHcuLfaUlyy54HbF8//A9a/6W60/CEr+acqTOOocSBKY0liWiITjMauC3kC0
	 sze1GWGP74DJpoFL0XC7/X7eW//bomxps100x7GoWJYEbciM66/ASNJxCDKv4gwfOo
	 2DN26hJopOBkDforflt1oamjuSYdPNuIjV5UTXyc/cmVU2FkhT7RIJaxynEierv7kV
	 SXNneQYC95PA9v+m3qBFSmkZ0edxpSxiv9jYcjhdtTLP5HxuNAaP1DREyPYm76oBs1
	 kGbQ4odA/8AdpwOmhoYoK/SSaK3B71UaKb+alAnZzM+M6mOG7nQRbzYlfBr2pppEIO
	 /h023YeXDTMZA==
Date: Tue, 9 Jun 2026 16:58:43 +0100
From: Conor Dooley <conor@kernel.org>
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
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: dac: Add AD5529R
Message-ID: <20260609-donator-freefall-1a7e9293a567@spud>
References: <20260609-ad5529r-driver-v4-0-2e4c02234a1a@analog.com>
 <20260609-ad5529r-driver-v4-1-2e4c02234a1a@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qPxgsXOT/Ho013vw"
Content-Disposition: inline
In-Reply-To: <20260609-ad5529r-driver-v4-1-2e4c02234a1a@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jan.sun97@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jansun97@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91708-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[metafoo.de,analog.com,kernel.org,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCC0266263D


--qPxgsXOT/Ho013vw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--qPxgsXOT/Ho013vw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaig4MwAKCRB4tDGHoIJi
0vBoAP0e3RXoJO1WefX2s+XOlA/edgvzVUSspZy5boc2x8ZuGQD+N0b0R8F1dCBY
kOpchVPhhKevOPY8B/wLXcZ/4OtQJgM=
=2rRZ
-----END PGP SIGNATURE-----

--qPxgsXOT/Ho013vw--

