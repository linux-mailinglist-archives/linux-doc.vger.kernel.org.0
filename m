Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7493143F0
	for <lists+linux-doc@lfdr.de>; Tue,  9 Feb 2021 00:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhBHXhC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Feb 2021 18:37:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhBHXg4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 18:36:56 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6646C061793
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 15:35:34 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id y128so16319035ybf.10
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 15:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8+WfYcK1+ZV8R23zYWi1zlMlBGGvpKMkA8UnDsJm1Oc=;
        b=aq0w3Rjj+uR7KU5tlbnt8SRF9CFdEuy0AjgqgYqNKMir3fsFHUIThfxfnu6aqGB7eT
         vs+u57fNuc/O7ZRw5aKGWiem1cEzcuXK+XxIdxgfxTBXHmTIQp3KZHyvYv3tdTODaAav
         QoqPkDQGqZRxy0sKbdCT1rSSH9CVQWQGCrrH6bCFRUureuu+/e1sQxNUJJLoQ7V7oq1C
         /4WafwSXw2fU1fJ/QJAqBNP3vkfOAwZW/LHSpQi4qMfFU4IM0iQKD94nDyXeN9KFJ9pM
         RSovOiSyfkjD/d67bVKM0uYGDgggNUXN0564+kGokV4Qpic30xP48LDt4BmbI0KgTAsy
         trcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8+WfYcK1+ZV8R23zYWi1zlMlBGGvpKMkA8UnDsJm1Oc=;
        b=PgU0zvgisS4csrJZWBfNh1J/dRdrNsKL4T7HD5jOzHXkR0S9k1T1IvbEd1+dDrf78D
         xU8ENmgOszKaIOaS07P6j+zA4I6oGTRE5N/FH+v+IbcUObNTKTC4JaQreWl0U9TpSou0
         ta8ghspeb9FWuDkR1OaeVtLLj1OwrBB8/Hi/7A9x7kXK23lp6YtVyoUm30cNiVoJsxea
         0il1t3DJBgA2CBnp+Qy86Y4bmg6pcgVQkA8a4zpNbgDQtjEHenKFTEZ14zna0b5jwMOt
         jUJ65EIlmRZTzzYSiCwdhT9R/PFaoJEHNy64PEoCGWZV47ujh0jLEzURF8kJLVj9AhhF
         kNaA==
X-Gm-Message-State: AOAM531mFSkbZmRsJVrmKJep+Ap4WFxyEyZ3sn570kYmq8eYC/9pOZ4H
        /nNwofB9rM+LC+ijjiTPQsiRcO+OwSj4S3AflhDjbg==
X-Google-Smtp-Source: ABdhPJxvfXuvovy4qYPt4qo+kIvhWQQydMERIf2YxT9yDyTigYeTY9JT7AKMlyJ6w7jOmvoinijXVeHNTqdDkwzfQ44=
X-Received: by 2002:a25:aa43:: with SMTP id s61mr2791520ybi.32.1612827333706;
 Mon, 08 Feb 2021 15:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20210205222644.2357303-1-saravanak@google.com>
 <20210205222644.2357303-9-saravanak@google.com> <CAL_JsqJc8XRAL5Bj5LpH0M528K7ZL=wSqt8t=ibwjWutjCgB-Q@mail.gmail.com>
In-Reply-To: <CAL_JsqJc8XRAL5Bj5LpH0M528K7ZL=wSqt8t=ibwjWutjCgB-Q@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 8 Feb 2021 15:34:57 -0800
Message-ID: <CAGETcx9Ynzqx5vo+mqi9EGr+bVs8MBzO5sHhZiT+sB8Q_+7dPA@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] clk: Mark fwnodes when their clock provider is added/removed
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:ACPI FOR ARM64 (ACPI/arm64)" <linux-acpi@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 8, 2021 at 7:39 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Feb 5, 2021 at 4:27 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > This allows fw_devlink to recognize clock provider drivers that don't
> > use the device-driver model to initialize the device. fw_devlink will
> > use this information to make sure consumers of such clock providers
> > aren't indefinitely blocked from probing, waiting for the power domain
> > device to appear and bind to a driver.
>
> Don't we have cases that are a mixture? IOW, a subset of the clock
> provider is initialized early, then the full driver takes over. You'd
> want consumers that are not a driver to succeed, but drivers to defer
> until the full driver is up.

You probably just made a typo, but to clarify, this is about ignoring
suppliers that never bind. So, in your case the clock device is the
supplier.

To answer your question, consumer devices added after the full
supplier driver takes over will still have device links created to the
supplier clock device. But consumers added before the full driver
takes over won't. So, nothing is worse off with fw_devlink=on and we
get way more dependency tracking (device links) created than what we
have today.

-Saravana
