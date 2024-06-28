Return-Path: <linux-doc+bounces-19727-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A469D91BA74
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jun 2024 10:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57E21C20315
	for <lists+linux-doc@lfdr.de>; Fri, 28 Jun 2024 08:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6FA14E2F4;
	Fri, 28 Jun 2024 08:53:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F9714D2AB
	for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719564830; cv=none; b=ZkZaDYaWHTLFiZGRY+GSzm5QYKtxvK4unyAK3Zw7bEiV9hZkKcCA3f3S1caEBFL8JVqLaqnbhakpVXg7uw6i3m2Jl3gh71nA5jrjAWkh09qgTVxy7v07S1/I2rj3xEl+jgYRKvK7e1cjz80xkr/yikFwR7UvHIyCKiAcAOi4cFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719564830; c=relaxed/simple;
	bh=OIT17qLKWGJWizrdyplsr8lba2jbjmLexGyFkIyw9L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tH18rKBS90iYwq6cQkpWbwbIfLQo2Wu5844OMZ3za1BNl49Cn4D47xszlpd+GNB3blobke73ahBL4CU7O/WyxYMHwvNXiMDPKT0VgWyiUeDKpnyWh2L117fKx7fcfSSr0+977zhbs90peOmecRtSRBF9ldQFEPAXzGXpoxpkIk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sN7MO-000220-SY; Fri, 28 Jun 2024 10:53:36 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sN7MN-005Z8k-5m; Fri, 28 Jun 2024 10:53:35 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sN7MN-002PCC-0F;
	Fri, 28 Jun 2024 10:53:35 +0200
Date: Fri, 28 Jun 2024 10:53:35 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de, linux-doc@vger.kernel.org,
	Sai Krishna <saikrishnag@marvell.com>
Subject: Re: [PATCH net-next v5 4/7] net: pse-pd: Add new power limit get and
 set c33 features
Message-ID: <Zn56D_6QYqHH-ziO@pengutronix.de>
References: <20240628-feature_poe_power_cap-v5-0-5e1375d3817a@bootlin.com>
 <20240628-feature_poe_power_cap-v5-4-5e1375d3817a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240628-feature_poe_power_cap-v5-4-5e1375d3817a@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Fri, Jun 28, 2024 at 10:31:57AM +0200, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> This patch add a way to get and set the power limit of a PSE PI.
> For that it uses regulator API callbacks wrapper like get_voltage() and
> get/set_current_limit() as power is simply V * I.
> We used mW unit as defined by the IEEE 802.3-2022 standards.
> 
> set_current_limit() uses the voltage return by get_voltage() and the
> desired power limit to calculate the current limit. get_voltage() callback
> is then mandatory to set the power limit.
> 
> get_current_limit() callback is by default looking at a driver callback
> and fallback to extracting the current limit from _pse_ethtool_get_status()
> if the driver does not set its callback. We prefer let the user the choice
> because ethtool_get_status return much more information than the current
> limit.
> 
> expand pse status with c33_pw_limit_ranges to return the ranges available
> to configure the power limit.
> 
> Reviewed-by: Sai Krishna <saikrishnag@marvell.com>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

