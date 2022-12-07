Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8484B645B45
	for <lists+linux-doc@lfdr.de>; Wed,  7 Dec 2022 14:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiLGNsT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Dec 2022 08:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbiLGNsJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Dec 2022 08:48:09 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2836026AC2
        for <linux-doc@vger.kernel.org>; Wed,  7 Dec 2022 05:48:05 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id g4so3161737ybg.7
        for <linux-doc@vger.kernel.org>; Wed, 07 Dec 2022 05:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YwDK3y8/2CA9L4Z+ruLM0VBm7H5Gax9zmhRB4AegQQ0=;
        b=Q/gizT6k0+5wnly/A/yFJJKteqGSOy8SwSzM9J6mJb/zZqf+lcu7W7xwMF7a20XUJV
         FWQrnvFT3vEG564AdlbjU7cfH/7Ph87Lut+ordkFVhAef0Q/T3rGVue7dYZMOA5Draax
         j5AhOOOZM+rwGsON5CpiCpQYPkWHNsdQex/4Iqg4Wgr0OR+0c2BbAoaio4PjFbUc+imz
         UquYJpB3/gkKsZXpAzUXc2fj7TzV/lMwf+sPmg/K4ck9km8N6vM22qyY/ko0EspKr6os
         xf0H0qaqcPyJ2BuNCyOPGpNaedVMCRtQyOOqaR0HNu77YU06PXr/oZ4NGjQXtDNR11j6
         R1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwDK3y8/2CA9L4Z+ruLM0VBm7H5Gax9zmhRB4AegQQ0=;
        b=w0IVy01ktfgNHRqzw3ivl6vfvS550tjtGDsJVr6HPqO5OLPHYONlMTkgALJ3Y9WxFp
         sZSCyHV2XDWiM4nG33cuqP65AenIIxfeAKwSQPeYlGgmifmDAOtR6zqp5gT3uJnmL2WT
         kwDwNA3+ocOX637Ob2T+LqoJr1y1ograC4RReaKxklhbD+hggpQsRNCH7+1oG7CPYMrJ
         O4M67b57EfM7jy5umx1lrz0cDScYSEHe6v0lgaviA9z6xJPSfe8XMcLrY6fixPTbnRbG
         35SCM/xz0R+8xFu+tJeXU2lQTPJS6CKqFSjfRHMuylRogrrRRNO45PJMq8fAW/U9HuEL
         FrEg==
X-Gm-Message-State: ANoB5pl9mYmlUe2EGHnxQvGAKTvp7SgY1rpE0Mvu7+iRtpQ4JoORp0gb
        Nnf6XEtuzJYe4KVr/MBPgMduhEEK4U14sSWkY0TqaA==
X-Google-Smtp-Source: AA0mqf7VMtwtgaNnOvGNzWL1HYIL3o0dmnoqT3vqTP5kdXevHgb9CuV7fTj25pC1maCtIjJ/M5dFgtplQP5YUXfot4Q=
X-Received: by 2002:a25:3dc3:0:b0:6f0:d54a:8f2d with SMTP id
 k186-20020a253dc3000000b006f0d54a8f2dmr59191839yba.66.1670420884372; Wed, 07
 Dec 2022 05:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
 <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdaQWZE6=BNEh5hSH9=jBK=TcLoD1uUb=JyNYmHFvaSAfg@mail.gmail.com>
 <Y41MxPthLjitvzEl@sol> <CACRpkdb67ygsEuZhRZ9TGmmNXhiU2LsuefD0-48xtCLx3fq-KA@mail.gmail.com>
 <Y5BjJmz5Mvdr8cAR@smile.fi.intel.com>
In-Reply-To: <Y5BjJmz5Mvdr8cAR@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Dec 2022 14:49:20 +0100
Message-ID: <CACRpkdYVp7j7h-9w_7N05zAv8otmFY0EBkO16ymk0EO-T0LwwQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] Documentation: gpio: Add a section on what to
 return in ->get() callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>, Marc Zyngier <maz@kernel.org>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 7, 2022 at 10:56 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Dec 07, 2022 at 01:06:46AM +0100, Linus Walleij wrote:
> > On Mon, Dec 5, 2022 at 2:43 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > > My preference would be for the driver API to be extended with a new
> > > callback for the output buffer, say get_output(), and have the existing
> > > get() always return the input buffer.
> >
> > This has a certain elegance to it, as it cuts to the bone of the
> > problem and partition it in two halves, reflecting the two pieces
> > of hardware: input and output buffer. Also follows Rusty Russells
> > API hierarchy.
>
> The (one of) problem is that not all hardware may support input and output
> be enabled at the same time. What would that new API return in that case
> and how it would be better with get() returning the value depending on
> direction?

I imagine we would leave the .get_output() unassigned and the core
would just rely on whatever behaviour it has now, so in *that* case,
the implementation of .get() will need to be more elaborate.

Yours,
Linus Walleij
