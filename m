Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03FD51E3C5
	for <lists+linux-doc@lfdr.de>; Sat,  7 May 2022 05:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236785AbiEGD05 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 6 May 2022 23:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445387AbiEGD04 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 May 2022 23:26:56 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEE9522C0;
        Fri,  6 May 2022 20:23:09 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KwCRl15M2zhYxy;
        Sat,  7 May 2022 11:22:43 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 11:23:06 +0800
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 11:23:05 +0800
Subject: Re: [PATCH v24 6/6] docs: kdump: Update the crashkernel description
 for arm64
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To:     Baoquan He <bhe@redhat.com>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
        <linux-kernel@vger.kernel.org>, Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        <kexec@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <devicetree@vger.kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Chen Zhou <dingguo.cz@antgroup.com>,
        "John Donnelly" <John.p.donnelly@oracle.com>,
        Dave Kleikamp <dave.kleikamp@oracle.com>
References: <20220506114402.365-1-thunder.leizhen@huawei.com>
 <20220506114402.365-7-thunder.leizhen@huawei.com>
 <20220506231451.GB122876@MiWiFi-R3L-srv>
 <6e662eae-e788-13d3-368a-e88ed159fc85@huawei.com>
Message-ID: <4ad9fc7b-b69b-6d9f-ffff-da665869dfd4@huawei.com>
Date:   Sat, 7 May 2022 11:23:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6e662eae-e788-13d3-368a-e88ed159fc85@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.55]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2022/5/7 9:41, Leizhen (ThunderTown) wrote:
> 
> 
> On 2022/5/7 7:14, Baoquan He wrote:
>> On 05/06/22 at 07:44pm, Zhen Lei wrote:
>>> Now arm64 has added support for "crashkernel=X,high" and
>>> "crashkernel=Y,low". Unlike x86, crash low memory is not allocated if
>>> "crashkernel=Y,low" is not specified.
>>>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>> ---
>>>  Documentation/admin-guide/kernel-parameters.txt | 9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index 3f1cc5e317ed4a5..aa44c61114aa4b8 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -808,7 +808,7 @@
>>>  			Documentation/admin-guide/kdump/kdump.rst for an example.
>>>  
>>>  	crashkernel=size[KMG],high
>>> -			[KNL, X86-64] range could be above 4G. Allow kernel
>>> +			[KNL, X86-64, ARM64] range could be above 4G. Allow kernel
>>>  			to allocate physical memory region from top, so could
>>>  			be above 4G if system have more than 4G ram installed.
>>>  			Otherwise memory region will be allocated below 4G, if
>>> @@ -821,7 +821,7 @@
>>>  			that require some amount of low memory, e.g. swiotlb
>>>  			requires at least 64M+32K low memory, also enough extra
>>>  			low memory is needed to make sure DMA buffers for 32-bit
>>> -			devices won't run out. Kernel would try to allocate at
>>> +			devices won't run out. Kernel would try to allocate
>>>  			at least 256M below 4G automatically.
>>>  			This one let user to specify own low range under 4G
>>>  			for second kernel instead.
>>> @@ -829,6 +829,11 @@
>>>  			It will be ignored when crashkernel=X,high is not used
>>>  			or memory reserved is below 4G.
>>>  
>>> +			[KNL, ARM64] range in low memory.
>>> +			This one let user to specify a low range in DMA zone for
>>                                           ^ not needed,
>>                         Maybe Catalin can fix it when merging.
> 
> Delete "This one let user to" or the entire sentence? I understand it to be the former.

I re-read the doc, That's what x86 uses. So it's probably not a problem. Unlike x86
under 4G, arm64 requires in DMA zone (Such as Raspberry Pi 4, it may under 1G or 3G).

"This one let user to specify own low range under 4G for second kernel instead."

> 
>>
>> Other than this, LGTM,
>>
>> Acked-by: Baoquan He <bhe@redhat.com>
>>
>>> +			crash dump kernel.
>>> +			It will be ignored when crashkernel=X,high is not used.
>>> +
>>>  	cryptomgr.notests
>>>  			[KNL] Disable crypto self-tests
>>>  
>>> -- 
>>> 2.25.1
>>>
>>
>> .
>>
> 

-- 
Regards,
  Zhen Lei
