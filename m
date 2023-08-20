Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46662781C39
	for <lists+linux-doc@lfdr.de>; Sun, 20 Aug 2023 04:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjHTCzO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 19 Aug 2023 22:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjHTCy7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Aug 2023 22:54:59 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C846E94
        for <linux-doc@vger.kernel.org>; Sat, 19 Aug 2023 19:45:25 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68730bafa6bso2192219b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 19 Aug 2023 19:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692499525; x=1693104325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mm5o8vsDqtJgWgv9cexSZ5HfDXLmENIR7pd/RZCi7E=;
        b=QF4T3t8kAsJg3A+ftbt35NVWqk1oPaEvm7z0M8UyD03BVljdR3EVvfWllOrmm44cNW
         yU0PUfBTcf7oYB5sJn23GomgRZyv/+IqvWz2yfklLy3yVghdDVOZZlh2a4q7rmC8Jqap
         U2Nq7Us3hWOc1YHKTDXE0nlZ6JuClOeDFVnZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692499525; x=1693104325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mm5o8vsDqtJgWgv9cexSZ5HfDXLmENIR7pd/RZCi7E=;
        b=hcZHmbWX9UfTjbnmrdMtDClqadxyP/dNdre2QyTRORU++AEQ8UiS2fmusI0FZMw1z5
         OK9ty+v46JGTYZAjXVgxdokpqRGxfaBA/9zCRjjdLUk0817lsON1wZ10KJyCNHv5GE6d
         S6RvB9MuTc+GUJNSBmXXTPdVVZhszS/CTha0R6heNnfmkrzfLExF4iCsM084ESkbLgoe
         QWgTgbYFDKXFNHuxU1RZF/Glslkh/Q8S8duEv8RTXZg7NpH1mbOu+JBuYgxVY2ucXhUl
         ztHauhTQRUfVvl08s1TOvRo0yi/UHzZN8D/E1NLGhIj4ik9CuTnJZ7bcZnMChgCqc5fE
         dbVg==
X-Gm-Message-State: AOJu0YyzVoGuNyyRM6Kc5d1wPhmcZVOxBEttqpCJ2IqNysMEtBVtJMGf
        lu1SH5o6D7KMuGYDuE4kR0EeYA==
X-Google-Smtp-Source: AGHT+IG42FLuKrdBKHw4/34k/LFZH3xW+oxA3C97LCsaTYhQ/3rqcwOr9i+z2KUPrmEeF4wHeR8kGA==
X-Received: by 2002:a05:6a20:938a:b0:140:d536:d434 with SMTP id x10-20020a056a20938a00b00140d536d434mr5183268pzh.10.1692499524799;
        Sat, 19 Aug 2023 19:45:24 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id d5-20020aa78145000000b00687a4b70d1esm3747974pfn.218.2023.08.19.19.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 19:45:24 -0700 (PDT)
Date:   Sun, 20 Aug 2023 11:45:19 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
Message-ID: <20230820024519.GK907732@google.com>
References: <20230817012007.131868-1-senozhatsky@chromium.org>
 <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASJWKSsdzn5ccgWaC35-XvHGU7pnE6C=eZFDbqrrghtdQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (23/08/20 08:19), Masahiro Yamada wrote:
> > Example:
> > Suppose old .config has the following two options which
> > were removed from the recent kernel:
> >
> > $ cat .config
> > CONFIG_DISABLE_BUGS=y
> >
> > Running `make listunknownconfig` produces the following
> > list of unrecognized symbols:
> >
> > .config:6:warning: unknown symbol: DISABLE_BUGS
> > .config:7:warning: unknown unset symbol: ENABLE_WINAPI
> >
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> 
> A new target is not what I like to see.
> 
> 
> We decided to add KCONFIG_VERBOSE, which will be used to
> warn options accidentally disabled or downgraded.

That doesn't seem cover the cases that I'm concerned with. I don't see
anything related to "!sym" in the patch.

What will KCONFIG_VERBOSE do if it reads the following config file?

// assuming that both config options were valid and existed in the old
// kernel, but were removed/renamed in the new kernel

 $ cat .config
 CONFIG_DISABLE_BUGS=y
 # CONFIG_ENABLE_WINAPI is not set


I'd like to see warnings for both lines, even for config that is not
set, because it maybe we set by a build script depending on USE flags
for instance, so that build target may still refer to non-existent
config.
