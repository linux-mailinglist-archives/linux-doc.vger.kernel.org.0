Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85F4480867
	for <lists+linux-doc@lfdr.de>; Tue, 28 Dec 2021 11:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234275AbhL1K0o (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Dec 2021 05:26:44 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:34852 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbhL1K0m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Dec 2021 05:26:42 -0500
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JNW0P01swzccD4;
        Tue, 28 Dec 2021 18:26:13 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 18:26:40 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 18:26:39 +0800
Message-ID: <3858de1f-cdbc-ff52-2890-4254d0f48b0a@huawei.com>
Date:   Tue, 28 Dec 2021 18:26:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
To:     Dave Hansen <dave.hansen@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC:     Nicholas Piggin <npiggin@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Matthew Wilcox <willy@infradead.org>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
 <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
Content-Language: en-US
In-Reply-To: <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2021/12/27 23:56, Dave Hansen wrote:
> On 12/27/21 6:59 AM, Kefeng Wang wrote:
>> This patch select HAVE_ARCH_HUGE_VMALLOC to let X86_64 and X86_PAE
>> support huge vmalloc mappings.
> In general, this seems interesting and the diff is simple.  But, I don't
> see _any_ x86-specific data.  I think the bare minimum here would be a
> few kernel compiles and some 'perf stat' data for some TLB events.

When the feature supported on ppc,

commit 8abddd968a303db75e4debe77a3df484164f1f33
Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Mon May 3 19:17:55 2021 +1000

     powerpc/64s/radix: Enable huge vmalloc mappings

     This reduces TLB misses by nearly 30x on a `git diff` workload on a
     2-node POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%, due
     to vfs hashes being allocated with 2MB pages.

But the data could be different on different machine/arch.

>> diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
>> index 95fa745e310a..6bf5cb7d876a 100644
>> --- a/arch/x86/kernel/module.c
>> +++ b/arch/x86/kernel/module.c
>> @@ -75,8 +75,8 @@ void *module_alloc(unsigned long size)
>>   
>>   	p = __vmalloc_node_range(size, MODULE_ALIGN,
>>   				    MODULES_VADDR + get_module_load_offset(),
>> -				    MODULES_END, gfp_mask,
>> -				    PAGE_KERNEL, VM_DEFER_KMEMLEAK, NUMA_NO_NODE,
>> +				    MODULES_END, gfp_mask, PAGE_KERNEL,
>> +				    VM_DEFER_KMEMLEAK | VM_NO_HUGE_VMAP, NUMA_NO_NODE,
>>   				    __builtin_return_address(0));
>>   	if (p && (kasan_module_alloc(p, size, gfp_mask) < 0)) {
>>   		vfree(p);
> To figure out what's going on in this hunk, I had to look at the cover
> letter (which I wasn't cc'd on).  That's not great and it means that
> somebody who stumbles upon this in the code is going to have a really
> hard time figuring out what is going on.  Cover letters don't make it
> into git history.
Sorry for that, will add more into arch's patch changelog.
> This desperately needs a comment and some changelog material in *this*
> patch.
>
> But, even the description from the cover letter is sparse:
>
>> There are some disadvantages about this feature[2], one of the main
>> concerns is the possible memory fragmentation/waste in some scenarios,
>> also archs must ensure that any arch specific vmalloc allocations that
>> require PAGE_SIZE mappings(eg, module alloc with STRICT_MODULE_RWX)
>> use the VM_NO_HUGE_VMAP flag to inhibit larger mappings.
> That just says that x86 *needs* PAGE_SIZE allocations.  But, what
> happens if VM_NO_HUGE_VMAP is not passed (like it was in v1)?  Will the
> subsequent permission changes just fragment the 2M mapping?
> .

Yes, without VM_NO_HUGE_VMAP, it could fragment the 2M mapping.

When module alloc with STRICT_MODULE_RWX on x86, it calls 
__change_page_attr()

from set_memory_ro/rw/nx which will split large page, so there is no 
need to make

module alloc with HUGE_VMALLOC.

>                                   
>
>      
>      


