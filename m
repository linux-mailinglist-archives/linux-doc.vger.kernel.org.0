Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A2479F56D
	for <lists+linux-doc@lfdr.de>; Thu, 14 Sep 2023 01:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbjIMXYJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Sep 2023 19:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbjIMXYI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Sep 2023 19:24:08 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F971BCF
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 16:24:04 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c1e128135aso2774345ad.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 16:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694647444; x=1695252244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=McEVX1hx5k8f+NcqiKTD/lVS9HGO2QYi1j8mbG944+c=;
        b=nfSprJwJVGxMYiZX6YXuG9lWVv8JSryTkdx3gsOj8IG+vs8bj+7g7pgu9PHCjJda+B
         /wut+R4zuX/TFDfRj6ed7mWP8vIdHsqE0u3CeFH2Djx71QM80nBglEwaLiEHPKfmfx/0
         Qu45pTW7IOEdyVCNXH+oFD+1Q7kojdqfovvs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694647444; x=1695252244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McEVX1hx5k8f+NcqiKTD/lVS9HGO2QYi1j8mbG944+c=;
        b=ZPmNsITCGj04ZgSRvAba12GzFuBgAPdx+4o2LUTAL7md20Lkx3YNTNf7laML9XSi6k
         rEfifK++fliJ/1eGfc6gOqCzfkpd6AVArW6xAmRMS+S4pkpQcF2Fa4pByYuuAlHaC4dW
         I4MHrGFoQE5OWqyftJWtWYQRshrgOgrHno1aY9KeLv3vthC8ZUHsl0UeW2NLRkNgFVIB
         GfoWIMaNwCGDhYo0o4n6hlVDwaAL0P4lR6fxNGcSKd3sbEOHwMdh+k4fa4lslKiHdN98
         pkodShIqv+SmV+naPY/sT/lvrqjFu0T21/Gs7LztfO+WA0OLJhNneLfE6I3IEI2m0Klx
         pnVQ==
X-Gm-Message-State: AOJu0Yx4I52dIknQTWwNljzIT+SkiF428Y0OERcHEFDEmQhRcKJ34OHL
        VtF1M7RqJtYt9VG4o694FrY5bw==
X-Google-Smtp-Source: AGHT+IEhoRu0Lao0AX88usO4EFB8BidZ06eLDfk+p1OxG1nODfcmpktTieCBSCEMoiWnY1czPMaLqw==
X-Received: by 2002:a17:902:d2c4:b0:1c0:d575:d28 with SMTP id n4-20020a170902d2c400b001c0d5750d28mr4287074plc.50.1694647444198;
        Wed, 13 Sep 2023 16:24:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j21-20020a170902c3d500b001bb8895848bsm163538plj.71.2023.09.13.16.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 16:24:03 -0700 (PDT)
Date:   Wed, 13 Sep 2023 16:24:02 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        tony.luck@intel.com, gpiccoli@igalia.com,
        mathieu.poirier@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, linus.walleij@linaro.org,
        andy.shevchenko@gmail.com, vigneshr@ti.com, nm@ti.com,
        matthias.bgg@gmail.com, kgene@kernel.org, alim.akhtar@samsung.com,
        bmasney@redhat.com, quic_tsoni@quicinc.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
Subject: Re: [REBASE PATCH v5 10/17] pstore: Add pstore_region_defined()
 helper and export it
Message-ID: <202309131620.34EB0F6972@keescook>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-11-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694429639-21484-11-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 11, 2023 at 04:23:52PM +0530, Mukesh Ojha wrote:
> There are users like Qualcomm minidump which is interested in
> knowing the pstore frontend addresses and sizes from the backend
> (ram) to be able to register it with firmware to finally collect
> them during crash for debugging.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  fs/pstore/platform.c   | 15 +++++++++++++++
>  fs/pstore/ram.c        | 42 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pstore.h |  6 ++++++
>  3 files changed, 63 insertions(+)
> 
> diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
> index e5bca9a004cc..fdac951059c1 100644
> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -139,6 +139,21 @@ enum pstore_type_id pstore_name_to_type(const char *name)
>  }
>  EXPORT_SYMBOL_GPL(pstore_name_to_type);
>  
> +int pstore_region_defined(struct pstore_record *record,
> +			  void **virt, phys_addr_t *phys,
> +			  size_t *size, unsigned int *max_dump_cnt)
> +{
> +	if (!psinfo)
> +		return -EINVAL;
> +
> +	record->psi = psinfo;

Uh, this makes no sense to me. If this is a real pstore_record, you
cannot just assign psi here.

> +
> +	return psinfo->region_info ?
> +	       psinfo->region_info(record, virt, phys, size, max_dump_cnt) :
> +	       -EINVAL;

Common code style for this kind of thing is usually like this:

	if (!psinfo->region_info)
		return -EINVAL;

	return psinfo->region_info(...)

> +}
> +EXPORT_SYMBOL_GPL(pstore_region_defined);
> +
>  static void pstore_timer_kick(void)
>  {
>  	if (pstore_update_ms < 0)
> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index ab551caa1d2a..62202f3ddf63 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -437,6 +437,47 @@ static int ramoops_pstore_erase(struct pstore_record *record)
>  	return 0;
>  }
>  
> +static int ramoops_region_info(struct pstore_record *record,
> +			       void **virt, phys_addr_t *phys,
> +			       size_t *size, unsigned int *max_dump_cnt)

But there's a larger problem here -- "virt", "phys" and likely
"max_dump_cnt" are aspects _specific to the ram backend_. This can't be
a generic pstore interface.

I'm not opposed to it being exposed only from ramoops, though.

But I think you'll want a pstore generic way to iterate over the
records...

-- 
Kees Cook
