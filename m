Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4B3D60139D
	for <lists+linux-doc@lfdr.de>; Mon, 17 Oct 2022 18:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiJQQj1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Oct 2022 12:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiJQQj0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 12:39:26 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D791DB7
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 09:39:23 -0700 (PDT)
Date:   Tue, 18 Oct 2022 00:39:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666024761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xUStZ+3TNtfHwXe4XxfylGhoEweQm5ZXgHZzO2evi8s=;
        b=MQREbA5F9X00Gxfqk0slAfdEES1qy7lFGdXnS7NLEafUOeg8Yrf+fo8tFXsHiGJL/0vQB6
        nLfNsJP4lb4HMHX5ZvwCubcew9ZNkWm06oomZuncL82GtFgrdcG2usGZV6d3mqItQZtlXR
        qmZ8dqDfhY01TakCLi2vhDh2lzkICmU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH 3/3] docs/zh_CN: core-api: Add errseq Chinese translation
Message-ID: <Y02FL+OKQRSCcDBB@bobwxc.mipc>
References: <cover.1665130536.git.zhoubinbin@loongson.cn>
 <f33f5c0983d39e22e617673dbcafca5e610bd76d.1665130536.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f33f5c0983d39e22e617673dbcafca5e610bd76d.1665130536.git.zhoubinbin@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Translate core-api/errseq.rst into Chinese.
> 
> Last English version used:
> 
> commit 14ebc28e07e6 ("errseq: Add to documentation tree").
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks

> ---
>  .../translations/zh_CN/core-api/errseq.rst    | 141 ++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |   5 -
>  2 files changed, 141 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
