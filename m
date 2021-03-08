Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C881E330CB0
	for <lists+linux-doc@lfdr.de>; Mon,  8 Mar 2021 12:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhCHLum (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Mar 2021 06:50:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:52844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229813AbhCHLuR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 8 Mar 2021 06:50:17 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6D5365126;
        Mon,  8 Mar 2021 11:50:16 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lJEOs-000Jso-M8; Mon, 08 Mar 2021 11:50:14 +0000
Date:   Mon, 08 Mar 2021 11:50:13 +0000
Message-ID: <875z21zwy2.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hector Martin <marcan@marcan.st>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFT PATCH v3 16/27] irqchip/apple-aic: Add support for the Apple Interrupt Controller
In-Reply-To: <CAHp75Vco_rcjHJ4THLZ8CJP=yX2fesfAo_tOY8zohfSmTLEVgw@mail.gmail.com>
References: <20210304213902.83903-1-marcan@marcan.st>
        <20210304213902.83903-17-marcan@marcan.st>
        <CAHp75Vco_rcjHJ4THLZ8CJP=yX2fesfAo_tOY8zohfSmTLEVgw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: andy.shevchenko@gmail.com, marcan@marcan.st, linux-arm-kernel@lists.infradead.org, robh@kernel.org, arnd@kernel.org, olof@lixom.net, krzk@kernel.org, mark.kettenis@xs4all.nl, tony@atomide.com, mohamed.mediouni@caramail.com, stan@corellium.com, graf@amazon.com, will@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, corbet@lwn.net, catalin.marinas@arm.com, hch@infradead.org, davem@davemloft.net, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 05 Mar 2021 15:05:08 +0000,
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

[...]

> > +#define TIMER_FIRING(x)                                                        \
> > +       (((x) & (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_MASK |            \
> > +                ARCH_TIMER_CTRL_IT_STAT)) ==                                  \
> > +        (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT))
> 
> It's a bit hard to read. Perhaps
> 
> #define FOO_MASK  (_ENABLE | _STAT)
> #define _FIRING ... (FOO_MASK | _MASK == FOO_MASK)

The expression above is a direct translation of the architecture
reference manual, and I'd rather not have that hidden behind a bunch
of obscure macros.

[...]

> > +       irqc->hw_domain = irq_domain_create_linear(of_node_to_fwnode(node),
> > +                                                  irqc->nr_hw + AIC_NR_FIQ,
> > +                                                  &aic_irq_domain_ops, irqc);
> 
> If you are sure it will be always OF-only, why not to use
> irq_domain_add_linear()?

The OF-only API is deprecated, and there is no point in using it for
*new* code, specially when things like IPI allocation require the use
of the modern API. For arm64 root controllers, that's the way to go.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
