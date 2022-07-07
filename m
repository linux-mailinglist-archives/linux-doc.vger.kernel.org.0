Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 119E056974B
	for <lists+linux-doc@lfdr.de>; Thu,  7 Jul 2022 03:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbiGGBOg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Jul 2022 21:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbiGGBOg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 21:14:36 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2D78F2CC9C;
        Wed,  6 Jul 2022 18:14:34 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.112.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axn+JzM8ZijesNAA--.41056S3;
        Thu, 07 Jul 2022 09:14:28 +0800 (CST)
Message-ID: <c439e285-a395-16a0-4527-3f868c494440@loongson.cn>
Date:   Thu, 7 Jul 2022 09:14:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next v2] docs/zh_CN: add mm transhuge translation
To:     Guo Mengqi <guomengqi3@huawei.com>, alexs@kernel.org,
        corbet@lwn.net, tangyizhou@huawei.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     xuqiang36@huawei.com, zhouguanghui1@huawei.com,
        zhoubinbin@loongson.cn, bobwxc@email.cn
References: <20220628133742.91966-1-guomengqi3@huawei.com>
 <20220705141121.73711-1-guomengqi3@huawei.com>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <20220705141121.73711-1-guomengqi3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axn+JzM8ZijesNAA--.41056S3
X-Coremail-Antispam: 1UD129KBjvJXoWfJFWDZFWxGw1DCryrZF1UWrg_yoWDtF47pF
        ykKr97Kw18Ar909F1Ik3W0yF1kAr17Ga1xKryxJ3sxJr1DKrsrKa17Ka4UJw4xWry2yrZr
        Xr4q9F9ayF90gFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
        4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
        c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMx
        C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
        wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
        vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
        0xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
        v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUHpB-UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/5 22:11, Guo Mengqi 写道:
> Translate .../mm/transhuge.rst into Chinese.
>
> Signed-off-by: Guo Mengqi <guomengqi3@huawei.com>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>


Thanks,

Yanteng


> ---
>   Documentation/translations/zh_CN/mm/index.rst |   2 +-
>   .../translations/zh_CN/mm/transhuge.rst       | 153 ++++++++++++++++++
>   2 files changed, 154 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/mm/transhuge.rst
>
> diff --git a/Documentation/translations/zh_CN/mm/index.rst b/Documentation/translations/zh_CN/mm/index.rst
> index 2f53e37b8049..d0c80025c3ce 100644
> --- a/Documentation/translations/zh_CN/mm/index.rst
> +++ b/Documentation/translations/zh_CN/mm/index.rst
> @@ -56,6 +56,7 @@ Linux内存管理文档
>      page_table_check
>      remap_file_pages
>      split_page_table_lock
> +   transhuge
>      vmalloced-kernel-stacks
>      z3fold
>      zsmalloc
> @@ -65,5 +66,4 @@ TODOLIST:
>   * free_page_reporting
>   * hugetlbfs_reserv
>   * slub
> -* transhuge
>   * unevictable-lru
> diff --git a/Documentation/translations/zh_CN/mm/transhuge.rst b/Documentation/translations/zh_CN/mm/transhuge.rst
> new file mode 100644
> index 000000000000..5204b1113fbf
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/mm/transhuge.rst
> @@ -0,0 +1,153 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/transhuge.rst
> +
> +:翻译:
> +
> + 郭梦琪 Guo Mengqi <guomengqi3@huawei.com>
> +
> +:校译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> + 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
> + 时奎亮 Alex Shi <alexs@kernel.org>
> +
> +==============
> +透明巨页机制
> +==============
> +
> +本文档描述透明巨页（THP）的设计理念，以及它是如何与内存管理系统的其它部分交互的。
> +
> +设计原则
> +========
> +
> +- “优雅回退”：有些mm组件不感知透明巨页，它们的回退方法是将PMD页表项拆分成PTE
> +  页表项。必要时还需要拆分透明巨页。这样就可以在常规大小的页或页表项上继续工作。
> +
> +- 如果内存碎片化导致巨页分配失败，则分配常规页作为替代放入原vma中，此期间不会
> +  产生任何失败或明显延迟，也不会引起用户态的注意。
> +
> +- 如果一些进程退出后释放了空闲的巨页（不论在伙伴系统还是在VM），由常规页支持的
> +  guest物理内存应该自动重新申请为巨页。(通过khugepaged进程)
> +
> +- 透明巨页不需要预留内存，而是尽可能使用已经存在的巨页。（为避免不可移动的页
> +  将整个内存碎片化，唯一可能的预留是在kernelcore=的设置中。不过这个调整并不仅
> +  针对透明巨页，而对内核中所有动态的多级页面申请都适用。）
> +
> +get_user_pages和follow_page
> +===========================
> +
> +不论对单个巨页还是hugetlbfs，使用get_user_pages(GUP)和follow_page时，返回的会是
> +首页或尾页。大多数情况下调用GUP功能的人不关心页的大小，只关心页的真实物理地址
> +以及暂时将页固定，好在I/O结束后将页释放。但在驱动中，在某些情况下有可能访问尾页
> +的page_struct（如检查page->mapping字段），这时应该转而检查首页。一旦首页或者尾页
> +被引用，巨页就不能再被拆分了。
> +
> +.. note::
> +   以上不是针对GUP API的新增限制，它们和hugetlbfs的限制保持一致。因此，如果任何
> +   驱动能够在hugetlbfs中处理GUP，它们也能在基于透明巨页的映射中很好的工作。
> +
> +优雅回退
> +============
> +
> +遍历页表但又不需感知巨页pmd的代码可以这样简单处理：对pmd_offset返回的pmd添加一行
> +split_huge_pmd(vma, pmd, addr)调用。只需grep搜索"pmd_offset"，并将
> +split_huge_pmd添加到所有返回的pmd后面，代码就能够自己处理透明巨页了，非常简单。
> +这短短一行的回退函数很巧妙，为我们省去了成百上千行额外的适配代码。
> +
> +如果你不是在遍历页表，而是遇到了一个无法直接处理的巨物理页，可以使用
> +split_huge_page(page)把它拆分成小页。linux VM就是通过这种方式将巨页换出。
> +如果页面被pin住了，split_huge_page就会失败。
> +
> +例子：添加一行代码使mremap.c支持透明巨页::
> +
> +        diff --git a/mm/mremap.c b/mm/mremap.c
> +        --- a/mm/mremap.c
> +        +++ b/mm/mremap.c
> +        @@ -41,6 +41,7 @@ static pmd_t *get_old_pmd(struct mm_stru
> +                return NULL;
> +
> +                pmd = pmd_offset(pud, addr);
> +        +       split_huge_pmd(vma, pmd, addr);
> +                if (pmd_none_or_clear_bad(pmd))
> +                    return NULL;
> +
> +巨页支持中的锁使用
> +==================
> +
> +我们还是希望尽可能多的代码能感知透明巨页，因为调用split_huge_page()和
> +split_huge_pmd()还是有开销的。
> +
> +要使遍历页表流程能够感知巨页pmd，只需对pmd_offset返回的pmd调用pmd_trans_huge()。
> +一定要持有mmap_lock读锁，以避免khugepaged在此期间申请新的巨页pmd
> +（khugepaged collapse_huge_page会持有mmap_lock写锁而非anon_vma lock）。
> +如果pmd_trans_huge返回结果为假，那就回到原来的流程。如果pmd_trans_huge返回结果
> +为真，就需要先持有页表锁(pmd_lock())，然后再进行一次pmd_trans_huge判断。持页表锁
> +是为了防止巨页pmd被转换成小页（split_huge_pmd是可以跟遍历页表操作同时进行的）。
> +如果第二次pmd_trans_huge返回结果为假,那就释放页表锁，依然回到原有流程。如果返回
> +结果继续为真，那就按照巨页pmd和巨页来处理，处理完毕再释放页表锁。
> +
> +引用计数和透明巨页
> +==================
> +
> +THP的计数跟其他复合页的计数大致相同：
> +
> + - get_page()/put_page()和GUP都在首页上进行计数（修改head page->_refcount）
> +
> + - 尾页的_refcount永远是0. get_page_unless_zero()永远无法get到尾页。
> +
> + - 映射/解映射特定PTE entry时，增减的是复合页中相应子页的_mapcount.
> +
> + - 映射/解映射整个复合页时，增减的是compound_mapcount属性。该属性保存在第一个
> +   尾页中。对于文件中的巨页，还要增加所有子页中的_mapcount，这样是为了在检测
> +   子页的解映射时不需考虑竞争问题。
> +
> +PageDoubleMap() 表明巨页 *可能* 被映射为了PTE.
> +
> +对匿名页，PageDoubleMap()也表示所有子页的_mapcount都偏移了1.
> +在页被同时映射为了PMD和PTE的情况下，这个额外的引用可以避免子页解映射时的竞争。
> +
> +这个优化也可以追踪每个子页mapcount所带来的性能开销。另一种解决方法是在每次
> +映射/解映射整个复合页时更改所有子页的_mapcount.
> +
> +对于匿名页，如果页面的PMD在首次被拆分时同时还具有PMD映射，则设置PG_double_map;
> +当compound_mapcount值降为0时，取消设置。
> +
> +对于映射到文件的页，在其首次映射PTE时，设置PG_double_map; 在页面从页缓存中
> +移除时，取消设置。
> +
> +split_huge_page中，在清除page struct中所有PG_head/tail位之前，需要先将首页中的
> +引用计数refcount分发到所有其他尾页中。页表项PTE占用的引用计数很好处理，但剩下的
> +引用计数来源难以确定（如通过get_user_pages的pin页）。如果巨页被pin住，
> +split_huge_page()会失败。页的引用计数必须等于所有子页mapcount之和再加一（因为
> +split_huge_page的调用者也必须对首页持有一个引用）。
> +
> +对匿名页，split_huge_page用页表项迁移（migration entries）来保持page->_refcount
> +和page->_mapcount稳定。对文件页则会直接解映射。
> +
> +这套机制对物理内存扫描（physical memory scanners）也安全，scanner唯一合法引用页
> +的途径就是get_page_unless_zero().
> +
> +没调atomic_add()时，所有尾页的_refcount都为0. 这时scanner无法获取尾页的引用。
> +调了atomic_add()后，我们也不在乎页的_refcount是多少了。只要知道应该从首页的引用
> +计数减去多少即可。
> +
> +对首页进行get_page_unless_zero()是可以成功的。此时引用计数的再分配非常明了：
> +引用计数将会留在首页中。
> +
> +split_huge_pmd()对引用计数没有任何限制，在任何时候都可以拆分PMD，而且永远不会
> +失败。
> +
> +局部解映射和deferred_split_huge_page()函数
> +==========================================
> +
> +透明巨页通过munmap()或其他方式解映射时，并不会立即释放内存。在page_remove_rmap()
> +中检查透明巨页的某个子页是否还在使用，并将透明巨页加入一个预备队列，当内存
> +使用需求变大时，把透明巨页拆分，释放已经不用的子页。
> +
> +检测到局部解映射时，由于处在锁中，无法立即进行拆页。而且在很多情况下，如果透明
> +巨页是跨VMA的, 那么会在exit(2)中进行局部解映射。这时拆页效果适得其反。
> +
> +deferred_split_huge_page函数就是用来进行上文所说的将页排队以预备后续的拆分。真正
> +的拆页操作是通过内存压力导致的shrinker接口来触发的。

