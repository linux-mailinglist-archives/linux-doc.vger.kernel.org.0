Return-Path: <linux-doc+bounces-213-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 026567C8C8D
	for <lists+linux-doc@lfdr.de>; Fri, 13 Oct 2023 19:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326F61C20B05
	for <lists+linux-doc@lfdr.de>; Fri, 13 Oct 2023 17:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EFD18E16;
	Fri, 13 Oct 2023 17:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4wUI0Iz"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20868EC6;
	Fri, 13 Oct 2023 17:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DDFC433C9;
	Fri, 13 Oct 2023 17:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697219168;
	bh=LnnOZq9IcCexCgRtAyz56/PMKVOuCg7VAzCjooDMXH8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j4wUI0Iz9/RmzVEvQtad7WVexCb03+TqC9xzaQ3JNoXL+VhSRjEFe7yiqD1HUxyW5
	 txuxZ9F3GR08ik6Yt7z1gESAPpXwZ9080tI5Ch1KjdWoZvZQ3lpkcgjocqoM+6OJ3L
	 rufidlqsYGr7RQnIJUBL+6RzxcV3XY9cfOd6KTj2qksXlY90kyd8X0A+/vpf6+T9rL
	 OaWxf/c0BPtMAeioRjxzrDyvFo5Q/ovpCQdupU5IEg8U3iGt2P1fTWKDQm2scvy3ry
	 rRWhQK3NfK9jGCJ2xBFYgqyKtDKRY6dNYiY6//UuLzeYDdUc7M+N7HOY1bGu0ZSqVc
	 mKuFoK0FdG2Hw==
Date: Fri, 13 Oct 2023 10:46:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Jay Vosburgh <j.vosburgh@gmail.com>, Andy
 Gospodarek <andy@greyhouse.net>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 UNGLinuxDriver@microchip.com, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Richard Cochran <richardcochran@gmail.com>, Radu
 Pirea <radu-nicolae.pirea@oss.nxp.com>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Michael Walle <michael@walle.cc>, Jacob
 Keller <jacob.e.keller@intel.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH net-next v5 08/16] net: ethtool: Add a command to expose
 current time stamping layer
Message-ID: <20231013104606.174664a2@kernel.org>
In-Reply-To: <20231013170903.p3ycicebnfrsmoks@skbuf>
References: <20231009155138.86458-1-kory.maincent@bootlin.com>
	<20231009155138.86458-9-kory.maincent@bootlin.com>
	<2fbde275-e60b-473d-8488-8f0aa637c294@broadcom.com>
	<20231010102343.3529e4a7@kmaincent-XPS-13-7390>
	<20231013090020.34e9f125@kernel.org>
	<20231013161446.st7tlemyaj3ggkgk@skbuf>
	<20231013093056.4f915df1@kernel.org>
	<20231013170903.p3ycicebnfrsmoks@skbuf>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Oct 2023 20:09:03 +0300 Vladimir Oltean wrote:
> > > Translation between the UAPI-visible PHC index and MAC, DMA, phylib
> > > PHY, other PHY etc can then be done by the kernel as needed.  
> > 
> > Translation by the kernel at which point?  
> 
> The gist of what I'm proposing is for the core ethtool netlink message
> handler to get just the phc_index as an attribute. No other information
> as to what it represents. Not that it's netdev, DMA, phylib PHY or whatnot.
> 
> The ethtool kernel code would iterate through the stuff registered in
> the system for the netdev, calling get_ts_info() or phy_ts_info() on it,
> until it finds something which populates struct ethtool_ts_info ::
> phc_index with the phc_index retrieved from netlink.
> 
> Then, ethtool just talks with the timestamper that matched that phc_index.
> 
> Same idea would be applied for the command that lists all timestamping
> layers for a netdev. Check get_ts_info(), phy_ts_info(dev->phydev), and
> can be extended in the future.

I see, that could work. The user would then dig around sysfs to figure
out which PHC has what characteristics?

> > IMHO it'd indeed be clearer for the user to have an ability to read 
> > the PHC for SOF_..._DMA via ETHTOOL_MSG_TS_LIST_GET_REPLY as a separate
> > entry, rather than e.g. assume that DMA uses the same PHC as MAC.  
> 
> I'm not really sure what you're referring to, with SOF_..._DMA.
> The DMA, if presented as a PHC as I am proposing, would play the role of
> the hardware timestamp provider (think SOF_TIMESTAMPING_TX_HARDWARE |
> SOF_TIMESTAMPING_RX_HARDWARE), so there will be no driver-visible
> special socket option flags for DMA timestamping.

Each packet may want different timestamp tho, especially on Tx it
should be fairly easy for socket to request to get "real" MAC stamps,
while most get cheaper DMA stamps. Currently some drivers run flow
matching to find PTP packets and automatically give them better quality
timestamps :(

Even if at the config level we use PHCs we need to translate that into
some SKBTX_* bit, don't we?

