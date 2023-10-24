Return-Path: <linux-doc+bounces-883-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D017D44DC
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 03:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20BBE2816E8
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 01:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403D64C9F;
	Tue, 24 Oct 2023 01:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="WhrMcqki"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C14C95;
	Tue, 24 Oct 2023 01:21:56 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C02A1;
	Mon, 23 Oct 2023 18:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/mxaGSoPqeLocNbWM0UIjtQyP7Jcw0WVkrfpjAnYCEc=; b=WhrMcqkit0ioIhUJLTHut3/hRz
	M5gNRNqLNpl4AFYQ+JehQ8a/Q+dkxGbyN/CMIJwrb783JS3QD0Fc8pC6T4YZdpgtqxqj2abrWxhZ4
	Zop9caypRs5ZqCigs0P2fiMtU/dlgPmJO1ZsTEijrhIIljJsFPjAuhcCbrg6I1XmzGqw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qv676-0001pP-Pz; Tue, 24 Oct 2023 03:21:44 +0200
Date: Tue, 24 Oct 2023 03:21:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net, steen.hegelund@microchip.com, rdunlap@infradead.org,
	horms@kernel.org, casper.casan@gmail.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, horatiu.vultur@microchip.com,
	Woojung.Huh@microchip.com, Nicolas.Ferre@microchip.com,
	UNGLinuxDriver@microchip.com, Thorsten.Kummermehr@microchip.com
Subject: Re: [PATCH net-next v2 6/9] dt-bindings: net: oa-tc6: add PHY
 register access capability
Message-ID: <3d4b86a5-6a92-4456-a270-9091bdf8157e@lunn.ch>
References: <20231023154649.45931-1-Parthiban.Veerasooran@microchip.com>
 <20231023154649.45931-7-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023154649.45931-7-Parthiban.Veerasooran@microchip.com>

On Mon, Oct 23, 2023 at 09:16:46PM +0530, Parthiban Veerasooran wrote:
> Direct PHY Register Access Capability indicates if PHY registers are
> directly accessible within the SPI register memory space. Indirect PHY
> Register Access Capability indicates if PHY registers are indirectly
> accessible through the MDIO/MDC registers MDIOACCn.
> 
> Signed-off-by: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>

It is more normal to put all the bindings into one patch.

Again, this seems like configuration, not a description of the
hardware. Its also not clear to my why you would want to configure it.

	Andrew

