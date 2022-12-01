Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4A9263F96D
	for <lists+linux-doc@lfdr.de>; Thu,  1 Dec 2022 21:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbiLAUtJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 1 Dec 2022 15:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiLAUsz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Dec 2022 15:48:55 -0500
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00879317FA
        for <linux-doc@vger.kernel.org>; Thu,  1 Dec 2022 12:48:52 -0800 (PST)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1442977d77dso2420009fac.6
        for <linux-doc@vger.kernel.org>; Thu, 01 Dec 2022 12:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yAseu4i3PcK2VyBCcm/JBiQAg0yuqET9kyP4xdihRV4=;
        b=PTg9SqFNdtMsAH2OhbwpU59PZRJa1wLEtKxJKx+pJXfXWlggAHk03vJ46gzndyoUxe
         1HlEYRvrk74d5BdVyRHcFBk7+J8VMi+S9LR5EfGnC0eqWW+PDTsUUg+uqDUDyw1c6AhE
         u+hh8pl3PBkcL6TyGGbBFzvo9V7JrHsjlpDcbOxOTOSfdRXhgB/UN1Kn9GNFT8c104jb
         WhLfRQBw2HtMUYnyRGtOmAvqaf6F1Itmv86fd0esx0orKVIuWZ3giECf3eVLYeJ0oVll
         CMSLGPGXLdLjM1aLXAz1vMS5cP7lZvevtHypWNSzAN8k+1ZLdhkbemdOQ1C4SBuhn3IF
         y1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAseu4i3PcK2VyBCcm/JBiQAg0yuqET9kyP4xdihRV4=;
        b=xB4yz8HNq1DYhIGjIdTHaj9IKcvduxj1kdaGPSuR1NIIrIi5Fpagfgnurxc3OLZynM
         +4N92xahbqehM4XjQtpyaGWyHE2GjWAmqlWETPfV+yTVg/o5PecpjqPUAUakMqgknPn1
         CtjYyURLuf0+B10lZZGOl7IEuYX8BpY2jNTUOWKWi9Da7c39Zd4bPxuk2GrSWwxRzQ4x
         Y9mQcdew8TCRELnQWRyGL5PnElqnTLJ0ovBoiZ1wmR/J5JSbVdmMFDu0lj0RlC8V65al
         mhs4r30rmOGLk0pRrZXrMJhBXlvTYXp+ozyRiuvgQvvf0R+hB7+ZheLTaxgn46XUrK3H
         448A==
X-Gm-Message-State: ANoB5plALamjrXuUcgft4OVDNQU/dVWY9zuSDff+LeVMt8LxNJt35k++
        srFsd4C9tM3X/vQB1Buli9/3QWDc0oWnIg8drYiR2A==
X-Google-Smtp-Source: AA0mqf5F5CFUVn8vFbk5Vo6eWOs300tozGLZ6ngN50eurTi2822RjfxMckGaY/e2Nxhe1G79mkD7QL/QNiKWX7hqJmU=
X-Received: by 2002:a05:6870:6707:b0:141:aba2:f9c4 with SMTP id
 gb7-20020a056870670700b00141aba2f9c4mr28592971oab.273.1669927732177; Thu, 01
 Dec 2022 12:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20221129094732.306449-1-davidgow@google.com>
In-Reply-To: <20221129094732.306449-1-davidgow@google.com>
From:   Rae Moar <rmoar@google.com>
Date:   Thu, 1 Dec 2022 15:48:39 -0500
Message-ID: <CA+GJov7tG5s1YbvCvd9yxtkCN-2jns8GcgdyofuCf-rGYqAW-w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Fix "How Do I Use This" / "Next
 Steps" sections
To:     David Gow <davidgow@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Latypov <dlatypov@google.com>,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 29, 2022 at 4:47 AM David Gow <davidgow@google.com> wrote:
>
> The 'index' and 'start' pages end with very similar "How Do I Use This"
> / "Next Steps" sections respectively, which link to the other
> documentation pages. This wasn't updated when the tips.rst page was
> removed.
>
> Remove the reference to tips.rst, as well as tidy up the descriptions on
> all of the links (especially given that sphinx gives the page titles
> anyway.
>
> Fixes: 4399c737a97d ("Documentation: kunit: Remove redundant 'tips.rst' page")
> Signed-off-by: David Gow <davidgow@google.com>

This all looks good to me and runs smoothly. I personally like to have
these links at the bottom of the page and think the new descriptions
are good. I commented on a few of them below.

Reviewed-by: Rae Moar <rmoar@google.com>

> ---
>  Documentation/dev-tools/kunit/index.rst | 18 +++++++-----------
>  Documentation/dev-tools/kunit/start.rst | 16 ++++++----------
>  2 files changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/Documentation/dev-tools/kunit/index.rst b/Documentation/dev-tools/kunit/index.rst
> index d5629817cd72..beec6f847ef4 100644
> --- a/Documentation/dev-tools/kunit/index.rst
> +++ b/Documentation/dev-tools/kunit/index.rst
> @@ -99,14 +99,10 @@ Read also :ref:`kinds-of-tests`.
>  How do I use it?
>  ================
>
> -*   Documentation/dev-tools/kunit/start.rst - for KUnit new users.
> -*   Documentation/dev-tools/kunit/architecture.rst - KUnit architecture.
> -*   Documentation/dev-tools/kunit/run_wrapper.rst - run kunit_tool.
> -*   Documentation/dev-tools/kunit/run_manual.rst - run tests without kunit_tool.
> -*   Documentation/dev-tools/kunit/usage.rst - write tests.
> -*   Documentation/dev-tools/kunit/tips.rst - best practices with
> -    examples.
> -*   Documentation/dev-tools/kunit/api/index.rst - KUnit APIs
> -    used for testing.
> -*   Documentation/dev-tools/kunit/faq.rst - KUnit common questions and
> -    answers.
> +*   Documentation/dev-tools/kunit/start.rst - for new KUnit users
> +*   Documentation/dev-tools/kunit/architecture.rst - how KUnit is put together

I might slightly prefer Sadiya's version of this description: "get to
know KUnit's design." But I would be happy with either description.

> +*   Documentation/dev-tools/kunit/run_wrapper.rst - run tests via kunit.py
> +*   Documentation/dev-tools/kunit/run_manual.rst - run tests without kunit.py
> +*   Documentation/dev-tools/kunit/usage.rst - write tests

I might slightly prefer "write KUnit tests" instead because with the
current description the line looks like:

Writing Tests - write tests

This seems a little repetitive, so "write KUnit tests" might be
slightly better. But this description is accurate and I would be fine
with it.

> +*   Documentation/dev-tools/kunit/api/index.rst - API reference
> +*   Documentation/dev-tools/kunit/faq.rst - common questions and answers
> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
> index f4f504f1fb15..58c176348885 100644
> --- a/Documentation/dev-tools/kunit/start.rst
> +++ b/Documentation/dev-tools/kunit/start.rst
> @@ -294,13 +294,9 @@ Congrats! You just wrote your first KUnit test.
>  Next Steps
>  ==========
>
> -*   Documentation/dev-tools/kunit/architecture.rst - KUnit architecture.
> -*   Documentation/dev-tools/kunit/run_wrapper.rst - run kunit_tool.
> -*   Documentation/dev-tools/kunit/run_manual.rst - run tests without kunit_tool.
> -*   Documentation/dev-tools/kunit/usage.rst - write tests.
> -*   Documentation/dev-tools/kunit/tips.rst - best practices with
> -    examples.
> -*   Documentation/dev-tools/kunit/api/index.rst - KUnit APIs
> -    used for testing.
> -*   Documentation/dev-tools/kunit/faq.rst - KUnit common questions and
> -    answers.
> +*   Documentation/dev-tools/kunit/architecture.rst - how KUnit is put together
> +*   Documentation/dev-tools/kunit/run_wrapper.rst - run tests via kunit.py
> +*   Documentation/dev-tools/kunit/run_manual.rst - run tests without kunit.py
> +*   Documentation/dev-tools/kunit/usage.rst - write tests
> +*   Documentation/dev-tools/kunit/api/index.rst - API reference
> +*   Documentation/dev-tools/kunit/faq.rst - common questions and answers
> --
> 2.38.1.584.g0f3c55d4c2-goog
>
