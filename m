Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2482785EB
	for <lists+linux-doc@lfdr.de>; Fri, 25 Sep 2020 13:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgIYLch (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Sep 2020 07:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728158AbgIYLcP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 07:32:15 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1534CC0613D8
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 04:32:14 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id u21so3189465eja.2
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z//erykWYqUAgc8g2m7BJrgknwO6GLezCOz32OeFgSU=;
        b=Yf8hpAStoVbx0mRIg2vS79bkSzSxftSLxoGoEplviNGsiBvYHf8KBPdOzjK42CqVlQ
         +hBydWVKA8Qu2bXBchGo+iHRUal8CKSeDZWNlXY7K2Yl0DNd03LWUWHRwNJe4xqedNfk
         AhWmM2cSkZVGx3UadmgdltJTsUSvDf9YzcieRhmwFHLFi2rlaSPQUbKWRdPWZlvRR/3/
         WlvhTQjThDN4ZBeh8yIfxbFQGQq+KoayEBQyhz2GRGtIXvDpnP17g9AMljhXH2QOnxSW
         piKLlBlTo/lFYia1Z9DoYlx8rl6KpTXcOxB3jVD6O0oeCrdbWUzYkKR6haFxTzKYPtF2
         UypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z//erykWYqUAgc8g2m7BJrgknwO6GLezCOz32OeFgSU=;
        b=FcaQadbbGlBSI0SqauvHadQTGaw1VNFeqRGtiG7J/+/9kpjFVIZJ3Rc8uA0T3WrzRB
         hsMZapvltacvjG3Obqf9nPcWPAjuckuKSqabMlEXI8Mpv8WtheeOBtVEIU8Fn9q+t/rG
         2j/UigHBkdTN0Zprsun5Xc6Jlmc9GVIWXHHccoron4D+g2zrwMZDmr0eujhYgTLH4sy8
         D3D9mp0XfQOyWrNu5F0Dot6NLrAGUJpyVo8NOuaUlLtYIDi/UH1xwVbNMzJylQh9spJM
         ir4dO05Y6HK0UC33rNqRP+cUsdPk4Rtsp1m+d5hlIRzGcDtjEML9NKI1SabcyPkWq70E
         IZHg==
X-Gm-Message-State: AOAM532/IzVHdMLQmJLMY/KAEoc8ryjqbLyHQO4LNLirh86CXjtfJQ9Q
        9dhi7bmvCuPaZQUt3N5cdcW1gAR8kpJCCu361wJ9ig==
X-Google-Smtp-Source: ABdhPJw89kHdONoHSrw/GfYxZwMQK3hh6g8jQPrGUBFWzXdg50Bl4UPL+du4E2cNOwUE5/axozz3WvMwufj6FGLDgnM=
X-Received: by 2002:a17:906:e4f:: with SMTP id q15mr2350988eji.155.1601033532589;
 Fri, 25 Sep 2020 04:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200924113842.11670-1-brgl@bgdev.pl> <20200924113842.11670-2-brgl@bgdev.pl>
 <20200925084804.GX3956970@smile.fi.intel.com>
In-Reply-To: <20200925084804.GX3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 25 Sep 2020 13:32:01 +0200
Message-ID: <CAMpxmJV27BO0A82TKWK59StYXnLfgqT5qS_chgn73GPoNn3wCA@mail.gmail.com>
Subject: Re: [PATCH 1/9] lib: string_helpers: provide kfree_strarray()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 25, 2020 at 11:01 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Sep 24, 2020 at 01:38:34PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > There's a common pattern of dynamically allocating an array of char
> > pointers and then also dynamically allocating each string in this
> > array. Provide a helper for freeing such a string array with one call.
>
> For consistency I would like to provide kalloc_strarray(), but it seems a bit
> ambiguous. So I'm fine with this going alone.
>

But how would it even work - you can allocate strings in so many ways?
Also: let's not introduce functions without users.

Bart

[snip]
