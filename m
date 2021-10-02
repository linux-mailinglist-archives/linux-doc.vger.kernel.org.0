Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB1F41FE49
	for <lists+linux-doc@lfdr.de>; Sat,  2 Oct 2021 23:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbhJBVon (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 2 Oct 2021 17:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbhJBVom (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Oct 2021 17:44:42 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8A9C0613EC
        for <linux-doc@vger.kernel.org>; Sat,  2 Oct 2021 14:42:56 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id j15so8566682plh.7
        for <linux-doc@vger.kernel.org>; Sat, 02 Oct 2021 14:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0FFjP0oMZpxRexvNkXdCYUTlS/H85H78Cl8QLMYAVqY=;
        b=lu/QAwQBpT03rq/VQqSlSsmAXa6QbEPOPpK95EFgVMjGjF7JAjrI9RiL1pn6ZotiKB
         g8/UamqqsiA5JdRLDR8CJ2qO1NoES6urk1/CRCn+M6s0ohwG4KegN2MXXtF2rSUgiiJo
         neebnm2figgIUrMXjkXgAD6IquiNvy+HfLBjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0FFjP0oMZpxRexvNkXdCYUTlS/H85H78Cl8QLMYAVqY=;
        b=BJfrmijp2HJMAgfyiWuPvc72mV+OqZ467s+aGWS+nfvdEKkwNxbydsyAR2MwZh5Nu0
         p/5woZI0rSU6AbLh6cdfnx1qVzxCxdSzAEwHuyQZzYqxhXUeuvqpx9F+5hnN6Ga/yrwc
         qRjROrDO88SbI7VY1x4dXmYfa08hNX38Q4FfO8UKNPXjJBx3mgbsVz6m4jsfsQuYGIdJ
         OPYZ2s77j/ppuV6sso79g37h1mfkGxdjERhvdU7uiIcmumJmRP44Bjx3upmvsrHV5jov
         43KyWGfYx2g4sHe8czFZvoJSOiLqRI01UD4UYq/F89kbUk48IOyOvB9E1ILDUzXoN2Bz
         OUQw==
X-Gm-Message-State: AOAM531FttOPGitKGtIAHCmUXlDBDXkwv2qM1CelG0c1CZd0RDd9Ue1T
        eB3LD1zEU7s2qK5hIts+I83dJA==
X-Google-Smtp-Source: ABdhPJwHouZwwcQTL+3/hhpEg8o6JRvZfZmd3ySpA8bXdqKGb9wtZn+VEUaXyTMCYiTTh0fev9osyw==
X-Received: by 2002:a17:90a:588f:: with SMTP id j15mr28057348pji.177.1633210976114;
        Sat, 02 Oct 2021 14:42:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t8sm10821655pjt.39.2021.10.02.14.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 14:42:55 -0700 (PDT)
Date:   Sat, 2 Oct 2021 14:42:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Joe Perches <joe@perches.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4] docs: Explain the desired position of function
 attributes
Message-ID: <202110021441.C70D775A61@keescook>
References: <20210930235754.2635912-1-keescook@chromium.org>
 <CAKwvOdm37zpJZkLvbHvVkXax=XGQ-Ym3iPfx7LtTUnZhADnYCA@mail.gmail.com>
 <YVf80rXg8Yd19Hmw@kroah.com>
 <9f262a81acffffb6e267d5832b29d8596d8046e2.camel@perches.com>
 <CANiq72m7gRxNmHUJb9jJ+JMiYHyMuNf6Yc1+7N87yz_RLc3atA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72m7gRxNmHUJb9jJ+JMiYHyMuNf6Yc1+7N87yz_RLc3atA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Oct 02, 2021 at 06:27:02PM +0200, Miguel Ojeda wrote:
> On Sat, Oct 2, 2021 at 5:22 PM Joe Perches <joe@perches.com> wrote:
> >
> > If automated scripts exist to change all the code to that new
> > 'one true way', it wouldn't be applied.
> 
> I think nobody is saying we should reformat all code at once, just
> that agreeing on a given style allows us to eventually automate it (it
> also makes humans more likely to be consistent).

I just want to know what style to use to not have it NAKed by Linus. ;)

But yeah, it might be nice to do style checking against the kernel some
day. We have a lot of weird stuff in here, though! *slaps roof of kernel*

-- 
Kees Cook
