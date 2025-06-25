Return-Path: <linux-doc+bounces-50490-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A8AE7F9D
	for <lists+linux-doc@lfdr.de>; Wed, 25 Jun 2025 12:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C9DA5A517B
	for <lists+linux-doc@lfdr.de>; Wed, 25 Jun 2025 10:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CF92BDC29;
	Wed, 25 Jun 2025 10:34:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CFE2BD5A1
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847685; cv=none; b=R4Zshhkcg0ENXGOxh1CAnw3n9u4w5SJVIVnaEYJyOHpxpyG8K55eqy3qIcjDzSytDF7hxhjlsC0cVYiuYnPTJ3kLSD2rynA9trEBhR4iN4jIMPNs9bMmqDvYl+vF1l570qgmPmKNyUuxLen63VptWRzVijklSS0wL8o8qyWrKTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847685; c=relaxed/simple;
	bh=MN0a0M5SY8qVye0UR6x7OgeBX33RCLWkHTWSqb1SIG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYKRdVcO1h52fJm19hxYUWihetnUIHvmp4IGqITHsYO8rhl1Hq32Xi/1vkm5nIeLqa7AIhzcwuXLKYxYFzSdNB1ARpvCmLhl//cp7gStvIGbK5tu11cAAx8Du7ysuZmx2rHfhqWON19UL+IDCfVvtLEfVqLdOvCkOC6fpkyBMdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uUNSO-0007Kd-Gq; Wed, 25 Jun 2025 12:34:20 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uUNSO-005GSi-08;
	Wed, 25 Jun 2025 12:34:20 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uUNSN-00H7jR-2z;
	Wed, 25 Jun 2025 12:34:19 +0200
Date: Wed, 25 Jun 2025 12:34:19 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-doc@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v18 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <20250625103419.h32apyxfjztpoi7k@pengutronix.de>
References: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-imx-se-if-v18-0-c98391ba446d@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

Hi Pankaj,

thank you for the patchset and sorry for jumping late.

On 25-06-19, Pankaj Gupta wrote:

...
> ---
> Pankaj Gupta (7):
>       Documentation/firmware: add imx/se to other_interfaces
>       dt-bindings: arm: fsl: add imx-se-fw binding doc
>       firmware: imx: add driver for NXP EdgeLock Enclave
>       firmware: imx: device context dedicated to priv
>       firmware: drivers: imx: adds miscdev

I didn't had the time for a detailed review but the patches3-5 (e.g. all
firmware: *) can be squashed. In patch3 you add a set of files which
you're going to patch in patch4 and patch5.

Please have a look at my comment on patch3.

Regards,
  Marco

>       arm64: dts: imx8ulp: add secure enclave node
>       arm64: dts: imx8ulp-evk: add reserved memory property
> 
>  Documentation/ABI/testing/se-cdev                  |   43 +
>  .../devicetree/bindings/firmware/fsl,imx-se.yaml   |   91 ++
>  .../driver-api/firmware/other_interfaces.rst       |  123 +++
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   12 +-
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   11 +-
>  drivers/firmware/imx/Kconfig                       |   13 +
>  drivers/firmware/imx/Makefile                      |    2 +
>  drivers/firmware/imx/ele_base_msg.c                |  269 +++++
>  drivers/firmware/imx/ele_base_msg.h                |   95 ++
>  drivers/firmware/imx/ele_common.c                  |  354 ++++++
>  drivers/firmware/imx/ele_common.h                  |   49 +
>  drivers/firmware/imx/se_ctrl.c                     | 1145 ++++++++++++++++++++
>  drivers/firmware/imx/se_ctrl.h                     |  128 +++
>  include/linux/firmware/imx/se_api.h                |   14 +
>  include/uapi/linux/se_ioctl.h                      |   97 ++
>  15 files changed, 2443 insertions(+), 3 deletions(-)
> ---
> base-commit: 9e9eef5925a5d2b1938484c4edc906e384145959
> change-id: 20240507-imx-se-if-a40055093dc6
> 
> Best regards,
> -- 
> Pankaj Gupta <pankaj.gupta@nxp.com>
> 
> 
> 

