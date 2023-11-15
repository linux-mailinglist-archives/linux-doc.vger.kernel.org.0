Return-Path: <linux-doc+bounces-2423-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA57EC4DC
	for <lists+linux-doc@lfdr.de>; Wed, 15 Nov 2023 15:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4B6280DDC
	for <lists+linux-doc@lfdr.de>; Wed, 15 Nov 2023 14:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB12528DB4;
	Wed, 15 Nov 2023 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Nx+eXm9l"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC80A250EA;
	Wed, 15 Nov 2023 14:15:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60EABC5;
	Wed, 15 Nov 2023 06:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mBFGMe7skEIgTBOB5QwH3mmUcF95I4cehVRFGWVTgy0=; b=Nx+eXm9lPhUBYlzYTUogOW3OQQ
	QhZ4GSTNysX7sarNVskQ+D6LFM6SWC0LRoH/RxSREjeMrSyxZKP+vfDxDqvb7AZXr86AdoU/5fZIG
	vGDjZUl+8Qmb5iE1DPdgakszszTeN7pIn44tKcWMtlGqmsc5laa8riGqEhrLO6XLs6+Df2v6qmnDe
	zW25U9cW6oHAD+h6Z+dpL5w+sJKM5sQ6jf47/a4V4Ky8Adt7BvkXln53OaQAP8hSrVAtpIFG9KnUn
	CCERUVgvYX1Y4Rr/6M2xzTgIUP77W1SWLM+wE3NX9NmZrdjOsMEqXBo9IL9pdveCGjahiX9MATBEz
	gxWaY1dA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56772)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r3GfF-0000li-1x;
	Wed, 15 Nov 2023 14:14:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r3GfE-0006eN-DX; Wed, 15 Nov 2023 14:14:44 +0000
Date: Wed, 15 Nov 2023 14:14:44 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, corbet@lwn.net, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/6] net: phylink: move phylink_pcs_neg_mode() to
 phylink.c
Message-ID: <ZVTSVIx+S+W/+X4B@shell.armlinux.org.uk>
References: <20231115140630.10858-1-quic_luoj@quicinc.com>
 <20231115140630.10858-2-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115140630.10858-2-quic_luoj@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

You don't need this patch for your series, and you're bypassing my
ability to decide when this patch should be merged (which is not yet,
I want things to remain as-is for another cycle.)

In theory, looking at past history, 6.7 will probably be a LTS kernel,
but until that is known for certain, I don't want to commit to moving
this function in case LTS gets delayed by a cycle.

Please drop it from your series.

Thanks.

On Wed, Nov 15, 2023 at 10:06:25PM +0800, Luo Jie wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> Russell points out that there is no user of phylink_pcs_neg_mode()
> outside of phylink.c, nor is there planned to be any, so we can just
> move it there.
> 
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/net/phy/phylink.c | 65 ++++++++++++++++++++++++++++++++++++++
>  include/linux/phylink.h   | 66 ---------------------------------------
>  2 files changed, 65 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 25c19496a336..162f51b0986a 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -162,6 +162,71 @@ static const char *phylink_an_mode_str(unsigned int mode)
>  	return mode < ARRAY_SIZE(modestr) ? modestr[mode] : "unknown";
>  }
>  
> +/**
> + * phylink_pcs_neg_mode() - helper to determine PCS inband mode
> + * @mode: one of %MLO_AN_FIXED, %MLO_AN_PHY, %MLO_AN_INBAND.
> + * @interface: interface mode to be used
> + * @advertising: adertisement ethtool link mode mask
> + *
> + * Determines the negotiation mode to be used by the PCS, and returns
> + * one of:
> + *
> + * - %PHYLINK_PCS_NEG_NONE: interface mode does not support inband
> + * - %PHYLINK_PCS_NEG_OUTBAND: an out of band mode (e.g. reading the PHY)
> + *   will be used.
> + * - %PHYLINK_PCS_NEG_INBAND_DISABLED: inband mode selected but autoneg
> + *   disabled
> + * - %PHYLINK_PCS_NEG_INBAND_ENABLED: inband mode selected and autoneg enabled
> + *
> + * Note: this is for cases where the PCS itself is involved in negotiation
> + * (e.g. Clause 37, SGMII and similar) not Clause 73.
> + */
> +static unsigned int phylink_pcs_neg_mode(unsigned int mode, phy_interface_t interface,
> +					 const unsigned long *advertising)
> +{
> +	unsigned int neg_mode;
> +
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +	case PHY_INTERFACE_MODE_QUSGMII:
> +	case PHY_INTERFACE_MODE_USXGMII:
> +		/* These protocols are designed for use with a PHY which
> +		 * communicates its negotiation result back to the MAC via
> +		 * inband communication. Note: there exist PHYs that run
> +		 * with SGMII but do not send the inband data.
> +		 */
> +		if (!phylink_autoneg_inband(mode))
> +			neg_mode = PHYLINK_PCS_NEG_OUTBAND;
> +		else
> +			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
> +		break;
> +
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +		/* 1000base-X is designed for use media-side for Fibre
> +		 * connections, and thus the Autoneg bit needs to be
> +		 * taken into account. We also do this for 2500base-X
> +		 * as well, but drivers may not support this, so may
> +		 * need to override this.
> +		 */
> +		if (!phylink_autoneg_inband(mode))
> +			neg_mode = PHYLINK_PCS_NEG_OUTBAND;
> +		else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> +					   advertising))
> +			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
> +		else
> +			neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
> +		break;
> +
> +	default:
> +		neg_mode = PHYLINK_PCS_NEG_NONE;
> +		break;
> +	}
> +
> +	return neg_mode;
> +}
> +
>  static unsigned int phylink_interface_signal_rate(phy_interface_t interface)
>  {
>  	switch (interface) {
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 875439ab45de..d589f89c612c 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -98,72 +98,6 @@ static inline bool phylink_autoneg_inband(unsigned int mode)
>  	return mode == MLO_AN_INBAND;
>  }
>  
> -/**
> - * phylink_pcs_neg_mode() - helper to determine PCS inband mode
> - * @mode: one of %MLO_AN_FIXED, %MLO_AN_PHY, %MLO_AN_INBAND.
> - * @interface: interface mode to be used
> - * @advertising: adertisement ethtool link mode mask
> - *
> - * Determines the negotiation mode to be used by the PCS, and returns
> - * one of:
> - *
> - * - %PHYLINK_PCS_NEG_NONE: interface mode does not support inband
> - * - %PHYLINK_PCS_NEG_OUTBAND: an out of band mode (e.g. reading the PHY)
> - *   will be used.
> - * - %PHYLINK_PCS_NEG_INBAND_DISABLED: inband mode selected but autoneg
> - *   disabled
> - * - %PHYLINK_PCS_NEG_INBAND_ENABLED: inband mode selected and autoneg enabled
> - *
> - * Note: this is for cases where the PCS itself is involved in negotiation
> - * (e.g. Clause 37, SGMII and similar) not Clause 73.
> - */
> -static inline unsigned int phylink_pcs_neg_mode(unsigned int mode,
> -						phy_interface_t interface,
> -						const unsigned long *advertising)
> -{
> -	unsigned int neg_mode;
> -
> -	switch (interface) {
> -	case PHY_INTERFACE_MODE_SGMII:
> -	case PHY_INTERFACE_MODE_QSGMII:
> -	case PHY_INTERFACE_MODE_QUSGMII:
> -	case PHY_INTERFACE_MODE_USXGMII:
> -		/* These protocols are designed for use with a PHY which
> -		 * communicates its negotiation result back to the MAC via
> -		 * inband communication. Note: there exist PHYs that run
> -		 * with SGMII but do not send the inband data.
> -		 */
> -		if (!phylink_autoneg_inband(mode))
> -			neg_mode = PHYLINK_PCS_NEG_OUTBAND;
> -		else
> -			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
> -		break;
> -
> -	case PHY_INTERFACE_MODE_1000BASEX:
> -	case PHY_INTERFACE_MODE_2500BASEX:
> -		/* 1000base-X is designed for use media-side for Fibre
> -		 * connections, and thus the Autoneg bit needs to be
> -		 * taken into account. We also do this for 2500base-X
> -		 * as well, but drivers may not support this, so may
> -		 * need to override this.
> -		 */
> -		if (!phylink_autoneg_inband(mode))
> -			neg_mode = PHYLINK_PCS_NEG_OUTBAND;
> -		else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> -					   advertising))
> -			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
> -		else
> -			neg_mode = PHYLINK_PCS_NEG_INBAND_DISABLED;
> -		break;
> -
> -	default:
> -		neg_mode = PHYLINK_PCS_NEG_NONE;
> -		break;
> -	}
> -
> -	return neg_mode;
> -}
> -
>  /**
>   * struct phylink_link_state - link state structure
>   * @advertising: ethtool bitmask containing advertised link modes
> -- 
> 2.42.0
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

