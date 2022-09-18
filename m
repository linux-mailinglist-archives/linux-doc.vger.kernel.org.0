Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEA85BBC5F
	for <lists+linux-doc@lfdr.de>; Sun, 18 Sep 2022 10:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiIRIBX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 18 Sep 2022 04:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiIRIBM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Sep 2022 04:01:12 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C2825E8F
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 01:01:09 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b14-20020a056902030e00b006a827d81fd8so22628815ybs.17
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date;
        bh=4bcpxpSmfww/I46Th+bN+KiyfUjGN3ynKud7f7zU+4I=;
        b=GkmsHlSd4TNkJb90r8o3vMAjgofa26T6atOG1IdsV/7bHOi8Mv6DPRi+3HmEbhkl3s
         tf2xTvMmyJ9x5M7Bjk1LiZWg2JnfWewk9JC5Ku4kHhlFUMzhmMh6sXx2HD4oJIzCjNdD
         t0cmPtm1y77oiIwAaphRVsZihHJHE5t5bKlnN3myj5opzze04F/b1vUfIAc/Klf4T5bV
         C3Io5gqKgIuN8bxhJ6dWvaB6/v7/C+kbgBglQc9/HXAkUogzZrrdSXkLVMv2MH+TbODi
         eHEP6itZsv4SHZE7EHpNvFenV7BMVreVrFZz+Ucyje1xdB+3z8F6mfM/ZL/Xxbw3K91l
         HArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date;
        bh=4bcpxpSmfww/I46Th+bN+KiyfUjGN3ynKud7f7zU+4I=;
        b=cOU7Alk6xHT9hI34YOUgx4YMkh2M7nshXYl14Ble1uKdve3SfekCRpHCm5ZJyKNWw6
         DYTUo7kRTFLfxDFyv77RZTL1OqHnVH48mm4Dts9XPb4qfPXMEhHqOjkLTSsMyI5RKD9K
         n95O5zP9/uP4mKuNMLrEhNEkaKAl9sHb4sVgyJj5l5J747GIIcULJ8mXIczckoa1D7nS
         L5sUb7jnqux4LAWVfZt/cpG+9x4ow1+FnJB3OUcwHRjK0yH90aWcrlPHs81FFaU+m/OZ
         smLJUuaeuHBUpwMeLwAJ6rK3QPxulvRR36vMsYPmy6zf4j27+KJ33dQBQ7agy1ZHSiJB
         wySA==
X-Gm-Message-State: ACrzQf3GdR5y+HHMNDEm1v3RknRuf1UVbnNZMzU2fs7R478iO4ICWawv
        zE7idgcp753ZF92HEW9FPqOnye4MtsQ=
X-Google-Smtp-Source: AMsMyM4wsWMiYJRoUyjB0xLVBtIdsCqO13S1fEBdOtFlOxKv4hVXK352m9yCO/dTDV3xly8XmX6YHY4S+18=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:c05a:2e99:29cd:d157])
 (user=yuzhao job=sendgmr) by 2002:a81:8844:0:b0:34c:5d95:414b with SMTP id
 y65-20020a818844000000b0034c5d95414bmr6093463ywf.447.1663488068670; Sun, 18
 Sep 2022 01:01:08 -0700 (PDT)
Date:   Sun, 18 Sep 2022 02:00:02 -0600
In-Reply-To: <20220918080010.2920238-1-yuzhao@google.com>
Message-Id: <20220918080010.2920238-6-yuzhao@google.com>
Mime-Version: 1.0
References: <20220918080010.2920238-1-yuzhao@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Subject: [PATCH mm-unstable v15 05/14] mm: multi-gen LRU: groundwork
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
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Evictable pages are divided into multiple generations for each lruvec.
The youngest generation number is stored in lrugen->max_seq for both
anon and file types as they are aged on an equal footing. The oldest
generation numbers are stored in lrugen->min_seq[] separately for anon
and file types as clean file pages can be evicted regardless of swap
constraints. These three variables are monotonically increasing.

Generation numbers are truncated into order_base_2(MAX_NR_GENS+1) bits
in order to fit into the gen counter in folio->flags. Each truncated
generation number is an index to lrugen->lists[]. The sliding window
technique is used to track at least MIN_NR_GENS and at most
MAX_NR_GENS generations. The gen counter stores a value within [1,
MAX_NR_GENS] while a page is on one of lrugen->lists[]. Otherwise it
stores 0.

There are two conceptually independent procedures: "the aging", which
produces young generations, and "the eviction", which consumes old
generations. They form a closed-loop system, i.e., "the page reclaim".
Both procedures can be invoked from userspace for the purposes of
working set estimation and proactive reclaim. These techniques are
commonly used to optimize job scheduling (bin packing) in data
centers [1][2].

To avoid confusion, the terms "hot" and "cold" will be applied to the
multi-gen LRU, as a new convention; the terms "active" and "inactive"
will be applied to the active/inactive LRU, as usual.

The protection of hot pages and the selection of cold pages are based
on page access channels and patterns. There are two access channels:
one through page tables and the other through file descriptors. The
protection of the former channel is by design stronger because:
1. The uncertainty in determining the access patterns of the former
   channel is higher due to the approximation of the accessed bit.
2. The cost of evicting the former channel is higher due to the TLB
   flushes required and the likelihood of encountering the dirty bit.
3. The penalty of underprotecting the former channel is higher because
   applications usually do not prepare themselves for major page
   faults like they do for blocked I/O. E.g., GUI applications
   commonly use dedicated I/O threads to avoid blocking rendering
   threads.
There are also two access patterns: one with temporal locality and the
other without. For the reasons listed above, the former channel is
assumed to follow the former pattern unless VM_SEQ_READ or
VM_RAND_READ is present; the latter channel is assumed to follow the
latter pattern unless outlying refaults have been observed [3][4].

The next patch will address the "outlying refaults". Three macros,
i.e., LRU_REFS_WIDTH, LRU_REFS_PGOFF and LRU_REFS_MASK, used later are
added in this patch to make the entire patchset less diffy.

A page is added to the youngest generation on faulting. The aging
needs to check the accessed bit at least twice before handing this
page over to the eviction. The first check takes care of the accessed
bit set on the initial fault; the second check makes sure this page
has not been used since then. This protocol, AKA second chance,
requires a minimum of two generations, hence MIN_NR_GENS.

[1] https://dl.acm.org/doi/10.1145/3297858.3304053
[2] https://dl.acm.org/doi/10.1145/3503222.3507731
[3] https://lwn.net/Articles/495543/
[4] https://lwn.net/Articles/815342/

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
 fs/fuse/dev.c                     |   3 +-
 include/linux/mm_inline.h         | 175 ++++++++++++++++++++++++++++++
 include/linux/mmzone.h            | 102 +++++++++++++++++
 include/linux/page-flags-layout.h |  13 ++-
 include/linux/page-flags.h        |   4 +-
 include/linux/sched.h             |   4 +
 kernel/bounds.c                   |   5 +
 mm/Kconfig                        |   8 ++
 mm/huge_memory.c                  |   3 +-
 mm/memcontrol.c                   |   2 +
 mm/memory.c                       |  25 +++++
 mm/mm_init.c                      |   6 +-
 mm/mmzone.c                       |   2 +
 mm/swap.c                         |  11 +-
 mm/vmscan.c                       |  75 +++++++++++++
 15 files changed, 424 insertions(+), 14 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 51897427a534..b4a6e0a1b945 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -776,7 +776,8 @@ static int fuse_check_page(struct page *page)
 	       1 << PG_active |
 	       1 << PG_workingset |
 	       1 << PG_reclaim |
-	       1 << PG_waiters))) {
+	       1 << PG_waiters |
+	       LRU_GEN_MASK | LRU_REFS_MASK))) {
 		dump_page(page, "fuse: trying to steal weird page");
 		return 1;
 	}
diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index fb8aadb81cd6..2ff703900fd0 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -40,6 +40,9 @@ static __always_inline void __update_lru_size(struct lruv=
ec *lruvec,
 {
 	struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
=20
+	lockdep_assert_held(&lruvec->lru_lock);
+	WARN_ON_ONCE(nr_pages !=3D (int)nr_pages);
+
 	__mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
 	__mod_zone_page_state(&pgdat->node_zones[zid],
 				NR_ZONE_LRU_BASE + lru, nr_pages);
@@ -101,11 +104,177 @@ static __always_inline enum lru_list folio_lru_list(=
struct folio *folio)
 	return lru;
 }
=20
+#ifdef CONFIG_LRU_GEN
+
+static inline bool lru_gen_enabled(void)
+{
+	return true;
+}
+
+static inline bool lru_gen_in_fault(void)
+{
+	return current->in_lru_fault;
+}
+
+static inline int lru_gen_from_seq(unsigned long seq)
+{
+	return seq % MAX_NR_GENS;
+}
+
+static inline int folio_lru_gen(struct folio *folio)
+{
+	unsigned long flags =3D READ_ONCE(folio->flags);
+
+	return ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
+}
+
+static inline bool lru_gen_is_active(struct lruvec *lruvec, int gen)
+{
+	unsigned long max_seq =3D lruvec->lrugen.max_seq;
+
+	VM_WARN_ON_ONCE(gen >=3D MAX_NR_GENS);
+
+	/* see the comment on MIN_NR_GENS */
+	return gen =3D=3D lru_gen_from_seq(max_seq) || gen =3D=3D lru_gen_from_se=
q(max_seq - 1);
+}
+
+static inline void lru_gen_update_size(struct lruvec *lruvec, struct folio=
 *folio,
+				       int old_gen, int new_gen)
+{
+	int type =3D folio_is_file_lru(folio);
+	int zone =3D folio_zonenum(folio);
+	int delta =3D folio_nr_pages(folio);
+	enum lru_list lru =3D type * LRU_INACTIVE_FILE;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	VM_WARN_ON_ONCE(old_gen !=3D -1 && old_gen >=3D MAX_NR_GENS);
+	VM_WARN_ON_ONCE(new_gen !=3D -1 && new_gen >=3D MAX_NR_GENS);
+	VM_WARN_ON_ONCE(old_gen =3D=3D -1 && new_gen =3D=3D -1);
+
+	if (old_gen >=3D 0)
+		WRITE_ONCE(lrugen->nr_pages[old_gen][type][zone],
+			   lrugen->nr_pages[old_gen][type][zone] - delta);
+	if (new_gen >=3D 0)
+		WRITE_ONCE(lrugen->nr_pages[new_gen][type][zone],
+			   lrugen->nr_pages[new_gen][type][zone] + delta);
+
+	/* addition */
+	if (old_gen < 0) {
+		if (lru_gen_is_active(lruvec, new_gen))
+			lru +=3D LRU_ACTIVE;
+		__update_lru_size(lruvec, lru, zone, delta);
+		return;
+	}
+
+	/* deletion */
+	if (new_gen < 0) {
+		if (lru_gen_is_active(lruvec, old_gen))
+			lru +=3D LRU_ACTIVE;
+		__update_lru_size(lruvec, lru, zone, -delta);
+		return;
+	}
+}
+
+static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *=
folio, bool reclaiming)
+{
+	unsigned long seq;
+	unsigned long flags;
+	int gen =3D folio_lru_gen(folio);
+	int type =3D folio_is_file_lru(folio);
+	int zone =3D folio_zonenum(folio);
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	VM_WARN_ON_ONCE_FOLIO(gen !=3D -1, folio);
+
+	if (folio_test_unevictable(folio))
+		return false;
+	/*
+	 * There are three common cases for this page:
+	 * 1. If it's hot, e.g., freshly faulted in or previously hot and
+	 *    migrated, add it to the youngest generation.
+	 * 2. If it's cold but can't be evicted immediately, i.e., an anon page
+	 *    not in swapcache or a dirty page pending writeback, add it to the
+	 *    second oldest generation.
+	 * 3. Everything else (clean, cold) is added to the oldest generation.
+	 */
+	if (folio_test_active(folio))
+		seq =3D lrugen->max_seq;
+	else if ((type =3D=3D LRU_GEN_ANON && !folio_test_swapcache(folio)) ||
+		 (folio_test_reclaim(folio) &&
+		  (folio_test_dirty(folio) || folio_test_writeback(folio))))
+		seq =3D lrugen->min_seq[type] + 1;
+	else
+		seq =3D lrugen->min_seq[type];
+
+	gen =3D lru_gen_from_seq(seq);
+	flags =3D (gen + 1UL) << LRU_GEN_PGOFF;
+	/* see the comment on MIN_NR_GENS about PG_active */
+	set_mask_bits(&folio->flags, LRU_GEN_MASK | BIT(PG_active), flags);
+
+	lru_gen_update_size(lruvec, folio, -1, gen);
+	/* for folio_rotate_reclaimable() */
+	if (reclaiming)
+		list_add_tail(&folio->lru, &lrugen->lists[gen][type][zone]);
+	else
+		list_add(&folio->lru, &lrugen->lists[gen][type][zone]);
+
+	return true;
+}
+
+static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *=
folio, bool reclaiming)
+{
+	unsigned long flags;
+	int gen =3D folio_lru_gen(folio);
+
+	if (gen < 0)
+		return false;
+
+	VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
+	VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
+
+	/* for folio_migrate_flags() */
+	flags =3D !reclaiming && lru_gen_is_active(lruvec, gen) ? BIT(PG_active) =
: 0;
+	flags =3D set_mask_bits(&folio->flags, LRU_GEN_MASK, flags);
+	gen =3D ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
+
+	lru_gen_update_size(lruvec, folio, gen, -1);
+	list_del(&folio->lru);
+
+	return true;
+}
+
+#else /* !CONFIG_LRU_GEN */
+
+static inline bool lru_gen_enabled(void)
+{
+	return false;
+}
+
+static inline bool lru_gen_in_fault(void)
+{
+	return false;
+}
+
+static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *=
folio, bool reclaiming)
+{
+	return false;
+}
+
+static inline bool lru_gen_del_folio(struct lruvec *lruvec, struct folio *=
folio, bool reclaiming)
+{
+	return false;
+}
+
+#endif /* CONFIG_LRU_GEN */
+
 static __always_inline
 void lruvec_add_folio(struct lruvec *lruvec, struct folio *folio)
 {
 	enum lru_list lru =3D folio_lru_list(folio);
=20
+	if (lru_gen_add_folio(lruvec, folio, false))
+		return;
+
 	update_lru_size(lruvec, lru, folio_zonenum(folio),
 			folio_nr_pages(folio));
 	if (lru !=3D LRU_UNEVICTABLE)
@@ -123,6 +292,9 @@ void lruvec_add_folio_tail(struct lruvec *lruvec, struc=
t folio *folio)
 {
 	enum lru_list lru =3D folio_lru_list(folio);
=20
+	if (lru_gen_add_folio(lruvec, folio, true))
+		return;
+
 	update_lru_size(lruvec, lru, folio_zonenum(folio),
 			folio_nr_pages(folio));
 	/* This is not expected to be used on LRU_UNEVICTABLE */
@@ -140,6 +312,9 @@ void lruvec_del_folio(struct lruvec *lruvec, struct fol=
io *folio)
 {
 	enum lru_list lru =3D folio_lru_list(folio);
=20
+	if (lru_gen_del_folio(lruvec, folio, false))
+		return;
+
 	if (lru !=3D LRU_UNEVICTABLE)
 		list_del(&folio->lru);
 	update_lru_size(lruvec, lru, folio_zonenum(folio),
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 18cf0fc5ce67..6f4ea078d90f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -317,6 +317,102 @@ enum lruvec_flags {
 					 */
 };
=20
+#endif /* !__GENERATING_BOUNDS_H */
+
+/*
+ * Evictable pages are divided into multiple generations. The youngest and=
 the
+ * oldest generation numbers, max_seq and min_seq, are monotonically incre=
asing.
+ * They form a sliding window of a variable size [MIN_NR_GENS, MAX_NR_GENS=
]. An
+ * offset within MAX_NR_GENS, i.e., gen, indexes the LRU list of the
+ * corresponding generation. The gen counter in folio->flags stores gen+1 =
while
+ * a page is on one of lrugen->lists[]. Otherwise it stores 0.
+ *
+ * A page is added to the youngest generation on faulting. The aging needs=
 to
+ * check the accessed bit at least twice before handing this page over to =
the
+ * eviction. The first check takes care of the accessed bit set on the ini=
tial
+ * fault; the second check makes sure this page hasn't been used since the=
n.
+ * This process, AKA second chance, requires a minimum of two generations,
+ * hence MIN_NR_GENS. And to maintain ABI compatibility with the active/in=
active
+ * LRU, e.g., /proc/vmstat, these two generations are considered active; t=
he
+ * rest of generations, if they exist, are considered inactive. See
+ * lru_gen_is_active().
+ *
+ * PG_active is always cleared while a page is on one of lrugen->lists[] s=
o that
+ * the aging needs not to worry about it. And it's set again when a page
+ * considered active is isolated for non-reclaiming purposes, e.g., migrat=
ion.
+ * See lru_gen_add_folio() and lru_gen_del_folio().
+ *
+ * MAX_NR_GENS is set to 4 so that the multi-gen LRU can support twice the
+ * number of categories of the active/inactive LRU when keeping track of
+ * accesses through page tables. This requires order_base_2(MAX_NR_GENS+1)=
 bits
+ * in folio->flags.
+ */
+#define MIN_NR_GENS		2U
+#define MAX_NR_GENS		4U
+
+#ifndef __GENERATING_BOUNDS_H
+
+struct lruvec;
+
+#define LRU_GEN_MASK		((BIT(LRU_GEN_WIDTH) - 1) << LRU_GEN_PGOFF)
+#define LRU_REFS_MASK		((BIT(LRU_REFS_WIDTH) - 1) << LRU_REFS_PGOFF)
+
+#ifdef CONFIG_LRU_GEN
+
+enum {
+	LRU_GEN_ANON,
+	LRU_GEN_FILE,
+};
+
+/*
+ * The youngest generation number is stored in max_seq for both anon and f=
ile
+ * types as they are aged on an equal footing. The oldest generation numbe=
rs are
+ * stored in min_seq[] separately for anon and file types as clean file pa=
ges
+ * can be evicted regardless of swap constraints.
+ *
+ * Normally anon and file min_seq are in sync. But if swapping is constrai=
ned,
+ * e.g., out of swap space, file min_seq is allowed to advance and leave a=
non
+ * min_seq behind.
+ *
+ * The number of pages in each generation is eventually consistent and the=
refore
+ * can be transiently negative.
+ */
+struct lru_gen_struct {
+	/* the aging increments the youngest generation number */
+	unsigned long max_seq;
+	/* the eviction increments the oldest generation numbers */
+	unsigned long min_seq[ANON_AND_FILE];
+	/* the multi-gen LRU lists, lazily sorted on eviction */
+	struct list_head lists[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
+	/* the multi-gen LRU sizes, eventually consistent */
+	long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];
+};
+
+void lru_gen_init_lruvec(struct lruvec *lruvec);
+
+#ifdef CONFIG_MEMCG
+void lru_gen_init_memcg(struct mem_cgroup *memcg);
+void lru_gen_exit_memcg(struct mem_cgroup *memcg);
+#endif
+
+#else /* !CONFIG_LRU_GEN */
+
+static inline void lru_gen_init_lruvec(struct lruvec *lruvec)
+{
+}
+
+#ifdef CONFIG_MEMCG
+static inline void lru_gen_init_memcg(struct mem_cgroup *memcg)
+{
+}
+
+static inline void lru_gen_exit_memcg(struct mem_cgroup *memcg)
+{
+}
+#endif
+
+#endif /* CONFIG_LRU_GEN */
+
 struct lruvec {
 	struct list_head		lists[NR_LRU_LISTS];
 	/* per lruvec lru_lock for memcg */
@@ -334,6 +430,10 @@ struct lruvec {
 	unsigned long			refaults[ANON_AND_FILE];
 	/* Various lruvec state flags (enum lruvec_flags) */
 	unsigned long			flags;
+#ifdef CONFIG_LRU_GEN
+	/* evictable pages divided into generations */
+	struct lru_gen_struct		lrugen;
+#endif
 #ifdef CONFIG_MEMCG
 	struct pglist_data *pgdat;
 #endif
@@ -749,6 +849,8 @@ static inline bool zone_is_empty(struct zone *zone)
 #define ZONES_PGOFF		(NODES_PGOFF - ZONES_WIDTH)
 #define LAST_CPUPID_PGOFF	(ZONES_PGOFF - LAST_CPUPID_WIDTH)
 #define KASAN_TAG_PGOFF		(LAST_CPUPID_PGOFF - KASAN_TAG_WIDTH)
+#define LRU_GEN_PGOFF		(KASAN_TAG_PGOFF - LRU_GEN_WIDTH)
+#define LRU_REFS_PGOFF		(LRU_GEN_PGOFF - LRU_REFS_WIDTH)
=20
 /*
  * Define the bit shifts to access each section.  For non-existent
diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-l=
ayout.h
index ef1e3e736e14..240905407a18 100644
--- a/include/linux/page-flags-layout.h
+++ b/include/linux/page-flags-layout.h
@@ -55,7 +55,8 @@
 #define SECTIONS_WIDTH		0
 #endif
=20
-#if ZONES_WIDTH + SECTIONS_WIDTH + NODES_SHIFT <=3D BITS_PER_LONG - NR_PAG=
EFLAGS
+#if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_SHIFT \
+	<=3D BITS_PER_LONG - NR_PAGEFLAGS
 #define NODES_WIDTH		NODES_SHIFT
 #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
 #error "Vmemmap: No space for nodes field in page flags"
@@ -89,8 +90,8 @@
 #define LAST_CPUPID_SHIFT 0
 #endif
=20
-#if ZONES_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + KASAN_TAG_WIDTH + LAST_CP=
UPID_SHIFT \
-	<=3D BITS_PER_LONG - NR_PAGEFLAGS
+#if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
+	KASAN_TAG_WIDTH + LAST_CPUPID_SHIFT <=3D BITS_PER_LONG - NR_PAGEFLAGS
 #define LAST_CPUPID_WIDTH LAST_CPUPID_SHIFT
 #else
 #define LAST_CPUPID_WIDTH 0
@@ -100,10 +101,12 @@
 #define LAST_CPUPID_NOT_IN_PAGE_FLAGS
 #endif
=20
-#if ZONES_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + KASAN_TAG_WIDTH + LAST_CP=
UPID_WIDTH \
-	> BITS_PER_LONG - NR_PAGEFLAGS
+#if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
+	KASAN_TAG_WIDTH + LAST_CPUPID_WIDTH > BITS_PER_LONG - NR_PAGEFLAGS
 #error "Not enough bits in page flags"
 #endif
=20
+#define LRU_REFS_WIDTH	0
+
 #endif
 #endif /* _LINUX_PAGE_FLAGS_LAYOUT */
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 465ff35a8c00..0b0ae5084e60 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1058,7 +1058,7 @@ static __always_inline void __ClearPageAnonExclusive(=
struct page *page)
 	 1UL << PG_private	| 1UL << PG_private_2	|	\
 	 1UL << PG_writeback	| 1UL << PG_reserved	|	\
 	 1UL << PG_slab		| 1UL << PG_active 	|	\
-	 1UL << PG_unevictable	| __PG_MLOCKED)
+	 1UL << PG_unevictable	| __PG_MLOCKED | LRU_GEN_MASK)
=20
 /*
  * Flags checked when a page is prepped for return by the page allocator.
@@ -1069,7 +1069,7 @@ static __always_inline void __ClearPageAnonExclusive(=
struct page *page)
  * alloc-free cycle to prevent from reusing the page.
  */
 #define PAGE_FLAGS_CHECK_AT_PREP	\
-	(PAGEFLAGS_MASK & ~__PG_HWPOISON)
+	((PAGEFLAGS_MASK & ~__PG_HWPOISON) | LRU_GEN_MASK | LRU_REFS_MASK)
=20
 #define PAGE_FLAGS_PRIVATE				\
 	(1UL << PG_private | 1UL << PG_private_2)
diff --git a/include/linux/sched.h b/include/linux/sched.h
index e7b2f8a5c711..8cc46a789193 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -914,6 +914,10 @@ struct task_struct {
 #ifdef CONFIG_MEMCG
 	unsigned			in_user_fault:1;
 #endif
+#ifdef CONFIG_LRU_GEN
+	/* whether the LRU algorithm may apply to this access */
+	unsigned			in_lru_fault:1;
+#endif
 #ifdef CONFIG_COMPAT_BRK
 	unsigned			brk_randomized:1;
 #endif
diff --git a/kernel/bounds.c b/kernel/bounds.c
index 9795d75b09b2..5ee60777d8e4 100644
--- a/kernel/bounds.c
+++ b/kernel/bounds.c
@@ -22,6 +22,11 @@ int main(void)
 	DEFINE(NR_CPUS_BITS, ilog2(CONFIG_NR_CPUS));
 #endif
 	DEFINE(SPINLOCK_SIZE, sizeof(spinlock_t));
+#ifdef CONFIG_LRU_GEN
+	DEFINE(LRU_GEN_WIDTH, order_base_2(MAX_NR_GENS + 1));
+#else
+	DEFINE(LRU_GEN_WIDTH, 0);
+#endif
 	/* End of constants */
=20
 	return 0;
diff --git a/mm/Kconfig b/mm/Kconfig
index e3fbd0788878..378306aee622 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1118,6 +1118,14 @@ config PTE_MARKER_UFFD_WP
 	  purposes.  It is required to enable userfaultfd write protection on
 	  file-backed memory types like shmem and hugetlbfs.
=20
+config LRU_GEN
+	bool "Multi-Gen LRU"
+	depends on MMU
+	# make sure folio->flags has enough spare bits
+	depends on 64BIT || !SPARSEMEM || SPARSEMEM_VMEMMAP
+	help
+	  A high performance LRU implementation to overcommit memory.
+
 source "mm/damon/Kconfig"
=20
 endmenu
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index f4a656b279b1..949d7c325133 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2444,7 +2444,8 @@ static void __split_huge_page_tail(struct page *head,=
 int tail,
 #ifdef CONFIG_64BIT
 			 (1L << PG_arch_2) |
 #endif
-			 (1L << PG_dirty)));
+			 (1L << PG_dirty) |
+			 LRU_GEN_MASK | LRU_REFS_MASK));
=20
 	/* ->mapping in first tail page is compound_mapcount */
 	VM_BUG_ON_PAGE(tail > 2 && page_tail->mapping !=3D TAIL_MAPPING,
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 403af5f7a2b9..937141d48221 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5175,6 +5175,7 @@ static void __mem_cgroup_free(struct mem_cgroup *memc=
g)
=20
 static void mem_cgroup_free(struct mem_cgroup *memcg)
 {
+	lru_gen_exit_memcg(memcg);
 	memcg_wb_domain_exit(memcg);
 	__mem_cgroup_free(memcg);
 }
@@ -5233,6 +5234,7 @@ static struct mem_cgroup *mem_cgroup_alloc(void)
 	memcg->deferred_split_queue.split_queue_len =3D 0;
 #endif
 	idr_replace(&mem_cgroup_idr, memcg, memcg->id.id);
+	lru_gen_init_memcg(memcg);
 	return memcg;
 fail:
 	mem_cgroup_id_remove(memcg);
diff --git a/mm/memory.c b/mm/memory.c
index 3a9b00c765c2..63832dab15d3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5117,6 +5117,27 @@ static inline void mm_account_fault(struct pt_regs *=
regs,
 		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1, regs, address);
 }
=20
+#ifdef CONFIG_LRU_GEN
+static void lru_gen_enter_fault(struct vm_area_struct *vma)
+{
+	/* the LRU algorithm doesn't apply to sequential or random reads */
+	current->in_lru_fault =3D !(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ))=
;
+}
+
+static void lru_gen_exit_fault(void)
+{
+	current->in_lru_fault =3D false;
+}
+#else
+static void lru_gen_enter_fault(struct vm_area_struct *vma)
+{
+}
+
+static void lru_gen_exit_fault(void)
+{
+}
+#endif /* CONFIG_LRU_GEN */
+
 /*
  * By the time we get here, we already hold the mm semaphore
  *
@@ -5148,11 +5169,15 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *v=
ma, unsigned long address,
 	if (flags & FAULT_FLAG_USER)
 		mem_cgroup_enter_user_fault();
=20
+	lru_gen_enter_fault(vma);
+
 	if (unlikely(is_vm_hugetlb_page(vma)))
 		ret =3D hugetlb_fault(vma->vm_mm, vma, address, flags);
 	else
 		ret =3D __handle_mm_fault(vma, address, flags);
=20
+	lru_gen_exit_fault();
+
 	if (flags & FAULT_FLAG_USER) {
 		mem_cgroup_exit_user_fault();
 		/*
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9ddaf0e1b0ab..0d7b2bd2454a 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -65,14 +65,16 @@ void __init mminit_verify_pageflags_layout(void)
=20
 	shift =3D 8 * sizeof(unsigned long);
 	width =3D shift - SECTIONS_WIDTH - NODES_WIDTH - ZONES_WIDTH
-		- LAST_CPUPID_SHIFT - KASAN_TAG_WIDTH;
+		- LAST_CPUPID_SHIFT - KASAN_TAG_WIDTH - LRU_GEN_WIDTH - LRU_REFS_WIDTH;
 	mminit_dprintk(MMINIT_TRACE, "pageflags_layout_widths",
-		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d Flags %d\n",
+		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d Gen %d Tier %d Fla=
gs %d\n",
 		SECTIONS_WIDTH,
 		NODES_WIDTH,
 		ZONES_WIDTH,
 		LAST_CPUPID_WIDTH,
 		KASAN_TAG_WIDTH,
+		LRU_GEN_WIDTH,
+		LRU_REFS_WIDTH,
 		NR_PAGEFLAGS);
 	mminit_dprintk(MMINIT_TRACE, "pageflags_layout_shifts",
 		"Section %d Node %d Zone %d Lastcpupid %d Kasantag %d\n",
diff --git a/mm/mmzone.c b/mm/mmzone.c
index 0ae7571e35ab..68e1511be12d 100644
--- a/mm/mmzone.c
+++ b/mm/mmzone.c
@@ -88,6 +88,8 @@ void lruvec_init(struct lruvec *lruvec)
 	 * Poison its list head, so that any operations on it would crash.
 	 */
 	list_del(&lruvec->lists[LRU_UNEVICTABLE]);
+
+	lru_gen_init_lruvec(lruvec);
 }
=20
 #if defined(CONFIG_NUMA_BALANCING) && !defined(LAST_CPUPID_NOT_IN_PAGE_FLA=
GS)
diff --git a/mm/swap.c b/mm/swap.c
index 9cee7f6a3809..0e423b7d458b 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -484,6 +484,11 @@ void folio_add_lru(struct folio *folio)
 			folio_test_unevictable(folio), folio);
 	VM_BUG_ON_FOLIO(folio_test_lru(folio), folio);
=20
+	/* see the comment in lru_gen_add_folio() */
+	if (lru_gen_enabled() && !folio_test_unevictable(folio) &&
+	    lru_gen_in_fault() && !(current->flags & PF_MEMALLOC))
+		folio_set_active(folio);
+
 	folio_get(folio);
 	local_lock(&cpu_fbatches.lock);
 	fbatch =3D this_cpu_ptr(&cpu_fbatches.lru_add);
@@ -575,7 +580,7 @@ static void lru_deactivate_file_fn(struct lruvec *lruve=
c, struct folio *folio)
=20
 static void lru_deactivate_fn(struct lruvec *lruvec, struct folio *folio)
 {
-	if (folio_test_active(folio) && !folio_test_unevictable(folio)) {
+	if (!folio_test_unevictable(folio) && (folio_test_active(folio) || lru_ge=
n_enabled())) {
 		long nr_pages =3D folio_nr_pages(folio);
=20
 		lruvec_del_folio(lruvec, folio);
@@ -688,8 +693,8 @@ void deactivate_page(struct page *page)
 {
 	struct folio *folio =3D page_folio(page);
=20
-	if (folio_test_lru(folio) && folio_test_active(folio) &&
-	    !folio_test_unevictable(folio)) {
+	if (folio_test_lru(folio) && !folio_test_unevictable(folio) &&
+	    (folio_test_active(folio) || lru_gen_enabled())) {
 		struct folio_batch *fbatch;
=20
 		folio_get(folio);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 0869cee13a90..8d41c4ef430e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3050,6 +3050,81 @@ static bool can_age_anon_pages(struct pglist_data *p=
gdat,
 	return can_demote(pgdat->node_id, sc);
 }
=20
+#ifdef CONFIG_LRU_GEN
+
+/*************************************************************************=
*****
+ *                          shorthand helpers
+ *************************************************************************=
*****/
+
+#define for_each_gen_type_zone(gen, type, zone)				\
+	for ((gen) =3D 0; (gen) < MAX_NR_GENS; (gen)++)			\
+		for ((type) =3D 0; (type) < ANON_AND_FILE; (type)++)	\
+			for ((zone) =3D 0; (zone) < MAX_NR_ZONES; (zone)++)
+
+static struct lruvec __maybe_unused *get_lruvec(struct mem_cgroup *memcg, =
int nid)
+{
+	struct pglist_data *pgdat =3D NODE_DATA(nid);
+
+#ifdef CONFIG_MEMCG
+	if (memcg) {
+		struct lruvec *lruvec =3D &memcg->nodeinfo[nid]->lruvec;
+
+		/* for hotadd_new_pgdat() */
+		if (!lruvec->pgdat)
+			lruvec->pgdat =3D pgdat;
+
+		return lruvec;
+	}
+#endif
+	VM_WARN_ON_ONCE(!mem_cgroup_disabled());
+
+	return pgdat ? &pgdat->__lruvec : NULL;
+}
+
+/*************************************************************************=
*****
+ *                          initialization
+ *************************************************************************=
*****/
+
+void lru_gen_init_lruvec(struct lruvec *lruvec)
+{
+	int gen, type, zone;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	lrugen->max_seq =3D MIN_NR_GENS + 1;
+
+	for_each_gen_type_zone(gen, type, zone)
+		INIT_LIST_HEAD(&lrugen->lists[gen][type][zone]);
+}
+
+#ifdef CONFIG_MEMCG
+void lru_gen_init_memcg(struct mem_cgroup *memcg)
+{
+}
+
+void lru_gen_exit_memcg(struct mem_cgroup *memcg)
+{
+	int nid;
+
+	for_each_node(nid) {
+		struct lruvec *lruvec =3D get_lruvec(memcg, nid);
+
+		VM_WARN_ON_ONCE(memchr_inv(lruvec->lrugen.nr_pages, 0,
+					   sizeof(lruvec->lrugen.nr_pages)));
+	}
+}
+#endif
+
+static int __init init_lru_gen(void)
+{
+	BUILD_BUG_ON(MIN_NR_GENS + 1 >=3D MAX_NR_GENS);
+	BUILD_BUG_ON(BIT(LRU_GEN_WIDTH) <=3D MAX_NR_GENS);
+
+	return 0;
+};
+late_initcall(init_lru_gen);
+
+#endif /* CONFIG_LRU_GEN */
+
 static void shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 {
 	unsigned long nr[NR_LRU_LISTS];
--=20
2.37.3.968.ga6b4b080e4-goog

