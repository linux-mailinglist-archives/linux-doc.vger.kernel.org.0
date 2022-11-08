Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1894F621DCF
	for <lists+linux-doc@lfdr.de>; Tue,  8 Nov 2022 21:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiKHUmW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Nov 2022 15:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiKHUmV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 15:42:21 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FC365872
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 12:42:20 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id a13so24375814edj.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Nov 2022 12:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8PDeB4nZ2b0/kaV55EwLdKiv7+4Bjm3GYojARxweqjE=;
        b=AVqZhoAy5n+PtVAMMbVx+483gzWF1tI70Wt+diEOnr/EEFplpI0IFX1YwVIOi7rt+5
         xKjZRLDc7nKF1ln5nELX1axvNvA5KYnfEpaqcCUyQ1pFevFiis+oM1AT+lyQk3g7zHXY
         LCaPl0JSId8MgYe21cyHU2fF6H+jewXU4nMH02zBTKFcCs2BJmeM/k0IOqOeQqCcSB32
         Y6WYvyPjSIPQ9vvrFv+lQAHO3ltLKEVdP+WdsH1qA8J8GYSCb6l+9H4m2VSi05fgWWYa
         RryX9TkQXOsmrkLmuqRSFQyVkoTeXgUcRgclZKN9oXRwEyoI5GUOItPRM4ZgJNwyzF37
         S9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PDeB4nZ2b0/kaV55EwLdKiv7+4Bjm3GYojARxweqjE=;
        b=rxQ/8Ny3EpF7WU5SmAMBxrkCnPOnuNuewy3ta5FqacRuLdZUcu39prP2mBA4NF+LuF
         iO/2zHbVGsAgntDSyjMJA3PdVcm4CTtWTJFdBc8AT82+Y8VwLr0mytExS79mptusV5/6
         3NGZk0n/VDdX28fb4hY6zR/25qO4ZujqU6/y6CfvGwrgdOuqFQEH/XK6jvkjAWRTiUxQ
         KQgka11bJ0Z9s08VWDf4b44KuUbeQZjtFbGsz3hc86uZ4TcdjXqOjZMvMaUeQj1G8FWW
         8ShX38z29YOmYREOk+JeiJu4StNCNi8BvxgbQ9Jt0jboay8ApHIelyXiVLe3R0N+n3C6
         BLNQ==
X-Gm-Message-State: ACrzQf2Nb6IyKk0fgt+Hj/ABW6o7gWkspASRr40KtfUNyDXZ5vq8H8VK
        gENKUkoV44ts2OEsR7SpfO12BFdGkuF/U43tMKoPOA==
X-Google-Smtp-Source: AMsMyM5UacZlCRfKiRNa0kTrzT5kX7+K684naVNWV/pxq0wgKsP9jRI7CKgITH4pf2zDtNIwin7mrjQA9a0Qs67HpcE=
X-Received: by 2002:aa7:c718:0:b0:462:ff35:95dc with SMTP id
 i24-20020aa7c718000000b00462ff3595dcmr56160916edq.32.1667940139213; Tue, 08
 Nov 2022 12:42:19 -0800 (PST)
MIME-Version: 1.0
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk> <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 21:42:08 +0100
Message-ID: <CACRpkdaPwe0igrZOnA3Q3QosySTEa9H06kdXLQMcpeEmt+hiBw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 8, 2022 at 5:33 PM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:

> Add a DT binding for the Apple Mac System Management Controller.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
