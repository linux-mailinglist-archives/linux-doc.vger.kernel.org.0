Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C1E4EE548
	for <lists+linux-doc@lfdr.de>; Fri,  1 Apr 2022 02:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242662AbiDAAYI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 31 Mar 2022 20:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbiDAAYG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Mar 2022 20:24:06 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FC323F3E6
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 17:22:18 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n35so734474wms.5
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 17:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SKqz1Mdn+a76YTOAN4pkLcsDdxqMIb341GyJ1mMbn4g=;
        b=r7/0P+gLeJObOX79hjnX/5UuEQeJl4zuAbrJGyhV08YNdiRMj8TzrvJbe5YkmUAGWY
         mZhA9emHoEHCn4lEv4EvNc8fqo4nqUyfDQFq4BEwCQx/DTtnpWDwjd3/IaEZsI8pSqyS
         WjpMp3DpVBxwsEJ95nCBJ+/pczjqk7ilCSfpnVILZ7SWNsYZmbp3MDKNhETQzOYksHYF
         qhGFQxDs8lUwKxvSdlJn+vSLlyHqbuXTRb1N11WJyph0kUPERw3FVbCryrZTBj2Tweo9
         RJpGE7f0J9S2buBc0BEs6Q2CQdJ5UwjnCB//QwYVmRQoKId9dxhttnNc/CCDe/PtT7UL
         PY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SKqz1Mdn+a76YTOAN4pkLcsDdxqMIb341GyJ1mMbn4g=;
        b=skr3sruwbi3dgwYk/sgkrVZzFkH+dEnhlDwRwb1Rdf91g5KZjIE/+Qd3Q1jrtH79Vj
         7J7eRkt4TroPN8EgfSEYOXYLOKmlrfenVvNBdNtEFv2tjqJpYsjru65+vICkMuoRM1+9
         0XO2ffO/0qmFjNsMsEpHQfjXvra6YMf7F2e/BVGdhiUA1hwCeO9vU1aQEj0g2cCxDJgg
         6ahNpyM6VNsmRPvlgSQhE8RMbCIHGsw/foETQeQ5ROB3rmDP4rO/pmSqIywmhuUWNcP5
         fFKEs0Uzhtla6eDe4RrPvBy2wYo+UpF21q1csmROGkJUffVpLqwJoXy1PugBGhAViZ5n
         pmLQ==
X-Gm-Message-State: AOAM532lVRGnOe5bZgKK6OwIyiZgfUAeTMd1rqPB/V1pr0ROJvT10tbX
        AVcBe6HcmUYO9B63aCdcEai9aRA7Q2twRUQFJN0rrg==
X-Google-Smtp-Source: ABdhPJyXs2kiijhvj7ZEIkf4LgFEBAL3bNGbwnp9Hp9Ce+KJcEqlpKTa5nUQk4PlzawW8Gaz7vFgZm/0MW22sAEhJh4=
X-Received: by 2002:a05:600c:4f48:b0:38c:a460:cb6 with SMTP id
 m8-20020a05600c4f4800b0038ca4600cb6mr6654078wmq.96.1648772536629; Thu, 31 Mar
 2022 17:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648674305.git.marcelo.schmitt1@gmail.com> <62f461a20600b95e694016c4e5348ef2e260fa87.1648674305.git.marcelo.schmitt1@gmail.com>
In-Reply-To: <62f461a20600b95e694016c4e5348ef2e260fa87.1648674305.git.marcelo.schmitt1@gmail.com>
From:   David Gow <davidgow@google.com>
Date:   Fri, 1 Apr 2022 08:22:05 +0800
Message-ID: <CABVgOSktSP6GwU+zfJLC7A-UZUKT0QHSmACG-ScFDhb34Jf-aw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Documentation: dev-tools: Enhance static analysis
 section with discussion
To:     Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Latypov <dlatypov@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-sparse@vger.kernel.org, cocci@inria.fr,
        smatch@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>, julia.lawall@inria.fr
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

On Thu, Mar 31, 2022 at 5:50 AM Marcelo Schmitt
<marcelo.schmitt1@gmail.com> wrote:
>
> Enhance the static analysis tools section with a discussion on when to
> use each of them.
>
> This was mainly taken from Dan Carpenter and Julia Lawall's comments on
> a previous documentation patch for static analysis tools.
>
> Lore: https://lore.kernel.org/linux-doc/20220329090911.GX3293@kadam/T/#mb97770c8e938095aadc3ee08f4ac7fe32ae386e6
>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Acked-by: David Gow <davidgow@google.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Julia Lawall <julia.lawall@inria.fr>
> ---
> Change log v2 -> v3:
> - Changed the paragraph about Sparse to make it sound better (hopefully)
> - Minor adjusts to make the considerations about Coccinelle sound better
>   and be precise

These (plus the cut down note on Sparse/Smatch overlaps) are
definitely an improvement.

Assuming no-one with more knowledge of these that me objects, I think
this is good-to-go!

Thanks,
-- David
