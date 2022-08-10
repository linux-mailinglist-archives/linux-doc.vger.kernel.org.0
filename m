Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5EB058EA31
	for <lists+linux-doc@lfdr.de>; Wed, 10 Aug 2022 12:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbiHJKD6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Aug 2022 06:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbiHJKD6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Aug 2022 06:03:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEA06DF85
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 03:03:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9189C61162
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 10:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F033FC4347C
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660125836;
        bh=dg9tOiy7zdVcMZUUUjXEjvecZdLTu1yBVce8bK+j3SE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nmqEXvDLaibuuW7LgUYyLhmlyjJt42NzS2xt+AhOgjhSoFmUUkrkuA1ZMe3ET2g3N
         0yEAOX0tCcEHwuCrnmgFtUVFk04LyfXaCRXBg3THryITi3UluEUiZXgWvvvVTC+s3t
         KooiR8x1RD71HzWJvfnCizfdDf0xcmYkZdxPYmhJIACYys0Z23GZiplXtT/w+8D1oJ
         appfmc1OM1AqwCh0QJumHTx4t4wci6XYhq32lRRbOGSsZkBedjCbHMQSou18NYfThf
         oop2r3SiTjXf0jUTubqYj4MxqzjbO1tbHHT3tiBwYLRdHLG0oZGdJ8PwU3W/AtY5HB
         6OPcUZ1u5bf6g==
Received: by mail-vs1-f42.google.com with SMTP id q15so14658915vsr.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 03:03:55 -0700 (PDT)
X-Gm-Message-State: ACgBeo2KYzXapNdU/2qs22PxMycJp1atcky4g5tcKrozgTNzb36Yp+Dg
        hun0ttwlWAxfuon9sqzzZxfqVKz8FgbbBwRaQ4E=
X-Google-Smtp-Source: AA6agR5ILJMqDCXhymJ1EInz17uhJo8/SdfaZV/kiRbKKE4Db/XF0BzNbmmuvKcZfKgQPcc/Z63sdPu+G8DedD8Mkuc=
X-Received: by 2002:a05:6102:390d:b0:387:78b9:bf9c with SMTP id
 e13-20020a056102390d00b0038778b9bf9cmr11373977vsu.43.1660125834950; Wed, 10
 Aug 2022 03:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <1660117275-576-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1660117275-576-1-git-send-email-yangtiezhu@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Wed, 10 Aug 2022 18:03:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H46c+6+Fg7kGzUHJs4D02N3BRD7n1TwvNMae0aN++QX3Q@mail.gmail.com>
Message-ID: <CAAhV-H46c+6+Fg7kGzUHJs4D02N3BRD7n1TwvNMae0aN++QX3Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] LoongArch: Add I14 description in documentation
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     WANG Xuerui <kernel@xen0n.name>, Jonathan Corbet <corbet@lwn.net>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>, loongarch@lists.linux.dev,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Queued for loongarch-next, thanks.

Huacai

On Wed, Aug 10, 2022 at 3:41 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> v3: Split into two patches suggested by Yanteng, thank you.
>
> Tiezhu Yang (2):
>   docs/LoongArch: Add I14 description
>   docs/zh_CN/LoongArch: Add I14 description
>
>  Documentation/loongarch/introduction.rst                    | 2 +-
>  Documentation/translations/zh_CN/loongarch/introduction.rst | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> --
> 2.1.0
>
>
