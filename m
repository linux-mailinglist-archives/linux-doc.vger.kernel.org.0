Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668A9790B8F
	for <lists+linux-doc@lfdr.de>; Sun,  3 Sep 2023 13:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236579AbjICLPo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 3 Sep 2023 07:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjICLPo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Sep 2023 07:15:44 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0031E12A
        for <linux-doc@vger.kernel.org>; Sun,  3 Sep 2023 04:15:40 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-56963f2e48eso79527a12.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Sep 2023 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693739740; x=1694344540; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rc553DPy4Af9gG2DZ8elTIxxu5HChknTvh6LevqA5wY=;
        b=ZC83t5fq4IkNaWoLmc734P9LbxAEUQSbSqjGfyqtZetZQo3J9qZ3B3jUDokYHifGnV
         hpP9QEFQXiwdXNueBNtmJDfcwTR9XBQr+xMWI13g+UmvRx84Aa1gFAZD2A87Hn3tQ1Me
         0QS0JEuEHz0wgVpxIdKPW+FYlzFWtKF/mfsyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693739740; x=1694344540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc553DPy4Af9gG2DZ8elTIxxu5HChknTvh6LevqA5wY=;
        b=QT284u37iSBfzckEDzfjpEp8Omz4CP17itldljRjLDKqK7JC36HukEi5t4aAueM6XB
         eGyil4uRuSwiH4WvwSEla8Nwkwrr8fmEKvI4tBoSnAL6vE9qHp8ngaRcH6kwRm/lGBVA
         dJFLcM5j+LAvqrJ06L0RGR4Rk5kX44DvgFRcooKPtmSctrHXhDv31WecuKJiCWX/wyaf
         95XmO+r5OoZJ51gWNKsytvqJpOyt90m7dLj8dpFz9ioGwEytlEbay78MPKcnZiNZDvCv
         EYgu/IVMD/gQSfKZgGGunni5UnumJZ8MJqFo27Xml1Dem+Joj7ulvNk88sKD16CRS9fe
         fwuA==
X-Gm-Message-State: AOJu0YxnN8aMYXW6OQIn6xzmPMMzohnDn41KO88H29RyQWf9pKOAQIX/
        7VYR8tu7aA/3M2G13SliuxA2UA==
X-Google-Smtp-Source: AGHT+IH280Ee0uGJE+Wfx6zorOK08XSHJvH3gTM5GBqMcabQhCpwuQw2bdoeS7vLBUTOtaDihxxjAg==
X-Received: by 2002:a05:6a20:4303:b0:148:f16f:113f with SMTP id h3-20020a056a20430300b00148f16f113fmr6647172pzk.12.1693739740468;
        Sun, 03 Sep 2023 04:15:40 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id f4-20020aa782c4000000b0068be7119e55sm5650313pfn.122.2023.09.03.04.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 04:15:39 -0700 (PDT)
Date:   Sun, 3 Sep 2023 20:15:35 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] kconfig: add warn-unknown-symbols sanity check
Message-ID: <20230903111535.GH3913@google.com>
References: <20230830004937.2938195-1-senozhatsky@chromium.org>
 <CAK7LNAQvFR0dQAFU2YiqxrXJTKcH0-=n0Fea1Q8pc7ZuHHf0zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQvFR0dQAFU2YiqxrXJTKcH0-=n0Fea1Q8pc7ZuHHf0zg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (23/08/31 23:56), Masahiro Yamada wrote:
> On Thu, Aug 31, 2023 at 11:15 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > Introduce KCONFIG_WARN_UNKNOWN_SYMBOLS environment variable,
> > which makes Kconfig warn about unknown config symbols.
> >
> > This is especially useful for continuous kernel uprevs when
> > some symbols can be either removed or renamed between kernel
> > releases (which can go unnoticed otherwise).
> >
> > By default KCONFIG_WARN_UNKNOWN_SYMBOLS generates warnings,
> > which are non-terminal. There is an additional environment
> > variable KCONFIG_WERROR that overrides this behaviour and
> > turns warnings into errors.
> >
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> 
> Applied to linux-kbuild. Thanks.

Thanks.
