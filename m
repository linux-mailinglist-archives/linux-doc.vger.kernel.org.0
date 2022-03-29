Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852464EA691
	for <lists+linux-doc@lfdr.de>; Tue, 29 Mar 2022 06:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiC2Ebc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Mar 2022 00:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiC2Ebb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 00:31:31 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C0331DF9
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 21:29:48 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso703286wmz.4
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 21:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GlF2aB+JhCu4/YboCkIwevoV0JCWHKYkpHYec+xK8yU=;
        b=sH5UDzlazOMgp/F0QFc7WyE98B2OJE1eeHbu1tNEDrCnXNabQkTaN6IbyOt6cfyLtT
         FjjRe/BwF6+Soxf1jFwaxxImiU+kqpK1gFNTD4x6tE/mGnPGoCJcUSTm1C/H0aF9Uy+r
         5opp6MDhAM3Bgx9Lc1YhmVVAjXcW++9QE95jjsFKt4aixqGktffLme1hfzjIFf/Ffq0k
         9+iJ27O8W+TivIe8oGJ6G7HJEu4iHT8V/YPICbSZozFybaym4lDwOOSQWEs6f15y2oen
         J0nCycu2a6/2NXhEyfOP5BSHcuOofrm4ThB/pxYxDRJhOYiGx12JjBoVNXEBd3wkbEli
         ZOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GlF2aB+JhCu4/YboCkIwevoV0JCWHKYkpHYec+xK8yU=;
        b=VBC/t9QfPzQFu3NejNmBb9pcwnle69W1RMj0fc+QK1qJnfpUHsTBlfcCYRuc7hc10T
         88QM3bfyCwj5QVBOVfFjrJptiJdjua+UBsy/A7e7C6Z2on7zXMLVsTf/Lhy8T4N6LhZN
         3byfAF/LsF73gSrjtdy2yh8ratCJy1SaeaXWZmp8KdbHU5lG8tQM8Lzt0e1RJm5otrEK
         fW0DujqguGcQK9p9ndP02ZOz5rblwH4xBLCpi0g17mrlN0mT/zw2XQHRs+Q+MNIFxFNV
         uOaV2BJUeNFr1zoiIVacv5wXt0p6EZGJyNpgszjhgbmBcHFnKbxJbtFOSAScGeG2d1Gk
         svZw==
X-Gm-Message-State: AOAM5306a21djnUGgjv9tIfjg4tVj0OTyGUdqvpBJa1o5uqai2QeGT8v
        GUn3OoLkrF2DsULg9hwyfDxe2KSyPssq8El9uUf3yA==
X-Google-Smtp-Source: ABdhPJyNFK7OBo01/MPtifFb+6i74vavXN/36eXTCKIvjxpkj92xS+4Xt+srORBU3PHcnLIAaPsTL5GBgeOa809iVtY=
X-Received: by 2002:a7b:c541:0:b0:38c:b0ed:31c4 with SMTP id
 j1-20020a7bc541000000b0038cb0ed31c4mr3961723wmk.141.1648528186728; Mon, 28
 Mar 2022 21:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <YkImfPbNOzQBq5ZD@marsc.168.1.7>
In-Reply-To: <YkImfPbNOzQBq5ZD@marsc.168.1.7>
From:   David Gow <davidgow@google.com>
Date:   Tue, 29 Mar 2022 12:29:35 +0800
Message-ID: <CABVgOSkPwn9bQgXTmrnMRuxy5cyeNxoUgrXFX_ayw0UBW9O7=g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dev-tools: Add a section for static
 analysis tools
To:     Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Latypov <dlatypov@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-sparse@vger.kernel.org, cocci@inria.fr,
        smatch@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
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

On Tue, Mar 29, 2022 at 5:20 AM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> Complement the Kernel Testing Guide documentation page by adding a
> section about static analysis tools.
>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> ---
> Hey everyone,
>
> I think this patch can be a good addition to the documentation as
> discussed in the thread for the testing guide documentation page:
> Link: https://lore.kernel.org/linux-doc/CABVgOS=2iYtqTVdxwH=mcFpcSuLP4cpJ4s6PKP4Gc-SH6jidgQ@mail.gmail.com/
>
> If you think it would be worth it, I can try making something more
> elaborated. Maybe provide some guidance on when to use each tool.
> I've been studying how Linux device drivers are tested.
> Here's a post I wrote talking about some testing tools.
> Link: https://marcelosc.gitlab.io/how-is-linux-tested/
>
> Best regards,
> Marcelo
>

Thanks a lot for adding to this, and for writing that blog post, which
I think is an excellent overview itself. I'd definitely like to see
more of it work its way into this document. (While we've largely stuck
to tools which are in-tree thus far, I think we'd definitely benefit
from discussion of, for example, the different CI systems.)

One thing which isn't totally clear is when to use one of these tools
instead of another. This is a bit awkward, given that there is a bit
more overlap (and the existing documentation is less clear), but
comparing the "calling this specific kernel function incorrectly is
causing this very specific bug" nature of Coccinelle with the "there's
a bunch of typechecking so you can statically prove you didn't forget
an endianness conversion somewhere" things sparse does.

(Take those with a grain of salt, though, as I confess to not being an
expert with any of these tools...)

I've added a few other ideas inline, below, which you can take or
leave as you see fit. Either way, I think this is a great improvement
on not talking about static analysis tools at all, so thanks.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  Documentation/dev-tools/testing-overview.rst | 29 ++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/Documentation/dev-tools/testing-overview.rst b/Documentation/dev-tools/testing-overview.rst
> index 65feb81edb14..b00511109a9d 100644
> --- a/Documentation/dev-tools/testing-overview.rst
> +++ b/Documentation/dev-tools/testing-overview.rst
> @@ -115,3 +115,32 @@ that none of these errors are occurring during the test.
>  Some of these tools integrate with KUnit or kselftest and will
>  automatically fail tests if an issue is detected.
>
> +Static Analysis Tools
> +======================
> +
> +In addition to testing a running kernel, one may also scout for bugs by
> +analyzing the source code semantics. Three tools are well known for serving this
> +purpose.

It might be worth being a bit more explicit that these run _at compile time_.

Maybe this would also be the right place to document CONFIG_WERROR?
Though that is slightly different yet again...

> +
> +Sparse can help test the kernel by performing type-checking, lock checking,
> +value range checking, in addition to reporting various errors and warnings while
> +examining the code. See the Documentation/dev-tools/sparse.rst documentation
> +page for details on how to use it.

It'd be nice to give an example of the extended type-checking here.
e.g., endianness checks: https://lwn.net/Articles/205624/

> +
> +Smatch extends Sparse and provides additional checks for programming logic
> +mistakes such as missing breaks in switch statements, unused return values on
> +error checking, forgetting to set an error code in the return of an error path,
> +etc. Smatch also has tests against more serious issues such as integer
> +overflows, null pointer dereferences, and memory leaks. See the project page at
> +http://smatch.sourceforge.net/.
> +
> +We also have Coccinelle as an option within static analyzers. Coccinelle is

Nit: _maybe_ it's worth simplifying this to just "Coccinelle is
another static analyzer" or similar, so that all of these paragraphs
start with the name of the tool being talked about. That makes it a
bit easier to skim the page.

> +often used to aid collateral evolution of source code, but it can also help to

Nit: It's not entirely obvious what "collateral evolution of source
code" is. Would "refactoring" be close enough?

> +avoid certain bugs that have been expressed semantically. The types of tests
> +available include API tests, tests for correct usage of kernel iterators, checks
> +for the soundness of free operations, analysis of locking behavior, and further
> +tests known to help keep consistent kernel usage. See the
> +Documentation/dev-tools/coccinelle.rst documentation page for details.

Maybe talk about how Coccinelle is matching specific (and often
kernel-specific) patterns?

> +
> +These static analysis tools support running tests on the whole source tree or
> +over a specific file or directory.
> --
> 2.35.1
>
