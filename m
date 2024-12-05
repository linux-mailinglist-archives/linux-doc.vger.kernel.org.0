Return-Path: <linux-doc+bounces-32078-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9159E522C
	for <lists+linux-doc@lfdr.de>; Thu,  5 Dec 2024 11:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910BF1654C5
	for <lists+linux-doc@lfdr.de>; Thu,  5 Dec 2024 10:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F11B1D95BE;
	Thu,  5 Dec 2024 09:51:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7184A1D90B6
	for <linux-doc@vger.kernel.org>; Thu,  5 Dec 2024 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392296; cv=none; b=g/1GISZ77trYq8ioLEjoiCDBSfV6Md2RYoSVmckOm9ExkFrhs6gwo5n2Rj0nQi4A6yJWNmq/2tkA+la0Vkw++3l3jDHaVn3J43DkcP10HiKqqhZVSY2u0lY9DX0FRJHMH7bUNaeHfqSMX3F9zv2tdzIKO/5yAAcNmBh5xBgg36w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392296; c=relaxed/simple;
	bh=kLpngkEs/11Ak9OOYTNMERZLxTu+OUPrakNs9U6Nwlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7KuO36iFyz5DxYazBmMF8b3Qdrz/xfWqvdOUe6IXhTShjkC4M5MMICZVmiei6+dfRPH05yN2Rpijr0Sfecyut5D2Emw7ZA26DQ5yACl/bVsK4EJF+0XlExFu0SmPmeVpuVv4w3S0Us9DxSi/XrN8i6oBJ/gTawTqfERcXjXP4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tJ8Vy-0002HX-Gp; Thu, 05 Dec 2024 10:51:18 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tJ8Vv-001nkX-2w;
	Thu, 05 Dec 2024 10:51:16 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 0C91C3860A2;
	Thu, 05 Dec 2024 09:01:11 +0000 (UTC)
Date: Thu, 5 Dec 2024 10:01:10 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, kernel@pengutronix.de, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Simon Horman <horms@kernel.org>, 
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v1 6/7] phy: dp83td510: add statistics support
Message-ID: <20241205-satisfied-gerbil-of-cookies-471293-mkl@pengutronix.de>
References: <20241203075622.2452169-1-o.rempel@pengutronix.de>
 <20241203075622.2452169-7-o.rempel@pengutronix.de>
 <57a7b3bf-02fa-4b18-bb4b-b11245d3ebfb@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huwtbf5ra3bpiqrd"
Content-Disposition: inline
In-Reply-To: <57a7b3bf-02fa-4b18-bb4b-b11245d3ebfb@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org


--huwtbf5ra3bpiqrd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v1 6/7] phy: dp83td510: add statistics support
MIME-Version: 1.0

On 05.12.2024 09:43:34, Mateusz Polchlopek wrote:
>=20
>=20
> On 12/3/2024 8:56 AM, Oleksij Rempel wrote:
> > Add support for reporting PHY statistics in the DP83TD510 driver. This
> > includes cumulative tracking of transmit/receive packet counts, and
> > error counts. Implemented functions to update and provide statistics via
> > ethtool, with optional polling support enabled through `PHY_POLL_STATS`.
> >=20
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >   drivers/net/phy/dp83td510.c | 98 ++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 97 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/phy/dp83td510.c b/drivers/net/phy/dp83td510.c
> > index 92aa3a2b9744..08d61a6a8c61 100644
> > --- a/drivers/net/phy/dp83td510.c
> > +++ b/drivers/net/phy/dp83td510.c
> > @@ -34,6 +34,24 @@
> >   #define DP83TD510E_CTRL_HW_RESET		BIT(15)
> >   #define DP83TD510E_CTRL_SW_RESET		BIT(14)
> > +#define DP83TD510E_PKT_STAT_1			0x12b
> > +#define DP83TD510E_TX_PKT_CNT_15_0_MASK		GENMASK(15, 0)
> > +
> > +#define DP83TD510E_PKT_STAT_2			0x12c
> > +#define DP83TD510E_TX_PKT_CNT_31_16_MASK	GENMASK(15, 0)
>=20
> Shouldn't it be GENMASK(31, 16) ? If not then I think that macro
> name is a little bit misleading

Yes, the name may be a bit misleading...

[...]

> > + */
> > +static int dp83td510_update_stats(struct phy_device *phydev)
> > +{
> > +	struct dp83td510_priv *priv =3D phydev->priv;
> > +	u64 count;
> > +	int ret;
> > +
> > +	/* DP83TD510E_PKT_STAT_1 to DP83TD510E_PKT_STAT_6 registers are clear=
ed
> > +	 * after reading them in a sequence. A reading of this register not in
> > +	 * sequence will prevent them from being cleared.
> > +	 */
> > +	ret =3D phy_read_mmd(phydev, MDIO_MMD_VEND2, DP83TD510E_PKT_STAT_1);
> > +	if (ret < 0)
> > +		return ret;
> > +	count =3D FIELD_GET(DP83TD510E_TX_PKT_CNT_15_0_MASK, ret);
> > +
> > +	ret =3D phy_read_mmd(phydev, MDIO_MMD_VEND2, DP83TD510E_PKT_STAT_2);
> > +	if (ret < 0)
> > +		return ret;
> > +	count |=3D (u64)FIELD_GET(DP83TD510E_TX_PKT_CNT_31_16_MASK, ret) << 1=
6;
>=20
> Ah... here you do shift. I think it would be better to just define
>=20
> #define DP83TD510E_TX_PKT_CNT_31_16_MASK	GENMASK(31, 16)

No. This would not be the same.

The current code takes the lower 16 bit of "ret" and shifts it left 16
bits.

As far as I understand the code DP83TD510E_PKT_STAT_1 contain the lower
16 bits, while DP83TD510E_PKT_STAT_2 contain the upper 16 bits.

DP83TD510E_PKT_STAT_1 gives 0x????aaaa
DP83TD510E_PKT_STAT_2 gives 0x????bbbb

count will be 0xbbbbaaaa

This raises another question: Are these values latched?

If not you can get funny results if DP83TD510E_PKT_STAT_1 rolls over. On
unlatched MMIO busses you first read the upper part, then the lower,
then the upper again and loop if the value of the upper part changed in
between. Not sure how much overhead this means for the slow busses.

Consult the doc of the chip if you can read both in one go and if the
chip latches these values for that access mode.

> instead of shifting, what do you think ?

nope - If you don't want to shift, you can use a combination of
FIELD_GET() (to extract the relevant 16 bits) and FIELD_PREP() to shift.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--huwtbf5ra3bpiqrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdRa9MACgkQKDiiPnot
vG9nNgf+JnQGbTtZczGIN42CtNQnPQcq46nWZz/ZEHcN4hOvqiglY29fCAPgZWIP
9bgCBN+vIMNhpdRGxU5IXUCczQ8ydTLUdTRMZAhe9TCBB4T215IniLEGRo9f2+ip
49ZhquMAFsA8zVzUQdKNVJZy2KruOTA7bpK1aoPaF7+i5crwnuy36ruKjOR1F7il
OmiCqH2bkQH556J1wxYh/Dm4CX+jkoA//GMYPTeSDX2Prv5vWUdvumufnK3UnhBo
bLVvf0mqMGqaATaP79mBKjZ+nLZGljElJGDJEDIJxGLZzrSy35IC6rxYwegN5Plt
3jw1/Q7V32B7MyfAlsTisokhPQiGsg==
=K6q3
-----END PGP SIGNATURE-----

--huwtbf5ra3bpiqrd--

