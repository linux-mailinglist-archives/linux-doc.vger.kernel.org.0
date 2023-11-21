Return-Path: <linux-doc+bounces-2815-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7D07F34F5
	for <lists+linux-doc@lfdr.de>; Tue, 21 Nov 2023 18:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E19A6B2122A
	for <lists+linux-doc@lfdr.de>; Tue, 21 Nov 2023 17:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA49C5A0FF;
	Tue, 21 Nov 2023 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i5coG3f9"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD292A4;
	Tue, 21 Nov 2023 09:31:18 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBD25C0006;
	Tue, 21 Nov 2023 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700587877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B3kq6X9wDyuhC6coa3KMXDSFrs/k9gUPcRjKn0KIPLQ=;
	b=i5coG3f9OL1PEPMekdoyYjnQkjcMp/pI4Kskf8SG8FKMbXhmgRmPhQDKLMzv6+WLjUsKrm
	19qd908eimPKaWG28pCRrWAtwiKoxXxV2IGiP27STZM4NWnxZjWk3lKmit5XC3Ux1B5sqj
	EDaijmEeii8RGPTzP3It1HWJaC5vIpsMHNyfU3C6cFxnPl3Z5ZQavmic9/Xz3W1plKUaiT
	/TaIhJaXoJyQsWM4oBMIkko16n60cjTvenfRqZVKCy7URiNgMCRkc8cHjn03jhJYfHT1Sr
	pIiqcSCj4ga26l9Dtt4Y0pzH37+rp3nwXd+rxNfopYSlRMXqyBClgKB8LOHu4A==
Date: Tue, 21 Nov 2023 18:31:14 +0100
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
Message-ID: <20231121183114.727fb6d7@kmaincent-XPS-13-7390>
In-Reply-To: <20231120220549.cvsz2ni3wj7mcukh@skbuf>
References: <20231120105255.cgbart5amkg4efaz@skbuf>
 <20231120121440.3274d44c@kmaincent-XPS-13-7390>
 <20231120120601.ondrhbkqpnaozl2q@skbuf>
 <20231120144929.3375317e@kmaincent-XPS-13-7390>
 <20231120142316.d2emoaqeej2pg4s3@skbuf>
 <20231120093723.4d88fb2a@kernel.org>
 <20231120190023.ymog4yb2hcydhmua@skbuf>
 <20231120115839.74ee5492@kernel.org>
 <20231120211759.j5uvijsrgt2jqtwx@skbuf>
 <20231120133737.70dde657@kernel.org>
 <20231120220549.cvsz2ni3wj7mcukh@skbuf>
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

On Tue, 21 Nov 2023 00:05:49 +0200
Vladimir Oltean <vladimir.oltean@nxp.com> wrote:

> On Mon, Nov 20, 2023 at 01:37:37PM -0800, Jakub Kicinski wrote:
> > > Is it an accurate summary? =20
> >=20
> > Yes.
> >=20
> > For now we can impose the requirement that only one can be active=20
> > easily at the kernel level. But the uAPI should allow expressing more. =
=20
>=20
> I see. That's quite something to think about for K=C3=B6ry. In its defens=
e,
> I also agree that this idea seems the most orthogonal to everything else
> that we have or may want to add in the future, and is not likely to
> become obsoleted by some other mechanism that can achieve the same
> thing, but in a more flexible way. It's just that it's quite the task.
>=20
> I sense it may be time to dust off and submit the rest of my
> ndo_hwtstamp_get()/ ndo_hwtstamp_set() conversions before a netlink
> conversion of SIOCGHWTSTAMP/SIOCSHWTSTAMP could even take place...
> https://github.com/vladimiroltean/linux/commits/ndo-hwtstamp-v9

Ok I kind of got an idea of what is your prerequisites.

If I summarize, a solution could be this:

- Expand struct hwtstamp_config with a phc_index member for the SIOCG/SHWTS=
TAMP
  commands.
  To keep backward compatibility if phc_index is not set in the hwtstamp_co=
nfig
  data from userspace use the default hwtstamp (the default being selected =
as
  done in my patch series).
  Is this possible, would it breaks things?

- In netlink part, send one netlink tsinfo skb for each phc_index.

Could be done in a later patch series:
- Expand netlink TSINFO with ETHTOOL_A_TSINFO_HWSTAMP_PROVIDER_QUALIFIER.
  Describing this struct:
enum ethtool_hwstamp_provider_qualifier {
 	ETHTOOL_HWSTAMP_PROVIDER_QUALIFIER_PRECISE,
 	ETHTOOL_HWSTAMP_PROVIDER_QUALIFIER_APPROX,
};=20

  Set the desired qualifier through TSINFO_SET or through SIOCSHWTSTAMP by
  expanding again the struct hwtstamp_config.

Do you think this is feasible?
I might miss some core stuff.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

