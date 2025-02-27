Return-Path: <linux-doc+bounces-39593-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AFBA476B9
	for <lists+linux-doc@lfdr.de>; Thu, 27 Feb 2025 08:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC61016C713
	for <lists+linux-doc@lfdr.de>; Thu, 27 Feb 2025 07:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567C41EB194;
	Thu, 27 Feb 2025 07:40:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFD521D587
	for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 07:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740642055; cv=none; b=bz+eHdRUMktDFkRaDuQUll68EuWGdjgOCjp3Pa7LqQdvKt73V0qyMiLwYMXMaJsZWhpXcnymO9MSY+aDWAbhW4Kr2Deg8h7GJ8xtWmwINEtgfVzgNLkCDAXU90nTJVIvb6ciNcHJ74VWwp04uVy8cqVdZjCue5O0LGvivh9n6lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740642055; c=relaxed/simple;
	bh=oCbBvYZOh7e1jwrU/q972khxUHfALgdzs43hu8+7RGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcxCVsMkCg6RxSAwI6S6da+vg0v9SmDVyLLDP8bhxQe95PO7xi7d/8FxOWlLHvJp8wG+Y/MbCPbNToWBnwF5IENjPOJTe5uoiizsARY3T31pDhdgSdQNrkQ4xsRpHiszzuD7LEryr1fTWAcDGDYSjymEeWHDYbCFUKSpNwwjoSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tnYVQ-0008TU-CV; Thu, 27 Feb 2025 08:40:28 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tnYVN-0035RT-22;
	Thu, 27 Feb 2025 08:40:25 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tnYVN-003K5l-1c;
	Thu, 27 Feb 2025 08:40:25 +0100
Date: Thu, 27 Feb 2025 08:40:25 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	Kyle Swenson <kyle.swenson@est.tech>,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 06/12] net: pse-pd: Add support for budget
 evaluation strategies
Message-ID: <Z8AW6S2xmzGZ0y9B@pengutronix.de>
References: <20250218-feature_poe_port_prio-v5-0-3da486e5fd64@bootlin.com>
 <20250218-feature_poe_port_prio-v5-6-3da486e5fd64@bootlin.com>
 <20250220165129.6f72f51a@kernel.org>
 <20250224141037.1c79122b@kmaincent-XPS-13-7390>
 <20250224134522.1cc36aa3@kernel.org>
 <20250225102558.2cf3d8a5@kmaincent-XPS-13-7390>
 <20250225174752.5dbf65e2@kernel.org>
 <Z76t0VotFL7ji41M@pengutronix.de>
 <Z76vfyv5XoMKmyH_@pengutronix.de>
 <20250226184257.7d2187aa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226184257.7d2187aa@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Wed, Feb 26, 2025 at 06:42:57PM -0800, Jakub Kicinski wrote:
> On Wed, 26 Feb 2025 07:06:55 +0100 Oleksij Rempel wrote:
> > Here is one example how it is done by HP switches:
> > https://arubanetworking.hpe.com/techdocs/AOS-CX/10.08/HTML/monitoring_6200/Content/Chp_PoE/PoE_cmds/pow-ove-eth-all-by.htm
> > 
> > switch(config)# interface 1/1/1    <---- per interface
> > switch(config-if)# power-over-ethernet allocate-by usage
> > switch(config-if)# power-over-ethernet allocate-by class
> > 
> > Cisco example:
> > https://www.cisco.com/c/en/us/td/docs/switches/datacenter/nexus9000/sw/93x/power-over-ethernet/configuration/configuring-power-over-ethernet/m-configuring-power-over-ethernet.html
> > 
> > switch(config)# interface ethernet1/1   <---- per interface
> > switch(config-if)# power inline auto
> 
> I don't see any mention of a domain in these docs.
> This patchset is creating a concept of "domain" but does 
> not expose it as an object.

Ok, I see. @Köry, can you please provide regulator_summary with some
inlined comments to regulators related to the PSE components and PSE
related outputs of ethtool (or what ever tool you are using).

I wont to use this examples to answer.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

