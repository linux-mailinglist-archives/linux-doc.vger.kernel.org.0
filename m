Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BAD316FD1
	for <lists+linux-doc@lfdr.de>; Wed, 10 Feb 2021 20:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234551AbhBJTOu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Feb 2021 14:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234541AbhBJTOg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Feb 2021 14:14:36 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4EC8C06174A
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 11:13:56 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id p193so3135763yba.4
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 11:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9tOqcLFPGtBJA35TM92FKNxWnaOl6vWWHEx3bmxeU4c=;
        b=XFODFH/7aQvtIfr1O4SP9Wqe5MlKRy2+5dSSHkXHfVH+R+9OU/TOZ09pDYnsl2vv6f
         7cEH0Z6UoELRKGzsUtNvmrtDQBC7r/G6Qbtc6/JSVfpXccP4PLau8NMeL9A/OubRwHB1
         VcQgYnA99MaEy+19EMwjObrtrLHqOsWNZCG7glqOH4z70X5XE+yqXhvDlsdiAQ/u3YSN
         Knm1TcpqnE53hNrSXGIaZ1BOedUnzxDSf5jrLpOiLeIOK5pwSMexOYyGY2xjXBi3ngV8
         8z+ArJgCyMQcwrbbGYQ++ExEvF/KSID9fcTT6i+zsJoDK7PfrUfv724oQwAHLyzfxRpH
         jSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9tOqcLFPGtBJA35TM92FKNxWnaOl6vWWHEx3bmxeU4c=;
        b=fCfOEBoAqXDdYO4SlJk60bWaB6L1F+VE9qeW9JwEfhju9sinvom+7aIK4zi2xdQI4P
         5OvrQJbtkWjARi4lAoex8KmMZlyG8dAdIk1t5UmhdMX30s7o2SSZ0PuQbyqa01daWFqG
         nJnXxYlDDK3wA7yCsNLjwmLo5621eorjKch55/LBlT4iFVtCeg9sdkkvMIKHiKxeKOU5
         tb0+LuFrLibbqioereNgo5KFtEFUVX9OtrCWlxzSXj9a/wzL20Gg2LrNnRN2H8jWfBvn
         Ri1aNYe7YoGhhy5fvysOnvlISTrk5x79TXVNDXDZZ6TLGPARHEgvec5L0f27S3SNuzhz
         IysA==
X-Gm-Message-State: AOAM533Rb8zuo4NkxnA35vFHdYLnvYu4/9bHcIOIf9a6eu3OGg0zsNXr
        xRBAecVOCWKpWwkZ15ERqvc8yS23+J4n0AbiJaF2HQ==
X-Google-Smtp-Source: ABdhPJyWPzmY+tyazkCwj4t0k4KGhEheNTDTa4+Z3XmMbe8kh4uk1AUlS/mwh8JLpJB4vJDlgZWe56Y+dIqi6GwmOz8=
X-Received: by 2002:a05:6902:1025:: with SMTP id x5mr6466442ybt.96.1612984436001;
 Wed, 10 Feb 2021 11:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20210205222644.2357303-9-saravanak@google.com> <20210210114435.122242-1-tudor.ambarus@microchip.com>
In-Reply-To: <20210210114435.122242-1-tudor.ambarus@microchip.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 10 Feb 2021 11:13:19 -0800
Message-ID: <CAGETcx-aztut-RkZTjyGfzBGYLBQQDnaVFRQMMVTMPMA7Xs3Hg@mail.gmail.com>
Subject: Re: [PATCH] clk: Mark fwnodes when their clock provider is added
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Brown, Len" <len.brown@intel.com>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 10, 2021 at 3:44 AM Tudor Ambarus
<tudor.ambarus@microchip.com> wrote:
>
> This is a follow-up for:
> commit 3c9ea42802a1 ("clk: Mark fwnodes when their clock provider is added/removed")
>
> The above commit updated the deprecated of_clk_add_provider(),
> but missed to update the preferred of_clk_add_hw_provider().
> Update it now.

Thanks Tudor! Good catch!

I checked to make sure the deregistration path undoes this one. So, it
looks good to me.

Reviewed-by: Saravana Kannan <saravanak@google.com>

-Saravana

>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/clk/clk.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 27ff90eacb1f..9370e4dfecae 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4594,6 +4594,8 @@ int of_clk_add_hw_provider(struct device_node *np,
>         if (ret < 0)
>                 of_clk_del_provider(np);
>
> +       fwnode_dev_initialized(&np->fwnode, true);
> +
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_clk_add_hw_provider);
> --
> 2.25.1
>
