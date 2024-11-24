Return-Path: <linux-doc+bounces-31518-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B79D6D58
	for <lists+linux-doc@lfdr.de>; Sun, 24 Nov 2024 10:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E445161A31
	for <lists+linux-doc@lfdr.de>; Sun, 24 Nov 2024 09:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24593188A0E;
	Sun, 24 Nov 2024 09:49:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51611714CF
	for <linux-doc@vger.kernel.org>; Sun, 24 Nov 2024 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732441789; cv=none; b=Y+G6RCWuKTMBVvZxYoS9oOybuAwizXKBWHTkZk3eGvGUpfGbTuE/y8nSV+lam8MKaJzbm0zwpfTHa2nXtIehLBVRoBBGJ0flrokLaXcPReDtXx8a5tNA+NN7nvXBTj4ImYwKY17i7D9YIw9k3I1QDehag9xZC+j356TsRgt8AGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732441789; c=relaxed/simple;
	bh=VQjlZzpEPLSHhJ+LVVkeqa2lj7Tm8/9zXD5QsVtxOEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHVZuZvgu7n1G0NPR9RjlZgBslgG6ohkgpwK7bIyDNiLsm86X5sDV3BWJmexRbBgWCZd4SRoHk6Hqq+df7g5z3GhFdVPGhs7NKB3LMzushrx5MZ1vjUY24reZacv2vP68ek/0lHTiEpdswJVqCAGKOgNnocaLN15FjSqFiq6yHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tF9FD-0005zL-Kf; Sun, 24 Nov 2024 10:49:31 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tF9FD-002ND9-0Y;
	Sun, 24 Nov 2024 10:49:31 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tF9FD-00CgUp-09;
	Sun, 24 Nov 2024 10:49:31 +0100
Date: Sun, 24 Nov 2024 10:49:31 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH RFC net-next v3 18/27] net: pse-pd: Fix missing PI
 of_node description
Message-ID: <Z0L2q-pUYufcOKra@pengutronix.de>
References: <20241121-feature_poe_port_prio-v3-0-83299fa6967c@bootlin.com>
 <20241121-feature_poe_port_prio-v3-18-83299fa6967c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121-feature_poe_port_prio-v3-18-83299fa6967c@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Thu, Nov 21, 2024 at 03:42:44PM +0100, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> The PI of_node was not assigned in the regulator_config structure, leading
> to failures in resolving the correct supply when different power supplies
> are assigned to multiple PIs of a PSE controller. This fix ensures that the
> of_node is properly set in the regulator_config, allowing accurate supply
> resolution for each PI.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

> ---
> 
> Changes in v3:
> - New patch
> ---
>  drivers/net/pse-pd/pse_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> index 8b5a9e7fd9c5..d4cf5523194d 100644
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c
> @@ -419,6 +419,7 @@ devm_pse_pi_regulator_register(struct pse_controller_dev *pcdev,
>  	rconfig.dev = pcdev->dev;
>  	rconfig.driver_data = pcdev;
>  	rconfig.init_data = rinit_data;
> +	rconfig.of_node = pcdev->pi[id].np;
>  
>  	rdev = devm_regulator_register(pcdev->dev, rdesc, &rconfig);
>  	if (IS_ERR(rdev)) {
> 
> -- 
> 2.34.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

