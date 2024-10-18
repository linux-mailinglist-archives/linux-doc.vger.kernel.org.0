Return-Path: <linux-doc+bounces-27919-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 011549A3531
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2024 08:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69E8BB21A41
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2024 06:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E120185B4F;
	Fri, 18 Oct 2024 06:14:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FB4183CA9
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729232095; cv=none; b=E5PniAVL4s+0aszgDAYeUhE8uCusBCJp0GGK97c9gzqVYzmKhrfLhm31LwTJWyZdejiQDmlbJzdjjUMHd/QJrKKZTngHENKbNDhlSN+B2FzuyZ+X/XqNCU7dBCogAjshdcceyqqQ7v9/8ufiDmTaSuqrzBY8GFQUP2L87FTTBNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729232095; c=relaxed/simple;
	bh=9sB+hOdhj82qCDJfHMEkoHIdT0pUQsqSjbUGrwCNRcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHX21bjMmn3bWdHvsD/QAs8bKuHJExboAxF4BRXhv/CAEfUz37xfECOljvYj2xaW3FTegf5rX0hboDnVxWJHt+Ww4j/hEfBbQqKKOKhBJgmt4ELhsEx9OjfHyJG824p2+0fJZxKzkOA+Vhk/O/vdbPhk0o3MimtgilJn+//eSPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1t1gFp-0004Lf-6W; Fri, 18 Oct 2024 08:14:29 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1t1gFm-000AJq-2z;
	Fri, 18 Oct 2024 08:14:26 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1t1gFm-000NlK-2f;
	Fri, 18 Oct 2024 08:14:26 +0200
Date: Fri, 18 Oct 2024 08:14:26 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kyle Swenson <kyle.swenson@est.tech>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Dent Project <dentproject@linuxfoundation.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH net-next 00/12] Add support for PSE port priority
Message-ID: <ZxH8wpm_kptHBFQG@pengutronix.de>
References: <20241002-feature_poe_port_prio-v1-0-787054f74ed5@bootlin.com>
 <ZwaLDW6sKcytVhYX@p620.local.tld>
 <20241009170400.3988b2ac@kmaincent-XPS-13-7390>
 <ZwbAYyciOcjt7q3e@est-xps15>
 <ZwdpQRRGst1Z0eQE@pengutronix.de>
 <20241015114352.2034b84a@kmaincent-XPS-13-7390>
 <20241017123557.68189d5b@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241017123557.68189d5b@kmaincent-XPS-13-7390>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Thu, Oct 17, 2024 at 12:35:57PM +0200, Kory Maincent wrote:
> On Tue, 15 Oct 2024 11:43:52 +0200
> Kory Maincent <kory.maincent@bootlin.com> wrote:
> 
> > > Policy Variants and Implementation
> > > 
> > > In cases where we are discussing prioritization, we are fundamentally
> > > talking about over-provisioning. This typically means that while a device
> > > advertises a certain maximum per-port power capacity (e.g., 95W), the total
> > > system power budget (e.g., 300W) is insufficient to supply maximum power to
> > > all ports simultaneously. This is often due to various system limitations,
> > > and if there were no power limits, prioritization wouldn't be necessary.
> > > 
> > > The challenge then becomes how to squeeze more Powered Devices (PDs) onto
> > > one PSE system. Here are two methods for over-provisioning:
> > > 
> > > 1. Static Method:
> > >  
> > >    This method involves distributing power based on PD classification. It’s
> > >    straightforward and stable, with the software (probably within the PSE
> > >    framework) keeping track of the budget and subtracting the power
> > > requested by each PD’s class. 
> > >  
> > >    Advantages: Every PD gets its promised power at any time, which
> > > guarantees reliability. 
> > > 
> > >    Disadvantages: PD classification steps are large, meaning devices request
> > >    much more power than they actually need. As a result, the power supply
> > > may only operate at, say, 50% capacity, which is inefficient and wastes
> > > money.
> > > 
> > > 2. Dynamic Method:  
> > > 
> > >    To address the inefficiencies of the static method, vendors like
> > > Microchip have introduced dynamic power budgeting, as seen in the PD692x0
> > > firmware. This method monitors the current consumption per port and
> > > subtracts it from the available power budget. When the budget is exceeded,
> > > lower-priority ports are shut down.  
> > > 
> > >    Advantages: This method optimizes resource utilization, saving costs.
> > > 
> > >    Disadvantages: Low-priority devices may experience instability. A
> > > possible improvement could involve using LLDP protocols to dynamically
> > > configure power limits per port, thus allowing us to reduce power on
> > > over-consuming ports rather than shutting them down entirely.  
> > 
> > Indeed we will have only static method for PSE controllers not supporting
> > system power budget management like the TPS2388x or LTC426.
> > Both method could be supported for "smart" PSE controller like PD692x0.
> > 
> > Let's begin with the static method implementation in the PSE framework for
> > now. It will need the power domain notion you have talked about.
> 
> While developing the software support for port priority in static method, I
> faced an issue.
> 
> Supposing we are exceeding the power budget when we plug a new PD.
> The port power should not be enabled directly or magic smoke will appear.
> So we have to separate the detection part to know the needs of the PD from the
> power enable part.
> 
> Currently the port power is enabled on the hardware automatically after the
> detection process. There is no way to separate power port process and detection
> process with the PD692x0 controller and it could be done on the TPS23881 by
> configuring it to manual mode but: "The use of this mode is intended for system
> diagnostic purposes only in the event that ports cannot be powered in
> accordance with the IEEE 802.3bt standard from semiauto or auto modes."
> Not sure we want that.
> 
> So in fact the workaround you talked about above will be needed for the two PSE
> controllers.

For the TPS23881, "9.1.1.2 Semiauto", seems to be exactly what we wont:
"The port performs detection and classification (if valid detection
occurs) continuously. Registers are updated each time a detection or
classification occurs. The port power is not automatically turned on. A
Power Enable command is required to turn on the port"

For PD692x0 controller, i'm not 100% sure. There is "4.3.5 Set Enable/Disable
Channels" command, "Sets individual port Enable (Delivering power
enable) or Disable (Delivering power disable)." 

For my understanding, "Delivering power" is the state after
classification. So, it is what we wont too.

If, it works in both cases, it would be a more elegant way to go. THe
controller do auto- detection and classification, what we should do in
the software is do decide if the PD can be enabled based on
classification results, priority and available budget.

> > Both methods have their pros and cons. Since the dynamic method is not always
> > desirable, and if there's no way to disable it in the PD692x0's firmware, one
> > potential workaround could be handling the budget in software and dynamically
> > setting per-port limits. For instance, with a total budget of 300W and unused
> > ports, we could initially set 95W limits per port. As high-priority PDs (e.g.,
> > three 95W devices) are powered, we could dynamically reduce the power limit on
> > the remaining ports to 15W, ensuring that no device exceeds that
> > classification threshold.
> 
> We would set port overcurrent limit for all unpowered ports when the power
> budget available is less than max PI power 100W as you described.
> If a new PD plugged exceed the overcurrent limit then it will raise an interrupt
> and we could deal with the power budget to turn off low priority ports at that
> time. 

> Mmh in fact I could not know if the overcurrent event interrupt comes from a
> newly plugged PD or not.

Hm..  in case of PD692x0, may be using event counters?

> An option: When we get new PD device plug interrupt event, we wait the end of
> classification time (Tpon 400ms) and read the interrupt states again to know if
> there is an overcurrent or not on the port.

Let's try Semiauto mode for TPS23881 first, I assume it is designed
exactly for this use case.

And then, test if PD692x0 supports a way to disable auto power delivery
in the 4.3.5 command.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

