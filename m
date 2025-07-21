Return-Path: <linux-doc+bounces-53638-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D6CB0C53B
	for <lists+linux-doc@lfdr.de>; Mon, 21 Jul 2025 15:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 502403A5A28
	for <lists+linux-doc@lfdr.de>; Mon, 21 Jul 2025 13:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0976F06B;
	Mon, 21 Jul 2025 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ap3DUfUF"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C36175D47
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104659; cv=none; b=Z/XkTwB/zR9+/9uIShHHs/o2ih9jgJAqMZDyVwF+WEIAh5gu9RugH2bQTka5EB8TELGcCoZvUjCrP4XTjMOLf3p8U+uCJ/K4KVIwB9cugpWDYBCfD0frcM0HLbQC3r86WjEATzwGd088ORKkzbjfQRW5vdMas41B6Vhy/N+nkz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104659; c=relaxed/simple;
	bh=7F46WqsFvxAkaMC61oQQHlHQS0W2XJyVo1IJvx8xMm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRaz6/hLnmz6WtiCHowCAJUI6tmCtx1FNCgXtYZq/AoTCNmBmQRi1ZpSlGyR4AuwPcx+BYgdhQZGf5LLPZmG4d+mdSSbj832GfBxqJlXfCgT3j8Gx1ezIM43QW5jHioY0+i9YA3ktCgKoW1oNdsXw19c2boJmdkG46oxhfipgfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ap3DUfUF; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <32fc367c-46a4-4c76-b8a8-494bf79a6409@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753104645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VsHGAxrG6cxSaMcuW0htUsPVqP/hCDwEeZCIAG9Dz/E=;
	b=ap3DUfUFcKPtB5NdI0b2/5Y1cz46Or4gxlewqJ6ZoHV1gDxc2Fzx+e6EE7eBiWQ5Mz4/Vs
	l0jfnLNro8y3G3W/Q7Kmgep2HnlR1yKrD7sgmmxYHUH/pYoUwXVKKDpuDgR4VNPfps4jhP
	WE88tjuLTRroJc4NApm92mvtGZJGjbU=
Date: Mon, 21 Jul 2025 14:30:40 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/15] net: rnpgbe: Add build support for rnpgbe
To: Dong Yibo <dong100@mucse.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, gur.stavi@huawei.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, danishanwar@ti.com, lee@trager.us,
 gongfan1@huawei.com, lorenzo@kernel.org, geert+renesas@glider.be,
 Parthiban.Veerasooran@microchip.com, lukas.bulwahn@redhat.com,
 alexanderduyck@fb.com, richardcochran@gmail.com
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250721113238.18615-1-dong100@mucse.com>
 <20250721113238.18615-2-dong100@mucse.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250721113238.18615-2-dong100@mucse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 21/07/2025 12:32, Dong Yibo wrote:
> Add build options and doc for mucse.
> Initialize pci device access for MUCSE devices.
> 
> Signed-off-by: Dong Yibo <dong100@mucse.com>
> ---
>   .../device_drivers/ethernet/index.rst         |   1 +
>   .../device_drivers/ethernet/mucse/rnpgbe.rst  |  21 ++
>   MAINTAINERS                                   |   8 +
>   drivers/net/ethernet/Kconfig                  |   1 +
>   drivers/net/ethernet/Makefile                 |   1 +
>   drivers/net/ethernet/mucse/Kconfig            |  34 +++
>   drivers/net/ethernet/mucse/Makefile           |   7 +
>   drivers/net/ethernet/mucse/rnpgbe/Makefile    |   9 +
>   drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  33 +++
>   .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   | 226 ++++++++++++++++++
>   10 files changed, 341 insertions(+)
>   create mode 100644 Documentation/networking/device_drivers/ethernet/mucse/rnpgbe.rst
>   create mode 100644 drivers/net/ethernet/mucse/Kconfig
>   create mode 100644 drivers/net/ethernet/mucse/Makefile
>   create mode 100644 drivers/net/ethernet/mucse/rnpgbe/Makefile
>   create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
>   create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
> 
> diff --git a/Documentation/networking/device_drivers/ethernet/index.rst b/Documentation/networking/device_drivers/ethernet/index.rst
> index 40ac552641a3..0e03c5c10d30 100644
> --- a/Documentation/networking/device_drivers/ethernet/index.rst
> +++ b/Documentation/networking/device_drivers/ethernet/index.rst
> @@ -61,6 +61,7 @@ Contents:
>      wangxun/txgbevf
>      wangxun/ngbe
>      wangxun/ngbevf
> +   mucse/rnpgbe
>   
>   .. only::  subproject and html
>   
> diff --git a/Documentation/networking/device_drivers/ethernet/mucse/rnpgbe.rst b/Documentation/networking/device_drivers/ethernet/mucse/rnpgbe.rst
> new file mode 100644
> index 000000000000..7562fb6b8f61
> --- /dev/null
> +++ b/Documentation/networking/device_drivers/ethernet/mucse/rnpgbe.rst
> @@ -0,0 +1,21 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========================================================
> +Linux Base Driver for MUCSE(R) Gigabit PCI Express Adapters
> +===========================================================
> +
> +MUCSE Gigabit Linux driver.
> +Copyright (c) 2020 - 2025 MUCSE Co.,Ltd.
> +
> +Identifying Your Adapter
> +========================
> +The driver is compatible with devices based on the following:
> +
> + * MUCSE(R) Ethernet Controller N500 series
> + * MUCSE(R) Ethernet Controller N210 series
> +
> +Support
> +=======
> + If you have problems with the software or hardware, please contact our
> + customer support team via email at techsupport@mucse.com or check our
> + website at https://www.mucse.com/en/
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1bc1698bc5ae..da0d12e77ddc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17033,6 +17033,14 @@ T:	git git://linuxtv.org/media.git
>   F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
>   F:	drivers/media/i2c/mt9v111.c
>   
> +MUCSE ETHERNET DRIVER
> +M:	Yibo Dong <dong100@mucse.com>
> +L:	netdev@vger.kernel.org
> +S:	Maintained
> +W:	https://www.mucse.com/en/
> +F:	Documentation/networking/device_drivers/ethernet/mucse/*
> +F:	drivers/net/ethernet/mucse/*
> +
>   MULTIFUNCTION DEVICES (MFD)
>   M:	Lee Jones <lee@kernel.org>
>   S:	Maintained
> diff --git a/drivers/net/ethernet/Kconfig b/drivers/net/ethernet/Kconfig
> index f86d4557d8d7..77c55fa11942 100644
> --- a/drivers/net/ethernet/Kconfig
> +++ b/drivers/net/ethernet/Kconfig
> @@ -202,5 +202,6 @@ source "drivers/net/ethernet/wangxun/Kconfig"
>   source "drivers/net/ethernet/wiznet/Kconfig"
>   source "drivers/net/ethernet/xilinx/Kconfig"
>   source "drivers/net/ethernet/xircom/Kconfig"
> +source "drivers/net/ethernet/mucse/Kconfig"
>   
>   endif # ETHERNET
> diff --git a/drivers/net/ethernet/Makefile b/drivers/net/ethernet/Makefile
> index 67182339469a..696825bd1211 100644
> --- a/drivers/net/ethernet/Makefile
> +++ b/drivers/net/ethernet/Makefile
> @@ -107,3 +107,4 @@ obj-$(CONFIG_NET_VENDOR_XIRCOM) += xircom/
>   obj-$(CONFIG_NET_VENDOR_SYNOPSYS) += synopsys/
>   obj-$(CONFIG_NET_VENDOR_PENSANDO) += pensando/
>   obj-$(CONFIG_OA_TC6) += oa_tc6.o
> +obj-$(CONFIG_NET_VENDOR_MUCSE) += mucse/
> diff --git a/drivers/net/ethernet/mucse/Kconfig b/drivers/net/ethernet/mucse/Kconfig
> new file mode 100644
> index 000000000000..be0fdf268484
> --- /dev/null
> +++ b/drivers/net/ethernet/mucse/Kconfig
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Mucse network device configuration
> +#
> +
> +config NET_VENDOR_MUCSE
> +	bool "Mucse devices"
> +	default y
> +	help
> +	  If you have a network (Ethernet) card from Mucse(R), say Y.
> +
> +	  Note that the answer to this question doesn't directly affect the
> +	  kernel: saying N will just cause the configurator to skip all
> +	  the questions about Mucse(R) cards. If you say Y, you will
> +	  be asked for your specific card in the following questions.
> +
> +if NET_VENDOR_MUCSE
> +
> +config MGBE
> +	tristate "Mucse(R) 1GbE PCI Express adapters support"
> +	depends on PCI
> +	select PAGE_POOL
> +	help
> +	  This driver supports Mucse(R) 1GbE PCI Express family of
> +	  adapters.
> +
> +	  More specific information on configuring the driver is in
> +	  <file:Documentation/networking/device_drivers/ethernet/mucse/rnpgbe.rst>.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called rnpgbe.
> +
> +endif # NET_VENDOR_MUCSE
> +
> diff --git a/drivers/net/ethernet/mucse/Makefile b/drivers/net/ethernet/mucse/Makefile
> new file mode 100644
> index 000000000000..f0bd79882488
> --- /dev/null
> +++ b/drivers/net/ethernet/mucse/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for the Mucse(R) network device drivers.
> +#
> +
> +obj-$(CONFIG_MGBE) += rnpgbe/
> +
> diff --git a/drivers/net/ethernet/mucse/rnpgbe/Makefile b/drivers/net/ethernet/mucse/rnpgbe/Makefile
> new file mode 100644
> index 000000000000..0942e27f5913
> --- /dev/null
> +++ b/drivers/net/ethernet/mucse/rnpgbe/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright(c) 2020 - 2025 MUCSE Corporation.
> +#
> +# Makefile for the MUCSE(R) 1GbE PCI Express ethernet driver
> +#
> +
> +obj-$(CONFIG_MGBE) += rnpgbe.o
> +
> +rnpgbe-objs := rnpgbe_main.o
> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
> new file mode 100644
> index 000000000000..224e395d6be3
> --- /dev/null
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright(c) 2020 - 2025 Mucse Corporation. */
> +
> +#ifndef _RNPGBE_H
> +#define _RNPGBE_H
> +
> +enum rnpgbe_boards {
> +	board_n500,
> +	board_n210,
> +	board_n210L,
> +};
> +
> +struct mucse {
> +	struct net_device *netdev;
> +	struct pci_dev *pdev;
> +	/* board number */
> +	u16 bd_number;
> +
> +	char name[60];
> +};
> +
> +/* Device IDs */
> +#ifndef PCI_VENDOR_ID_MUCSE
> +#define PCI_VENDOR_ID_MUCSE 0x8848
> +#endif /* PCI_VENDOR_ID_MUCSE */

this should go to include/linux/pci_ids.h without any ifdefs

> +
> +#define PCI_DEVICE_ID_N500_QUAD_PORT 0x8308
> +#define PCI_DEVICE_ID_N500_DUAL_PORT 0x8318
> +#define PCI_DEVICE_ID_N500_VF 0x8309
> +#define PCI_DEVICE_ID_N210 0x8208
> +#define PCI_DEVICE_ID_N210L 0x820a
> +
> +#endif /* _RNPGBE_H */

[...]

