Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F1E420435
	for <lists+linux-doc@lfdr.de>; Mon,  4 Oct 2021 00:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhJCWEI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 3 Oct 2021 18:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbhJCWEH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Oct 2021 18:04:07 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1CBC061780
        for <linux-doc@vger.kernel.org>; Sun,  3 Oct 2021 15:02:19 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x27so63015356lfa.9
        for <linux-doc@vger.kernel.org>; Sun, 03 Oct 2021 15:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sryZZWOb+Z8lt57Kp1waSiIepNfRLtFgQuykU/s70UY=;
        b=vrk9/2uJIRZZxlXfTkUaUVXdhC99Q+8vIzJoCDlBhZZqzDclY3nateRSufwL1SVC2N
         dt25zKGwP472R1HYjBxNzox9NHqPDwSVxstNecwC/BEaHUZYPAi3p/LleUtbnqdlgash
         Lc8R0Q38Tjxde6KiMMj4iecFSZ9YhzUTEdK19lQD9M53D3z2cIZtXow3HbkIh1abYQvS
         zsQ3eUO1fvcNc2vJFgIP9q8EqKgw/PfznsZx16yxyEfpsDd8hIBOUOaq9SRhshi6WCoE
         uKIgidfHdNIdPNHVZ9BJyE5PFdJWot2sFTHs3868v/ib1Xln+3XA7YSEnDhQkoT2NHv8
         NqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sryZZWOb+Z8lt57Kp1waSiIepNfRLtFgQuykU/s70UY=;
        b=eU3vQ5SjmtfCHdBT+CouDNuVHbtg2m+AsY3XIIXXLBnUrsNy4+KoBTGfVHBWRPGR22
         m8QfFgpAP8tLl+03mSx2xUOYkUYH5Rx9IFgj7TQeilnf70wftGQCyz3EkmdRTIjKzzjU
         wF006nTt+T2gsaGg2zA4ARbgqQGaEYiNWlMK6u6ZA1MnBF1/zKXKs48Y9QxaRaQbrMI/
         tjltxbfKPzuov4MNRVuX/AXrKyGbdoYAJbbFyyOQIoGF7/7ThhOK5fXx9hOgKssvZ+Gm
         a9hYnfAW4I//eNkokspJ+OxHXMM754V5XsptdC1nGa+bE1h8H+3lUxNit3kGcKSFGgN5
         8B2A==
X-Gm-Message-State: AOAM533NaCZyKKXCPRXhB965Hb5WRaDR6f2flEsm9EorezPg9YqkJv/y
        BKQvd1gTDvK7AHeYWHwaEVjiRkz1TyF+ew3mIflnaA==
X-Google-Smtp-Source: ABdhPJyZK4OJYvU+mdcWAQOrh2+vdlNRlc0qq1hNRXAX9txSIOFqUHqzfk2zSxeKXbOyzyILb2hsjIestzb0c9Ric3M=
X-Received: by 2002:a19:c10a:: with SMTP id r10mr9127968lff.95.1633298537543;
 Sun, 03 Oct 2021 15:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210930232617.6396-1-dipenp@nvidia.com> <20210930232617.6396-10-dipenp@nvidia.com>
In-Reply-To: <20210930232617.6396-10-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Oct 2021 00:02:06 +0200
Message-ID: <CACRpkdZqB=abQ-p4muj2myn2E7tzrc2+YnFKs4fQogxmZX+x9g@mail.gmail.com>
Subject: Re: [RFC v2 09/11] tools: gpio: Add new hardware clock type
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 1, 2021 at 1:26 AM Dipen Patel <dipenp@nvidia.com> wrote:

> gpiolib-cdev is extended to support hardware clock type, this
> patch reflects that fact.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
