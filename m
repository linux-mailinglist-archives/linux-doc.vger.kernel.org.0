Return-Path: <linux-doc+bounces-26368-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A4298E6F2
	for <lists+linux-doc@lfdr.de>; Thu,  3 Oct 2024 01:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C97B1F23838
	for <lists+linux-doc@lfdr.de>; Wed,  2 Oct 2024 23:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C4219884A;
	Wed,  2 Oct 2024 23:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="l3mKKYr9"
X-Original-To: linux-doc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F97199932;
	Wed,  2 Oct 2024 23:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727911895; cv=none; b=ROpfV9Yw4t4U6bgZO2DfHavKqgYHEVkbhBZabi6vvM44iKh+Nu6cuWihO+xBAIyti6vJIDnbdTfUIhbYceAlZ7zPiay6XBDu4v44pFiC6dYgP9pgxTxPB/tzYG1h1N7RwTc2kD8ell0UZWsx/TS0R+nt24CNtyPoMwI0F5bDIo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727911895; c=relaxed/simple;
	bh=MCs85ya70VqJ0Le3htjGx+a0oSMCI7D9xVqax0gvgCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyE5Ln0SUacbzDQ/JcoG8vDM7J5IanCwdMmPeSOU34++5zjnCO5kzdBIYDaVSct/Owi531PrM/cFaYXEGN6TVjrXJuVp/DmVdQi3eIVLDs4Gvn1s0k6P/A36JvJjICqQyV8nlfDQV6JEbPTjEWc7ROL/HnnEzs5PNhgmyepuua0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=l3mKKYr9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=185pzjsKchPJP7i7ntgfzS8VCShByVUzrLY0VCxj7wA=; b=l3mKKYr9UEMqYIvDK4GXvbJneF
	6a0VsptMekx2mQ5+2JOwLlaJxC4ksZN47dkS7fq4F8jWOONMsGhBl1lv0EACW4LiV7ff2Sqi2PNKf
	UpedAgS4jay6zT4fyUGZ2Jb0TtrOFlpeXY8W8kDi5JIqeR5c2llM7zbyeS4BEnLE/yn4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sw8oW-008u7i-GL; Thu, 03 Oct 2024 01:31:24 +0200
Date: Thu, 3 Oct 2024 01:31:24 +0200
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
Subject: Re: [PATCH net-next 04/12] net: pse-pd: tps23881: Add support for
 power limit and measurement features
Message-ID: <6c0c2211-396c-46ac-a8a1-70aa8f3597d7@lunn.ch>
References: <20241002-feature_poe_port_prio-v1-0-787054f74ed5@bootlin.com>
 <20241002-feature_poe_port_prio-v1-4-787054f74ed5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-feature_poe_port_prio-v1-4-787054f74ed5@bootlin.com>

On Wed, Oct 02, 2024 at 06:28:00PM +0200, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> Expand PSE callbacks to support the newly introduced
> pi_get/set_current_limit() and pi_get_voltage() functions. These callbacks
> allow for power limit configuration in the TPS23881 controller.
> 
> Additionally, the patch includes the detected class, the current power
> delivered and the power limit ranges in the status returned, providing more
> comprehensive PoE status reporting.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

