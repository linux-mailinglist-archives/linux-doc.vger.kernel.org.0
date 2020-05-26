Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCCC1D72CF
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2020 10:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgERIUX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 May 2020 04:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgERIUX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 May 2020 04:20:23 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF9BC05BD09
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2020 01:20:23 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v16so4785448ljc.8
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2020 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cWBQhzz5kxNoR9BFp0TP6Ch5JEPPhK+boe7luhQX8WE=;
        b=lzCxMPImw8Rt7qwkKQvXvs4yHXPUCBcSFgZgVKQ1O//DYIZLFdU0vSKui/Goai4MKT
         xzGOdXpFC6fBYraQ5/bglOKFm4zvdR+GQlFCVvUpk2HQXfwDAcFh1u70fVOJ6VXLasU+
         yjC4ArpFTAt05MznUJpxxFnr4qaGbzevmpirg+pnHZQf3hyxYA50KaYPvFy8M4Ix9Vsw
         7CmNiCNqtZExlHmmBkup0WtdyjuF+RwTNb9qxejk1O74cyIWT47Mx0yUrBpBhB0w0N/p
         7DpB2eYveOkZ4EyHcs+xZJHU8763ij0ME6GnBRSzZ8iCJ3Xg9989Oe0v34IPE6J4mp6U
         wGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cWBQhzz5kxNoR9BFp0TP6Ch5JEPPhK+boe7luhQX8WE=;
        b=YjSqAikQR+k6HUCDQuj+xaesYParE4axlbG5L+stXHMrXp5RYNjXbEPweE1ex6rNwo
         6JFn87oeI3Zl5359kLwmQdqtkMcfIv2K9TfbRugvTRzivRpFvEZFODqi3AMvtY7Q5Jk9
         JoPNyWKJ8/f812gSeTzOGUlrCd4fq6+l+ipTUfJA/97cDIkYO8Ucia6rPzhqWfYVQUZq
         pgqAnwG6CHwk4EuiEV6hZo+2lhThS5jNKXt1sqB0FMank2OboFvFmk6/KWe0TenMnvME
         hehkwtTwenDOSwgtamYTFSYQmevTbymWwZt5sDjb+0FXG29ddAkkJHXixN932vwLJ8C5
         WEOA==
X-Gm-Message-State: AOAM530EiwqnynfrwWjvNe0529d3kvts6JgCXYGHwr/uIgI7njhAkhVH
        rgto3+O9LbJ1SY9CGuH2cuUApYgv+97/eEzkkFHcpg==
X-Google-Smtp-Source: ABdhPJy23lR0seQjYixD1vitkrbudfUoFZ0cFs0uEBn+vezhL4JCCG9kC3sBTizi/2x2WCOoPPUTf8nffzPSq1nM6JE=
X-Received: by 2002:a2e:a209:: with SMTP id h9mr10157090ljm.39.1589790021698;
 Mon, 18 May 2020 01:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200511145257.22970-1-geert+renesas@glider.be> <20200511145257.22970-4-geert+renesas@glider.be>
In-Reply-To: <20200511145257.22970-4-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 10:20:10 +0200
Message-ID: <CACRpkdaqSQ4++mhR03pqi0i=uhSyf51WhtE5VOobGNEcMmf09g@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] gpiolib: Add support for GPIO lookup by line name
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 11, 2020 at 4:53 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently a GPIO lookup table can only refer to a specific GPIO by a
> tuple, consisting of a GPIO controller label and a GPIO offset inside
> the controller.
>
> However, a GPIO may also carry a line name, defined by DT or ACPI.
> If present, the line name is the most use-centric way to refer to a
> GPIO.  Hence add support for looking up GPIOs by line name.
> Note that there is no guarantee that GPIO line names are globally
> unique, so this will use the first match found.
>
> Implement this by reusing the existing gpiod_lookup infrastructure.
> Rename gpiod_lookup.chip_label to gpiod_lookup.key, to make it clear
> that this field can have two meanings, and update the kerneldoc and
> GPIO_LOOKUP*() macros.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
> v7:
>   - Document non-uniqueness of line names,
>   - Rebase on top of commit a0b66a73785ccc8f ("gpio: Rename variable in

This is likely the most controversial patch of this series but since
noone seems to be especially upset, I think I just accept this
heuristic.

It is pretty clearly cut I think, and fits very well with the
aggregator use case, which is an important one.

Yours,
Linus Walleij
