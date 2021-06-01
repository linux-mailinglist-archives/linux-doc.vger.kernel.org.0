Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BD4393AD5
	for <lists+linux-doc@lfdr.de>; Fri, 28 May 2021 03:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbhE1BBx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 May 2021 21:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbhE1BBw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 May 2021 21:01:52 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06005C061760
        for <linux-doc@vger.kernel.org>; Thu, 27 May 2021 18:00:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id r5so2834616lfr.5
        for <linux-doc@vger.kernel.org>; Thu, 27 May 2021 18:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=93ZOv3R9w2+gpiXYvaeHU2SNm5IHXD8ACSO8RxCmeVo=;
        b=utgwiFQARWZIqVv2gNQCv48NvaMlBgRbTLoiu5ifn1TgggNANvqvs28/D3NyzYsasH
         3D3vprvEGp5oEBY8OH0SrVuAjX1AdKQIT8Ptvs+CkYKDQzy+1IZ8uE6byPkbkUEqYvM5
         rZRoKVsvzEgu0G1Sjcgq54Ut9S54T6J+b2EcnxZ+6wJ1sU39Ty/8APbkg30e0psAvdj0
         O6UcYLYfNiMXu3pUdy+3/LgIVIzXzmAIS3LdnYsLHUfRVh5PriFgGnwXtdWTCTEnonXV
         MgwbUos+P9zm8vYZgUaf5G3127oPQ0H36eneli3SdATF795s3dftlG93R2DkOijiLx6A
         iuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=93ZOv3R9w2+gpiXYvaeHU2SNm5IHXD8ACSO8RxCmeVo=;
        b=cGuXybmuCW6Andx0lxGpzLWaCP4LQzDg9b533CUDdR35Eaq+qIX0Ah7ckpQ+jzjgIM
         TSia7NMewXlYQn6EIzNOpnoD97w1STC/013kKL17mv+LY5v3Mz0onGNE7ZybcZEujs9Z
         GTZPwjZFIu1iZQtPKgJqgO4wTLTlGD45YHk8frpXLfvlkQp2uubgdBr81exsW28ztwXR
         xKuVc63+614Rwse8lH9+Pz2HdIHtMM/PRjeVNiE1wGiSsI/iX+DypHKe2KHXMGEDn2zn
         DziT0Mm74NGRrktB0fnteKe5h1hyRiTJCqRcNyhhbd2JsARKCfbC4GJ2GE+VnynaqJXF
         6Gig==
X-Gm-Message-State: AOAM532kNZRfjL6sn/rdtoZvNdH7bnqFkbKQf8CnVeNX5Oakm0iw4vfZ
        DcUPDANLWpmxaw7fffGjwB4vPw0dugFYUKgISEGn8w==
X-Google-Smtp-Source: ABdhPJz/iZqKsyRMIIVMsAp4xB7R0e4he4kt4V7WYrUgzGvyGCTNONYwk4jmobdjgXcmekS5X2GNhVm7oLeL3oRdicw=
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr3972932lfp.649.1622163614355;
 Thu, 27 May 2021 18:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210527201309.13308-1-dariobin@libero.it>
In-Reply-To: <20210527201309.13308-1-dariobin@libero.it>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 03:00:03 +0200
Message-ID: <CACRpkdYxakJ-C=uPdh7Wf9P2iPQtcsVkVxxHhsx-24oAreOGoQ@mail.gmail.com>
Subject: Re: [PATCH] docs/pinctrl: fix the reference to the u300 platform
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 27, 2021 at 10:13 PM Dario Binacchi <dariobin@libero.it> wrote:

> With commit ce1380c9f4bc ("ARM: remove u300 platform") it is wrong to
> use arch/arm/mach-u300/Kconfig file as example. Since the u300 platform
> has been replaced by the u8500, let's use its Kconfig as example.
>
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

Patch applied!

Yours,
Linus Walleij
