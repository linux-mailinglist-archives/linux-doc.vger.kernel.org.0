Return-Path: <linux-doc+bounces-93080-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mPnGKrgvOWqQoAcAu9opvQ
	(envelope-from <linux-doc+bounces-93080-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 14:51:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C816AF915
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 14:51:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l5xm4koM;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93080-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93080-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12A83300B46F
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 12:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDD33ACEF2;
	Mon, 22 Jun 2026 12:50:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864553546D7;
	Mon, 22 Jun 2026 12:50:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132649; cv=none; b=lzPCGVXkXgzVlSQ0zeO4m7S5KmIc46PIpo8TuPJvQ0JvLFu5RXeTszdCzdXJ4ItCa0ZyAACcAXaiDjj0j3H5vO8CJUKTgcRbO7SryI7p7V4no9sWIjJj8gW4jy9LpKe6UFhrE177WIQhcVNh0eOBOG9Yn7F0fIQ7Q33qpLTjFtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132649; c=relaxed/simple;
	bh=fu9bEtkJj9duWj6ks7ux2DCbG6QYjrkTwoW2J9kj36c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibZLIYjtNKsy7cUqLOXiY4HDLklsIYgyUJJK/Od7Yf8KA99wHyJqtoaWyOCyj48iczGxmmFjbZdZW4ChNtIj55AWU+YQOnY/NiEgBoNRIGcYxji6WDr3kkadEKur06eHtQGOe3Mgrm02wZ/t1+lQLwXl+yDr9itEp2OrwMqVazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5xm4koM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1CD1F000E9;
	Mon, 22 Jun 2026 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782132648;
	bh=EpjspqPc8RVanqUWBXpsjH+3t5K2Bpf7z7MqwPHi8OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l5xm4koM1i9Prv60WRscchHrytUzdKgIXHfC3b5ex2g5VKalmLlqPqBI8vheu5iQE
	 p6A2NtnGgAHKOGz4+KdSv7dn+HqeLTtqlkj2HfqxMVBQEqnU/+U8/lQme9+wMcdtNj
	 FcQPysOu4/LmsccZYTX57qRSiig4uIw5Evfc3cgUfebzCN1uG//PhWPcGiRPa9Ypc8
	 L14ZpLUjPw+yIZFgamD5yAXyRxeHcujZ5IUwK0E20RpVo2Xq+/WDpD7fcTzVF06Wmi
	 tdBus+ruXWqqNP/UzvGG4aD1QwX1O5qW7AYDvIa1x/50WEC8fPbsrqifyuQ8/9yK7+
	 QrCRPyrUIbKWw==
Date: Mon, 22 Jun 2026 13:50:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Janani Sunil <jan.sun97@gmail.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
	Janani Sunil <janani.sunil@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add AD5529R
Message-ID: <20260622-gnat-system-a8902ba75a59@spud>
References: <20260619-concierge-doozy-9c161533c369@spud>
 <ajVlD-j0nIGrRVow@nsa>
 <20260621153330.79b6600c@jic23-huawei>
 <20260621-nutmeg-coauthor-715189372230@spud>
 <ajj6nEb4tATM3C7b@nsa>
 <20260622102722.5900592f@jic23-huawei>
 <ajkILRPq_g24g4dH@nsa>
 <caa54d52-72db-4c58-ae3f-1d1343bd7845@gmail.com>
 <20260622-overbid-yonder-3fdfee9eda7a@spud>
 <013aba24-c30c-44a8-8511-96278edb3f4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WwNZbhc224ofLOvu"
Content-Disposition: inline
In-Reply-To: <013aba24-c30c-44a8-8511-96278edb3f4a@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jan.sun97@gmail.com,m:noname.nuno@gmail.com,m:jic23@kernel.org,m:455.rodrigo.alencar@gmail.com,m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:broonie@kernel.org,m:jansun97@gmail.com,m:nonamenuno@gmail.com,m:455rodrigoalencar@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93080-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,analog.com,metafoo.de,baylibre.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02C816AF915


--WwNZbhc224ofLOvu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 02:39:21PM +0200, Janani Sunil wrote:
>=20
> On 6/22/26 14:14, Conor Dooley wrote:
> > On Mon, Jun 22, 2026 at 01:54:25PM +0200, Janani Sunil wrote:
> > > > > > > Why do you think the microchip devices won't work? Does the s=
pi core
> > > > > > > reject multiple devices with the same chip select being regis=
tered or
> > > > > > > something like that?
> > > > > > Not sure how things work atm. But I'm fairly sure it used to be=
 like
> > > > > > that. SPI would reject devices on the same controller and CS. N=
ow that
> > > > > > we support more than one CS per controller, not sure how things=
 work.
> > > > > We always supported more than one per CS per controller. I guess =
you mean
> > > > > per device.
> > > > Obviously :)
> > > > > > Janani, maybe you can give it a try?
> > > > > I think we'd need to get it to work with shared gpio proxy which =
maybe
> > > > > will just get set up under the hood.  This used to be opt in, but=
 seems
> > > > > that changed fairly recently so maybe some of us are working with=
 out
> > > > > of date knowledge!  I haven't played with it yet, so might not be
> > > > > that simple.
> > > > >=20
> > > > What I meant for Janani was basically testing two devices on the sa=
me CS
> > > > as in my pseudo DT. For the GPIO, you mean having a way to select
> > > > between devices on the same CS?
> > > >=20
> > > > For these devices the pin id numbers get's setted up as part of the=
 spi message
> > > > so my assumption is that all of them will receive the message but o=
nly one acks it.
> > > >=20
> > > > - Nuno S=E1
> > > Hi Everyone,
> > >=20
> > > I tested the case where there are two devices on the same CS. The SPI=
 core does reject it at spi_dev_check_cs():
> > > https://github.com/torvalds/linux/blob/master/drivers/spi/spi.c#L631
> >=20
> > Can you try again, but delete that check and allow the code to continue?
> > Worth knowing if the problem is policy (which makes sense for 99.99% of
> > devices that cannot share a chip select) or actually not supported by
> > the spi core code.
>=20
> Hi Conor,
>=20
> The CS conflict check is only a part of the problem. Even after removing =
it, the second device fails at the sysfs layer.
> The device naming in spi_dev_set_name() produces spi{bus}.{cs}. Both devi=
ces register as spi0.0 here, making it a duplicate directory.

That doesn't seem insurmountable, since these devices would really need
to be registered with a flag that notes sharing the cs is okay to solve
the problem in spi_dev_check_cs() which could be re-employed in
spi_dev_set_name() to append something.
Something could very well be the top bits of the address field used for
differentiation for spi{bus}.{cs}.{addr7..6}.

Whatever about this being the correct approach for your devices, there's
existing devices for which this would be needed to fully support, and
that doesn't seem like all that much work to do, if that's all that
prevents it.

Cheers,
Conor.

--WwNZbhc224ofLOvu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajkvogAKCRB4tDGHoIJi
0hypAP9yug04tHXlo6sfoC/lgZrrM44rbRRqOQ+w25dYPMKE3QD+NGyPNxyRom9v
jW+/ddS672+HvdUdN2L1T/P4W7nYRwY=
=kiqN
-----END PGP SIGNATURE-----

--WwNZbhc224ofLOvu--

