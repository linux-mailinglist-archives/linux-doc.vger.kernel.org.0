Return-Path: <linux-doc+bounces-2986-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841F37F657A
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 18:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5B091C20F92
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 17:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01F3405DA;
	Thu, 23 Nov 2023 17:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QG0qPjrC"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B094B3FB2E;
	Thu, 23 Nov 2023 17:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6ACC433CA;
	Thu, 23 Nov 2023 17:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700760727;
	bh=i/UmJQborfV2Bwp12JPQd5IyP+xtuh/1l7Ba+8D7N40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QG0qPjrCi1vGR1QW7yDLAmOJTyqo5G2UC1ypD9GxicXfMXi2WhY+IkNhfYiQqUoPt
	 aD3vWrdWv+d/V5d1iUKpY2gIPzqizl601TCaZsedmFaQdLU5Ggc4UdG/D5X3WWd9jP
	 3hnuBcVVfj3VCgGP5IKrxRoHkYoTZUIsoc2jYZ2dSokGXCDf0TdPvXwGSRWmRi2T5x
	 qUzVox+a652YHcyIe79BP3RMzjqZ/2EfdpUFaB13aRAHXZeb0nmvjg8Bqe+iyW97IT
	 795u1ZcLgP3GHPVTL9QgLHK4AJ45ArFF/31/IHnbhMDC7+pMKpK36NY64kL+JwtJB4
	 GE5TM2vPCXeqg==
Date: Thu, 23 Nov 2023 09:32:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Florian Fainelli
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
Message-ID: <20231123093205.484356fc@kernel.org>
In-Reply-To: <20231123160056.070f3311@kmaincent-XPS-13-7390>
References: <20231120190023.ymog4yb2hcydhmua@skbuf>
	<20231120115839.74ee5492@kernel.org>
	<20231120211759.j5uvijsrgt2jqtwx@skbuf>
	<20231120133737.70dde657@kernel.org>
	<20231120220549.cvsz2ni3wj7mcukh@skbuf>
	<20231121183114.727fb6d7@kmaincent-XPS-13-7390>
	<20231121094354.635ee8cd@kernel.org>
	<20231122144453.5eb0382f@kmaincent-XPS-13-7390>
	<20231122140850.li2mvf6tpo3f2fhh@skbuf>
	<20231122085000.79f2d14c@kernel.org>
	<20231122165517.5cqqfor3zjqgyoow@skbuf>
	<20231122100142.338a2092@kernel.org>
	<20231123160056.070f3311@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Nov 2023 16:00:56 +0100 K=C3=B6ry Maincent wrote:
> > FTR so far the netdev family is all about SW configuration. We should
> > probably keep it that way, so it doesn't become ginormous. It's easy
> > enough to create a new family, if needed. =20
>=20
> So, do we have a consensus? Vlad, do you agree on putting all under ethto=
ol?

If not we can do a vote/poll? Maybe others don't find the configuration
of timestamping as confusing as me.

