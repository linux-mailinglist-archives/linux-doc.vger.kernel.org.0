Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6393F554805
	for <lists+linux-doc@lfdr.de>; Wed, 22 Jun 2022 14:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357634AbiFVMDb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Jun 2022 08:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357436AbiFVMD2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 08:03:28 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7791539812;
        Wed, 22 Jun 2022 05:03:26 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LShnt6bYjzkWgG;
        Wed, 22 Jun 2022 20:02:10 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 20:03:23 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 20:03:22 +0800
Message-ID: <ba3a97d6-262d-6413-135d-0be9b0af9a6a@huawei.com>
Date:   Wed, 22 Jun 2022 20:03:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] arm64: kdump: Don't defer the reservation of crash
 high memory
Content-Language: en-US
To:     Catalin Marinas <catalin.marinas@arm.com>
CC:     Baoquan He <bhe@redhat.com>, Zhen Lei <thunder.leizhen@huawei.com>,
        "Ard Biesheuvel" <ardb@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "Borislav Petkov" <bp@alien8.de>, <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <devicetree@vger.kernel.org>, "Dave Young" <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>, <kexec@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Chen Zhou <dingguo.cz@antgroup.com>,
        John Donnelly <John.p.donnelly@oracle.com>,
        "Dave Kleikamp" <dave.kleikamp@oracle.com>,
        liushixin <liushixin2@huawei.com>
References: <20220613080932.663-1-thunder.leizhen@huawei.com>
 <20220613080932.663-6-thunder.leizhen@huawei.com>
 <YrFYHYgX3mC//t2l@MiWiFi-R3L-srv>
 <3f66323d-f371-b931-65fb-edfae0f01c88@huawei.com> <YrIIJkhKWSuAqkCx@arm.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <YrIIJkhKWSuAqkCx@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2022/6/22 2:04, Catalin Marinas wrote:
> On Tue, Jun 21, 2022 at 02:24:01PM +0800, Kefeng Wang wrote:
>> On 2022/6/21 13:33, Baoquan He wrote:
>>> On 06/13/22 at 04:09pm, Zhen Lei wrote:
>>>> If the crashkernel has both high memory above DMA zones and low memory
>>>> in DMA zones, kexec always loads the content such as Image and dtb to the
>>>> high memory instead of the low memory. This means that only high memory
>>>> requires write protection based on page-level mapping. The allocation of
>>>> high memory does not depend on the DMA boundary. So we can reserve the
>>>> high memory first even if the crashkernel reservation is deferred.
>>>>
>>>> This means that the block mapping can still be performed on other kernel
>>>> linear address spaces, the TLB miss rate can be reduced and the system
>>>> performance will be improved.
>>> Ugh, this looks a little ugly, honestly.
>>>
>>> If that's for sure arm64 can't split large page mapping of linear
>>> region, this patch is one way to optimize linear mapping. Given kdump
>>> setting is necessary on arm64 server, the booting speed is truly
>>> impacted heavily.
>> Is there some conclusion or discussion that arm64 can't split large page
>> mapping?
>>
>> Could the crashkernel reservation (and Kfence pool) be splited dynamically?
>>
>> I found Mark replay "arm64: remove page granularity limitation from
>> KFENCE"[1],
>>
>>    "We also avoid live changes from block<->table mappings, since the
>>    archtitecture gives us very weak guarantees there and generally requires
>>    a Break-Before-Make sequence (though IIRC this was tightened up
>>    somewhat, so maybe going one way is supposed to work). Unless it's
>>    really necessary, I'd rather not split these block mappings while
>>    they're live."
> The problem with splitting is that you can end up with two entries in
> the TLB for the same VA->PA mapping (e.g. one for a 4KB page and another
> for a 2MB block). In the lucky case, the CPU will trigger a TLB conflict
> abort (but can be worse like loss of coherency).
Thanks for your explanation，
> Prior to FEAT_BBM (added in ARMv8.4), such scenario was not allowed at
> all, the software would have to unmap the range, TLBI, remap. With
> FEAT_BBM (level 2), we can do this without tearing the mapping down but
> we still need to handle the potential TLB conflict abort. The handler
> only needs a TLBI but if it touches the memory range being changed it
> risks faulting again. With vmap stacks and the kernel image mapped in
> the vmalloc space, we have a small window where this could be handled
> but we probably can't go into the C part of the exception handling
> (tracing etc. may access a kmalloc'ed object for example).

So if without FEAT_BBM，we can only guarantee BBM sequence via

"unmap the range, TLBI, remap" or the following option, and with

FEAT_BBM (level 2), we could have easy way to avoid TLB conflict for

some vmalloc space, but still hard to deal with other scence?


>
> Another option is to do a stop_machine() (if multi-processor at that
> point), disable the MMUs, modify the page tables, re-enable the MMU but
> it's also complicated.
>
