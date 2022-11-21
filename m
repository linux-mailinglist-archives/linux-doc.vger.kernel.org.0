Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABAE632761
	for <lists+linux-doc@lfdr.de>; Mon, 21 Nov 2022 16:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbiKUPKF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Nov 2022 10:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbiKUPJr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 10:09:47 -0500
X-Greylist: delayed 313 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 21 Nov 2022 07:00:14 PST
Received: from forward107j.mail.yandex.net (forward107j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84632D338C
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 07:00:14 -0800 (PST)
Received: from sas8-92ddc00f49ef.qloud-c.yandex.net (sas8-92ddc00f49ef.qloud-c.yandex.net [IPv6:2a02:6b8:c1b:2988:0:640:92dd:c00f])
        by forward107j.mail.yandex.net (Yandex) with ESMTP id 0ABAE885D51;
        Mon, 21 Nov 2022 17:54:58 +0300 (MSK)
Received: by sas8-92ddc00f49ef.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id HuHvSIyQmW-svVSsL35;
        Mon, 21 Nov 2022 17:54:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clicknet.pro; s=mail; t=1669042497;
        bh=cCJ2mz11a1GCXdTVWAqlSLmHFnkU88VKeztOYW5fTbs=;
        h=Message-Id:Date:Cc:Subject:To:From;
        b=vXEGQHVn3bENrt8Wv+nyWDbgsfcSnEnxCf+yjiAVCMI50eIDk8+LffI7VVRebTczJ
         aPdsuKa+IyoPmA1P1dMzoTe35ZG6yiPzpy28CQRGiZCVKnEn7VYfCvEn0AM61sAxcG
         drYfiuEAj3X75IYg4TySEoYECQ4gTucxK1AgYjWM=
Authentication-Results: sas8-92ddc00f49ef.qloud-c.yandex.net; dkim=pass header.i=@clicknet.pro
From:   Ananda Badmaev <a.badmaev@clicknet.pro>
To:     linux-mm@kvack.org, vitaly.wool@konsulko.com,
        linux-doc@vger.kernel.org
Cc:     Ananda Badmaev <a.badmaev@clicknet.pro>
Subject: [PATCH v8] mm: add zblock - new allocator for use via zpool API
Date:   Mon, 21 Nov 2022 17:54:35 +0300
Message-Id: <20221121145435.41002-1-a.badmaev@clicknet.pro>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_PDS_PRO_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

    Zblock stores integer number of compressed objects per zblock block.
These blocks consist of several physical pages (1/2/4/8) and are arranged
in linked lists.
    The range from 0 to PAGE_SIZE is divided into the number of intervals
corresponding to the number of lists and each list only operates objects
of size from its interval. Thus the block lists are isolated from each
other, which makes it possible to simultaneously perform actions with
several objects from different lists.
    With zblock, it is possible to densely arrange objects of various sizes
resulting in low internal fragmentation. Also this allocator tries to fill
incomplete blocks instead of adding new ones thus in many cases providing a
compression ratio substantially higher than z3fold and zbud.
    Zblock does not require MMU and also is superior to zsmalloc with
regard to the worst execution times, thus allowing for better response time
and real-time characteristics of the whole system.

Signed-off-by: Ananda Badmaev <a.badmaev@clicknet.pro>
---

v2: fixed compiler warnings

v3: added documentation and const modifier to struct tree_descr

v4:
- fixed gfp flags for block allocation
- fixed potential memory leak when allocating blocks
- resolved some issues with code style and warnings from checkpatch
  (except warning about single line config symbol description)
- moved test results from documentation to changelog

v5:
- "direct" handle mapping and use of linked lists instead of red-black
  trees resulting in faster operations and a bit simpler code
- renamed ztree -> zblock
- edited various comments and descriptions

v6:
- fixed tabs (tab size 8 instead of 4)
- evict also pages that have not been mapped

v7:
- fixed potential unsigned overflow of block_type in zblock_reclaim_block
- added check on the ability to store objects of size PAGE_SIZE
  at pool creation time
- added zblock into Documentation/mm/index.rst

v8:
- fixed typo and improved the wording in zblock.rst and commit description

 Documentation/mm/index.rst  |   1 +
 Documentation/mm/zblock.rst |  31 ++
 MAINTAINERS                 |   7 +
 mm/Kconfig                  |  17 +
 mm/Makefile                 |   1 +
 mm/zblock.c                 | 642 ++++++++++++++++++++++++++++++++++++
 6 files changed, 699 insertions(+)
 create mode 100644 Documentation/mm/zblock.rst
 create mode 100644 mm/zblock.c

diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 4aa12b8be278..3e538e098eb6 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -66,4 +66,5 @@ above structured documentation, or deleted if it has served its purpose.
    vmalloced-kernel-stacks
    vmemmap_dedup
    z3fold
+   zblock
    zsmalloc
diff --git a/Documentation/mm/zblock.rst b/Documentation/mm/zblock.rst
new file mode 100644
index 000000000000..fa4f8f24a5fd
--- /dev/null
+++ b/Documentation/mm/zblock.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _zblock:
+
+======
+zblock
+======
+
+Zblock stores integer number of compressed objects per block. These blocks
+consist of several consecutive physical pages (from 1 to 8) and are arranged
+in lists. The range from 0 to PAGE_SIZE is divided into the number of intervals
+corresponding to the number of lists and these only operate on objects of size
+from its interval. Thus the block lists are isolated from each other, which
+makes it possible to simultaneously perform actions with several objects
+from different lists.
+
+With zlock, it is possible to densely arrange objects of various sizes,
+resulting in low internal fragmentation. Also this allocator tries to fill
+incomplete blocks instead of adding new ones. As a result, in many cases it
+provides a compression ratio substantially higher than z3fold and zbud. Zblock
+does not require MMU and also is superior to zsmalloc with regard to the worst
+execution times, thus allowing for better response time and real-time
+characteristics of the whole system.
+
+Like similar allocation method from z3fold and zsmalloc, zblock_alloc() does
+not return a dereferenceable pointer. Instead, it returns an unsigned long
+handle which encodes actual location of the allocated object.
+
+Unlike zbud and z3fold, zblock works well with objects of various sizes -
+including but not limited to highly compressed and poorly compressed, as well
+as cases where both object types exist.
diff --git a/MAINTAINERS b/MAINTAINERS
index 379945f82a64..506edaffbf36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22690,6 +22690,13 @@ L:	linux-mm@kvack.org
 S:	Maintained
 F:	mm/z3fold.c
 
+ZBLOCK COMPRESSED PAGE ALLOCATOR
+M:	Ananda Badmaev <a.badmaev@clicknet.pro>
+M:	Vitaly Wool <vitaly.wool@konsulko.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	mm/zblock.c
+
 ZD1211RW WIRELESS DRIVER
 M:	Ulrich Kunitz <kune@deine-taler.de>
 L:	linux-wireless@vger.kernel.org
diff --git a/mm/Kconfig b/mm/Kconfig
index 57e1d8c5b505..8836ffae2905 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -143,6 +143,12 @@ config ZSWAP_ZPOOL_DEFAULT_ZSMALLOC
 	select ZSMALLOC
 	help
 	  Use the zsmalloc allocator as the default allocator.
+
+config ZSWAP_ZPOOL_DEFAULT_ZBLOCK
+	bool "zblock"
+	select ZBLOCK
+	help
+	  Use the zblock allocator as the default allocator.
 endchoice
 
 config ZSWAP_ZPOOL_DEFAULT
@@ -151,6 +157,7 @@ config ZSWAP_ZPOOL_DEFAULT
        default "zbud" if ZSWAP_ZPOOL_DEFAULT_ZBUD
        default "z3fold" if ZSWAP_ZPOOL_DEFAULT_Z3FOLD
        default "zsmalloc" if ZSWAP_ZPOOL_DEFAULT_ZSMALLOC
+	default "zblock" if ZSWAP_ZPOOL_DEFAULT_ZBLOCK
        default ""
 
 config ZBUD
@@ -181,6 +188,16 @@ config ZSMALLOC
 	  pages of various compression levels efficiently. It achieves
 	  the highest storage density with the least amount of fragmentation.
 
+config ZBLOCK
+	tristate "Simple block allocator (zblock)"
+	depends on ZPOOL
+	help
+	  A special purpose allocator for storing compressed pages.
+	  It stores integer number of compressed pages per block and
+	  each block consists of number of physical pages being a power of 2.
+	  zblock provides fast read/write, limited worst case time for
+	  operations and good compression ratio in most scenarios.
+
 config ZSMALLOC_STAT
 	bool "Export zsmalloc statistics"
 	depends on ZSMALLOC
diff --git a/mm/Makefile b/mm/Makefile
index 8e105e5b3e29..f2c89390542c 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -114,6 +114,7 @@ obj-$(CONFIG_ZPOOL)	+= zpool.o
 obj-$(CONFIG_ZBUD)	+= zbud.o
 obj-$(CONFIG_ZSMALLOC)	+= zsmalloc.o
 obj-$(CONFIG_Z3FOLD)	+= z3fold.o
+obj-$(CONFIG_ZBLOCK)	+= zblock.o
 obj-$(CONFIG_GENERIC_EARLY_IOREMAP) += early_ioremap.o
 obj-$(CONFIG_CMA)	+= cma.o
 obj-$(CONFIG_MEMORY_BALLOON) += balloon_compaction.o
diff --git a/mm/zblock.c b/mm/zblock.c
new file mode 100644
index 000000000000..4767a367fa71
--- /dev/null
+++ b/mm/zblock.c
@@ -0,0 +1,642 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * zblock.c
+ *
+ * Author: Ananda Badmaev <a.badmaev@clicknet.pro>
+ * Copyright (C) 2022, Konsulko AB.
+ *
+ * This implementation is based on z3fold written by Vitaly Wool.
+ * Zblock is a small object allocator with the intention to serve as a
+ * zpool backend. It operates on page blocks which consist of number
+ * of physical pages being a power of 2 and store integer number of
+ * compressed pages per block which results in determinism and simplicity.
+ *
+ * zblock doesn't export any API and is meant to be used via zpool API.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/atomic.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/preempt.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/zpool.h>
+
+#define SLOT_FREE 0
+#define SLOT_OCCUPIED 1
+#define SLOT_MAPPED 2
+#define SLOT_UNMAPPED 3
+
+#define SLOT_BITS 5
+#define MAX_SLOTS (1 << SLOT_BITS)
+#define SLOT_MASK ((0x1UL << SLOT_BITS) - 1)
+
+#define BLOCK_DATA_SIZE(order) ((PAGE_SIZE << order) - sizeof(struct zblock_block))
+#define SLOT_SIZE(nslots, order) (round_down((BLOCK_DATA_SIZE(order) / nslots), sizeof(long)))
+
+#define BLOCK_CACHE_SIZE 32
+
+struct zblock_pool;
+
+struct zblock_ops {
+	int (*evict)(struct zblock_pool *pool, unsigned long handle);
+};
+
+/**
+ * struct zblock_block - block metadata
+ * Block consists of several (1/2/4/8) pages and contains fixed
+ * integer number of slots for allocating compressed pages.
+ *
+ * lock:		protects block
+ * block_node:		links block into the relevant list in the pool
+ * slot_info:		contains data about free/occupied slots
+ * free_slots:		number of free slots in the block
+ * under_reclaim:	if true shows that block is being evicted
+ */
+struct zblock_block {
+	spinlock_t lock;
+	struct list_head block_node;
+	u8 slot_info[MAX_SLOTS];
+	unsigned int free_slots;
+	bool under_reclaim;
+};
+/**
+ * struct block_desc - general metadata for block lists
+ * Each block list stores only blocks of corresponding type which means
+ * that all blocks in it have the same number and size of slots.
+ * All slots are aligned to size of long.
+ *
+ * slot_size:		size of slot for this list
+ * slots_per_block:	number of slots per block for this list
+ * order:		order for __get_free_pages
+ */
+static const struct block_desc {
+	const unsigned int slot_size;
+	const unsigned short slots_per_block;
+	const unsigned short order;
+} block_desc[] = {
+	{ SLOT_SIZE(32, 0), 32, 0 },
+	{ SLOT_SIZE(22, 0), 22, 0 },
+	{ SLOT_SIZE(17, 0), 17, 0 },
+	{ SLOT_SIZE(13, 0), 13, 0 },
+	{ SLOT_SIZE(11, 0), 11, 0 },
+	{ SLOT_SIZE(9, 0), 9, 0 },
+	{ SLOT_SIZE(8, 0), 8, 0 },
+	{ SLOT_SIZE(14, 1), 14, 1 },
+	{ SLOT_SIZE(12, 1), 12, 1 },
+	{ SLOT_SIZE(11, 1), 11, 1 },
+	{ SLOT_SIZE(10, 1), 10, 1 },
+	{ SLOT_SIZE(9, 1), 9, 1 },
+	{ SLOT_SIZE(8, 1), 8, 1 },
+	{ SLOT_SIZE(15, 2), 15, 2 },
+	{ SLOT_SIZE(14, 2), 14, 2 },
+	{ SLOT_SIZE(13, 2), 13, 2 },
+	{ SLOT_SIZE(12, 2), 12, 2 },
+	{ SLOT_SIZE(11, 2), 11, 2 },
+	{ SLOT_SIZE(10, 2), 10, 2 },
+	{ SLOT_SIZE(9, 2), 9, 2 },
+	{ SLOT_SIZE(8, 2), 8, 2 },
+	{ SLOT_SIZE(15, 3), 15, 3 },
+	{ SLOT_SIZE(14, 3), 14, 3 },
+	{ SLOT_SIZE(13, 3), 13, 3 },
+	{ SLOT_SIZE(12, 3), 12, 3 },
+	{ SLOT_SIZE(11, 3), 11, 3 },
+	{ SLOT_SIZE(10, 3), 10, 3 },
+	{ SLOT_SIZE(9, 3), 9, 3 },
+	{ SLOT_SIZE(7, 3), 7, 3 }
+};
+
+/**
+ * struct block_list - stores metadata of particular list
+ * lock:		protects list
+ * head:		head of this list
+ * block_cache:	blocks with free slots
+ * block_count:	total number of blocks in the list
+ */
+struct block_list {
+	spinlock_t lock;
+	struct list_head head;
+	struct zblock_block *block_cache[BLOCK_CACHE_SIZE];
+	unsigned long block_count;
+};
+
+/**
+ * struct zblock_pool - stores metadata for each zblock pool
+ * @block_lists:	array of block lists
+ * @ops:		pointer to a structure of user defined operations specified at
+ *			pool creation time.
+ * @zpool:		zpool driver
+ * @zpool_ops:		zpool operations structure with an evict callback
+ * @alloc_flag:	protects block allocation from memory leak
+ *
+ * This structure is allocated at pool creation time and maintains metadata
+ * for a particular zblock pool.
+ */
+struct zblock_pool {
+	struct block_list block_lists[ARRAY_SIZE(block_desc)];
+	const struct zblock_ops *ops;
+	struct zpool *zpool;
+	const struct zpool_ops *zpool_ops;
+	atomic_t alloc_flag;
+};
+
+/*****************
+ * Helpers
+ *****************/
+
+static void cache_insert_block(struct zblock_block *block, struct block_list *list)
+{
+	unsigned int i, min_free_slots, min_index;
+
+	min_free_slots = MAX_SLOTS;
+	for (i = 0; i < BLOCK_CACHE_SIZE; i++) {
+		if (!list->block_cache[i] || !(list->block_cache[i])->free_slots) {
+			list->block_cache[i] = block;
+			return;
+		}
+		if ((list->block_cache[i])->free_slots < min_free_slots) {
+			min_free_slots = (list->block_cache[i])->free_slots;
+			min_index = i;
+		}
+	}
+	list->block_cache[min_index] = block;
+}
+
+static struct zblock_block *cache_find_block(struct block_list *list)
+{
+	int i;
+
+	for (i = 0; i < BLOCK_CACHE_SIZE; i++) {
+		if (list->block_cache[i] && (list->block_cache[i])->free_slots)
+			return list->block_cache[i];
+	}
+	return NULL;
+}
+
+static int is_in_cache(struct zblock_block *block, struct block_list *list)
+{
+	int i;
+
+	for (i = 0; i < BLOCK_CACHE_SIZE; i++) {
+		if (block == list->block_cache[i])
+			return i;
+	}
+	return -1;
+}
+
+/*
+ * allocate new block and add it to corresponding block list
+ */
+static struct zblock_block *alloc_block(struct zblock_pool *pool,
+					int block_type, gfp_t gfp)
+{
+	struct zblock_block *block;
+	struct block_list *list;
+
+	block = (void *)__get_free_pages(gfp, block_desc[block_type].order);
+	if (!block)
+		return NULL;
+
+	list = &(pool->block_lists)[block_type];
+
+	/* init block data  */
+	spin_lock_init(&block->lock);
+	memset(block->slot_info, SLOT_FREE, block_desc[block_type].slots_per_block);
+	block->free_slots = block_desc[block_type].slots_per_block;
+	block->under_reclaim = false;
+
+	spin_lock(&list->lock);
+	/* inserting block into list */
+	INIT_LIST_HEAD(&block->block_node);
+	list_add(&block->block_node, &list->head);
+	cache_insert_block(block, list);
+	list->block_count++;
+	spin_unlock(&list->lock);
+	return block;
+}
+
+/*
+ * Encodes the handle of a particular slot in the pool using metadata
+ */
+static inline unsigned long metadata_to_handle(struct zblock_block *block,
+					unsigned int block_type, unsigned int slot)
+{
+	return (unsigned long)(block) + (block_type << SLOT_BITS) + slot;
+}
+
+/* Returns block, block type and slot in the pool corresponding to handle */
+static inline struct zblock_block *handle_to_metadata(unsigned long handle,
+					unsigned int *block_type, unsigned int *slot)
+{
+	*block_type = (handle & (PAGE_SIZE - 1)) >> SLOT_BITS;
+	*slot = handle & SLOT_MASK;
+	return (struct zblock_block *)(handle & PAGE_MASK);
+}
+
+
+/*****************
+ * API Functions
+ *****************/
+/**
+ * zblock_create_pool() - create a new zblock pool
+ * @gfp: gfp flags when allocating the zblock pool structure
+ * @ops: user-defined operations for the zblock pool
+ *
+ * Return: pointer to the new zblock pool or NULL if the metadata allocation
+ * failed.
+ */
+static struct zblock_pool *zblock_create_pool(gfp_t gfp, const struct zblock_ops *ops)
+{
+	struct zblock_pool *pool;
+	struct block_list *list;
+	int i, j, arr_sz;
+
+	pool = kmalloc(sizeof(struct zblock_pool), gfp);
+	if (!pool)
+		return NULL;
+
+	arr_sz = ARRAY_SIZE(block_desc);
+	if (block_desc[arr_sz - 1].slot_size < PAGE_SIZE)
+		return NULL;
+
+	/* init each block list */
+	for (i = 0; i < arr_sz; i++) {
+		list = &(pool->block_lists)[i];
+		spin_lock_init(&list->lock);
+		INIT_LIST_HEAD(&list->head);
+		for (j = 0; j < BLOCK_CACHE_SIZE; j++)
+			list->block_cache[j] = NULL;
+		list->block_count = 0;
+	}
+	pool->ops = ops;
+	atomic_set(&pool->alloc_flag, 0);
+	return pool;
+}
+
+/**
+ * zblock_destroy_pool() - destroys an existing zblock pool
+ * @pool: the zblock pool to be destroyed
+ *
+ */
+static void zblock_destroy_pool(struct zblock_pool *pool)
+{
+	kfree(pool);
+}
+
+
+/**
+ * zblock_alloc() - allocates a slot of appropriate size
+ * @pool:	zblock pool from which to allocate
+ * @size:	size in bytes of the desired allocation
+ * @gfp:	gfp flags used if the pool needs to grow
+ * @handle:	handle of the new allocation
+ *
+ * Return: 0 if success and handle is set, otherwise -EINVAL if the size or
+ * gfp arguments are invalid or -ENOMEM if the pool was unable to allocate
+ * a new slot.
+ */
+static int zblock_alloc(struct zblock_pool *pool, size_t size, gfp_t gfp,
+			unsigned long *handle)
+{
+	unsigned int block_type, slot;
+	struct zblock_block *block;
+	struct block_list *list;
+
+	if (!size)
+		return -EINVAL;
+
+	if (size > PAGE_SIZE)
+		return -ENOSPC;
+
+	/* find basic block type with suitable slot size */
+	for (block_type = 0; block_type < ARRAY_SIZE(block_desc); block_type++) {
+		if (size <= block_desc[block_type].slot_size)
+			break;
+	}
+	list = &(pool->block_lists[block_type]);
+
+check:
+	spin_lock(&list->lock);
+	/* check if there are free slots in cache */
+	block = cache_find_block(list);
+	if (block)
+		goto found;
+	spin_unlock(&list->lock);
+
+	/* not found block with free slots try to allocate new empty block */
+	if (atomic_cmpxchg(&pool->alloc_flag, 0, 1))
+		goto check;
+	block = alloc_block(pool, block_type, gfp & ~(__GFP_HIGHMEM | __GFP_MOVABLE));
+	if (block) {
+		spin_lock(&list->lock);
+		goto found;
+	}
+	atomic_set(&pool->alloc_flag, 0);
+	return -ENOMEM;
+
+found:
+	spin_lock(&block->lock);
+	block->free_slots--;
+	spin_unlock(&list->lock);
+	/* find the first free slot in block */
+	for (slot = 0; slot < block_desc[block_type].slots_per_block; slot++) {
+		if (block->slot_info[slot] == SLOT_FREE)
+			break;
+	}
+	block->slot_info[slot] = SLOT_OCCUPIED;
+	spin_unlock(&block->lock);
+	*handle = metadata_to_handle(block, block_type, slot);
+	atomic_set(&pool->alloc_flag, 0);
+	return 0;
+}
+
+/**
+ * zblock_free() - frees the allocation associated with the given handle
+ * @pool:	pool in which the allocation resided
+ * @handle:	handle associated with the allocation returned by zblock_alloc()
+ *
+ */
+static void zblock_free(struct zblock_pool *pool, unsigned long handle)
+{
+	unsigned int slot, block_type;
+	struct zblock_block *block;
+	struct block_list *list;
+	int i;
+
+	block = handle_to_metadata(handle, &block_type, &slot);
+	list = &(pool->block_lists[block_type]);
+
+	if (block->under_reclaim)
+		return;
+	spin_lock(&list->lock);
+	i = is_in_cache(block, list);
+	block->free_slots++;
+	/* if all slots in block are empty delete whole block */
+	if (block->free_slots == block_desc[block_type].slots_per_block) {
+		list_del(&block->block_node);
+		list->block_count--;
+
+		/* if cached block to be deleted */
+		if (i != -1)
+			list->block_cache[i] = NULL;
+		spin_unlock(&list->lock);
+		free_pages((unsigned long)block, block_desc[block_type].order);
+		return;
+	}
+	/* if block is not cached update cache */
+	if (i == -1)
+		cache_insert_block(block, list);
+
+	spin_lock(&block->lock);
+	spin_unlock(&list->lock);
+	block->slot_info[slot] = SLOT_FREE;
+	spin_unlock(&block->lock);
+}
+
+/**
+ * zblock_reclaim_block() - evicts allocations from block and frees it
+ * @pool: pool from which a block will attempt to be evicted
+ *
+ * Returns: pages reclaimed count if block is successfully freed
+ *          otherwise -EINVAL if there are no blocks to evict
+ */
+static int zblock_reclaim_block(struct zblock_pool *pool)
+{
+	struct zblock_block *block;
+	struct block_list *list;
+	unsigned long handle;
+	int ret, i, reclaimed, block_type, slot;
+
+	/* start with list storing blocks with the worst compression and try
+	 * to evict the first added (oldest) block in this list
+	 */
+	for (block_type = ARRAY_SIZE(block_desc) - 1; block_type >= 0; --block_type) {
+		list = &(pool->block_lists[block_type]);
+		spin_lock(&list->lock);
+
+		/* find the oldest block in list */
+		block = list_last_entry(&list->head, struct zblock_block, block_node);
+
+		if (!block) {
+			spin_unlock(&list->lock);
+			continue;
+		}
+		i = is_in_cache(block, list);
+		/* skip iteration if this block is cached */
+		if (i != -1) {
+			spin_unlock(&list->lock);
+			continue;
+		}
+		block->under_reclaim = true;
+		spin_unlock(&list->lock);
+		reclaimed = 0;
+
+		/* try to evict all OCCUPIED and UNMAPPED slots in block */
+		for (slot = 0; slot < block_desc[block_type].slots_per_block; ++slot) {
+			if (block->slot_info[slot] == SLOT_OCCUPIED ||
+				block->slot_info[slot] == SLOT_UNMAPPED) {
+				handle = metadata_to_handle(block, block_type, slot);
+				ret = pool->ops->evict(pool, handle);
+				if (ret)
+					break;
+
+				++reclaimed;
+				spin_lock(&block->lock);
+				block->slot_info[slot] = SLOT_FREE;
+				spin_unlock(&block->lock);
+				block->free_slots++;
+			}
+		}
+		spin_lock(&list->lock);
+		/* some occupied slots remained - insert block */
+		if (block->free_slots != block_desc[block_type].slots_per_block) {
+			block->under_reclaim = false;
+			cache_insert_block(block, list);
+			spin_unlock(&list->lock);
+		} else {
+		/* all slots are free - delete this block */
+			list_del(&block->block_node);
+			list->block_count--;
+			spin_unlock(&list->lock);
+			free_pages((unsigned long)block, block_desc[block_type].order);
+		}
+		if (reclaimed != 0)
+			return reclaimed;
+		return -EAGAIN;
+	}
+	return -EINVAL;
+}
+
+
+/**
+ * zblock_map() - maps the allocation associated with the given handle
+ * @pool:	pool in which the allocation resides
+ * @handle:	handle associated with the allocation to be mapped
+ *
+ *
+ * Returns: a pointer to the mapped allocation
+ */
+static void *zblock_map(struct zblock_pool *pool, unsigned long handle)
+{
+	unsigned int block_type, slot;
+	struct zblock_block *block;
+
+	block = handle_to_metadata(handle, &block_type, &slot);
+	spin_lock(&block->lock);
+	block->slot_info[slot] = SLOT_MAPPED;
+	spin_unlock(&block->lock);
+	return (void *)(block + 1) + slot * block_desc[block_type].slot_size;
+}
+
+/**
+ * zblock_unmap() - unmaps the allocation associated with the given handle
+ * @pool:	pool in which the allocation resides
+ * @handle:	handle associated with the allocation to be unmapped
+ */
+static void zblock_unmap(struct zblock_pool *pool, unsigned long handle)
+{
+	unsigned int block_type, slot;
+	struct zblock_block *block;
+
+	block = handle_to_metadata(handle, &block_type, &slot);
+	spin_lock(&block->lock);
+	block->slot_info[slot] = SLOT_UNMAPPED;
+	spin_unlock(&block->lock);
+}
+
+/**
+ * zblock_get_pool_size() - gets the zblock pool size in bytes
+ * @pool: pool whose size is being queried
+ *
+ * Returns: size in bytes of the given pool.
+ */
+static u64 zblock_get_pool_size(struct zblock_pool *pool)
+{
+	u64 total_size;
+	int i;
+
+	total_size = 0;
+	for (i = 0; i < ARRAY_SIZE(block_desc); i++) {
+		total_size += (pool->block_lists)[i].block_count
+				* (PAGE_SIZE << block_desc[i].order);
+	}
+	return total_size;
+}
+
+/*****************
+ * zpool
+ ****************/
+
+static int zblock_zpool_evict(struct zblock_pool *pool, unsigned long handle)
+{
+	if (pool->zpool && pool->zpool_ops && pool->zpool_ops->evict)
+		return pool->zpool_ops->evict(pool->zpool, handle);
+	else
+		return -ENOENT;
+}
+
+static const struct zblock_ops zblock_zpool_ops = {
+	.evict = zblock_zpool_evict
+};
+
+static void *zblock_zpool_create(const char *name, gfp_t gfp,
+				const struct zpool_ops *zpool_ops,
+				struct zpool *zpool)
+{
+	struct zblock_pool *pool;
+
+	pool = zblock_create_pool(gfp, &zblock_zpool_ops);
+	if (pool) {
+		pool->zpool = zpool;
+		pool->zpool_ops = zpool_ops;
+	}
+	return pool;
+}
+
+static void zblock_zpool_destroy(void *pool)
+{
+	zblock_destroy_pool(pool);
+}
+
+static int zblock_zpool_malloc(void *pool, size_t size, gfp_t gfp,
+			unsigned long *handle)
+{
+	return zblock_alloc(pool, size, gfp, handle);
+}
+
+static void zblock_zpool_free(void *pool, unsigned long handle)
+{
+	zblock_free(pool, handle);
+}
+
+static int zblock_zpool_shrink(void *pool, unsigned int pages,
+			unsigned int *reclaimed)
+{
+	unsigned int total = 0;
+	int ret = -EINVAL;
+
+	while (total < pages) {
+		ret = zblock_reclaim_block(pool);
+		if (ret < 0)
+			break;
+		total += ret;
+	}
+	if (reclaimed)
+		*reclaimed = total;
+
+	return ret;
+}
+
+static void *zblock_zpool_map(void *pool, unsigned long handle,
+			enum zpool_mapmode mm)
+{
+	return zblock_map(pool, handle);
+}
+
+static void zblock_zpool_unmap(void *pool, unsigned long handle)
+{
+	zblock_unmap(pool, handle);
+}
+
+static u64 zblock_zpool_total_size(void *pool)
+{
+	return zblock_get_pool_size(pool);
+}
+
+static struct zpool_driver zblock_zpool_driver = {
+	.type =		"zblock",
+	.owner =	THIS_MODULE,
+	.create =	zblock_zpool_create,
+	.destroy =	zblock_zpool_destroy,
+	.malloc =	zblock_zpool_malloc,
+	.free =		zblock_zpool_free,
+	.shrink =	zblock_zpool_shrink,
+	.map =		zblock_zpool_map,
+	.unmap =	zblock_zpool_unmap,
+	.total_size =	zblock_zpool_total_size,
+};
+
+MODULE_ALIAS("zpool-zblock");
+
+static int __init init_zblock(void)
+{
+	pr_info("loaded\n");
+	zpool_register_driver(&zblock_zpool_driver);
+	return 0;
+}
+
+static void __exit exit_zblock(void)
+{
+	zpool_unregister_driver(&zblock_zpool_driver);
+	pr_info("unloaded\n");
+}
+
+module_init(init_zblock);
+module_exit(exit_zblock);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ananda Badmaeb <a.badmaev@clicknet.pro>");
+MODULE_DESCRIPTION("Block allocator for compressed pages");
-- 
2.34.1

