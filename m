Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B443562FF4
	for <lists+linux-doc@lfdr.de>; Fri,  1 Jul 2022 11:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbiGAJYr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 1 Jul 2022 05:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiGAJY3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jul 2022 05:24:29 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C8F6270E76;
        Fri,  1 Jul 2022 02:24:27 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.112.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX+M5vb5irNEAAA--.2787S3;
        Fri, 01 Jul 2022 17:24:12 +0800 (CST)
Message-ID: <67cde459-e875-f3bb-f9b7-98969a25b539@loongson.cn>
Date:   Fri, 1 Jul 2022 17:24:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH -next] docs/zh_CN: add vm transhuge translation
To:     "guomengqi (A)" <guomengqi3@huawei.com>,
        Wu XiangCheng <bobwxc@email.cn>, alexs@kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, yizhou.tang@shopee.com,
        Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     xuqiang36@huawei.com
References: <20220628133742.91966-1-guomengqi3@huawei.com>
 <6d2fc64c-afbf-5a26-6970-d880d8b32868@loongson.cn>
 <E3CC3DA5-7348-424F-BAAF-200F1ED7D6DA@email.cn>
 <fa82e580-f16e-3457-b948-1522902ee8a3@huawei.com>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <fa82e580-f16e-3457-b948-1522902ee8a3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX+M5vb5irNEAAA--.2787S3
X-Coremail-Antispam: 1UD129KBjvAXoW3Kr1kZFy3ZF13ZrWDAw45GFg_yoW8Gry7Co
        W3KrWfCwnxJr1Yg3WUA3ykJF1Yk3WUGrn7J345CrsxZr1jyw15A3ykJ34UJ3yDCrW8G3Wr
        JFyxJayYyFyjqFy5n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYf7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjC385UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/1 10:49, guomengqi (A) 写道:
>
> 在 2022/6/30 10:11, Wu XiangCheng 写道:
>>
>> 于 2022年6月29日 GMT+08:00 上午11:50:11, YanTeng Si 
>> <siyanteng@loongson.cn> 写到:
>>> Hi Mengqi
>>>
>>> 在 2022/6/28 21:37, Guo Mengqi 写道:
>>>> Translate .../vm/transhuge.rst into Chinese.
>>>>
>>>> Signed-off-by: Guo Mengqi <guomengqi3@huawei.com>
>>>> ---
>>>>    Documentation/translations/zh_CN/vm/index.rst |   2 +-
>>>>    .../translations/zh_CN/vm/transhuge.rst       | 151 
>>>> ++++++++++++++++++
>>>>    2 files changed, 152 insertions(+), 1 deletion(-)
>>>>    create mode 100644 
>>>> Documentation/translations/zh_CN/vm/transhuge.rst
>>> When I apply your patch（next-tree）, git complains:
>>>
>>> Applying: docs/zh_CN: add vm transhuge translation
>>>
>>> error: Documentation/translations/zh_CN/vm/index.rst: does not exist 
>>> in index
>>> .git/rebase-apply/patch:180: new blank line at EOF.
>>> +
>>> Patch failed at 0001 docs/zh_CN: add vm transhuge translation
>>
>> The /vm/ documentations (including translations) have been moved to 
>> /mm/ in linux-next tree.
>>
>> Not sure about docs-next, please check that.
>
> Yes, I just found out /vm/ changed to /mm/ in docs-next a few days ago.
>
>>>> diff --git a/Documentation/translations/zh_CN/vm/index.rst 
>>>> b/Documentation/translations/zh_CN/vm/index.rst
>>>> index c77a56553845..2d82b15b272b 100644
>>>> --- a/Documentation/translations/zh_CN/vm/index.rst
>>>> +++ b/Documentation/translations/zh_CN/vm/index.rst
>>>> @@ -59,11 +59,11 @@ Linux内存管理文档
>>>>       vmalloced-kernel-stacks
>>>>       z3fold
>>>>       zsmalloc
>>>> +   transhuge
>>>>      TODOLIST:
>>>>    * arch_pgtable_helpers
>>>>    * free_page_reporting
>>>>    * hugetlbfs_reserv
>>>>    * slub
>>>> -* transhuge
>>>>    * unevictable-lru
>>>> diff --git a/Documentation/translations/zh_CN/vm/transhuge.rst 
>>>> b/Documentation/translations/zh_CN/vm/transhuge.rst
>>>> new file mode 100644
>>>> index 000000000000..a7bed8b13a47
>>>> --- /dev/null
>>>> +++ b/Documentation/translations/zh_CN/vm/transhuge.rst
>>>> @@ -0,0 +1,151 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +.. include:: ../disclaimer-zh_CN.rst
>>>> +
>>>> +:Original: Documentation/vm/transhuge.rst
>>>> +
>>>> +:翻译:
>>>> +
>>>> + 郭梦琪 Guo Mengqi <guomengqi3@huawei.com>
>>>> +
>>>> +:校译:
>>>> +
>>>> +==============
>>>> +透明大页机制
>>> huge 巨大
>>>
>>> large 大
>>>
>>>
>>> so 大页 -> 巨页
>> Here I think both is OK, and 大页 seems more common?
>>
>> Thanks,
>> Wu
>
> Hi Yanteng and Wu
>
> Huge->巨 is more faithful to its original word, but I translate it into 
> 大页 because in our company we do use 大页 more.
I've translated hugepages to 巨页 in zh_CN/mm/hugetlbfs_reserv.rst.
>
> If it is not ambiguous, I think both of them are OK?

If both of them are OK, I suggest we better keep a consistent translation.


Thanks,

Yanteng

>
>>>> +==============
>>>> +
>>>> +本文档描述透明大页（THP）的设计理念，以及它是如何与内存管理系统其他部分交互的。 
>>>>
>>> 以及它是如何与内存管理系统的其他部分交互的
>>>
>>>> +
>>>> +设计原则
>>>> +========
>>>> +
>>>> +- 
>>>> “优雅fallback”：有些mm组件不了解透明大页的存在，它们的回退方法是将PMD页表项 
>>>>
>>>> +  
>>>> 拆分成PTE页表项。必要时还需要拆分透明大页。这样就可以在常规大小的页或页表项上 
>>>>
>>>> +  继续工作。
>>>> +
>>>> +- 
>>>> 如果内存碎片化导致大页分配失败，则分配常规页作为替代放入原vma中，此期间不应 
>>>>
>>>> +  产生任何失败或明显延迟，不要引起用户态的注意。
>>> How about
>>>
>>> 此期间不会产生任何失败或明显延迟，也不会引起用户态的注意。
>>>
>>>> +
>>>> +- 
>>>> 如果一些进程退出后释放了空余的大页（不论在伙伴系统还是在VM），由常规页支持的 
>>>>
>>> 空余 -> 空闲 or 可用
>>>> + guest物理内存应该自动重新申请为大页。(通过khugepaged进程)
>>>> +
>>>> +- 
>>>> 透明大页不需要预留内存，而是尽可能使用已经存在的大页。（唯为避免不可移动的页 
>>>>
>>> del 唯
>>>> + 
>>>> 将整个内存碎片化，唯一可能的预留是在kernelcore=的设置中。不过这个调整并不仅 
>>>>
>>>> +  针对透明大页，而对内核中所有动态的多级页面申请都通用。）
>>> 都适用 or 对xxxxx页面申请通用。
>>>> +
>>>> +get_user_pages和follow_page
>>>> +===========================
>>>> +
>>>> +不论对单个大页还是hugetlbfs，使用get_user_pages和follow_page时，返回的会是首页或 
>>>>
>>> 使用get_user_pages(GUP)
>>>
>>>> +尾页。大多数情况下调用get_user_page功能的人不关心页的大小，只关心页的真实物理 
>>>>
>>> 调用GUP功能
>>>
>>>> +地址以及暂时的pin页，好在I/O结束后将页释放。但在驱动中，在某些情况下有可能访问 
>>>>
>>>> +尾页的page_struct（如检查page->mapping字段），这时应该转而检查首页。一旦首页或者 
>>>>
>>>> +尾页被引用，大页就不能再被拆分了。
>>>> +
>>>> +.. note::
>>>> +   以上限制不是针对GUP 
>>>> API新增，而是为了与在hugetlbfs中保持一致。这样如果驱动
>>>> +   能在hugetlbfs中使用GUP，就能够切换到透明大页机制支持的GUP。
>>>> +
>>>> +优雅fallback
>>>> +============
>>>> +
>>>> +为查页表流程增加大页支持只需添加split_huge_pmd(vma, pmd,
>>>> +addr)即可。其中pmd为pmd_offset返回值。要为代码添加透明大页支持很简单，搜索 
>>>>
>>>> +"pmd_offset"并将split_huge_pmd添加到所有返回的pmd后面。这短短一行的fallback函数 
>>>>
>>>> +很巧妙，为我们省去了额外的适配代码（通常会很长或者很复杂）。
>>>> +
>>>> +如果你需要在没有页表的情况下处理一个大页，可以使用split_huge_page(page)把它拆分 
>>>>
>>>> +成小页。linux 
>>>> VM就是通过这种方式将大页换出。如果页面被pin住了，split_huge_page
>>>> +就会失败。
>>>> +
>>>> +例子：添加一行代码使mremap.c支持透明大页::
>>>> +
>>>> +        diff --git a/mm/mremap.c b/mm/mremap.c
>>>> +        --- a/mm/mremap.c
>>>> +        +++ b/mm/mremap.c
>>>> +        @@ -41,6 +41,7 @@ static pmd_t *get_old_pmd(struct mm_stru
>>>> +                return NULL;
>>>> +
>>>> +                pmd = pmd_offset(pud, addr);
>>>> +        +       split_huge_pmd(vma, pmd, addr);
>>>> +                if (pmd_none_or_clear_bad(pmd))
>>>> +                    return NULL;
>>>> +
>>>> +大页支持中的锁使用
>>>> +==================
>>>> +
>>>> +我们希望尽可能多的代码能原生支持透明大页，因为调用split_huge_page()和
>>>> +split_huge_pmd()还是有开销的。
>>>> +
>>>> +要让查页表操作变得能处理huge pmd，只需对pmd_offset返回的pmd调用
>>>> +pmd_trans_huge()。一定要持有mmap_lock读锁，以避免khugepaged在此期间申请新的 
>>>>
>>>> +大页pmd（khugepaged collapse_huge_page会持有mmap_lock写锁而非anon_vma 
>>>> lock）。
>>>> +如果pmd_trans_huge返回false，那就回到原来的流程。如果pmd_trans_huge返回true， 
>>>>
>>>> +就需要先持有页表锁(pmd_lock())，然后再调一次pmd_trans_huge. 
>>>> 持页表锁是为了防止
>>>> +大页pmd被转换成小页（split_huge_pmd可以跟查页表操作同时进行）。如果第二次 
>>>>
>>>> +pmd_trans_huge返回false,那就释放页表锁，依然回到原有流程。如果返回true，就可以 
>>>>
>>>> +继续处理huge pmd和hugepage了。处理完毕，再释放页表锁。
>>>> +
>>>> +引用计数和透明大页
>>>> +==================
>>>> +
>>>> +THP的计数跟其他复合页的计数大致相同：
>>>> +
>>>> + - get_page()/put_page()和GUP都在首页上进行计数（修改head 
>>>> page->_refcount）
>>>> +
>>>> + - 尾页的_refcount永远是0. get_page_unless_zero()永远无法get到尾页。
>>>> +
>>>> + - map/unmap特定PTE entry时，增减的是复合页中相应子页的_mapcount.
>>>> +
>>>> + - 
>>>> map/unmap整个复合页时，增减的是compound_mapcount属性。该属性保存在第一个 
>>>>
>>>> +   
>>>> 尾页中。对于文件中的大页，还要增加所有子页中的_mapcount，这样是为了在检测 
>>>>
>>>> +   子页的解映射时不需考虑竞争问题。
>>> map/unmap： Either you don't translate, or you translate them all.
>>>> +
>>>> +PageDoubleMap() 表明大页 *可能* 被映射为了PTE.
>>>> +
>>>> +对匿名页，PageDoubleMap()也表示所有子页的_mapcount都偏移了1.
>>>> +在页被同时映射为了PMD和PTE的情况下，这个额外的引用可以避免子页解映射时的竞争。 
>>>>
>>>> +
>>>> +这个优化也可以追踪每个子页mapcount所带来的性能开销。另一种解决方法是在每次 
>>>>
>>>> +map/unmap整个复合页时更改所有子页的_mapcount.
>>>> +
>>>> +对于匿名页，如果页面的PMD在首次被拆分时同时还具有PMD映射，则设置PG_double_map; 
>>>>
>>>> +当compound_mapcount值降为0时，取消设置。
>>>> +
>>>> +对于映射到文件的页，在其首次映射PTE时，设置PG_double_map; 
>>>> 在页面从页缓存
>>>> +page cache中移除时，取消设置。
>>> 页缓存 == page cache
>>>> +
>>>> +split_huge_page中，在清除page 
>>>> struct中所有PG_head/tail位之前，需要先将首页中的
>>>> +引用计数refcount分发到所有其他尾页中。页表项PTE占用的引用计数很好处理，但剩下的 
>>>>
>>>> +引用计数来源难以确定（如通过get_user_pages的pin页）。如果大页被pin住， 
>>>>
>>>> +split_huge_page()会失败。页的引用计数必须等于所有子页mapcount之和再加一（因为 
>>>>
>>>> +split_huge_page的调用者也必须对首页持有一个引用）。
>>>> +
>>>> +对匿名页，split_huge_page用页表项迁移（migration
>>>> +entries）保持来page->_refcount和page->_mapcount稳定。对文件页，直接解映射就好。 
>>>>
>>> 保持来 -> 来保持
>>>
>>>> +
>>>> +这套机制对物理内存扫描（physical memory 
>>>> scanners）也安全，scanner唯一合法引用页
>>>> +的途径就是get_page_unless_zero().
>>>> +
>>>> +没调atomic_add()时，所有尾页的_refcount都为0. 
>>>> 这时scanner无法获取尾页的引用。
>>>> +调了atomic_add()后，我们也不在乎页的_refcount是多少了。只要知道应该从首页的引用 
>>>>
>>>> +计数减去多少即可。
>>>> +
>>>> +对首页进行get_page_unless_zero()是可以成功的。此时引用计数的再分配非常明了： 
>>>>
>>>> +引用计数将会留在首页中。
>>>> +
>>>> +split_huge_pmd()对引用计数没有任何限制，在任何时候都可以拆分PMD，而且永远不会 
>>>>
>>>> +失败。
>>>> +
>>>> +局部unmap和deferred_split_huge_page()函数
>>>> +==========================================
>>>> +
>>>> +透明大页通过munmap()或其他方式解映射时，并不会立即释放内存。在page_remove_rmap() 
>>>>
>>>> +中检查透明大页的某个子页是否已经还在使用，并将透明大页加入一个预备队列，当内存 
>>>>
>>>> +使用需求变大时，把透明大页拆分，释放已经不用的子页。
>>>> +
>>>> +如果检测到局部unmap，由于处在锁中，无法拆页。而且在很多情况下，透明大页会跨VMA, 
>>>>
>>>> +这时会在exit(2)中进行局部unmap，这时拆页效果适得其反。
>>> 由于xxxxx而且xxxxxx所以xxxxxxx
>>>
>>> 这时 is used too much
>>>
>>>
>>>> +
>>>> +deferred_split_huge_page函数就是用来进行上文所说的将页排队以预备后续的拆分。真正 
>>>>
>>>> +的拆页操作是通过内存压力导致的shrinker函数来触发。
>>> shrinker接口
>>>
>>>> +
>>> CC Yizhou
>>>
>>> CC Binbin
>>>
>>>
>>> I like your way of translating docs, good job!
>>>
>>>
>>> Thanks，
>>> Yanteng
>> .

