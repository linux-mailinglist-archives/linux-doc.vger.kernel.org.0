Return-Path: <linux-doc+bounces-2703-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 635957F1999
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 18:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AA731C20EF7
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 17:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BD22032C;
	Mon, 20 Nov 2023 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NqRwhY2+"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07AFC3;
	Mon, 20 Nov 2023 09:17:40 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 986E51BF205;
	Mon, 20 Nov 2023 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700500659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4teWHQnp+D0qkH3bihHdSeNOl/p47PRZpIXgUC4HDY=;
	b=NqRwhY2+f05Nry1E99Svu6kbDoDud6ovruayP+67cj6ikMO9tA+TJuC3IH4SESgIPsemRT
	fGkab3bnPX3EUgU/FU9lsonOIavDqVKlcT9mGWoz07ecxNsmsWSI09ojOAYIcSB7aa0qp0
	gmUw0w1fER66sYDijIp6/pe/uX78wwvEgOiqxzXEGvZ9C60uU7MtOU7fPNSStzveJuG5XT
	ILuLCyZ/dwK/EPjVO1O1rr/xq3AeZ2DQoz1nDpxG4QphnpUuvpYyYtUqhbR1bPdgyw7o9e
	PN8Nw0GzMcuT8AsbanrXDda+qcypNB7OXjUJ67L61CLOwwiVcm769G4RnMJp6g==
Date: Mon, 20 Nov 2023 18:17:36 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Richard
 Cochran <richardcochran@gmail.com>, Radu Pirea
 <radu-nicolae.pirea@oss.nxp.com>, Jay Vosburgh <j.vosburgh@gmail.com>, Andy
 Gospodarek <andy@greyhouse.net>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Horatiu Vultur <horatiu.vultur@microchip.com>,
 UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v7 15/16] net: ethtool: ts: Let the active time
 stamping layer be selectable
Message-ID: <20231120181736.058fd6e2@kmaincent-XPS-13-7390>
In-Reply-To: <20231120161004.flnwqv5dousiltcb@skbuf>
References: <20231114-feature_ptp_netnext-v7-0-472e77951e40@bootlin.com>
	<20231114-feature_ptp_netnext-v7-15-472e77951e40@bootlin.com>
	<20231118183433.30ca1d1a@kernel.org>
	<20231120104439.15bfdd09@kmaincent-XPS-13-7390>
	<20231120105255.cgbart5amkg4efaz@skbuf>
	<20231120121440.3274d44c@kmaincent-XPS-13-7390>
	<20231120120601.ondrhbkqpnaozl2q@skbuf>
	<20231120144929.3375317e@kmaincent-XPS-13-7390>
	<20231120142316.d2emoaqeej2pg4s3@skbuf>
	<20231120155344.14cd69d9@kmaincent-XPS-13-7390>
	<20231120161004.flnwqv5dousiltcb@skbuf>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: kory.maincent@bootlin.com

On Mon, 20 Nov 2023 18:10:04 +0200
Vladimir Oltean <vladimir.oltean@nxp.com> wrote:

> On Mon, Nov 20, 2023 at 03:53:44PM +0100, K=C3=B6ry Maincent wrote:
> > I did thought about it but I got stuck by the case of hardware timestam=
ping
> > without PHC. Richard explained the reason of its existence here:
> > https://lore.kernel.org/netdev/ZS3MKWlnPqTe8gkq@hoboy.vegasvil.org/#t
> >=20
> > Maybe I got a bit stuck in my implementation and should investigate more
> > your proposition and how to deal with this case. Do you have an idea on=
 how
> > to solve it? =20
>=20
> I would take what Richard said with a grain of salt, and interpret as
> "there exists hardware with hwts but w/o PHC, and that may work for
> marginal use cases", not that "we should design having that as a
> first-class citizen in mind".

> When elected as master, it kinda works, and does synchronize with a
> slave, even if ptp4l gets confused about the phc_index being -1.
>=20
> But when elected as a slave by the BMCA, ptp4l gets confused and thinks
> that phc_index =3D=3D -1 means that it's supposed to use software timesta=
mping.
>=20
> So, I guess the only thing we need to do to this kind of setup is not do
> too much harm to it.
>=20
> We break nothing if we make the phc_index the central aspect of hwts
> layer selection - except for the fact that such a MAC won't be able to
> change its timestamping layer to be a PHY.
>=20
> If we wanted to add such a capability to that MAC driver, the obvious
> way to solve the lack of a PHC is to create a PHC that returns
> -EOPNOTSUPP for all of its ptp_clock_info operations (gettime, settime
> etc). It may possibly be that, in the worst case, ptp4l needs to probe
> for each syscall on the NIC's PHC being operational before deciding what
> can be done with it. But that's already an improvement over the current
> handling to make it more graceful, it's not to keep things on par.

Ok, you convinced me.
Thanks for your arguments and spending time explaining it.


Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

