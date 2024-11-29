Return-Path: <linux-doc+bounces-31514-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F38BE9D6D41
	for <lists+linux-doc@lfdr.de>; Sun, 24 Nov 2024 10:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAA372814FB
	for <lists+linux-doc@lfdr.de>; Sun, 24 Nov 2024 09:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A57E3FBB3;
	Sun, 24 Nov 2024 09:34:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D782188917
	for <linux-doc@vger.kernel.org>; Sun, 24 Nov 2024 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732440876; cv=none; b=Gr9VnoALwgT7P9GbcFid5RiOaOk3Dc3ZiYCmD7h2apE61fRVZ9RIJSHpGPEwvAE5IT30vGDZQgPWDionBIGHqCbKeTbS4WiZ30Vjixe/6+VQEsls8DXXI9OxrKQTP1n+pJpJjCpbnM7mjWigH2F+fxxYEPW6g+2Tr3pmoUDPs2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732440876; c=relaxed/simple;
	bh=X2pMooo7r+GCce9iDPOHSV5vPTDrgJUmpK/bvcaIzD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OcRrzpw3u7q1Pu6djM4nLAN9XCF5hrSjfWkcPInwW3a07h0fNmpKMxC2atCxwa65vlgm5G/wbNSz2Fhyb2BH+QKd2iNb5/PgwyAYI7u9DmQoAOmue6Bj0v90fH2dXKbSC4A5sakeDnBjIUz1oVunmwpOWYor5LWMaLKCEHpDFeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tF90H-0005R7-IQ; Sun, 24 Nov 2024 10:34:05 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tF90G-002N7y-2d;
	Sun, 24 Nov 2024 10:34:04 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tF90G-00CgO2-2F;
	Sun, 24 Nov 2024 10:34:04 +0100
Date: Sun, 24 Nov 2024 10:34:04 +0100
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH RFC net-next v3 14/27] net: pse-pd: tps23881: Add support
 for PSE events and interrupts
Message-ID: <Z0LzDE8cYdbvx79o@pengutronix.de>
References: <20241121-feature_poe_port_prio-v3-0-83299fa6967c@bootlin.com>
 <20241121-feature_poe_port_prio-v3-14-83299fa6967c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121-feature_poe_port_prio-v3-14-83299fa6967c@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Thu, Nov 21, 2024 at 03:42:40PM +0100, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> Add support for PSE event reporting through interrupts. Set up the newly
> introduced devm_pse_irq_helper helper to register the interrupt. Events are
> reported for over-current and over-temperature conditions.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change in v3:
> - Loop over interruption register to be sure the interruption pin is
>   freed before exiting the interrupt handler function.
> - Add exist variable to not report event for undescribed PIs.
> - Used helpers to convert the chan number to the PI port number.
> 
> Change in v2:
> - Remove support for OSS pin and TPC23881 specific port priority management
> ---
>  drivers/net/pse-pd/tps23881.c | 178 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 177 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/pse-pd/tps23881.c b/drivers/net/pse-pd/tps23881.c
> index b25561f95774..6fe8f150231f 100644
> --- a/drivers/net/pse-pd/tps23881.c
> +++ b/drivers/net/pse-pd/tps23881.c
> @@ -17,6 +17,13 @@
>  
>  #define TPS23881_MAX_CHANS 8
>  
> +#define TPS23881_REG_IT		0x0
> +#define TPS23881_REG_IT_MASK	0x1
> +#define TPS23881_REG_IT_IFAULT	BIT(5)
> +#define TPS23881_REG_IT_SUPF	BIT(7)
> +#define TPS23881_REG_FAULT	0x7
> +#define TPS23881_REG_SUPF_EVENT	0xb
> +#define TPS23881_REG_TSD	BIT(7)
>  #define TPS23881_REG_PW_STATUS	0x10
>  #define TPS23881_REG_OP_MODE	0x12
>  #define TPS23881_OP_MODE_SEMIAUTO	0xaaaa
> @@ -24,6 +31,7 @@
>  #define TPS23881_REG_DET_CLA_EN	0x14
>  #define TPS23881_REG_GEN_MASK	0x17
>  #define TPS23881_REG_NBITACC	BIT(5)
> +#define TPS23881_REG_INTEN	BIT(7)
>  #define TPS23881_REG_PW_EN	0x19
>  #define TPS23881_REG_2PAIR_POL1	0x1e
>  #define TPS23881_REG_PORT_MAP	0x26
> @@ -53,6 +61,7 @@ struct tps23881_port_desc {
>  	u8 chan[2];
>  	bool is_4p;
>  	int pw_pol;
> +	bool exist;
>  };
>  
>  struct tps23881_priv {
> @@ -791,8 +800,10 @@ tps23881_write_port_matrix(struct tps23881_priv *priv,
>  		hw_chan = port_matrix[i].hw_chan[0] % 4;
>  
>  		/* Set software port matrix for existing ports */
> -		if (port_matrix[i].exist)
> +		if (port_matrix[i].exist) {
>  			priv->port[pi_id].chan[0] = lgcl_chan;
> +			priv->port[pi_id].exist = true;
> +		}
>  
>  		/* Initialize power policy internal value */
>  		priv->port[pi_id].pw_pol = -1;
> @@ -1098,6 +1109,165 @@ static int tps23881_flash_sram_fw(struct i2c_client *client)
>  	return 0;
>  }
>  
> +/* Convert interrupt events to 0xff to be aligned with the chan
> + * number.
> + */
> +static u8 tps23881_it_export_chans_helper(u16 reg_val, u8 field_offset)

What is the meaning of _it_?

> +{
> +	u8 val;
> +
> +	val = (reg_val >> (4 + field_offset) & 0xf0) |
> +	      (reg_val >> field_offset & 0x0f);
> +
> +	return val;
> +}
> +
> +/* Convert chan number to port number */
> +static void tps23881_set_notifs_helper(struct tps23881_priv *priv,
> +				       u8 chans,
> +				       unsigned long *notifs,
> +				       unsigned long *notifs_mask,
> +				       enum ethtool_pse_events event)
> +{
> +	u8 chan;
> +	int i;
> +
> +	if (!chans)
> +		return;
> +
> +	for (i = 0; i < TPS23881_MAX_CHANS; i++) {
> +		if (!priv->port[i].exist)
> +			continue;
> +		/* No need to look at the 2nd channel in case of PoE4 as
> +		 * both registers are set.
> +		 */
> +		chan = priv->port[i].chan[0];
> +
> +		if (BIT(chan) & chans) {
> +			*notifs_mask |= BIT(i);
> +			notifs[i] |= event;
> +		}
> +	}
> +}
> +
> +static void tps23881_irq_event_over_temp(struct tps23881_priv *priv,
> +					 u16 reg_val,
> +					 unsigned long *notifs,
> +					 unsigned long *notifs_mask)
> +{
> +	int i;
> +
> +	if (reg_val & TPS23881_REG_TSD) {
> +		for (i = 0; i < TPS23881_MAX_CHANS; i++) {
> +			if (!priv->port[i].exist)
> +				continue;
> +
> +			*notifs_mask |= BIT(i);
> +			notifs[i] |= ETHTOOL_PSE_EVENT_OVER_TEMP;

Hm, should it be bound to bound to therman zone frame work and start
cooling or something? I guess this can be done in a separate step..

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

