Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE7C476A30
	for <lists+linux-doc@lfdr.de>; Thu, 16 Dec 2021 07:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhLPGCX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Dec 2021 01:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbhLPGCX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 01:02:23 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DDAC06173F
        for <linux-doc@vger.kernel.org>; Wed, 15 Dec 2021 22:02:22 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id h1so16174852vkh.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Dec 2021 22:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LdwGdKQjGvZH9L79grF3XVgvb6CZv8Zb6JGr6ownWrM=;
        b=J74CLVsjoc2AoHlMoS7YBVQaS89g8VB3ZBOEmwrGWTvL4b9Ncuh0qnUS4JaNHAGvFB
         ooXFYqzSGMOEAWi+KuXgyM31Zd44pLhWYlAEndc/CPe1QM/OfJwhVnX329r8ShZnvvwS
         qty8J2sYkpzU7f7AIxEF2/hxhRILCACYseRR3bPUdWlYrt2UaS/ja1ykJ6FdZCjuXatD
         jZmdnswIrAGsBq1hMTpgWH4pGKuUdSanxCcrk7Rj7g0kw06Gs6jhKyFkNgDbQvm0NC2I
         GZYvQXthCTvO8B3N3UtVVTNfWOEyRl3tXzpNcA7BLl3v7xyZqyNeZbJdiWyCz3SjUg0l
         LzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdwGdKQjGvZH9L79grF3XVgvb6CZv8Zb6JGr6ownWrM=;
        b=sx6jHIspIvDxfhUiLcueuw6+SFYAHUXV2cstH/iGAb8bdDBZcMv8WXWqsXsbLK/Ta5
         ChYRA54x5Jx8b9TDfmQni6wTp6RGCmTJUhTjBSxyV2f9YzyNP2QguegVle7BDrxwvuU7
         sNjcLjf+oWYMAV3h4c8J1rsFnLZ4t2lmh4dDu8R+6iq9Z5SB2dfWUbHKUG0eYBCyRd5L
         0qz2eTK33hxlrW056topCXhawesqVmAzXL2tchsc8LhXytQ2SQh6sOxOzJ5AI5jTP0QI
         ip/AUTKM0BM2YfPnXr7SxR1NXXHQYz//Z1xUPm6lRJeX3hMcwNJeI3CghhtanHuTEIyA
         IISQ==
X-Gm-Message-State: AOAM533QnV3M93mNZzwOtfWDAhdVbvGV8eEbIcFwITNT3zN/SzwFgNvT
        OM4ShKNraYnL0mv39bjKPQhPC7+vLBWN6FhpbnImtA==
X-Google-Smtp-Source: ABdhPJym00ojgb3ebW6zZh7VI82KIpqGksDPGxfexbTgeWqTQa8VbMS8rODxw6jrfpHe+2b9RUUJzRbVjLIB507YQY0=
X-Received: by 2002:a1f:2196:: with SMTP id h144mr2276650vkh.7.1639634541848;
 Wed, 15 Dec 2021 22:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20211216055845.633350-1-sharinder@google.com>
In-Reply-To: <20211216055845.633350-1-sharinder@google.com>
From:   Harinder Singh <sharinder@google.com>
Date:   Thu, 16 Dec 2021 11:32:10 +0530
Message-ID: <CAHLZCaFBVyLm8D0pVEe775JUK97W5eyhvci-N2JWCJQvDuji0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Documentation: KUnit: Rework KUnit documentation
To:     David Gow <davidgow@google.com>,
        Brendan Higgins <brendanhiggins@google.com>, shuah@kernel.org,
        corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tim.bird@sony.com, elver@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello everyone,

Sorry by mistake I sent old patch.

Please ignore.

Thanks,
Harinder Singh

On Thu, Dec 16, 2021 at 11:29 AM Harinder Singh <sharinder@google.com> wrote:
>
> The KUnit documentation was not very organized. There was little
> information related to KUnit architecture and the importance of unit
> testing.
>
> Add some new pages, expand and reorganize the existing documentation.
> Reword pages to make information and style more consistent.
>
> Changes since v2:
> https://lore.kernel.org/linux-kselftest/20211207054019.1455054-1-sharinder@google.com/T/
>
> --Reworded sentences as per comments
> --Expanded the explaination in usage.rst for accessing the current test example
> --Standardized on US english in style.rst
>
> Changes since v1:
> https://lore.kernel.org/linux-kselftest/20211203042437.740255-1-sharinder@google.com/
>
> --Fixed spelling mistakes
> --Restored paragraph about kunit_tool introduction
> --Added note about CONFIG_KUNIT_ALL_TESTS (Thanks Tim Bird for review
> comments)
> -- Miscellaneous changes
>
> Harinder Singh (7):
>   Documentation: KUnit: Rewrite main page
>   Documentation: KUnit: Rewrite getting started
>   Documentation: KUnit: Added KUnit Architecture
>   Documentation: kunit: Reorganize documentation related to running
>     tests
>   Documentation: KUnit: Rework writing page to focus on writing tests
>   Documentation: KUnit: Restyle Test Style and Nomenclature page
>   Documentation: KUnit: Restyled Frequently Asked Questions
>
>  .../dev-tools/kunit/architecture.rst          | 206 +++++++
>  Documentation/dev-tools/kunit/faq.rst         |  73 ++-
>  Documentation/dev-tools/kunit/index.rst       | 172 +++---
>  .../kunit/kunit_suitememorydiagram.png        | Bin 0 -> 24174 bytes
>  Documentation/dev-tools/kunit/run_manual.rst  |  57 ++
>  Documentation/dev-tools/kunit/run_wrapper.rst | 247 ++++++++
>  Documentation/dev-tools/kunit/start.rst       | 198 +++---
>  Documentation/dev-tools/kunit/style.rst       | 105 ++--
>  Documentation/dev-tools/kunit/usage.rst       | 578 ++++++++----------
>  9 files changed, 1049 insertions(+), 587 deletions(-)
>  create mode 100644 Documentation/dev-tools/kunit/architecture.rst
>  create mode 100644 Documentation/dev-tools/kunit/kunit_suitememorydiagram.png
>  create mode 100644 Documentation/dev-tools/kunit/run_manual.rst
>  create mode 100644 Documentation/dev-tools/kunit/run_wrapper.rst
>
>
> base-commit: 4c388a8e740d3235a194f330c8ef327deef710f6
> --
> 2.34.1.173.g76aa8bc2d0-goog
>
