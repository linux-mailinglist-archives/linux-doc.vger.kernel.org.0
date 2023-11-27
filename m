Return-Path: <linux-doc+bounces-3204-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D17FAA5D
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 20:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E34D82819D3
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 19:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D233FE24;
	Mon, 27 Nov 2023 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FizkRIDn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE60010E6;
	Mon, 27 Nov 2023 11:37:05 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6c3363a2b93so4359515b3a.3;
        Mon, 27 Nov 2023 11:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701113825; x=1701718625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2o+b0lga7F1iFKAolLKeFbumONlFF0UNEMGkNVQOs0=;
        b=FizkRIDnmHyJ79vrGqV3LZuJ8faKTnzOiWXng6i3nux3yIJ6ep7yJYIHLdkqOzrBr9
         I6VEgFrR8Woa0LFkCc58RStvypkOC0Cb7DGVI6AbtWSiGO+81mSXZ9sEoAcPnrpj+cx0
         V0BKk/ozQxcByD5B4hQC31cV4208se2w+wKCnykVVf3/jjKBNQpiixH6XP7qqwf6bRiC
         mhH48xWOvjHV4X4KJ3sxt7jy4//j9qhqtQrDWTZHHldQQglolWSGFDNw2Bl8jEfISZsk
         N0DEtDhM9IUwmt5ChL+sa89upXZdi4mwxb+dWyH/hPgfEeLS7Cn/k96/kPA1AQnnJUyK
         Flew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701113825; x=1701718625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2o+b0lga7F1iFKAolLKeFbumONlFF0UNEMGkNVQOs0=;
        b=C096/4ZE8UGnbPNEgYvJzU0pfBEOFiU2u/PQOFHiZ3DIYqqpfXoYmu7nLckbpA+EnS
         7+yBx+ADHir6YhRYDATSrPpOhkPTsZm3QUtXfCrgXVUzfULue58sdaRomrk0B7L0k7cO
         SZE5fOzsErQMHLOlbpBdIQYXSV46iYpjVyGbFJD9pxxC7tdnQUyozNwONEplAaTPp0Sx
         4OFXuJhctkV2sU0nrKz177zPuZ/YtyRtud1hH0zOhJ5FgxS11ZOA3E5AOLMLrmJXreQz
         Na4oIVrwc6z0Hlcb0s5QJlCUc9n+qV61y7JxL+gHsW/rWCvfyajMSr9nZTaojLQ6NEWo
         Jpzg==
X-Gm-Message-State: AOJu0YyAbmy4GlEWJovljR2ZQOFo+eIDRFePNWV0Z+pGMQCZw5kLfaAp
	CAwtH9WlCEoyNkI7+dFBbFo=
X-Google-Smtp-Source: AGHT+IG/uwQaoZ4e4LvCxtlUeF1P7ML/roZ5Q6yMqYjZkWur02QHJTY2f52zz1gH5lw2ENGG13bhSQ==
X-Received: by 2002:a05:6a00:1990:b0:6cb:911b:8000 with SMTP id d16-20020a056a00199000b006cb911b8000mr15049485pfl.28.1701113825034;
        Mon, 27 Nov 2023 11:37:05 -0800 (PST)
Received: from localhost (fwdproxy-prn-005.fbsv.net. [2a03:2880:ff:5::face:b00c])
        by smtp.gmail.com with ESMTPSA id r27-20020aa78b9b000000b006cb6fee548esm7768292pfd.91.2023.11.27.11.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 11:37:04 -0800 (PST)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	cerasuolodomenico@gmail.com,
	yosryahmed@google.com,
	sjenning@redhat.com,
	ddstreet@ieee.org,
	vitaly.wool@konsulko.com,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeelb@google.com,
	muchun.song@linux.dev,
	chrisl@kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Subject: [PATCH v6 1/6] list_lru: allows explicit memcg and NUMA node selection
Date: Mon, 27 Nov 2023 11:36:58 -0800
Message-Id: <20231127193703.1980089-2-nphamcs@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127193703.1980089-1-nphamcs@gmail.com>
References: <20231127193703.1980089-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interface of list_lru is based on the assumption that the list node
and the data it represents belong to the same allocated on the correct
node/memcg. While this assumption is valid for existing slab objects LRU
such as dentries and inodes, it is undocumented, and rather inflexible
for certain potential list_lru users (such as the upcoming zswap
shrinker and the THP shrinker). It has caused us a lot of issues during
our development.

This patch changes list_lru interface so that the caller must explicitly
specify numa node and memcg when adding and removing objects. The old
list_lru_add() and list_lru_del() are renamed to list_lru_add_obj() and
list_lru_del_obj(), respectively.

It also extends the list_lru API with a new function, list_lru_putback,
which undoes a previous list_lru_isolate call. Unlike list_lru_add, it
does not increment the LRU node count (as list_lru_isolate does not
decrement the node count). list_lru_putback also allows for explicit
memcg and NUMA node selection.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 drivers/android/binder_alloc.c |  5 ++--
 fs/dcache.c                    |  8 +++--
 fs/gfs2/quota.c                |  6 ++--
 fs/inode.c                     |  4 +--
 fs/nfs/nfs42xattr.c            |  8 ++---
 fs/nfsd/filecache.c            |  4 +--
 fs/xfs/xfs_buf.c               |  6 ++--
 fs/xfs/xfs_dquot.c             |  2 +-
 fs/xfs/xfs_qm.c                |  2 +-
 include/linux/list_lru.h       | 54 ++++++++++++++++++++++++++++++++--
 mm/list_lru.c                  | 48 +++++++++++++++++++++++++-----
 mm/workingset.c                |  4 +--
 12 files changed, 116 insertions(+), 35 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index 138f6d43d13b..e80669d4e037 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -285,7 +285,7 @@ static int binder_update_page_range(struct binder_alloc *alloc, int allocate,
 
 		trace_binder_free_lru_start(alloc, index);
 
-		ret = list_lru_add(&binder_alloc_lru, &page->lru);
+		ret = list_lru_add_obj(&binder_alloc_lru, &page->lru);
 		WARN_ON(!ret);
 
 		trace_binder_free_lru_end(alloc, index);
@@ -848,7 +848,7 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
 			if (!alloc->pages[i].page_ptr)
 				continue;
 
-			on_lru = list_lru_del(&binder_alloc_lru,
+			on_lru = list_lru_del_obj(&binder_alloc_lru,
 					      &alloc->pages[i].lru);
 			page_addr = alloc->buffer + i * PAGE_SIZE;
 			binder_alloc_debug(BINDER_DEBUG_BUFFER_ALLOC,
@@ -1287,4 +1287,3 @@ int binder_alloc_copy_from_buffer(struct binder_alloc *alloc,
 	return binder_alloc_do_buffer_copy(alloc, false, buffer, buffer_offset,
 					   dest, bytes);
 }
-
diff --git a/fs/dcache.c b/fs/dcache.c
index c82ae731df9a..2ba37643b9c5 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -428,7 +428,8 @@ static void d_lru_add(struct dentry *dentry)
 	this_cpu_inc(nr_dentry_unused);
 	if (d_is_negative(dentry))
 		this_cpu_inc(nr_dentry_negative);
-	WARN_ON_ONCE(!list_lru_add(&dentry->d_sb->s_dentry_lru, &dentry->d_lru));
+	WARN_ON_ONCE(!list_lru_add_obj(
+			&dentry->d_sb->s_dentry_lru, &dentry->d_lru));
 }
 
 static void d_lru_del(struct dentry *dentry)
@@ -438,7 +439,8 @@ static void d_lru_del(struct dentry *dentry)
 	this_cpu_dec(nr_dentry_unused);
 	if (d_is_negative(dentry))
 		this_cpu_dec(nr_dentry_negative);
-	WARN_ON_ONCE(!list_lru_del(&dentry->d_sb->s_dentry_lru, &dentry->d_lru));
+	WARN_ON_ONCE(!list_lru_del_obj(
+			&dentry->d_sb->s_dentry_lru, &dentry->d_lru));
 }
 
 static void d_shrink_del(struct dentry *dentry)
@@ -1240,7 +1242,7 @@ static enum lru_status dentry_lru_isolate(struct list_head *item,
 		 *
 		 * This is guaranteed by the fact that all LRU management
 		 * functions are intermediated by the LRU API calls like
-		 * list_lru_add and list_lru_del. List movement in this file
+		 * list_lru_add_obj and list_lru_del_obj. List movement in this file
 		 * only ever occur through this functions or through callbacks
 		 * like this one, that are called from the LRU API.
 		 *
diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 95dae7838b4e..b57f8c7b35be 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -271,7 +271,7 @@ static struct gfs2_quota_data *gfs2_qd_search_bucket(unsigned int hash,
 		if (qd->qd_sbd != sdp)
 			continue;
 		if (lockref_get_not_dead(&qd->qd_lockref)) {
-			list_lru_del(&gfs2_qd_lru, &qd->qd_lru);
+			list_lru_del_obj(&gfs2_qd_lru, &qd->qd_lru);
 			return qd;
 		}
 	}
@@ -344,7 +344,7 @@ static void qd_put(struct gfs2_quota_data *qd)
 	}
 
 	qd->qd_lockref.count = 0;
-	list_lru_add(&gfs2_qd_lru, &qd->qd_lru);
+	list_lru_add_obj(&gfs2_qd_lru, &qd->qd_lru);
 	spin_unlock(&qd->qd_lockref.lock);
 }
 
@@ -1517,7 +1517,7 @@ void gfs2_quota_cleanup(struct gfs2_sbd *sdp)
 		lockref_mark_dead(&qd->qd_lockref);
 		spin_unlock(&qd->qd_lockref.lock);
 
-		list_lru_del(&gfs2_qd_lru, &qd->qd_lru);
+		list_lru_del_obj(&gfs2_qd_lru, &qd->qd_lru);
 		list_add(&qd->qd_lru, &dispose);
 	}
 	spin_unlock(&qd_lock);
diff --git a/fs/inode.c b/fs/inode.c
index f238d987dec9..ef2034a985e0 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -464,7 +464,7 @@ static void __inode_add_lru(struct inode *inode, bool rotate)
 	if (!mapping_shrinkable(&inode->i_data))
 		return;
 
-	if (list_lru_add(&inode->i_sb->s_inode_lru, &inode->i_lru))
+	if (list_lru_add_obj(&inode->i_sb->s_inode_lru, &inode->i_lru))
 		this_cpu_inc(nr_unused);
 	else if (rotate)
 		inode->i_state |= I_REFERENCED;
@@ -482,7 +482,7 @@ void inode_add_lru(struct inode *inode)
 
 static void inode_lru_list_del(struct inode *inode)
 {
-	if (list_lru_del(&inode->i_sb->s_inode_lru, &inode->i_lru))
+	if (list_lru_del_obj(&inode->i_sb->s_inode_lru, &inode->i_lru))
 		this_cpu_dec(nr_unused);
 }
 
diff --git a/fs/nfs/nfs42xattr.c b/fs/nfs/nfs42xattr.c
index 2ad66a8922f4..49aaf28a6950 100644
--- a/fs/nfs/nfs42xattr.c
+++ b/fs/nfs/nfs42xattr.c
@@ -132,7 +132,7 @@ nfs4_xattr_entry_lru_add(struct nfs4_xattr_entry *entry)
 	lru = (entry->flags & NFS4_XATTR_ENTRY_EXTVAL) ?
 	    &nfs4_xattr_large_entry_lru : &nfs4_xattr_entry_lru;
 
-	return list_lru_add(lru, &entry->lru);
+	return list_lru_add_obj(lru, &entry->lru);
 }
 
 static bool
@@ -143,7 +143,7 @@ nfs4_xattr_entry_lru_del(struct nfs4_xattr_entry *entry)
 	lru = (entry->flags & NFS4_XATTR_ENTRY_EXTVAL) ?
 	    &nfs4_xattr_large_entry_lru : &nfs4_xattr_entry_lru;
 
-	return list_lru_del(lru, &entry->lru);
+	return list_lru_del_obj(lru, &entry->lru);
 }
 
 /*
@@ -349,7 +349,7 @@ nfs4_xattr_cache_unlink(struct inode *inode)
 
 	oldcache = nfsi->xattr_cache;
 	if (oldcache != NULL) {
-		list_lru_del(&nfs4_xattr_cache_lru, &oldcache->lru);
+		list_lru_del_obj(&nfs4_xattr_cache_lru, &oldcache->lru);
 		oldcache->inode = NULL;
 	}
 	nfsi->xattr_cache = NULL;
@@ -474,7 +474,7 @@ nfs4_xattr_get_cache(struct inode *inode, int add)
 			kref_get(&cache->ref);
 			nfsi->xattr_cache = cache;
 			cache->inode = inode;
-			list_lru_add(&nfs4_xattr_cache_lru, &cache->lru);
+			list_lru_add_obj(&nfs4_xattr_cache_lru, &cache->lru);
 		}
 
 		spin_unlock(&inode->i_lock);
diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
index ef063f93fde9..6c2decfdeb4b 100644
--- a/fs/nfsd/filecache.c
+++ b/fs/nfsd/filecache.c
@@ -322,7 +322,7 @@ nfsd_file_check_writeback(struct nfsd_file *nf)
 static bool nfsd_file_lru_add(struct nfsd_file *nf)
 {
 	set_bit(NFSD_FILE_REFERENCED, &nf->nf_flags);
-	if (list_lru_add(&nfsd_file_lru, &nf->nf_lru)) {
+	if (list_lru_add_obj(&nfsd_file_lru, &nf->nf_lru)) {
 		trace_nfsd_file_lru_add(nf);
 		return true;
 	}
@@ -331,7 +331,7 @@ static bool nfsd_file_lru_add(struct nfsd_file *nf)
 
 static bool nfsd_file_lru_remove(struct nfsd_file *nf)
 {
-	if (list_lru_del(&nfsd_file_lru, &nf->nf_lru)) {
+	if (list_lru_del_obj(&nfsd_file_lru, &nf->nf_lru)) {
 		trace_nfsd_file_lru_del(nf);
 		return true;
 	}
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 545c7991b9b5..669332849680 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -169,7 +169,7 @@ xfs_buf_stale(
 
 	atomic_set(&bp->b_lru_ref, 0);
 	if (!(bp->b_state & XFS_BSTATE_DISPOSE) &&
-	    (list_lru_del(&bp->b_target->bt_lru, &bp->b_lru)))
+	    (list_lru_del_obj(&bp->b_target->bt_lru, &bp->b_lru)))
 		atomic_dec(&bp->b_hold);
 
 	ASSERT(atomic_read(&bp->b_hold) >= 1);
@@ -1047,7 +1047,7 @@ xfs_buf_rele(
 		 * buffer for the LRU and clear the (now stale) dispose list
 		 * state flag
 		 */
-		if (list_lru_add(&bp->b_target->bt_lru, &bp->b_lru)) {
+		if (list_lru_add_obj(&bp->b_target->bt_lru, &bp->b_lru)) {
 			bp->b_state &= ~XFS_BSTATE_DISPOSE;
 			atomic_inc(&bp->b_hold);
 		}
@@ -1060,7 +1060,7 @@ xfs_buf_rele(
 		 * was on was the disposal list
 		 */
 		if (!(bp->b_state & XFS_BSTATE_DISPOSE)) {
-			list_lru_del(&bp->b_target->bt_lru, &bp->b_lru);
+			list_lru_del_obj(&bp->b_target->bt_lru, &bp->b_lru);
 		} else {
 			ASSERT(list_empty(&bp->b_lru));
 		}
diff --git a/fs/xfs/xfs_dquot.c b/fs/xfs/xfs_dquot.c
index ac6ba646624d..49f619f5aa96 100644
--- a/fs/xfs/xfs_dquot.c
+++ b/fs/xfs/xfs_dquot.c
@@ -1064,7 +1064,7 @@ xfs_qm_dqput(
 		struct xfs_quotainfo	*qi = dqp->q_mount->m_quotainfo;
 		trace_xfs_dqput_free(dqp);
 
-		if (list_lru_add(&qi->qi_lru, &dqp->q_lru))
+		if (list_lru_add_obj(&qi->qi_lru, &dqp->q_lru))
 			XFS_STATS_INC(dqp->q_mount, xs_qm_dquot_unused);
 	}
 	xfs_dqunlock(dqp);
diff --git a/fs/xfs/xfs_qm.c b/fs/xfs/xfs_qm.c
index 94a7932ac570..67d0a8564ff3 100644
--- a/fs/xfs/xfs_qm.c
+++ b/fs/xfs/xfs_qm.c
@@ -171,7 +171,7 @@ xfs_qm_dqpurge(
 	 * hits zero, so it really should be on the freelist here.
 	 */
 	ASSERT(!list_empty(&dqp->q_lru));
-	list_lru_del(&qi->qi_lru, &dqp->q_lru);
+	list_lru_del_obj(&qi->qi_lru, &dqp->q_lru);
 	XFS_STATS_DEC(dqp->q_mount, xs_qm_dquot_unused);
 
 	xfs_qm_dqdestroy(dqp);
diff --git a/include/linux/list_lru.h b/include/linux/list_lru.h
index db86ad78d428..7675a48a0701 100644
--- a/include/linux/list_lru.h
+++ b/include/linux/list_lru.h
@@ -75,6 +75,8 @@ void memcg_reparent_list_lrus(struct mem_cgroup *memcg, struct mem_cgroup *paren
  * list_lru_add: add an element to the lru list's tail
  * @lru: the lru pointer
  * @item: the item to be added.
+ * @nid: the node id of the sublist to add the item to.
+ * @memcg: the cgroup of the sublist to add the item to.
  *
  * If the element is already part of a list, this function returns doing
  * nothing. Therefore the caller does not need to keep state about whether or
@@ -87,12 +89,28 @@ void memcg_reparent_list_lrus(struct mem_cgroup *memcg, struct mem_cgroup *paren
  *
  * Return: true if the list was updated, false otherwise
  */
-bool list_lru_add(struct list_lru *lru, struct list_head *item);
+bool list_lru_add(struct list_lru *lru, struct list_head *item, int nid,
+		    struct mem_cgroup *memcg);
 
 /**
- * list_lru_del: delete an element to the lru list
+ * list_lru_add_obj: add an element to the lru list's tail
+ * @lru: the lru pointer
+ * @item: the item to be added.
+ *
+ * This function is similar to list_lru_add(), but the NUMA node and the
+ * memcg of the sublist is determined by @item list_head. This assumption is
+ * valid for slab objects LRU such as dentries, inodes, etc.
+ *
+ * Return value: true if the list was updated, false otherwise
+ */
+bool list_lru_add_obj(struct list_lru *lru, struct list_head *item);
+
+/**
+ * list_lru_del: delete an element from the lru list
  * @lru: the lru pointer
  * @item: the item to be deleted.
+ * @nid: the node id of the sublist to delete the item from.
+ * @memcg: the cgroup of the sublist to delete the item from.
  *
  * This function works analogously as list_lru_add() in terms of list
  * manipulation. The comments about an element already pertaining to
@@ -100,7 +118,21 @@ bool list_lru_add(struct list_lru *lru, struct list_head *item);
  *
  * Return: true if the list was updated, false otherwise
  */
-bool list_lru_del(struct list_lru *lru, struct list_head *item);
+bool list_lru_del(struct list_lru *lru, struct list_head *item, int nid,
+		    struct mem_cgroup *memcg);
+
+/**
+ * list_lru_del_obj: delete an element from the lru list
+ * @lru: the lru pointer
+ * @item: the item to be deleted.
+ *
+ * This function is similar to list_lru_del(), but the NUMA node and the
+ * memcg of the sublist is determined by @item list_head. This assumption is
+ * valid for slab objects LRU such as dentries, inodes, etc.
+ *
+ * Return value: true if the list was updated, false otherwise.
+ */
+bool list_lru_del_obj(struct list_lru *lru, struct list_head *item);
 
 /**
  * list_lru_count_one: return the number of objects currently held by @lru
@@ -138,6 +170,22 @@ static inline unsigned long list_lru_count(struct list_lru *lru)
 void list_lru_isolate(struct list_lru_one *list, struct list_head *item);
 void list_lru_isolate_move(struct list_lru_one *list, struct list_head *item,
 			   struct list_head *head);
+/**
+ * list_lru_putback: undo list_lru_isolate
+ * @lru: the lru pointer.
+ * @item: the item to put back.
+ * @nid: the node id of the sublist to put the item back to.
+ * @memcg: the cgroup of the sublist to put the item back to.
+ *
+ * Put back an isolated item into its original LRU. Note that unlike
+ * list_lru_add, this does not increment the node LRU count (as
+ * list_lru_isolate does not originally decrement this count).
+ *
+ * Since we might have dropped the LRU lock in between, recompute list_lru_one
+ * from the node's id and memcg.
+ */
+void list_lru_putback(struct list_lru *lru, struct list_head *item, int nid,
+		      struct mem_cgroup *memcg);
 
 typedef enum lru_status (*list_lru_walk_cb)(struct list_head *item,
 		struct list_lru_one *list, spinlock_t *lock, void *cb_arg);
diff --git a/mm/list_lru.c b/mm/list_lru.c
index a05e5bef3b40..fcca67ac26ec 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -116,21 +116,19 @@ list_lru_from_kmem(struct list_lru *lru, int nid, void *ptr,
 }
 #endif /* CONFIG_MEMCG_KMEM */
 
-bool list_lru_add(struct list_lru *lru, struct list_head *item)
+bool list_lru_add(struct list_lru *lru, struct list_head *item, int nid,
+		    struct mem_cgroup *memcg)
 {
-	int nid = page_to_nid(virt_to_page(item));
 	struct list_lru_node *nlru = &lru->node[nid];
-	struct mem_cgroup *memcg;
 	struct list_lru_one *l;
 
 	spin_lock(&nlru->lock);
 	if (list_empty(item)) {
-		l = list_lru_from_kmem(lru, nid, item, &memcg);
+		l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
 		list_add_tail(item, &l->list);
 		/* Set shrinker bit if the first element was added */
 		if (!l->nr_items++)
-			set_shrinker_bit(memcg, nid,
-					 lru_shrinker_id(lru));
+			set_shrinker_bit(memcg, nid, lru_shrinker_id(lru));
 		nlru->nr_items++;
 		spin_unlock(&nlru->lock);
 		return true;
@@ -140,15 +138,25 @@ bool list_lru_add(struct list_lru *lru, struct list_head *item)
 }
 EXPORT_SYMBOL_GPL(list_lru_add);
 
-bool list_lru_del(struct list_lru *lru, struct list_head *item)
+bool list_lru_add_obj(struct list_lru *lru, struct list_head *item)
 {
 	int nid = page_to_nid(virt_to_page(item));
+	struct mem_cgroup *memcg = list_lru_memcg_aware(lru) ?
+		mem_cgroup_from_slab_obj(item) : NULL;
+
+	return list_lru_add(lru, item, nid, memcg);
+}
+EXPORT_SYMBOL_GPL(list_lru_add_obj);
+
+bool list_lru_del(struct list_lru *lru, struct list_head *item, int nid,
+		    struct mem_cgroup *memcg)
+{
 	struct list_lru_node *nlru = &lru->node[nid];
 	struct list_lru_one *l;
 
 	spin_lock(&nlru->lock);
 	if (!list_empty(item)) {
-		l = list_lru_from_kmem(lru, nid, item, NULL);
+		l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
 		list_del_init(item);
 		l->nr_items--;
 		nlru->nr_items--;
@@ -160,6 +168,16 @@ bool list_lru_del(struct list_lru *lru, struct list_head *item)
 }
 EXPORT_SYMBOL_GPL(list_lru_del);
 
+bool list_lru_del_obj(struct list_lru *lru, struct list_head *item)
+{
+	int nid = page_to_nid(virt_to_page(item));
+	struct mem_cgroup *memcg = list_lru_memcg_aware(lru) ?
+		mem_cgroup_from_slab_obj(item) : NULL;
+
+	return list_lru_del(lru, item, nid, memcg);
+}
+EXPORT_SYMBOL_GPL(list_lru_del_obj);
+
 void list_lru_isolate(struct list_lru_one *list, struct list_head *item)
 {
 	list_del_init(item);
@@ -175,6 +193,20 @@ void list_lru_isolate_move(struct list_lru_one *list, struct list_head *item,
 }
 EXPORT_SYMBOL_GPL(list_lru_isolate_move);
 
+void list_lru_putback(struct list_lru *lru, struct list_head *item, int nid,
+		      struct mem_cgroup *memcg)
+{
+	struct list_lru_one *list =
+		list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
+
+	if (list_empty(item)) {
+		list_add_tail(item, &list->list);
+		if (!list->nr_items++)
+			set_shrinker_bit(memcg, nid, lru_shrinker_id(lru));
+	}
+}
+EXPORT_SYMBOL_GPL(list_lru_putback);
+
 unsigned long list_lru_count_one(struct list_lru *lru,
 				 int nid, struct mem_cgroup *memcg)
 {
diff --git a/mm/workingset.c b/mm/workingset.c
index b192e44a0e7c..c17d45c6f29b 100644
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@ -615,12 +615,12 @@ void workingset_update_node(struct xa_node *node)
 
 	if (node->count && node->count == node->nr_values) {
 		if (list_empty(&node->private_list)) {
-			list_lru_add(&shadow_nodes, &node->private_list);
+			list_lru_add_obj(&shadow_nodes, &node->private_list);
 			__inc_lruvec_kmem_state(node, WORKINGSET_NODES);
 		}
 	} else {
 		if (!list_empty(&node->private_list)) {
-			list_lru_del(&shadow_nodes, &node->private_list);
+			list_lru_del_obj(&shadow_nodes, &node->private_list);
 			__dec_lruvec_kmem_state(node, WORKINGSET_NODES);
 		}
 	}
-- 
2.34.1

