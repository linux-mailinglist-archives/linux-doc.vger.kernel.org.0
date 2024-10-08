Return-Path: <linux-doc+bounces-26787-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA770995282
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 16:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17C7E1C2533D
	for <lists+linux-doc@lfdr.de>; Tue,  8 Oct 2024 14:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7B01E04B7;
	Tue,  8 Oct 2024 14:54:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7911E0497
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728399258; cv=none; b=cBL8zfgEURh+B5zkw+V4poHdqFd4mcj/nDL5sXvD1hdyjll3xDLH2V81RGguMEEyXnSS8XQFGmj4PdAOy/ukUHYMmBwy/b9u3kz7V7VGPNIFVQSWm2ZyrFe52/+duXYhyyTOEtuFT4WsNhPGjinR3slD0qt+UJTgb1pJLQ3GWb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728399258; c=relaxed/simple;
	bh=rxMQfeehLdt2xkvh6dUxYyoIor1byeZvAt5ilMZZD+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/+S545/Y3gf3V57VI8toRW2ve1uAM/SxInT+N7AZxWCQac4XHHQg6M1qJB2cEgKU2vq72ztcGW9KmSgxRfW8m3gWkrVljDCS5xBG2WQEH3iFOcAC93J+4Q4GRouHCGtpVZjFeTCg0qXbhuNfykRdWcqDf0b6CpK/Op6EXk+ek4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1syBb6-00025u-Tz; Tue, 08 Oct 2024 16:54:00 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1syBb5-000O8u-Gt; Tue, 08 Oct 2024 16:53:59 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1syBb5-000QW1-1L;
	Tue, 08 Oct 2024 16:53:59 +0200
Date: Tue, 8 Oct 2024 16:53:59 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de
Subject: Re: [PATCH net-next 08/12] net: pse-pd: pd692x0: Add support for PSE
 PI priority feature
Message-ID: <ZwVHhxd5KLD5GXh2@pengutronix.de>
References: <20241002-feature_poe_port_prio-v1-0-787054f74ed5@bootlin.com>
 <20241002-feature_poe_port_prio-v1-8-787054f74ed5@bootlin.com>
 <1e9cdab6-f15e-4569-9c71-eb540e94b2fe@lunn.ch>
 <ZwU6QuGSbWF36hhF@pengutronix.de>
 <20241008162120.18aa0a6c@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241008162120.18aa0a6c@kmaincent-XPS-13-7390>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Tue, Oct 08, 2024 at 04:21:20PM +0200, Kory Maincent wrote:
> On Tue, 8 Oct 2024 15:57:22 +0200
> Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> 
> > On Thu, Oct 03, 2024 at 01:41:02AM +0200, Andrew Lunn wrote:
> > > > +	msg = pd692x0_msg_template_list[PD692X0_MSG_SET_PORT_PARAM];
> > > > +	msg.sub[2] = id;
> > > > +	/* Controller priority from 1 to 3 */
> > > > +	msg.data[4] = prio + 1;  
> > > 
> > > Does 0 have a meaning? It just seems an odd design if it does not.  
> > 
> > 0 is not documented. But there are sub-priority which are not directly
> > configured by user, but affect the system behavior.
> > 
> > Priority#: Critical – 1; high – 2; low – 3
> >  For ports with the same priority, the PoE Controller sets the
> >  sub-priority according to the logic port number. (Lower number gets
> >  higher priority).
> > 
> > Port priority affects:
> > 1. Power-up order: After a reset, the ports are powered up according to
> >  their priority, highest to lowest, highest priority will power up first.
> > 2. Shutdown order: When exceeding the power budget, lowest priority
> >  ports will turn off first.
> > 
> > Should we return sub priorities on the prio get request?
> > 
> > If i see it correctly, even if user do not actively configures priorities,
> > they are always present. For example port 0 will have always a Prio
> > higher than Port 10.
> 
> We could add a subprio ehtool attribute, but it won't be configurable.
> In fact it could be configurable by changing the port matrix order but it is not
> a good idea. Applying a new port matrix turn off all the ports.
> 
> I am not sure if it is specific to Microchip controller or if it is generic
> enough to add the attribute.
> I would say not to return it for now.

The generic attribute do not reflect the behavior of two different
controllers. Currently implemented prio attribute is in this case TI
specific and do not work for Microchip case.

Please note, I do not care about configurability in this case, I only
care about information the user get.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

