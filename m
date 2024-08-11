Return-Path: <linux-doc+bounces-22608-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAFE94E1ED
	for <lists+linux-doc@lfdr.de>; Sun, 11 Aug 2024 17:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4531C20DC8
	for <lists+linux-doc@lfdr.de>; Sun, 11 Aug 2024 15:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F1714B949;
	Sun, 11 Aug 2024 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lqhH2yS+"
X-Original-To: linux-doc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9C722615;
	Sun, 11 Aug 2024 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723390780; cv=none; b=KI9LvC9Py1MSl2NhAHzlAOoPfxBiGaMAC7E9tYa4zrejuEEIIbg+hIB1NiGiC8tuRyBqb9b0I07Y13CjoRwWagH41Q2y5YqDmrlcplJGmX26jaHw5PHiBqpE6puBfpoeJ//iSyU96N3vir0qMjOMxTg6SE7TeL0UVkWmdZukW7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723390780; c=relaxed/simple;
	bh=jGylAQh+xoaNmDSNK5N0fZAtKMGjeOI63ZspzNLi/vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFVJPHVLPqMwjCw5qLbmbowrcC0ceQE5bZM8luKsHZ3MeZQCVjXo+BMrJA7Wm4249nIgUATR7/oGsMyQhGpz4R8BgpiN4b8JqVapohuQY7/E0Zi8G6J4BhNXRWK4Mx5k1T8kPrIF//cKeoPJ8w7rzYCOzMXClrujAR095dszhYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lqhH2yS+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=clz2OS/C9oDAjLDEeArQx9DmNgYsUMobIMcSE1TXVTU=; b=lqhH2yS+UKcTsZyyAOdoRve4P7
	I0H5Bid7ERgVlXCGb7O5ZvtWrhZtI1vBH8xqNDKzzT7U9qIVV84Yz1OT/kNLJHHnegJkrir5Vf3/q
	hK42JNpAzC5XVGm/03qgGYqckNu8g54g7xFwcNjyShiNioaU4hlErmF9EB/zbxN9oG0M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sdAfI-004VQc-G7; Sun, 11 Aug 2024 17:39:28 +0200
Date: Sun, 11 Aug 2024 17:39:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, saeedm@nvidia.com,
	anthony.l.nguyen@intel.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, horatiu.vultur@microchip.com,
	ruanjinjie@huawei.com, steen.hegelund@microchip.com,
	vladimir.oltean@nxp.com, masahiroy@kernel.org,
	alexanderduyck@fb.com, krzk+dt@kernel.org, robh@kernel.org,
	rdunlap@infradead.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
	UNGLinuxDriver@microchip.com, Thorsten.Kummermehr@microchip.com,
	Pier.Beruto@onsemi.com, Selvamani.Rajagopal@onsemi.com,
	Nicolas.Ferre@microchip.com, benjamin.bigler@bernformulastudent.ch,
	linux@bigler.io
Subject: Re: [PATCH net-next v5 04/14] net: ethernet: oa_tc6: implement
 software reset
Message-ID: <46352f42-b099-4c50-a5ef-9248ed021b0a@lunn.ch>
References: <20240730040906.53779-1-Parthiban.Veerasooran@microchip.com>
 <20240730040906.53779-5-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730040906.53779-5-Parthiban.Veerasooran@microchip.com>

On Tue, Jul 30, 2024 at 09:38:56AM +0530, Parthiban Veerasooran wrote:
> Reset complete bit is set when the MAC-PHY reset completes and ready for
> configuration. Additionally reset complete bit in the STS0 register has
> to be written by one upon reset complete to clear the interrupt.
> 
> Signed-off-by: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

