Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8CC354DED9
	for <lists+linux-doc@lfdr.de>; Thu, 16 Jun 2022 12:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbiFPKY4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Jun 2022 06:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbiFPKY4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 06:24:56 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180BB5A2D3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=Bjg8iCDWz/lcRB0wRJa6/rgnIqtAkIg41Hfcv
        l8qnvE=; b=a7XvAUXFTUOD84wZlYYqRgiORFf8C9448lw+eY9JJBHvYa9crtFXc
        hQt7kbos7W8iaqoX10Ugxwa/naSCajy/KOznLQaOY0gi86mbt9yLa68+BHtw26Wt
        99mDYlLT6mSu8lOmxgmT+MKErmFgtbsSKut59cuIJYE+cCKo3wAPUg=
Received: from bobwxc.mipc (unknown [120.242.68.214])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDnjhPnBKtimGUKAA--.33974S2;
        Thu, 16 Jun 2022 18:24:40 +0800 (CST)
Date:   Thu, 16 Jun 2022 18:24:39 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn
Subject: Re: [PATCH v3 2/3] docs/zh_CN: Update the translation of page_owner
 to 5.19-rc1
Message-ID: <YqsE50DtAWecFE/G@bobwxc.mipc>
References: <cover.1655362610.git.siyanteng@loongson.cn>
 <e96557b73b036c33a9fa5abdab0c541704235e92.1655362610.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e96557b73b036c33a9fa5abdab0c541704235e92.1655362610.git.siyanteng@loongson.cn>
X-CM-TRANSID: GiKnCgDnjhPnBKtimGUKAA--.33974S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGw17CFW7AF48Jr1xAw13Jwb_yoWrAF1xp3
        srKryUJ3WIy3W3ZFyUK3yv9F18Gw4fWw4UKay8Ka98Xr1DJFZaqrWqkayqqw45Ka48Jayf
        XrWjkrW2yF92vrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Gw1l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x0zR_HUgUUUUU=
X-Originating-IP: [120.242.68.214]
X-CM-SenderInfo: pere453f6hztlloou0/
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 16, 2022 at 03:44:57PM +0800, Yanteng Si wrote:
> update to commit d1ed51fcdbd6 ("docs: vm/page_owner: tweak
> literal block in STANDARD FORMAT SPECIFIERS")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/vm/page_owner.rst      | 79 ++++++++++++++++---
>  1 file changed, 70 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/vm/page_owner.rst b/Documentation/translations/zh_CN/vm/page_owner.rst
> index 9e951fabba9d..0034d2ae1cd5 100644
> --- a/Documentation/translations/zh_CN/vm/page_owner.rst
> +++ b/Documentation/translations/zh_CN/vm/page_owner.rst
> @@ -96,21 +96,82 @@ page owner在默认情况下是禁用的。所以，如果你想使用它，你
>     默认情况下， ``page_owner_sort`` 是根据buf的时间来排序的。如果你想
>     按buf的页数排序，请使用-m参数。详细的参数是:
>  
> -   基本函数:
> +   基本函数::
>  
> -	Sort:
> +	排序:
>  		-a		按内存分配时间排序
>  		-m		按总内存排序
>  		-p		按pid排序。
>  		-P		按tgid排序。
> +		-n		按任务命令名称排序。
>  		-r		按内存释放时间排序。
>  		-s		按堆栈跟踪排序。
>  		-t		按时间排序（默认）。
> -
> -   其它函数:
> -
> -	Cull:
> -		-c		通过比较堆栈跟踪而不是总块来进行剔除。
> -
> -	Filter:
> +       --sort <order> 指定排序顺序。排序的语法是[+|-]key[,[+|-]key[,...]]。从
> +       **标准格式指定器**那一节选择一个键。"+"是可选的，因为默认的方向是数字或
> +       词法的增加。允许混合使用缩写和完整格式的键。
> +
> +        例子:
> +				./page_owner_sort <input> <output> --sort=n,+pid,-tgid
> +				./page_owner_sort <input> <output> --sort=at
> +
> +    其它函数::
> +
> +	剔除:
> +		--cull <rules>
> +		        指定剔除规则。剔除的语法是key[,key[,...]]。从**标准格式指定器**
> +				部分选择一个多字母键。
> +		<rules>是一个以逗号分隔的列表形式的单一参数，它提供了一种指定单个剔除规则的
> +		方法。 识别的关键字在下面的**标准格式指定器**部分有描述。<规则>可以通过键的
> +		序列k1,k2,...来指定，在下面的标准排序键部分有描述。允许混合使用简写和完整形
> +		式的键。
> +
> +		Examples:
> +				./page_owner_sort <input> <output> --cull=stacktrace
> +				./page_owner_sort <input> <output> --cull=st,pid,name
> +				./page_owner_sort <input> <output> --cull=n,f
> +
> +	过滤:
>  		-f		过滤掉内存已被释放的块的信息。
> +
> +	选择:
> +		--pid <pidlist>		按pid选择。这将选择进程ID号出现在<pidlist>中的块。
> +		--tgid <tgidlist>	按tgid选择。这将选择其线程组ID号出现在<tgidlist>
> +		                    中的块。
> +		--name <cmdlist>	按任务命令名称选择。这将选择其任务命令名称出现在
> +		                    <cmdlist>中的区块。
> +
> +		<pidlist>, <tgidlist>, <cmdlist>是以逗号分隔的列表形式的单个参数，
> +		它提供了一种指定单个选择规则的方法。
> +
> +
> +		例子:
> +				./page_owner_sort <input> <output> --pid=1
> +				./page_owner_sort <input> <output> --tgid=1,2,3
> +				./page_owner_sort <input> <output> --name name1,name2
> +
> +标准格式指定器
> +==============
> +::
> +
> +  --sort的选项:
> +
> +	键		键长		描述
> +	p		pid		进程ID
> +	tg		tgid		线程组ID
> +	n		name		任务命令名称
> +	st		stacktrace	页面分配的堆栈跟踪
> +	T		txt		块的全文
> +	ft		free_ts		页面发布时的时间戳
> +	at		alloc_ts	页面被分配时的时间戳
> +	ator		allocator	页面的内存分配器
> +
> +  --curl的选项:
> +
> +	键		键长		描述
> +	p		pid		进程ID
> +	tg		tgid		线程组ID
> +	n		name		任务命令名称
> +	f		free		该页是否已经发布
> +	st		stacktrace	页面分配的堆栈跟踪
> +	ator		allocator	页面的内存分配器
> -- 
> 2.27.0

