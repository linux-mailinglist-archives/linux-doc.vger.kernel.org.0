Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D512B38F6EC
	for <lists+linux-doc@lfdr.de>; Tue, 25 May 2021 02:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbhEYAUJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 May 2021 20:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhEYAUI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 May 2021 20:20:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA4B7C06138B
        for <linux-doc@vger.kernel.org>; Mon, 24 May 2021 17:18:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a2so43133623lfc.9
        for <linux-doc@vger.kernel.org>; Mon, 24 May 2021 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lU98oqYZy9LMpWRIVC/iOJVtPr25gCqXEbSC0KE2HyA=;
        b=Z0A4YTuI+et7WamhQwbpeL7DsoQsF7Ua1YcYV4PuWf/unLg0FK4OyfCPtn8ju23OMV
         f4ZRHtH3PZ51h0Rx8RGos1KrY0HJbMYeZR3l72jlxAc7gE6eHwgUXJUww9D0pIJu1yCb
         TN6MSnljzXK2rflr6vC2q845XUCsEuKxHC8iy6LcTiK3RBNB9jXmD4t/qP/N/0pZCD2q
         NYk7e/nIFxW5bBymJIy+MUr/AaoQgj8xdCucfU/rPEXIk4bBLBP3hvtd0648zeKrNVwB
         vQEPXtRFtpikG60dHa1v4DPAtX6OlVy77tS5ty44hxWu9Rv1szhLYqkecfdcg1o0Z3ci
         OfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lU98oqYZy9LMpWRIVC/iOJVtPr25gCqXEbSC0KE2HyA=;
        b=E+YIJo3hq9GNpQ1Fqt34/3HefiFoti6xflGc7Uu0/nfvp5q35RXOUMowojzotB0KuH
         U38tPZDKZ3J30u6nnyQChxBHFEu57eQQMqDGlB53ZIjwJV95s2vmcbvw1/fVEp4uARWL
         mruzm74KsLsmw4pKaWybc1ZxmiSQXuLqlsGlxG40RtBYC0uU7vk04QzJpM8kyZKBddSl
         2P9KW/nIjZfYFSbA9rm7/Grp6Er8OcWAkf2jMIrp5FHV1Rhj8wpajPL6WqAiG14fbOvY
         +ZJgZ8yVqLtfyz/fFgy+MdQUNU0DoZ4+pzv5u2pBPYbCMqCp4mJTrTv4rcvAVnqcM0uy
         FlCA==
X-Gm-Message-State: AOAM532hibVJ5/Ate/suKBD4nB/1eeRkQ7botAFSQTWe6/jAbPcvvwul
        srKB6MPzrdBv42bhlUPEA4Kl7c9UcxUXSk+ANHnOVw==
X-Google-Smtp-Source: ABdhPJygddabh5kIV+leOfkKFonaw9VscHm4yErigpg0emiVpFC9RYx8ml0O2HMh08c2oJ8ecYk5w/JjuH7dSDMDRTE=
X-Received: by 2002:a19:ef10:: with SMTP id n16mr11888963lfh.649.1621901916420;
 Mon, 24 May 2021 17:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210520202730.4444-1-dariobin@libero.it>
In-Reply-To: <20210520202730.4444-1-dariobin@libero.it>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 02:18:25 +0200
Message-ID: <CACRpkdanh32PREaYhN1dW1p0GDamSZ04WgRr-afm+6L-c1fJCg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] am335x: set pinmux registers from pins debug file
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 20, 2021 at 10:27 PM Dario Binacchi <dariobin@libero.it> wrote:

> The patch was born from the need to change the slew rate of the LCD pins
> of a custom AM335x board during EMC tests. The AM335x, as described in a
> note in section 9.1 of its reference manual [1], is unable to write
> pinmux registers from user space. The series now makes it possible to
> write these registers from the pins debug file.

I am going to hold this series back pending more discussion on the ABI
and whether it is useful.

Yours,
Linus Walleij
