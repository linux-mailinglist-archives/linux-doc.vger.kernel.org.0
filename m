Return-Path: <linux-doc+bounces-29351-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 838169B7482
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 07:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87634B2308A
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 06:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73D4DDC1;
	Thu, 31 Oct 2024 06:28:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C882146D78
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356097; cv=none; b=pn7T8uWtvuXoxUmVCjgRM56P9nJMrRkBqQXaI/ltNEx5PDHmFscqdCQze4qtf7OPLQGNhqP3eflt5+D0ekLkHqkofEXQv3Ux9Rcqp2P5aveV/30HLGj6fV2xhLWOHHdSe6VjYhrLAbcBoo+5zUjkg5ar/AVYKs9ji+pnyBwYFq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356097; c=relaxed/simple;
	bh=wkX0knes67D1sQ81nk6Wm0WE8+LMS8rVH+c/FHWtHRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAgymb6WDgPaK/OCiP/ibfVpjnOwKLCZcuZfwioQMAFJ/96Ztx9kJtYsFNv1JsEIpkoPOz/fsqfH3fb4bS3XunCbp/PmDfYH0cADmyvbPBGZp3eBSj6g5F3mZ6vVNXIBIJGyUgWzfCidrNVUaM2PKEEAK2A25MDSNe4+rmsqwTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1t6Of2-0003tQ-9r; Thu, 31 Oct 2024 07:28:00 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1t6Of1-001JgC-1p;
	Thu, 31 Oct 2024 07:27:59 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1t6Of1-0069Yn-1R;
	Thu, 31 Oct 2024 07:27:59 +0100
Date: Thu, 31 Oct 2024 07:27:59 +0100
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
Subject: Re: [PATCH RFC net-next v2 05/18] net: pse-pd: Add support for PSE
 device index
Message-ID: <ZyMjbzK7SJq5nmYz@pengutronix.de>
References: <20241030-feature_poe_port_prio-v2-0-9559622ee47a@bootlin.com>
 <20241030-feature_poe_port_prio-v2-5-9559622ee47a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030-feature_poe_port_prio-v2-5-9559622ee47a@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Wed, Oct 30, 2024 at 05:53:07PM +0100, Kory Maincent wrote:

...
>  /**
>   * struct pse_control - a PSE control
> @@ -440,18 +441,22 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
>  
>  	mutex_init(&pcdev->lock);
>  	INIT_LIST_HEAD(&pcdev->pse_control_head);
> +	ret = ida_alloc_max(&pse_ida, INT_MAX, GFP_KERNEL);

s/INT_MAX/U32_MAX

...
>  struct pse_control_status {
> +	u32 pse_id;
>  	enum ethtool_podl_pse_admin_state podl_admin_state;
...
>  struct pse_controller_dev {
>  	const struct pse_controller_ops *ops;
> @@ -163,6 +166,7 @@ struct pse_controller_dev {
>  	enum ethtool_pse_types types;
>  	struct pse_pi *pi;
>  	bool no_of_pse_pi;
> +	int id;

        u32 id

It would be better to have one type for all variables.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

