Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDA6669D18
	for <lists+linux-doc@lfdr.de>; Fri, 13 Jan 2023 17:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjAMQBY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Jan 2023 11:01:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjAMQAq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Jan 2023 11:00:46 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A4F97489
        for <linux-doc@vger.kernel.org>; Fri, 13 Jan 2023 07:51:34 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id i188so22588817vsi.8
        for <linux-doc@vger.kernel.org>; Fri, 13 Jan 2023 07:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f5mLrAHoyJ5nE/w7T6hV9jO9ho9i+v76675RNWbUbP0=;
        b=yHRJb87NukQWnDBcg5WdqZfZ07lI6u6ys4J9MZyzZjGgWFD6i1KYUG5iukGhsbMBL4
         WPiiQagmylt6A5MJKZg40yDFd8qZ8ccY+6eMWL11aY4WIEGBXd/dqGBzZKRyMDOxqnPV
         HlQTyavSGQRfJrqVQ6wJTz+FSi7AQkTYovL2goYaAHH0dhm4QHhMabwof0unFZR7NqqK
         gUt1LFGzuwOgeO/eCmOJpww2XN1XsvqNGIJIMmVJuXLBFR9C8kmaS92T3u6hy41Z2Imp
         tldehpMR1TNgEDawB0c5upbO5pr+85OSL7ix7y/PoWI/EmHGpIFYdWyjiVMtq12T9Dpf
         K3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5mLrAHoyJ5nE/w7T6hV9jO9ho9i+v76675RNWbUbP0=;
        b=fHEWRwJSqP2CiKqs8n3E/R3UgL52K4j3+NukIWtyX5jbVnUF6JzisxBhav1PuDkzVI
         b2bN/VyMjDs5A8/8h5iyicwQAvdPCM9G+iiHe8b5cPGtVYBWL0Hiy4ahX8JBajMnsGbi
         qV2r2n+QkvjwCeX8/0aiPjbNGth+TnBKNhBN7s4d9Gj8i2vy006sVsg6eRPK71UPbJ3Q
         wLWC3Oz1XMRf03eOuckDlau+XJw5wOyOd3ebDyOoHRZIbs+D/gDdnmas1ygjEeiyxC1q
         g9fFo9vBkgwgNR1LQkldlnxroltgd8pmoRtjsXV2NKMC3M0o1ZiUP3cQgmLR1aeigeB+
         VGbQ==
X-Gm-Message-State: AFqh2kpFXATrjiQ3HXb0hepFApKmneL+sqRz3ehYqxg72mgmCxZzh/CH
        8m0XIpBhEXqCX322FYnrUWwi/+5UD6QRU69GbIkzDATd10bhkw==
X-Google-Smtp-Source: AMrXdXsI3EMIQ7TOoOD/7p0LcC17cwRylvVtksQiQePxKwv+hwJDZMXOmlYE3f0gqSJLKso5mPtLAUlUwQRbqnkLpEw=
X-Received: by 2002:a67:df09:0:b0:3ce:88b3:d7da with SMTP id
 s9-20020a67df09000000b003ce88b3d7damr7008535vsk.62.1673625092385; Fri, 13 Jan
 2023 07:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20230112133942.58471-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112133942.58471-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Jan 2023 16:51:21 +0100
Message-ID: <CAMRc=McWPrODnwqHnKHx4V3buyWduMROnHpP1_jd3e-8EoU3tA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused and obsoleted irq_to_gpio()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-m68k@lists.linux-m68k.org, linux-sh@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 12, 2023 at 2:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> irq_to_gpio() is legacy and unused API, remove it for good.
>
> This leaves gpio_to_irq() as it's used yet in many places.
> Nevertheless, removal of its counterpart is a good signal
> to whoever even trying to consider using them that do not.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
