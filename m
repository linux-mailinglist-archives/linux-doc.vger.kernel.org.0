Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0D510B56B
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2019 19:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfK0SS1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Nov 2019 13:18:27 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37767 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK0SS0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Nov 2019 13:18:26 -0500
Received: by mail-pg1-f194.google.com with SMTP id b10so11289196pgd.4
        for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2019 10:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bfDvBw1gAc7BRbE9wfzbKD0CUOm1Td77/KqA/8EW93Y=;
        b=L75u/TCWrHuuNz2+svRbonBxR++aKFIZ/nB4V3ELrN9OTCvbI1xVbKJqXp09gkjQ8D
         bspxuiYCPHGPc69iijiqTNuBE9M/gl6oSjvLuVR5o8wVj1Z7lknXoBQtXU2vYKMAvTnw
         Jn2jhRBf4ItlLCgBsx7RrIh8IfXMB55EA1kCGe1joeHMu37MkHE61Aej3kP5hk9dADn6
         9pav6jOWgTszynKePD3/9son7ZZNrr2CtRezi8orYygUrBd5jzUU9oeDCnKB1ZDhEaPx
         9MPewZhbcBOCVPJGxTSKCKZxUGL1+hEZKHsqg6K6d4/b4Xor1iuArOMeJ+serq99u/Vj
         /VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bfDvBw1gAc7BRbE9wfzbKD0CUOm1Td77/KqA/8EW93Y=;
        b=r+3YA3M+kvPDRu6NFJkXn+x785aFbEnAT0uTB+AUneqfk+gaDCV6yoGLKEqkbOR7Wo
         eOI3nEoKw6Qb3HcUM/EcUszV1mza5JXyJgEtf7f7cM+H9mlllc7/g4j2jAXO5EwTrRIl
         vEuisS8xaxZqyXiUJuWg/7JJE9AEeqjnNzmVGRzJ8BYDEB3A1Wv7sIqiKeA5h/51lMz5
         vnGZrP4nPSNAtd9JW166wsrgvSbkNHOkwpE1OTneqf9KNr1EQTdSKo1ENQTI5ZjsLCH1
         PXqGHuVMXeAc8QAt4ZiVJX7Yg34DIzG6UuFB1fM18wG9QgXhUW73si5WmYS+2NWJBNBo
         OXcQ==
X-Gm-Message-State: APjAAAUVFoLtrXynT7hI7dbIIH/3aSKtQZwWMP/4v/4R5f+uwYyIGZrD
        Sa3jCk2bOMxxLjDMHF3KqSWk0A==
X-Google-Smtp-Source: APXvYqw7DPbnxGIgVZoKtiSPir+1u0Qs/+XHelmwuNmOcwqg/QpNYQm/SfQ9MvP82WXtAcoSykpwHA==
X-Received: by 2002:a63:184c:: with SMTP id 12mr6623165pgy.418.1574878705740;
        Wed, 27 Nov 2019 10:18:25 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c6sm17762524pfj.59.2019.11.27.10.18.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 10:18:25 -0800 (PST)
Date:   Wed, 27 Nov 2019 11:18:23 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        suzuki.poulose@arm.com
Subject: Re: [PATCH v5 10/14] dt-bindings: qcom: Add CTI options for qcom
 msm8916
Message-ID: <20191127181823.GB26544@xps15>
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-11-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119231912.12768-11-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 19, 2019 at 11:19:08PM +0000, Mike Leach wrote:
> Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
> (Dragonboard DB410C).
> System CTIs 2-11 are omitted as no information available at present.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 85 +++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 5ea9fb8f2f87..9589fc2cba22 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/reset/qcom,gcc-msm8916.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -1357,7 +1358,7 @@
>  			cpu = <&CPU3>;
>  		};
>  
> -		etm@85c000 {
> +		etm0: etm@85c000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85c000 0x1000>;
>  
> @@ -1375,7 +1376,7 @@
>  			};
>  		};
>  
> -		etm@85d000 {
> +		etm1: etm@85d000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85d000 0x1000>;
>  
> @@ -1393,7 +1394,7 @@
>  			};
>  		};
>  
> -		etm@85e000 {
> +		etm2: etm@85e000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85e000 0x1000>;
>  
> @@ -1411,7 +1412,7 @@
>  			};
>  		};
>  
> -		etm@85f000 {
> +		etm3: etm@85f000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85f000 0x1000>;
>  
> @@ -1429,6 +1430,82 @@
>  			};
>  		};
>  
> +		/* System CTIs */
> +		/* CTI 0 - TMC connections */
> +		cti@810000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x810000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		/* CTI 1 - TPIU connections */
> +		cti@811000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x811000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		/* CTIs 2-11 - no information - not instantiated */
> +
> +		/* Core CTIs; CTIs 12-15 */
> +		/* CTI - CPU-0 */
> +		cti@858000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x858000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			arm,cti-v8-arch;
> +			cpu = <&CPU0>;
> +			arm,cs-dev-assoc = <&etm0>;
> +
> +		};
> +
> +		/* CTI - CPU-1 */
> +		cti@859000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x859000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			arm,cti-v8-arch;
> +			cpu = <&CPU1>;
> +			arm,cs-dev-assoc = <&etm1>;
> +		};
> +
> +		/* CTI - CPU-2 */
> +		cti@85a000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x85a000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			arm,cti-v8-arch;
> +			cpu = <&CPU2>;
> +			arm,cs-dev-assoc = <&etm2>;
> +		};
> +
> +		/* CTI - CPU-3 */
> +		cti@85b000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x85b000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			arm,cti-v8-arch;
> +			cpu = <&CPU3>;
> +			arm,cs-dev-assoc = <&etm3>;
> +		};
> +
> +

This looks good to me.  Since Andy Gross maintains this file you will have to CC
him on your next revision.  Right now chances are he hasn't see it. 

>  		venus: video-codec@1d00000 {
>  			compatible = "qcom,msm8916-venus";
>  			reg = <0x01d00000 0xff000>;
> -- 
> 2.17.1
> 
