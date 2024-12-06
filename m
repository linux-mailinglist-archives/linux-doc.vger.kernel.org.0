Return-Path: <linux-doc+bounces-32181-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6529E6D22
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2024 12:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8DE0281F31
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2024 11:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9516F20010C;
	Fri,  6 Dec 2024 11:14:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5D1FF61F
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483689; cv=none; b=awMYFAJIE62GOMTE4KDCLqBX4fSqgH/hQ+T1H7wFn55QjhPoKse9PcWx81Sp6UEe7Ej8Fq7OdG78vsuOh7trL91H5YXdol33FgnYTi1OeT9SoK2/xS/yJkaRUdA6k/e5Rgx6/Bu38CftSjhHWAmH4vb5QvfEvAfQaljK9jTcx2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483689; c=relaxed/simple;
	bh=c4wnULx30kF6QKuqmIpq0DTjg78yxqF+ySmHnLw0LvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9QnmSQlcHi1G90gdOWTYCYVxk0GCVujzGo8qnFp6kRpwy3VkqhTbng44hRZQA3/jQlr28/mFp/RyHOO6Zp1hMSOZnjL/uxg34JzTHHIA9zcbuuWA+xY8k/BJvkPFBh5IJOOv1cN1sSMdN4KBg2pk8BSJ6eM/EGCKOXtza6pP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tJWHf-0000hY-6x; Fri, 06 Dec 2024 12:14:07 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tJWHc-001zPI-0Q;
	Fri, 06 Dec 2024 12:14:04 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tJWHc-000nMX-2Z;
	Fri, 06 Dec 2024 12:14:04 +0100
Date: Fri, 6 Dec 2024 12:14:04 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v1 4/7] phy: introduce optional polling
 interface for PHY statistics
Message-ID: <Z1LcfPNmW8VgTlOM@pengutronix.de>
References: <20241203075622.2452169-1-o.rempel@pengutronix.de>
 <20241203075622.2452169-5-o.rempel@pengutronix.de>
 <87c2743c-1ee0-4c6c-b20d-e8e4a4141d43@intel.com>
 <Z1GYEyQ6vxK67Yh1@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z1GYEyQ6vxK67Yh1@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Thu, Dec 05, 2024 at 12:09:55PM +0000, Russell King (Oracle) wrote:
> On Thu, Dec 05, 2024 at 09:14:08AM +0100, Mateusz Polchlopek wrote:
> > On 12/3/2024 8:56 AM, Oleksij Rempel wrote:
> > > Add an optional polling interface for PHY statistics to simplify driver
> > > implementation. Drivers can request the PHYlib to handle the polling task by
> > > explicitly setting the `PHY_POLL_STATS` flag in their driver configuration.
> > > 
> > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > ---
> > >   drivers/net/phy/phy.c | 15 +++++++++++++++
> > >   include/linux/phy.h   |  6 ++++++
> > >   2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> > > index 0d20b534122b..b10ee9223fc9 100644
> > > --- a/drivers/net/phy/phy.c
> > > +++ b/drivers/net/phy/phy.c
> > > @@ -1346,6 +1346,18 @@ static int phy_enable_interrupts(struct phy_device *phydev)
> > >   	return phy_config_interrupt(phydev, PHY_INTERRUPT_ENABLED);
> > >   }
> > > +/**
> > > + * phy_update_stats - update the PHY statistics
> > > + * @phydev: target phy_device struct
> > > + */
> > 
> > As this is newly intoduced function I would love to see the full
> > kdoc header, with information what the function returns, like here:
> > 
> > https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
> 
> As it's an internal phylib function, I don't think there's any need for
> kernel-doc unless it's something more complex. It's obvious what the
> function itself is doing.
> 
> What would be more helpful is to properly document the "update_stats"
> method, since that is what PHY drivers are going to implement. Yes, I
> know kernel-doc isn't good at that, but look at phylink.h to see how
> to do it.

Ok, i'll send a preparation patch to make it consequently for all
callbacks in this struct.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

