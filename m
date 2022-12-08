Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCEA2647063
	for <lists+linux-doc@lfdr.de>; Thu,  8 Dec 2022 14:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiLHND6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 8 Dec 2022 08:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiLHND6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Dec 2022 08:03:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56838CE01
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 05:03:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E439F61EFF
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 13:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583EEC43146
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670504636;
        bh=tl+d3Z3AsJlB3fiahmcIVRdWy1uPD4pAhlt3VPhadaA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gk7aYMA/BrgegS4Q+M6EFs2n4BeBTSv+qRkpRNEIZ1XXbxMqMPEMuTG6H1HOEf28P
         hFp5tdXbqqIRadHoDasQll33Ft7qe2CHXhWm9CQAyqLu+EjdMtqANhnngAy7H3HT9Y
         8rOKJlZYpUAbWz2TGtRgH8/TNn/OprQctBkCTJP19nKSMreSkc0TvfWgbi+XAfCejP
         XTnD1YCENpy1hj79oSjKXF7mRQWqgmlLV/ciq58tYmkRehPKh2zGDx+D2IY+60zq2u
         M76iJ7Zj9lwquiug7VnLOrDxvk/RS2xB/Ie0mzz1IrPAgaVcQXX2rxZCM2FtNgcrKg
         Yy6Wt1S22v8lw==
Received: by mail-ej1-f41.google.com with SMTP id bj12so3600163ejb.13
        for <linux-doc@vger.kernel.org>; Thu, 08 Dec 2022 05:03:56 -0800 (PST)
X-Gm-Message-State: ANoB5pkHyiV9fTs5Sp1xUzpbY+JTZkzkZVbUTkOB2Gvkx9tZNfrXOURr
        fGFeI2hTd9pp70OrRz4qq2+Geg0z6SNbLFTdfsk=
X-Google-Smtp-Source: AA0mqf5xY99CiJogo1znZHDU86WngN3UZB5D1fanOsf7g1H2xVrXWIQF6OkemgK6SDXsXA60nTHLTW49f+aZ0GsjOf8=
X-Received: by 2002:a17:907:9951:b0:7b2:7e7a:11c1 with SMTP id
 kl17-20020a170907995100b007b27e7a11c1mr62167508ejc.684.1670504634539; Thu, 08
 Dec 2022 05:03:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670289933.git.siyanteng@loongson.cn>
In-Reply-To: <cover.1670289933.git.siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 8 Dec 2022 21:03:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7rjMMZnz3SG4usNn0PvDZVj=Gp3zQUovn4a3fkSENseA@mail.gmail.com>
Message-ID: <CAAhV-H7rjMMZnz3SG4usNn0PvDZVj=Gp3zQUovn4a3fkSENseA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] docs/LoongArch: Add English and Chinese versions
 of booting
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        kernel@xen0n.name, wu.xiangcheng@linux.dev,
        jiaxun.yang@flygoat.com, liuyun@loongson.cn,
        linux-doc@vger.kernel.org, loongarch@lists.linux.dev,
        siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Applied, thanks.

Huacai

On Tue, Dec 6, 2022 at 10:10 AM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> v5:
> * Add LINUX_PE_MAGIC.
> * Modify some words under Xuerui's advice.
>
> v4:
> LoongArch supports ACPI and FDT, so let's add the description of fdt.
>
> v3:
> * Add a description about boot parameters (a0=efi_boot a1=cmdline a2=systemtable),
>   and then rename the file to booting.rst.
> * remove some blank line.
>
> v2:
> * Fix magic start address.
> * res14 -> res4.
>
> v1:
> * Add boot image header.
> * Translate boot-image-header into Chinese.
>
> Yanteng Si (2):
>   docs/LoongArch: Add booting
>   docs/zh_CN: Add booting Chinese translation
>
>  Documentation/loongarch/booting.rst           | 43 +++++++++++++++++
>  Documentation/loongarch/index.rst             |  1 +
>  .../translations/zh_CN/loongarch/booting.rst  | 48 +++++++++++++++++++
>  .../translations/zh_CN/loongarch/index.rst    |  1 +
>  4 files changed, 93 insertions(+)
>  create mode 100644 Documentation/loongarch/booting.rst
>  create mode 100644 Documentation/translations/zh_CN/loongarch/booting.rst
>
> --
> 2.31.1
>
>
