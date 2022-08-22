Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5F559B957
	for <lists+linux-doc@lfdr.de>; Mon, 22 Aug 2022 08:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbiHVGYC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Aug 2022 02:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbiHVGYB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Aug 2022 02:24:01 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C99DFC2
        for <linux-doc@vger.kernel.org>; Sun, 21 Aug 2022 23:23:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m3so8186730lfg.10
        for <linux-doc@vger.kernel.org>; Sun, 21 Aug 2022 23:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=lXv6C4ziikq0Sk1u9o+9E/ygkgO4M7OfefUbcJQuZS0=;
        b=mf/WJjn1MszBhA+W+uGZlPsR1F6DgH4zptkQ7VA5aENzvFUL9qdXSufI2YS7yugp47
         9sc24THU+WfUoj65q8Kfg0xDch8BkradgaqC8cx+V+YEO8poJNiayd0RZkWV9m+aYh/T
         8YmC6GXvva88i2PjJnsKOhLXEwvLjPrNABuxOo1ROd6INbDejWYZxGm5mvj0J1DVKh5M
         mYsiOb+V1ouTuqnKEH6ZqKAtl2Z7oUizTRvCEaP8kVOI4rkqxPwO8wbRO2byBxYOJXz7
         2Z/AC9bxt2anlNuIcDaw2riRoBU0AKy1DcaHBuD4TMkwFicxRiywySdd+xlrJSe8BH9u
         83GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=lXv6C4ziikq0Sk1u9o+9E/ygkgO4M7OfefUbcJQuZS0=;
        b=Rr5Ejwe9rrRqmmmG5BvEgATqCDVTKNE/2DaeFGTniZI9adiLO92l6nC+xT/Ru8unYq
         H4s+0HVqL0asb33QCfMChINbQmxtCO35ZhIIOmIsYx4zQyEkusyJTTpFIUKc2e6uGkHF
         PuMjUGY/vsWH4xaJ+wnobFDI0mAJDG2zt15T+ApfSHUaQhIITfDeDyHpzzy22kMt02Zg
         pxRtUTqoody/Z+SdKjpm/tzm78m/GiqTH7XRvlKCox42zqbsrAInHh8V8ul8iB6TPImI
         /dGAWVzKTUL1OCI5ugYCt6UO+drTfaX2vzMJf1w2OYt9Jut59g5gOJGyClWZKvwhcqU9
         ysBA==
X-Gm-Message-State: ACgBeo36aE1F3o/KkjwcR9vxpRjeRRFubz/WIzoLLFQHE/Z1n0Xc0YKz
        44z6JcNsASbqh3fAeeAiC5VT89jyG9asOwSPOjk5mA==
X-Google-Smtp-Source: AA6agR4BC0onHpDvAguYukadM/PXtogJuZSt8ELq9PbS1pk+o0G89dG6L7g69m9hnPyfZN6DRJbsjiuQxrL0v32q9Xg=
X-Received: by 2002:ac2:549c:0:b0:492:bdc8:760b with SMTP id
 t28-20020ac2549c000000b00492bdc8760bmr5783930lfk.188.1661149435591; Sun, 21
 Aug 2022 23:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220822022646.98581-1-tales.aparecida@gmail.com> <20220822022646.98581-6-tales.aparecida@gmail.com>
In-Reply-To: <20220822022646.98581-6-tales.aparecida@gmail.com>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Mon, 22 Aug 2022 11:53:44 +0530
Message-ID: <CAO2JNKWwhzhsQhxOzdeUOe-_o90nAXbfaCUg53dta97V5R4nRQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] Documentation: KUnit: add intro to the
 getting-started page
To:     Tales Aparecida <tales.aparecida@gmail.com>
Cc:     Tim.Bird@sony.com, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>,
        corbet@lwn.net, brendan.higgins@linux.dev,
        Trevor Woerner <twoerner@gmail.com>, siqueirajordao@riseup.net,
        mwen@igalia.com, andrealmeid@riseup.net, mairacanal@riseup.net,
        Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 22, 2022 at 8:00 AM Tales Aparecida
<tales.aparecida@gmail.com> wrote:
>
> Describe the objective of the Getting Started page, which should be a
> brief and beginner-friendly walkthrough for running and writing tests,
> showing the reader where to find detailed instructions in other pages.
>
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> Reviewed-by: Ma=C3=ADra Canal <mairacanal@riseup.net>
>
> ---
> Notes:
>     Remove recommendation about having compiled the kernel before using
>     kunit_tool. I changed my mind about it after Tim Bird's highlight.
> ---


Hi Tales,
Thank you for helping with this documentation. You can provide the
below content as an intro to this page:

This page covers information you'll need to know when you're new to
working with KUnit. It includes topics like running tests,
writing a simple test case, and covers common problems users face when
using KUnit for the first time.

Reviewed-by:Sadiya Kazi<Sadiaykazi@google.com>

Regards,
Sadiya




>  Documentation/dev-tools/kunit/start.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-=
tools/kunit/start.rst
> index adf782507999..75fd05286396 100644
> --- a/Documentation/dev-tools/kunit/start.rst
> +++ b/Documentation/dev-tools/kunit/start.rst
> @@ -4,6 +4,10 @@
>  Getting Started
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> +This page contains an overview of the kunit_tool and KUnit framework,
> +teaching how to run existing tests and then how to write a simple test c=
ase,
> +and covers common problems users face when using KUnit for the first tim=
e.
> +
>  Installing Dependencies
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  KUnit has the same dependencies as the Linux kernel. As long as you can
> --
> 2.37.2
>
