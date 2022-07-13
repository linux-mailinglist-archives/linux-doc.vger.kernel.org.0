Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464A1573D94
	for <lists+linux-doc@lfdr.de>; Wed, 13 Jul 2022 22:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiGMUIc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Jul 2022 16:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiGMUIb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jul 2022 16:08:31 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF8430F54
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 13:08:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5F64D2B2;
        Wed, 13 Jul 2022 20:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5F64D2B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1657742910; bh=eq2cgcwTj962irmX/6ohrdU9WGs9RBv+OVFDV9bUPEg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bLNHhRknytE2t6Rt4Ye/RR5+mR+qO+MkNsF6cF6sHRJHFIOx+PvFnodOh1SE5NJSQ
         +hpFVqYZ56/HA+tW+mC1PtNk0yv9JnS5MFx5lA01Qcb/lF4iQpZ8Z9XjMrNf2Z3RNh
         56IUJdr3nMHnYbzbin2bYCk769GAB0Kzf/E8Yk06fuFhzJxVwIvOF1whJsfELwTeXZ
         qcjKhbOc9vnrzp4e+HEAE1EjNpikXKRQzxvben9aFeiztCC++Mtb5PZikcPR5D9Z0v
         AmsWCkN+0a+3/ReJ3mw+LgBNzgnwwzWqfPrJsxb8xfXBDPKDH3uktjUgW4uHD8n0ID
         bz051afWkUlvw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     xu xin <xu.xin16@zte.com.cn>, Yang Yang <yang.yang29@zte.com.cn>,
        Junhua Huang <huang.junhua@zte.com.cn>,
        Tang Yizhou <yizhou.tang@shopee.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Add a new translation of
 reporting-regressions.rst
In-Reply-To: <YsbuDGIpUjOzfAAh@bobwxc.mipc>
References: <YrZufcSEnvBWj+7Z@bobwxc.mipc> <YsbuDGIpUjOzfAAh@bobwxc.mipc>
Date:   Wed, 13 Jul 2022 14:08:29 -0600
Message-ID: <87tu7k3hdu.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Last English version used:
>
> commit d2b40ba2cce2 ("docs: *-regressions.rst: explain how quickly
> issues should be handled")
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> v2:
> * fix all existed file path
> * modified some words under Yanteng's advice, thanks
>
> v1:
> see <https://lore.kernel.org/linux-doc/YrZufcSEnvBWj+7Z@bobwxc.mipc/>
>
>  .../translations/zh_CN/admin-guide/index.rst  |   2 +-
>  .../admin-guide/reporting-regressions.rst     | 370 ++++++++++++++++++
>  2 files changed, 371 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/reporting-regressions.rst

Applied, thanks.

jon
