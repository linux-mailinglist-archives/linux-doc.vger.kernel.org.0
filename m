Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFC1691A25
	for <lists+linux-doc@lfdr.de>; Fri, 10 Feb 2023 09:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbjBJIlC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 10 Feb 2023 03:41:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbjBJIk6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Feb 2023 03:40:58 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABB076D21;
        Fri, 10 Feb 2023 00:40:48 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so5711021wmb.4;
        Fri, 10 Feb 2023 00:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0bubtEPaVoCQMQ3GFkcRfu92xivjIkv+mH0GRsPFEE=;
        b=n78uagjPoHq3I5nCPpXRMkVqV46+xsEKr6MsnMvYRZoD9TgQ0fGrrUFh02yDe0X7vR
         dwoXRmOo6HYDt2fUN5lnRYN7UanUbqAaTghq89NN8+XTeYd9w9jzse67/gEpNL6AEhoF
         9RgB7+sdfLJoVXGH2BGpIm7q5hf1Uyf58qIzHZYikflfUi/uSoAhYuu/yrNs8K98TyVS
         Qvk9exjaeW3ZeapXE437HeAHRFShxPUIex5L34fbY/X0820COdHOXFjfXxW/e0Qp/tut
         9TY7TacClsrdwbb1sKr9TkIDrQQYZXWw0nS0vaF66MZNBHFGHFUz6neWqu/6TiO/TyDV
         +mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0bubtEPaVoCQMQ3GFkcRfu92xivjIkv+mH0GRsPFEE=;
        b=VnHwvG2V1Ddc2iocZf6fC1sV94iFOfctn2f0uwu2e7XjRb/D/vzwajSpitrvqjeMee
         HRXd0+b0A0oBerP36/ntlf8X+aXAYSQcOpa+apatVtaKUldLLoUslBZ/F26fFvZceOFL
         CpSaOly3NUbQdu3xRrhD+IcU/UWfQTRH70RD5WmSrwBYwjmfPRwSpp27QEueeCevRD+C
         YeF2WBwQqhjR0C4Y1DcXeIDHD1DcSrdGurtk0N2sB2DwuI0aYU1H94CItUXTbfcTGmtk
         4qwM4ILypjP0j6TNmweGiWXMrdqynejPjiylZgI64HDrcRG2AmSj9/loiiL8wVNj/0Ip
         V96Q==
X-Gm-Message-State: AO0yUKXYggI1Tnyifs9qtegZuoeAVfxuJxTxi76Y86zaIIjGpbJ1fbC+
        HxyMe0HqxfOI33YQgEREvlw=
X-Google-Smtp-Source: AK7set+C+owNVTc3y8xthTQmo3H04ur8wpuJp6yhWrIyo+1p9+UzKFn/1HkxyOV9D64KQ2SpMchQKQ==
X-Received: by 2002:a05:600c:4d21:b0:3dc:3398:cf87 with SMTP id u33-20020a05600c4d2100b003dc3398cf87mr12246011wmp.11.1676018447068;
        Fri, 10 Feb 2023 00:40:47 -0800 (PST)
Received: from gmail.com ([81.168.73.77])
        by smtp.gmail.com with ESMTPSA id q11-20020a7bce8b000000b003dd9232f036sm7287171wmj.23.2023.02.10.00.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 00:40:46 -0800 (PST)
Date:   Fri, 10 Feb 2023 08:40:44 +0000
From:   Martin Habets <habetsm.xilinx@gmail.com>
To:     alejandro.lucero-palau@amd.com
Cc:     netdev@vger.kernel.org, linux-net-drivers@amd.com,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        edumazet@google.com, ecree.xilinx@gmail.com,
        linux-doc@vger.kernel.org, corbet@lwn.net, jiri@nvidia.com
Subject: Re: [PATCH v6 net-next 2/8] sfc: add devlink info support for ef100
Message-ID: <Y+YDDKzQ1MOjb/2e@gmail.com>
Mail-Followup-To: alejandro.lucero-palau@amd.com, netdev@vger.kernel.org,
        linux-net-drivers@amd.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, edumazet@google.com, ecree.xilinx@gmail.com,
        linux-doc@vger.kernel.org, corbet@lwn.net, jiri@nvidia.com
References: <20230208142519.31192-1-alejandro.lucero-palau@amd.com>
 <20230208142519.31192-3-alejandro.lucero-palau@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208142519.31192-3-alejandro.lucero-palau@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

NAK, see below.

On Wed, Feb 08, 2023 at 02:25:13PM +0000, alejandro.lucero-palau@amd.com wrote:
> From: Alejandro Lucero <alejandro.lucero-palau@amd.com>
> 
> Add devlink info support for ef100. The information reported is obtained
> through the MCDI interface with the specific meaning defined in new
> documentation file.
> 
> Signed-off-by: Alejandro Lucero <alejandro.lucero-palau@amd.com>
> ---
>  Documentation/networking/devlink/index.rst |   1 +
>  Documentation/networking/devlink/sfc.rst   |  57 +++
>  MAINTAINERS                                |   1 +
>  drivers/net/ethernet/sfc/efx_devlink.c     | 460 +++++++++++++++++++++
>  drivers/net/ethernet/sfc/efx_devlink.h     |  17 +
>  drivers/net/ethernet/sfc/mcdi.c            |  74 ++++
>  drivers/net/ethernet/sfc/mcdi.h            |   5 +
>  7 files changed, 615 insertions(+)
>  create mode 100644 Documentation/networking/devlink/sfc.rst
> 
> diff --git a/Documentation/networking/devlink/index.rst b/Documentation/networking/devlink/index.rst
> index fee4d3968309..b49749e2b9a6 100644
> --- a/Documentation/networking/devlink/index.rst
> +++ b/Documentation/networking/devlink/index.rst
> @@ -66,3 +66,4 @@ parameters, info versions, and other features it supports.
>     prestera
>     iosm
>     octeontx2
> +   sfc
> diff --git a/Documentation/networking/devlink/sfc.rst b/Documentation/networking/devlink/sfc.rst
> new file mode 100644
> index 000000000000..db64a1bd9733
> --- /dev/null
> +++ b/Documentation/networking/devlink/sfc.rst
> @@ -0,0 +1,57 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===================
> +sfc devlink support
> +===================
> +
> +This document describes the devlink features implemented by the ``sfc``
> +device driver for the ef100 device.
> +
> +Info versions
> +=============
> +
> +The ``sfc`` driver reports the following versions
> +
> +.. list-table:: devlink info versions implemented
> +   :widths: 5 5 90
> +
> +   * - Name
> +     - Type
> +     - Description
> +   * - ``fw.mgmt.suc``
> +     - running
> +     - For boards where the management function is split between multiple
> +       control units, this is the SUC control unit's firmware version.
> +   * - ``fw.mgmt.cmc``
> +     - running
> +     - For boards where the management function is split between multiple
> +       control units, this is the CMC control unit's firmware version.
> +   * - ``fpga.rev``
> +     - running
> +     - FPGA design revision.
> +   * - ``fpga.app``
> +     - running
> +     - Datapath programmable logic version.
> +   * - ``fw.app``
> +     - running
> +     - Datapath software/microcode/firmware version.
> +   * - ``coproc.boot``
> +     - running
> +     - SmartNIC application co-processor (APU) first stage boot loader version.
> +   * - ``coproc.uboot``
> +     - running
> +     - SmartNIC application co-processor (APU) co-operating system loader version.
> +   * - ``coproc.main``
> +     - running
> +     - SmartNIC application co-processor (APU) main operating system version.
> +   * - ``coproc.recovery``
> +     - running
> +     - SmartNIC application co-processor (APU) recovery operating system version.
> +   * - ``fw.exprom``
> +     - running
> +     - Expansion ROM version. For boards where the expansion ROM is split between
> +       multiple images (e.g. PXE and UEFI), this is the specifically the PXE boot
> +       ROM version.
> +   * - ``fw.uefi``
> +     - running
> +     - UEFI driver version (No UNDI support).
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2cf9eb43ed8f..51f7d3448295 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18937,6 +18937,7 @@ M:	Edward Cree <ecree.xilinx@gmail.com>
>  M:	Martin Habets <habetsm.xilinx@gmail.com>
>  L:	netdev@vger.kernel.org
>  S:	Supported
> +F:	Documentation/networking/devlink/sfc.rst
>  F:	drivers/net/ethernet/sfc/
>  
>  SFF/SFP/SFP+ MODULE SUPPORT
> diff --git a/drivers/net/ethernet/sfc/efx_devlink.c b/drivers/net/ethernet/sfc/efx_devlink.c
> index 57a7023d3cb6..c06efeac11e5 100644
> --- a/drivers/net/ethernet/sfc/efx_devlink.c
> +++ b/drivers/net/ethernet/sfc/efx_devlink.c
> @@ -9,12 +9,472 @@
>   */
>  
>  #include "efx_devlink.h"
> +#ifdef CONFIG_SFC_SRIOV

I don't get this SRIOV dependency. In the cover letter you say it
was because of IA64, bu those errors were:

ia64-linux-ld: drivers/net/ethernet/sfc/ef100_nic.o: in function `ef100_remove':
 ef100_nic.c:(.text+0x2e82): undefined reference to `efx_ef100_fini_reps'
 ia64-linux-ld: ef100_nic.c:(.text+0x2e92): undefined reference to `efx_fini_mae'

which is completely unrelated to this patch.
This extra ifdef must not be needed at all. I suspect something else
is going wrong in your builds.
Please explain in detail why you think you need this.

Martin

> +#include <linux/rtc.h>
> +#include "mcdi.h"
> +#include "mcdi_functions.h"
> +#include "mcdi_pcol.h"
> +#endif
>  
>  struct efx_devlink {
>  	struct efx_nic *efx;
>  };
>  
> +#ifdef CONFIG_SFC_SRIOV
> +static int efx_devlink_info_nvram_partition(struct efx_nic *efx,
> +					    struct devlink_info_req *req,
> +					    unsigned int partition_type,
> +					    const char *version_name)
> +{
> +	char buf[EFX_MAX_VERSION_INFO_LEN];
> +	u16 version[4];
> +	int rc;
> +
> +	rc = efx_mcdi_nvram_metadata(efx, partition_type, NULL, version, NULL,
> +				     0);
> +	if (rc) {
> +		netif_err(efx, drv, efx->net_dev, "mcdi nvram %s: failed\n",
> +			  version_name);
> +		return rc;
> +	}
> +
> +	snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u", version[0],
> +		 version[1], version[2], version[3]);
> +	devlink_info_version_stored_put(req, version_name, buf);
> +
> +	return 0;
> +}
> +
> +static int efx_devlink_info_stored_versions(struct efx_nic *efx,
> +					    struct devlink_info_req *req)
> +{
> +	int rc;
> +
> +	rc = efx_devlink_info_nvram_partition(efx, req,
> +					      NVRAM_PARTITION_TYPE_BUNDLE,
> +					      DEVLINK_INFO_VERSION_GENERIC_FW_BUNDLE_ID);
> +	if (rc)
> +		return rc;
> +
> +	rc = efx_devlink_info_nvram_partition(efx, req,
> +					      NVRAM_PARTITION_TYPE_MC_FIRMWARE,
> +					      DEVLINK_INFO_VERSION_GENERIC_FW_MGMT);
> +	if (rc)
> +		return rc;
> +
> +	rc = efx_devlink_info_nvram_partition(efx, req,
> +					      NVRAM_PARTITION_TYPE_SUC_FIRMWARE,
> +					      EFX_DEVLINK_INFO_VERSION_FW_MGMT_SUC);
> +	if (rc)
> +		return rc;
> +
> +	rc = efx_devlink_info_nvram_partition(efx, req,
> +					      NVRAM_PARTITION_TYPE_EXPANSION_ROM,
> +					      EFX_DEVLINK_INFO_VERSION_FW_EXPROM);
> +	if (rc)
> +		return rc;
> +
> +	rc = efx_devlink_info_nvram_partition(efx, req,
> +					      NVRAM_PARTITION_TYPE_EXPANSION_UEFI,
> +					      EFX_DEVLINK_INFO_VERSION_FW_UEFI);
> +	if (rc)
> +		return rc;
> +
> +	return 0;
> +}
> +
> +#define EFX_VER_FLAG(_f)	\
> +	(MC_CMD_GET_VERSION_V5_OUT_ ## _f ## _PRESENT_LBN)
> +
> +static void efx_devlink_info_running_v2(struct efx_nic *efx,
> +					struct devlink_info_req *req,
> +					unsigned int flags, efx_dword_t *outbuf)
> +{
> +	char buf[EFX_MAX_VERSION_INFO_LEN];
> +	union {
> +		const __le32 *dwords;
> +		const __le16 *words;
> +		const char *str;
> +	} ver;
> +	struct rtc_time build_date;
> +	unsigned int build_id;
> +	size_t offset;
> +	u64 tstamp;
> +
> +	if (flags & BIT(EFX_VER_FLAG(BOARD_EXT_INFO))) {
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%s",
> +			 MCDI_PTR(outbuf, GET_VERSION_V2_OUT_BOARD_NAME));
> +		devlink_info_version_fixed_put(req,
> +					       DEVLINK_INFO_VERSION_GENERIC_BOARD_ID,
> +					       buf);
> +
> +		/* Favour full board version if present (in V5 or later) */
> +		if (~flags & BIT(EFX_VER_FLAG(BOARD_VERSION))) {
> +			snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u",
> +				 MCDI_DWORD(outbuf,
> +					    GET_VERSION_V2_OUT_BOARD_REVISION));
> +			devlink_info_version_fixed_put(req,
> +						       DEVLINK_INFO_VERSION_GENERIC_BOARD_REV,
> +						       buf);
> +		}
> +
> +		ver.str = MCDI_PTR(outbuf, GET_VERSION_V2_OUT_BOARD_SERIAL);
> +		if (ver.str[0])
> +			devlink_info_board_serial_number_put(req, ver.str);
> +	}
> +
> +	if (flags & BIT(EFX_VER_FLAG(FPGA_EXT_INFO))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V2_OUT_FPGA_VERSION);
> +		offset = snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u_%c%u",
> +				  le32_to_cpu(ver.dwords[0]),
> +				  'A' + le32_to_cpu(ver.dwords[1]),
> +				  le32_to_cpu(ver.dwords[2]));
> +
> +		ver.str = MCDI_PTR(outbuf, GET_VERSION_V2_OUT_FPGA_EXTRA);
> +		if (ver.str[0])
> +			snprintf(&buf[offset], EFX_MAX_VERSION_INFO_LEN - offset,
> +				 " (%s)", ver.str);
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_FPGA_REV,
> +						 buf);
> +	}
> +
> +	if (flags & BIT(EFX_VER_FLAG(CMC_EXT_INFO))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V2_OUT_CMCFW_VERSION);
> +		offset = snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +				  le32_to_cpu(ver.dwords[0]),
> +				  le32_to_cpu(ver.dwords[1]),
> +				  le32_to_cpu(ver.dwords[2]),
> +				  le32_to_cpu(ver.dwords[3]));
> +
> +		tstamp = MCDI_QWORD(outbuf,
> +				    GET_VERSION_V2_OUT_CMCFW_BUILD_DATE);
> +		if (tstamp) {
> +			rtc_time64_to_tm(tstamp, &build_date);
> +			snprintf(&buf[offset], EFX_MAX_VERSION_INFO_LEN - offset,
> +				 " (%ptRd)", &build_date);
> +		}
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_FW_MGMT_CMC,
> +						 buf);
> +	}
> +
> +	ver.words = (__le16 *)MCDI_PTR(outbuf, GET_VERSION_V2_OUT_VERSION);
> +	offset = snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +			  le16_to_cpu(ver.words[0]), le16_to_cpu(ver.words[1]),
> +			  le16_to_cpu(ver.words[2]), le16_to_cpu(ver.words[3]));
> +	if (flags & BIT(EFX_VER_FLAG(MCFW_EXT_INFO))) {
> +		build_id = MCDI_DWORD(outbuf, GET_VERSION_V2_OUT_MCFW_BUILD_ID);
> +		snprintf(&buf[offset], EFX_MAX_VERSION_INFO_LEN - offset,
> +			 " (%x) %s", build_id,
> +			 MCDI_PTR(outbuf, GET_VERSION_V2_OUT_MCFW_BUILD_NAME));
> +	}
> +	devlink_info_version_running_put(req,
> +					 DEVLINK_INFO_VERSION_GENERIC_FW_MGMT,
> +					 buf);
> +
> +	if (flags & BIT(EFX_VER_FLAG(SUCFW_EXT_INFO))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V2_OUT_SUCFW_VERSION);
> +		tstamp = MCDI_QWORD(outbuf,
> +				    GET_VERSION_V2_OUT_SUCFW_BUILD_DATE);
> +		rtc_time64_to_tm(tstamp, &build_date);
> +		build_id = MCDI_DWORD(outbuf, GET_VERSION_V2_OUT_SUCFW_CHIP_ID);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN,
> +			 "%u.%u.%u.%u type %x (%ptRd)",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]), le32_to_cpu(ver.dwords[3]),
> +			 build_id, &build_date);
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_FW_MGMT_SUC,
> +						 buf);
> +	}
> +}
> +
> +static void efx_devlink_info_running_v3(struct efx_nic *efx,
> +					struct devlink_info_req *req,
> +					unsigned int flags, efx_dword_t *outbuf)
> +{
> +	char buf[EFX_MAX_VERSION_INFO_LEN];
> +	union {
> +		const __le32 *dwords;
> +		const __le16 *words;
> +		const char *str;
> +	} ver;
> +
> +	if (flags & BIT(EFX_VER_FLAG(DATAPATH_HW_VERSION))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V3_OUT_DATAPATH_HW_VERSION);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]));
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_DATAPATH_HW,
> +						 buf);
> +	}
> +
> +	if (flags & BIT(EFX_VER_FLAG(DATAPATH_FW_VERSION))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V3_OUT_DATAPATH_FW_VERSION);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]));
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_DATAPATH_FW,
> +						 buf);
> +	}
> +}
> +
> +static void efx_devlink_info_running_v4(struct efx_nic *efx,
> +					struct devlink_info_req *req,
> +					unsigned int flags, efx_dword_t *outbuf)
> +{
> +	char buf[EFX_MAX_VERSION_INFO_LEN];
> +	union {
> +		const __le32 *dwords;
> +		const __le16 *words;
> +		const char *str;
> +	} ver;
> +
> +	if (flags & BIT(EFX_VER_FLAG(SOC_BOOT_VERSION))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V4_OUT_SOC_BOOT_VERSION);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]),
> +			 le32_to_cpu(ver.dwords[3]));
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_SOC_BOOT,
> +						 buf);
> +	}
> +
> +	if (flags & BIT(EFX_VER_FLAG(SOC_UBOOT_VERSION))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V4_OUT_SOC_UBOOT_VERSION);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]),
> +			 le32_to_cpu(ver.dwords[3]));
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_SOC_UBOOT,
> +						 buf);
> +	}
> +
> +	if (flags & BIT(EFX_VER_FLAG(SOC_MAIN_ROOTFS_VERSION))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +					GET_VERSION_V4_OUT_SOC_MAIN_ROOTFS_VERSION);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]),
> +			 le32_to_cpu(ver.dwords[3]));
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_SOC_MAIN,
> +						 buf);
> +	}
> +
> +	if (flags & BIT(EFX_VER_FLAG(SOC_RECOVERY_BUILDROOT_VERSION))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V4_OUT_SOC_RECOVERY_BUILDROOT_VERSION);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]),
> +			 le32_to_cpu(ver.dwords[3]));
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_SOC_RECOVERY,
> +						 buf);
> +	}
> +
> +	if (flags & BIT(EFX_VER_FLAG(SUCFW_VERSION)) &&
> +	    ~flags & BIT(EFX_VER_FLAG(SUCFW_EXT_INFO))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V4_OUT_SUCFW_VERSION);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]),
> +			 le32_to_cpu(ver.dwords[3]));
> +
> +		devlink_info_version_running_put(req,
> +						 EFX_DEVLINK_INFO_VERSION_FW_MGMT_SUC,
> +						 buf);
> +	}
> +}
> +
> +static void efx_devlink_info_running_v5(struct efx_nic *efx,
> +					struct devlink_info_req *req,
> +					unsigned int flags, efx_dword_t *outbuf)
> +{
> +	char buf[EFX_MAX_VERSION_INFO_LEN];
> +	union {
> +		const __le32 *dwords;
> +		const __le16 *words;
> +		const char *str;
> +	} ver;
> +
> +	if (flags & BIT(EFX_VER_FLAG(BOARD_VERSION))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V5_OUT_BOARD_VERSION);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]),
> +			 le32_to_cpu(ver.dwords[3]));
> +
> +		devlink_info_version_running_put(req,
> +						 DEVLINK_INFO_VERSION_GENERIC_BOARD_REV,
> +						 buf);
> +	}
> +
> +	if (flags & BIT(EFX_VER_FLAG(BUNDLE_VERSION))) {
> +		ver.dwords = (__le32 *)MCDI_PTR(outbuf,
> +						GET_VERSION_V5_OUT_BUNDLE_VERSION);
> +
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +			 le32_to_cpu(ver.dwords[0]), le32_to_cpu(ver.dwords[1]),
> +			 le32_to_cpu(ver.dwords[2]),
> +			 le32_to_cpu(ver.dwords[3]));
> +
> +		devlink_info_version_running_put(req,
> +						 DEVLINK_INFO_VERSION_GENERIC_FW_BUNDLE_ID,
> +						 buf);
> +	}
> +}
> +
> +static int efx_devlink_info_running_versions(struct efx_nic *efx,
> +					     struct devlink_info_req *req)
> +{
> +	MCDI_DECLARE_BUF(outbuf, MC_CMD_GET_VERSION_V5_OUT_LEN);
> +	MCDI_DECLARE_BUF(inbuf, MC_CMD_GET_VERSION_EXT_IN_LEN);
> +	char buf[EFX_MAX_VERSION_INFO_LEN];
> +	union {
> +		const __le32 *dwords;
> +		const __le16 *words;
> +		const char *str;
> +	} ver;
> +	size_t outlength;
> +	unsigned int flags;
> +	int rc;
> +
> +	rc = efx_mcdi_rpc(efx, MC_CMD_GET_VERSION, inbuf, sizeof(inbuf),
> +			  outbuf, sizeof(outbuf), &outlength);
> +	if (rc || outlength < MC_CMD_GET_VERSION_OUT_LEN) {
> +		netif_err(efx, drv, efx->net_dev,
> +			  "mcdi MC_CMD_GET_VERSION failed\n");
> +		return rc;
> +	}
> +
> +	/* Handle previous output */
> +	if (outlength < MC_CMD_GET_VERSION_V2_OUT_LEN) {
> +		ver.words = (__le16 *)MCDI_PTR(outbuf,
> +					       GET_VERSION_EXT_OUT_VERSION);
> +		snprintf(buf, EFX_MAX_VERSION_INFO_LEN, "%u.%u.%u.%u",
> +			 le16_to_cpu(ver.words[0]),
> +			 le16_to_cpu(ver.words[1]),
> +			 le16_to_cpu(ver.words[2]),
> +			 le16_to_cpu(ver.words[3]));
> +
> +		devlink_info_version_running_put(req,
> +						 DEVLINK_INFO_VERSION_GENERIC_FW_MGMT,
> +						 buf);
> +		return 0;
> +	}
> +
> +	/* Handle V2 additions */
> +	flags = MCDI_DWORD(outbuf, GET_VERSION_V2_OUT_FLAGS);
> +	efx_devlink_info_running_v2(efx, req, flags, outbuf);
> +
> +	if (outlength < MC_CMD_GET_VERSION_V3_OUT_LEN)
> +		return 0;
> +
> +	/* Handle V3 additions */
> +	efx_devlink_info_running_v3(efx, req, flags, outbuf);
> +
> +	if (outlength < MC_CMD_GET_VERSION_V4_OUT_LEN)
> +		return 0;
> +
> +	/* Handle V4 additions */
> +	efx_devlink_info_running_v4(efx, req, flags, outbuf);
> +
> +	if (outlength < MC_CMD_GET_VERSION_V5_OUT_LEN)
> +		return 0;
> +
> +	/* Handle V5 additions */
> +	efx_devlink_info_running_v5(efx, req, flags, outbuf);
> +
> +	return 0;
> +}
> +
> +#define EFX_MAX_SERIALNUM_LEN	(ETH_ALEN * 2 + 1)
> +
> +static int efx_devlink_info_board_cfg(struct efx_nic *efx,
> +				      struct devlink_info_req *req)
> +{
> +	char sn[EFX_MAX_SERIALNUM_LEN];
> +	u8 mac_address[ETH_ALEN];
> +	int rc;
> +
> +	rc = efx_mcdi_get_board_cfg(efx, (u8 *)mac_address, NULL, NULL);
> +	if (!rc) {
> +		snprintf(sn, EFX_MAX_SERIALNUM_LEN, "%pm", mac_address);
> +		devlink_info_serial_number_put(req, sn);
> +	}
> +	return rc;
> +}
> +
> +static int efx_devlink_info_get(struct devlink *devlink,
> +				struct devlink_info_req *req,
> +				struct netlink_ext_ack *extack)
> +{
> +	struct efx_devlink *devlink_private = devlink_priv(devlink);
> +	struct efx_nic *efx = devlink_private->efx;
> +	int rc;
> +
> +	/* Several different MCDI commands are used. We report first error
> +	 * through extack along with total number of errors. Specific error
> +	 * information via system messages.
> +	 */
> +	rc = efx_devlink_info_board_cfg(efx, req);
> +	if (rc) {
> +		NL_SET_ERR_MSG_MOD(extack, "Getting board info failed");
> +		return rc;
> +	}
> +	rc = efx_devlink_info_stored_versions(efx, req);
> +	if (rc) {
> +		NL_SET_ERR_MSG_MOD(extack, "Getting stored versions failed");
> +		return rc;
> +	}
> +	rc = efx_devlink_info_running_versions(efx, req);
> +	if (rc) {
> +		NL_SET_ERR_MSG_MOD(extack, "Getting running versions failed");
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
>  static const struct devlink_ops sfc_devlink_ops = {
> +#ifdef CONFIG_SFC_SRIOV
> +	.info_get			= efx_devlink_info_get,
> +#endif
>  };
>  
>  void efx_fini_devlink_lock(struct efx_nic *efx)
> diff --git a/drivers/net/ethernet/sfc/efx_devlink.h b/drivers/net/ethernet/sfc/efx_devlink.h
> index 8ff85b035e87..a5269361c3e0 100644
> --- a/drivers/net/ethernet/sfc/efx_devlink.h
> +++ b/drivers/net/ethernet/sfc/efx_devlink.h
> @@ -14,6 +14,23 @@
>  #include "net_driver.h"
>  #include <net/devlink.h>
>  
> +/* Custom devlink-info version object names for details that do not map to the
> + * generic standardized names.
> + */
> +#define EFX_DEVLINK_INFO_VERSION_FW_MGMT_SUC	"fw.mgmt.suc"
> +#define EFX_DEVLINK_INFO_VERSION_FW_MGMT_CMC	"fw.mgmt.cmc"
> +#define EFX_DEVLINK_INFO_VERSION_FPGA_REV	"fpga.rev"
> +#define EFX_DEVLINK_INFO_VERSION_DATAPATH_HW	"fpga.app"
> +#define EFX_DEVLINK_INFO_VERSION_DATAPATH_FW	DEVLINK_INFO_VERSION_GENERIC_FW_APP
> +#define EFX_DEVLINK_INFO_VERSION_SOC_BOOT	"coproc.boot"
> +#define EFX_DEVLINK_INFO_VERSION_SOC_UBOOT	"coproc.uboot"
> +#define EFX_DEVLINK_INFO_VERSION_SOC_MAIN	"coproc.main"
> +#define EFX_DEVLINK_INFO_VERSION_SOC_RECOVERY	"coproc.recovery"
> +#define EFX_DEVLINK_INFO_VERSION_FW_EXPROM	"fw.exprom"
> +#define EFX_DEVLINK_INFO_VERSION_FW_UEFI	"fw.uefi"
> +
> +#define EFX_MAX_VERSION_INFO_LEN	64
> +
>  int efx_probe_devlink_and_lock(struct efx_nic *efx);
>  void efx_probe_devlink_unlock(struct efx_nic *efx);
>  void efx_fini_devlink_lock(struct efx_nic *efx);
> diff --git a/drivers/net/ethernet/sfc/mcdi.c b/drivers/net/ethernet/sfc/mcdi.c
> index af338208eae9..2442e33225a6 100644
> --- a/drivers/net/ethernet/sfc/mcdi.c
> +++ b/drivers/net/ethernet/sfc/mcdi.c
> @@ -2175,6 +2175,80 @@ int efx_mcdi_get_privilege_mask(struct efx_nic *efx, u32 *mask)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_SFC_SRIOV
> +int efx_mcdi_nvram_metadata(struct efx_nic *efx, unsigned int type,
> +			    u32 *subtype, u16 version[4], char *desc,
> +			    size_t descsize)
> +{
> +	MCDI_DECLARE_BUF(inbuf, MC_CMD_NVRAM_METADATA_IN_LEN);
> +	efx_dword_t *outbuf;
> +	size_t outlen;
> +	u32 flags;
> +	int rc;
> +
> +	outbuf = kzalloc(MC_CMD_NVRAM_METADATA_OUT_LENMAX_MCDI2, GFP_KERNEL);
> +	if (!outbuf)
> +		return -ENOMEM;
> +
> +	MCDI_SET_DWORD(inbuf, NVRAM_METADATA_IN_TYPE, type);
> +
> +	rc = efx_mcdi_rpc_quiet(efx, MC_CMD_NVRAM_METADATA, inbuf,
> +				sizeof(inbuf), outbuf,
> +				MC_CMD_NVRAM_METADATA_OUT_LENMAX_MCDI2,
> +				&outlen);
> +	if (rc)
> +		goto out_free;
> +	if (outlen < MC_CMD_NVRAM_METADATA_OUT_LENMIN) {
> +		rc = -EIO;
> +		goto out_free;
> +	}
> +
> +	flags = MCDI_DWORD(outbuf, NVRAM_METADATA_OUT_FLAGS);
> +
> +	if (desc && descsize > 0) {
> +		if (flags & BIT(MC_CMD_NVRAM_METADATA_OUT_DESCRIPTION_VALID_LBN)) {
> +			if (descsize <=
> +			    MC_CMD_NVRAM_METADATA_OUT_DESCRIPTION_NUM(outlen)) {
> +				rc = -E2BIG;
> +				goto out_free;
> +			}
> +
> +			strncpy(desc,
> +				MCDI_PTR(outbuf, NVRAM_METADATA_OUT_DESCRIPTION),
> +				MC_CMD_NVRAM_METADATA_OUT_DESCRIPTION_NUM(outlen));
> +			desc[MC_CMD_NVRAM_METADATA_OUT_DESCRIPTION_NUM(outlen)] = '\0';
> +		} else {
> +			desc[0] = '\0';
> +		}
> +	}
> +
> +	if (subtype) {
> +		if (flags & BIT(MC_CMD_NVRAM_METADATA_OUT_SUBTYPE_VALID_LBN))
> +			*subtype = MCDI_DWORD(outbuf, NVRAM_METADATA_OUT_SUBTYPE);
> +		else
> +			*subtype = 0;
> +	}
> +
> +	if (version) {
> +		if (flags & BIT(MC_CMD_NVRAM_METADATA_OUT_VERSION_VALID_LBN)) {
> +			version[0] = MCDI_WORD(outbuf, NVRAM_METADATA_OUT_VERSION_W);
> +			version[1] = MCDI_WORD(outbuf, NVRAM_METADATA_OUT_VERSION_X);
> +			version[2] = MCDI_WORD(outbuf, NVRAM_METADATA_OUT_VERSION_Y);
> +			version[3] = MCDI_WORD(outbuf, NVRAM_METADATA_OUT_VERSION_Z);
> +		} else {
> +			version[0] = 0;
> +			version[1] = 0;
> +			version[2] = 0;
> +			version[3] = 0;
> +		}
> +	}
> +
> +out_free:
> +	kfree(outbuf);
> +	return rc;
> +}
> +#endif
> +
>  #ifdef CONFIG_SFC_MTD
>  
>  #define EFX_MCDI_NVRAM_LEN_MAX 128
> diff --git a/drivers/net/ethernet/sfc/mcdi.h b/drivers/net/ethernet/sfc/mcdi.h
> index 7e35fec9da35..32f54ce2492e 100644
> --- a/drivers/net/ethernet/sfc/mcdi.h
> +++ b/drivers/net/ethernet/sfc/mcdi.h
> @@ -378,6 +378,11 @@ int efx_mcdi_nvram_info(struct efx_nic *efx, unsigned int type,
>  			size_t *size_out, size_t *erase_size_out,
>  			bool *protected_out);
>  int efx_new_mcdi_nvram_test_all(struct efx_nic *efx);
> +#ifdef CONFIG_SFC_SRIOV
> +int efx_mcdi_nvram_metadata(struct efx_nic *efx, unsigned int type,
> +			    u32 *subtype, u16 version[4], char *desc,
> +			    size_t descsize);
> +#endif
>  int efx_mcdi_nvram_test_all(struct efx_nic *efx);
>  int efx_mcdi_handle_assertion(struct efx_nic *efx);
>  int efx_mcdi_set_id_led(struct efx_nic *efx, enum efx_led_mode mode);
> -- 
> 2.17.1
