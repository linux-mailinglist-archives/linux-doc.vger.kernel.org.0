Return-Path: <linux-doc+bounces-34327-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2461A052C0
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 06:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E83B1888CF3
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jan 2025 05:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DE8225D7;
	Wed,  8 Jan 2025 05:47:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3050211CAF
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736315256; cv=none; b=HHAQ2XyoZsGJBamiYiY1kOFeyEOo3lHzIY+tsrki2Q5RsEaRwMbHOacPtf9oS+kdocKLa0fEDAhQDlU/jbcsw3K6JXy+PumZqE37ACPSsoB7q4xP8LsUYsI1bCEaiCTrsHLLtFUzVtk5G8yhj3jfEAnaeh2USOxrG6Dp3OcpV7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736315256; c=relaxed/simple;
	bh=mPKhWPu8pYX8pUmDbAmVTi61K7p19wbdAQVS1KLCFB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkgyLI70SWASrBWEZq3IdHJMPVKybiQmGoqcuMIlBtO68v50dD7j8mVhZ/oz9aqBICTVSqXGav6i7JyvwZUqIB8UZFQZJGZoTDxQC/TVv94f6kjMuUfF5/5GxvSMqtLFr9hF6oROPrxr0kIkVyRb7JiBxoOcaIFbIEXIPj9f50Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tVOuR-0007Ui-V4; Wed, 08 Jan 2025 06:47:15 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVOuM-007Spp-10;
	Wed, 08 Jan 2025 06:47:11 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tVOuM-00BNpv-36;
	Wed, 08 Jan 2025 06:47:10 +0100
Date: Wed, 8 Jan 2025 06:47:10 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next 11/14] net: pse-pd: Add support for PSE device
 index
Message-ID: <Z34RXjqUKBdDqAGF@pengutronix.de>
References: <20250104-b4-feature_poe_arrange-v1-0-92f804bd74ed@bootlin.com>
 <20250104-b4-feature_poe_arrange-v1-11-92f804bd74ed@bootlin.com>
 <20250107171834.6e688a6b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107171834.6e688a6b@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Tue, Jan 07, 2025 at 05:18:34PM -0800, Jakub Kicinski wrote:
> On Sat, 04 Jan 2025 23:27:36 +0100 Kory Maincent wrote:
> > From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> > 
> > Add support for a PSE device index to report the PSE controller index to
> > the user through ethtool. This will be useful for future support of power
> > domains and port priority management.
> 
> Can you say more? How do the PSE controllers relate to netdevs?
> ethtool is primarily driven by netdev / ifindex.
> If you're starting to build your own object hierarchy you may be
> better off with a separate genl family.
            
I hope this schema may help to explain the topology:

	                              +--- netdev / ifindex 0
	    +--- PSE power domain 0 --+--- netdev / ifindex 1
            |                         +--- netdev / ifindex 2
PSE ctrl 0 -+
            |                         +--- netdev / ifindex 3
            +--- PSE power domain 1 --+--- netdev / ifindex 4
	                              +--- netdev / ifindex 5

	                              +--- netdev / ifindex 6
	    +--- PSE power domain 2 --+--- netdev / ifindex 7
            |                         +--- netdev / ifindex 8
PSE ctrl 1 -+
            |                         +--- netdev / ifindex 9
            +--- PSE power domain 3 --+--- netdev / ifindex 10
	                              +--- netdev / ifindex 11

PSE device index is needed to find actually PSE controller related to
specific netdev / ifindex.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

