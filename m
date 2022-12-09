Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581CA647E3A
	for <lists+linux-doc@lfdr.de>; Fri,  9 Dec 2022 08:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiLIHEj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Dec 2022 02:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiLIHEO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:04:14 -0500
X-Greylist: delayed 385 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 08 Dec 2022 23:02:38 PST
Received: from out-82.mta0.migadu.com (out-82.mta0.migadu.com [IPv6:2001:41d0:1004:224b::52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706AC38A9
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:02:37 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:02:29 +0800
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 04/13] docs/zh_CN: Update the translation of highmem
 to 6.1-rc8
Message-ID: <Y5Ldhbt+okanUScA@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <8b7800e1a20393dc52ad35766f1d81cb0bba8123.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b7800e1a20393dc52ad35766f1d81cb0bba8123.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit a9e9c93966af ("Documentation/mm: add
> details about kmap_local_page() and preemption").
> 
> Commit 84b86f6054c4 ("Documentation/mm: rrefer
> kmap_local_page() and avoid kmap()").
> Commit 6b3afe2eeec2 ("Documentation/mm: avoid
> invalid use of addresses from kmap_local_page()").
> Commit 516ea046ec55 ("Documentation/mm: don't kmap*()
> pages which can't come from HIGHMEM").
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/mm/highmem.rst         | 20 ++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
