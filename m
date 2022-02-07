Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E588A4ABFC9
	for <lists+linux-doc@lfdr.de>; Mon,  7 Feb 2022 14:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381620AbiBGNlc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Feb 2022 08:41:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448187AbiBGNFl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Feb 2022 08:05:41 -0500
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E22FC0401C0;
        Mon,  7 Feb 2022 05:05:40 -0800 (PST)
From:   Paul Cercueil <paul@crapouillou.net>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexandru Ardelean <ardeleanalex@gmail.com>,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 01/12] iio: buffer-dma: Get rid of outgoing queue
Date:   Mon,  7 Feb 2022 12:59:22 +0000
Message-Id: <20220207125933.81634-2-paul@crapouillou.net>
In-Reply-To: <20220207125933.81634-1-paul@crapouillou.net>
References: <20220207125933.81634-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The buffer-dma code was using two queues, incoming and outgoing, to
manage the state of the blocks in use.

While this totally works, it adds some complexity to the code,
especially since the code only manages 2 blocks. It is much easier to
just check each block's state manually, and keep a counter for the next
block to dequeue.

Since the new DMABUF based API wouldn't use the outgoing queue anyway,
getting rid of it now makes the upcoming changes simpler.

With this change, the IIO_BLOCK_STATE_DEQUEUED is now useless, and can
be removed.

v2: - Only remove the outgoing queue, and keep the incoming queue, as we
      want the buffer to start streaming data as soon as it is enabled.
    - Remove IIO_BLOCK_STATE_DEQUEUED, since it is now functionally the
      same as IIO_BLOCK_STATE_DONE.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 44 ++++++++++----------
 include/linux/iio/buffer-dma.h               |  7 ++--
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index d348af8b9705..1fc91467d1aa 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -179,7 +179,7 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 	}
 
 	block->size = size;
-	block->state = IIO_BLOCK_STATE_DEQUEUED;
+	block->state = IIO_BLOCK_STATE_DONE;
 	block->queue = queue;
 	INIT_LIST_HEAD(&block->head);
 	kref_init(&block->kref);
@@ -191,16 +191,8 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 
 static void _iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
 {
-	struct iio_dma_buffer_queue *queue = block->queue;
-
-	/*
-	 * The buffer has already been freed by the application, just drop the
-	 * reference.
-	 */
-	if (block->state != IIO_BLOCK_STATE_DEAD) {
+	if (block->state != IIO_BLOCK_STATE_DEAD)
 		block->state = IIO_BLOCK_STATE_DONE;
-		list_add_tail(&block->head, &queue->outgoing);
-	}
 }
 
 /**
@@ -261,7 +253,6 @@ static bool iio_dma_block_reusable(struct iio_dma_buffer_block *block)
 	 * not support abort and has not given back the block yet.
 	 */
 	switch (block->state) {
-	case IIO_BLOCK_STATE_DEQUEUED:
 	case IIO_BLOCK_STATE_QUEUED:
 	case IIO_BLOCK_STATE_DONE:
 		return true;
@@ -317,7 +308,6 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 	 * dead. This means we can reset the lists without having to fear
 	 * corrution.
 	 */
-	INIT_LIST_HEAD(&queue->outgoing);
 	spin_unlock_irq(&queue->list_lock);
 
 	INIT_LIST_HEAD(&queue->incoming);
@@ -456,14 +446,20 @@ static struct iio_dma_buffer_block *iio_dma_buffer_dequeue(
 	struct iio_dma_buffer_queue *queue)
 {
 	struct iio_dma_buffer_block *block;
+	unsigned int idx;
 
 	spin_lock_irq(&queue->list_lock);
-	block = list_first_entry_or_null(&queue->outgoing, struct
-		iio_dma_buffer_block, head);
-	if (block != NULL) {
-		list_del(&block->head);
-		block->state = IIO_BLOCK_STATE_DEQUEUED;
+
+	idx = queue->fileio.next_dequeue;
+	block = queue->fileio.blocks[idx];
+
+	if (block->state == IIO_BLOCK_STATE_DONE) {
+		idx = (idx + 1) % ARRAY_SIZE(queue->fileio.blocks);
+		queue->fileio.next_dequeue = idx;
+	} else {
+		block = NULL;
 	}
+
 	spin_unlock_irq(&queue->list_lock);
 
 	return block;
@@ -539,6 +535,7 @@ size_t iio_dma_buffer_data_available(struct iio_buffer *buf)
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buf);
 	struct iio_dma_buffer_block *block;
 	size_t data_available = 0;
+	unsigned int i;
 
 	/*
 	 * For counting the available bytes we'll use the size of the block not
@@ -552,8 +549,15 @@ size_t iio_dma_buffer_data_available(struct iio_buffer *buf)
 		data_available += queue->fileio.active_block->size;
 
 	spin_lock_irq(&queue->list_lock);
-	list_for_each_entry(block, &queue->outgoing, head)
-		data_available += block->size;
+
+	for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
+		block = queue->fileio.blocks[i];
+
+		if (block != queue->fileio.active_block
+		    && block->state == IIO_BLOCK_STATE_DONE)
+			data_available += block->size;
+	}
+
 	spin_unlock_irq(&queue->list_lock);
 	mutex_unlock(&queue->lock);
 
@@ -617,7 +621,6 @@ int iio_dma_buffer_init(struct iio_dma_buffer_queue *queue,
 	queue->ops = ops;
 
 	INIT_LIST_HEAD(&queue->incoming);
-	INIT_LIST_HEAD(&queue->outgoing);
 
 	mutex_init(&queue->lock);
 	spin_lock_init(&queue->list_lock);
@@ -645,7 +648,6 @@ void iio_dma_buffer_exit(struct iio_dma_buffer_queue *queue)
 			continue;
 		queue->fileio.blocks[i]->state = IIO_BLOCK_STATE_DEAD;
 	}
-	INIT_LIST_HEAD(&queue->outgoing);
 	spin_unlock_irq(&queue->list_lock);
 
 	INIT_LIST_HEAD(&queue->incoming);
diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
index 6564bdcdac66..18d3702fa95d 100644
--- a/include/linux/iio/buffer-dma.h
+++ b/include/linux/iio/buffer-dma.h
@@ -19,14 +19,12 @@ struct device;
 
 /**
  * enum iio_block_state - State of a struct iio_dma_buffer_block
- * @IIO_BLOCK_STATE_DEQUEUED: Block is not queued
  * @IIO_BLOCK_STATE_QUEUED: Block is on the incoming queue
  * @IIO_BLOCK_STATE_ACTIVE: Block is currently being processed by the DMA
  * @IIO_BLOCK_STATE_DONE: Block is on the outgoing queue
  * @IIO_BLOCK_STATE_DEAD: Block has been marked as to be freed
  */
 enum iio_block_state {
-	IIO_BLOCK_STATE_DEQUEUED,
 	IIO_BLOCK_STATE_QUEUED,
 	IIO_BLOCK_STATE_ACTIVE,
 	IIO_BLOCK_STATE_DONE,
@@ -73,12 +71,15 @@ struct iio_dma_buffer_block {
  * @active_block: Block being used in read()
  * @pos: Read offset in the active block
  * @block_size: Size of each block
+ * @next_dequeue: index of next block that will be dequeued
  */
 struct iio_dma_buffer_queue_fileio {
 	struct iio_dma_buffer_block *blocks[2];
 	struct iio_dma_buffer_block *active_block;
 	size_t pos;
 	size_t block_size;
+
+	unsigned int next_dequeue;
 };
 
 /**
@@ -93,7 +94,6 @@ struct iio_dma_buffer_queue_fileio {
  *   list and typically also a list of active blocks in the part that handles
  *   the DMA controller
  * @incoming: List of buffers on the incoming queue
- * @outgoing: List of buffers on the outgoing queue
  * @active: Whether the buffer is currently active
  * @fileio: FileIO state
  */
@@ -105,7 +105,6 @@ struct iio_dma_buffer_queue {
 	struct mutex lock;
 	spinlock_t list_lock;
 	struct list_head incoming;
-	struct list_head outgoing;
 
 	bool active;
 
-- 
2.34.1

