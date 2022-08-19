Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786FC599CD2
	for <lists+linux-doc@lfdr.de>; Fri, 19 Aug 2022 15:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349229AbiHSNKs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Aug 2022 09:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349232AbiHSNKr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 09:10:47 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4C6C88A2
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 06:10:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id n24so2447528ljc.13
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=uKFrZ3vwlxdwh09/xsXJgvCvu9VTWbdfsRBA6e1vjpU=;
        b=euNg5qGd5JSbk0p62h3iLNXxpYDNpd3Pud46E21UOO4yFUwilUzbaOyfjUBFTbwM+8
         5fhJCkXr/y7kvnQTReBHuIOBTkPiHKtCOu8Ek7b4GNDriiNeEA5gHh5xmCtV/5e58qHx
         /XrZMOsBMRKzmAoVoOAnPf+2SaE9TSUrd5vvbDZqVfoR5E04RHf4/lAqq/37RK0vlzvE
         14t8H/5bSCUbL/lLCYzcx0dT5tV27tVABcQhp0OpmH8G4a8oMF1hfUwYra6YGgwXU9V9
         ASKQ7FDbP41u9ICYJtNvDQl83179Fv64dq1Z20V7sSAxD+OkrQGXonQIuEDkHlBDr2Lm
         1TWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=uKFrZ3vwlxdwh09/xsXJgvCvu9VTWbdfsRBA6e1vjpU=;
        b=FGBFREVCp646noKhwpPzdlVe6Sa5R4tYmXfG76MAFt/PD8XY4BrZoAYuvn548Q5dLQ
         uNQJli6GVnzzbuAn/HGOVPvBG3IcpbfnuPIO3w1/OPsxI1VsiZKgE7SC6juZIhQaTpE0
         oBmLBYC9SKsRtbIHA0M/xWM6OktNot2mihY/f2w8jzX7P1rSx1eP+Klm1JHwPCsvVaSh
         eI1e/skhyH73hkz1X5oY7rh66HrluSAZ3ncq5siBVnOUXwYT+25rKY1LmSlZMdsjEARv
         SeKUEfnT4uivT0hhkjsI1b/UPJW3BpaEbSf1O9L35bOET5SydfwzNW6xbgSQwH9wWPK3
         KbXw==
X-Gm-Message-State: ACgBeo3w4WdcXww/nnjofw7PbgUDbn0hFFWTiSqM3yjmyjA+zdE4tnKe
        jc7FT6FYlynDBs7FyFMVIycTV/s+H18duwBObyQg5w==
X-Google-Smtp-Source: AA6agR7jIzNJmDIALATvhAL4BwEEaasrwuluEUsfyaF5qZIoqrmW0Q71qVKl/IlJGdTDHzNTMVTybT7YA4wvGpND+sM=
X-Received: by 2002:a05:651c:1695:b0:261:b5d4:371a with SMTP id
 bd21-20020a05651c169500b00261b5d4371amr1758306ljb.154.1660914636944; Fri, 19
 Aug 2022 06:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220819053234.241501-1-tales.aparecida@gmail.com> <20220819053234.241501-3-tales.aparecida@gmail.com>
In-Reply-To: <20220819053234.241501-3-tales.aparecida@gmail.com>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Fri, 19 Aug 2022 18:40:25 +0530
Message-ID: <CAO2JNKXCiHOD9jNSwdAWaWA3=knYg1eprJBGpzn6gOfncSAV=A@mail.gmail.com>
Subject: Re: [PATCH 2/8] Documentation: KUnit: avoid repeating "kunit.py run"
 in start.rst
To:     Tales Aparecida <tales.aparecida@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        David Gow <davidgow@google.com>, corbet@lwn.net,
        brendan.higgins@linux.dev, Trevor Woerner <twoerner@gmail.com>,
        siqueirajordao@riseup.net, mwen@igalia.com, andrealmeid@riseup.net,
        mairacanal@riseup.net, Isabella Basso <isabbasso@riseup.net>,
        magalilemes00@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks Tales,
Please see my suggestions inline below.

Regards,
Sadiya Kazi


On Fri, Aug 19, 2022 at 11:02 AM Tales Aparecida
<tales.aparecida@gmail.com> wrote:
>
> Combine two sections mentioning "kunit.py run" to streamline the
> getting-started guide.
>
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---
>  Documentation/dev-tools/kunit/start.rst | 38 ++++++++++---------------
>  1 file changed, 15 insertions(+), 23 deletions(-)
>
> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
> index e730df1f468e..165d7964aa13 100644
> --- a/Documentation/dev-tools/kunit/start.rst
> +++ b/Documentation/dev-tools/kunit/start.rst
> @@ -19,7 +19,21 @@ can run kunit_tool:
>
>         ./tools/testing/kunit/kunit.py run
>
> -For more information on this wrapper, see:
> +If everything worked correctly, you should see the following:
> +
> +.. code-block::
> +
> +       Generating .config ...
I also see this as "Configuring KUnit Kernel" when I run
./tools/testing/kunit/kunit.py.

> +       Building KUnit Kernel ...
> +       Starting KUnit Kernel ...
> +
> +The tests will pass or fail.
> +
> +.. note ::
> +   Because it is building a lot of sources for the first time, the
> +   ``Building KUnit kernel`` may take a while.
> +
> +For detailed information on this wrapper, see:
>  Documentation/dev-tools/kunit/run_wrapper.rst.
>
>  Creating a ``.kunitconfig``
> @@ -74,28 +88,6 @@ you if you have not included dependencies for the options used.
>     tools like ``make menuconfig O=.kunit``. As long as its a superset of
>     ``.kunitconfig``, kunit.py won't overwrite your changes.
>
> -Running Tests (KUnit Wrapper)
> ------------------------------
> -1. To make sure that everything is set up correctly, invoke the Python
> -   wrapper from your kernel repository:
> -
> -.. code-block:: bash
> -
> -       ./tools/testing/kunit/kunit.py run
> -
> -If everything worked correctly, you should see the following:
> -
> -.. code-block::
> -
> -       Generating .config ...

Same comment as above

> -       Building KUnit Kernel ...
> -       Starting KUnit Kernel ...
> -
> -The tests will pass or fail.
> -
> -.. note ::
> -   Because it is building a lot of sources for the first time, the
> -   ``Building KUnit kernel`` may take a while.

Minor nit: Because it is building a lot of sources for the first time,
the ``Building KUnit kernel`` step may take a while.

>
>  Running Tests without the KUnit Wrapper
>  =======================================
> --
> 2.37.1
>
