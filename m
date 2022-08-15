Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E004B592A30
	for <lists+linux-doc@lfdr.de>; Mon, 15 Aug 2022 09:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241463AbiHOHPF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Aug 2022 03:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbiHOHPD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Aug 2022 03:15:03 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEDE1C935
        for <linux-doc@vger.kernel.org>; Mon, 15 Aug 2022 00:14:23 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id l73-20020a25254c000000b006847d635098so4990164ybl.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Aug 2022 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc;
        bh=OG21aV95NWHOo7NMaXGtZDeDVd1PZFs7RFAu3qrJU9s=;
        b=WHe/o94b6sSWCNtVsvdXInF7Bs9OcbJU1dCj5DMXBNlfz6RhO+0CKOBLCNAPaeawPG
         psfFyfr3nAdZuKV9pWqSj24SWqUznqL4Tav55NsT9qgTWqeNVABTbOJnaZzcPELXEcB2
         GKWQqthHvAhQn69blnDjEgYv96hlJasH5D45Wq24AF+9WLmynB45huVm2am+fMtg5dZ2
         lhYGstyBsOHK7LAOQ1wnldaY0xWxOrEWRQQgjq9DlQ+T+z5wqRXFVhXMtMEO8ZHbrlVV
         AY5uxXmoml/qiGfZT1IhTHRzXxE/3uNBknjngm1EE+mdcivTWPERJ3sQpHNvGdadB3BW
         v4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc;
        bh=OG21aV95NWHOo7NMaXGtZDeDVd1PZFs7RFAu3qrJU9s=;
        b=BU+LWWC7YJLA5pg9Tb5HD4ie+YiNhHXTRzS8/wzogwWRqIT5zOMSzP6wUjpevOsn9W
         CKMUmKBm83KLuslXtTaHojGL0EQq55ydsuz+s5Ukr7Na9PozBhB30tkXpxHDmbMxhDQ3
         I2hOVIbfYkFlH5/NL6t2GNbN5PnyuZCh5VawaIrYvE8n/wV6GwuZ1lf5N0ZH8EH6TR3r
         haej92kPA7O6dz8MkMxwBOLkn3An4CbM3ypLUNFg243uhTx/DQmmKdvK3WntNxrMH2Tn
         eZIqK7bpvY57xZsedK98BA9ZZOtIoF2IbKW+uHCR7JmHuy3TxKoWU8tK0rSqOBQaWFD6
         5/3g==
X-Gm-Message-State: ACgBeo1Vq5o3u3yRehi9NWyESFXhk+8wlNd3Fy6HUihTtyjqU1jd3Rn/
        tGa2te87DsOhKHMQ26Uj8zStmKJmw/0=
X-Google-Smtp-Source: AA6agR7AzqnhxIvkLjTuH7X/p83y5zjJA+3i7KoHjwOuPi8aLZoBUFdTyHtN9BRaL1hIyv7TAKS5Egbks70=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:d91:5887:ac93:ddf0])
 (user=yuzhao job=sendgmr) by 2002:a25:424b:0:b0:687:5558:4e7b with SMTP id
 p72-20020a25424b000000b0068755584e7bmr4905422yba.434.1660547662335; Mon, 15
 Aug 2022 00:14:22 -0700 (PDT)
Date:   Mon, 15 Aug 2022 01:13:25 -0600
In-Reply-To: <20220815071332.627393-1-yuzhao@google.com>
Message-Id: <20220815071332.627393-7-yuzhao@google.com>
Mime-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v14 06/14] mm: multi-gen LRU: minimal implementation
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>
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
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        page-reclaim@google.com, Yu Zhao <yuzhao@google.com>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        "=?UTF-8?q?Holger=20Hoffst=C3=A4tte?=" 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To avoid confusion, the terms "promotion" and "demotion" will be
applied to the multi-gen LRU, as a new convention; the terms
"activation" and "deactivation" will be applied to the active/inactive
LRU, as usual.

The aging produces young generations. Given an lruvec, it increments
max_seq when max_seq-min_seq+1 approaches MIN_NR_GENS. The aging
promotes hot pages to the youngest generation when it finds them
accessed through page tables; the demotion of cold pages happens
consequently when it increments max_seq. Promotion in the aging path
does not involve any LRU list operations, only the updates of the gen
counter and lrugen->nr_pages[]; demotion, unless as the result of the
increment of max_seq, requires LRU list operations, e.g.,
lru_deactivate_fn(). The aging has the complexity O(nr_hot_pages),
since it is only interested in hot pages.

The eviction consumes old generations. Given an lruvec, it increments
min_seq when lrugen->lists[] indexed by min_seq%MAX_NR_GENS becomes
empty. A feedback loop modeled after the PID controller monitors
refaults over anon and file types and decides which type to evict when
both types are available from the same generation.

The protection of pages accessed multiple times through file
descriptors takes place in the eviction path. Each generation is
divided into multiple tiers. A page accessed N times through file
descriptors is in tier order_base_2(N). Tiers do not have dedicated
lrugen->lists[], only bits in folio->flags. The aforementioned
feedback loop also monitors refaults over all tiers and decides when
to protect pages in which tiers (N>1), using the first tier (N=3D0,1) as
a baseline. The first tier contains single-use unmapped clean pages,
which are most likely the best choices. In contrast to promotion in
the aging path, the protection of a page in the eviction path is
achieved by moving this page to the next generation, i.e., min_seq+1,
if the feedback loop decides so. This approach has the following
advantages:
1. It removes the cost of activation in the buffered access path by
   inferring whether pages accessed multiple times through file
   descriptors are statistically hot and thus worth protecting in the
   eviction path.
2. It takes pages accessed through page tables into account and avoids
   overprotecting pages accessed multiple times through file
   descriptors. (Pages accessed through page tables are in the first
   tier, since N=3D0.)
3. More tiers provide better protection for pages accessed more than
   twice through file descriptors, when under heavy buffered I/O
   workloads.

Server benchmark results:
  Single workload:
    fio (buffered I/O): +[30, 32]%
                IOPS         BW
      5.19-rc1: 2673k        10.2GiB/s
      patch1-6: 3491k        13.3GiB/s

  Single workload:
    memcached (anon): -[4, 6]%
                Ops/sec      KB/sec
      5.19-rc1: 1161501.04   45177.25
      patch1-6: 1106168.46   43025.04

  Configurations:
    CPU: two Xeon 6154
    Mem: total 256G

    Node 1 was only used as a ram disk to reduce the variance in the
    results.

    patch drivers/block/brd.c <<EOF
    99,100c99,100
    < 	gfp_flags =3D GFP_NOIO | __GFP_ZERO | __GFP_HIGHMEM;
    < 	page =3D alloc_page(gfp_flags);
    ---
    > 	gfp_flags =3D GFP_NOIO | __GFP_ZERO | __GFP_HIGHMEM | __GFP_THISNODE=
;
    > 	page =3D alloc_pages_node(1, gfp_flags, 0);
    EOF

    cat >>/etc/systemd/system.conf <<EOF
    CPUAffinity=3Dnuma
    NUMAPolicy=3Dbind
    NUMAMask=3D0
    EOF

    cat >>/etc/memcached.conf <<EOF
    -m 184320
    -s /var/run/memcached/memcached.sock
    -a 0766
    -t 36
    -B binary
    EOF

    cat fio.sh
    modprobe brd rd_nr=3D1 rd_size=3D113246208
    swapoff -a
    mkfs.ext4 /dev/ram0
    mount -t ext4 /dev/ram0 /mnt

    mkdir /sys/fs/cgroup/user.slice/test
    echo 38654705664 >/sys/fs/cgroup/user.slice/test/memory.max
    echo $$ >/sys/fs/cgroup/user.slice/test/cgroup.procs
    fio -name=3Dmglru --numjobs=3D72 --directory=3D/mnt --size=3D1408m \
      --buffered=3D1 --ioengine=3Dio_uring --iodepth=3D128 \
      --iodepth_batch_submit=3D32 --iodepth_batch_complete=3D32 \
      --rw=3Drandread --random_distribution=3Drandom --norandommap \
      --time_based --ramp_time=3D10m --runtime=3D5m --group_reporting

    cat memcached.sh
    modprobe brd rd_nr=3D1 rd_size=3D113246208
    swapoff -a
    mkswap /dev/ram0
    swapon /dev/ram0

    memtier_benchmark -S /var/run/memcached/memcached.sock \
      -P memcache_binary -n allkeys --key-minimum=3D1 \
      --key-maximum=3D65000000 --key-pattern=3DP:P -c 1 -t 36 \
      --ratio 1:0 --pipeline 8 -d 2000

    memtier_benchmark -S /var/run/memcached/memcached.sock \
      -P memcache_binary -n allkeys --key-minimum=3D1 \
      --key-maximum=3D65000000 --key-pattern=3DR:R -c 1 -t 36 \
      --ratio 0:1 --pipeline 8 --randomize --distinct-client-seed

Client benchmark results:
  kswapd profiles:
    5.19-rc1
      40.33%  page_vma_mapped_walk (overhead)
      21.80%  lzo1x_1_do_compress (real work)
       7.53%  do_raw_spin_lock
       3.95%  _raw_spin_unlock_irq
       2.52%  vma_interval_tree_iter_next
       2.37%  folio_referenced_one
       2.28%  vma_interval_tree_subtree_search
       1.97%  anon_vma_interval_tree_iter_first
       1.60%  ptep_clear_flush
       1.06%  __zram_bvec_write

    patch1-6
      39.03%  lzo1x_1_do_compress (real work)
      18.47%  page_vma_mapped_walk (overhead)
       6.74%  _raw_spin_unlock_irq
       3.97%  do_raw_spin_lock
       2.49%  ptep_clear_flush
       2.48%  anon_vma_interval_tree_iter_first
       1.92%  folio_referenced_one
       1.88%  __zram_bvec_write
       1.48%  memmove
       1.31%  vma_interval_tree_iter_next

  Configurations:
    CPU: single Snapdragon 7c
    Mem: total 4G

    Chrome OS MemoryPressure [1]

[1] https://chromium.googlesource.com/chromiumos/platform/tast-tests/

Signed-off-by: Yu Zhao <yuzhao@google.com>
Acked-by: Brian Geffon <bgeffon@google.com>
Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Acked-by: Steven Barrett <steven@liquorix.net>
Acked-by: Suleiman Souhlal <suleiman@google.com>
Tested-by: Daniel Byrne <djbyrne@mtu.edu>
Tested-by: Donald Carr <d@chaos-reins.com>
Tested-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
Tested-by: Sofia Trinh <sofia.trinh@edi.works>
Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 include/linux/mm_inline.h         |  36 ++
 include/linux/mmzone.h            |  41 ++
 include/linux/page-flags-layout.h |   5 +-
 kernel/bounds.c                   |   2 +
 mm/Kconfig                        |  11 +
 mm/swap.c                         |  39 ++
 mm/vmscan.c                       | 815 +++++++++++++++++++++++++++++-
 mm/workingset.c                   | 110 +++-
 8 files changed, 1049 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 2ff703900fd0..f2b2296a42f9 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -121,6 +121,33 @@ static inline int lru_gen_from_seq(unsigned long seq)
 	return seq % MAX_NR_GENS;
 }
=20
+static inline int lru_hist_from_seq(unsigned long seq)
+{
+	return seq % NR_HIST_GENS;
+}
+
+static inline int lru_tier_from_refs(int refs)
+{
+	VM_WARN_ON_ONCE(refs > BIT(LRU_REFS_WIDTH));
+
+	/* see the comment in folio_lru_refs() */
+	return order_base_2(refs + 1);
+}
+
+static inline int folio_lru_refs(struct folio *folio)
+{
+	unsigned long flags =3D READ_ONCE(folio->flags);
+	bool workingset =3D flags & BIT(PG_workingset);
+
+	/*
+	 * Return the number of accesses beyond PG_referenced, i.e., N-1 if the
+	 * total number of accesses is N>1, since N=3D0,1 both map to the first
+	 * tier. lru_tier_from_refs() will account for this off-by-one. Also see
+	 * the comment on MAX_NR_TIERS.
+	 */
+	return ((flags & LRU_REFS_MASK) >> LRU_REFS_PGOFF) + workingset;
+}
+
 static inline int folio_lru_gen(struct folio *folio)
 {
 	unsigned long flags =3D READ_ONCE(folio->flags);
@@ -173,6 +200,15 @@ static inline void lru_gen_update_size(struct lruvec *=
lruvec, struct folio *foli
 		__update_lru_size(lruvec, lru, zone, -delta);
 		return;
 	}
+
+	/* promotion */
+	if (!lru_gen_is_active(lruvec, old_gen) && lru_gen_is_active(lruvec, new_=
gen)) {
+		__update_lru_size(lruvec, lru, zone, -delta);
+		__update_lru_size(lruvec, lru + LRU_ACTIVE, zone, delta);
+	}
+
+	/* demotion requires isolation, e.g., lru_deactivate_fn() */
+	VM_WARN_ON_ONCE(lru_gen_is_active(lruvec, old_gen) && !lru_gen_is_active(=
lruvec, new_gen));
 }
=20
 static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *=
folio, bool reclaiming)
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 86147f04bf76..019d7c8ee834 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -350,6 +350,28 @@ enum lruvec_flags {
 #define MIN_NR_GENS		2U
 #define MAX_NR_GENS		4U
=20
+/*
+ * Each generation is divided into multiple tiers. A page accessed N times
+ * through file descriptors is in tier order_base_2(N). A page in the firs=
t tier
+ * (N=3D0,1) is marked by PG_referenced unless it was faulted in through p=
age
+ * tables or read ahead. A page in any other tier (N>1) is marked by
+ * PG_referenced and PG_workingset. This implies a minimum of two tiers is
+ * supported without using additional bits in folio->flags.
+ *
+ * In contrast to moving across generations which requires the LRU lock, m=
oving
+ * across tiers only involves atomic operations on folio->flags and theref=
ore
+ * has a negligible cost in the buffered access path. In the eviction path=
,
+ * comparisons of refaulted/(evicted+protected) from the first tier and th=
e
+ * rest infer whether pages accessed multiple times through file descripto=
rs
+ * are statistically hot and thus worth protecting.
+ *
+ * MAX_NR_TIERS is set to 4 so that the multi-gen LRU can support twice th=
e
+ * number of categories of the active/inactive LRU when keeping track of
+ * accesses through file descriptors. This uses MAX_NR_TIERS-2 spare bits =
in
+ * folio->flags.
+ */
+#define MAX_NR_TIERS		4U
+
 #ifndef __GENERATING_BOUNDS_H
=20
 struct lruvec;
@@ -364,6 +386,16 @@ enum {
 	LRU_GEN_FILE,
 };
=20
+#define MIN_LRU_BATCH		BITS_PER_LONG
+#define MAX_LRU_BATCH		(MIN_LRU_BATCH * 128)
+
+/* whether to keep historical stats from evicted generations */
+#ifdef CONFIG_LRU_GEN_STATS
+#define NR_HIST_GENS		MAX_NR_GENS
+#else
+#define NR_HIST_GENS		1U
+#endif
+
 /*
  * The youngest generation number is stored in max_seq for both anon and f=
ile
  * types as they are aged on an equal footing. The oldest generation numbe=
rs are
@@ -386,6 +418,15 @@ struct lru_gen_struct {
 	struct list_head lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
 	/* the multi-gen LRU sizes, eventually consistent */
 	long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
+	/* the exponential moving average of refaulted */
+	unsigned long avg_refaulted[ANON_AND_FILE][MAX_NR_TIERS];
+	/* the exponential moving average of evicted+protected */
+	unsigned long avg_total[ANON_AND_FILE][MAX_NR_TIERS];
+	/* the first tier doesn't need protection, hence the minus one */
+	unsigned long protected[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS - 1];
+	/* can be modified without holding the LRU lock */
+	atomic_long_t evicted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
+	atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
 };
=20
 void lru_gen_init_lruvec(struct lruvec *lruvec);
diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-l=
ayout.h
index 240905407a18..7d79818dc065 100644
--- a/include/linux/page-flags-layout.h
+++ b/include/linux/page-flags-layout.h
@@ -106,7 +106,10 @@
 #error "Not enough bits in page flags"
 #endif
=20
-#define LRU_REFS_WIDTH	0
+/* see the comment on MAX_NR_TIERS */
+#define LRU_REFS_WIDTH	min(__LRU_REFS_WIDTH, BITS_PER_LONG - NR_PAGEFLAGS =
- \
+			    ZONES_WIDTH - LRU_GEN_WIDTH - SECTIONS_WIDTH - \
+			    NODES_WIDTH - KASAN_TAG_WIDTH - LAST_CPUPID_WIDTH)
=20
 #endif
 #endif /* _LINUX_PAGE_FLAGS_LAYOUT */
diff --git a/kernel/bounds.c b/kernel/bounds.c
index 5ee60777d8e4..b529182e8b04 100644
--- a/kernel/bounds.c
+++ b/kernel/bounds.c
@@ -24,8 +24,10 @@ int main(void)
 	DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
 #ifdef CONFIG_LRU_GEN
 	DEFINE(LRU_GEN_WIDTH, order_base_2(MAX_NR_GENS + 1));
+	DEFINE(__LRU_REFS_WIDTH, MAX_NR_TIERS - 2);
 #else
 	DEFINE(LRU_GEN_WIDTH, 0);
+	DEFINE(__LRU_REFS_WIDTH, 0);
 #endif
 	/* End of constants */
=20
diff --git a/mm/Kconfig b/mm/Kconfig
index d95f07cd6dcf..5101dca8f21c 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1124,6 +1124,7 @@ config PTE_MARKER_UFFD_WP
 	  purposes.  It is required to enable userfaultfd write protection on
 	  file-backed memory types like shmem and hugetlbfs.
=20
+# multi-gen LRU {
 config LRU_GEN
 	bool "Multi-Gen LRU"
 	depends on MMU
@@ -1132,6 +1133,16 @@ config LRU_GEN
 	help
 	  A high performance LRU implementation to overcommit memory.
=20
+config LRU_GEN_STATS
+	bool "Full stats for debugging"
+	depends on LRU_GEN
+	help
+	  Do not enable this option unless you plan to look at historical stats
+	  from evicted generations for debugging purpose.
+
+	  This option has a per-memcg and per-node memory overhead.
+# }
+
 source "mm/damon/Kconfig"
=20
 endmenu
diff --git a/mm/swap.c b/mm/swap.c
index 0e423b7d458b..f74fd51fa9e1 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -428,6 +428,40 @@ static void __lru_cache_activate_folio(struct folio *f=
olio)
 	local_unlock(&cpu_fbatches.lock);
 }
=20
+#ifdef CONFIG_LRU_GEN
+static void folio_inc_refs(struct folio *folio)
+{
+	unsigned long new_flags, old_flags =3D READ_ONCE(folio->flags);
+
+	if (folio_test_unevictable(folio))
+		return;
+
+	if (!folio_test_referenced(folio)) {
+		folio_set_referenced(folio);
+		return;
+	}
+
+	if (!folio_test_workingset(folio)) {
+		folio_set_workingset(folio);
+		return;
+	}
+
+	/* see the comment on MAX_NR_TIERS */
+	do {
+		new_flags =3D old_flags & LRU_REFS_MASK;
+		if (new_flags =3D=3D LRU_REFS_MASK)
+			break;
+
+		new_flags +=3D BIT(LRU_REFS_PGOFF);
+		new_flags |=3D old_flags & ~LRU_REFS_MASK;
+	} while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
+}
+#else
+static void folio_inc_refs(struct folio *folio)
+{
+}
+#endif /* CONFIG_LRU_GEN */
+
 /*
  * Mark a page as having seen activity.
  *
@@ -440,6 +474,11 @@ static void __lru_cache_activate_folio(struct folio *f=
olio)
  */
 void folio_mark_accessed(struct folio *folio)
 {
+	if (lru_gen_enabled()) {
+		folio_inc_refs(folio);
+		return;
+	}
+
 	if (!folio_test_referenced(folio)) {
 		folio_set_referenced(folio);
 	} else if (folio_test_unevictable(folio)) {
diff --git a/mm/vmscan.c b/mm/vmscan.c
index ed9e149b13c3..4c57fb749a74 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -1334,9 +1334,11 @@ static int __remove_mapping(struct address_space *ma=
pping, struct folio *folio,
=20
 	if (folio_test_swapcache(folio)) {
 		swp_entry_t swap =3D folio_swap_entry(folio);
-		mem_cgroup_swapout(folio, swap);
+
+		/* get a shadow entry before mem_cgroup_swapout() clears folio_memcg() *=
/
 		if (reclaimed && !mapping_exiting(mapping))
 			shadow =3D workingset_eviction(folio, target_memcg);
+		mem_cgroup_swapout(folio, swap);
 		__delete_from_swap_cache(folio, swap, shadow);
 		xa_unlock_irq(&mapping->i_pages);
 		put_swap_page(&folio->page, swap);
@@ -2733,6 +2735,9 @@ static void prepare_scan_count(pg_data_t *pgdat, stru=
ct scan_control *sc)
 	unsigned long file;
 	struct lruvec *target_lruvec;
=20
+	if (lru_gen_enabled())
+		return;
+
 	target_lruvec =3D mem_cgroup_lruvec(sc->target_mem_cgroup, pgdat);
=20
 	/*
@@ -3056,6 +3061,17 @@ static bool can_age_anon_pages(struct pglist_data *p=
gdat,
  *                          shorthand helpers
  *************************************************************************=
*****/
=20
+#define LRU_REFS_FLAGS	(BIT(PG_referenced) | BIT(PG_workingset))
+
+#define DEFINE_MAX_SEQ(lruvec)						\
+	unsigned long max_seq =3D READ_ONCE((lruvec)->lrugen.max_seq)
+
+#define DEFINE_MIN_SEQ(lruvec)						\
+	unsigned long min_seq[ANON_AND_FILE] =3D {			\
+		READ_ONCE((lruvec)->lrugen.min_seq[LRU_GEN_ANON]),	\
+		READ_ONCE((lruvec)->lrugen.min_seq[LRU_GEN_FILE]),	\
+	}
+
 #define for_each_gen_type_zone(gen, type, zone)				\
 	for ((gen) =3D 0; (gen) < MAX_NR_GENS; (gen)++)			\
 		for ((type) =3D 0; (type) < ANON_AND_FILE; (type)++)	\
@@ -3081,6 +3097,769 @@ static struct lruvec __maybe_unused *get_lruvec(str=
uct mem_cgroup *memcg, int ni
 	return pgdat ? &pgdat->__lruvec : NULL;
 }
=20
+static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
+{
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
+
+	if (!can_demote(pgdat->node_id, sc) &&
+	    mem_cgroup_get_nr_swap_pages(memcg) < MIN_LRU_BATCH)
+		return 0;
+
+	return mem_cgroup_swappiness(memcg);
+}
+
+static int get_nr_gens(struct lruvec *lruvec, int type)
+{
+	return lruvec->lrugen.max_seq - lruvec->lrugen.min_seq[type] + 1;
+}
+
+static bool __maybe_unused seq_is_valid(struct lruvec *lruvec)
+{
+	/* see the comment on lru_gen_struct */
+	return get_nr_gens(lruvec, LRU_GEN_FILE) >=3D MIN_NR_GENS &&
+	       get_nr_gens(lruvec, LRU_GEN_FILE) <=3D get_nr_gens(lruvec, LRU_GEN=
_ANON) &&
+	       get_nr_gens(lruvec, LRU_GEN_ANON) <=3D MAX_NR_GENS;
+}
+
+/*************************************************************************=
*****
+ *                          refault feedback loop
+ *************************************************************************=
*****/
+
+/*
+ * A feedback loop based on Proportional-Integral-Derivative (PID) control=
ler.
+ *
+ * The P term is refaulted/(evicted+protected) from a tier in the generati=
on
+ * currently being evicted; the I term is the exponential moving average o=
f the
+ * P term over the generations previously evicted, using the smoothing fac=
tor
+ * 1/2; the D term isn't supported.
+ *
+ * The setpoint (SP) is always the first tier of one type; the process var=
iable
+ * (PV) is either any tier of the other type or any other tier of the same
+ * type.
+ *
+ * The error is the difference between the SP and the PV; the correction i=
s to
+ * turn off protection when SP>PV or turn on protection when SP<PV.
+ *
+ * For future optimizations:
+ * 1. The D term may discount the other two terms over time so that long-l=
ived
+ *    generations can resist stale information.
+ */
+struct ctrl_pos {
+	unsigned long refaulted;
+	unsigned long total;
+	int gain;
+};
+
+static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier, int g=
ain,
+			  struct ctrl_pos *pos)
+{
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+	int hist =3D lru_hist_from_seq(lrugen->min_seq[type]);
+
+	pos->refaulted =3D lrugen->avg_refaulted[type][tier] +
+			 atomic_long_read(&lrugen->refaulted[hist][type][tier]);
+	pos->total =3D lrugen->avg_total[type][tier] +
+		     atomic_long_read(&lrugen->evicted[hist][type][tier]);
+	if (tier)
+		pos->total +=3D lrugen->protected[hist][type][tier - 1];
+	pos->gain =3D gain;
+}
+
+static void reset_ctrl_pos(struct lruvec *lruvec, int type, bool carryover=
)
+{
+	int hist, tier;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+	bool clear =3D carryover ? NR_HIST_GENS =3D=3D 1 : NR_HIST_GENS > 1;
+	unsigned long seq =3D carryover ? lrugen->min_seq[type] : lrugen->max_seq=
 + 1;
+
+	lockdep_assert_held(&lruvec->lru_lock);
+
+	if (!carryover && !clear)
+		return;
+
+	hist =3D lru_hist_from_seq(seq);
+
+	for (tier =3D 0; tier < MAX_NR_TIERS; tier++) {
+		if (carryover) {
+			unsigned long sum;
+
+			sum =3D lrugen->avg_refaulted[type][tier] +
+			      atomic_long_read(&lrugen->refaulted[hist][type][tier]);
+			WRITE_ONCE(lrugen->avg_refaulted[type][tier], sum / 2);
+
+			sum =3D lrugen->avg_total[type][tier] +
+			      atomic_long_read(&lrugen->evicted[hist][type][tier]);
+			if (tier)
+				sum +=3D lrugen->protected[hist][type][tier - 1];
+			WRITE_ONCE(lrugen->avg_total[type][tier], sum / 2);
+		}
+
+		if (clear) {
+			atomic_long_set(&lrugen->refaulted[hist][type][tier], 0);
+			atomic_long_set(&lrugen->evicted[hist][type][tier], 0);
+			if (tier)
+				WRITE_ONCE(lrugen->protected[hist][type][tier - 1], 0);
+		}
+	}
+}
+
+static bool positive_ctrl_err(struct ctrl_pos *sp, struct ctrl_pos *pv)
+{
+	/*
+	 * Return true if the PV has a limited number of refaults or a lower
+	 * refaulted/total than the SP.
+	 */
+	return pv->refaulted < MIN_LRU_BATCH ||
+	       pv->refaulted * (sp->total + MIN_LRU_BATCH) * sp->gain <=3D
+	       (sp->refaulted + 1) * pv->total * pv->gain;
+}
+
+/*************************************************************************=
*****
+ *                          the aging
+ *************************************************************************=
*****/
+
+/* protect pages accessed multiple times through file descriptors */
+static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio, bool =
reclaiming)
+{
+	int type =3D folio_is_file_lru(folio);
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+	int new_gen, old_gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
+	unsigned long new_flags, old_flags =3D READ_ONCE(folio->flags);
+
+	VM_WARN_ON_ONCE_FOLIO(!(old_flags & LRU_GEN_MASK), folio);
+
+	do {
+		new_gen =3D (old_gen + 1) % MAX_NR_GENS;
+
+		new_flags =3D old_flags & ~(LRU_GEN_MASK | LRU_REFS_MASK | LRU_REFS_FLAG=
S);
+		new_flags |=3D (new_gen + 1UL) << LRU_GEN_PGOFF;
+		/* for folio_end_writeback() */
+		if (reclaiming)
+			new_flags |=3D BIT(PG_reclaim);
+	} while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
+
+	lru_gen_update_size(lruvec, folio, old_gen, new_gen);
+
+	return new_gen;
+}
+
+static void inc_min_seq(struct lruvec *lruvec, int type)
+{
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	reset_ctrl_pos(lruvec, type, true);
+	WRITE_ONCE(lrugen->min_seq[type], lrugen->min_seq[type] + 1);
+}
+
+static bool try_to_inc_min_seq(struct lruvec *lruvec, bool can_swap)
+{
+	int gen, type, zone;
+	bool success =3D false;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+	DEFINE_MIN_SEQ(lruvec);
+
+	VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
+
+	/* find the oldest populated generation */
+	for (type =3D !can_swap; type < ANON_AND_FILE; type++) {
+		while (min_seq[type] + MIN_NR_GENS <=3D lrugen->max_seq) {
+			gen =3D lru_gen_from_seq(min_seq[type]);
+
+			for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
+				if (!list_empty(&lrugen->lists[gen][type][zone]))
+					goto next;
+			}
+
+			min_seq[type]++;
+		}
+next:
+		;
+	}
+
+	/* see the comment on lru_gen_struct */
+	if (can_swap) {
+		min_seq[LRU_GEN_ANON] =3D min(min_seq[LRU_GEN_ANON], min_seq[LRU_GEN_FIL=
E]);
+		min_seq[LRU_GEN_FILE] =3D max(min_seq[LRU_GEN_ANON], lrugen->min_seq[LRU=
_GEN_FILE]);
+	}
+
+	for (type =3D !can_swap; type < ANON_AND_FILE; type++) {
+		if (min_seq[type] =3D=3D lrugen->min_seq[type])
+			continue;
+
+		reset_ctrl_pos(lruvec, type, true);
+		WRITE_ONCE(lrugen->min_seq[type], min_seq[type]);
+		success =3D true;
+	}
+
+	return success;
+}
+
+static void inc_max_seq(struct lruvec *lruvec, unsigned long max_seq, bool=
 can_swap)
+{
+	int prev, next;
+	int type, zone;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	spin_lock_irq(&lruvec->lru_lock);
+
+	VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
+
+	if (max_seq !=3D lrugen->max_seq)
+		goto unlock;
+
+	for (type =3D 0; type < ANON_AND_FILE; type++) {
+		if (get_nr_gens(lruvec, type) !=3D MAX_NR_GENS)
+			continue;
+
+		VM_WARN_ON_ONCE(type =3D=3D LRU_GEN_FILE || can_swap);
+
+		inc_min_seq(lruvec, type);
+	}
+
+	/*
+	 * Update the active/inactive LRU sizes for compatibility. Both sides of
+	 * the current max_seq need to be covered, since max_seq+1 can overlap
+	 * with min_seq[LRU_GEN_ANON] if swapping is constrained. And if they do
+	 * overlap, cold/hot inversion happens.
+	 */
+	prev =3D lru_gen_from_seq(lrugen->max_seq - 1);
+	next =3D lru_gen_from_seq(lrugen->max_seq + 1);
+
+	for (type =3D 0; type < ANON_AND_FILE; type++) {
+		for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
+			enum lru_list lru =3D type * LRU_INACTIVE_FILE;
+			long delta =3D lrugen->nr_pages[prev][type][zone] -
+				     lrugen->nr_pages[next][type][zone];
+
+			if (!delta)
+				continue;
+
+			__update_lru_size(lruvec, lru, zone, delta);
+			__update_lru_size(lruvec, lru + LRU_ACTIVE, zone, -delta);
+		}
+	}
+
+	for (type =3D 0; type < ANON_AND_FILE; type++)
+		reset_ctrl_pos(lruvec, type, false);
+
+	/* make sure preceding modifications appear */
+	smp_store_release(&lrugen->max_seq, lrugen->max_seq + 1);
+unlock:
+	spin_unlock_irq(&lruvec->lru_lock);
+}
+
+static unsigned long get_nr_evictable(struct lruvec *lruvec, unsigned long=
 max_seq,
+				      unsigned long *min_seq, bool can_swap, bool *need_aging)
+{
+	int gen, type, zone;
+	unsigned long old =3D 0;
+	unsigned long young =3D 0;
+	unsigned long total =3D 0;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	for (type =3D !can_swap; type < ANON_AND_FILE; type++) {
+		unsigned long seq;
+
+		for (seq =3D min_seq[type]; seq <=3D max_seq; seq++) {
+			unsigned long size =3D 0;
+
+			gen =3D lru_gen_from_seq(seq);
+
+			for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
+				size +=3D max(READ_ONCE(lrugen->nr_pages[gen][type][zone]), 0L);
+
+			total +=3D size;
+			if (seq =3D=3D max_seq)
+				young +=3D size;
+			if (seq + MIN_NR_GENS =3D=3D max_seq)
+				old +=3D size;
+		}
+	}
+
+	/*
+	 * The aging tries to be lazy to reduce the overhead. On the other hand,
+	 * the eviction stalls when the number of generations reaches
+	 * MIN_NR_GENS. So ideally, there should be MIN_NR_GENS+1 generations,
+	 * hence the first two if's.
+	 *
+	 * Also it's ideal to spread pages out evenly, meaning 1/(MIN_NR_GENS+1)
+	 * of the total number of pages for each generation. A reasonable range
+	 * for this average portion is [1/MIN_NR_GENS, 1/(MIN_NR_GENS+2)]. The
+	 * eviction cares about the lower bound of cold pages, whereas the aging
+	 * cares about the upper bound of hot pages.
+	 */
+	if (min_seq[!can_swap] + MIN_NR_GENS > max_seq)
+		*need_aging =3D true;
+	else if (min_seq[!can_swap] + MIN_NR_GENS < max_seq)
+		*need_aging =3D false;
+	else if (young * MIN_NR_GENS > total)
+		*need_aging =3D true;
+	else if (old * (MIN_NR_GENS + 2) < total)
+		*need_aging =3D true;
+	else
+		*need_aging =3D false;
+
+	return total;
+}
+
+static void age_lruvec(struct lruvec *lruvec, struct scan_control *sc)
+{
+	bool need_aging;
+	unsigned long nr_to_scan;
+	int swappiness =3D get_swappiness(lruvec, sc);
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+	DEFINE_MAX_SEQ(lruvec);
+	DEFINE_MIN_SEQ(lruvec);
+
+	VM_WARN_ON_ONCE(sc->memcg_low_reclaim);
+
+	mem_cgroup_calculate_protection(NULL, memcg);
+
+	if (mem_cgroup_below_min(memcg))
+		return;
+
+	nr_to_scan =3D get_nr_evictable(lruvec, max_seq, min_seq, swappiness, &ne=
ed_aging);
+	if (!nr_to_scan)
+		return;
+
+	nr_to_scan >>=3D mem_cgroup_online(memcg) ? sc->priority : 0;
+
+	if (nr_to_scan && need_aging)
+		inc_max_seq(lruvec, max_seq, swappiness);
+}
+
+static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_contro=
l *sc)
+{
+	struct mem_cgroup *memcg;
+
+	VM_WARN_ON_ONCE(!current_is_kswapd());
+
+	memcg =3D mem_cgroup_iter(NULL, NULL, NULL);
+	do {
+		struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
+
+		age_lruvec(lruvec, sc);
+
+		cond_resched();
+	} while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
+}
+
+/*************************************************************************=
*****
+ *                          the eviction
+ *************************************************************************=
*****/
+
+static bool sort_folio(struct lruvec *lruvec, struct folio *folio, int tie=
r_idx)
+{
+	bool success;
+	int gen =3D folio_lru_gen(folio);
+	int type =3D folio_is_file_lru(folio);
+	int zone =3D folio_zonenum(folio);
+	int delta =3D folio_nr_pages(folio);
+	int refs =3D folio_lru_refs(folio);
+	int tier =3D lru_tier_from_refs(refs);
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	VM_WARN_ON_ONCE_FOLIO(gen >=3D MAX_NR_GENS, folio);
+
+	/* unevictable */
+	if (!folio_evictable(folio)) {
+		success =3D lru_gen_del_folio(lruvec, folio, true);
+		VM_WARN_ON_ONCE_FOLIO(!success, folio);
+		folio_set_unevictable(folio);
+		lruvec_add_folio(lruvec, folio);
+		__count_vm_events(UNEVICTABLE_PGCULLED, delta);
+		return true;
+	}
+
+	/* dirty lazyfree */
+	if (type =3D=3D LRU_GEN_FILE && folio_test_anon(folio) && folio_test_dirt=
y(folio)) {
+		success =3D lru_gen_del_folio(lruvec, folio, true);
+		VM_WARN_ON_ONCE_FOLIO(!success, folio);
+		folio_set_swapbacked(folio);
+		lruvec_add_folio_tail(lruvec, folio);
+		return true;
+	}
+
+	/* protected */
+	if (tier > tier_idx) {
+		int hist =3D lru_hist_from_seq(lrugen->min_seq[type]);
+
+		gen =3D folio_inc_gen(lruvec, folio, false);
+		list_move_tail(&folio->lru, &lrugen->lists[gen][type][zone]);
+
+		WRITE_ONCE(lrugen->protected[hist][type][tier - 1],
+			   lrugen->protected[hist][type][tier - 1] + delta);
+		__mod_lruvec_state(lruvec, WORKINGSET_ACTIVATE_BASE + type, delta);
+		return true;
+	}
+
+	/* waiting for writeback */
+	if (folio_test_locked(folio) || folio_test_writeback(folio) ||
+	    (type =3D=3D LRU_GEN_FILE && folio_test_dirty(folio))) {
+		gen =3D folio_inc_gen(lruvec, folio, true);
+		list_move(&folio->lru, &lrugen->lists[gen][type][zone]);
+		return true;
+	}
+
+	return false;
+}
+
+static bool isolate_folio(struct lruvec *lruvec, struct folio *folio, stru=
ct scan_control *sc)
+{
+	bool success;
+
+	/* unmapping inhibited */
+	if (!sc->may_unmap && folio_mapped(folio))
+		return false;
+
+	/* swapping inhibited */
+	if (!(sc->may_writepage && (sc->gfp_mask & __GFP_IO)) &&
+	    (folio_test_dirty(folio) ||
+	     (folio_test_anon(folio) && !folio_test_swapcache(folio))))
+		return false;
+
+	/* raced with release_pages() */
+	if (!folio_try_get(folio))
+		return false;
+
+	/* raced with another isolation */
+	if (!folio_test_clear_lru(folio)) {
+		folio_put(folio);
+		return false;
+	}
+
+	/* see the comment on MAX_NR_TIERS */
+	if (!folio_test_referenced(folio))
+		set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS, 0);
+
+	/* for shrink_page_list() */
+	folio_clear_reclaim(folio);
+	folio_clear_referenced(folio);
+
+	success =3D lru_gen_del_folio(lruvec, folio, true);
+	VM_WARN_ON_ONCE_FOLIO(!success, folio);
+
+	return true;
+}
+
+static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
+		       int type, int tier, struct list_head *list)
+{
+	int gen, zone;
+	enum vm_event_item item;
+	int sorted =3D 0;
+	int scanned =3D 0;
+	int isolated =3D 0;
+	int remaining =3D MAX_LRU_BATCH;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+
+	VM_WARN_ON_ONCE(!list_empty(list));
+
+	if (get_nr_gens(lruvec, type) =3D=3D MIN_NR_GENS)
+		return 0;
+
+	gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
+
+	for (zone =3D sc->reclaim_idx; zone >=3D 0; zone--) {
+		LIST_HEAD(moved);
+		int skipped =3D 0;
+		struct list_head *head =3D &lrugen->lists[gen][type][zone];
+
+		while (!list_empty(head)) {
+			struct folio *folio =3D lru_to_folio(head);
+			int delta =3D folio_nr_pages(folio);
+
+			VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
+			VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
+			VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) !=3D type, folio);
+			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) !=3D zone, folio);
+
+			scanned +=3D delta;
+
+			if (sort_folio(lruvec, folio, tier))
+				sorted +=3D delta;
+			else if (isolate_folio(lruvec, folio, sc)) {
+				list_add(&folio->lru, list);
+				isolated +=3D delta;
+			} else {
+				list_move(&folio->lru, &moved);
+				skipped +=3D delta;
+			}
+
+			if (!--remaining || max(isolated, skipped) >=3D MIN_LRU_BATCH)
+				break;
+		}
+
+		if (skipped) {
+			list_splice(&moved, head);
+			__count_zid_vm_events(PGSCAN_SKIP, zone, skipped);
+		}
+
+		if (!remaining || isolated >=3D MIN_LRU_BATCH)
+			break;
+	}
+
+	item =3D current_is_kswapd() ? PGSCAN_KSWAPD : PGSCAN_DIRECT;
+	if (!cgroup_reclaim(sc)) {
+		__count_vm_events(item, isolated);
+		__count_vm_events(PGREFILL, sorted);
+	}
+	__count_memcg_events(memcg, item, isolated);
+	__count_memcg_events(memcg, PGREFILL, sorted);
+	__count_vm_events(PGSCAN_ANON + type, isolated);
+
+	/*
+	 * There might not be eligible pages due to reclaim_idx, may_unmap and
+	 * may_writepage. Check the remaining to prevent livelock if it's not
+	 * making progress.
+	 */
+	return isolated || !remaining ? scanned : 0;
+}
+
+static int get_tier_idx(struct lruvec *lruvec, int type)
+{
+	int tier;
+	struct ctrl_pos sp, pv;
+
+	/*
+	 * To leave a margin for fluctuations, use a larger gain factor (1:2).
+	 * This value is chosen because any other tier would have at least twice
+	 * as many refaults as the first tier.
+	 */
+	read_ctrl_pos(lruvec, type, 0, 1, &sp);
+	for (tier =3D 1; tier < MAX_NR_TIERS; tier++) {
+		read_ctrl_pos(lruvec, type, tier, 2, &pv);
+		if (!positive_ctrl_err(&sp, &pv))
+			break;
+	}
+
+	return tier - 1;
+}
+
+static int get_type_to_scan(struct lruvec *lruvec, int swappiness, int *ti=
er_idx)
+{
+	int type, tier;
+	struct ctrl_pos sp, pv;
+	int gain[ANON_AND_FILE] =3D { swappiness, 200 - swappiness };
+
+	/*
+	 * Compare the first tier of anon with that of file to determine which
+	 * type to scan. Also need to compare other tiers of the selected type
+	 * with the first tier of the other type to determine the last tier (of
+	 * the selected type) to evict.
+	 */
+	read_ctrl_pos(lruvec, LRU_GEN_ANON, 0, gain[LRU_GEN_ANON], &sp);
+	read_ctrl_pos(lruvec, LRU_GEN_FILE, 0, gain[LRU_GEN_FILE], &pv);
+	type =3D positive_ctrl_err(&sp, &pv);
+
+	read_ctrl_pos(lruvec, !type, 0, gain[!type], &sp);
+	for (tier =3D 1; tier < MAX_NR_TIERS; tier++) {
+		read_ctrl_pos(lruvec, type, tier, gain[type], &pv);
+		if (!positive_ctrl_err(&sp, &pv))
+			break;
+	}
+
+	*tier_idx =3D tier - 1;
+
+	return type;
+}
+
+static int isolate_folios(struct lruvec *lruvec, struct scan_control *sc, =
int swappiness,
+			  int *type_scanned, struct list_head *list)
+{
+	int i;
+	int type;
+	int scanned;
+	int tier =3D -1;
+	DEFINE_MIN_SEQ(lruvec);
+
+	/*
+	 * Try to make the obvious choice first. When anon and file are both
+	 * available from the same generation, interpret swappiness 1 as file
+	 * first and 200 as anon first.
+	 */
+	if (!swappiness)
+		type =3D LRU_GEN_FILE;
+	else if (min_seq[LRU_GEN_ANON] < min_seq[LRU_GEN_FILE])
+		type =3D LRU_GEN_ANON;
+	else if (swappiness =3D=3D 1)
+		type =3D LRU_GEN_FILE;
+	else if (swappiness =3D=3D 200)
+		type =3D LRU_GEN_ANON;
+	else
+		type =3D get_type_to_scan(lruvec, swappiness, &tier);
+
+	for (i =3D !swappiness; i < ANON_AND_FILE; i++) {
+		if (tier < 0)
+			tier =3D get_tier_idx(lruvec, type);
+
+		scanned =3D scan_folios(lruvec, sc, type, tier, list);
+		if (scanned)
+			break;
+
+		type =3D !type;
+		tier =3D -1;
+	}
+
+	*type_scanned =3D type;
+
+	return scanned;
+}
+
+static int evict_folios(struct lruvec *lruvec, struct scan_control *sc, in=
t swappiness)
+{
+	int type;
+	int scanned;
+	int reclaimed;
+	LIST_HEAD(list);
+	struct folio *folio;
+	enum vm_event_item item;
+	struct reclaim_stat stat;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
+
+	spin_lock_irq(&lruvec->lru_lock);
+
+	scanned =3D isolate_folios(lruvec, sc, swappiness, &type, &list);
+
+	scanned +=3D try_to_inc_min_seq(lruvec, swappiness);
+
+	if (get_nr_gens(lruvec, !swappiness) =3D=3D MIN_NR_GENS)
+		scanned =3D 0;
+
+	spin_unlock_irq(&lruvec->lru_lock);
+
+	if (list_empty(&list))
+		return scanned;
+
+	reclaimed =3D shrink_page_list(&list, pgdat, sc, &stat, false);
+
+	list_for_each_entry(folio, &list, lru) {
+		/* restore LRU_REFS_FLAGS cleared by isolate_folio() */
+		if (folio_test_workingset(folio))
+			folio_set_referenced(folio);
+
+		/* don't add rejected pages to the oldest generation */
+		if (folio_test_reclaim(folio) &&
+		    (folio_test_dirty(folio) || folio_test_writeback(folio)))
+			folio_clear_active(folio);
+		else
+			folio_set_active(folio);
+	}
+
+	spin_lock_irq(&lruvec->lru_lock);
+
+	move_pages_to_lru(lruvec, &list);
+
+	item =3D current_is_kswapd() ? PGSTEAL_KSWAPD : PGSTEAL_DIRECT;
+	if (!cgroup_reclaim(sc))
+		__count_vm_events(item, reclaimed);
+	__count_memcg_events(memcg, item, reclaimed);
+	__count_vm_events(PGSTEAL_ANON + type, reclaimed);
+
+	spin_unlock_irq(&lruvec->lru_lock);
+
+	mem_cgroup_uncharge_list(&list);
+	free_unref_page_list(&list);
+
+	sc->nr_reclaimed +=3D reclaimed;
+
+	return scanned;
+}
+
+static unsigned long get_nr_to_scan(struct lruvec *lruvec, struct scan_con=
trol *sc,
+				    bool can_swap, unsigned long reclaimed)
+{
+	int priority;
+	bool need_aging;
+	unsigned long nr_to_scan;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+	DEFINE_MAX_SEQ(lruvec);
+	DEFINE_MIN_SEQ(lruvec);
+
+	if (fatal_signal_pending(current)) {
+		sc->nr_reclaimed +=3D MIN_LRU_BATCH;
+		return 0;
+	}
+
+	if (mem_cgroup_below_min(memcg) ||
+	    (mem_cgroup_below_low(memcg) && !sc->memcg_low_reclaim))
+		return 0;
+
+	nr_to_scan =3D get_nr_evictable(lruvec, max_seq, min_seq, can_swap, &need=
_aging);
+	if (!nr_to_scan)
+		return 0;
+
+	/* adjust priority if memcg is offline or the target is met */
+	if (!mem_cgroup_online(memcg))
+		priority =3D 0;
+	else if (sc->nr_reclaimed - reclaimed >=3D sc->nr_to_reclaim)
+		priority =3D DEF_PRIORITY;
+	else
+		priority =3D sc->priority;
+
+	nr_to_scan >>=3D priority;
+	if (!nr_to_scan)
+		return 0;
+
+	if (!need_aging)
+		return nr_to_scan;
+
+	/* skip the aging path at the default priority */
+	if (priority =3D=3D DEF_PRIORITY)
+		goto done;
+
+	/* leave the work to lru_gen_age_node() */
+	if (current_is_kswapd())
+		return 0;
+
+	inc_max_seq(lruvec, max_seq, can_swap);
+done:
+	return min_seq[!can_swap] + MIN_NR_GENS <=3D max_seq ? nr_to_scan : 0;
+}
+
+static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct scan_contr=
ol *sc)
+{
+	struct blk_plug plug;
+	unsigned long scanned =3D 0;
+	unsigned long reclaimed =3D sc->nr_reclaimed;
+
+	lru_add_drain();
+
+	blk_start_plug(&plug);
+
+	while (true) {
+		int delta;
+		int swappiness;
+		unsigned long nr_to_scan;
+
+		if (sc->may_swap)
+			swappiness =3D get_swappiness(lruvec, sc);
+		else if (!cgroup_reclaim(sc) && get_swappiness(lruvec, sc))
+			swappiness =3D 1;
+		else
+			swappiness =3D 0;
+
+		nr_to_scan =3D get_nr_to_scan(lruvec, sc, swappiness, reclaimed);
+		if (!nr_to_scan)
+			break;
+
+		delta =3D evict_folios(lruvec, sc, swappiness);
+		if (!delta)
+			break;
+
+		scanned +=3D delta;
+		if (scanned >=3D nr_to_scan)
+			break;
+
+		cond_resched();
+	}
+
+	blk_finish_plug(&plug);
+}
+
 /*************************************************************************=
*****
  *                          initialization
  *************************************************************************=
*****/
@@ -3123,6 +3902,16 @@ static int __init init_lru_gen(void)
 };
 late_initcall(init_lru_gen);
=20
+#else /* !CONFIG_LRU_GEN */
+
+static void lru_gen_age_node(struct pglist_data *pgdat, struct scan_contro=
l *sc)
+{
+}
+
+static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct scan_contr=
ol *sc)
+{
+}
+
 #endif /* CONFIG_LRU_GEN */
=20
 static void shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
@@ -3136,6 +3925,11 @@ static void shrink_lruvec(struct lruvec *lruvec, str=
uct scan_control *sc)
 	bool proportional_reclaim;
 	struct blk_plug plug;
=20
+	if (lru_gen_enabled()) {
+		lru_gen_shrink_lruvec(lruvec, sc);
+		return;
+	}
+
 	get_scan_count(lruvec, sc, nr);
=20
 	/* Record the original scan target for proportional adjustments later */
@@ -3640,6 +4434,9 @@ static void snapshot_refaults(struct mem_cgroup *targ=
et_memcg, pg_data_t *pgdat)
 	struct lruvec *target_lruvec;
 	unsigned long refaults;
=20
+	if (lru_gen_enabled())
+		return;
+
 	target_lruvec =3D mem_cgroup_lruvec(target_memcg, pgdat);
 	refaults =3D lruvec_page_state(target_lruvec, WORKINGSET_ACTIVATE_ANON);
 	target_lruvec->refaults[WORKINGSET_ANON] =3D refaults;
@@ -4006,12 +4803,17 @@ unsigned long try_to_free_mem_cgroup_pages(struct m=
em_cgroup *memcg,
 }
 #endif
=20
-static void age_active_anon(struct pglist_data *pgdat,
+static void kswapd_age_node(struct pglist_data *pgdat,
 				struct scan_control *sc)
 {
 	struct mem_cgroup *memcg;
 	struct lruvec *lruvec;
=20
+	if (lru_gen_enabled()) {
+		lru_gen_age_node(pgdat, sc);
+		return;
+	}
+
 	if (!can_age_anon_pages(pgdat, sc))
 		return;
=20
@@ -4331,12 +5133,11 @@ static int balance_pgdat(pg_data_t *pgdat, int orde=
r, int highest_zoneidx)
 		sc.may_swap =3D !nr_boost_reclaim;
=20
 		/*
-		 * Do some background aging of the anon list, to give
-		 * pages a chance to be referenced before reclaiming. All
-		 * pages are rotated regardless of classzone as this is
-		 * about consistent aging.
+		 * Do some background aging, to give pages a chance to be
+		 * referenced before reclaiming. All pages are rotated
+		 * regardless of classzone as this is about consistent aging.
 		 */
-		age_active_anon(pgdat, &sc);
+		kswapd_age_node(pgdat, &sc);
=20
 		/*
 		 * If we're getting trouble reclaiming, start doing writepage
diff --git a/mm/workingset.c b/mm/workingset.c
index a5e84862fc86..ae7e984b23c6 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -187,7 +187,6 @@ static unsigned int bucket_order __read_mostly;
 static void *pack_shadow(int memcgid, pg_data_t *pgdat, unsigned long evic=
tion,
 			 bool workingset)
 {
-	eviction >>=3D bucket_order;
 	eviction &=3D EVICTION_MASK;
 	eviction =3D (eviction << MEM_CGROUP_ID_SHIFT) | memcgid;
 	eviction =3D (eviction << NODES_SHIFT) | pgdat->node_id;
@@ -212,10 +211,107 @@ static void unpack_shadow(void *shadow, int *memcgid=
p, pg_data_t **pgdat,
=20
 	*memcgidp =3D memcgid;
 	*pgdat =3D NODE_DATA(nid);
-	*evictionp =3D entry << bucket_order;
+	*evictionp =3D entry;
 	*workingsetp =3D workingset;
 }
=20
+#ifdef CONFIG_LRU_GEN
+
+static void *lru_gen_eviction(struct folio *folio)
+{
+	int hist;
+	unsigned long token;
+	unsigned long min_seq;
+	struct lruvec *lruvec;
+	struct lru_gen_struct *lrugen;
+	int type =3D folio_is_file_lru(folio);
+	int delta =3D folio_nr_pages(folio);
+	int refs =3D folio_lru_refs(folio);
+	int tier =3D lru_tier_from_refs(refs);
+	struct mem_cgroup *memcg =3D folio_memcg(folio);
+	struct pglist_data *pgdat =3D folio_pgdat(folio);
+
+	BUILD_BUG_ON(LRU_GEN_WIDTH + LRU_REFS_WIDTH > BITS_PER_LONG - EVICTION_SH=
IFT);
+
+	lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
+	lrugen =3D &lruvec->lrugen;
+	min_seq =3D READ_ONCE(lrugen->min_seq[type]);
+	token =3D (min_seq << LRU_REFS_WIDTH) | max(refs - 1, 0);
+
+	hist =3D lru_hist_from_seq(min_seq);
+	atomic_long_add(delta, &lrugen->evicted[hist][type][tier]);
+
+	return pack_shadow(mem_cgroup_id(memcg), pgdat, token, refs);
+}
+
+static void lru_gen_refault(struct folio *folio, void *shadow)
+{
+	int hist, tier, refs;
+	int memcg_id;
+	bool workingset;
+	unsigned long token;
+	unsigned long min_seq;
+	struct lruvec *lruvec;
+	struct lru_gen_struct *lrugen;
+	struct mem_cgroup *memcg;
+	struct pglist_data *pgdat;
+	int type =3D folio_is_file_lru(folio);
+	int delta =3D folio_nr_pages(folio);
+
+	unpack_shadow(shadow, &memcg_id, &pgdat, &token, &workingset);
+
+	if (pgdat !=3D folio_pgdat(folio))
+		return;
+
+	rcu_read_lock();
+
+	memcg =3D folio_memcg_rcu(folio);
+	if (memcg_id !=3D mem_cgroup_id(memcg))
+		goto unlock;
+
+	lruvec =3D mem_cgroup_lruvec(memcg, pgdat);
+	lrugen =3D &lruvec->lrugen;
+
+	min_seq =3D READ_ONCE(lrugen->min_seq[type]);
+	if ((token >> LRU_REFS_WIDTH) !=3D (min_seq & (EVICTION_MASK >> LRU_REFS_=
WIDTH)))
+		goto unlock;
+
+	hist =3D lru_hist_from_seq(min_seq);
+	/* see the comment in folio_lru_refs() */
+	refs =3D (token & (BIT(LRU_REFS_WIDTH) - 1)) + workingset;
+	tier =3D lru_tier_from_refs(refs);
+
+	atomic_long_add(delta, &lrugen->refaulted[hist][type][tier]);
+	mod_lruvec_state(lruvec, WORKINGSET_REFAULT_BASE + type, delta);
+
+	/*
+	 * Count the following two cases as stalls:
+	 * 1. For pages accessed through page tables, hotter pages pushed out
+	 *    hot pages which refaulted immediately.
+	 * 2. For pages accessed multiple times through file descriptors,
+	 *    numbers of accesses might have been out of the range.
+	 */
+	if (lru_gen_in_fault() || refs =3D=3D BIT(LRU_REFS_WIDTH)) {
+		folio_set_workingset(folio);
+		mod_lruvec_state(lruvec, WORKINGSET_RESTORE_BASE + type, delta);
+	}
+unlock:
+	rcu_read_unlock();
+}
+
+#else /* !CONFIG_LRU_GEN */
+
+static void *lru_gen_eviction(struct folio *folio)
+{
+	return NULL;
+}
+
+static void lru_gen_refault(struct folio *folio, void *shadow)
+{
+}
+
+#endif /* CONFIG_LRU_GEN */
+
 /**
  * workingset_age_nonresident - age non-resident entries as LRU ages
  * @lruvec: the lruvec that was aged
@@ -264,10 +360,14 @@ void *workingset_eviction(struct folio *folio, struct=
 mem_cgroup *target_memcg)
 	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
=20
+	if (lru_gen_enabled())
+		return lru_gen_eviction(folio);
+
 	lruvec =3D mem_cgroup_lruvec(target_memcg, pgdat);
 	/* XXX: target_memcg can be NULL, go through lruvec */
 	memcgid =3D mem_cgroup_id(lruvec_memcg(lruvec));
 	eviction =3D atomic_long_read(&lruvec->nonresident_age);
+	eviction >>=3D bucket_order;
 	workingset_age_nonresident(lruvec, folio_nr_pages(folio));
 	return pack_shadow(memcgid, pgdat, eviction,
 				folio_test_workingset(folio));
@@ -298,7 +398,13 @@ void workingset_refault(struct folio *folio, void *sha=
dow)
 	int memcgid;
 	long nr;
=20
+	if (lru_gen_enabled()) {
+		lru_gen_refault(folio, shadow);
+		return;
+	}
+
 	unpack_shadow(shadow, &memcgid, &pgdat, &eviction, &workingset);
+	eviction <<=3D bucket_order;
=20
 	rcu_read_lock();
 	/*
--=20
2.37.1.595.g718a3a8f04-goog

