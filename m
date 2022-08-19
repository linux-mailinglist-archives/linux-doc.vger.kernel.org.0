Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6319F599D0E
	for <lists+linux-doc@lfdr.de>; Fri, 19 Aug 2022 15:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbiHSNpR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 19 Aug 2022 09:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349336AbiHSNpM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 09:45:12 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C92F996E
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 06:45:06 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x19so6175676lfq.7
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=UQV96y8LfNEDG3q/syAjV9jY75zYVTkX8CkZyhkomTg=;
        b=h6aoL3OpyziN4v87wRa8QV7I9jZKKrZFNscHUJvCwGX2btCqcnC42Lvxu2SXnUSlN9
         eToRtxJzRC01+ULtNfEmSAvZiyIQ1jgxGTu8n4Z2jyvaaaGriEvuwKt9Q3ZGklkYYbdv
         7EO6pYuVlPf2BQSIGG4sDqjSOQAahNFWCEFmvL0/Dc/AbudWQ8cK+CcGCWPpu/tzcc2Y
         E3Ay5DjSjuX713m0RIoJSf7+dq6ZlBrC1JmZ5bFSrYLmYR5nC12S+bsN/DydXdYHdPul
         jIBOxlNGzeMj+TVDcjpJO/H3e46nzhwq07tZshI8WYt0walHtDNoETzGJ4DnZD2myh3U
         7glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=UQV96y8LfNEDG3q/syAjV9jY75zYVTkX8CkZyhkomTg=;
        b=j2U0uDeq50w1s7QV76EoFOebqyAv/OXglBvLamxrSyoXEOD4zppjWqVJObeo8g2YNl
         +HLMT2yELQxcT3kzKDv2VT9ExKQxYnqODNPyFryJHQxfKYtSemgHgaV7LT7kWPXh9Ack
         ngQvoIf0WXSjHViCvl1AKRCRxoJ22v3FMt7eYOa/vCTOPbcD/Q+nmRO+bbNm9dkawAnD
         7D7f0qSaHcjKsvDuyu621MWsKagJLUCWvIr4ENJsT0FgX3Id0nGjw8lerBRedGIve57G
         UHd7LfS7fdxiK704SGBPEUXx30/NdCdQ0rpYyq9m06SuzZK7zHD2PhdRn5wpQfAhbTDe
         RExQ==
X-Gm-Message-State: ACgBeo3JDt6nzWUxJc01EgyCOwYQpAS5pOh0IdmEj5AJ82sALdZ18n3M
        WAmo8Lwvo6L9Dl1bhtV9w7ilkwLynA2/U0GvNDKQvw==
X-Google-Smtp-Source: AA6agR6pXNLe18s7+AA//lsm5l55nv+vOw7iQLFKs/pf2EYIanOR/qIrsErTfausY/H5DuUqF0AJ89guyJatYgm3LFw=
X-Received: by 2002:a05:6512:3981:b0:48a:6fb9:74b7 with SMTP id
 j1-20020a056512398100b0048a6fb974b7mr2365523lfu.98.1660916704795; Fri, 19 Aug
 2022 06:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220819053234.241501-1-tales.aparecida@gmail.com> <20220819053234.241501-4-tales.aparecida@gmail.com>
In-Reply-To: <20220819053234.241501-4-tales.aparecida@gmail.com>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Fri, 19 Aug 2022 19:14:53 +0530
Message-ID: <CAO2JNKUjHzzfgkdOUYx4cn+y63sbMJ1NEreibs5=hQ_TNB5y7w@mail.gmail.com>
Subject: Re: [PATCH 3/8] Documentation: KUnit: restore note about mrproper in start.rst
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 19, 2022 at 11:02 AM Tales Aparecida
<tales.aparecida@gmail.com> wrote:
>
> The "Getting Started" guide should be beginner-friendly, therefore
> add a note about the requirement of a clean source tree when running
> kunit_tool for the first time, and its related error.
>
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---

Hi Tales,
One suggestion on the note below. You could write the note as:

.. note ::
    You may see the following error:
     "The source tree is not clean, please run 'make ARCH=um mrproper'"

    This happens because internally kunit.py specifies
``.kunit``(default option) as the
    build directory in the command ``make O=output/dir``
    through the argument ``--build_dir``.  Hence, before starting
out-of-tree build,
    the source tree must be clean.

   There is also the same caveat mentioned in the "Build directory for
the kernel"
   section of the :doc:`admin-guide </admin-guide/README>`, that is,
   after its use, it must be used for all invocations of ``make``.
   The good news is that it can indeed be solved by running
  ``make ARCH=um mrproper``, just be aware that this will delete the
   current configuration and all generated files.

Regards,
Sadiya

>  Documentation/dev-tools/kunit/start.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
> index 165d7964aa13..e4b73adde6d0 100644
> --- a/Documentation/dev-tools/kunit/start.rst
> +++ b/Documentation/dev-tools/kunit/start.rst
> @@ -19,6 +19,22 @@ can run kunit_tool:
>
>         ./tools/testing/kunit/kunit.py run
>
> +.. note ::
> +       You might see the error:
> +       "The source tree is not clean, please run 'make ARCH=um mrproper'"
> +
> +       That happens because internally kunit.py specifies the build directory in
> +       the command ``make O=output/dir`` through the argument ``--build_dir``,
> +       which is ``.kunit`` by default, and before starting out-of-tree build,
> +       the source tree must be clean.
> +
> +       There's also the same caveats mentioned in the "Build directory for the kernel"
> +       section of the :doc:`admin-guide </admin-guide/README>`, that is,
> +       after it's used it must be used for all invocations of ``make``.
> +       The good news is that it can indeed be solved by running
> +       ``make ARCH=um mrproper``, just be aware that this will delete the
> +       current configuration and all generated files.
> +
>  If everything worked correctly, you should see the following:
>
>  .. code-block::
> --
> 2.37.1
>
