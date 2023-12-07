Return-Path: <linux-doc+bounces-4429-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E83EB80912E
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 20:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D3A228173A
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 19:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396144F600;
	Thu,  7 Dec 2023 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMGkl3X/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C38170F;
	Thu,  7 Dec 2023 11:24:08 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d0b2752dc6so11340705ad.3;
        Thu, 07 Dec 2023 11:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701977047; x=1702581847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVsNmgmDnzQDG1/LGV7hJiMxT85AaGwagKzGkmoxER0=;
        b=KMGkl3X/UVu2XBm4Gx9C18573GfpCqV20KZTD5hyTDTRTSD4xv/SSedprcy6yxep6k
         GnlbO4hccJ++eMLo+UOKtBcnHy1X9G4pUvcUJqzOjwV6fZuuT5VE2Mzn61zPRAkhktAk
         2mZ+e2yX1dCsomRMaZehTQPklY40tWI5f/PiH2/yo5ZsMm03HrPvLoj84ihd1/W/EXqL
         gsD4uaHAFYHNHN4958bCZJEt6raPADNavSGLfOqn53NWdrk6q+NmypwznPLXzP5Bgm9z
         mNDhM82x9xQ5e7AmrmRwCfEUMo2MvJqfEu1ADdINf1rJ0HB0kokSe4fP92Lpbnezo0Q0
         cY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701977047; x=1702581847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVsNmgmDnzQDG1/LGV7hJiMxT85AaGwagKzGkmoxER0=;
        b=g/hjal4pSnfFqKNbZM0wbKI5h5bAMlzGI3gSVEDo3pGW9sWM+FTSgQ/qH4UGwFewnR
         wR+g/UHUdFJ7rUysUxjl3jZQDYQQekCi1E/YrWUwUI5LUahC8EwtpBe8AQGWQJDKI/to
         vFJcCtAaPIrI/mvNpMcsQluQIaaHpEjaxzeesueKFxBdIGJnv2lMVeiRTXmMhLjOGKZP
         +opNKj3Eyf5J9FAgYtKo6Fc5qOxe0GJyChXk77MYMIM+Jb49HYAcRLKahTGwJMfDn65h
         MQZepO1uKEdQRQyebixGuRWt61EreRbLyKnDh9j/8GoLooH77tPaO5B0GI3efwxEqR/i
         RTTw==
X-Gm-Message-State: AOJu0YysyxmyvQWr5lLjZuGqPMDqcVW0OZrW+HbV7VZh7LUvSAKFjQEJ
	KK6wIvHJqlP6NRAbVcNf6ws=
X-Google-Smtp-Source: AGHT+IGUaegnoMWjY0e1XMRMVTrS0hgGoykO4U6+h1XcID6tzuveB11DDmljtRl89bro9Ih1KOiCfw==
X-Received: by 2002:a17:902:d2cd:b0:1d0:6ffd:9e22 with SMTP id n13-20020a170902d2cd00b001d06ffd9e22mr3389722plc.116.1701977047355;
        Thu, 07 Dec 2023 11:24:07 -0800 (PST)
Received: from localhost (fwdproxy-prn-112.fbsv.net. [2a03:2880:ff:70::face:b00c])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001d077c9a9acsm164633plh.185.2023.12.07.11.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 11:24:07 -0800 (PST)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: tj@kernel.org,
	lizefan.x@bytedance.com,
	hannes@cmpxchg.org,
	cerasuolodomenico@gmail.com,
	yosryahmed@google.com,
	sjenning@redhat.com,
	ddstreet@ieee.org,
	vitaly.wool@konsulko.com,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeelb@google.com,
	muchun.song@linux.dev,
	hughd@google.com,
	corbet@lwn.net,
	konrad.wilk@oracle.com,
	senozhatsky@chromium.org,
	rppt@kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	david@ixit.cz,
	chrisl@kernel.org
Subject: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
Date: Thu,  7 Dec 2023 11:24:06 -0800
Message-Id: <20231207192406.3809579-1-nphamcs@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During our experiment with zswap, we sometimes observe swap IOs due to
occasional zswap store failures and writebacks-to-swap. These swapping
IOs prevent many users who cannot tolerate swapping from adopting zswap
to save memory and improve performance where possible.

This patch adds the option to disable this behavior entirely: do not
writeback to backing swapping device when a zswap store attempt fail,
and do not write pages in the zswap pool back to the backing swap
device (both when the pool is full, and when the new zswap shrinker is
called).

This new behavior can be opted-in/out on a per-cgroup basis via a new
cgroup file. By default, writebacks to swap device is enabled, which is
the previous behavior. Initially, writeback is enabled for the root
cgroup, and a newly created cgroup will inherit the current setting of
its parent.

Note that this is subtly different from setting memory.swap.max to 0, as
it still allows for pages to be stored in the zswap pool (which itself
consumes swap space in its current form).

This patch should be applied on top of the zswap shrinker series:

https://lore.kernel.org/linux-mm/20231130194023.4102148-1-nphamcs@gmail.com/

as it also disables the zswap shrinker, a major source of zswap
writebacks.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
Reviewed-by: Yosry Ahmed <yosryahmed@google.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 12 ++++++++
 Documentation/admin-guide/mm/zswap.rst  |  6 ++++
 include/linux/memcontrol.h              | 12 ++++++++
 include/linux/zswap.h                   |  6 ++++
 mm/memcontrol.c                         | 38 +++++++++++++++++++++++++
 mm/page_io.c                            |  6 ++++
 mm/shmem.c                              |  3 +-
 mm/zswap.c                              | 13 +++++++--
 8 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 3f85254f3cef..2b4ac43efdc8 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1679,6 +1679,18 @@ PAGE_SIZE multiple when read back.
 	limit, it will refuse to take any more stores before existing
 	entries fault back in or are written out to disk.
 
+  memory.zswap.writeback
+	A read-write single value file. The default value is "1". The
+	initial value of the root cgroup is 1, and when a new cgroup is
+	created, it inherits the current value of its parent.
+
+	When this is set to 0, all swapping attempts to swapping devices
+	are disabled. This included both zswap writebacks, and swapping due
+	to zswap store failure.
+
+	Note that this is subtly different from setting memory.swap.max to
+	0, as it still allows for pages to be written to the zswap pool.
+
   memory.pressure
 	A read-only nested-keyed file.
 
diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin-guide/mm/zswap.rst
index 62fc244ec702..cfa653130346 100644
--- a/Documentation/admin-guide/mm/zswap.rst
+++ b/Documentation/admin-guide/mm/zswap.rst
@@ -153,6 +153,12 @@ attribute, e. g.::
 
 Setting this parameter to 100 will disable the hysteresis.
 
+Some users cannot tolerate the swapping that comes with zswap store failures
+and zswap writebacks. Swapping can be disabled entirely (without disabling
+zswap itself) on a cgroup-basis as follows:
+
+	echo 0 > /sys/fs/cgroup/<cgroup-name>/memory.zswap.writeback
+
 When there is a sizable amount of cold memory residing in the zswap pool, it
 can be advantageous to proactively write these cold pages to swap and reclaim
 the memory for other use cases. By default, the zswap shrinker is disabled.
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 43b77363ab8e..5de775e6cdd9 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -219,6 +219,12 @@ struct mem_cgroup {
 
 #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 	unsigned long zswap_max;
+
+	/*
+	 * Prevent pages from this memcg from being written back from zswap to
+	 * swap, and from being swapped out on zswap store failures.
+	 */
+	bool zswap_writeback;
 #endif
 
 	unsigned long soft_limit;
@@ -1941,6 +1947,7 @@ static inline void count_objcg_event(struct obj_cgroup *objcg,
 bool obj_cgroup_may_zswap(struct obj_cgroup *objcg);
 void obj_cgroup_charge_zswap(struct obj_cgroup *objcg, size_t size);
 void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size);
+bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg);
 #else
 static inline bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
 {
@@ -1954,6 +1961,11 @@ static inline void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg,
 					     size_t size)
 {
 }
+static inline bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg)
+{
+	/* if zswap is disabled, do not block pages going to the swapping device */
+	return true;
+}
 #endif
 
 #endif /* _LINUX_MEMCONTROL_H */
diff --git a/include/linux/zswap.h b/include/linux/zswap.h
index 08c240e16a01..a78ceaf3a65e 100644
--- a/include/linux/zswap.h
+++ b/include/linux/zswap.h
@@ -35,6 +35,7 @@ void zswap_swapoff(int type);
 void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg);
 void zswap_lruvec_state_init(struct lruvec *lruvec);
 void zswap_page_swapin(struct page *page);
+bool is_zswap_enabled(void);
 #else
 
 struct zswap_lruvec_state {};
@@ -55,6 +56,11 @@ static inline void zswap_swapoff(int type) {}
 static inline void zswap_memcg_offline_cleanup(struct mem_cgroup *memcg) {}
 static inline void zswap_lruvec_state_init(struct lruvec *lruvec) {}
 static inline void zswap_page_swapin(struct page *page) {}
+
+static inline bool is_zswap_enabled(void)
+{
+	return false;
+}
 #endif
 
 #endif /* _LINUX_ZSWAP_H */
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index d7bc47316acb..ae8c62c7aa53 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5538,6 +5538,8 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
 	WRITE_ONCE(memcg->soft_limit, PAGE_COUNTER_MAX);
 #if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 	memcg->zswap_max = PAGE_COUNTER_MAX;
+	WRITE_ONCE(memcg->zswap_writeback,
+		!parent || READ_ONCE(parent->zswap_writeback));
 #endif
 	page_counter_set_high(&memcg->swap, PAGE_COUNTER_MAX);
 	if (parent) {
@@ -8174,6 +8176,12 @@ void obj_cgroup_uncharge_zswap(struct obj_cgroup *objcg, size_t size)
 	rcu_read_unlock();
 }
 
+bool mem_cgroup_zswap_writeback_enabled(struct mem_cgroup *memcg)
+{
+	/* if zswap is disabled, do not block pages going to the swapping device */
+	return !is_zswap_enabled() || !memcg || READ_ONCE(memcg->zswap_writeback);
+}
+
 static u64 zswap_current_read(struct cgroup_subsys_state *css,
 			      struct cftype *cft)
 {
@@ -8206,6 +8214,31 @@ static ssize_t zswap_max_write(struct kernfs_open_file *of,
 	return nbytes;
 }
 
+static int zswap_writeback_show(struct seq_file *m, void *v)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
+
+	seq_printf(m, "%d\n", READ_ONCE(memcg->zswap_writeback));
+	return 0;
+}
+
+static ssize_t zswap_writeback_write(struct kernfs_open_file *of,
+				char *buf, size_t nbytes, loff_t off)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
+	int zswap_writeback;
+	ssize_t parse_ret = kstrtoint(strstrip(buf), 0, &zswap_writeback);
+
+	if (parse_ret)
+		return parse_ret;
+
+	if (zswap_writeback != 0 && zswap_writeback != 1)
+		return -EINVAL;
+
+	WRITE_ONCE(memcg->zswap_writeback, zswap_writeback);
+	return nbytes;
+}
+
 static struct cftype zswap_files[] = {
 	{
 		.name = "zswap.current",
@@ -8218,6 +8251,11 @@ static struct cftype zswap_files[] = {
 		.seq_show = zswap_max_show,
 		.write = zswap_max_write,
 	},
+	{
+		.name = "zswap.writeback",
+		.seq_show = zswap_writeback_show,
+		.write = zswap_writeback_write,
+	},
 	{ }	/* terminate */
 };
 #endif /* CONFIG_MEMCG_KMEM && CONFIG_ZSWAP */
diff --git a/mm/page_io.c b/mm/page_io.c
index cb559ae324c6..5e606f1aa2f6 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -201,6 +201,12 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
 		folio_end_writeback(folio);
 		return 0;
 	}
+
+	if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio))) {
+		folio_mark_dirty(folio);
+		return AOP_WRITEPAGE_ACTIVATE;
+	}
+
 	__swap_writepage(&folio->page, wbc);
 	return 0;
 }
diff --git a/mm/shmem.c b/mm/shmem.c
index c62f904ba1ca..dd084fbafcf1 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1514,8 +1514,7 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
 
 		mutex_unlock(&shmem_swaplist_mutex);
 		BUG_ON(folio_mapped(folio));
-		swap_writepage(&folio->page, wbc);
-		return 0;
+		return swap_writepage(&folio->page, wbc);
 	}
 
 	mutex_unlock(&shmem_swaplist_mutex);
diff --git a/mm/zswap.c b/mm/zswap.c
index daaa949837f2..7ee54a3d8281 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -153,6 +153,11 @@ static bool zswap_shrinker_enabled = IS_ENABLED(
 		CONFIG_ZSWAP_SHRINKER_DEFAULT_ON);
 module_param_named(shrinker_enabled, zswap_shrinker_enabled, bool, 0644);
 
+bool is_zswap_enabled(void)
+{
+	return zswap_enabled;
+}
+
 /*********************************
 * data structures
 **********************************/
@@ -596,7 +601,8 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 	struct zswap_pool *pool = shrinker->private_data;
 	bool encountered_page_in_swapcache = false;
 
-	if (!zswap_shrinker_enabled) {
+	if (!zswap_shrinker_enabled ||
+			!mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
 		sc->nr_scanned = 0;
 		return SHRINK_STOP;
 	}
@@ -637,7 +643,7 @@ static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
 	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(sc->nid));
 	unsigned long nr_backing, nr_stored, nr_freeable, nr_protected;
 
-	if (!zswap_shrinker_enabled)
+	if (!zswap_shrinker_enabled || !mem_cgroup_zswap_writeback_enabled(memcg))
 		return 0;
 
 #ifdef CONFIG_MEMCG_KMEM
@@ -956,6 +962,9 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 	struct zswap_pool *pool;
 	int nid, shrunk = 0;
 
+	if (!mem_cgroup_zswap_writeback_enabled(memcg))
+		return -EINVAL;
+
 	/*
 	 * Skip zombies because their LRUs are reparented and we would be
 	 * reclaiming from the parent instead of the dead memcg.

base-commit: cdcab2d34f129f593c0afbb2493bcaf41f4acd61
-- 
2.34.1

