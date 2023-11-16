Return-Path: <linux-doc+bounces-2516-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86307EE534
	for <lists+linux-doc@lfdr.de>; Thu, 16 Nov 2023 17:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6BA21C20A11
	for <lists+linux-doc@lfdr.de>; Thu, 16 Nov 2023 16:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D9C2FE3D;
	Thu, 16 Nov 2023 16:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIH23K7h"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87C941E22;
	Thu, 16 Nov 2023 16:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BB6C433C8;
	Thu, 16 Nov 2023 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700152330;
	bh=2AUgUkcEUb1Dh5x3KSpyBJesyiJX2z8vbRrpUlQ60nw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GIH23K7hBKtEtYHXobqTZTsVgXPnpe5kXlhN3cL4qnGTmifKKAxlQmqzUC9iGvzxg
	 4Ijh4V8/faa398mOR5VruAxbIK4zLVdSB9B05E8FuZ2UIAynF8YXKBGUFr62534AA4
	 OoJ3Jlxl/PjFfH4NAm9aI2+GsOg5osswqWjaQJN4LR0b6BGLWUUALuouhPWmfj+vAI
	 EhHSQrdu3QZAa/LDXfddPqtk76geWD9u2nSX6ok+uqKdcbVTuB0DwR713QPCgWU9pt
	 xcV3uSsQxxPIZ5o2ELnfjjNyMoG5JCxtq5y/2IZZogRbC2XBTfw6J9TSI1niJhOxqd
	 BRJbOa2m8sxLg==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1r3fHj-00DjWX-Ho;
	Thu, 16 Nov 2023 16:32:07 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 16 Nov 2023 16:32:07 +0000
From: Marc Zyngier <maz@kernel.org>
To: Yi-De Wu <yi-de.wu@mediatek.com>
Cc: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang
 <ze-yu.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnd Bergmann <arnd@arndb.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, David Bradil <dbrazdil@google.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Jade Shih <jades.shih@mediatek.com>,
 Ivan Tseng <ivan.tseng@mediatek.com>, My Chuang <my.chuang@mediatek.com>,
 Shawn Hsiao <shawn.hsiao@mediatek.com>, PeiLun Suei
 <peilun.suei@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>, Willix
 Yeh <chi-shen.yeh@mediatek.com>, Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Subject: Re: [PATCH v7 03/16] virt: geniezone: Add GenieZone hypervisor driver
In-Reply-To: <20231116152756.4250-4-yi-de.wu@mediatek.com>
References: <20231116152756.4250-1-yi-de.wu@mediatek.com>
 <20231116152756.4250-4-yi-de.wu@mediatek.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <eeaa95f842a199499970232cca7136fb@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: yi-de.wu@mediatek.com, yingshiuan.pan@mediatek.com, ze-yu.wang@mediatek.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, dbrazdil@google.com, quic_tsoni@quicinc.com, jades.shih@mediatek.com, ivan.tseng@mediatek.com, my.chuang@mediatek.com, shawn.hsiao@mediatek.com, peilun.suei@mediatek.com, liju-clr.chen@mediatek.com, chi-shen.yeh@mediatek.com, kevenny.hsieh@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2023-11-16 15:27, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> GenieZone hypervisor(gzvm) is a type-1 hypervisor that supports various
> virtual machine types and provides security features such as TEE-like
> scenarios and secure boot. It can create guest VMs for security use
> cases and has virtualization capabilities for both platform and
> interrupt. Although the hypervisor can be booted independently, it
> requires the assistance of GenieZone hypervisor kernel driver(gzvm-ko)
> to leverage the ability of Linux kernel for vCPU scheduling, memory
> management, inter-VM communication and virtio backend support.
> 
> Add the basic hypervisor driver. Subsequent patches will add more
> supported features to this driver.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
> Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>  MAINTAINERS                             |  3 +
>  arch/arm64/Kbuild                       |  1 +
>  arch/arm64/geniezone/Makefile           |  9 +++
>  arch/arm64/geniezone/gzvm_arch_common.h | 37 ++++++++++
>  arch/arm64/geniezone/vm.c               | 40 +++++++++++
>  drivers/virt/Kconfig                    |  2 +
>  drivers/virt/geniezone/Kconfig          | 16 +++++
>  drivers/virt/geniezone/Makefile         | 10 +++
>  drivers/virt/geniezone/gzvm_main.c      | 89 +++++++++++++++++++++++++
>  include/linux/gzvm_drv.h                | 25 +++++++
>  10 files changed, 232 insertions(+)
>  create mode 100644 arch/arm64/geniezone/Makefile
>  create mode 100644 arch/arm64/geniezone/gzvm_arch_common.h
>  create mode 100644 arch/arm64/geniezone/vm.c
>  create mode 100644 drivers/virt/geniezone/Kconfig
>  create mode 100644 drivers/virt/geniezone/Makefile
>  create mode 100644 drivers/virt/geniezone/gzvm_main.c
>  create mode 100644 include/linux/gzvm_drv.h
> 

[...]

> diff --git a/arch/arm64/geniezone/gzvm_arch_common.h
> b/arch/arm64/geniezone/gzvm_arch_common.h
> new file mode 100644
> index 000000000000..10037013ab91
> --- /dev/null
> +++ b/arch/arm64/geniezone/gzvm_arch_common.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + */
> +
> +#ifndef __GZVM_ARCH_COMMON_H__
> +#define __GZVM_ARCH_COMMON_H__
> +
> +#include <linux/arm-smccc.h>
> +
> +enum {
> +	GZVM_FUNC_PROBE = 12,
> +	NR_GZVM_FUNC,
> +};
> +
> +#define SMC_ENTITY_MTK			59
> +#define GZVM_FUNCID_START		(0x1000)
> +#define GZVM_HCALL_ID(func)						\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,	\
> +			   SMC_ENTITY_MTK, (GZVM_FUNCID_START + (func)))
> +

ARM_SMCCC_SMC_32? Really? You never pass a 64bit quantity anywhere?

I'm half tempted to enforce the truncation to 32bit.

         M.
-- 
Jazz is not dead. It just smells funny...

