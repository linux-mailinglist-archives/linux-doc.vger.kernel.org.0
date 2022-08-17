Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545955969AF
	for <lists+linux-doc@lfdr.de>; Wed, 17 Aug 2022 08:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbiHQGlk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Aug 2022 02:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiHQGli (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Aug 2022 02:41:38 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3092E4D4F4
        for <linux-doc@vger.kernel.org>; Tue, 16 Aug 2022 23:41:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v2so17834689lfi.6
        for <linux-doc@vger.kernel.org>; Tue, 16 Aug 2022 23:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=gyS63QYVOSXbJbkCMWQTHJu+HMhf9dFWV5AbgmswWB4=;
        b=DlPzpQDdQkyHxNy6Qvs+2JB1BekXQva0JhudLKDBrHIbcqN/KJVVb9QIO5bSgk4YiO
         ob9bkoN55Idu77b3pPG0B9NTrZU7NPRxTHUwKTdxWaDsoJLAvD/eay9gF/oM5nfVJ2Qo
         ioo4H/PfTDyVzhN+eCwjz1jEN08EFrGUCSpCreLG+6DGWqrBzOOE30qySvXSQFGb1Q1+
         tdtzfhSUP1Y8fwJEeCWSU2bf+pE8Xs2OFGKHFU63vj83MMc85t5+UvfGascVsoh261Ca
         wyYQxuYHwyAN50q2K4/JHBKopKKWxy9flXLhvkBeeGv9mLg+ZSf4gHRYe4SM6yyWpC8P
         uVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=gyS63QYVOSXbJbkCMWQTHJu+HMhf9dFWV5AbgmswWB4=;
        b=L/Yh6jOwHDudofM9MXYIlk6FnjVfPkXZDIR1HBtjhEonhHChx8KHxOEACo2hDwIpYC
         CkrNKBh/WXib+KwvEFW5LJIku4z81lgimBOMOFtnxKKOZAvJQ9IDKKKqapMW+UxgzdjK
         IOU87fiowfmBVgNuSXNEKhiqASseUMyLqqVw7oJpaYcr9ng4oSydq0/ob/MfFzj682vW
         ajjaOkGhHku8kZnyiksAKR6ixWdnpCobZvMNYVQmhhl0aV4kRnSVfe7VLxmD2W5SCK5k
         ZB00qjZfk65f2G6gjGHFD0ifRNrAbGZK4yf6A1MPs/NAS292SgVST6sP8YR/+LpWQIvF
         XnuQ==
X-Gm-Message-State: ACgBeo1uwxbP/MNc5hXWy/0dGIjT0VV+r4JdeiWf/5u19YC8h9i7eV59
        bdbf6LV04C8KrNhbVtXNn7CfNKw/d7f4F8dmo7lh6w==
X-Google-Smtp-Source: AA6agR7DzH0SNfTXEpTGFS6iRsNRKEgPo7aS1SYAHQNpx4oKojr45DjrvgjaSgSr/F9/wc5OUA9G51WplGI/KFJdVlA=
X-Received: by 2002:a05:6512:1190:b0:48c:bf4e:b64 with SMTP id
 g16-20020a056512119000b0048cbf4e0b64mr8659854lfr.239.1660718485398; Tue, 16
 Aug 2022 23:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220813042055.136832-1-tales.aparecida@gmail.com> <20220813042055.136832-2-tales.aparecida@gmail.com>
In-Reply-To: <20220813042055.136832-2-tales.aparecida@gmail.com>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Wed, 17 Aug 2022 12:11:13 +0530
Message-ID: <CAO2JNKWjX9UxsjOjEpZ5RM_yq1R2R_BE1Wg8rkt0g-tMiD_vkg@mail.gmail.com>
Subject: Re: [PATCH 1/4] Documentation: kunit: fix trivial typo
To:     Tales Aparecida <tales.aparecida@gmail.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>, corbet@lwn.net,
        Trevor Woerner <twoerner@gmail.com>, siqueirajordao@riseup.net,
        mwen@igalia.com, andrealmeid@riseup.net, mairacanal@riseup.net,
        Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 13, 2022 at 9:51 AM Tales Aparecida
<tales.aparecida@gmail.com> wrote:
>
> Missing closing block-quote
>
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---


Hi,
I do agree with David on a more descriptive commit message to be
addressed in future patches. Otherwise, it looks good to me.

Reviewed-by: Sadiya Kazi <sadiyakazi@google.com>

Best Regards,
Sadiya




>  Documentation/dev-tools/kunit/run_wrapper.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
> index cce203138fb7..db1e867820e7 100644
> --- a/Documentation/dev-tools/kunit/run_wrapper.rst
> +++ b/Documentation/dev-tools/kunit/run_wrapper.rst
> @@ -30,7 +30,7 @@ We may want to use the following options:
>
>  .. code-block::
>
> -       ./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all
> +       ./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all`
>
>  - ``--timeout`` sets a maximum amount of time for tests to run.
>  - ``--jobs`` sets the number of threads to build the kernel.
> --
> 2.37.1
>
