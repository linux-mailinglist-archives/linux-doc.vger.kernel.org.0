Return-Path: <linux-doc+bounces-3160-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F887F9BFE
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 09:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 679D9280E43
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 08:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372E6DDB8;
	Mon, 27 Nov 2023 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="BhCfOJN+"
X-Original-To: linux-doc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC16183;
	Mon, 27 Nov 2023 00:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WA1izUMF049A+uaOpu99QoR6RRA3zCpzmZ7zrTZEUrY=; b=BhCfOJN+3BuUwuenz7TV/mQ1Jk
	IuNW9a/5L2VfSpwOGLEoxqyXKwrXZbLRR8948VsH+P7OpWq+H1j8fKuKj2PFzuLBpnEOGJWMzf9C4
	g75/PZFBjeFvZl3jxJKvY28sqJ00e+/V1oDrxXFmTRgFyRyaHIcPmsgD9KrCDQaKtirefRSXQwDBG
	sPbmTQ/acpEW+rjrNRiT4VYMcYSiCde63vzxwxbsHV8i1AzrN6DDRaYlvlp3KozUrRp0zZ3hOzigX
	eLS8cFC7Qytd25rqkSg7Yqy4gD2nUAbU8zw9W7mZQiTW8POItIxrqy9ML89LMPGwJaY9Xdc+RChyd
	dmuqOVpQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40150)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r7XDf-0005VP-0Q;
	Mon, 27 Nov 2023 08:43:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r7XDe-0001ll-KJ; Mon, 27 Nov 2023 08:43:54 +0000
Date: Mon, 27 Nov 2023 08:43:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Luo Jie <quic_luoj@quicinc.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, hkallweit1@gmail.com, corbet@lwn.net,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/6] net: phy: introduce core support for phy-mode =
 "10g-qxgmii"
Message-ID: <ZWRWylzfCLu2XXHy@shell.armlinux.org.uk>
References: <20231126060732.31764-1-quic_luoj@quicinc.com>
 <20231126060732.31764-2-quic_luoj@quicinc.com>
 <f97fd2f0-3e39-4de0-8b1c-f333a0f56a7f@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f97fd2f0-3e39-4de0-8b1c-f333a0f56a7f@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Nov 26, 2023 at 06:20:16PM +0100, Andrew Lunn wrote:
> On Sun, Nov 26, 2023 at 02:07:27PM +0800, Luo Jie wrote:
> >  	switch (interface) {
> >  	case PHY_INTERFACE_MODE_USXGMII:
> > -		caps |= MAC_10000FD | MAC_5000FD | MAC_2500FD;
> > +		caps |= MAC_10000FD | MAC_5000FD;
> > +		fallthrough;
> 
> This change seems to refer to the second paragraph, where as the rest
> of the code is about the first. Or does splitting this cause a bisect
> problem?

I'm not sure what you're referring to here, and by over-trimming the
context, this probably gives an insight into a misunderstanding.

This hunk (and the next) does _not_ change what USXGMII ends up with.
It moves MAC_2500FD to be under the 10G_QXGMII case from the USXGMII
case, and we will _fallthrough_ from the USXGMII case into thte
10G_QXGMII case. So, USXGMII still ends up with MAC_2500FD.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

