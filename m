Return-Path: <linux-doc+bounces-29488-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BF9B84FF
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 22:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79BE0283366
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 21:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654A61CBE86;
	Thu, 31 Oct 2024 21:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="B2LUiHxs"
X-Original-To: linux-doc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD41C2DA4;
	Thu, 31 Oct 2024 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730409097; cv=none; b=IlwodQ0aMilOa+/lITvvBk+KUXyQxz1uqDm2vckk8YMgcmyiOW3Jno4H5Mg4NOlDdTU0t3hgc7vYd8XZpz/OiUFNr663hSjPlJSLmhwVf5IdpJZZZRGim24KrxyeI6xJn31lEDbOyt1FRHrKE4grdkoYGTSBGBCRFe0nHxWYwJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730409097; c=relaxed/simple;
	bh=zJycXNzwaNgn4ci0EBST+oGnYoZHWasgXjEBU4OI52U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXaGJphmMeAttyS+QRrXBdIoPz6D5fRjJx7f+oydpmuuxSVDgiw6jmlP4gFwqwrv1pEAhlh5PeTGm9VqNU5w9NW3+VJ4c3g/g8ne7f0LAwxMG+nOrZbKljHF3UYueE1fS0dGkw7lqz5v63ut+rX1xFBTj2MJs4q/jac0bIjX5xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=B2LUiHxs; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YCTs6BqS9ZgBaULSmac4Uouh4bUhMEp9TLAj0m9+Ols=; b=B2LUiHxsZ25aru8BQuH2hExiJN
	YfqxN2Eyx9ZT12xG0bY8PpP05aEdiIx7ZAcRlNRUQ3Be0Mcmbf1Rx73lacVU4hIHsrePB0GCtp7MV
	XgRAWTlVkC3d4mlT6drBC/n+P/1aR8UwMZa7ir0J2HoqinO9PT4AM9pI9j6E6L5xMLvU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6cRq-00BotB-Pk; Thu, 31 Oct 2024 22:11:18 +0100
Date: Thu, 31 Oct 2024 22:11:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: Re: [PATCH RFC net-next v2 03/18] net: pse-pd: tps23881: Use helpers
 to calculate bit offset for a channel
Message-ID: <0e9ecb5a-3a6a-4b99-8177-1532134e3e25@lunn.ch>
References: <20241030-feature_poe_port_prio-v2-0-9559622ee47a@bootlin.com>
 <20241030-feature_poe_port_prio-v2-3-9559622ee47a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-feature_poe_port_prio-v2-3-9559622ee47a@bootlin.com>

> +	val = tps23881_set_val(ret, chan, 0, BIT(chan % 4), BIT(chan % 4));
> +		val = tps23881_set_val(val, chan, 0, BIT(chan % 4),
> +				       BIT(chan % 4));
> +	val = tps23881_set_val(ret, chan, 4, BIT(chan % 4), BIT(chan % 4));
> +		val = tps23881_set_val(val, chan, 4, BIT(chan % 4),
> +				       BIT(chan % 4));
> +	val = tps23881_calc_val(ret, chan, 0, BIT(chan % 4));
> +		val = tps23881_calc_val(ret, chan, 0, BIT(chan % 4));
> +	val = tps23881_calc_val(ret, chan, 0, BIT(chan % 4));
> +	val = tps23881_calc_val(ret, chan, 4, BIT(chan % 4));
> +		val = tps23881_calc_val(ret, chan, 0, BIT(chan % 4));
> +		val = tps23881_calc_val(ret, chan, 4, BIT(chan % 4));

It looks like all the callers of this helper pass BIT(chan % 4) as the
last parameter. Maybe move that into the helper as well?

     Andrew

