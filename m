Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDFD46610C5
	for <lists+linux-doc@lfdr.de>; Sat,  7 Jan 2023 19:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjAGSYM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 7 Jan 2023 13:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbjAGSYL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 7 Jan 2023 13:24:11 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E2A1E3C4;
        Sat,  7 Jan 2023 10:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=rbaU3zKYZQm8LWw+XTHjZPw1N0FWGhaOeYaSMW68DXI=; b=Pgp7KRtqGgcqKUSYc8VypUf5Zo
        nqiB4kHecWiWtl+zcdAwGdeeR7Q23CyBJ/QA48OHhpRkCC6nKh7+PJkxsXJQSrtySWqFT97xl8soE
        vUGX1azwTQgKWbdfWhz+hMAOQDIATH53xlOsMQqGB0Ed3ta8NlUymPSnzuhBizY2XT0U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pEDrL-001RC1-5S; Sat, 07 Jan 2023 19:23:59 +0100
Date:   Sat, 7 Jan 2023 19:23:59 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
        mailhol.vincent@wanadoo.fr, sudheer.mogilappagari@intel.com,
        sbhatta@marvell.com, linux-doc@vger.kernel.org,
        wangjie125@huawei.com, corbet@lwn.net, lkp@intel.com,
        gal@nvidia.com, gustavoars@kernel.org
Subject: Re: [PATCH v2 net-next 5/5] drivers/net/phy: add driver for the
 onsemi NCN26000 10BASE-T1S PHY
Message-ID: <Y7m4v8nLEc4bVBDf@lunn.ch>
References: <cover.1673030528.git.piergiorgio.beruto@gmail.com>
 <b15b3867233c7adf33870460ea442ff9a4f6ad41.1673030528.git.piergiorgio.beruto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b15b3867233c7adf33870460ea442ff9a4f6ad41.1673030528.git.piergiorgio.beruto@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +++ b/drivers/net/phy/Kconfig
> @@ -264,6 +264,13 @@ config NATIONAL_PHY
>  	help
>  	  Currently supports the DP83865 PHY.
>  
> +config NCN26000_PHY
> +	tristate "onsemi 10BASE-T1S Ethernet PHY"
> +	help
> +	  Adds support for the onsemi 10BASE-T1S Ethernet PHY.
> +	  Currently supports the NCN26000 10BASE-T1S Industrial PHY
> +	  with MII interface.
> +
>  config NXP_C45_TJA11XX_PHY
>  	tristate "NXP C45 TJA11XX PHYs"

These are actually sorted by the tristate string, which is what you
see when you use

make menuconfig

So 'onsemi' should be after 'NXP TJA11xx PHYs support'. Also, all the
other entries capitalise the first word.

>  	depends on PTP_1588_CLOCK_OPTIONAL
> diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
> index f7138d3c896b..b5138066ba04 100644
> --- a/drivers/net/phy/Makefile
> +++ b/drivers/net/phy/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_MICROCHIP_T1_PHY)	+= microchip_t1.o
>  obj-$(CONFIG_MICROSEMI_PHY)	+= mscc/
>  obj-$(CONFIG_MOTORCOMM_PHY)	+= motorcomm.o
>  obj-$(CONFIG_NATIONAL_PHY)	+= national.o
> +obj-$(CONFIG_NCN26000_PHY)	+= ncn26000.o
>  obj-$(CONFIG_NXP_C45_TJA11XX_PHY)	+= nxp-c45-tja11xx.o
>  obj-$(CONFIG_NXP_TJA11XX_PHY)	+= nxp-tja11xx.o
>  obj-$(CONFIG_QSEMI_PHY)		+= qsemi.o

This is sorted by CONFIG_ symbol, so is correct.

> +
> +// driver callbacks --------------------------------------------------------- //

Comments like this don't really add any value.

> +static irqreturn_t ncn26000_handle_interrupt(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	// read and aknowledge the IRQ status register
> +	ret = phy_read(phydev, NCN26000_REG_IRQ_STATUS);
> +
> +	// check only link status changes
> +	if (unlikely(ret < 0) || (ret & NCN26000_REG_IRQ_STATUS) == 0)
> +		return IRQ_NONE;

More usage of unlikely(). If this was on the hot path, handling 10M
frames a second, then maybe unlikley() could be justified. But how
often do you get PHY interrupts? Once a day?

      Andrew
