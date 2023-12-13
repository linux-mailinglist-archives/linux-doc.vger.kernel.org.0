Return-Path: <linux-doc+bounces-4240-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7319E8069B1
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 09:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995271C20A60
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 08:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC679182A7;
	Wed,  6 Dec 2023 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aJNEGg9Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AF4112;
	Wed,  6 Dec 2023 00:35:15 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D83840008;
	Wed,  6 Dec 2023 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701851714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JkFIxNj8NPk822mRewsy8oS7BhiBkPsoFjDPzgpryg=;
	b=aJNEGg9Z/Z1hk8At6T7xptjbm9FfpsaIX/W36ZUxZuUNKQDNAES8c3SK4LY0B/fiNLQv4Y
	rcLuq5MeYwusid5ahKRvzYGBmdAQ+0owGMQ924oLKyJ/mDRsDKW6w+rzF7hak9c4XhuQpD
	KPM+WHfdJShJr1QPZjv/pK0SEhacoJq6YqoiBixzbI6ACTW9GpHH41SR/1akJ/PDWRiv8n
	+CapeooQBZz+n7I1HgHwytx/drEdrivxmF48c1iiQOr+BCXd/Hv/2YDKVv0w9NGTqTeqTk
	JjhawXR80bK8HkvY5P7wa3Bi0Lq+kAoCE/MHLyDJxqIxPFSRDq/KQK296DoZNA==
Date: Wed, 6 Dec 2023 09:35:10 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain
 <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, attreyee-muk
 <tintinm2017@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Linux Networking <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Linux Documentation <linux-doc@vger.kernel.org>, Linux Devicetree
 <devicetree@vger.kernel.org>, Dent Project
 <dentproject@linuxfoundation.org>
Subject: Re: [PATCH net-next v2 2/8] ethtool: Expand Ethernet Power
 Equipment with c33 (PoE) alongside PoDL
Message-ID: <20231206093510.68b9179b@kmaincent-XPS-13-7390>
In-Reply-To: <ZW_gWDrlp4ltXIRf@archie.me>
References: <20231201-feature_poe-v2-0-56d8cac607fa@bootlin.com>
	<20231201-feature_poe-v2-2-56d8cac607fa@bootlin.com>
	<ZW_gWDrlp4ltXIRf@archie.me>
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

On Wed, 6 Dec 2023 09:45:44 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On Fri, Dec 01, 2023 at 06:10:24PM +0100, Kory Maincent wrote:
> > In the current PSE interface for Ethernet Power Equipment, support is
> > limited to PoDL. This patch extends the interface to accommodate the
> > objects specified in IEEE 802.3-2022 145.2 for Power sourcing
> > Equipment (PSE).
> >=20
> > The following objects are now supported and considered mandatory:
> > - IEEE 802.3-2022 30.9.1.1.5 aPSEPowerDetectionStatus
> > - IEEE 802.3-2022 30.9.1.1.2 aPSEAdminState
> > - IEEE 802.3-2022 30.9.1.2.1 aPSEAdminControl
> >=20
> > To avoid confusion between "PoDL PSE" and "PoE PSE", which have similar
> > names but distinct values, we have followed the suggestion of Oleksij
> > Rempel and Andrew Lunn to maintain separate naming schemes for each,
> > using c33 (clause 33) prefix for "PoE PSE".
> > You can find more details in the discussion threads here:
> > https://lore.kernel.org/netdev/20230912110637.GI780075@pengutronix.de/
> > https://lore.kernel.org/netdev/2539b109-72ad-470a-9dae-9f53de4f64ec@lun=
n.ch/
> >=20
> > Sponsored-by: Dent Project <dentproject@linuxfoundation.org>
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >=20
> > Changes in v2:
> > - Rename all the PoE variables and enum with a c33 prefix.
> > - Add documentation, thanks to Oleksij for having written one.
> > ---

>=20
> I get many htmldocs warnings:

Oops sorry, I forgot to run the documentation build.
Thanks for your reviews!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

