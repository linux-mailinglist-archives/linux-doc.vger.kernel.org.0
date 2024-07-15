Return-Path: <linux-doc+bounces-20690-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51439312A6
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2024 12:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 020741C2275A
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2024 10:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE9B185623;
	Mon, 15 Jul 2024 10:56:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEC623B1
	for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 10:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721040983; cv=none; b=TG+ghvRzx2CHDa3iP9+9LV9KEiit9u/1U+7UaNSNvV+d/dPWlkKH6QdCLjYFVFBWHKQCu+EGQPS6658ih6PDVd8vINdPIMcvfpTCW6WVe7q7XuvpcvJ9hmoQanGxGAJd0v957EVOyrOynpp9pPEudA9oj37HD7yiFw3fcUTdEu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721040983; c=relaxed/simple;
	bh=7uHJxNk8J+7YONNo+HXDaXGuq72vXCrSY3b47EZX7zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmdxsexwMkVUARNy8kXC65QionCe9sGyKK1sNfQ9xOQlV7xh0I9KLcwyJiGlH+OHCj96P/OJAdRHOFoOh9otfWs3J30qONe0mT2VMxgTm2JRnN4Zb57DPa+A7uw2yZY1FXAsEVL3wb8XLZ+yRBIJMzgnX0Dzx5ByaRxlvrkz14s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1sTJNE-00037l-BE; Mon, 15 Jul 2024 12:56:04 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1sTJND-009gbE-JY; Mon, 15 Jul 2024 12:56:03 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1sTJND-000OX8-1O;
	Mon, 15 Jul 2024 12:56:03 +0200
Date: Mon, 15 Jul 2024 12:56:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] firmware: imx: adds miscdev
Message-ID: <ZpUAQ0QDr9kzlOIn@pengutronix.de>
References: <20240712-imx-se-if-v5-0-66a79903a872@nxp.com>
 <20240712-imx-se-if-v5-5-66a79903a872@nxp.com>
 <ZpGr6qKjJKz14J+y@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpGr6qKjJKz14J+y@lizhi-Precision-Tower-5810>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

Hi Frank,

On Fri, Jul 12, 2024 at 06:19:22PM -0400, Frank Li wrote:
> > +	rx_msg = kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
> > +	if (!rx_msg) {
> > +		err = -ENOMEM;
> > +		goto exit;
> > +	}
> > +
> > +	tx_msg = memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
> > +			     cmd_snd_rcv_rsp_info.tx_buf_sz);
> > +	if (IS_ERR(tx_msg)) {
> > +		err = PTR_ERR(tx_msg);
> > +		goto exit;
> > +	}
> > +
> > +	if (tx_msg->header.tag != priv->cmd_tag) {
> > +		err = -EINVAL;
> > +		goto exit;
> > +	}
> > +
> > +	scoped_guard(mutex, &priv->se_if_cmd_lock);
> 
> You totally wrong use scoped_guard in whole patch.
> 
> fun()
> {
>      guard(); //which means lock here
>      ...
>      return; // unlock here
> }
> 
> scoped_guard()
> {     // lock here
>       ...
>       //unlock here
> }
> 
> your code scoped_guard(mutex, &priv->se_if_cmd_lock);
> is equal to
>  
>       mutex_lock();
>       mutex_unlock();
> 
> Nothing protected by mutex lock at all.

Thanks for bringing this on the table again. I already mourned about
this in v2 of this series, but didn't notice the issue wasn't fixed
then.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

