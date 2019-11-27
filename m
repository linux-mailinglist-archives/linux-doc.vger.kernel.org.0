Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E371B10B5AB
	for <lists+linux-doc@lfdr.de>; Wed, 27 Nov 2019 19:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfK0SZw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Nov 2019 13:25:52 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46998 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfK0SZw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Nov 2019 13:25:52 -0500
Received: by mail-pg1-f196.google.com with SMTP id k1so2932611pga.13
        for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2019 10:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/aGiNLNkgqmK+Ic4v75bKgp1beaP/B+nguMS9Alorxw=;
        b=CK36WCskuagYWlL/QBw0gmeJADWMcx51VGZgVGoom+8gQRWivOLVFq61SYrdDmlfQC
         7pPU/jqXAZ57VqtOxrPNfidgUf7tV5ard03RqVDB0PK1kjfz8f7bAtwLaRiKjaddPYhK
         XFbdo+luhU4a+udiiSjB+97Qo7zk1CE3yEKRoZuECf7yRXo4zS8hGlCvwe5/ysicfzrL
         itWqaRg/zRJQWPrHtIcYToxb6NOcSdqkIWbv4/aHfW0rzFYO/fyY22937tPD2iiCm9Zg
         4pUGjEuJfGJF4jXj2SvpIWDue4VCEx9iuu4lYNDw8cc7EAV1TRN4TRn2cTDqed8SRpA0
         NjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/aGiNLNkgqmK+Ic4v75bKgp1beaP/B+nguMS9Alorxw=;
        b=rB6nVHmSMKvSjZdI6cOYpoqQ+sNiCBcAPaTIIVSWNKIoIKZO0hEUOzm4mx8IyI2N6g
         enXOSMAq9o2qfCtaMTcg6kPPhZnbTJ3VW0WfqLJ5un+aNsnJ8DKQMznshbJ87nDKWemM
         /6nQ9uvgPlJoSPO4wUdpQZxuYWajKlD6Khokd5ursGeVTUY65kTpCKG7uHqmDcTHMltn
         Gf3Ev5Vg/0nu8DYLoOUBmhp81LewIpXemo8z9uELw+LGbtxDvoXqTkz1FA17vRi8NJ9o
         kMGFuC/C9onk3zGiYObsdqfhtEHAGgn+jtyIW98iaMtuGdFMDSQI456dBHJeIidWXwm5
         4bYw==
X-Gm-Message-State: APjAAAV4MSNkuaw0jXIX5piL0k5hYcWTYfCeEEuaD79W1mT6w3VsCmDi
        EAqV/c6Xh9oAtUryO3VHQd2OFg==
X-Google-Smtp-Source: APXvYqw2UqAle3xV+prQR4aoFJSpPBGSSioUV1u09by9FkG2hd1cnqITzwgGcIWMC0RkGo0M2eA6+Q==
X-Received: by 2002:a63:fb4f:: with SMTP id w15mr6679826pgj.346.1574879151115;
        Wed, 27 Nov 2019 10:25:51 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id v24sm17277002pfn.53.2019.11.27.10.25.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 10:25:50 -0800 (PST)
Date:   Wed, 27 Nov 2019 11:25:48 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        suzuki.poulose@arm.com
Subject: Re: [PATCH v5 11/14] dt-bindings: arm: Juno platform - add CTI
 entries to device tree.
Message-ID: <20191127182548.GC26544@xps15>
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-12-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119231912.12768-12-mike.leach@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 19, 2019 at 11:19:09PM +0000, Mike Leach wrote:
> Add in CTI entries for Juno r0, r1 and r2 to device tree entries.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi    | 150 +++++++++++++++++++++-
>  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi |  31 ++++-
>  arch/arm64/boot/dts/arm/juno-r1.dts       |  25 ++++
>  arch/arm64/boot/dts/arm/juno-r2.dts       |  25 ++++
>  arch/arm64/boot/dts/arm/juno.dts          |  25 ++++
>  5 files changed, 251 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 26a039a028b8..4db2eca87dbf 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -108,7 +108,7 @@
>  	 * The actual size is just 4K though 64K is reserved. Access to the
>  	 * unmapped reserved region results in a DECERR response.
>  	 */
> -	etf@20010000 { /* etf0 */
> +	etf_sys0: etf@20010000 { /* etf0 */
>  		compatible = "arm,coresight-tmc", "arm,primecell";
>  		reg = <0 0x20010000 0 0x1000>;
>  
> @@ -132,7 +132,7 @@
>  		};
>  	};
>  
> -	tpiu@20030000 {
> +	tpiu_sys: tpiu@20030000 {
>  		compatible = "arm,coresight-tpiu", "arm,primecell";
>  		reg = <0 0x20030000 0 0x1000>;
>  
> @@ -185,7 +185,7 @@
>  		};
>  	};
>  
> -	etr@20070000 {
> +	etr_sys: etr@20070000 {
>  		compatible = "arm,coresight-tmc", "arm,primecell";
>  		reg = <0 0x20070000 0 0x1000>;
>  		iommus = <&smmu_etr 0>;
> @@ -203,7 +203,7 @@
>  		};
>  	};
>  
> -	stm@20100000 {
> +	stm_sys: stm@20100000 {
>  		compatible = "arm,coresight-stm", "arm,primecell";
>  		reg = <0 0x20100000 0 0x1000>,
>  		      <0 0x28000000 0 0x1000000>;
> @@ -280,6 +280,18 @@
>  		};
>  	};
>  
> +	cti0: cti@22020000 {
> +		compatible = "arm,coresight-cti", "arm,primecell";
> +		reg = <0 0x22020000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		power-domains = <&scpi_devpd 0>;
> +
> +		arm,cti-v8-arch;
> +		arm,cs-dev-assoc = <&etm0>;
> +	};
> +
>  	funnel@220c0000 { /* cluster0 funnel */
>  		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>  		reg = <0 0x220c0000 0 0x1000>;
> @@ -340,6 +352,18 @@
>  		};
>  	};
>  
> +	cti1: cti@22120000 {
> +		compatible = "arm,coresight-cti", "arm,primecell";
> +		reg = <0 0x22120000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		power-domains = <&scpi_devpd 0>;
> +
> +		arm,cti-v8-arch;
> +		arm,cs-dev-assoc = <&etm1>;
> +	};
> +
>  	cpu_debug2: cpu-debug@23010000 {
>  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
>  		reg = <0x0 0x23010000 0x0 0x1000>;
> @@ -365,6 +389,18 @@
>  		};
>  	};
>  
> +	cti2: cti@23020000 {
> +		compatible = "arm,coresight-cti", "arm,primecell";
> +		reg = <0 0x23020000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		power-domains = <&scpi_devpd 0>;
> +
> +		arm,cti-v8-arch;
> +		arm,cs-dev-assoc = <&etm2>;
> +	};
> +
>  	funnel@230c0000 { /* cluster1 funnel */
>  		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>  		reg = <0 0x230c0000 0 0x1000>;
> @@ -437,6 +473,18 @@
>  		};
>  	};
>  
> +	cti3: cti@23120000 {
> +		compatible = "arm,coresight-cti", "arm,primecell";
> +		reg = <0 0x23120000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		power-domains = <&scpi_devpd 0>;
> +
> +		arm,cti-v8-arch;
> +		arm,cs-dev-assoc = <&etm3>;
> +	};
> +
>  	cpu_debug4: cpu-debug@23210000 {
>  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
>  		reg = <0x0 0x23210000 0x0 0x1000>;
> @@ -462,6 +510,18 @@
>  		};
>  	};
>  
> +	cti4: cti@23220000 {
> +		compatible = "arm,coresight-cti", "arm,primecell";
> +		reg = <0 0x23220000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		power-domains = <&scpi_devpd 0>;
> +
> +		arm,cti-v8-arch;
> +		arm,cs-dev-assoc = <&etm4>;
> +	};
> +
>  	cpu_debug5: cpu-debug@23310000 {
>  		compatible = "arm,coresight-cpu-debug", "arm,primecell";
>  		reg = <0x0 0x23310000 0x0 0x1000>;
> @@ -487,6 +547,88 @@
>  		};
>  	};
>  
> +	cti5: cti@23320000 {
> +		compatible = "arm,coresight-cti", "arm,primecell";
> +		reg = <0 0x23320000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		power-domains = <&scpi_devpd 0>;
> +
> +		arm,cti-v8-arch;
> +		arm,cs-dev-assoc = <&etm5>;
> +	};
> +
> +
> +	cti@20020000 { /* sys_cti_0 */
> +		compatible = "arm,coresight-cti", "arm,primecell";
> +		reg = <0 0x20020000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		power-domains = <&scpi_devpd 0>;
> +
> +		trig-conns@0 {
> +			arm,trig-in-sigs=<2 3>;
> +			arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> +			arm,trig-out-sigs=<0 1>;
> +			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +			arm,cs-dev-assoc = <&etr_sys>;
> +		};
> +
> +		trig-conns@1 {
> +			arm,trig-in-sigs=<0 1>;
> +			arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> +			arm,trig-out-sigs=<7 6>;
> +			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +			arm,cs-dev-assoc = <&etf_sys0>;
> +		};
> +
> +		trig-conns@2 {
> +			arm,trig-in-sigs=<4 5 6 7>;
> +			arm,trig-in-types=<STM_TOUT_SPTE STM_TOUT_SW
> +					   STM_TOUT_HETE STM_ASYNCOUT>;
> +			arm,trig-out-sigs=<4 5>;
> +			arm,trig-out-types=<STM_HWEVENT STM_HWEVENT>;
> +			arm,cs-dev-assoc = <&stm_sys>;
> +		};
> +
> +		trig-conns@3 {
> +			arm,trig-out-sigs=<2 3>;
> +			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +			arm,cs-dev-assoc = <&tpiu_sys>;
> +		};
> +	};
> +
> +	cti@20110000 { /* sys_cti_1 */
> +		compatible = "arm,coresight-cti", "arm,primecell";
> +		reg = <0 0x20110000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		power-domains = <&scpi_devpd 0>;
> +
> +		trig-conns@0 {
> +			arm,trig-in-sigs=<0>;
> +			arm,trig-in-types=<GEN_INTREQ>;
> +			arm,trig-out-sigs=<0>;
> +			arm,trig-out-types=<GEN_HALTREQ>;
> +			arm,trig-conn-name = "sys_profiler";
> +		};
> +
> +		trig-conns@1 {
> +			arm,trig-out-sigs=<2 3>;
> +			arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +			arm,trig-conn-name = "watchdog";
> +		};
> +
> +		trig-conns@2 {
> +			arm,trig-out-sigs=<1 6>;
> +			arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +			arm,trig-conn-name = "g_counter";
> +		};
> +	};
> +
>  	sram: sram@2e000000 {
>  		compatible = "arm,juno-sram-ns", "mmio-sram";
>  		reg = <0x0 0x2e000000 0x0 0x8000>;
> diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> index eda3d9e18af6..308f4eee8b29 100644
> --- a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> @@ -23,7 +23,7 @@
>  		};
>  	};
>  
> -	etf@20140000 { /* etf1 */
> +	etf_sys1: etf@20140000 { /* etf1 */
>  		compatible = "arm,coresight-tmc", "arm,primecell";
>  		reg = <0 0x20140000 0 0x1000>;
>  
> @@ -82,4 +82,33 @@
>  
>  		};
>  	};
> +
> +	cti@20160000 { /* sys_cti_2 */
> +		compatible = "arm,coresight-cti", "arm,primecell";
> +		reg = <0 0x20160000 0 0x1000>;
> +
> +		clocks = <&soc_smc50mhz>;
> +		clock-names = "apb_pclk";
> +		power-domains = <&scpi_devpd 0>;
> +
> +		trig-conns@0 {
> +			arm,trig-in-sigs=<0 1>;
> +			arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> +			arm,trig-out-sigs=<0 1>;
> +			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +			arm,cs-dev-assoc = <&etf_sys1>;
> +		};
> +
> +		trig-conns@1 {
> +			arm,trig-in-sigs=<2 3 4>;
> +			arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
> +			arm,trig-conn-name = "ela_clus_0";
> +		};
> +
> +		trig-conns@2 {
> +			arm,trig-in-sigs=<5 6 7>;
> +			arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
> +			arm,trig-conn-name = "ela_clus_1";
> +		};
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
> index 5f290090b0cf..02aa51eb311d 100644
> --- a/arch/arm64/boot/dts/arm/juno-r1.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> @@ -9,6 +9,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  #include "juno-base.dtsi"
>  #include "juno-cs-r1r2.dtsi"
>  
> @@ -309,3 +310,27 @@
>  &cpu_debug5 {
>  	cpu = <&A53_3>;
>  };
> +
> +&cti0 {
> +	cpu = <&A57_0>;
> +};
> +
> +&cti1 {
> +	cpu = <&A57_1>;
> +};
> +
> +&cti2 {
> +	cpu = <&A53_0>;
> +};
> +
> +&cti3 {
> +	cpu = <&A53_1>;
> +};
> +
> +&cti4 {
> +	cpu = <&A53_2>;
> +};
> +
> +&cti5 {
> +	cpu = <&A53_3>;
> +};
> diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
> index 305300dd521c..75bb27c2d4dc 100644
> --- a/arch/arm64/boot/dts/arm/juno-r2.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r2.dts
> @@ -9,6 +9,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  #include "juno-base.dtsi"
>  #include "juno-cs-r1r2.dtsi"
>  
> @@ -315,3 +316,27 @@
>  &cpu_debug5 {
>  	cpu = <&A53_3>;
>  };
> +
> +&cti0 {
> +	cpu = <&A72_0>;
> +};
> +
> +&cti1 {
> +	cpu = <&A72_1>;
> +};
> +
> +&cti2 {
> +	cpu = <&A53_0>;
> +};
> +
> +&cti3 {
> +	cpu = <&A53_1>;
> +};
> +
> +&cti4 {
> +	cpu = <&A53_2>;
> +};
> +
> +&cti5 {
> +	cpu = <&A53_3>;
> +};
> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
> index f00cffbd032c..dbc22e70b62c 100644
> --- a/arch/arm64/boot/dts/arm/juno.dts
> +++ b/arch/arm64/boot/dts/arm/juno.dts
> @@ -9,6 +9,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  #include "juno-base.dtsi"
>  
>  / {
> @@ -295,3 +296,27 @@
>  &cpu_debug5 {
>  	cpu = <&A53_3>;
>  };
> +
> +&cti0 {
> +	cpu = <&A57_0>;
> +};
> +
> +&cti1 {
> +	cpu = <&A57_1>;
> +};
> +
> +&cti2 {
> +	cpu = <&A53_0>;
> +};
> +
> +&cti3 {
> +	cpu = <&A53_1>;
> +};
> +
> +&cti4 {
> +	cpu = <&A53_2>;
> +};
> +
> +&cti5 {
> +	cpu = <&A53_3>;
> +};

Same comment for these files - Liviu, Sudeep and Lorenzo will need to be CC'ed. 

> -- 
> 2.17.1
> 
