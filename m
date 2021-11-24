Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C26145B96F
	for <lists+linux-doc@lfdr.de>; Wed, 24 Nov 2021 12:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240836AbhKXLuy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Nov 2021 06:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbhKXLuy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Nov 2021 06:50:54 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E3CC061574
        for <linux-doc@vger.kernel.org>; Wed, 24 Nov 2021 03:47:44 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id r25so9068285edq.7
        for <linux-doc@vger.kernel.org>; Wed, 24 Nov 2021 03:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQHkGQMRbwlV2X6v9gZ8r5Fj5KrluPJpcxhCcMkVPsA=;
        b=f1to1KC72xBbiGARC+SE+4GPB1WnRPifDgHoaaUIIAa5QeW5qeGwQh0NT0aQAFqLez
         RqWZErHFUX+57FwCcfyWfl2+lRh2EPK2PzVQLXeQzV9YV6/U4KkHUdjx2Sh5E7Hwt8tt
         bhO2r8xPIXDH8JIhOm2cBuXE58p8FHaErhmQBpTZIQHsaeCh8x3jQxtRNzs1XJ+UHprL
         AMCyVyVXIa+x6YscCgdaOLaKMwfSam67xO/qYv2iLAwCa8VtFdzvZBImCQqY1k5xrVmj
         r0cjQrZNUmwssNd3rz2WLOBeAEd9re64NURK/NSRZkMztkrtP1Bmizbnz3gSdmvA+zuF
         iLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQHkGQMRbwlV2X6v9gZ8r5Fj5KrluPJpcxhCcMkVPsA=;
        b=XMCt2tPDYGpJjbAqV3jvZjIqDckGiLI8XiTgD/Rxr8Aax7HqtPJacBw2KseTBKelIY
         MywWl5x/6LstmrXNaKnBaLI1DRkOnyupmu25eAd5NMIEPOVzEiy7DkwfHuez/qYCEyb8
         NAy4EWrc6OJeB2aK9QD1RWpAG9Td7PxHo5WwWJcgllhY1ZDc7v15zEzwk6rTd8fq4RdB
         d9pMxxtZAiz7w5YSu/zWfY4gTJGEqVrld9FH8FQee6sHuEHoQMcih2q7OkrJBagCTT4R
         iIHIGEFvgBg6cSaipLWr+faJNudFkoowAFL403x+pX7DC2lHUA4xkCD1JAwSi8dUfHOi
         mQqA==
X-Gm-Message-State: AOAM531yNKtlWU3ZdlMpomtQbYZ/t03byaSpmNTn2FmGH27U9vlWbqI4
        j7hDx1iCrTwsdTEesi+bWU4sJgln2+3Jmk95opkObg==
X-Google-Smtp-Source: ABdhPJxjrkK9w0QGaOG7YGLxsSY/kyJR0/6HPIGbb9vpEroIK+ub1dtHysZ5pwXH45RvBIRnqsRxbGGLWAKTcr6JlEo=
X-Received: by 2002:a50:ef02:: with SMTP id m2mr23346820eds.172.1637754463129;
 Wed, 24 Nov 2021 03:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20211123164902.35370-1-wsa+renesas@sang-engineering.com> <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211123164902.35370-2-wsa+renesas@sang-engineering.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 Nov 2021 12:47:32 +0100
Message-ID: <CAMRc=McG6fn_VX7+OPXUWjX1tYozQPg1eyEz-3fJMx35DiXimg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] gpio: add sloppy logic analyzer using polling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 23, 2021 at 5:49 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Hi Wolfram!

I'm seeing you're using debugfs for this module (both for
configuration as well as control). How about using configfs + sysfs?
I'd argue that debugfs isn't really the right interface for a useful
tool that is this LA.

Bart
