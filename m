Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDCF2603D8
	for <lists+linux-doc@lfdr.de>; Mon,  7 Sep 2020 19:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgIGRze (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Sep 2020 13:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgIGLWK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Sep 2020 07:22:10 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0142C0617A0
        for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2020 04:05:10 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id g128so13497196iof.11
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2020 04:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D7L/Q4DJFDyy3wME7bzPuJcv0cvFqGwJhESn1U89F5s=;
        b=nSd/soCN0apStHfecRk/s8TMfk39mqUYPzh0zB/X6CwR4xUJSFFU0FnKp+tCRk7Dxr
         dxSOcRUml8zVB79Fm2ThAGwZhIwsZ9OPmOav7mp6gqCv2iIgBSeA1XcFFigkWUwrAK5g
         9ndJPPydL6JRbTIBSOe3jO9NlRlqGqnPBFwmtIdWaVf0VLsqOiLVD+eqxcWPZTRO07W7
         is0PyDyIhur30ZJJ3E4ZHzRu488xo7wU4cH2gwBwuSF1nT5thgx8mQqsqsWBwrJymYo4
         fK3WRuZDjVxGovSSlKSdckuotXq/ExsbHzIplL+6mbf3IlXZbkQt1rlDd+5u09yoRPvf
         zCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D7L/Q4DJFDyy3wME7bzPuJcv0cvFqGwJhESn1U89F5s=;
        b=F8Uw1e5Nm1jbimBIklzrwIF4McANtPIPJjZQdbvoJbuOtKA5BD49fTUwVQczV/Bi44
         aBf3ghngaEXxDZoGQmhAv4uFZGVkmLQWTSeD0DHHGcFI+eIOXmqqarIyADV6Rqb/CW5q
         povF5MMkpqzoc7rm3XFKtEbQUyHhtjRH7ymVHSHZRKvnpK7sX96QqB50jOtIzmZiWZPq
         qVeHVLMFY4MlEyxi2wwGY9zKfdVCVtGUmywizTTqoAaNetXeyJ8Zd5MybL17yhOhcVdf
         ZuRTzYeD+ngDs1dgAjUwVMRSP5XVov0Di+qo4bWvXp9NWdk9TFJgk6yQ8FMaeFY2Ea5B
         VCgQ==
X-Gm-Message-State: AOAM532BCOIVxcLzpH2zQr2oCIIFqrLaGD7a7x03iAgbyBbX7JZPvrr+
        2L1Edghpze4NJ/El35uwd4EQOgIbTKEiVjUD0I/9EQ==
X-Google-Smtp-Source: ABdhPJz3NFAUNOM8h+eBu94NlN0+qbyZT3uPxFzJlrWhGBVdmuhRiYP3jSvAoS1qQWhXj2axsT/rlnUltkSo/hZcc5c=
X-Received: by 2002:a02:7817:: with SMTP id p23mr8145520jac.57.1599476710278;
 Mon, 07 Sep 2020 04:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-11-brgl@bgdev.pl>
 <20200904170028.GG1891694@smile.fi.intel.com>
In-Reply-To: <20200904170028.GG1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Sep 2020 13:04:59 +0200
Message-ID: <CAMRc=Mc3V_BJ88CrB_q0uTHjvqVf5XEkm6BJZwrVjnVhPjiYaQ@mail.gmail.com>
Subject: Re: [PATCH 10/23] gpio: mockup: fix resource leak in error path
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 4, 2020 at 7:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 04, 2020 at 05:45:34PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > If the module init function fails after creating the debugs directory,
> > it's never removed. Add proper cleanup calls to avoid this resource
> > leak.
>
> Does it fix existing bug?

You mean - should it go into stable? The bug is quite unlikely but
yeah, probably.

Bart
