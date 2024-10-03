Return-Path: <linux-doc+bounces-26383-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A985E98E77C
	for <lists+linux-doc@lfdr.de>; Thu,  3 Oct 2024 02:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49FC2281323
	for <lists+linux-doc@lfdr.de>; Thu,  3 Oct 2024 00:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BE21FDD;
	Thu,  3 Oct 2024 00:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TgcaeRYq"
X-Original-To: linux-doc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30B9139D;
	Thu,  3 Oct 2024 00:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727913754; cv=none; b=qwB2mCP2WkaGKvNIs11JuhFG6HOvnMA9x9NKAMIqxxT5+UCAwKQFnj9beJL6cDou4xKDgCwbqwr3cAjeqDJgwhk2/kO6Jxw+ZvKQqf9D9TSB1WUuTsLyivDCz4va2ylqcYgdZcCdJ0b9cfYAC1AAEh5qZhW6MarVKVui6usAZ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727913754; c=relaxed/simple;
	bh=qBTjVNuGAf1M5m5V9Cmqu7qfVR8QH38+8l40DBYaQbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COer7YpC8YMM5Tzrf5BsID3CpSZjXF3ZuUgDjCotuvWmuSnDdVh89rbz57/el0+1bGcnpZNRNTMruG9QPHURmGqo2jhim0vlPCJubum8I/j8+XfXmIVT/H2adXQRfwGqcuSrBkN13AZ7XN3cGIcwgCNeBDYiOCvKOTzcGb1F+NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=TgcaeRYq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YTXwMsJTLTQ+rbU6hE/qQ+zzO7kOrfrluwkW+Pb0xNE=; b=TgcaeRYq5kxnzUm1A/3ghwVveG
	zdaELrTzNkAE4vxPqLSzFPrmmgu9VRcza9fLke/i/vlGWNdw4uHB7waQpA3OxndleVoM+KzsI/UeS
	ShHEUausss1Gae4K1NkH+usncB0hZhg8+pf8qqMfVW5/NerZjarb1hdPrdj0eg3E+6nk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sw9IV-008uJN-BD; Thu, 03 Oct 2024 02:02:23 +0200
Date: Thu, 3 Oct 2024 02:02:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de
Subject: Re: [PATCH net-next 11/12] net: pse-pd: Add support for event
 reporting using devm_regulator_irq_helper
Message-ID: <89c56982-690d-4279-af26-ca911251d16f@lunn.ch>
References: <20241002-feature_poe_port_prio-v1-0-787054f74ed5@bootlin.com>
 <20241002-feature_poe_port_prio-v1-11-787054f74ed5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-feature_poe_port_prio-v1-11-787054f74ed5@bootlin.com>

On Wed, Oct 02, 2024 at 06:28:07PM +0200, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> Add support for devm_pse_irq_helper(), a wrapper for
> devm_regulator_irq_helper(). This aims to report events such as
> over-current or over-temperature conditions similarly to how the regulator
> API handles them. Additionally, this patch introduces several define
> wrappers to keep regulator naming conventions out of PSE drivers.

I'm missing something here, i think.

https://docs.kernel.org/power/regulator/consumer.html#regulator-events

Suggests these are internal events, using a notification chain. How
does user space get to know about such events?

	Andrew

