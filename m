Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEFE544FBD
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jun 2022 16:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241290AbiFIOrD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Jun 2022 10:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbiFIOrC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 10:47:02 -0400
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52D765CB;
        Thu,  9 Jun 2022 07:46:55 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R651e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=zhongjiang-ali@linux.alibaba.com;NM=1;PH=DS;RN=38;SR=0;TI=SMTPD_---0VFuGevJ_1654786002;
Received: from 30.225.24.138(mailfrom:zhongjiang-ali@linux.alibaba.com fp:SMTPD_---0VFuGevJ_1654786002)
          by smtp.aliyun-inc.com;
          Thu, 09 Jun 2022 22:46:45 +0800
Message-ID: <dcf2481d-6df1-bebe-a0c5-17c39bf8e26f@linux.alibaba.com>
Date:   Thu, 9 Jun 2022 22:46:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:101.0)
 Gecko/20100101 Thunderbird/101.0
Subject: Re: [PATCH v11 06/14] mm: multi-gen LRU: minimal implementation
Content-Language: en-US
From:   zhong jiang <zhongjiang-ali@linux.alibaba.com>
To:     Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        page-reclaim@google.com, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=c3=a4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
References: <20220518014632.922072-1-yuzhao@google.com>
 <20220518014632.922072-7-yuzhao@google.com>
 <e257ec00-26ea-25c0-a9fd-b862b6a49c22@linux.alibaba.com>
In-Reply-To: <e257ec00-26ea-25c0-a9fd-b862b6a49c22@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-11.1 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2022/6/9 8:34 下午, zhong jiang wrote:
>
> On 2022/5/18 9:46 上午, Yu Zhao wrote:
>> To avoid confusion, the terms "promotion" and "demotion" will be
>> applied to the multi-gen LRU, as a new convention; the terms
>> "activation" and "deactivation" will be applied to the active/inactive
>> LRU, as usual.
>>
>> The aging produces young generations. Given an lruvec, it increments
>> max_seq when max_seq-min_seq+1 approaches MIN_NR_GENS. The aging
>> promotes hot pages to the youngest generation when it finds them
>> accessed through page tables; the demotion of cold pages happens
>> consequently when it increments max_seq. The aging has the complexity
>> O(nr_hot_pages), since it is only interested in hot pages. Promotion
>> in the aging path does not involve any LRU list operations, only the
>> updates of the gen counter and lrugen->nr_pages[]; demotion, unless as
>> the result of the increment of max_seq, requires LRU list operations,
>> e.g., lru_deactivate_fn().
>>
>> The eviction consumes old generations. Given an lruvec, it increments
>> min_seq when the lists indexed by min_seq%MAX_NR_GENS become empty. A
>> feedback loop modeled after the PID controller monitors refaults over
>> anon and file types and decides which type to evict when both types
>> are available from the same generation.
>>
>> Each generation is divided into multiple tiers. Tiers represent
>> different ranges of numbers of accesses through file descriptors. A
>> page accessed N times through file descriptors is in tier
>> order_base_2(N). Tiers do not have dedicated lrugen->lists[], only
>> bits in folio->flags. In contrast to moving across generations, which
>> requires the LRU lock, moving across tiers only involves operations on
>> folio->flags. The feedback loop also monitors refaults over all tiers
>> and decides when to protect pages in which tiers (N>1), using the
>> first tier (N=0,1) as a baseline. The first tier contains single-use
>> unmapped clean pages, which are most likely the best choices. The
>> eviction moves a page to the next generation, i.e., min_seq+1, if the
>> feedback loop decides so. This approach has the following advantages:
>> 1. It removes the cost of activation in the buffered access path by
>>     inferring whether pages accessed multiple times through file
>>     descriptors are statistically hot and thus worth protecting in the
>>     eviction path.
>> 2. It takes pages accessed through page tables into account and avoids
>>     overprotecting pages accessed multiple times through file
>>     descriptors. (Pages accessed through page tables are in the first
>>     tier, since N=0.)
>> 3. More tiers provide better protection for pages accessed more than
>>     twice through file descriptors, when under heavy buffered I/O
>>     workloads.
>>
>> Server benchmark results:
>>    Single workload:
>>      fio (buffered I/O): +[40, 42]%
>>                  IOPS         BW
>>        5.18-rc1: 2463k        9621MiB/s
>>        patch1-6: 3484k        13.3GiB/s
>>
>>    Single workload:
>>      memcached (anon): +[44, 46]%
>>                  Ops/sec      KB/sec
>>        5.18-rc1: 771403.27    30004.17
>>        patch1-6: 1120643.70   43588.06
>>
>>    Configurations:
>>      CPU: two Xeon 6154
>>      Mem: total 256G
>>
>>      Node 1 was only used as a ram disk to reduce the variance in the
>>      results.
>>
>>      patch drivers/block/brd.c <<EOF
>>      99,100c99,100
>>      <     gfp_flags = GFP_NOIO | __GFP_ZERO | __GFP_HIGHMEM;
>>      <     page = alloc_page(gfp_flags);
>>      ---
>>      >     gfp_flags = GFP_NOIO | __GFP_ZERO | __GFP_HIGHMEM | 
>> __GFP_THISNODE;
>>      >     page = alloc_pages_node(1, gfp_flags, 0);
>>      EOF
>>
>>      cat >>/etc/systemd/system.conf <<EOF
>>      CPUAffinity=numa
>>      NUMAPolicy=bind
>>      NUMAMask=0
>>      EOF
>>
>>      cat >>/etc/memcached.conf <<EOF
>>      -m 184320
>>      -s /var/run/memcached/memcached.sock
>>      -a 0766
>>      -t 36
>>      -B binary
>>      EOF
>>
>>      cat fio.sh
>>      modprobe brd rd_nr=1 rd_size=113246208
>>      swapoff -a
>>      mkfs.ext4 /dev/ram0
>>      mount -t ext4 /dev/ram0 /mnt
>>
>>      mkdir /sys/fs/cgroup/user.slice/test
>>      echo 38654705664 >/sys/fs/cgroup/user.slice/test/memory.max
>>      echo $$ >/sys/fs/cgroup/user.slice/test/cgroup.procs
>>      fio -name=mglru --numjobs=72 --directory=/mnt --size=1408m \
>>        --buffered=1 --ioengine=io_uring --iodepth=128 \
>>        --iodepth_batch_submit=32 --iodepth_batch_complete=32 \
>>        --rw=randread --random_distribution=random --norandommap \
>>        --time_based --ramp_time=10m --runtime=5m --group_reporting
>>
>>      cat memcached.sh
>>      modprobe brd rd_nr=1 rd_size=113246208
>>      swapoff -a
>>      mkswap /dev/ram0
>>      swapon /dev/ram0
>>
>>      memtier_benchmark -S /var/run/memcached/memcached.sock \
>>        -P memcache_binary -n allkeys --key-minimum=1 \
>>        --key-maximum=65000000 --key-pattern=P:P -c 1 -t 36 \
>>        --ratio 1:0 --pipeline 8 -d 2000
>>
>>      memtier_benchmark -S /var/run/memcached/memcached.sock \
>>        -P memcache_binary -n allkeys --key-minimum=1 \
>>        --key-maximum=65000000 --key-pattern=R:R -c 1 -t 36 \
>>        --ratio 0:1 --pipeline 8 --randomize --distinct-client-seed
>>
>> Client benchmark results:
>>    kswapd profiles:
>>      5.18-rc1
>>        40.53%  page_vma_mapped_walk
>>        20.37%  lzo1x_1_do_compress (real work)
>>         6.99%  do_raw_spin_lock
>>         3.93%  _raw_spin_unlock_irq
>>         2.08%  vma_interval_tree_subtree_search
>>         2.06%  vma_interval_tree_iter_next
>>         1.95%  folio_referenced_one
>>         1.93%  anon_vma_interval_tree_iter_first
>>         1.51%  ptep_clear_flush
>>         1.35%  __anon_vma_interval_tree_subtree_search
>>
>>      patch1-6
>>        35.99%  lzo1x_1_do_compress (real work)
>>        19.40%  page_vma_mapped_walk
>>         6.31%  _raw_spin_unlock_irq
>>         3.95%  do_raw_spin_lock
>>         2.39%  anon_vma_interval_tree_iter_first
>>         2.25%  ptep_clear_flush
>>         1.92%  __anon_vma_interval_tree_subtree_search
>>         1.70%  folio_referenced_one
>>         1.68%  __zram_bvec_write
>>         1.43%  anon_vma_interval_tree_iter_next
>>
>>    Configurations:
>>      CPU: single Snapdragon 7c
>>      Mem: total 4G
>>
>>      Chrome OS MemoryPressure [1]
>>
>> [1] https://chromium.googlesource.com/chromiumos/platform/tast-tests/
>>
>> Signed-off-by: Yu Zhao <yuzhao@google.com>
>> Acked-by: Brian Geffon <bgeffon@google.com>
>> Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
>> Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
>> Acked-by: Steven Barrett <steven@liquorix.net>
>> Acked-by: Suleiman Souhlal <suleiman@google.com>
>> Tested-by: Daniel Byrne <djbyrne@mtu.edu>
>> Tested-by: Donald Carr <d@chaos-reins.com>
>> Tested-by: Holger Hoffstätte <holger@applied-asynchrony.com>
>> Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
>> Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
>> Tested-by: Sofia Trinh <sofia.trinh@edi.works>
>> Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>>   include/linux/mm_inline.h         |  36 ++
>>   include/linux/mmzone.h            |  42 ++
>>   include/linux/page-flags-layout.h |   5 +-
>>   kernel/bounds.c                   |   2 +
>>   mm/Kconfig                        |  11 +
>>   mm/swap.c                         |  39 ++
>>   mm/vmscan.c                       | 799 +++++++++++++++++++++++++++++-
>>   mm/workingset.c                   | 110 +++-
>>   8 files changed, 1034 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
>> index 98ae22bfaf12..85fe78832436 100644
>> --- a/include/linux/mm_inline.h
>> +++ b/include/linux/mm_inline.h
>> @@ -119,6 +119,33 @@ static inline int lru_gen_from_seq(unsigned long 
>> seq)
>>       return seq % MAX_NR_GENS;
>>   }
>>   +static inline int lru_hist_from_seq(unsigned long seq)
>> +{
>> +    return seq % NR_HIST_GENS;
>> +}
>> +
>> +static inline int lru_tier_from_refs(int refs)
>> +{
>> +    VM_WARN_ON_ONCE(refs > BIT(LRU_REFS_WIDTH));
>> +
>> +    /* see the comment in folio_lru_refs() */
>> +    return order_base_2(refs + 1);
>> +}
>> +
>> +static inline int folio_lru_refs(struct folio *folio)
>> +{
>> +    unsigned long flags = READ_ONCE(folio->flags);
>> +    bool workingset = flags & BIT(PG_workingset);
>> +
>> +    /*
>> +     * Return the number of accesses beyond PG_referenced, i.e., N-1 
>> if the
>> +     * total number of accesses is N>1, since N=0,1 both map to the 
>> first
>> +     * tier. lru_tier_from_refs() will account for this off-by-one. 
>> Also see
>> +     * the comment on MAX_NR_TIERS.
>> +     */
>> +    return ((flags & LRU_REFS_MASK) >> LRU_REFS_PGOFF) + workingset;
>> +}
>> +
>>   static inline int folio_lru_gen(struct folio *folio)
>>   {
>>       unsigned long flags = READ_ONCE(folio->flags);
>> @@ -171,6 +198,15 @@ static inline void lru_gen_update_size(struct 
>> lruvec *lruvec, struct folio *foli
>>           __update_lru_size(lruvec, lru, zone, -delta);
>>           return;
>>       }
>> +
>> +    /* promotion */
>> +    if (!lru_gen_is_active(lruvec, old_gen) && 
>> lru_gen_is_active(lruvec, new_gen)) {
>> +        __update_lru_size(lruvec, lru, zone, -delta);
>> +        __update_lru_size(lruvec, lru + LRU_ACTIVE, zone, delta);
>> +    }
>> +
>> +    /* demotion requires isolation, e.g., lru_deactivate_fn() */
>> +    VM_WARN_ON_ONCE(lru_gen_is_active(lruvec, old_gen) && 
>> !lru_gen_is_active(lruvec, new_gen));
>>   }
>>     static inline bool lru_gen_add_folio(struct lruvec *lruvec, 
>> struct folio *folio, bool reclaiming)
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index 6994acef63cb..2d023d243e73 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -348,6 +348,29 @@ enum lruvec_flags {
>>   #define MIN_NR_GENS        2U
>>   #define MAX_NR_GENS        4U
>>   +/*
>> + * Each generation is divided into multiple tiers. Tiers represent 
>> different
>> + * ranges of numbers of accesses through file descriptors. A page 
>> accessed N
>> + * times through file descriptors is in tier order_base_2(N). A page 
>> in the
>> + * first tier (N=0,1) is marked by PG_referenced unless it was 
>> faulted in
>> + * though page tables or read ahead. A page in any other tier (N>1) 
>> is marked
>> + * by PG_referenced and PG_workingset. This implies a minimum of two 
>> tiers is
>> + * supported without using additional bits in folio->flags.
>> + *
>> + * In contrast to moving across generations which requires the LRU 
>> lock, moving
>> + * across tiers only involves atomic operations on folio->flags and 
>> therefore
>> + * has a negligible cost in the buffered access path. In the 
>> eviction path,
>> + * comparisons of refaulted/(evicted+protected) from the first tier 
>> and the
>> + * rest infer whether pages accessed multiple times through file 
>> descriptors
>> + * are statistically hot and thus worth protecting.
>> + *
>> + * MAX_NR_TIERS is set to 4 so that the multi-gen LRU can support 
>> twice the
>> + * number of categories of the active/inactive LRU when keeping 
>> track of
>> + * accesses through file descriptors. It uses MAX_NR_TIERS-2 spare 
>> bits in
>> + * folio->flags (LRU_REFS_MASK).
>> + */
>> +#define MAX_NR_TIERS        4U
>> +
>>   #ifndef __GENERATING_BOUNDS_H
>>     struct lruvec;
>> @@ -362,6 +385,16 @@ enum {
>>       LRU_GEN_FILE,
>>   };
>>   +#define MIN_LRU_BATCH        BITS_PER_LONG
>> +#define MAX_LRU_BATCH        (MIN_LRU_BATCH * 128)
>> +
>> +/* whether to keep historical stats from evicted generations */
>> +#ifdef CONFIG_LRU_GEN_STATS
>> +#define NR_HIST_GENS        MAX_NR_GENS
>> +#else
>> +#define NR_HIST_GENS        1U
>> +#endif
>> +
>>   /*
>>    * The youngest generation number is stored in max_seq for both 
>> anon and file
>>    * types as they are aged on an equal footing. The oldest 
>> generation numbers are
>> @@ -384,6 +417,15 @@ struct lru_gen_struct {
>>       struct list_head lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
>>       /* the sizes of the above lists */
>>       long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
>> +    /* the exponential moving average of refaulted */
>> +    unsigned long avg_refaulted[ANON_AND_FILE][MAX_NR_TIERS];
>> +    /* the exponential moving average of evicted+protected */
>> +    unsigned long avg_total[ANON_AND_FILE][MAX_NR_TIERS];
>> +    /* the first tier doesn't need protection, hence the minus one */
>> +    unsigned long 
>> protected[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS - 1];
>> +    /* can be modified without holding the LRU lock */
>> +    atomic_long_t evicted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
>> +    atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
>>   };
>>     void lru_gen_init_lruvec(struct lruvec *lruvec);
>> diff --git a/include/linux/page-flags-layout.h 
>> b/include/linux/page-flags-layout.h
>> index 240905407a18..7d79818dc065 100644
>> --- a/include/linux/page-flags-layout.h
>> +++ b/include/linux/page-flags-layout.h
>> @@ -106,7 +106,10 @@
>>   #error "Not enough bits in page flags"
>>   #endif
>>   -#define LRU_REFS_WIDTH    0
>> +/* see the comment on MAX_NR_TIERS */
>> +#define LRU_REFS_WIDTH    min(__LRU_REFS_WIDTH, BITS_PER_LONG - 
>> NR_PAGEFLAGS - \
>> +                ZONES_WIDTH - LRU_GEN_WIDTH - SECTIONS_WIDTH - \
>> +                NODES_WIDTH - KASAN_TAG_WIDTH - LAST_CPUPID_WIDTH)
>>     #endif
>>   #endif /* _LINUX_PAGE_FLAGS_LAYOUT */
>> diff --git a/kernel/bounds.c b/kernel/bounds.c
>> index 5ee60777d8e4..b529182e8b04 100644
>> --- a/kernel/bounds.c
>> +++ b/kernel/bounds.c
>> @@ -24,8 +24,10 @@ int main(void)
>>       DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
>>   #ifdef CONFIG_LRU_GEN
>>       DEFINE(LRU_GEN_WIDTH, order_base_2(MAX_NR_GENS + 1));
>> +    DEFINE(__LRU_REFS_WIDTH, MAX_NR_TIERS - 2);
>>   #else
>>       DEFINE(LRU_GEN_WIDTH, 0);
>> +    DEFINE(__LRU_REFS_WIDTH, 0);
>>   #endif
>>       /* End of constants */
>>   diff --git a/mm/Kconfig b/mm/Kconfig
>> index e62bd501082b..0aeacbd3361c 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -909,6 +909,7 @@ config ANON_VMA_NAME
>>         area from being merged with adjacent virtual memory areas due 
>> to the
>>         difference in their name.
>>   +# multi-gen LRU {
>>   config LRU_GEN
>>       bool "Multi-Gen LRU"
>>       depends on MMU
>> @@ -917,6 +918,16 @@ config LRU_GEN
>>       help
>>         A high performance LRU implementation to overcommit memory.
>>   +config LRU_GEN_STATS
>> +    bool "Full stats for debugging"
>> +    depends on LRU_GEN
>> +    help
>> +      Do not enable this option unless you plan to look at 
>> historical stats
>> +      from evicted generations for debugging purpose.
>> +
>> +      This option has a per-memcg and per-node memory overhead.
>> +# }
>> +
>>   source "mm/damon/Kconfig"
>>     endmenu
>> diff --git a/mm/swap.c b/mm/swap.c
>> index a6870ba0bd83..a99d22308f28 100644
>> --- a/mm/swap.c
>> +++ b/mm/swap.c
>> @@ -405,6 +405,40 @@ static void __lru_cache_activate_folio(struct 
>> folio *folio)
>>       local_unlock(&lru_pvecs.lock);
>>   }
>>   +#ifdef CONFIG_LRU_GEN
>> +static void folio_inc_refs(struct folio *folio)
>> +{
>> +    unsigned long new_flags, old_flags = READ_ONCE(folio->flags);
>> +
>> +    if (folio_test_unevictable(folio))
>> +        return;
>> +
>> +    if (!folio_test_referenced(folio)) {
>> +        folio_set_referenced(folio);
>> +        return;
>> +    }
>> +
>> +    if (!folio_test_workingset(folio)) {
>> +        folio_set_workingset(folio);
>> +        return;
>> +    }
>> +
>> +    /* see the comment on MAX_NR_TIERS */
>> +    do {
>> +        new_flags = old_flags & LRU_REFS_MASK;
>> +        if (new_flags == LRU_REFS_MASK)
>> +            break;
>> +
>> +        new_flags += BIT(LRU_REFS_PGOFF);
>> +        new_flags |= old_flags & ~LRU_REFS_MASK;
>> +    } while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
>> +}
>> +#else
>> +static void folio_inc_refs(struct folio *folio)
>> +{
>> +}
>> +#endif /* CONFIG_LRU_GEN */
>> +
>>   /*
>>    * Mark a page as having seen activity.
>>    *
>> @@ -417,6 +451,11 @@ static void __lru_cache_activate_folio(struct 
>> folio *folio)
>>    */
>>   void folio_mark_accessed(struct folio *folio)
>>   {
>> +    if (lru_gen_enabled()) {
>> +        folio_inc_refs(folio);
>> +        return;
>> +    }
>> +
>>       if (!folio_test_referenced(folio)) {
>>           folio_set_referenced(folio);
>>       } else if (folio_test_unevictable(folio)) {
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index b41ff9765cc7..891f0ab69b3a 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -1275,9 +1275,11 @@ static int __remove_mapping(struct 
>> address_space *mapping, struct folio *folio,
>>         if (folio_test_swapcache(folio)) {
>>           swp_entry_t swap = folio_swap_entry(folio);
>> -        mem_cgroup_swapout(folio, swap);
>> +
>> +        /* get a shadow entry before mem_cgroup_swapout() clears 
>> folio_memcg() */
>>           if (reclaimed && !mapping_exiting(mapping))
>>               shadow = workingset_eviction(folio, target_memcg);
>> +        mem_cgroup_swapout(folio, swap);
>>           __delete_from_swap_cache(&folio->page, swap, shadow);
>>           xa_unlock_irq(&mapping->i_pages);
>>           put_swap_page(&folio->page, swap);
>> @@ -2649,6 +2651,9 @@ static void prepare_scan_count(pg_data_t 
>> *pgdat, struct scan_control *sc)
>>       unsigned long file;
>>       struct lruvec *target_lruvec;
>>   +    if (lru_gen_enabled())
>> +        return;
>> +
>>       target_lruvec = mem_cgroup_lruvec(sc->target_mem_cgroup, pgdat);
>>         /*
>> @@ -2974,6 +2979,17 @@ static bool can_age_anon_pages(struct 
>> pglist_data *pgdat,
>>    *                          shorthand helpers
>> ******************************************************************************/
>>   +#define LRU_REFS_FLAGS    (BIT(PG_referenced) | BIT(PG_workingset))
>> +
>> +#define DEFINE_MAX_SEQ(lruvec)                        \
>> +    unsigned long max_seq = READ_ONCE((lruvec)->lrugen.max_seq)
>> +
>> +#define DEFINE_MIN_SEQ(lruvec)                        \
>> +    unsigned long min_seq[ANON_AND_FILE] = {            \
>> + READ_ONCE((lruvec)->lrugen.min_seq[LRU_GEN_ANON]),    \
>> + READ_ONCE((lruvec)->lrugen.min_seq[LRU_GEN_FILE]),    \
>> +    }
>> +
>>   #define for_each_gen_type_zone(gen, type, zone) \
>>       for ((gen) = 0; (gen) < MAX_NR_GENS; (gen)++)            \
>>           for ((type) = 0; (type) < ANON_AND_FILE; (type)++)    \
>> @@ -2999,6 +3015,753 @@ static struct lruvec __maybe_unused 
>> *get_lruvec(struct mem_cgroup *memcg, int ni
>>       return pgdat ? &pgdat->__lruvec : NULL;
>>   }
>>   +static int get_swappiness(struct lruvec *lruvec, struct 
>> scan_control *sc)
>> +{
>> +    struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>> +    struct pglist_data *pgdat = lruvec_pgdat(lruvec);
>> +
>> +    if (!can_demote(pgdat->node_id, sc) &&
>> +        mem_cgroup_get_nr_swap_pages(memcg) < MIN_LRU_BATCH)
>> +        return 0;
>> +
>> +    return mem_cgroup_swappiness(memcg);
>> +}
>> +
>> +static int get_nr_gens(struct lruvec *lruvec, int type)
>> +{
>> +    return lruvec->lrugen.max_seq - lruvec->lrugen.min_seq[type] + 1;
>> +}
>> +
>> +static bool __maybe_unused seq_is_valid(struct lruvec *lruvec)
>> +{
>> +    /* see the comment on lru_gen_struct */
>> +    return get_nr_gens(lruvec, LRU_GEN_FILE) >= MIN_NR_GENS &&
>> +           get_nr_gens(lruvec, LRU_GEN_FILE) <= get_nr_gens(lruvec, 
>> LRU_GEN_ANON) &&
>> +           get_nr_gens(lruvec, LRU_GEN_ANON) <= MAX_NR_GENS;
>> +}
>> +
>> +/****************************************************************************** 
>>
>> + *                          refault feedback loop
>> + 
>> ******************************************************************************/
>> +
>> +/*
>> + * A feedback loop based on Proportional-Integral-Derivative (PID) 
>> controller.
>> + *
>> + * The P term is refaulted/(evicted+protected) from a tier in the 
>> generation
>> + * currently being evicted; the I term is the exponential moving 
>> average of the
>> + * P term over the generations previously evicted, using the 
>> smoothing factor
>> + * 1/2; the D term isn't supported.
>> + *
>> + * The setpoint (SP) is always the first tier of one type; the 
>> process variable
>> + * (PV) is either any tier of the other type or any other tier of 
>> the same
>> + * type.
>> + *
>> + * The error is the difference between the SP and the PV; the 
>> correction is
>> + * turn off protection when SP>PV or turn on protection when SP<PV.
>> + *
>> + * For future optimizations:
>> + * 1. The D term may discount the other two terms over time so that 
>> long-lived
>> + *    generations can resist stale information.
>> + */
>> +struct ctrl_pos {
>> +    unsigned long refaulted;
>> +    unsigned long total;
>> +    int gain;
>> +};
>> +
>> +static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier, 
>> int gain,
>> +              struct ctrl_pos *pos)
>> +{
>> +    struct lru_gen_struct *lrugen = &lruvec->lrugen;
>> +    int hist = lru_hist_from_seq(lrugen->min_seq[type]);
>> +
>> +    pos->refaulted = lrugen->avg_refaulted[type][tier] +
>> + atomic_long_read(&lrugen->refaulted[hist][type][tier]);
>> +    pos->total = lrugen->avg_total[type][tier] +
>> + atomic_long_read(&lrugen->evicted[hist][type][tier]);
>> +    if (tier)
>> +        pos->total += lrugen->protected[hist][type][tier - 1];
>> +    pos->gain = gain;
>> +}
>> +
>> +static void reset_ctrl_pos(struct lruvec *lruvec, int type, bool 
>> carryover)
>> +{
>> +    int hist, tier;
>> +    struct lru_gen_struct *lrugen = &lruvec->lrugen;
>> +    bool clear = carryover ? NR_HIST_GENS == 1 : NR_HIST_GENS > 1;
>> +    unsigned long seq = carryover ? lrugen->min_seq[type] : 
>> lrugen->max_seq + 1;
>> +
>> +    lockdep_assert_held(&lruvec->lru_lock);
>> +
>> +    if (!carryover && !clear)
>> +        return;
>> +
>> +    hist = lru_hist_from_seq(seq);
>> +
>> +    for (tier = 0; tier < MAX_NR_TIERS; tier++) {
>> +        if (carryover) {
>> +            unsigned long sum;
>> +
>> +            sum = lrugen->avg_refaulted[type][tier] +
>> + atomic_long_read(&lrugen->refaulted[hist][type][tier]);
>> +            WRITE_ONCE(lrugen->avg_refaulted[type][tier], sum / 2);
>> +
>> +            sum = lrugen->avg_total[type][tier] +
>> + atomic_long_read(&lrugen->evicted[hist][type][tier]);
>> +            if (tier)
>> +                sum += lrugen->protected[hist][type][tier - 1];
>> +            WRITE_ONCE(lrugen->avg_total[type][tier], sum / 2);
>> +        }
>> +
>> +        if (clear) {
>> + atomic_long_set(&lrugen->refaulted[hist][type][tier], 0);
>> + atomic_long_set(&lrugen->evicted[hist][type][tier], 0);
>> +            if (tier)
>> + WRITE_ONCE(lrugen->protected[hist][type][tier - 1], 0);
>> +        }
>> +    }
>> +}
>> +
>> +static bool positive_ctrl_err(struct ctrl_pos *sp, struct ctrl_pos *pv)
>> +{
>> +    /*
>> +     * Return true if the PV has a limited number of refaults or a 
>> lower
>> +     * refaulted/total than the SP.
>> +     */
>> +    return pv->refaulted < MIN_LRU_BATCH ||
>> +           pv->refaulted * (sp->total + MIN_LRU_BATCH) * sp->gain <=
>> +           (sp->refaulted + 1) * pv->total * pv->gain;
>> +}
>> +
>> +/****************************************************************************** 
>>
>> + *                          the aging
>> + 
>> ******************************************************************************/
>> +
>> +static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio, 
>> bool reclaiming)
>> +{
>> +    int type = folio_is_file_lru(folio);
>> +    struct lru_gen_struct *lrugen = &lruvec->lrugen;
>> +    int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
>> +    unsigned long new_flags, old_flags = READ_ONCE(folio->flags);
>> +
>> +    VM_WARN_ON_ONCE_FOLIO(!(old_flags & LRU_GEN_MASK), folio);
>> +
>> +    do {
>> +        new_gen = (old_gen + 1) % MAX_NR_GENS;
>> +
>> +        new_flags = old_flags & ~(LRU_GEN_MASK | LRU_REFS_MASK | 
>> LRU_REFS_FLAGS);
>> +        new_flags |= (new_gen + 1UL) << LRU_GEN_PGOFF;
>> +        /* for folio_end_writeback() */
>> +        if (reclaiming)
>> +            new_flags |= BIT(PG_reclaim);
>> +    } while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
>> +
>> +    lru_gen_update_size(lruvec, folio, old_gen, new_gen);
>> +
>> +    return new_gen;
>> +}
>> +
>> +static void inc_min_seq(struct lruvec *lruvec, int type)
>> +{
>> +    struct lru_gen_struct *lrugen = &lruvec->lrugen;
>> +
>> +    reset_ctrl_pos(lruvec, type, true);
>> +    WRITE_ONCE(lrugen->min_seq[type], lrugen->min_seq[type] + 1);
>> +}
>> +
>> +static bool try_to_inc_min_seq(struct lruvec *lruvec, bool can_swap)
>> +{
>> +    int gen, type, zone;
>> +    bool success = false;
>> +    struct lru_gen_struct *lrugen = &lruvec->lrugen;
>> +    DEFINE_MIN_SEQ(lruvec);
>> +
>> +    VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
>> +
>> +    /* find the oldest populated generation */
>> +    for (type = !can_swap; type < ANON_AND_FILE; type++) {
>> +        while (min_seq[type] + MIN_NR_GENS <= lrugen->max_seq) {
>> +            gen = lru_gen_from_seq(min_seq[type]);
>> +
>> +            for (zone = 0; zone < MAX_NR_ZONES; zone++) {
>> +                if (!list_empty(&lrugen->lists[gen][type][zone]))
>> +                    goto next;
>> +            }
>> +
>> +            min_seq[type]++;
>> +        }
>> +next:
>> +        ;
>> +    }
>> +
>> +    /* see the comment on lru_gen_struct */
>> +    if (can_swap) {
>> +        min_seq[LRU_GEN_ANON] = min(min_seq[LRU_GEN_ANON], 
>> min_seq[LRU_GEN_FILE]);
>> +        min_seq[LRU_GEN_FILE] = max(min_seq[LRU_GEN_ANON], 
>> lrugen->min_seq[LRU_GEN_FILE]);
>> +    }
>> +
>> +    for (type = !can_swap; type < ANON_AND_FILE; type++) {
>> +        if (min_seq[type] == lrugen->min_seq[type])
>> +            continue;
>> +
>> +        reset_ctrl_pos(lruvec, type, true);
>> +        WRITE_ONCE(lrugen->min_seq[type], min_seq[type]);
>> +        success = true;
>> +    }
>> +
>> +    return success;
>> +}
>> +
>> +static void inc_max_seq(struct lruvec *lruvec, unsigned long 
>> max_seq, bool can_swap)
>> +{
>> +    int prev, next;
>> +    int type, zone;
>> +    struct lru_gen_struct *lrugen = &lruvec->lrugen;
>> +
>> +    spin_lock_irq(&lruvec->lru_lock);
>> +
>> +    VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
>> +
>> +    if (max_seq != lrugen->max_seq)
>> +        goto unlock;
>> +
>> +    for (type = 0; type < ANON_AND_FILE; type++) {
>> +        if (get_nr_gens(lruvec, type) != MAX_NR_GENS)
>> +            continue;
>> +
>> +        VM_WARN_ON_ONCE(type == LRU_GEN_FILE || can_swap);
>> +
>> +        inc_min_seq(lruvec, type);
>> +    }
>> +
>> +    /*
>> +     * Update the active/inactive LRU sizes for compatibility. Both 
>> sides of
>> +     * the current max_seq need to be covered, since max_seq+1 can 
>> overlap
>> +     * with min_seq[LRU_GEN_ANON] if swapping is constrained. And if 
>> they do
>> +     * overlap, cold/hot inversion happens.
>> +     */
>> +    prev = lru_gen_from_seq(lrugen->max_seq - 1);
>> +    next = lru_gen_from_seq(lrugen->max_seq + 1);
>> +
>> +    for (type = 0; type < ANON_AND_FILE; type++) {
>> +        for (zone = 0; zone < MAX_NR_ZONES; zone++) {
>> +            enum lru_list lru = type * LRU_INACTIVE_FILE;
>> +            long delta = lrugen->nr_pages[prev][type][zone] -
>> +                     lrugen->nr_pages[next][type][zone];
>> +
>> +            if (!delta)
>> +                continue;
>> +
>> +            __update_lru_size(lruvec, lru, zone, delta);
>> +            __update_lru_size(lruvec, lru + LRU_ACTIVE, zone, -delta);
>> +        }
>> +    }
>> +
>> +    for (type = 0; type < ANON_AND_FILE; type++)
>> +        reset_ctrl_pos(lruvec, type, false);
>> +
>> +    /* make sure preceding modifications appear */
>> +    smp_store_release(&lrugen->max_seq, lrugen->max_seq + 1);
>> +unlock:
>> +    spin_unlock_irq(&lruvec->lru_lock);
>> +}
>> +
>> +static long get_nr_evictable(struct lruvec *lruvec, unsigned long 
>> max_seq,
>> +                 unsigned long *min_seq, bool can_swap, bool 
>> *need_aging)
>> +{
>> +    int gen, type, zone;
>> +    long old = 0;
>> +    long young = 0;
>> +    long total = 0;
>> +    struct lru_gen_struct *lrugen = &lruvec->lrugen;
>> +
>> +    for (type = !can_swap; type < ANON_AND_FILE; type++) {
>> +        unsigned long seq;
>> +
>> +        for (seq = min_seq[type]; seq <= max_seq; seq++) {
>> +            long size = 0;
>> +
>> +            gen = lru_gen_from_seq(seq);
>> +
>> +            for (zone = 0; zone < MAX_NR_ZONES; zone++)
>> +                size += READ_ONCE(lrugen->nr_pages[gen][type][zone]);
>> +
>> +            total += size;
>> +            if (seq == max_seq)
>> +                young += size;
>> +            if (seq + MIN_NR_GENS == max_seq)
>> +                old += size;
>> +        }
>> +    }
>> +
>> +    /*
>> +     * The aging tries to be lazy to reduce the overhead. On the 
>> other hand,
>> +     * the eviction stalls when the number of generations reaches
>> +     * MIN_NR_GENS. So ideally, there should be MIN_NR_GENS+1 
>> generations,
>> +     * hence the first two if's.
>> +     *
>> +     * Also it's ideal to spread pages out evenly, meaning 
>> 1/(MIN_NR_GENS+1)
>> +     * of the total number of pages for each generation. A 
>> reasonable range
>> +     * for this average portion is [1/MIN_NR_GENS, 
>> 1/(MIN_NR_GENS+2)]. The
>> +     * eviction cares about the lower bound of cold pages, whereas 
>> the aging
>> +     * cares about the upper bound of hot pages.
>> +     */
>> +    if (min_seq[!can_swap] + MIN_NR_GENS > max_seq)
>> +        *need_aging = true;
>> +    else if (min_seq[!can_swap] + MIN_NR_GENS < max_seq)
>> +        *need_aging = false;
>> +    else if (young * MIN_NR_GENS > total)
>> +        *need_aging = true;
>> +    else if (old * (MIN_NR_GENS + 2) < total)
>> +        *need_aging = true;
>> +    else
>> +        *need_aging = false;
>> +
>> +    return total > 0 ? total : 0;
>> +}
>> +
>> +static void age_lruvec(struct lruvec *lruvec, struct scan_control *sc)
>> +{
>> +    bool need_aging;
>> +    long nr_to_scan;
>> +    int swappiness = get_swappiness(lruvec, sc);
>> +    struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>> +    DEFINE_MAX_SEQ(lruvec);
>> +    DEFINE_MIN_SEQ(lruvec);
>> +
>> +    VM_WARN_ON_ONCE(sc->memcg_low_reclaim);
>> +
>> +    mem_cgroup_calculate_protection(NULL, memcg);
>> +
>> +    if (mem_cgroup_below_min(memcg))
>> +        return;
>> +
>> +    nr_to_scan = get_nr_evictable(lruvec, max_seq, min_seq, 
>> swappiness, &need_aging);
>> +    if (!nr_to_scan)
>> +        return;
>> +
>> +    nr_to_scan >>= sc->priority;
>> +
>> +    if (!mem_cgroup_online(memcg))
>> +        nr_to_scan++;
>> +
>> +    if (nr_to_scan && need_aging)
>> +        inc_max_seq(lruvec, max_seq, swappiness);
>> +}
>> +
>> +static void lru_gen_age_node(struct pglist_data *pgdat, struct 
>> scan_control *sc)
>> +{
>> +    struct mem_cgroup *memcg;
>> +
>> +    VM_WARN_ON_ONCE(!current_is_kswapd());
>> +
>> +    memcg = mem_cgroup_iter(NULL, NULL, NULL);
>> +    do {
>> +        struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
>> +
>> +        age_lruvec(lruvec, sc);
>> +
>> +        cond_resched();
>> +    } while ((memcg = mem_cgroup_iter(NULL, memcg, NULL)));
>> +}
>> +
>> +/****************************************************************************** 
>>
>> + *                          the eviction
>> + 
>> ******************************************************************************/
>> +
>> +static bool sort_folio(struct lruvec *lruvec, struct folio *folio, 
>> int tier_idx)
>> +{
>> +    bool success;
>> +    int gen = folio_lru_gen(folio);
>> +    int type = folio_is_file_lru(folio);
>> +    int zone = folio_zonenum(folio);
>> +    int delta = folio_nr_pages(folio);
>> +    int refs = folio_lru_refs(folio);
>> +    int tier = lru_tier_from_refs(refs);
>> +    struct lru_gen_struct *lrugen = &lruvec->lrugen;
>> +
>> +    VM_WARN_ON_ONCE_FOLIO(gen >= MAX_NR_GENS, folio);
>> +
>> +    /* unevictable */
>> +    if (!folio_evictable(folio)) {
>> +        success = lru_gen_del_folio(lruvec, folio, true);
>> +        VM_WARN_ON_ONCE_FOLIO(!success, folio);
>> +        folio_set_unevictable(folio);
>> +        lruvec_add_folio(lruvec, folio);
>> +        __count_vm_events(UNEVICTABLE_PGCULLED, delta);
>> +        return true;
>> +    }
>> +
>> +    /* dirtied lazyfree */
>> +    if (type == LRU_GEN_FILE && folio_test_anon(folio) && 
>> folio_test_dirty(folio)) {
>> +        success = lru_gen_del_folio(lruvec, folio, true);
>> +        VM_WARN_ON_ONCE_FOLIO(!success, folio);
>> +        folio_set_swapbacked(folio);
>> +        lruvec_add_folio_tail(lruvec, folio);
>> +        return true;
>> +    }
>> +
>> +    /* protected */
>> +    if (tier > tier_idx) {
>> +        int hist = lru_hist_from_seq(lrugen->min_seq[type]);
>> +
>> +        gen = folio_inc_gen(lruvec, folio, false);
>> +        list_move_tail(&folio->lru, &lrugen->lists[gen][type][zone]);
>> +
>> +        WRITE_ONCE(lrugen->protected[hist][type][tier - 1],
>> +               lrugen->protected[hist][type][tier - 1] + delta);
>> +        __mod_lruvec_state(lruvec, WORKINGSET_ACTIVATE_BASE + type, 
>> delta);
>> +        return true;
>> +    }
>> +
>> +    /* waiting for writeback */
>> +    if (folio_test_locked(folio) || folio_test_writeback(folio) ||
>> +        (type == LRU_GEN_FILE && folio_test_dirty(folio))) {
>> +        gen = folio_inc_gen(lruvec, folio, true);
>> +        list_move(&folio->lru, &lrugen->lists[gen][type][zone]);
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static bool isolate_folio(struct lruvec *lruvec, struct folio 
>> *folio, struct scan_control *sc)
>> +{
>> +    bool success;
>> +
>> +    if (!sc->may_unmap && folio_mapped(folio))
>> +        return false;
>> +
>> +    if (!(sc->may_writepage && (sc->gfp_mask & __GFP_IO)) &&
>> +        (folio_test_dirty(folio) ||
>> +         (folio_test_anon(folio) && !folio_test_swapcache(folio))))
>> +        return false;
>> +
>> +    if (!folio_try_get(folio))
>> +        return false;
>> +
>> +    if (!folio_test_clear_lru(folio)) {
>> +        folio_put(folio);
>> +        return false;
>> +    }
>> +
>> +    success = lru_gen_del_folio(lruvec, folio, true);
>> +    VM_WARN_ON_ONCE_FOLIO(!success, folio);
>> +
>> +    return true;
>> +}
>> +
>> +static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
>> +               int type, int tier, struct list_head *list)
>> +{
>> +    int gen, zone;
>> +    enum vm_event_item item;
>> +    int sorted = 0;
>> +    int scanned = 0;
>> +    int isolated = 0;
>> +    int remaining = MAX_LRU_BATCH;
>> +    struct lru_gen_struct *lrugen = &lruvec->lrugen;
>> +    struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>> +
>> +    VM_WARN_ON_ONCE(!list_empty(list));
>> +
>> +    if (get_nr_gens(lruvec, type) == MIN_NR_GENS)
>> +        return 0;
>> +
>> +    gen = lru_gen_from_seq(lrugen->min_seq[type]);
>> +
>> +    for (zone = sc->reclaim_idx; zone >= 0; zone--) {
>> +        LIST_HEAD(moved);
>> +        int skipped = 0;
>> +        struct list_head *head = &lrugen->lists[gen][type][zone];
>> +
>> +        while (!list_empty(head)) {
>> +            struct folio *folio = lru_to_folio(head);
>> +            int delta = folio_nr_pages(folio);
>> +
>> + VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
>> +            VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
>> +            VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) != type, 
>> folio);
>> +            VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) != zone, folio);
>> +
>> +            scanned += delta;
>> +
>> +            if (sort_folio(lruvec, folio, tier))
>> +                sorted += delta;
>> +            else if (isolate_folio(lruvec, folio, sc)) {
>> +                list_add(&folio->lru, list);
>> +                isolated += delta;
>> +            } else {
>> +                list_move(&folio->lru, &moved);
>> +                skipped += delta;
>> +            }
>> +
>> +            if (!--remaining || max(isolated, skipped) >= 
>> MIN_LRU_BATCH)
>> +                break;
>> +        }
>> +
>> +        if (skipped) {
>> +            list_splice(&moved, head);
>> +            __count_zid_vm_events(PGSCAN_SKIP, zone, skipped);
>> +        }
>> +
>> +        if (!remaining || isolated >= MIN_LRU_BATCH)
>> +            break;
>> +    }
>> +
>> +    item = current_is_kswapd() ? PGSCAN_KSWAPD : PGSCAN_DIRECT;
>> +    if (!cgroup_reclaim(sc)) {
>> +        __count_vm_events(item, isolated);
>> +        __count_vm_events(PGREFILL, sorted);
>> +    }
>> +    __count_memcg_events(memcg, item, isolated);
>> +    __count_memcg_events(memcg, PGREFILL, sorted);
>> +    __count_vm_events(PGSCAN_ANON + type, isolated);
>> +
>> +    /*
>> +     * There might not be eligible pages due to reclaim_idx, 
>> may_unmap and
>> +     * may_writepage. Check the remaining to prevent livelock if 
>> there is no
>> +     * progress.
>> +     */
>> +    return isolated || !remaining ? scanned : 0;
>> +}
>> +
>> +static int get_tier_idx(struct lruvec *lruvec, int type)
>> +{
>> +    int tier;
>> +    struct ctrl_pos sp, pv;
>> +
>> +    /*
>> +     * To leave a margin for fluctuations, use a larger gain factor 
>> (1:2).
>> +     * This value is chosen because any other tier would have at 
>> least twice
>> +     * as many refaults as the first tier.
>> +     */
>> +    read_ctrl_pos(lruvec, type, 0, 1, &sp);
>> +    for (tier = 1; tier < MAX_NR_TIERS; tier++) {
>> +        read_ctrl_pos(lruvec, type, tier, 2, &pv);
>> +        if (!positive_ctrl_err(&sp, &pv))
>> +            break;
>> +    }
>> +
>> +    return tier - 1;
>> +}
>> +
>> +static int get_type_to_scan(struct lruvec *lruvec, int swappiness, 
>> int *tier_idx)
>> +{
>> +    int type, tier;
>> +    struct ctrl_pos sp, pv;
>> +    int gain[ANON_AND_FILE] = { swappiness, 200 - swappiness };
>> +
>> +    /*
>> +     * Compare the first tier of anon with that of file to determine 
>> which
>> +     * type to scan. Also need to compare other tiers of the 
>> selected type
>> +     * with the first tier of the other type to determine the last 
>> tier (of
>> +     * the selected type) to evict.
>> +     */
>> +    read_ctrl_pos(lruvec, LRU_GEN_ANON, 0, gain[LRU_GEN_ANON], &sp);
>> +    read_ctrl_pos(lruvec, LRU_GEN_FILE, 0, gain[LRU_GEN_FILE], &pv);
>> +    type = positive_ctrl_err(&sp, &pv);
>> +
>> +    read_ctrl_pos(lruvec, !type, 0, gain[!type], &sp);
>> +    for (tier = 1; tier < MAX_NR_TIERS; tier++) {
>> +        read_ctrl_pos(lruvec, type, tier, gain[type], &pv);
>> +        if (!positive_ctrl_err(&sp, &pv))
>> +            break;
>> +    }
>> +
>> +    *tier_idx = tier - 1;
>> +
>> +    return type;
>> +}
>> +
>> +static int isolate_folios(struct lruvec *lruvec, struct scan_control 
>> *sc, int swappiness,
>> +              int *type_scanned, struct list_head *list)
>> +{
>> +    int i;
>> +    int type;
>> +    int scanned;
>> +    int tier = -1;
>> +    DEFINE_MIN_SEQ(lruvec);
>> +
>> +    /*
>> +     * Try to make the obvious choice first. When anon and file are 
>> both
>> +     * available from the same generation, interpret swappiness 1 as 
>> file
>> +     * first and 200 as anon first.
>> +     */
>> +    if (!swappiness)
>> +        type = LRU_GEN_FILE;
>> +    else if (min_seq[LRU_GEN_ANON] < min_seq[LRU_GEN_FILE])
>> +        type = LRU_GEN_ANON;
>> +    else if (swappiness == 1)
>> +        type = LRU_GEN_FILE;
>> +    else if (swappiness == 200)
>> +        type = LRU_GEN_ANON;
>> +    else
>> +        type = get_type_to_scan(lruvec, swappiness, &tier);
>> +
>> +    for (i = !swappiness; i < ANON_AND_FILE; i++) {
>> +        if (tier < 0)
>> +            tier = get_tier_idx(lruvec, type);
>> +
>> +        scanned = scan_folios(lruvec, sc, type, tier, list);
>> +        if (scanned)
>> +            break;
>> +
>> +        type = !type;
>> +        tier = -1;
>> +    }
>> +
>> +    *type_scanned = type;
>> +
>> +    return scanned;
>> +}
>> +
>> +static int evict_folios(struct lruvec *lruvec, struct scan_control 
>> *sc, int swappiness)
>> +{
>> +    int type;
>> +    int scanned;
>> +    int reclaimed;
>> +    LIST_HEAD(list);
>> +    struct folio *folio;
>> +    enum vm_event_item item;
>> +    struct reclaim_stat stat;
>> +    struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>> +    struct pglist_data *pgdat = lruvec_pgdat(lruvec);
>> +
>> +    spin_lock_irq(&lruvec->lru_lock);
>> +
>> +    scanned = isolate_folios(lruvec, sc, swappiness, &type, &list);
>> +
>> +    if (try_to_inc_min_seq(lruvec, swappiness))
>> +        scanned++;
>> +
>> +    if (get_nr_gens(lruvec, !swappiness) == MIN_NR_GENS)
>> +        scanned = 0;
>> +
>> +    spin_unlock_irq(&lruvec->lru_lock);
>> +
>> +    if (list_empty(&list))
>> +        return scanned;
>> +
>> +    reclaimed = shrink_page_list(&list, pgdat, sc, &stat, false);
>> +
>> +    /*
>> +     * To avoid livelock, don't add rejected pages back to the same 
>> lists
>> +     * they were isolated from. See lru_gen_add_folio().
>> +     */
>> +    list_for_each_entry(folio, &list, lru) {
>> +        folio_clear_referenced(folio);
>> +        folio_clear_workingset(folio);
>> +
>> +        if (folio_test_reclaim(folio) &&
>> +            (folio_test_dirty(folio) || folio_test_writeback(folio)))
>> +            folio_clear_active(folio);
>> +        else
>> +            folio_set_active(folio);
>> +    }
>> +
>> +    spin_lock_irq(&lruvec->lru_lock);
>> +
>> +    move_pages_to_lru(lruvec, &list);
>> +
>> +    item = current_is_kswapd() ? PGSTEAL_KSWAPD : PGSTEAL_DIRECT;
>> +    if (!cgroup_reclaim(sc))
>> +        __count_vm_events(item, reclaimed);
>> +    __count_memcg_events(memcg, item, reclaimed);
>> +    __count_vm_events(PGSTEAL_ANON + type, reclaimed);
>> +
>> +    spin_unlock_irq(&lruvec->lru_lock);
>> +
>> +    mem_cgroup_uncharge_list(&list);
>> +    free_unref_page_list(&list);
>> +
>> +    sc->nr_reclaimed += reclaimed;
>> +
>> +    return scanned;
>> +}
>> +
>> +static long get_nr_to_scan(struct lruvec *lruvec, struct 
>> scan_control *sc, bool can_swap)
>> +{
>> +    bool need_aging;
>> +    long nr_to_scan;
>> +    struct mem_cgroup *memcg = lruvec_memcg(lruvec);
>> +    DEFINE_MAX_SEQ(lruvec);
>> +    DEFINE_MIN_SEQ(lruvec);
>> +
>> +    if (mem_cgroup_below_min(memcg) ||
>> +        (mem_cgroup_below_low(memcg) && !sc->memcg_low_reclaim))
>> +        return 0;
>> +
>> +    nr_to_scan = get_nr_evictable(lruvec, max_seq, min_seq, 
>> can_swap, &need_aging);
>> +    if (!nr_to_scan)
>> +        return 0;
>> +
>> +    /* reset the priority if the target has been met */
>> +    nr_to_scan >>= sc->nr_reclaimed < sc->nr_to_reclaim ? 
>> sc->priority : DEF_PRIORITY;
>> +
>> +    if (!mem_cgroup_online(memcg))
>> +        nr_to_scan++;
>> +
>> +    if (!nr_to_scan)
>> +        return 0;
>> +
>> +    if (!need_aging)
>> +        return nr_to_scan;
>> +
>> +    /* leave the work to lru_gen_age_node() */
>> +    if (current_is_kswapd())
>> +        return 0;
>> +
>> +    /* try other memcgs before going to the aging path */
>> +    if (!cgroup_reclaim(sc) && !sc->force_deactivate) {
>> +        sc->skipped_deactivate = true;
>> +        return 0;
>> +    }
>> +
>> +    inc_max_seq(lruvec, max_seq, can_swap);
>> +
>> +    return nr_to_scan;
>> +}
>> +
>> +static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct 
>> scan_control *sc)
>> +{
>> +    struct blk_plug plug;
>> +    long scanned = 0;
>> +
>> +    lru_add_drain();
>> +
>> +    blk_start_plug(&plug);
>> +
>> +    while (true) {
>> +        int delta;
>> +        int swappiness;
>> +        long nr_to_scan;
>> +
>> +        if (sc->may_swap)
>> +            swappiness = get_swappiness(lruvec, sc);
>> +        else if (!cgroup_reclaim(sc) && get_swappiness(lruvec, sc))
>> +            swappiness = 1;
>> +        else
>> +            swappiness = 0;
>> +
>> +        nr_to_scan = get_nr_to_scan(lruvec, sc, swappiness);
>> +        if (!nr_to_scan)
>> +            break;
>> +
>> +        delta = evict_folios(lruvec, sc, swappiness);
>> +        if (!delta)
>> +            break;
>> +
>> +        scanned += delta;
>> +        if (scanned >= nr_to_scan)
>> +            break;
>> +
>> +        cond_resched();
>> +    }
>> +
>> +    blk_finish_plug(&plug);
>> +}
>> +
>> /******************************************************************************
>>    *                          initialization
>> ******************************************************************************/
>> @@ -3041,6 +3804,16 @@ static int __init init_lru_gen(void)
>>   };
>>   late_initcall(init_lru_gen);
>>   +#else
>> +
>> +static void lru_gen_age_node(struct pglist_data *pgdat, struct 
>> scan_control *sc)
>> +{
>> +}
>> +
>> +static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct 
>> scan_control *sc)
>> +{
>> +}
>> +
>>   #endif /* CONFIG_LRU_GEN */
>>     static void shrink_lruvec(struct lruvec *lruvec, struct 
>> scan_control *sc)
>> @@ -3054,6 +3827,11 @@ static void shrink_lruvec(struct lruvec 
>> *lruvec, struct scan_control *sc)
>>       struct blk_plug plug;
>>       bool scan_adjusted;
>>   +    if (lru_gen_enabled()) {
>> +        lru_gen_shrink_lruvec(lruvec, sc);
>> +        return;
>> +    }
>> +
>>       get_scan_count(lruvec, sc, nr);
>>         /* Record the original scan target for proportional 
>> adjustments later */
>> @@ -3558,6 +4336,9 @@ static void snapshot_refaults(struct mem_cgroup 
>> *target_memcg, pg_data_t *pgdat)
>>       struct lruvec *target_lruvec;
>>       unsigned long refaults;
>>   +    if (lru_gen_enabled())
>> +        return;
>> +
>>       target_lruvec = mem_cgroup_lruvec(target_memcg, pgdat);
>>       refaults = lruvec_page_state(target_lruvec, 
>> WORKINGSET_ACTIVATE_ANON);
>>       target_lruvec->refaults[0] = refaults;
>> @@ -3922,12 +4703,17 @@ unsigned long 
>> try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
>>   }
>>   #endif
>>   -static void age_active_anon(struct pglist_data *pgdat,
>> +static void kswapd_age_node(struct pglist_data *pgdat,
>>                   struct scan_control *sc)
>>   {
>>       struct mem_cgroup *memcg;
>>       struct lruvec *lruvec;
>>   +    if (lru_gen_enabled()) {
>> +        lru_gen_age_node(pgdat, sc);
>> +        return;
>> +    }
>> +
>>       if (!can_age_anon_pages(pgdat, sc))
>>           return;
>>   @@ -4247,12 +5033,11 @@ static int balance_pgdat(pg_data_t *pgdat, 
>> int order, int highest_zoneidx)
>>           sc.may_swap = !nr_boost_reclaim;
>>             /*
>> -         * Do some background aging of the anon list, to give
>> -         * pages a chance to be referenced before reclaiming. All
>> -         * pages are rotated regardless of classzone as this is
>> -         * about consistent aging.
>> +         * Do some background aging, to give pages a chance to be
>> +         * referenced before reclaiming. All pages are rotated
>> +         * regardless of classzone as this is about consistent aging.
>>            */
>> -        age_active_anon(pgdat, &sc);
>> +        kswapd_age_node(pgdat, &sc);
>>             /*
>>            * If we're getting trouble reclaiming, start doing writepage
>> diff --git a/mm/workingset.c b/mm/workingset.c
>> index 592569a8974c..db6f0c8a98c2 100644
>> --- a/mm/workingset.c
>> +++ b/mm/workingset.c
>> @@ -187,7 +187,6 @@ static unsigned int bucket_order __read_mostly;
>>   static void *pack_shadow(int memcgid, pg_data_t *pgdat, unsigned 
>> long eviction,
>>                bool workingset)
>>   {
>> -    eviction >>= bucket_order;
>>       eviction &= EVICTION_MASK;
>>       eviction = (eviction << MEM_CGROUP_ID_SHIFT) | memcgid;
>>       eviction = (eviction << NODES_SHIFT) | pgdat->node_id;
>> @@ -212,10 +211,107 @@ static void unpack_shadow(void *shadow, int 
>> *memcgidp, pg_data_t **pgdat,
>>         *memcgidp = memcgid;
>>       *pgdat = NODE_DATA(nid);
>> -    *evictionp = entry << bucket_order;
>> +    *evictionp = entry;
>>       *workingsetp = workingset;
>>   }
>>   +#ifdef CONFIG_LRU_GEN
>> +
>> +static void *lru_gen_eviction(struct folio *folio)
>> +{
>> +    int hist;
>> +    unsigned long token;
>> +    unsigned long min_seq;
>> +    struct lruvec *lruvec;
>> +    struct lru_gen_struct *lrugen;
>> +    int type = folio_is_file_lru(folio);
>> +    int delta = folio_nr_pages(folio);
>> +    int refs = folio_lru_refs(folio);
>> +    int tier = lru_tier_from_refs(refs);
>> +    struct mem_cgroup *memcg = folio_memcg(folio);
>> +    struct pglist_data *pgdat = folio_pgdat(folio);
>> +
>> +    BUILD_BUG_ON(LRU_GEN_WIDTH + LRU_REFS_WIDTH > BITS_PER_LONG - 
>> EVICTION_SHIFT);
>> +
>> +    lruvec = mem_cgroup_lruvec(memcg, pgdat);
>> +    lrugen = &lruvec->lrugen;
>> +    min_seq = READ_ONCE(lrugen->min_seq[type]);
>> +    token = (min_seq << LRU_REFS_WIDTH) | max(refs - 1, 0);
>> +
>> +    hist = lru_hist_from_seq(min_seq);
>> +    atomic_long_add(delta, &lrugen->evicted[hist][type][tier]);
>> +
>> +    return pack_shadow(mem_cgroup_id(memcg), pgdat, token, refs);
>
> pack_shadow pass refs rather than PageWorkingset(page), is it done on 
> purpose?
>
> In my opinion,  PageWorkingset can be removed due to failed to reclaim
look at this again,  It's my fault , the workingset do not mean the 
orignal  page status.  Thanks,
>
>> +}
>> +
>> +static void lru_gen_refault(struct folio *folio, void *shadow)
>> +{
>> +    int hist, tier, refs;
>> +    int memcg_id;
>> +    bool workingset;
>> +    unsigned long token;
>> +    unsigned long min_seq;
>> +    struct lruvec *lruvec;
>> +    struct lru_gen_struct *lrugen;
>> +    struct mem_cgroup *memcg;
>> +    struct pglist_data *pgdat;
>> +    int type = folio_is_file_lru(folio);
>> +    int delta = folio_nr_pages(folio);
>> +
>> +    unpack_shadow(shadow, &memcg_id, &pgdat, &token, &workingset);
>> +
>> +    if (folio_pgdat(folio) != pgdat)
>> +        return;
>> +
>> +    /* see the comment in folio_lru_refs() */
>> +    refs = (token & (BIT(LRU_REFS_WIDTH) - 1)) + workingset;
>> +    tier = lru_tier_from_refs(refs);
>> +
>> +    rcu_read_lock();
>> +    memcg = folio_memcg_rcu(folio);
>> +    if (mem_cgroup_id(memcg) != memcg_id)
>> +        goto unlock;
>> +
>> +    lruvec = mem_cgroup_lruvec(memcg, pgdat);
>> +    lrugen = &lruvec->lrugen;
>> +    min_seq = READ_ONCE(lrugen->min_seq[type]);
>> +
>> +    token >>= LRU_REFS_WIDTH;
>> +    if (token != (min_seq & (EVICTION_MASK >> LRU_REFS_WIDTH)))
>> +        goto unlock;
>> +
>> +    hist = lru_hist_from_seq(min_seq);
>> +    atomic_long_add(delta, &lrugen->refaulted[hist][type][tier]);
>> +    mod_lruvec_state(lruvec, WORKINGSET_REFAULT_BASE + type, delta);
>> +
>> +    /*
>> +     * Count the following two cases as stalls:
>> +     * 1. For pages accessed through page tables, hotter pages 
>> pushed out
>> +     *    hot pages which refaulted immediately.
>> +     * 2. For pages accessed through file descriptors, numbers of 
>> accesses
>> +     *    might have been beyond the limit.
>> +     */
>> +    if (lru_gen_in_fault() || refs == BIT(LRU_REFS_WIDTH)) {
>> +        folio_set_workingset(folio);
>> +        mod_lruvec_state(lruvec, WORKINGSET_RESTORE_BASE + type, 
>> delta);
>> +    }
>> +unlock:
>> +    rcu_read_unlock();
>> +}
>> +
>> +#else
>> +
>> +static void *lru_gen_eviction(struct folio *folio)
>> +{
>> +    return NULL;
>> +}
>> +
>> +static void lru_gen_refault(struct folio *folio, void *shadow)
>> +{
>> +}
>> +
>> +#endif /* CONFIG_LRU_GEN */
>> +
>>   /**
>>    * workingset_age_nonresident - age non-resident entries as LRU ages
>>    * @lruvec: the lruvec that was aged
>> @@ -264,10 +360,14 @@ void *workingset_eviction(struct folio *folio, 
>> struct mem_cgroup *target_memcg)
>>       VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
>>       VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
>>   +    if (lru_gen_enabled())
>> +        return lru_gen_eviction(folio);
>> +
>>       lruvec = mem_cgroup_lruvec(target_memcg, pgdat);
>>       /* XXX: target_memcg can be NULL, go through lruvec */
>>       memcgid = mem_cgroup_id(lruvec_memcg(lruvec));
>>       eviction = atomic_long_read(&lruvec->nonresident_age);
>> +    eviction >>= bucket_order;
>>       workingset_age_nonresident(lruvec, folio_nr_pages(folio));
>>       return pack_shadow(memcgid, pgdat, eviction,
>>                   folio_test_workingset(folio));
>> @@ -298,7 +398,13 @@ void workingset_refault(struct folio *folio, 
>> void *shadow)
>>       int memcgid;
>>       long nr;
>>   +    if (lru_gen_enabled()) {
>> +        lru_gen_refault(folio, shadow);
>> +        return;
>> +    }
>> +
>>       unpack_shadow(shadow, &memcgid, &pgdat, &eviction, &workingset);
>> +    eviction <<= bucket_order;
>>         rcu_read_lock();
>>       /*
