Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097E020426E
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2020 23:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730493AbgFVVET (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Jun 2020 17:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730418AbgFVVEH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jun 2020 17:04:07 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84402C061795
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 14:04:06 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y17so8108493plb.8
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XaQAHgI/fJz5n4PH9+AAQxpUaFNfDOAFJjIvvuWc6mg=;
        b=ILThu+fBeQLbDkY3Saa7Zr6fXvZla6p/mhaacfaAod5Ou2LCXGVY9rmI/SQ12/gRGw
         0OyvuZwHPdhHMhqZNfaygaAuqkjJxQw9ecwhpY877rYeLJOYo7K1LFnWVKMlDLVDvRVU
         aO7im+xhoBSS7Rfzh9EnHnbqHF0AGGKdOIZCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XaQAHgI/fJz5n4PH9+AAQxpUaFNfDOAFJjIvvuWc6mg=;
        b=IFSDKh857rXajQPlvp6kE5krVXWa6Jxx45naO04Fj3QfTitMEoMt+K4I8fqy5CCaOs
         3LXtXd1ivYoccn334BdWAQp9JFIQW020pWjDp26oKCRDRXfL7nkeCQesEQNyV21bx6nG
         dF38pPtRd19nD4GxVlV+LoiE3n7m1eniV0+Orl8E/l0+cuTovPZtzcYXaMH5sp7uNADa
         LXaixmLvKtUeP1pOBEMiH5U/ChTIaNRiHR1243TvBWYyE1pQWznQC7lkyqadrr9PKFvW
         +m2uKw0j9Mxd4vw5MN1ctkus6yIvz9OqBgZjtv9BeuL39LcqScQwQC8s7qB2dTCnhz0o
         rOUQ==
X-Gm-Message-State: AOAM532wNaAR0KXhOWoLYrUjDyDRkwd+rk01l9FLvw5q9C543IPqp76Y
        swq55cKOY6E0CcSLE+gQ0IY5jg==
X-Google-Smtp-Source: ABdhPJxa2RKG+txMKUm/MEMBUFpa2Kv9XKoAQ0+Lw2FAoqT0JOWKLV1rtyBoAVQcAiWWStDNJ+p+nQ==
X-Received: by 2002:a17:902:b942:: with SMTP id h2mr20581705pls.163.1592859846012;
        Mon, 22 Jun 2020 14:04:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d2sm10586968pfc.1.2020.06.22.14.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 14:04:05 -0700 (PDT)
Date:   Mon, 22 Jun 2020 14:04:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org,
        Network Development <netdev@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH v2 04/16] b43: Remove uninitialized_var() usage
Message-ID: <202006221403.EEAD37E94B@keescook>
References: <20200620033007.1444705-1-keescook@chromium.org>
 <20200620033007.1444705-5-keescook@chromium.org>
 <CAKwvOdmsXuqx-3Rt_KNFq4psAeFjG2-7qQaqkJ7dDqqmscUFNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmsXuqx-3Rt_KNFq4psAeFjG2-7qQaqkJ7dDqqmscUFNw@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 22, 2020 at 10:04:18AM -0700, Nick Desaulniers wrote:
> On Fri, Jun 19, 2020 at 8:30 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Using uninitialized_var() is dangerous as it papers over real bugs[1]
> > (or can in the future), and suppresses unrelated compiler warnings (e.g.
> > "unused variable"). If the compiler thinks it is uninitialized, either
> > simply initialize the variable or make compiler changes. As a precursor
> > to removing[2] this[3] macro[4], just initialize this variable to NULL.
> > No later NULL deref is possible due to the early returns outside of the
> > (phy->rev >= 7 && phy->rev < 19) case, which explicitly tests for NULL.
> >
> > [1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
> > [2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
> > [3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
> > [4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> >
> > Fixes: 58619b14d106 ("b43: move under broadcom vendor directory")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> I see three total uses of uninitialized_var() in this file, do we want
> to eliminate all of them?

This is the only one that needed an explicit initialization -- all the
others are handled in the treewide patch. I *could* split it out here,
but I found it easier to keep the "no op" changes together in the
treewide patch.

-Kees

> 
> > ---
> >  drivers/net/wireless/broadcom/b43/phy_n.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
> > index c33b4235839d..46db91846007 100644
> > --- a/drivers/net/wireless/broadcom/b43/phy_n.c
> > +++ b/drivers/net/wireless/broadcom/b43/phy_n.c
> > @@ -4222,7 +4222,7 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
> >         u32 rfpwr_offset;
> >         u8 pga_gain, pad_gain;
> >         int i;
> > -       const s16 *uninitialized_var(rf_pwr_offset_table);
> > +       const s16 *rf_pwr_offset_table = NULL;
> >
> >         table = b43_nphy_get_tx_gain_table(dev);
> >         if (!table)
> > --
> 
> -- 
> Thanks,
> ~Nick Desaulniers

-- 
Kees Cook
