Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6DB606F52
	for <lists+linux-doc@lfdr.de>; Fri, 21 Oct 2022 07:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiJUFTQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Oct 2022 01:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiJUFTA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 01:19:00 -0400
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6312E1B5777
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 22:18:59 -0700 (PDT)
Date:   Fri, 21 Oct 2022 13:18:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666329537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aiqI7NwNTsoActA5CTZ2tuIv85M5FYkKJE5OgRKEtHQ=;
        b=JxV6q9t545fYH/yCtgblZpXXX6hDREyX5O5rFzUkydvQJ3+fMX1hBGL/c327btkhOb7J+x
        4Gt5QdiyZmS0rV95MOjQ3uj8G3D5epsY0LNs2qZPfdbsx7lSpTi1irS/EtnXLUCeCywFTd
        e7121915ydUFt0JRDFSpKBgqRT6W874=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND V2 1/3] docs/zh_CN: core-api: Add this_cpu_ops
 Chinese translation
Message-ID: <Y1Irq061tkm5nCuq@bobwxc.mipc>
References: <cover.1666171735.git.zhoubinbin@loongson.cn>
 <f9a8cb188bc35811d7f074f9d5f607f5a48c6503.1666171735.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9a8cb188bc35811d7f074f9d5f607f5a48c6503.1666171735.git.zhoubinbin@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-10-21 (五) 09:58:07 +0800 Binbin Zhou 曰：
> Translate core-api/this_cpu_ops.rst into Chinese.
> 
> Last English version used:
> 
> commit c9b54d6f362c ("docs: move other kAPI documents to core-api").
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../zh_CN/core-api/this_cpu_ops.rst           | 285 ++++++++++++++++++
>  2 files changed, 286 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_ops.rst

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

