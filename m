Return-Path: <linux-doc+bounces-2709-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C77F1CEF
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 19:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259601C2180A
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 18:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FB21F19B;
	Mon, 20 Nov 2023 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNbB3zQe"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF7328C9;
	Mon, 20 Nov 2023 18:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D3EC433C8;
	Mon, 20 Nov 2023 18:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700506310;
	bh=W2rRlTlnaz7y/dAe1I9YW0SDSX4YDJ+JQ3JUeJOiE0w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rNbB3zQeaasobMgO2bQs8/WPmiPXJbIDkO1FZ0gDFmszp9kZh9fbi93mFAZk5KlBd
	 aQ/HZB1Wvnbt+upxuRvZIOsq8nMjK2X2djatxv59SNRwN0GZhzsPHrwnm9Fz+Z21v+
	 5sB9bLtKXVL5JM10/YqtRfJH0rXWG2td1ME7SSqFfGLJ30Uc5o2I9DEowX8gvYXuHL
	 PsT0QQvjlMIR78QjEmfipugjDOnyepK7FbfOEuEIfKEIQ/WgBXWBHPWtE1g/bcSgYd
	 wIaDWgZxt1nw3dGOyO8be3NpJWV8nsMSt5HYtzpk0/q57sQba9DWI6UlWYrJs8xbKU
	 DkJx+TKPlcsLg==
Date: Mon, 20 Nov 2023 10:51:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, Radu
 Pirea <radu-nicolae.pirea@oss.nxp.com>, Jay Vosburgh
 <j.vosburgh@gmail.com>, Andy Gospodarek <andy@greyhouse.net>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Horatiu Vultur <horatiu.vultur@microchip.com>,
 UNGLinuxDriver@microchip.com, Simon Horman <horms@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v7 15/16] net: ethtool: ts: Let the active time
 stamping layer be selectable
Message-ID: <20231120105148.064dc4bd@kernel.org>
In-Reply-To: <157c68b0-687e-4333-9d59-fad3f5032345@lunn.ch>
References: <20231114-feature_ptp_netnext-v7-0-472e77951e40@bootlin.com>
	<20231114-feature_ptp_netnext-v7-15-472e77951e40@bootlin.com>
	<20231118183433.30ca1d1a@kernel.org>
	<20231120104439.15bfdd09@kmaincent-XPS-13-7390>
	<20231120105255.cgbart5amkg4efaz@skbuf>
	<20231120121440.3274d44c@kmaincent-XPS-13-7390>
	<20231120120601.ondrhbkqpnaozl2q@skbuf>
	<20231120144929.3375317e@kmaincent-XPS-13-7390>
	<20231120142316.d2emoaqeej2pg4s3@skbuf>
	<20231120093723.4d88fb2a@kernel.org>
	<157c68b0-687e-4333-9d59-fad3f5032345@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Nov 2023 19:39:35 +0100 Andrew Lunn wrote:
> > What about my use case of having a NIC which can stamp at a low rate
> > at the PHY (for PTP) and high rate at the DMA block (for congestion
> > control)? Both stamp points have the same PHC index.  
> 
> How theoretical is that? To me, it seems more likely you have two PHC.

Very practical. mlx5 does this today, based on guessing and private
ethtool flags.

> The PHY stamping tends to be slow because of the MDIO bus. If the MAC
> has fast access to the PHC, it means its not on the MDIO bus. It
> probably means you have the PHY integrated into the MAC/SoC, so the
> MAC can access it. But if its integrated like this, i don't see why
> PHY stamping should be particularly slow. So you can probably use it
> for congestion control. And then you don't need DMA stamping.

Tx stamps are harder to carry back to the host all the way from the PHY
than from the DMA block when DMA completion is signaled. Rx stamps seem
much easier to carry down the pipeline but apparently some vendors are
incapable of doing that as well.

> Do you know of real hardware with a MAC and a PHY sharing a PHC?

mlx5 for sure, but other designs, too. PHY, NIC pipeline and PCIe PTM
may all need to time stamp from a single time counter.

