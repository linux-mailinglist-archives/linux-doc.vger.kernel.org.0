Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC13355B1D
	for <lists+linux-doc@lfdr.de>; Tue,  6 Apr 2021 20:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237108AbhDFSQb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Apr 2021 14:16:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:44054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236444AbhDFSQa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 14:16:30 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 20996613B3;
        Tue,  6 Apr 2021 18:16:22 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lTqFQ-005uvp-1y; Tue, 06 Apr 2021 19:16:20 +0100
Date:   Tue, 06 Apr 2021 19:16:18 +0100
Message-ID: <87ft03p9cd.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Hector Martin <marcan@marcan.st>
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 15/18] irqchip/apple-aic: Add support for the Apple Interrupt Controller
In-Reply-To: <20210402090542.131194-16-marcan@marcan.st>
References: <20210402090542.131194-1-marcan@marcan.st>
        <20210402090542.131194-16-marcan@marcan.st>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: marcan@marcan.st, linux-arm-kernel@lists.infradead.org, robh@kernel.org, arnd@kernel.org, olof@lixom.net, krzk@kernel.org, mark.kettenis@xs4all.nl, tony@atomide.com, mohamed.mediouni@caramail.com, stan@corellium.com, graf@amazon.com, will@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, andy.shevchenko@gmail.com, corbet@lwn.net, catalin.marinas@arm.com, hch@infradead.org, davem@davemloft.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Hector,

On Fri, 02 Apr 2021 10:05:39 +0100,
Hector Martin <marcan@marcan.st> wrote:
> 
> This is the root interrupt controller used on Apple ARM SoCs such as the
> M1. This irqchip driver performs multiple functions:
> 
> * Handles both IRQs and FIQs
> 
> * Drives the AIC peripheral itself (which handles IRQs)
> 
> * Dispatches FIQs to downstream hard-wired clients (currently the ARM
>   timer).
> 
> * Implements a virtual IPI multiplexer to funnel multiple Linux IPIs
>   into a single hardware IPI
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  MAINTAINERS                     |   2 +
>  drivers/irqchip/Kconfig         |   8 +
>  drivers/irqchip/Makefile        |   1 +
>  drivers/irqchip/irq-apple-aic.c | 837 ++++++++++++++++++++++++++++++++
>  include/linux/cpuhotplug.h      |   1 +
>  5 files changed, 849 insertions(+)
>  create mode 100644 drivers/irqchip/irq-apple-aic.c

[...]

> +static int aic_irq_domain_translate(struct irq_domain *id,
> +				    struct irq_fwspec *fwspec,
> +				    unsigned long *hwirq,
> +				    unsigned int *type)
> +{
> +	struct aic_irq_chip *ic = id->host_data;
> +
> +	if (fwspec->param_count != 3 || !is_of_node(fwspec->fwnode))
> +		return -EINVAL;
> +
> +	switch (fwspec->param[0]) {
> +	case AIC_IRQ:
> +		if (fwspec->param[1] >= ic->nr_hw)
> +			return -EINVAL;
> +		*hwirq = fwspec->param[1];
> +		break;
> +	case AIC_FIQ:
> +		if (fwspec->param[1] >= AIC_NR_FIQ)
> +			return -EINVAL;
> +		*hwirq = ic->nr_hw + fwspec->param[1];
> +
> +		/*
> +		 * In EL1 the non-redirected registers are the guest's,
> +		 * not EL2's, so remap the hwirqs to match.
> +		 */
> +		if (!is_kernel_in_hyp_mode()) {
> +			switch (fwspec->param[1]) {
> +			case AIC_TMR_GUEST_PHYS:
> +				*hwirq = ic->nr_hw + AIC_TMR_HV_PHYS;
> +				break;
> +			case AIC_TMR_GUEST_VIRT:
> +				*hwirq = ic->nr_hw + AIC_TMR_HV_VIRT;
> +				break;
> +			case AIC_TMR_HV_PHYS:
> +			case AIC_TMR_HV_VIRT:
> +				return -ENOENT;
> +			default:
> +				break;
> +			}
> +		}

Urgh, this is nasty. You are internally remapping the hwirq from one
timer to another in order to avoid accessing the enable register
which happens to be an EL2 only register?

The way we normally deal with this kind of things is by providing a
different set of irq_chip callbacks. In this particular case, this
would leave mask/unmask as empty stubs. Or you could move the FIQ
handling to use handle_simple_irq(), because there isn't any callback
that is actually applicable.

It isn't a big deal for now, but that's something we should consider
addressing in the future. With that in mind:

Reviewed-by: Marc Zyngier <maz@kernel.org>

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
