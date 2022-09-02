Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 854445AB9A2
	for <lists+linux-doc@lfdr.de>; Fri,  2 Sep 2022 22:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiIBUwm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Sep 2022 16:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiIBUwk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Sep 2022 16:52:40 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAB2FE079
        for <linux-doc@vger.kernel.org>; Fri,  2 Sep 2022 13:52:38 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id s206so2946307pgs.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Sep 2022 13:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Xrq0xaJscCe2LFXho6Z5SMg88GSPjvsfWB0TByS7koM=;
        b=dW6kpbSaQbTaWbefqRhfls6POnB8wBk8wGzkDF9+nJ5/pcLz8aoEXVHn1hfwQ8qSmI
         gTUfl8RmLPi4xMR/CEUEejkZt9/CrkSBMb1JENOoRm/X6w2XKKYXhRg/L5kU7h+bf6R/
         dMY+E+nekbCc6QVsSHSYwXdscdb6ETn1htOiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Xrq0xaJscCe2LFXho6Z5SMg88GSPjvsfWB0TByS7koM=;
        b=tTs7C1+9cvMBKy8NtUKUrQM9Q03o4Rdp/ASROk05kyvfDCDbEC0Lby/5LGDc1qx3Vq
         9aw9dNG3MD5MVivZnUwY5ZXbglgSUJ+ogEUS+rxDQgM6gkE7Z/R8tjUOdjanuVtWkMDv
         vtYBLHOXyeU/2P9C8veofNLTGwuSVYvLOvrsJm9EegrNwiBYVg4VAldAB/cCzwW2uwjb
         +RHNA5nUGEa/MNmpXNQa0BmPyYOpLVsmFb+Ws2A4uin7WQpyVjcUR8liqCvhylqb6PPr
         nlAB0AXvThD3eyeE60ijr2McnDb4lQ+B3Y7IvGKTJMQ526wFTUGb1WybI4f8WPeenbQY
         3gOw==
X-Gm-Message-State: ACgBeo0Huj9eKCxmC6kOI2c0aca755lyBvIYXtodofPtfHJ8JEN5SF9R
        06xC+6z963/QMttBmA8aPZ+/ZQ==
X-Google-Smtp-Source: AA6agR6/sc1utJRqox+EQ93nbssyjmVQ0KWuz5zOB6kpLHeqaFwQE7wdrUV35UzfGFi9zmreSk3vTw==
X-Received: by 2002:a65:4c09:0:b0:430:8422:9642 with SMTP id u9-20020a654c09000000b0043084229642mr7559187pgq.322.1662151958218;
        Fri, 02 Sep 2022 13:52:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i71-20020a639d4a000000b0041b667a1b69sm1867398pgd.36.2022.09.02.13.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 13:52:37 -0700 (PDT)
Date:   Fri, 2 Sep 2022 13:52:35 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Len Baker <len.baker@gmx.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Francis Laniel <laniel_francis@privacyrequired.com>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] string: Introduce strtomem() and strtomem_pad()
Message-ID: <202209021351.13203B669@keescook>
References: <20220901190952.2229696-1-keescook@chromium.org>
 <ba161718-bc61-57b8-dfbe-dee666fd06e8@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba161718-bc61-57b8-dfbe-dee666fd06e8@roeck-us.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 01, 2022 at 12:34:34PM -0700, Guenter Roeck wrote:
> On 9/1/22 12:09, Kees Cook wrote:
> > [...]
> > -If a caller is using non-NUL-terminated strings, strncpy() can
> > -still be used, but destinations should be marked with the `__nonstring
> > +If a caller is using non-NUL-terminated strings, strtomem() should be
> > +be used, and the destinations should be marked with the `__nonstring
> 
> s/be //

Thanks!

> > [...]
> > +++ b/include/linux/fortify-string.h
> > @@ -77,6 +77,36 @@ extern char *__underlying_strncpy(char *p, const char *q, __kernel_size_t size)
> >   #define POS	__pass_object_size(1)
> >   #define POS0	__pass_object_size(0)
> > +/** strncpy - Copy a string to memory with non-guaranteed NUL padding
> 
> Does that need a newline before strncpy() ?

What do you mean here? I think this is valid kerndoc, but I'll
double-check. (And will continue in the neighboring htmldoc build thread.)

-Kees

-- 
Kees Cook
