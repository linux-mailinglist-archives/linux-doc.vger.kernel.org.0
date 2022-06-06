Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41B153E7F4
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jun 2022 19:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbiFFJZm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Jun 2022 05:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbiFFJZb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Jun 2022 05:25:31 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938F774DEE;
        Mon,  6 Jun 2022 02:25:27 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id n10so27741090ejk.5;
        Mon, 06 Jun 2022 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i1mxngnAs4MtbgmfR/46xvZmpYDQ630y/+HqgoBKHJ8=;
        b=CZYQHFJzwo8ztOWpYTDG7mIvFnoK+NLZicUKfv8w5lNhPaFhriYlbsPytC3/dGQsp6
         Wa9AlnFx/VRYr88yIkGdVLcZ6BrmVKCpo384B7QXy/c5RL/oTUP6m4yM6+DGk07N4X3E
         nqDPBrGXRNJ3ofsnhwVhqDACOB1qTnAGUxEiL7nXla/l+R/UE4kZE5I2Mxb/ZW7QMXTg
         g4Xq45NvLeoDpZHl+46NhLWAsup3QIS2fXLvQyOwa8Rxi6fe0IeR9x+nTk0diTz1GyON
         RFlNTHOTiUwx5rxGkzZFGevWcbLio6FjjX9DERxxTslezNoLSPjjhMrF8DgRZjEDy74c
         z05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i1mxngnAs4MtbgmfR/46xvZmpYDQ630y/+HqgoBKHJ8=;
        b=pQAFjAlsU5TryM9cTOq7kbMSFoRe6tq4xDU2jdU16BzZEOynFjNuAthgUVp2plajck
         WCIHghxS9c61IdV4fZGzj+UrfW1AVmXP2g1w4DQhTqss13rxlWGhfg+RQbNLauYcVh8e
         Z1X5aj7AVQYmVREt/Y+s3h8yBQNgFcrA7ITIok9ydK+/pSq72iin7xWW176QfWFwO2ZY
         v0AQnrU8XsP/cidpG5CQMZ/tf96uwK60i9JnxpcJGeUy0Er7ty+3G4y7fe8qJyOphKIl
         mHfm7sG1rtfo8YjOiQ63UR3XEL1x+p/bWp3R0E9lk/gw5F6Pqmo2PIO7dHL6OdYKy0LY
         qDrQ==
X-Gm-Message-State: AOAM531P9/I72V0Tt/GVPyIkytPsabOp2Z5/h5tZdMwrhzWkL84lwlcE
        MY/P7k0/eTUDCRMYtF+qlJwcQc2FL79szwu7mM0=
X-Google-Smtp-Source: ABdhPJyJ8uzC6J98hwH+cA6rusaWjzHn55kdlo6okLgMl/CjALi+htG51cb9MEr9eAAW0b9aXfIiDD/VuoIRSOukuUM=
X-Received: by 2002:a17:906:9b46:b0:711:1f7e:36f8 with SMTP id
 ep6-20020a1709069b4600b007111f7e36f8mr8760576ejc.746.1654507525623; Mon, 06
 Jun 2022 02:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220518014632.922072-1-yuzhao@google.com> <20220518014632.922072-8-yuzhao@google.com>
In-Reply-To: <20220518014632.922072-8-yuzhao@google.com>
From:   Barry Song <21cnbao@gmail.com>
Date:   Mon, 6 Jun 2022 21:25:14 +1200
Message-ID: <CAGsJ_4yboZEY9OfyujPxBa_AEuGM3OAq5y_L9gvzSMUv70BxeQ@mail.gmail.com>
Subject: Re: [PATCH v11 07/14] mm: multi-gen LRU: exploit locality in rmap
To:     Yu Zhao <yuzhao@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
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
        LAK <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, x86 <x86@kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 18, 2022 at 4:49 PM Yu Zhao <yuzhao@google.com> wrote:
>
> Searching the rmap for PTEs mapping each page on an LRU list (to test
> and clear the accessed bit) can be expensive because pages from
> different VMAs (PA space) are not cache friendly to the rmap (VA
> space). For workloads mostly using mapped pages, the rmap has a high
> CPU cost in the reclaim path.
>
> This patch exploits spatial locality to reduce the trips into the
> rmap. When shrink_page_list() walks the rmap and finds a young PTE, a
> new function lru_gen_look_around() scans at most BITS_PER_LONG-1
> adjacent PTEs. On finding another young PTE, it clears the accessed
> bit and updates the gen counter of the page mapped by this PTE to
> (max_seq%MAX_NR_GENS)+1.
>
> Server benchmark results:
>   Single workload:
>     fio (buffered I/O): no change
>
>   Single workload:
>     memcached (anon): +[5.5, 7.5]%
>                 Ops/sec      KB/sec
>       patch1-6: 1120643.70   43588.06
>       patch1-7: 1193918.93   46438.15
>
>   Configurations:
>     no change
>
> Client benchmark results:
>   kswapd profiles:
>     patch1-6
>       35.99%  lzo1x_1_do_compress (real work)
>       19.40%  page_vma_mapped_walk
>        6.31%  _raw_spin_unlock_irq
>        3.95%  do_raw_spin_lock
>        2.39%  anon_vma_interval_tree_iter_first
>        2.25%  ptep_clear_flush
>        1.92%  __anon_vma_interval_tree_subtree_search
>        1.70%  folio_referenced_one
>        1.68%  __zram_bvec_write
>        1.43%  anon_vma_interval_tree_iter_next
>
>     patch1-7
>       45.90%  lzo1x_1_do_compress (real work)
>        9.14%  page_vma_mapped_walk
>        6.81%  _raw_spin_unlock_irq
>        2.80%  ptep_clear_flush
>        2.34%  __zram_bvec_write
>        2.29%  do_raw_spin_lock
>        1.84%  lru_gen_look_around
>        1.78%  memmove
>        1.74%  obj_malloc
>        1.50%  free_unref_page_list
>
>   Configurations:
>     no change
>
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> Acked-by: Brian Geffon <bgeffon@google.com>
> Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Acked-by: Steven Barrett <steven@liquorix.net>
> Acked-by: Suleiman Souhlal <suleiman@google.com>
> Tested-by: Daniel Byrne <djbyrne@mtu.edu>
> Tested-by: Donald Carr <d@chaos-reins.com>
> Tested-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
> Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
> Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
> Tested-by: Sofia Trinh <sofia.trinh@edi.works>
> Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  include/linux/memcontrol.h |  31 ++++++++
>  include/linux/mm.h         |   5 ++
>  include/linux/mmzone.h     |   6 ++
>  mm/internal.h              |   1 +
>  mm/memcontrol.c            |   1 +
>  mm/rmap.c                  |   7 ++
>  mm/swap.c                  |   4 +-
>  mm/vmscan.c                | 157 +++++++++++++++++++++++++++++++++++++
>  8 files changed, 210 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index 89b14729d59f..2bfdcc77648a 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -438,6 +438,7 @@ static inline struct obj_cgroup *__folio_objcg(struct=
 folio *folio)
>   * - LRU isolation
>   * - lock_page_memcg()
>   * - exclusive reference
> + * - mem_cgroup_trylock_pages()
>   *
>   * For a kmem folio a caller should hold an rcu read lock to protect mem=
cg
>   * associated with a kmem folio from being released.
> @@ -499,6 +500,7 @@ static inline struct mem_cgroup *folio_memcg_rcu(stru=
ct folio *folio)
>   * - LRU isolation
>   * - lock_page_memcg()
>   * - exclusive reference
> + * - mem_cgroup_trylock_pages()
>   *
>   * For a kmem page a caller should hold an rcu read lock to protect memc=
g
>   * associated with a kmem page from being released.
> @@ -948,6 +950,23 @@ void unlock_page_memcg(struct page *page);
>
>  void __mod_memcg_state(struct mem_cgroup *memcg, int idx, int val);
>
> +/* try to stablize folio_memcg() for all the pages in a memcg */
> +static inline bool mem_cgroup_trylock_pages(struct mem_cgroup *memcg)
> +{
> +       rcu_read_lock();
> +
> +       if (mem_cgroup_disabled() || !atomic_read(&memcg->moving_account)=
)
> +               return true;
> +
> +       rcu_read_unlock();
> +       return false;
> +}
> +
> +static inline void mem_cgroup_unlock_pages(void)
> +{
> +       rcu_read_unlock();
> +}
> +
>  /* idx can be of type enum memcg_stat_item or node_stat_item */
>  static inline void mod_memcg_state(struct mem_cgroup *memcg,
>                                    int idx, int val)
> @@ -1386,6 +1405,18 @@ static inline void folio_memcg_unlock(struct folio=
 *folio)
>  {
>  }
>
> +static inline bool mem_cgroup_trylock_pages(struct mem_cgroup *memcg)
> +{
> +       /* to match folio_memcg_rcu() */
> +       rcu_read_lock();
> +       return true;
> +}
> +
> +static inline void mem_cgroup_unlock_pages(void)
> +{
> +       rcu_read_unlock();
> +}
> +
>  static inline void mem_cgroup_handle_over_high(void)
>  {
>  }
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 894c289c2c06..4e8ab4ad4473 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1523,6 +1523,11 @@ static inline unsigned long folio_pfn(struct folio=
 *folio)
>         return page_to_pfn(&folio->page);
>  }
>
> +static inline struct folio *pfn_folio(unsigned long pfn)
> +{
> +       return page_folio(pfn_to_page(pfn));
> +}
> +
>  static inline atomic_t *folio_pincount_ptr(struct folio *folio)
>  {
>         return &folio_page(folio, 1)->compound_pincount;
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 2d023d243e73..f0b980362186 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -374,6 +374,7 @@ enum lruvec_flags {
>  #ifndef __GENERATING_BOUNDS_H
>
>  struct lruvec;
> +struct page_vma_mapped_walk;
>
>  #define LRU_GEN_MASK           ((BIT(LRU_GEN_WIDTH) - 1) << LRU_GEN_PGOF=
F)
>  #define LRU_REFS_MASK          ((BIT(LRU_REFS_WIDTH) - 1) << LRU_REFS_PG=
OFF)
> @@ -429,6 +430,7 @@ struct lru_gen_struct {
>  };
>
>  void lru_gen_init_lruvec(struct lruvec *lruvec);
> +void lru_gen_look_around(struct page_vma_mapped_walk *pvmw);
>
>  #ifdef CONFIG_MEMCG
>  void lru_gen_init_memcg(struct mem_cgroup *memcg);
> @@ -441,6 +443,10 @@ static inline void lru_gen_init_lruvec(struct lruvec=
 *lruvec)
>  {
>  }
>
> +static inline void lru_gen_look_around(struct page_vma_mapped_walk *pvmw=
)
> +{
> +}
> +
>  #ifdef CONFIG_MEMCG
>  static inline void lru_gen_init_memcg(struct mem_cgroup *memcg)
>  {
> diff --git a/mm/internal.h b/mm/internal.h
> index cf16280ce132..59d2422b647d 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -68,6 +68,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf);
>  void folio_rotate_reclaimable(struct folio *folio);
>  bool __folio_end_writeback(struct folio *folio);
>  void deactivate_file_folio(struct folio *folio);
> +void folio_activate(struct folio *folio);
>
>  void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *start_=
vma,
>                 unsigned long floor, unsigned long ceiling);
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 2ee074f80e72..98aa720ac639 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2769,6 +2769,7 @@ static void commit_charge(struct folio *folio, stru=
ct mem_cgroup *memcg)
>          * - LRU isolation
>          * - lock_page_memcg()
>          * - exclusive reference
> +        * - mem_cgroup_trylock_pages()
>          */
>         folio->memcg_data =3D (unsigned long)memcg;
>  }
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fedb82371efe..7cb7ef29088a 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -73,6 +73,7 @@
>  #include <linux/page_idle.h>
>  #include <linux/memremap.h>
>  #include <linux/userfaultfd_k.h>
> +#include <linux/mm_inline.h>
>
>  #include <asm/tlbflush.h>
>
> @@ -821,6 +822,12 @@ static bool folio_referenced_one(struct folio *folio=
,
>                 }
>
>                 if (pvmw.pte) {
> +                       if (lru_gen_enabled() && pte_young(*pvmw.pte) &&
> +                           !(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ=
))) {
> +                               lru_gen_look_around(&pvmw);
> +                               referenced++;
> +                       }
> +
>                         if (ptep_clear_flush_young_notify(vma, address,

Hello, Yu.
look_around() is calling ptep_test_and_clear_young(pvmw->vma, addr, pte + i=
)
only without flush and notify. for flush, there is a tlb operation for arm6=
4:
static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
                                         unsigned long address, pte_t *ptep=
)
{
        int young =3D ptep_test_and_clear_young(vma, address, ptep);

        if (young) {
                /*
                 * We can elide the trailing DSB here since the worst that =
can
                 * happen is that a CPU continues to use the young entry in=
 its
                 * TLB and we mistakenly reclaim the associated page. The
                 * window for such an event is bounded by the next
                 * context-switch, which provides a DSB to complete the TLB
                 * invalidation.
                 */
                flush_tlb_page_nosync(vma, address);
        }

        return young;
}

Does it mean the current kernel is over cautious?  is it
safe to call ptep_test_and_clear_young() only?

btw, lru_gen_look_around() has already included 'address', are we doing
pte check for 'address' twice here?


>                                                 pvmw.pte)) {
>                                 /*
> diff --git a/mm/swap.c b/mm/swap.c
> index a99d22308f28..0aa1d0b33d42 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -342,7 +342,7 @@ static bool need_activate_page_drain(int cpu)
>         return pagevec_count(&per_cpu(lru_pvecs.activate_page, cpu)) !=3D=
 0;
>  }
>
> -static void folio_activate(struct folio *folio)
> +void folio_activate(struct folio *folio)
>  {
>         if (folio_test_lru(folio) && !folio_test_active(folio) &&
>             !folio_test_unevictable(folio)) {
> @@ -362,7 +362,7 @@ static inline void activate_page_drain(int cpu)
>  {
>  }
>
> -static void folio_activate(struct folio *folio)
> +void folio_activate(struct folio *folio)
>  {
>         struct lruvec *lruvec;
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 891f0ab69b3a..cf89a28c3b0e 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -1554,6 +1554,11 @@ static unsigned int shrink_page_list(struct list_h=
ead *page_list,
>                 if (!sc->may_unmap && page_mapped(page))
>                         goto keep_locked;
>
> +               /* folio_update_gen() tried to promote this page? */
> +               if (lru_gen_enabled() && !ignore_references &&
> +                   page_mapped(page) && PageReferenced(page))
> +                       goto keep_locked;
> +
>                 may_enter_fs =3D (sc->gfp_mask & __GFP_FS) ||
>                         (PageSwapCache(page) && (sc->gfp_mask & __GFP_IO)=
);
>
> @@ -3137,6 +3142,28 @@ static bool positive_ctrl_err(struct ctrl_pos *sp,=
 struct ctrl_pos *pv)
>   *                          the aging
>   ***********************************************************************=
*******/
>
> +static int folio_update_gen(struct folio *folio, int gen)
> +{
> +       unsigned long new_flags, old_flags =3D READ_ONCE(folio->flags);
> +
> +       VM_WARN_ON_ONCE(gen >=3D MAX_NR_GENS);
> +       VM_WARN_ON_ONCE(!rcu_read_lock_held());
> +
> +       do {
> +               /* lru_gen_del_folio() has isolated this page? */
> +               if (!(old_flags & LRU_GEN_MASK)) {
> +                       /* for shrink_page_list() */
> +                       new_flags =3D old_flags | BIT(PG_referenced);
> +                       continue;
> +               }
> +
> +               new_flags =3D old_flags & ~(LRU_GEN_MASK | LRU_REFS_MASK =
| LRU_REFS_FLAGS);
> +               new_flags |=3D (gen + 1UL) << LRU_GEN_PGOFF;
> +       } while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
> +
> +       return ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> +}
> +
>  static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio, boo=
l reclaiming)
>  {
>         int type =3D folio_is_file_lru(folio);
> @@ -3147,6 +3174,11 @@ static int folio_inc_gen(struct lruvec *lruvec, st=
ruct folio *folio, bool reclai
>         VM_WARN_ON_ONCE_FOLIO(!(old_flags & LRU_GEN_MASK), folio);
>
>         do {
> +               new_gen =3D ((old_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF)=
 - 1;
> +               /* folio_update_gen() has promoted this page? */
> +               if (new_gen >=3D 0 && new_gen !=3D old_gen)
> +                       return new_gen;
> +
>                 new_gen =3D (old_gen + 1) % MAX_NR_GENS;
>
>                 new_flags =3D old_flags & ~(LRU_GEN_MASK | LRU_REFS_MASK =
| LRU_REFS_FLAGS);
> @@ -3365,6 +3397,125 @@ static void lru_gen_age_node(struct pglist_data *=
pgdat, struct scan_control *sc)
>         } while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
>  }
>
> +/*
> + * This function exploits spatial locality when shrink_page_list() walks=
 the
> + * rmap. It scans the adjacent PTEs of a young PTE and promotes hot page=
s.
> + */
> +void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
> +{
> +       int i;
> +       pte_t *pte;
> +       unsigned long start;
> +       unsigned long end;
> +       unsigned long addr;
> +       unsigned long bitmap[BITS_TO_LONGS(MIN_LRU_BATCH)] =3D {};
> +       struct folio *folio =3D pfn_folio(pvmw->pfn);
> +       struct mem_cgroup *memcg =3D folio_memcg(folio);
> +       struct pglist_data *pgdat =3D folio_pgdat(folio);
> +       struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
> +       DEFINE_MAX_SEQ(lruvec);
> +       int old_gen, new_gen =3D lru_gen_from_seq(max_seq);
> +
> +       lockdep_assert_held(pvmw->ptl);
> +       VM_WARN_ON_ONCE_FOLIO(folio_test_lru(folio), folio);
> +
> +       if (spin_is_contended(pvmw->ptl))
> +               return;
> +
> +       start =3D max(pvmw->address & PMD_MASK, pvmw->vma->vm_start);
> +       end =3D pmd_addr_end(pvmw->address, pvmw->vma->vm_end);
> +
> +       if (end - start > MIN_LRU_BATCH * PAGE_SIZE) {
> +               if (pvmw->address - start < MIN_LRU_BATCH * PAGE_SIZE / 2=
)
> +                       end =3D start + MIN_LRU_BATCH * PAGE_SIZE;
> +               else if (end - pvmw->address < MIN_LRU_BATCH * PAGE_SIZE =
/ 2)
> +                       start =3D end - MIN_LRU_BATCH * PAGE_SIZE;
> +               else {
> +                       start =3D pvmw->address - MIN_LRU_BATCH * PAGE_SI=
ZE / 2;
> +                       end =3D pvmw->address + MIN_LRU_BATCH * PAGE_SIZE=
 / 2;
> +               }
> +       }
> +
> +       pte =3D pvmw->pte - (pvmw->address - start) / PAGE_SIZE;
> +
> +       rcu_read_lock();
> +       arch_enter_lazy_mmu_mode();
> +
> +       for (i =3D 0, addr =3D start; addr !=3D end; i++, addr +=3D PAGE_=
SIZE) {
> +               unsigned long pfn =3D pte_pfn(pte[i]);
> +
> +               VM_WARN_ON_ONCE(addr < pvmw->vma->vm_start || addr >=3D p=
vmw->vma->vm_end);
> +
> +               if (!pte_present(pte[i]) || is_zero_pfn(pfn))
> +                       continue;
> +
> +               if (WARN_ON_ONCE(pte_devmap(pte[i]) || pte_special(pte[i]=
)))
> +                       continue;
> +
> +               if (!pte_young(pte[i]))
> +                       continue;
> +
> +               VM_WARN_ON_ONCE(!pfn_valid(pfn));
> +               if (pfn < pgdat->node_start_pfn || pfn >=3D pgdat_end_pfn=
(pgdat))
> +                       continue;
> +
> +               folio =3D pfn_folio(pfn);
> +               if (folio_nid(folio) !=3D pgdat->node_id)
> +                       continue;
> +
> +               if (folio_memcg_rcu(folio) !=3D memcg)
> +                       continue;
> +
> +               if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
> +                       continue;
> +
> +               if (pte_dirty(pte[i]) && !folio_test_dirty(folio) &&
> +                   !(folio_test_anon(folio) && folio_test_swapbacked(fol=
io) &&
> +                     !folio_test_swapcache(folio)))
> +                       folio_mark_dirty(folio);
> +
> +               old_gen =3D folio_lru_gen(folio);
> +               if (old_gen < 0)
> +                       folio_set_referenced(folio);
> +               else if (old_gen !=3D new_gen)
> +                       __set_bit(i, bitmap);
> +       }
> +
> +       arch_leave_lazy_mmu_mode();
> +       rcu_read_unlock();
> +
> +       if (bitmap_weight(bitmap, MIN_LRU_BATCH) < PAGEVEC_SIZE) {
> +               for_each_set_bit(i, bitmap, MIN_LRU_BATCH) {
> +                       folio =3D pfn_folio(pte_pfn(pte[i]));
> +                       folio_activate(folio);
> +               }
> +               return;
> +       }
> +
> +       /* folio_update_gen() requires stable folio_memcg() */
> +       if (!mem_cgroup_trylock_pages(memcg))
> +               return;
> +
> +       spin_lock_irq(&lruvec->lru_lock);
> +       new_gen =3D lru_gen_from_seq(lruvec->lrugen.max_seq);
> +
> +       for_each_set_bit(i, bitmap, MIN_LRU_BATCH) {
> +               folio =3D pfn_folio(pte_pfn(pte[i]));
> +               if (folio_memcg_rcu(folio) !=3D memcg)
> +                       continue;
> +
> +               old_gen =3D folio_update_gen(folio, new_gen);
> +               if (old_gen < 0 || old_gen =3D=3D new_gen)
> +                       continue;
> +
> +               lru_gen_update_size(lruvec, folio, old_gen, new_gen);
> +       }
> +
> +       spin_unlock_irq(&lruvec->lru_lock);
> +
> +       mem_cgroup_unlock_pages();
> +}
> +
>  /***********************************************************************=
*******
>   *                          the eviction
>   ***********************************************************************=
*******/
> @@ -3401,6 +3552,12 @@ static bool sort_folio(struct lruvec *lruvec, stru=
ct folio *folio, int tier_idx)
>                 return true;
>         }
>
> +       /* promoted */
> +       if (gen !=3D lru_gen_from_seq(lrugen->min_seq[type])) {
> +               list_move(&folio->lru, &lrugen->lists[gen][type][zone]);
> +               return true;
> +       }
> +
>         /* protected */
>         if (tier > tier_idx) {
>                 int hist =3D lru_hist_from_seq(lrugen->min_seq[type]);
> --
> 2.36.0.550.gb090851708-goog
>

Thanks
Barry
