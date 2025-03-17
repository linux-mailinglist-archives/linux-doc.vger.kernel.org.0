Return-Path: <linux-doc+bounces-41047-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF1A6513D
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 14:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C2EB168E3F
	for <lists+linux-doc@lfdr.de>; Mon, 17 Mar 2025 13:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096DFEACD;
	Mon, 17 Mar 2025 13:33:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6288422094
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218409; cv=none; b=akUISiGMdelQhrvlWiVnUd3gGPDnRxGPPKZnrl3dbY36hSjgjOVu1rVAVeke3v9D7K3noLg5X8klHC0vRoyCoFn1Veoz/sm3ZzGxBOh+yG3ymFrpm3zZPfn9Bm/Ttn8ZfVBn/K+1RAlX4/BXqcbHRt09swXBKUCBijjAG/UzMSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218409; c=relaxed/simple;
	bh=Nhvl1hkVuUNCJNWAlMRfusF3yQwYAOCztI6veKGFT08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDNRccYOEzrhQsLm6rRheJWyOpUiM3Zmm3mo7UVyGNCmx4W9R1fZhnXJzClfUGl9b8WZbWT87n9Am9g76qG8g6c6A4flQ3zNaYs4f3BpmXaBisIoIdWxrPpvLNA+D1VmddhFgStejjAwIhBjU2FcN95pQEeEj7rEAs6vZXjILig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tuAac-0005B1-71; Mon, 17 Mar 2025 14:33:10 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tuAab-000GCH-04;
	Mon, 17 Mar 2025 14:33:09 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tuAab-001CaR-0t;
	Mon, 17 Mar 2025 14:33:09 +0100
Date: Mon, 17 Mar 2025 14:33:09 +0100
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	Kyle Swenson <kyle.swenson@est.tech>,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v6 11/12] net: pse-pd: tps23881: Add support for
 static port priority feature
Message-ID: <Z9gklcNz6wHU9cPC@pengutronix.de>
References: <20250304-feature_poe_port_prio-v6-0-3dc0c5ebaf32@bootlin.com>
 <20250304-feature_poe_port_prio-v6-11-3dc0c5ebaf32@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304-feature_poe_port_prio-v6-11-3dc0c5ebaf32@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Tue, Mar 04, 2025 at 11:19:00AM +0100, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> This patch enhances PSE callbacks by introducing support for the static
> port priority feature. It extends interrupt management to handle and report
> detection, classification, and disconnection events. Additionally, it
> introduces the pi_get_pw_req() callback, which provides information about
> the power requested by the Powered Devices.
> 
> Interrupt support is essential for the proper functioning of the TPS23881
> controller. Without it, after a power-on (PWON), the controller will
> no longer perform detection and classification. This could lead to
> potential hazards, such as connecting a non-PoE device after a PoE device,
> which might result in magic smoke.
> 
> Signed-off-by: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> ---
> 
> We may need a fix for the interrupt support in old version of Linux.
> 
> Change in v4:
> - Fix variable type nit.
> 
> Change in v3:
> - New patch
> ---
>  drivers/net/pse-pd/tps23881.c | 204 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 194 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/pse-pd/tps23881.c b/drivers/net/pse-pd/tps23881.c
> index 1226667192977..6012c58b47e8a 100644
> --- a/drivers/net/pse-pd/tps23881.c
> +++ b/drivers/net/pse-pd/tps23881.c
> @@ -19,20 +19,30 @@
>  
>  #define TPS23881_REG_IT		0x0
>  #define TPS23881_REG_IT_MASK	0x1
> +#define TPS23881_REG_IT_DISF	BIT(2)
> +#define TPS23881_REG_IT_DETC	BIT(3)
> +#define TPS23881_REG_IT_CLASC	BIT(4)
>  #define TPS23881_REG_IT_IFAULT	BIT(5)
>  #define TPS23881_REG_IT_SUPF	BIT(7)
> +#define TPS23881_REG_DET_EVENT	0x5
>  #define TPS23881_REG_FAULT	0x7
>  #define TPS23881_REG_SUPF_EVENT	0xb
>  #define TPS23881_REG_TSD	BIT(7)
> +#define TPS23881_REG_DISC	0xc
>  #define TPS23881_REG_PW_STATUS	0x10
>  #define TPS23881_REG_OP_MODE	0x12
> +#define TPS23881_REG_DISC_EN	0x13
>  #define TPS23881_OP_MODE_SEMIAUTO	0xaaaa
>  #define TPS23881_REG_DIS_EN	0x13
>  #define TPS23881_REG_DET_CLA_EN	0x14
>  #define TPS23881_REG_GEN_MASK	0x17
> +#define TPS23881_REG_CLCHE	BIT(2)
> +#define TPS23881_REG_DECHE	BIT(3)
>  #define TPS23881_REG_NBITACC	BIT(5)
>  #define TPS23881_REG_INTEN	BIT(7)
>  #define TPS23881_REG_PW_EN	0x19
> +#define TPS23881_REG_RESET	0x1a
> +#define TPS23881_REG_CLRAIN	BIT(7)
>  #define TPS23881_REG_2PAIR_POL1	0x1e
>  #define TPS23881_REG_PORT_MAP	0x26
>  #define TPS23881_REG_PORT_POWER	0x29
> @@ -177,6 +187,7 @@ static int tps23881_pi_enable(struct pse_controller_dev *pcdev, int id)
>  	struct i2c_client *client = priv->client;
>  	u8 chan;
>  	u16 val;
> +	int ret;
>  
>  	if (id >= TPS23881_MAX_CHANS)
>  		return -ERANGE;
> @@ -190,7 +201,22 @@ static int tps23881_pi_enable(struct pse_controller_dev *pcdev, int id)
>  				       BIT(chan % 4));
>  	}
>  
> -	return i2c_smbus_write_word_data(client, TPS23881_REG_PW_EN, val);
> +	ret = i2c_smbus_write_word_data(client, TPS23881_REG_PW_EN, val);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable DC disconnect*/
> +	chan = priv->port[id].chan[0];
> +	ret = i2c_smbus_read_word_data(client, TPS23881_REG_DISC_EN);
> +	if (ret < 0)
> +		return ret;

Here we have RMW operation without lock on two paths: pi_enable and
pi_disable.

> +	val = tps23881_set_val(ret, chan, 0, BIT(chan % 4), BIT(chan % 4));
> +	ret = i2c_smbus_write_word_data(client, TPS23881_REG_DISC_EN, val);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
>  }
>  
>  static int tps23881_pi_disable(struct pse_controller_dev *pcdev, int id)
> @@ -223,6 +249,17 @@ static int tps23881_pi_disable(struct pse_controller_dev *pcdev, int id)
>  	 */
>  	mdelay(5);
>  
> +	/* Disable DC disconnect*/
> +	chan = priv->port[id].chan[0];
> +	ret = i2c_smbus_read_word_data(client, TPS23881_REG_DISC_EN);
> +	if (ret < 0)
> +		return ret;

dito

> +	val = tps23881_set_val(ret, chan, 0, 0, BIT(chan % 4));
> +	ret = i2c_smbus_write_word_data(client, TPS23881_REG_DISC_EN, val);
> +	if (ret)
> +		return ret;
> +
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

