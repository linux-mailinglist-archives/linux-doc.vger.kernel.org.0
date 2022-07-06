Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D675694ED
	for <lists+linux-doc@lfdr.de>; Thu,  7 Jul 2022 00:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbiGFWBe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Jul 2022 18:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234673AbiGFWBb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 18:01:31 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7272AC67
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 15:01:07 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id m12-20020a25260c000000b0066e4c753d8bso6439545ybm.14
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 15:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=t3JqYbFJT9lP6E96sRUzmCzQEu0iJg+mfU6dciROW6I=;
        b=K/nKIb14JmIaSQ25G+voEr3Xu6sFBToolWxLX2DrPdbxAa6BpfoEW4/5621Rzsff4D
         1k3G9tp+5ESbNVZCZfqietdtMt6OTAchdy14TXI4WTiTZLglVlIfr80zpxGfIGcphLBv
         c2R6icWOjZ0upEVkivTfwH9rKBl233YFlYCWfHzoiU07eBFA2yPOzHZx49n6UFl3tbHt
         eSai05q6oFPAPMqEwWKLLg5e2ewTiqoowbahH4nTTyw69dIDZhmip41HFaA0/Sczzyq3
         JDic9dSJ+BDTRQ6TaWU0nw7eqP8mi+/sxNdfATpIluPgr0W9A0QZ1JCn1D9q09woZwV/
         PFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=t3JqYbFJT9lP6E96sRUzmCzQEu0iJg+mfU6dciROW6I=;
        b=a5j86/inu8gkm1VznOZ5WTHHkTZjH9C198nI6SD0FHMJz3EhaDlU9UbdKn6QU9G9Yc
         YDAlBvStfb+4ninx6+QyMDCYz5QqBiGL7Y2Tho9L8pfeWfTVswGzcwr3ijJomePf5ans
         FE0jxct5kjop7nsohXBiCgisMiH4/p5x5BcnBMWE2yyh6KJ7lclPH409d6Qp7L/bFcU7
         UWmBzUOF8XDOzR2BcU3Jhm0enoLx7YvUqIyhAEQU+6v6A8MeAYHcTUYbyGWkEYz7VEI4
         oWnRN8lNbmEAb+tHQ8ae095GGhnlOOzWexqk/xK7eTSO4XDohUzMxbs3ShzDueo4SFQ6
         v3aw==
X-Gm-Message-State: AJIora+rYD29IQRj0jdWiy9xPSs6qMt1xFG5XKDFemOUSlVKrIIBymy9
        b6xPQl+9hTHigq6qbBOC3XHSwijdq2I=
X-Google-Smtp-Source: AGRyM1uCmWNAcyv7l4c+bwlvsNWjdcmS50NXK/ousi79Gs9bHWyAObimB3RXzG41nJY/wFbH1TL7Js/68Zk=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:b89c:e10a:466e:cf7d])
 (user=yuzhao job=sendgmr) by 2002:a25:e74e:0:b0:66e:32d4:1f0 with SMTP id
 e75-20020a25e74e000000b0066e32d401f0mr24265460ybh.421.1657144866511; Wed, 06
 Jul 2022 15:01:06 -0700 (PDT)
Date:   Wed,  6 Jul 2022 16:00:19 -0600
In-Reply-To: <20220706220022.968789-1-yuzhao@google.com>
Message-Id: <20220706220022.968789-11-yuzhao@google.com>
Mime-Version: 1.0
References: <20220706220022.968789-1-yuzhao@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v13 10/14] mm: multi-gen LRU: kill switch
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add /sys/kernel/mm/lru_gen/enabled as a kill switch. Components that
can be disabled include:
  0x0001: the multi-gen LRU core
  0x0002: walking page table, when arch_has_hw_pte_young() returns
          true
  0x0004: clearing the accessed bit in non-leaf PMD entries, when
          CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=3Dy
  [yYnN]: apply to all the components above
E.g.,
  echo y >/sys/kernel/mm/lru_gen/enabled
  cat /sys/kernel/mm/lru_gen/enabled
  0x0007
  echo 5 >/sys/kernel/mm/lru_gen/enabled
  cat /sys/kernel/mm/lru_gen/enabled
  0x0005

NB: the page table walks happen on the scale of seconds under heavy
memory pressure, in which case the mmap_lock contention is a lesser
concern, compared with the LRU lock contention and the I/O congestion.
So far the only well-known case of the mmap_lock contention happens on
Android, due to Scudo [1] which allocates several thousand VMAs for
merely a few hundred MBs. The SPF and the Maple Tree also have
provided their own assessments [2][3]. However, if walking page tables
does worsen the mmap_lock contention, the kill switch can be used to
disable it. In this case the multi-gen LRU will suffer a minor
performance degradation, as shown previously.

Clearing the accessed bit in non-leaf PMD entries can also be
disabled, since this behavior was not tested on x86 varieties other
than Intel and AMD.

[1] https://source.android.com/devices/tech/debug/scudo
[2] https://lore.kernel.org/r/20220128131006.67712-1-michel@lespinasse.org/
[3] https://lore.kernel.org/r/20220426150616.3937571-1-Liam.Howlett@oracle.=
com/

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
 include/linux/cgroup.h          |  15 ++-
 include/linux/mm_inline.h       |  15 ++-
 include/linux/mmzone.h          |   9 ++
 kernel/cgroup/cgroup-internal.h |   1 -
 mm/Kconfig                      |   6 +
 mm/vmscan.c                     | 231 +++++++++++++++++++++++++++++++-
 6 files changed, 268 insertions(+), 9 deletions(-)

diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index 0d1ada8968d7..1bc0cabf993f 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -432,6 +432,18 @@ static inline void cgroup_put(struct cgroup *cgrp)
 	css_put(&cgrp->self);
 }
=20
+extern struct mutex cgroup_mutex;
+
+static inline void cgroup_lock(void)
+{
+	mutex_lock(&cgroup_mutex);
+}
+
+static inline void cgroup_unlock(void)
+{
+	mutex_unlock(&cgroup_mutex);
+}
+
 /**
  * task_css_set_check - obtain a task's css_set with extra access conditio=
ns
  * @task: the task to obtain css_set for
@@ -446,7 +458,6 @@ static inline void cgroup_put(struct cgroup *cgrp)
  * as locks used during the cgroup_subsys::attach() methods.
  */
 #ifdef CONFIG_PROVE_RCU
-extern struct mutex cgroup_mutex;
 extern spinlock_t css_set_lock;
 #define task_css_set_check(task, __c)					\
 	rcu_dereference_check((task)->cgroups,				\
@@ -708,6 +719,8 @@ struct cgroup;
 static inline u64 cgroup_id(const struct cgroup *cgrp) { return 1; }
 static inline void css_get(struct cgroup_subsys_state *css) {}
 static inline void css_put(struct cgroup_subsys_state *css) {}
+static inline void cgroup_lock(void) {}
+static inline void cgroup_unlock(void) {}
 static inline int cgroup_attach_task_all(struct task_struct *from,
 					 struct task_struct *t) { return 0; }
 static inline int cgroupstats_build(struct cgroupstats *stats,
diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index f2b2296a42f9..4949eda9a9a2 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -106,10 +106,21 @@ static __always_inline enum lru_list folio_lru_list(s=
truct folio *folio)
=20
 #ifdef CONFIG_LRU_GEN
=20
+#ifdef CONFIG_LRU_GEN_ENABLED
 static inline bool lru_gen_enabled(void)
 {
-	return true;
+	DECLARE_STATIC_KEY_TRUE(lru_gen_caps[NR_LRU_GEN_CAPS]);
+
+	return static_branch_likely(&lru_gen_caps[LRU_GEN_CORE]);
 }
+#else
+static inline bool lru_gen_enabled(void)
+{
+	DECLARE_STATIC_KEY_FALSE(lru_gen_caps[NR_LRU_GEN_CAPS]);
+
+	return static_branch_unlikely(&lru_gen_caps[LRU_GEN_CORE]);
+}
+#endif
=20
 static inline bool lru_gen_in_fault(void)
 {
@@ -222,7 +233,7 @@ static inline bool lru_gen_add_folio(struct lruvec *lru=
vec, struct folio *folio,
=20
 	VM_WARN_ON_ONCE_FOLIO(gen !=3D -1, folio);
=20
-	if (folio_test_unevictable(folio))
+	if (folio_test_unevictable(folio) || !lrugen->enabled)
 		return false;
 	/*
 	 * There are three common cases for this page:
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 0cf0856b484a..840b7ca8b91f 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -384,6 +384,13 @@ enum {
 	LRU_GEN_FILE,
 };
=20
+enum {
+	LRU_GEN_CORE,
+	LRU_GEN_MM_WALK,
+	LRU_GEN_NONLEAF_YOUNG,
+	NR_LRU_GEN_CAPS
+};
+
 #define MIN_LRU_BATCH		BITS_PER_LONG
 #define MAX_LRU_BATCH		(MIN_LRU_BATCH * 128)
=20
@@ -425,6 +432,8 @@ struct lru_gen_struct {
 	/* can be modified without holding the LRU lock */
 	atomic_long_t evicted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
 	atomic_long_t refaulted[NR_HIST_GENS][ANON_AND_FILE][MAX_NR_TIERS];
+	/* whether the multi-gen LRU is enabled */
+	bool enabled;
 };
=20
 enum {
diff --git a/kernel/cgroup/cgroup-internal.h b/kernel/cgroup/cgroup-interna=
l.h
index 5da09c74228d..c966e55cab29 100644
--- a/kernel/cgroup/cgroup-internal.h
+++ b/kernel/cgroup/cgroup-internal.h
@@ -164,7 +164,6 @@ struct cgroup_mgctx {
 #define DEFINE_CGROUP_MGCTX(name)						\
 	struct cgroup_mgctx name =3D CGROUP_MGCTX_INIT(name)
=20
-extern struct mutex cgroup_mutex;
 extern spinlock_t css_set_lock;
 extern struct cgroup_subsys *cgroup_subsys[];
 extern struct list_head cgroup_roots;
diff --git a/mm/Kconfig b/mm/Kconfig
index a93478acf341..0c2ef0af0036 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1139,6 +1139,12 @@ config LRU_GEN
 	help
 	  A high performance LRU implementation to overcommit memory.
=20
+config LRU_GEN_ENABLED
+	bool "Enable by default"
+	depends on LRU_GEN
+	help
+	  This option enables the multi-gen LRU by default.
+
 config LRU_GEN_STATS
 	bool "Full stats for debugging"
 	depends on LRU_GEN
diff --git a/mm/vmscan.c b/mm/vmscan.c
index f469a2740835..4c8b475429ed 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -52,6 +52,7 @@
 #include <linux/psi.h>
 #include <linux/pagewalk.h>
 #include <linux/shmem_fs.h>
+#include <linux/ctype.h>
=20
 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -3013,6 +3014,14 @@ static bool can_age_anon_pages(struct pglist_data *p=
gdat,
=20
 #ifdef CONFIG_LRU_GEN
=20
+#ifdef CONFIG_LRU_GEN_ENABLED
+DEFINE_STATIC_KEY_ARRAY_TRUE(lru_gen_caps, NR_LRU_GEN_CAPS);
+#define get_cap(cap)	static_branch_likely(&lru_gen_caps[cap])
+#else
+DEFINE_STATIC_KEY_ARRAY_FALSE(lru_gen_caps, NR_LRU_GEN_CAPS);
+#define get_cap(cap)	static_branch_unlikely(&lru_gen_caps[cap])
+#endif
+
 /*************************************************************************=
*****
  *                          shorthand helpers
  *************************************************************************=
*****/
@@ -3890,7 +3899,8 @@ static void walk_pmd_range_locked(pud_t *pud, unsigne=
d long next, struct vm_area
 			goto next;
=20
 		if (!pmd_trans_huge(pmd[i])) {
-			if (IS_ENABLED(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG))
+			if (IS_ENABLED(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG) &&
+			    get_cap(LRU_GEN_NONLEAF_YOUNG))
 				pmdp_test_and_clear_young(vma, addr, pmd + i);
 			goto next;
 		}
@@ -3988,10 +3998,12 @@ static void walk_pmd_range(pud_t *pud, unsigned lon=
g start, unsigned long end,
 		walk->mm_stats[MM_NONLEAF_TOTAL]++;
=20
 #ifdef CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG
-		if (!pmd_young(val))
-			continue;
+		if (get_cap(LRU_GEN_NONLEAF_YOUNG)) {
+			if (!pmd_young(val))
+				continue;
=20
-		walk_pmd_range_locked(pud, addr, vma, args, bitmap, &pos);
+			walk_pmd_range_locked(pud, addr, vma, args, bitmap, &pos);
+		}
 #endif
 		if (!walk->force_scan && !test_bloom_filter(walk->lruvec, walk->max_seq,=
 pmd + i))
 			continue;
@@ -4249,7 +4261,7 @@ static bool try_to_inc_max_seq(struct lruvec *lruvec,=
 unsigned long max_seq,
 	 * handful of PTEs. Spreading the work out over a period of time usually
 	 * is less efficient, but it avoids bursty page faults.
 	 */
-	if (!arch_has_hw_pte_young()) {
+	if (!(arch_has_hw_pte_young() && get_cap(LRU_GEN_MM_WALK))) {
 		success =3D iterate_mm_list_nowalk(lruvec, max_seq);
 		goto done;
 	}
@@ -4975,6 +4987,211 @@ static void lru_gen_shrink_lruvec(struct lruvec *lr=
uvec, struct scan_control *sc
 	blk_finish_plug(&plug);
 }
=20
+/*************************************************************************=
*****
+ *                          state change
+ *************************************************************************=
*****/
+
+static bool __maybe_unused state_is_valid(struct lruvec *lruvec)
+{
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	if (lrugen->enabled) {
+		enum lru_list lru;
+
+		for_each_evictable_lru(lru) {
+			if (!list_empty(&lruvec->lists[lru]))
+				return false;
+		}
+	} else {
+		int gen, type, zone;
+
+		for_each_gen_type_zone(gen, type, zone) {
+			if (!list_empty(&lrugen->lists[gen][type][zone]))
+				return false;
+
+			/* unlikely but not a bug when reset_batch_size() is pending */
+			VM_WARN_ON_ONCE(lrugen->nr_pages[gen][type][zone]);
+		}
+	}
+
+	return true;
+}
+
+static bool fill_evictable(struct lruvec *lruvec)
+{
+	enum lru_list lru;
+	int remaining =3D MAX_LRU_BATCH;
+
+	for_each_evictable_lru(lru) {
+		int type =3D is_file_lru(lru);
+		bool active =3D is_active_lru(lru);
+		struct list_head *head =3D &lruvec->lists[lru];
+
+		while (!list_empty(head)) {
+			bool success;
+			struct folio *folio =3D lru_to_folio(head);
+
+			VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
+			VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio) !=3D active, folio);
+			VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) !=3D type, folio);
+			VM_WARN_ON_ONCE_FOLIO(folio_lru_gen(folio) !=3D -1, folio);
+
+			lruvec_del_folio(lruvec, folio);
+			success =3D lru_gen_add_folio(lruvec, folio, false);
+			VM_WARN_ON_ONCE(!success);
+
+			if (!--remaining)
+				return false;
+		}
+	}
+
+	return true;
+}
+
+static bool drain_evictable(struct lruvec *lruvec)
+{
+	int gen, type, zone;
+	int remaining =3D MAX_LRU_BATCH;
+
+	for_each_gen_type_zone(gen, type, zone) {
+		struct list_head *head =3D &lruvec->lrugen.lists[gen][type][zone];
+
+		while (!list_empty(head)) {
+			bool success;
+			struct folio *folio =3D lru_to_folio(head);
+
+			VM_WARN_ON_ONCE_FOLIO(folio_test_unevictable(folio), folio);
+			VM_WARN_ON_ONCE_FOLIO(folio_test_active(folio), folio);
+			VM_WARN_ON_ONCE_FOLIO(folio_is_file_lru(folio) !=3D type, folio);
+			VM_WARN_ON_ONCE_FOLIO(folio_zonenum(folio) !=3D zone, folio);
+
+			success =3D lru_gen_del_folio(lruvec, folio, false);
+			VM_WARN_ON_ONCE(!success);
+			lruvec_add_folio(lruvec, folio);
+
+			if (!--remaining)
+				return false;
+		}
+	}
+
+	return true;
+}
+
+static void lru_gen_change_state(bool enabled)
+{
+	static DEFINE_MUTEX(state_mutex);
+
+	struct mem_cgroup *memcg;
+
+	cgroup_lock();
+	cpus_read_lock();
+	get_online_mems();
+	mutex_lock(&state_mutex);
+
+	if (enabled =3D=3D lru_gen_enabled())
+		goto unlock;
+
+	if (enabled)
+		static_branch_enable_cpuslocked(&lru_gen_caps[LRU_GEN_CORE]);
+	else
+		static_branch_disable_cpuslocked(&lru_gen_caps[LRU_GEN_CORE]);
+
+	memcg =3D mem_cgroup_iter(NULL, NULL, NULL);
+	do {
+		int nid;
+
+		for_each_node(nid) {
+			struct lruvec *lruvec =3D get_lruvec(memcg, nid);
+
+			if (!lruvec)
+				continue;
+
+			spin_lock_irq(&lruvec->lru_lock);
+
+			VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
+			VM_WARN_ON_ONCE(!state_is_valid(lruvec));
+
+			lruvec->lrugen.enabled =3D enabled;
+
+			while (!(enabled ? fill_evictable(lruvec) : drain_evictable(lruvec))) {
+				spin_unlock_irq(&lruvec->lru_lock);
+				cond_resched();
+				spin_lock_irq(&lruvec->lru_lock);
+			}
+
+			spin_unlock_irq(&lruvec->lru_lock);
+		}
+
+		cond_resched();
+	} while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
+unlock:
+	mutex_unlock(&state_mutex);
+	put_online_mems();
+	cpus_read_unlock();
+	cgroup_unlock();
+}
+
+/*************************************************************************=
*****
+ *                          sysfs interface
+ *************************************************************************=
*****/
+
+static ssize_t show_enabled(struct kobject *kobj, struct kobj_attribute *a=
ttr, char *buf)
+{
+	unsigned int caps =3D 0;
+
+	if (get_cap(LRU_GEN_CORE))
+		caps |=3D BIT(LRU_GEN_CORE);
+
+	if (arch_has_hw_pte_young() && get_cap(LRU_GEN_MM_WALK))
+		caps |=3D BIT(LRU_GEN_MM_WALK);
+
+	if (IS_ENABLED(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG) && get_cap(LRU_GEN_NONL=
EAF_YOUNG))
+		caps |=3D BIT(LRU_GEN_NONLEAF_YOUNG);
+
+	return snprintf(buf, PAGE_SIZE, "0x%04x\n", caps);
+}
+
+static ssize_t store_enabled(struct kobject *kobj, struct kobj_attribute *=
attr,
+			     const char *buf, size_t len)
+{
+	int i;
+	unsigned int caps;
+
+	if (tolower(*buf) =3D=3D 'n')
+		caps =3D 0;
+	else if (tolower(*buf) =3D=3D 'y')
+		caps =3D -1;
+	else if (kstrtouint(buf, 0, &caps))
+		return -EINVAL;
+
+	for (i =3D 0; i < NR_LRU_GEN_CAPS; i++) {
+		bool enabled =3D caps & BIT(i);
+
+		if (i =3D=3D LRU_GEN_CORE)
+			lru_gen_change_state(enabled);
+		else if (enabled)
+			static_branch_enable(&lru_gen_caps[i]);
+		else
+			static_branch_disable(&lru_gen_caps[i]);
+	}
+
+	return len;
+}
+
+static struct kobj_attribute lru_gen_enabled_attr =3D __ATTR(
+	enabled, 0644, show_enabled, store_enabled
+);
+
+static struct attribute *lru_gen_attrs[] =3D {
+	&lru_gen_enabled_attr.attr,
+	NULL
+};
+
+static struct attribute_group lru_gen_attr_group =3D {
+	.name =3D "lru_gen",
+	.attrs =3D lru_gen_attrs,
+};
+
 /*************************************************************************=
*****
  *                          initialization
  *************************************************************************=
*****/
@@ -4985,6 +5202,7 @@ void lru_gen_init_lruvec(struct lruvec *lruvec)
 	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
=20
 	lrugen->max_seq =3D MIN_NR_GENS + 1;
+	lrugen->enabled =3D lru_gen_enabled();
=20
 	for_each_gen_type_zone(gen, type, zone)
 		INIT_LIST_HEAD(&lrugen->lists[gen][type][zone]);
@@ -5024,6 +5242,9 @@ static int __init init_lru_gen(void)
 	BUILD_BUG_ON(MIN_NR_GENS + 1 >=3D MAX_NR_GENS);
 	BUILD_BUG_ON(BIT(LRU_GEN_WIDTH) <=3D MAX_NR_GENS);
=20
+	if (sysfs_create_group(mm_kobj, &lru_gen_attr_group))
+		pr_err("lru_gen: failed to create sysfs group\n");
+
 	return 0;
 };
 late_initcall(init_lru_gen);
--=20
2.37.0.rc0.161.g10f37bed90-goog

