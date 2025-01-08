Return-Path: <linux-doc+bounces-34339-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D265CA05662
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 10:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D00D3A6D0D
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 09:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3584A1F63DF;
	Wed,  8 Jan 2025 09:09:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A61F5422
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327352; cv=none; b=OVjVJfaySEwYXz8KnkDGMeHVqmBZlWivGT4F8+qJQ5OWZsawo5vLb2wCix4D2I4tIZRK6QAcZu51dzNUSpB56fgXxmomlQup+YWLxkd+Uxbj+puYEY5iqQ8VylQKhP7vhvFWHeRal3LSY1qoTg7Mdp5IeywNRi940GAR2v0Uttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327352; c=relaxed/simple;
	bh=sZy+CtleEBJwKBhskr0ChQCFtwDfwOPWpWsbPSjKUTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeITrUHJFXs9jpK1z/Cc2RshlpUTihg4d7JqevYnZuujlP2C1bjmYrjJeJGeL+xxoCDNeuI3pr7d1mHn+SU7mpzkhDCZbtKu8x5/QZYMikFd1NtjkkvPftwFt6+JweC3lVKN0GP6gsn1hsH03DZkbbO9RyJycT9bPyXdjB7cVQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tVS3b-0005JL-9C; Wed, 08 Jan 2025 10:08:55 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVS3Z-007UV9-2N;
	Wed, 08 Jan 2025 10:08:54 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVS3a-00BQmR-1H;
	Wed, 08 Jan 2025 10:08:54 +0100
Date: Wed, 8 Jan 2025 10:08:54 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/8] net: ethtool: plumb PHY stats to PHY
 drivers
Message-ID: <Z35ApuS2S1heAqXe@pengutronix.de>
References: <20250106083301.1039850-1-o.rempel@pengutronix.de>
 <20250106083301.1039850-3-o.rempel@pengutronix.de>
 <20250107180216.5802e941@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107180216.5802e941@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Tue, Jan 07, 2025 at 06:02:16PM -0800, Jakub Kicinski wrote:
> On Mon,  6 Jan 2025 09:32:55 +0100 Oleksij Rempel wrote:
> > +/**
> > + * phy_ethtool_get_link_ext_stats - Retrieve extended link statistics for a PHY
> > + * @phydev: Pointer to the PHY device
> > + * @link_stats: Pointer to the structure to store extended link statistics
> > + *
> > + * Populates the ethtool_link_ext_stats structure with link down event counts
> > + * and additional driver-specific link statistics, if available.
> > + */
> > +static inline void phy_ethtool_get_link_ext_stats(struct phy_device *phydev,
> > +				    struct ethtool_link_ext_stats *link_stats)
> > +{
> > +	link_stats->link_down_events = READ_ONCE(phydev->link_down_events);
> > +
> > +	if (!phydev->drv || !phydev->drv->get_link_stats)
> > +		return;
> > +
> > +	mutex_lock(&phydev->lock);
> > +	phydev->drv->get_link_stats(phydev, link_stats);
> > +	mutex_unlock(&phydev->lock);
> > +}
> 
> Do these have to be static inlines?
> 
> Seemds like it will just bloat the header, and make alignment more
> painful.

On one side I need to address the request to handle phydev specific
thing withing the PHYlib framework. On other side, I can't do it without
openen a pandora box of build dependencies. It will be a new main-side-quest
to resolve build dependency of net/ethtool/ and PHYlib. The workaround is to
put this functions to the header.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

