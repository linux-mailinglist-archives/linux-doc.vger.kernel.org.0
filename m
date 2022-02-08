Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1DA4AD311
	for <lists+linux-doc@lfdr.de>; Tue,  8 Feb 2022 09:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349347AbiBHIUr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Feb 2022 03:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349210AbiBHITs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 03:19:48 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEC5C03FEE5
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 00:19:43 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id m10-20020a25800a000000b0061daa5b7151so11730422ybk.10
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 00:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=gVDBJVPByyZFfRkdZeqZdQGSh6CIxqnMnG9KKvEiV/c=;
        b=k1U/RnjgN44585TzVZG62xdMrgfViRuIbfO6WMgZwLuBnY0x8i2V2JNe1CSsECYKpK
         tz30HjiqxAf+qea5BIW2tWIMCZFvq2VYri8UeZ8hxC9342EbBvEGx9S/TvlAKIv5xq24
         2KDvJ47TRSND65HiyVnOsQwuCGDopg/ITjzFDCTzywhBsZl53/mrG73AmEXt0/+vBG4J
         PPc9aYlDMPfNehvVFf0t1V/K1TRrDcmEjBh7XCJEvZhTE5Xcpp9qH9ugkqkS0uxqOO1Y
         SZRhev3Q/t8CIj0Rrl+8p5P9L8O03yqHNT12sJLoZ9rTejJhasYfHm+tsABB0IaN5TVS
         x00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=gVDBJVPByyZFfRkdZeqZdQGSh6CIxqnMnG9KKvEiV/c=;
        b=fVCYolpQPqwN/yJO25jqtUXcnmeBF0IE8u75xxXPgP0xXP4+9m3x+4K+i4Ke3hOKB8
         I6bRV6MGHAjbRmQ0M04GE4JAWUVhgBeEPZPz9o1DK5IyzwViJPGigRmnHFSKxSaHdIOk
         Ynucf7MO4umZTDPo2evzKKRvtrwCh/nzG0TN6Kf9fGk1HLYQxVfL456/Cvyf+eMVADWI
         2WtJCWEpKGSC60V1BmvkVoCRUURAac4AxEXIlfzZnnMiUrbQxGVJRW1z+Xw3sTMq3W4w
         zfab3WfuTTzeNHIhPqcKAcrgFhO/RX5COZLO8nYf3R/vPlsnSVfhAn2aIu3Y0BCJWRnj
         E1Jg==
X-Gm-Message-State: AOAM530SDBWjRMqgZJVHdXLXYV3h+L1y6JuxOgA2hbnO0DpVA4dGxlJo
        QlUsLLa3A+z0uJj54hwUX+V0ho8DaUk=
X-Google-Smtp-Source: ABdhPJyRJk0zUVFbCuheK6c3zFAW71cRLkVYYk5Y8XPIie+grNHVrWIDVQQkaJ5VoRWIV5iF2z3B9FvjT38=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:5f31:19c3:21f5:7300])
 (user=yuzhao job=sendgmr) by 2002:a81:b54a:: with SMTP id c10mr3609142ywk.283.1644308382745;
 Tue, 08 Feb 2022 00:19:42 -0800 (PST)
Date:   Tue,  8 Feb 2022 01:19:01 -0700
In-Reply-To: <20220208081902.3550911-1-yuzhao@google.com>
Message-Id: <20220208081902.3550911-12-yuzhao@google.com>
Mime-Version: 1.0
References: <20220208081902.3550911-1-yuzhao@google.com>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH v7 11/12] mm: multigenerational LRU: debugfs interface
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michael Larabel <Michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Yu Zhao <yuzhao@google.com>, Brian Geffon <bgeffon@google.com>,
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
        Sofia Trinh <sofia.trinh@edi.works>
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

Add /sys/kernel/debug/lru_gen for working set estimation and proactive
reclaim. These features are required to optimize job scheduling (bin
packing) in data centers [1][2].

Compared with the page table-based approach and the PFN-based
approach, e.g., mm/damon/[vp]addr.c, this lruvec-based approach has
the following advantages:
1) It offers better choices because it's aware of memcgs, NUMA nodes,
   shared mappings and unmapped page cache.
2) It's more scalable because it's O(nr_hot_pages), whereas the
   PFN-based approach is O(nr_total_pages).

Add /sys/kernel/debug/lru_gen_full for debugging.

[1] https://research.google/pubs/pub48551/
[2] https://www.cs.cmu.edu/~dskarlat/publications/tmo_asplos22.pdf

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
---
 include/linux/nodemask.h |   1 +
 mm/vmscan.c              | 353 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 354 insertions(+)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 567c3ddba2c4..90840c459abc 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -486,6 +486,7 @@ static inline int num_node_state(enum node_states state=
)
 #define first_online_node	0
 #define first_memory_node	0
 #define next_online_node(nid)	(MAX_NUMNODES)
+#define next_memory_node(nid)	(MAX_NUMNODES)
 #define nr_node_ids		1U
 #define nr_online_nodes		1U
=20
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 4d37d63668b5..3dfa938a4c4a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -52,6 +52,8 @@
 #include <linux/psi.h>
 #include <linux/pagewalk.h>
 #include <linux/shmem_fs.h>
+#include <linux/ctype.h>
+#include <linux/debugfs.h>
=20
 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -5220,6 +5222,354 @@ static struct attribute_group lru_gen_attr_group =
=3D {
 	.attrs =3D lru_gen_attrs,
 };
=20
+/*************************************************************************=
*****
+ *                          debugfs interface
+ *************************************************************************=
*****/
+
+static void *lru_gen_seq_start(struct seq_file *m, loff_t *pos)
+{
+	struct mem_cgroup *memcg;
+	loff_t nr_to_skip =3D *pos;
+
+	m->private =3D kvmalloc(PATH_MAX, GFP_KERNEL);
+	if (!m->private)
+		return ERR_PTR(-ENOMEM);
+
+	memcg =3D mem_cgroup_iter(NULL, NULL, NULL);
+	do {
+		int nid;
+
+		for_each_node_state(nid, N_MEMORY) {
+			if (!nr_to_skip--)
+				return get_lruvec(memcg, nid);
+		}
+	} while ((memcg =3D mem_cgroup_iter(NULL, memcg, NULL)));
+
+	return NULL;
+}
+
+static void lru_gen_seq_stop(struct seq_file *m, void *v)
+{
+	if (!IS_ERR_OR_NULL(v))
+		mem_cgroup_iter_break(NULL, lruvec_memcg(v));
+
+	kvfree(m->private);
+	m->private =3D NULL;
+}
+
+static void *lru_gen_seq_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	int nid =3D lruvec_pgdat(v)->node_id;
+	struct mem_cgroup *memcg =3D lruvec_memcg(v);
+
+	++*pos;
+
+	nid =3D next_memory_node(nid);
+	if (nid =3D=3D MAX_NUMNODES) {
+		memcg =3D mem_cgroup_iter(NULL, memcg, NULL);
+		if (!memcg)
+			return NULL;
+
+		nid =3D first_memory_node;
+	}
+
+	return get_lruvec(memcg, nid);
+}
+
+static void lru_gen_seq_show_full(struct seq_file *m, struct lruvec *lruve=
c,
+				  unsigned long max_seq, unsigned long *min_seq,
+				  unsigned long seq)
+{
+	int i;
+	int type, tier;
+	int hist =3D lru_hist_from_seq(seq);
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+
+	for (tier =3D 0; tier < MAX_NR_TIERS; tier++) {
+		seq_printf(m, "            %10d", tier);
+		for (type =3D 0; type < ANON_AND_FILE; type++) {
+			unsigned long n[3] =3D {};
+
+			if (seq =3D=3D max_seq) {
+				n[0] =3D READ_ONCE(lrugen->avg_refaulted[type][tier]);
+				n[1] =3D READ_ONCE(lrugen->avg_total[type][tier]);
+
+				seq_printf(m, " %10luR %10luT %10lu ", n[0], n[1], n[2]);
+			} else if (seq =3D=3D min_seq[type] || NR_HIST_GENS > 1) {
+				n[0] =3D atomic_long_read(&lrugen->refaulted[hist][type][tier]);
+				n[1] =3D atomic_long_read(&lrugen->evicted[hist][type][tier]);
+				if (tier)
+					n[2] =3D READ_ONCE(lrugen->promoted[hist][type][tier - 1]);
+
+				seq_printf(m, " %10lur %10lue %10lup", n[0], n[1], n[2]);
+			} else
+				seq_puts(m, "          0           0           0 ");
+		}
+		seq_putc(m, '\n');
+	}
+
+	seq_puts(m, "                      ");
+	for (i =3D 0; i < NR_MM_STATS; i++) {
+		if (seq =3D=3D max_seq && NR_HIST_GENS =3D=3D 1)
+			seq_printf(m, " %10lu%c", READ_ONCE(lruvec->mm_state.stats[hist][i]),
+				   toupper(MM_STAT_CODES[i]));
+		else if (seq !=3D max_seq && NR_HIST_GENS > 1)
+			seq_printf(m, " %10lu%c", READ_ONCE(lruvec->mm_state.stats[hist][i]),
+				   MM_STAT_CODES[i]);
+		else
+			seq_puts(m, "          0 ");
+	}
+	seq_putc(m, '\n');
+}
+
+static int lru_gen_seq_show(struct seq_file *m, void *v)
+{
+	unsigned long seq;
+	bool full =3D !debugfs_real_fops(m->file)->write;
+	struct lruvec *lruvec =3D v;
+	struct lru_gen_struct *lrugen =3D &lruvec->lrugen;
+	int nid =3D lruvec_pgdat(lruvec)->node_id;
+	struct mem_cgroup *memcg =3D lruvec_memcg(lruvec);
+	DEFINE_MAX_SEQ(lruvec);
+	DEFINE_MIN_SEQ(lruvec);
+
+	if (nid =3D=3D first_memory_node) {
+		const char *path =3D memcg ? m->private : "";
+
+#ifdef CONFIG_MEMCG
+		if (memcg)
+			cgroup_path(memcg->css.cgroup, m->private, PATH_MAX);
+#endif
+		seq_printf(m, "memcg %5hu %s\n", mem_cgroup_id(memcg), path);
+	}
+
+	seq_printf(m, " node %5d\n", nid);
+
+	if (!full)
+		seq =3D min_seq[TYPE_ANON];
+	else if (max_seq >=3D MAX_NR_GENS)
+		seq =3D max_seq - MAX_NR_GENS + 1;
+	else
+		seq =3D 0;
+
+	for (; seq <=3D max_seq; seq++) {
+		int gen, type, zone;
+		unsigned int msecs;
+
+		gen =3D lru_gen_from_seq(seq);
+		msecs =3D jiffies_to_msecs(jiffies - READ_ONCE(lrugen->timestamps[gen]))=
;
+
+		seq_printf(m, " %10lu %10u", seq, msecs);
+
+		for (type =3D 0; type < ANON_AND_FILE; type++) {
+			long size =3D 0;
+
+			if (seq < min_seq[type]) {
+				seq_puts(m, "         -0 ");
+				continue;
+			}
+
+			for (zone =3D 0; zone < MAX_NR_ZONES; zone++)
+				size +=3D READ_ONCE(lrugen->nr_pages[gen][type][zone]);
+
+			seq_printf(m, " %10lu ", max(size, 0L));
+		}
+
+		seq_putc(m, '\n');
+
+		if (full)
+			lru_gen_seq_show_full(m, lruvec, max_seq, min_seq, seq);
+	}
+
+	return 0;
+}
+
+static const struct seq_operations lru_gen_seq_ops =3D {
+	.start =3D lru_gen_seq_start,
+	.stop =3D lru_gen_seq_stop,
+	.next =3D lru_gen_seq_next,
+	.show =3D lru_gen_seq_show,
+};
+
+static int run_aging(struct lruvec *lruvec, unsigned long seq, struct scan=
_control *sc,
+		     bool can_swap, bool full_scan)
+{
+	DEFINE_MAX_SEQ(lruvec);
+
+	if (seq =3D=3D max_seq)
+		try_to_inc_max_seq(lruvec, max_seq, sc, can_swap, full_scan);
+
+	return seq > max_seq ? -EINVAL : 0;
+}
+
+static int run_eviction(struct lruvec *lruvec, unsigned long seq, struct s=
can_control *sc,
+			int swappiness, unsigned long nr_to_reclaim)
+{
+	struct blk_plug plug;
+	int err =3D -EINTR;
+	DEFINE_MAX_SEQ(lruvec);
+
+	if (max_seq < seq + MIN_NR_GENS)
+		return -EINVAL;
+
+	sc->nr_reclaimed =3D 0;
+
+	blk_start_plug(&plug);
+
+	while (!signal_pending(current)) {
+		DEFINE_MIN_SEQ(lruvec);
+
+		if (seq < min_seq[!swappiness] || sc->nr_reclaimed >=3D nr_to_reclaim ||
+		    !evict_folios(lruvec, sc, swappiness, NULL)) {
+			err =3D 0;
+			break;
+		}
+
+		cond_resched();
+	}
+
+	blk_finish_plug(&plug);
+
+	return err;
+}
+
+static int run_cmd(char cmd, int memcg_id, int nid, unsigned long seq,
+		   struct scan_control *sc, int swappiness, unsigned long opt)
+{
+	struct lruvec *lruvec;
+	int err =3D -EINVAL;
+	struct mem_cgroup *memcg =3D NULL;
+
+	if (!mem_cgroup_disabled()) {
+		rcu_read_lock();
+		memcg =3D mem_cgroup_from_id(memcg_id);
+#ifdef CONFIG_MEMCG
+		if (memcg && !css_tryget(&memcg->css))
+			memcg =3D NULL;
+#endif
+		rcu_read_unlock();
+
+		if (!memcg)
+			goto done;
+	}
+	if (memcg_id !=3D mem_cgroup_id(memcg))
+		goto done;
+
+	if (nid < 0 || nid >=3D MAX_NUMNODES || !node_state(nid, N_MEMORY))
+		goto done;
+
+	lruvec =3D get_lruvec(memcg, nid);
+
+	if (swappiness < 0)
+		swappiness =3D get_swappiness(memcg);
+	else if (swappiness > 200)
+		goto done;
+
+	switch (cmd) {
+	case '+':
+		err =3D run_aging(lruvec, seq, sc, swappiness, opt);
+		break;
+	case '-':
+		err =3D run_eviction(lruvec, seq, sc, swappiness, opt);
+		break;
+	}
+done:
+	mem_cgroup_put(memcg);
+
+	return err;
+}
+
+static ssize_t lru_gen_seq_write(struct file *file, const char __user *src=
,
+				 size_t len, loff_t *pos)
+{
+	void *buf;
+	char *cur, *next;
+	unsigned int flags;
+	int err =3D 0;
+	struct scan_control sc =3D {
+		.may_writepage =3D true,
+		.may_unmap =3D true,
+		.may_swap =3D true,
+		.reclaim_idx =3D MAX_NR_ZONES - 1,
+		.gfp_mask =3D GFP_KERNEL,
+	};
+
+	buf =3D kvmalloc(len + 1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	if (copy_from_user(buf, src, len)) {
+		kvfree(buf);
+		return -EFAULT;
+	}
+
+	next =3D buf;
+	next[len] =3D '\0';
+
+	sc.reclaim_state.mm_walk =3D alloc_mm_walk();
+	if (!sc.reclaim_state.mm_walk) {
+		kvfree(buf);
+		return -ENOMEM;
+	}
+
+	flags =3D memalloc_noreclaim_save();
+	set_task_reclaim_state(current, &sc.reclaim_state);
+
+	while ((cur =3D strsep(&next, ",;\n"))) {
+		int n;
+		int end;
+		char cmd;
+		unsigned int memcg_id;
+		unsigned int nid;
+		unsigned long seq;
+		unsigned int swappiness =3D -1;
+		unsigned long opt =3D -1;
+
+		cur =3D skip_spaces(cur);
+		if (!*cur)
+			continue;
+
+		n =3D sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
+			   &seq, &end, &swappiness, &end, &opt, &end);
+		if (n < 4 || cur[end]) {
+			err =3D -EINVAL;
+			break;
+		}
+
+		err =3D run_cmd(cmd, memcg_id, nid, seq, &sc, swappiness, opt);
+		if (err)
+			break;
+	}
+
+	set_task_reclaim_state(current, NULL);
+	memalloc_noreclaim_restore(flags);
+
+	free_mm_walk(sc.reclaim_state.mm_walk);
+	kvfree(buf);
+
+	return err ? : len;
+}
+
+static int lru_gen_seq_open(struct inode *inode, struct file *file)
+{
+	return seq_open(file, &lru_gen_seq_ops);
+}
+
+static const struct file_operations lru_gen_rw_fops =3D {
+	.open =3D lru_gen_seq_open,
+	.read =3D seq_read,
+	.write =3D lru_gen_seq_write,
+	.llseek =3D seq_lseek,
+	.release =3D seq_release,
+};
+
+static const struct file_operations lru_gen_ro_fops =3D {
+	.open =3D lru_gen_seq_open,
+	.read =3D seq_read,
+	.llseek =3D seq_lseek,
+	.release =3D seq_release,
+};
+
 /*************************************************************************=
*****
  *                          initialization
  *************************************************************************=
*****/
@@ -5289,6 +5639,9 @@ static int __init init_lru_gen(void)
 	if (sysfs_create_group(mm_kobj, &lru_gen_attr_group))
 		pr_err("lru_gen: failed to create sysfs group\n");
=20
+	debugfs_create_file("lru_gen", 0644, NULL, NULL, &lru_gen_rw_fops);
+	debugfs_create_file("lru_gen_full", 0444, NULL, NULL, &lru_gen_ro_fops);
+
 	return 0;
 };
 late_initcall(init_lru_gen);
--=20
2.35.0.263.gb82422642f-goog

