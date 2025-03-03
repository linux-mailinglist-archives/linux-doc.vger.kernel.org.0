Return-Path: <linux-doc+bounces-39952-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47831A4EB9D
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 19:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE81E901531
	for <lists+linux-doc@lfdr.de>; Tue,  4 Mar 2025 18:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABA827BF82;
	Tue,  4 Mar 2025 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hh9Xbh/R"
X-Original-To: linux-doc@vger.kernel.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B1220A5DE
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 18:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741111302; cv=pass; b=g9MkEs8FT35lBOivHE4Tp+2vJjKhVVGZl6/mTtnv+TpET3+1BzuSZZV5qupq8ZRVQ5ejlFIJ1XNY3b6ogpfnzi/HGAnWESuH9Q8822QZWZqETw05AH7xajA7nZM52HLQDnEFgB/b2ZLXNBHonSQfwWvyBF0ZW3GGcMktGZV9MtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741111302; c=relaxed/simple;
	bh=z4i8udCT/ZfEevZGKBvDxxzaszOTpIOByQJPMKtGeNs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+sfTVyxaYA/5GK216RpfoxsFr0or7eIp263oO2q7q/kARi0Ew6DhSwwgky+8mjxUZpblDiH3cZbGaZQTZNdXSA9b354YmuBIEuu6eCU90JM3W64GM8dsErmX//CzOkXguBR2oHmmJBpcD8/yvIkfZX/+1f2/7fi/S/yY804Q6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hh9Xbh/R; arc=none smtp.client-ip=217.70.183.198; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; arc=pass smtp.client-ip=160.75.25.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 3B9A140D1F44
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 21:01:39 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6f922J04zFyP1
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 18:04:22 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id AE1FA42724; Tue,  4 Mar 2025 18:04:09 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hh9Xbh/R
X-Envelope-From: <linux-kernel+bounces-541838-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hh9Xbh/R
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 4E2A7400FE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:41:56 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by fgw1.itu.edu.tr (Postfix) with SMTP id D8F2C305F789
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:41:55 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B03D13AA184
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C11213240;
	Mon,  3 Mar 2025 13:41:09 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037D20DD62;
	Mon,  3 Mar 2025 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741009266; cv=none; b=g5qLwuTSuE5GFIGLLXldrNg7zJQyb6hqmnuW699PJqts3afwQHlS0NA/ml++xgomsTP5vyJmDhmwDO3pwv2jz8iceNUTtWJLIhAdtIwsohZT4UNb61VOzx9FCdS1nXYCcA3lUiprlGpraj8ft4qphx/a4PVJzXjpUG/IGiXzptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741009266; c=relaxed/simple;
	bh=z4i8udCT/ZfEevZGKBvDxxzaszOTpIOByQJPMKtGeNs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uiCWC8lI+rEXmVvdDUSEk/wiNhmtU/bt96TX+afhdvkVCz3+eCH8VW4Od3rsWg+LuxRK81BpsENwHsfDXi3Ybay+U1YzKs9ovkz3/ehIXzMpJAmFg+7Nji5dszq8cHlecMx403zLbWRhVLoxJlllDcWCQhj0aBMXq0JJY3TuK3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hh9Xbh/R; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 909C344262;
	Mon,  3 Mar 2025 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741009254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nl/1wzHduxVzKeGZ515j0lRor1Gx/DhlgaVPUGMQYoo=;
	b=hh9Xbh/R7+cqL6kO3EUvJrLcd0D99wSBACUMwxd3PfoMb86Em+iQyXzmftNd5I5ZEj9MAF
	gq0YraAvXdyywhq2rOVhiYSMRYUH+EuGCLS0qfRzA8WREZjjfw5G8gnRWaYlEtncKDH+ck
	GaqrXuWkxYZZsdPNnNl1rDMtMVv/C21VtNp8CKn18BcGu2UtEjA2VIN4EXNLVnintGCZyq
	ShgVkTDvEF5GmxULVcFdZ0C0SPulan8WTDOaplGT9KxHETHzUICistCK5/VdLs1jG+1zwK
	0DJdkJfIx0Vi6OiBU9UtdCya3aVOwiO0EKeeQT0FQ1lEedI5+bML5+Mz0pyeHQ==
Date: Mon, 3 Mar 2025 14:40:51 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Donald Hunter
 <donald.hunter@gmail.com>, Rob Herring <robh@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>, Dent
 Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 06/12] net: pse-pd: Add support for budget
 evaluation strategies
Message-ID: <20250303144051.2503fb43@kmaincent-XPS-13-7390>
In-Reply-To: <Z8ME-90Xg46-pNhA@pengutronix.de>
References: <20250224134522.1cc36aa3@kernel.org>
	<20250225102558.2cf3d8a5@kmaincent-XPS-13-7390>
	<20250225174752.5dbf65e2@kernel.org>
	<Z76t0VotFL7ji41M@pengutronix.de>
	<Z76vfyv5XoMKmyH_@pengutronix.de>
	<20250226184257.7d2187aa@kernel.org>
	<Z8AW6S2xmzGZ0y9B@pengutronix.de>
	<20250227155727.7bdc069f@kmaincent-XPS-13-7390>
	<Z8CVimyMj261wc7w@pengutronix.de>
	<20250227192640.20df155d@kmaincent-XPS-13-7390>
	<Z8ME-90Xg46-pNhA@pengutronix.de>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelledvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehordhrvghmphgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiiv
 ghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepughonhgrlhgurdhhuhhnthgvrhesghhmrghilhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6f922J04zFyP1
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741715996.14729@JtEWVfPDOWJr0KBDsFR2rA
X-ITU-MailScanner-SpamCheck: not spam

On Sat, 1 Mar 2025 14:00:43 +0100
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> On Thu, Feb 27, 2025 at 07:26:40PM +0100, Kory Maincent wrote:
> > On Thu, 27 Feb 2025 17:40:42 +0100
> > Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> > > I would prefer to have it in the for of devlink or use regulator netl=
ink
> > > interface. But, we do not need to do this discussion right now. =20
> >=20
> > If we want to report the method we should discuss it now. We shouldn't =
add
> > BUDGET_EVAL_STRAT uAPI to ethtool if we use another way to get and set =
the
> > method later. =20
>=20
> Ok, I assume we are talking about different things. I mean - not port
> specific configurations and diagnostic, will have different interface.
>=20
> BUDGET_EVAL_STRAT is port specific. HP and Cisco implement it as port
> specific. PD692x0 Protocol manual describe it as port specific too:
> 3.3.6 Set BT Port Parameters
>  Bits [3..0]=E2=80=94BT port PM mode
>   0x0: The port power that is used for power management purposes is
>        dynamic (Iport x Vmain).
>   0x1: The port power that is used for power management purposes is port
>        TPPL_BT.
>   0x2: The port power that is used for power management purposes is
>        dynamic for non LLDP/CDP/Autoclass ports and TPPL_BT for
> LLDP/CDP/Autoclass ports. 0xF: Do not change settings.

I don't really understand how that can be port specific when the power budg=
et is
per PD69208 manager. Maybe I am missing information here.

> > We could also not report the method for now and assume the user knows i=
t for
> > the two controllers currently supported. =20
>=20
> On one side: it is not just status, but also active configuration. By
> implementing the interface we may break default configuration and user
> expectations.

Yes we should not implement the budget method get/set interface in this ser=
ies.
=20
> On other side: PD692x0 seems to need more then just setting prios to
> manage them correctly. For example power bank limits should be set,
> otherwise internal firmware won't be able to perform budget calculations.

Patch 8 is already configuring the power PD692x0 bank limit according to PSE
power domain budget.

> So, I assume, critical components are missing anyway.

As we are not supporting the budget method configured by the user in this
series, I agreed we should not add any uAPI related to it that could be bro=
ken
or confusing later.

I will remove it and send v6.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


