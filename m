Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630304D9D6B
	for <lists+linux-doc@lfdr.de>; Tue, 15 Mar 2022 15:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236350AbiCOO0v (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Mar 2022 10:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbiCOO0u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Mar 2022 10:26:50 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE41F527C1
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 07:25:38 -0700 (PDT)
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KHwYM3q7Tzcb4P;
        Tue, 15 Mar 2022 22:20:39 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 22:25:36 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 22:25:36 +0800
Subject: Re: [PATCH] docs/zh_CN: Fix typo in process/howto.rst
To:     Zhou Yuheng <woshoxxx@gmail.com>, <alexs@kernel.org>
CC:     <linux-doc@vger.kernel.org>
References: <20220315141100.4996-1-woshoxxx@gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <8334bda0-a5e0-760b-5c2e-e144e96ab1c9@huawei.com>
Date:   Tue, 15 Mar 2022 22:25:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20220315141100.4996-1-woshoxxx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_50,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/3/15 22:11, Zhou Yuheng wrote:
>    - Change the full-width symbol into half-width symbol for the url of linux-next to make it can be accessed.

The first '-' is redundant. No more than 72 characters per line.

Also, you should change the patch version after modify it.
For example, this should be 'PATCH V2'. 

Regards,
Tang


> Signed-off-by: Zhou Yuheng <woshoxxx@gmail.com>
> ---
>  Documentation/translations/zh_CN/process/howto.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
> index 2903d7161..1334cdb32 100644
> --- a/Documentation/translations/zh_CN/process/howto.rst
> +++ b/Documentation/translations/zh_CN/process/howto.rst
> @@ -252,7 +252,7 @@ Linux-next 集成测试树
>  在将子系统树的更新合并到主线树之前，需要对它们进行集成测试。为此，存在一个
>  特殊的测试存储库，其中几乎每天都会提取所有子系统树：
>  
> -        https://git.kernel.org/？p=linux/kernel/git/next/linux-next.git
> +        https://git.kernel.org/?p=linux/kernel/git/next/linux-next.git
>  
>  通过这种方式，Linux-next 对下一个合并阶段将进入主线内核的内容给出了一个概要
>  展望。非常欢冒险的测试者运行测试Linux-next。
> 
