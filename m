Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21E33323BB
	for <lists+linux-doc@lfdr.de>; Tue,  9 Mar 2021 12:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCILPB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Mar 2021 06:15:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhCILOk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 06:14:40 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E14AC061760
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 03:14:36 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id u18so20116243ljd.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 03:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cKjwO43AjsBJoUH6JaO2Y5XWi3uHramUf/9ys8jvzbs=;
        b=IUkDYmdXyRJ+5eqh5KaFAAav9I7fgeq5aJkWK2UclTqJ3DaNd+VsjtR5q06fui9WXK
         vf1b4BTQklr/p9t2OGjzoduMVlfBvwaj3ZUXvEqaVil5eQ58ERriPFCI1276Lsm6E6Qs
         znM0/daP+ANcymrxL2HJMHsf3oYJryKxg26zlCQD+Kc2UQQmxQgGPEgsVc9cbkWUrJM5
         OY1THL0sfTB7KwJoDZEP4MEuBBMsFX/hYfnG4jbPcM1l0OR8uWhn+3csn+h8lstYLR97
         aVaZd1sB5lMIEo3EID8BZM1zBgsfWLRilssJzwaU/hlIgt7TkVBHy9cXXDdV2y5bNAzU
         5P0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cKjwO43AjsBJoUH6JaO2Y5XWi3uHramUf/9ys8jvzbs=;
        b=RQGsrPhiBh+5pMoEm5IM98MIe5IwNy8p8FQpyVopqOrFjnS6sa8CNIeEmd67wCKj10
         SGLiWQ4Veb4Jn5RMewAHtlMRkXv18t9H5oZRqaPRSnfpH0za5vJr2GHVx/aNbL7AWgnM
         aT8Gk6lPdGbbJaYXNWZpM9+ulXFfDsgDg3+8RJu0KEmYT88AsEGdXY1BXumvWnXZ5Y1Q
         lAyWRdMPVTrJLAcExMNMfCsEFCIU+QU9tGDeN5Qw/z1oGIjrPndqlPYDVSw/drvQg+KJ
         jIpwBGasj1LkynG3ZzV9SU36WY4KPkKXn/IGgKAm9LZjrb4+3jLiW6lcJCTEk++XkPOj
         z81g==
X-Gm-Message-State: AOAM530mej6rpp8Tx1Xp5Ms4h2SIHThQbhxjRXOSilocaU+x7oBSHVE6
        K6efiQ2HiJz/UhajL4sLPJOGS9L1xDNW+t263UDuQw==
X-Google-Smtp-Source: ABdhPJxUU43eMEhovgOv2iI7axC0yDatB6+NKL+zAY6DqrP12n8/hW5rse6yj9rlUf5G+F44LP2/X+q/+bxXKVOpV4k=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr16537048ljc.200.1615288474745;
 Tue, 09 Mar 2021 03:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20210304213902.83903-1-marcan@marcan.st> <20210304213902.83903-13-marcan@marcan.st>
 <CAL_JsqJF2Hz=4U7FR_GOSjCxqt3dpf-CAWFNfsSrDjDLpHqgCA@mail.gmail.com>
 <6e4880b3-1fb6-0cbf-c1a5-7a46fd9ccf62@marcan.st> <CAK8P3a0Hmwt-ywzS-2eEmqyQ0v2SxLsLxFwfTUoWwbzCrBNhsQ@mail.gmail.com>
 <CAL_JsqJHRM59GC3FjvaGLCELemy1uspnGvTEFH6q0OdyBPVSjA@mail.gmail.com>
 <CAK8P3a0_GBB-VYFO5NaySyBJDN2Ra-WMH4WfFrnzgOejmJVG8g@mail.gmail.com> <20210308211306.GA2920998@robh.at.kernel.org>
In-Reply-To: <20210308211306.GA2920998@robh.at.kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 12:14:23 +0100
Message-ID: <CACRpkdZd_PU-W37szfGL7J2RYWhZzXdX342vt93H7mWXdh5iHA@mail.gmail.com>
Subject: Re: [RFT PATCH v3 12/27] of/address: Add infrastructure to declare
 MMIO as non-posted
To:     Rob Herring <robh@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, Hector Martin <marcan@marcan.st>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>, Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        DTML <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 8, 2021 at 10:13 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Mar 08, 2021 at 09:29:54PM +0100, Arnd Bergmann wrote:

> > This is obviously more work for the drivers, but at least it keeps
> > the common code free of the hack while also allowing drivers to
> > use ioremap_np() intentionally on other platforms.
>
> I don't agree. The problem is within the interconnect. The device and
> its driver are unaware of this.

If it is possible that a driver needs to use posted access on one
SoC and nonposted on another SoC then clearly the nature
of the access need to be part of the memory access abstraction,
obviously ioremap() one way or another.

Having the driver conditionally use different ioremap_*
functions depending on SoC seems awkward. We had different
execution paths for OF and ACPI drivers and have been working
hard to create fwnode to abstract this away for drivers used with
both abstractions for example. If we can hide it from drivers
from day 1 I think we can save maintenance costs in the long
run.

Given that the Apple silicon through it's heritage from Samsung
S3C (the genealogy is unclear to me) already share drivers with
this platform, this seems to already be the case so it's not a
theoretical use case.

The core argument here seems to be "will this become common
practice or is it an Apple-ism?"

That is a question to someone who is deep down there
synthesizing SoCs. It appears the market for custom silicon
laptops has just begun. There are people that can answer this
question but I doubt that we have access to them or that they
would tell us. What is an educated guess? It seems Arnds
position is that it's an Apple-ism and I kind of trust him on this.
At the same time I know that in emerging markets, what
copycats are likely to do is say "give me exactly what Apple
has, exactly that thing".

Just my =E2=82=AC0.01
Linus Walleij
