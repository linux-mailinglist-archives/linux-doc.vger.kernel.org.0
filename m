Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55973DF31C
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2019 18:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfJUQ3g (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Oct 2019 12:29:36 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33951 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfJUQ3g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Oct 2019 12:29:36 -0400
Received: by mail-io1-f68.google.com with SMTP id q1so16714428ion.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2019 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QksSY7CHcsQDyvWI4aoDqfiItjXy21p3bY0J2xZiASM=;
        b=N2tR06QrZWO4pmNyszIUZ+mxDRLHqpDfaebBQiujkukbcGEn1nnWelQEh1zW5RszWK
         2QtqJF2PylOtdATK/B0p4TaLf69RBYVw15TjWRfhd0sibIYSks1mC9DEjXiWFJ2VvuYS
         mdpk5L/S4TyX1yW4cVGS3yhFPJr/vI0bhuzR+ZQqOrvFQsfoBm69ELhcHralfCp2NZnr
         GdGXAjMx61tr2o56NxBMEGxGtCDWXxYx6XIRqvxrXXvU8XfOVd+TgR51BPSnvWY9moUx
         jevVahV8kaGtJrIz73lfFIpCLsneYFOTrDpQ8vNnVrzBjebaobIDBsBlFGrU4AbQX96R
         9OJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QksSY7CHcsQDyvWI4aoDqfiItjXy21p3bY0J2xZiASM=;
        b=ZIjaabfGAj1crSL5FLxYeVn6zgehwyDElYT3SXja9iFEaDEXRVUwVJDIuaTf+fDJz0
         eGf7OHB4h3xXt0IMVKNOK+NS6rFA3hcshO8eARyFaS4x/QXYndgVAk1M7VBVdld31K/6
         KcKrZk/iHREOxbqyHRSXMzup6Bq4d79q8FBUPiTaU0HugwXCx0p+Vu585GKxDL1DM4PO
         LipwKCFk9tEjUcse1Tbm8Db9xC2c9pYYZTM4oWkPAyBIaBmO4DKSTole9dLXJkUrg6FE
         GHYAJAaKOMoSTtDJ8kDE3g70YjHfW2Ni1UEqQgHzrxp9yizElr4iFtQBb6ztI3WTHLZ3
         H07g==
X-Gm-Message-State: APjAAAWdtSUgwYO8P57Iu7zNI523dvZBGeLmTvqZF9EhwPlf/7DOiZ3a
        92unJcyJX2EZ1uTyea8YNYocrMLMdLtVk2Mjp+ZSvg==
X-Google-Smtp-Source: APXvYqySRfm1mH1L9jhvI5Jtz5amTa5nTOjvdKqiMYSyVlh9AaeuaMbimiFuiPr7MXVNzXnlztnF+f8r43m1ytzkdE4=
X-Received: by 2002:a02:920f:: with SMTP id x15mr22552675jag.57.1571675375419;
 Mon, 21 Oct 2019 09:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191006053916.8849-1-brgl@bgdev.pl> <CAMRc=Me3Q=67fCDrFM38LAGXCd+apJybLYVfyrfwmwYa5L1CmQ@mail.gmail.com>
 <CAK8P3a3tUg4SBtO0xb2GAHfegp23WF4TLymzqFfra2-fGLRO7w@mail.gmail.com>
In-Reply-To: <CAK8P3a3tUg4SBtO0xb2GAHfegp23WF4TLymzqFfra2-fGLRO7w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Oct 2019 18:29:24 +0200
Message-ID: <CAMRc=Me8g2gFiag0UQwuu4UZONcowQw900+MUbGF+4-E0z09Zg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

pon., 21 pa=C5=BA 2019 o 17:53 Arnd Bergmann <arnd@arndb.de> napisa=C5=82(a=
):
>
> On Mon, Oct 21, 2019 at 5:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > niedz., 6 pa=C5=BA 2019 o 07:39 Bartosz Golaszewski <brgl@bgdev.pl> nap=
isa=C5=82(a):
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > Bartosz Golaszewski (8):
> > >   Documentation: devres: add missing entry for
> > >     devm_platform_ioremap_resource()
> > >   lib: devres: prepare devm_ioremap_resource() for more variants
> > >   lib: devres: provide devm_ioremap_resource_wc()
> > >   drivers: platform: provide devm_platform_ioremap_resource_wc()
> > >   misc: sram: use devm_platform_ioremap_resource_wc()
> > >   drivers: provide devm_platform_ioremap_resource_byname()
> > >   gpio: mvebu: use devm_platform_ioremap_resource_byname()
> > >   gpio: tegra186: use devm_platform_ioremap_resource_byname()
> > >
> > >  .../driver-api/driver-model/devres.rst        |  4 ++
> > >  drivers/base/platform.c                       | 39 +++++++++++-
> > >  drivers/gpio/gpio-mvebu.c                     | 19 +++---
> > >  drivers/gpio/gpio-tegra186.c                  |  4 +-
> > >  drivers/misc/sram.c                           | 28 +++------
> > >  include/linux/device.h                        |  2 +
> > >  include/linux/platform_device.h               |  6 ++
> > >  lib/devres.c                                  | 62 +++++++++++++----=
--
> > >  8 files changed, 108 insertions(+), 56 deletions(-)
> >
> > Greg, Arnd,
> >
> > gentle ping for this. I noticed that some maintainers are complaining
> > about being spammed with patches converting old drivers to using
> > devm_platform_ioremap_resource() and there's even a patch removing the
> > relevant coccinelle script on the list, but I think for new drivers
> > these are still useful. Do you want to pick them up for v5.5 (or at
> > all)?
>
> I think this series is useful and we should merge it. Are there any
> remaining dependencies or conflicts with Christoph Hellwig's recent
> __ioremap rework? If there are, I would prioritize his work and maybe
> delay this one by another merge window, otherwise please add
> my Reviewed-by to all patches and resend them for Greg to pick
> up (provided he has no objections).
>
>         Arnd

Is Christoph's work in next? The series doesn't apply cleanly on next,
I needed to fix a couple conflicts. What branch should I rebase it on
before resending?

Bart
