Return-Path: <linux-doc+bounces-13535-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3968996C9
	for <lists+linux-doc@lfdr.de>; Fri,  5 Apr 2024 09:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D82EE1F2150F
	for <lists+linux-doc@lfdr.de>; Fri,  5 Apr 2024 07:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090F913D272;
	Fri,  5 Apr 2024 07:44:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8513D26B
	for <linux-doc@vger.kernel.org>; Fri,  5 Apr 2024 07:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712303072; cv=none; b=P1N1atEtyxwrUXRhCYCNqay73idfIg+tpoNueQWZdsELTC5iTtplfhRNBUqRFHYyRv25l1amx3TpsmlvP01npcEyZmNhGVmEYg23szqn+fOh+JITss4HSGto9Pxr++2gvPVXCTIXT91ihOr67wye/BGWGMEk9sK8DG2CjWfj9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712303072; c=relaxed/simple;
	bh=R03D674QYB5Ga54S94jEHsV8UofXlPVpjBUr5x+5e/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8r+RNZfq6FOByWmDtrx8Xp5y5HiWmfgQyyTGLKOKylagbj6nyr4urin9TsCJcrFaA/0yNh7GqQgfRC5Xk+f6rxWut5k7Vu7k4LVliqBnBZQo05cZmqcoDr/tE2+PjWxmonzhmeEaOGWzA4SxVpNqXFqWHiVzLjBtA88VPHf3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1rseEx-0000sw-KA; Fri, 05 Apr 2024 09:43:59 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1rseEr-00AWqn-SL; Fri, 05 Apr 2024 09:43:53 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1rseEr-00FbmS-2U;
	Fri, 05 Apr 2024 09:43:53 +0200
Date: Fri, 5 Apr 2024 09:43:53 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	Dent Project <dentproject@linuxfoundation.org>
Subject: Re: [PATCH net-next v6 11/17] dt-bindings: net: pse-pd: Add another
 way of describing several PSE PIs
Message-ID: <Zg-ruY_ufPJOyHad@pengutronix.de>
References: <20240326-feature_poe-v6-0-c1011b6ea1cb@bootlin.com>
 <20240326-feature_poe-v6-11-c1011b6ea1cb@bootlin.com>
 <20240402132637.GA3744978-robh@kernel.org>
 <20240403111548.30e780b5@kmaincent-XPS-13-7390>
 <20240403143142.GA3508225-robh@kernel.org>
 <20240404112506.2e155bad@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240404112506.2e155bad@kmaincent-XPS-13-7390>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Thu, Apr 04, 2024 at 11:25:06AM +0200, Kory Maincent wrote:
> On Wed, 3 Apr 2024 09:31:42 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > >   
> > > > > +
> > > > > +          polarity-supported:
> > > > > +            $ref: /schemas/types.yaml#/definitions/string-array
> > > > > +            description:
> > > > > +              Polarity configuration supported by the PSE PI pairsets.
> > > > > +            minItems: 1
> > > > > +            maxItems: 4
> > > > > +            items:
> > > > > +              enum:
> > > > > +                - MDI-X
> > > > > +                - MDI
> > > > > +                - X
> > > > > +                - S
> > > > > +
> > > > > +          vpwr-supply:
> > > > > +            description: Regulator power supply for the PSE PI.    
> > > > 
> > > > I don't see this being used anywhere.  
> > > 
> > > Right, I forgot to add it to the PD692x0 and TPS23881 binding example!  
> > 
> > But is this really common/generic? I would think input power rails would 
> > be chip specific.
> 
> I think as each PSE PI are seen as a regulator we may want it generic to track
> each PI parent. Having the parent regulator described like that would force the
> devicetree to describe where the power come from.
> In contrary, for example, on the pd692x0 controller the regulators are connected
> to the managers (PD69208) and not directly to the PIs. So the devicetree would
> not really fit the hardware. It is indeed chip specific but having described
> like that would be more simple.
> 
> If we decided to make it chip specific the core would have a callback to ask
> the driver to fill the regulator_init_data structure for each PI before
> registering the regulators. It is feasible.
> 
> Mmh in fact I am still unsure about the solution.
> 
> Oleksij as you were the first to push the idea. Have you more argument in mind
> to make it generic?
> https://lore.kernel.org/netdev/ZeObuKHkPN3tiWz_@pengutronix.de/

There can be different, chip specific power consumer, for example the
one which is feeding the PSE controller it self, but also there are common
providers/consumers  those which are used to feed PSE PIs. In case of
pd692x0 based setup, the managers are actual regulator responsible to
control power rails connected to PSE PIs, so managers should use this
common provider. Not sure how TI is designed, but it will have same type
of consumer to feed PSE PIs as well.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

