Return-Path: <linux-doc+bounces-18801-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D090C8E4
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jun 2024 13:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D697B1F221B8
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jun 2024 11:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1301B211864;
	Tue, 18 Jun 2024 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="0LWZ6MzB"
X-Original-To: linux-doc@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C4A21185D;
	Tue, 18 Jun 2024 10:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705027; cv=none; b=eLK+xuO2KEhqIudeE3VdUTip4XpAEBA3srBjaNPjN9hUdI1GRPES/udU5MQ73qTyCo2qEuBKfYgVLA1fx3JPyXUBa2n4rjb4O0eFsUYwgwEPvEci+010SE5bXt2AN9VrrJRab1fIum9gi7m1DgbqdatdwrzYbcYoCIy4i/AxhGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705027; c=relaxed/simple;
	bh=9nxPZJV52biBvQqGqNxuUzmHMaejoRQTHgMVlZWo0Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ev55b9+rPjncoiVKvjdl/tdyJXYNvYSyE/QiLR+3PF7iHT+CIq9gbZ1/0Y8pfR6nkd0ihMOlaQuvSaknoUjneR53byy+HvsZuR8v9knuEjhbNlOc/xZ7y1fyBiDWjSPasEI/UkztWVTWraikCGdfcc77vIMGneHXZzS+DMz+YyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=0LWZ6MzB; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1718704993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJGLLTUoKxRUUmCuADS9MQUDO1mER8ltDHfR++/AYpU=;
	b=0LWZ6MzBOwXMe0746Ig/amfg+ym8bWVZoW6F7KKbMNQixahlhpOlraX9dMPU9L/0kUR4K/
	nZXGGY69LOzmiNBAx4Yx3suDhil9TAHi6i2GMEJq4TF76cs0Zv7t3FzlfngqMV80inalGj
	jDzZV7l57HGTJhOxS+M+otDK3+bGK3c=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Vinod Koul <vkoul@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Nuno Sa <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v11 4/7] iio: buffer-dma: Enable support for DMABUFs
Date: Tue, 18 Jun 2024 12:02:59 +0200
Message-ID: <20240618100302.72886-5-paul@crapouillou.net>
In-Reply-To: <20240618100302.72886-1-paul@crapouillou.net>
References: <20240618100302.72886-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement iio_dma_buffer_attach_dmabuf(), iio_dma_buffer_detach_dmabuf()
and iio_dma_buffer_transfer_dmabuf(), which can then be used by the IIO
DMA buffer implementations.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Co-developed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>

---
v3: Update code to provide the functions that will be used as callbacks
    for the new IOCTLs.

v6: - Update iio_dma_buffer_enqueue_dmabuf() to take a dma_fence pointer
    - Pass that dma_fence pointer along to
      iio_buffer_signal_dmabuf_done()
    - Add iio_dma_buffer_lock_queue() / iio_dma_buffer_unlock_queue()
    - Do not lock the queue in iio_dma_buffer_enqueue_dmabuf().
      The caller will ensure that it has been locked already.
    - Replace "int += bool;" by "if (bool) int++;"
    - Use dma_fence_begin/end_signalling in the dma_fence critical
      sections
    - Use one "num_dmabufs" fields instead of one "num_blocks" and one
      "num_fileio_blocks". Make it an atomic_t, which makes it possible
      to decrement it atomically in iio_buffer_block_release() without
      having to lock the queue mutex; and in turn, it means that we
      don't need to use iio_buffer_block_put_atomic() everywhere to
      avoid locking the queue mutex twice.
    - Use cleanup.h guard(mutex) when possible
    - Explicitely list all states in the switch in
      iio_dma_can_enqueue_block()
    - Rename iio_dma_buffer_fileio_mode() to
      iio_dma_buffer_can_use_fileio(), and add a comment explaining why
      it cannot race vs. DMABUF.

v11:
    - Remove useless field "attach" in struct iio_dma_buffer_block
    - Document "sg_table" and "fence" fields in struct iio_block_state
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 178 +++++++++++++++++--
 include/linux/iio/buffer-dma.h               |  31 ++++
 2 files changed, 198 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 13b1a858969e..647f417a045e 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -4,6 +4,8 @@
  *  Author: Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <linux/atomic.h>
+#include <linux/cleanup.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -14,6 +16,8 @@
 #include <linux/poll.h>
 #include <linux/iio/buffer_impl.h>
 #include <linux/iio/buffer-dma.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-fence.h>
 #include <linux/dma-mapping.h>
 #include <linux/sizes.h>
 
@@ -94,13 +98,18 @@ static void iio_buffer_block_release(struct kref *kref)
 {
 	struct iio_dma_buffer_block *block = container_of(kref,
 		struct iio_dma_buffer_block, kref);
+	struct iio_dma_buffer_queue *queue = block->queue;
 
-	WARN_ON(block->state != IIO_BLOCK_STATE_DEAD);
+	WARN_ON(block->fileio && block->state != IIO_BLOCK_STATE_DEAD);
 
-	dma_free_coherent(block->queue->dev, PAGE_ALIGN(block->size),
-					block->vaddr, block->phys_addr);
+	if (block->fileio) {
+		dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
+				  block->vaddr, block->phys_addr);
+	} else {
+		atomic_dec(&queue->num_dmabufs);
+	}
 
-	iio_buffer_put(&block->queue->buffer);
+	iio_buffer_put(&queue->buffer);
 	kfree(block);
 }
 
@@ -163,7 +172,7 @@ static struct iio_dma_buffer_queue *iio_buffer_to_queue(struct iio_buffer *buf)
 }
 
 static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
-	struct iio_dma_buffer_queue *queue, size_t size)
+	struct iio_dma_buffer_queue *queue, size_t size, bool fileio)
 {
 	struct iio_dma_buffer_block *block;
 
@@ -171,13 +180,16 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 	if (!block)
 		return NULL;
 
-	block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
-		&block->phys_addr, GFP_KERNEL);
-	if (!block->vaddr) {
-		kfree(block);
-		return NULL;
+	if (fileio) {
+		block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
+						  &block->phys_addr, GFP_KERNEL);
+		if (!block->vaddr) {
+			kfree(block);
+			return NULL;
+		}
 	}
 
+	block->fileio = fileio;
 	block->size = size;
 	block->state = IIO_BLOCK_STATE_DONE;
 	block->queue = queue;
@@ -186,6 +198,9 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 
 	iio_buffer_get(&queue->buffer);
 
+	if (!fileio)
+		atomic_inc(&queue->num_dmabufs);
+
 	return block;
 }
 
@@ -218,13 +233,20 @@ void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
 {
 	struct iio_dma_buffer_queue *queue = block->queue;
 	unsigned long flags;
+	bool cookie;
+
+	cookie = dma_fence_begin_signalling();
 
 	spin_lock_irqsave(&queue->list_lock, flags);
 	_iio_dma_buffer_block_done(block);
 	spin_unlock_irqrestore(&queue->list_lock, flags);
 
+	if (!block->fileio)
+		iio_buffer_signal_dmabuf_done(block->fence, 0);
+
 	iio_buffer_block_put_atomic(block);
 	iio_dma_buffer_queue_wake(queue);
+	dma_fence_end_signalling(cookie);
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
 
@@ -243,17 +265,27 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
 {
 	struct iio_dma_buffer_block *block, *_block;
 	unsigned long flags;
+	bool cookie;
+
+	cookie = dma_fence_begin_signalling();
 
 	spin_lock_irqsave(&queue->list_lock, flags);
 	list_for_each_entry_safe(block, _block, list, head) {
 		list_del(&block->head);
 		block->bytes_used = 0;
 		_iio_dma_buffer_block_done(block);
+
+		if (!block->fileio)
+			iio_buffer_signal_dmabuf_done(block->fence, -EINTR);
 		iio_buffer_block_put_atomic(block);
 	}
 	spin_unlock_irqrestore(&queue->list_lock, flags);
 
+	if (queue->fileio.enabled)
+		queue->fileio.enabled = false;
+
 	iio_dma_buffer_queue_wake(queue);
+	dma_fence_end_signalling(cookie);
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_block_list_abort);
 
@@ -273,6 +305,16 @@ static bool iio_dma_block_reusable(struct iio_dma_buffer_block *block)
 	}
 }
 
+static bool iio_dma_buffer_can_use_fileio(struct iio_dma_buffer_queue *queue)
+{
+	/*
+	 * Note that queue->num_dmabufs cannot increase while the queue is
+	 * locked, it can only decrease, so it does not race against
+	 * iio_dma_buffer_alloc_block().
+	 */
+	return queue->fileio.enabled || !atomic_read(&queue->num_dmabufs);
+}
+
 /**
  * iio_dma_buffer_request_update() - DMA buffer request_update callback
  * @buffer: The buffer which to request an update
@@ -299,6 +341,12 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 
 	mutex_lock(&queue->lock);
 
+	queue->fileio.enabled = iio_dma_buffer_can_use_fileio(queue);
+
+	/* If DMABUFs were created, disable fileio interface */
+	if (!queue->fileio.enabled)
+		goto out_unlock;
+
 	/* Allocations are page aligned */
 	if (PAGE_ALIGN(queue->fileio.block_size) == PAGE_ALIGN(size))
 		try_reuse = true;
@@ -339,7 +387,7 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 		}
 
 		if (!block) {
-			block = iio_dma_buffer_alloc_block(queue, size);
+			block = iio_dma_buffer_alloc_block(queue, size, true);
 			if (!block) {
 				ret = -ENOMEM;
 				goto out_unlock;
@@ -412,8 +460,12 @@ static void iio_dma_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 
 	block->state = IIO_BLOCK_STATE_ACTIVE;
 	iio_buffer_block_get(block);
+
 	ret = queue->ops->submit(queue, block);
 	if (ret) {
+		if (!block->fileio)
+			iio_buffer_signal_dmabuf_done(block->fence, ret);
+
 		/*
 		 * This is a bit of a problem and there is not much we can do
 		 * other then wait for the buffer to be disabled and re-enabled
@@ -646,6 +698,110 @@ size_t iio_dma_buffer_usage(struct iio_buffer *buf)
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_usage);
 
+struct iio_dma_buffer_block *
+iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
+			     struct dma_buf_attachment *attach)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+	struct iio_dma_buffer_block *block;
+
+	guard(mutex)(&queue->lock);
+
+	/*
+	 * If the buffer is enabled and in fileio mode new blocks can't be
+	 * allocated.
+	 */
+	if (queue->fileio.enabled)
+		return ERR_PTR(-EBUSY);
+
+	block = iio_dma_buffer_alloc_block(queue, attach->dmabuf->size, false);
+	if (!block)
+		return ERR_PTR(-ENOMEM);
+
+	/* Free memory that might be in use for fileio mode */
+	iio_dma_buffer_fileio_free(queue);
+
+	return block;
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_attach_dmabuf);
+
+void iio_dma_buffer_detach_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block)
+{
+	block->state = IIO_BLOCK_STATE_DEAD;
+	iio_buffer_block_put_atomic(block);
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_detach_dmabuf);
+
+static int iio_dma_can_enqueue_block(struct iio_dma_buffer_block *block)
+{
+	struct iio_dma_buffer_queue *queue = block->queue;
+
+	/* If in fileio mode buffers can't be enqueued. */
+	if (queue->fileio.enabled)
+		return -EBUSY;
+
+	switch (block->state) {
+	case IIO_BLOCK_STATE_QUEUED:
+		return -EPERM;
+	case IIO_BLOCK_STATE_ACTIVE:
+	case IIO_BLOCK_STATE_DEAD:
+		return -EBUSY;
+	case IIO_BLOCK_STATE_DONE:
+		break;
+	}
+
+	return 0;
+}
+
+int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block,
+				  struct dma_fence *fence,
+				  struct sg_table *sgt,
+				  size_t size, bool cyclic)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+	bool cookie;
+	int ret;
+
+	WARN_ON(!mutex_is_locked(&queue->lock));
+
+	cookie = dma_fence_begin_signalling();
+
+	ret = iio_dma_can_enqueue_block(block);
+	if (ret < 0)
+		goto out_end_signalling;
+
+	block->bytes_used = size;
+	block->cyclic = cyclic;
+	block->sg_table = sgt;
+	block->fence = fence;
+
+	iio_dma_buffer_enqueue(queue, block);
+
+out_end_signalling:
+	dma_fence_end_signalling(cookie);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_enqueue_dmabuf);
+
+void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+
+	mutex_lock(&queue->lock);
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_lock_queue);
+
+void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+
+	mutex_unlock(&queue->lock);
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_unlock_queue);
+
 /**
  * iio_dma_buffer_set_bytes_per_datum() - DMA buffer set_bytes_per_datum callback
  * @buffer: Buffer to set the bytes-per-datum for
diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
index 6e27e47077d5..5eb66a399002 100644
--- a/include/linux/iio/buffer-dma.h
+++ b/include/linux/iio/buffer-dma.h
@@ -7,6 +7,7 @@
 #ifndef __INDUSTRIALIO_DMA_BUFFER_H__
 #define __INDUSTRIALIO_DMA_BUFFER_H__
 
+#include <linux/atomic.h>
 #include <linux/list.h>
 #include <linux/kref.h>
 #include <linux/spinlock.h>
@@ -16,6 +17,9 @@
 struct iio_dma_buffer_queue;
 struct iio_dma_buffer_ops;
 struct device;
+struct dma_buf_attachment;
+struct dma_fence;
+struct sg_table;
 
 /**
  * enum iio_block_state - State of a struct iio_dma_buffer_block
@@ -41,6 +45,10 @@ enum iio_block_state {
  * @queue: Parent DMA buffer queue
  * @kref: kref used to manage the lifetime of block
  * @state: Current state of the block
+ * @cyclic: True if this is a cyclic buffer
+ * @fileio: True if this buffer is used for fileio mode
+ * @sg_table: DMA table for the transfer when transferring a DMABUF
+ * @fence: DMA fence to be signaled when a DMABUF transfer is complete
  */
 struct iio_dma_buffer_block {
 	/* May only be accessed by the owner of the block */
@@ -63,6 +71,12 @@ struct iio_dma_buffer_block {
 	 * queue->list_lock if the block is not owned by the core.
 	 */
 	enum iio_block_state state;
+
+	bool cyclic;
+	bool fileio;
+
+	struct sg_table *sg_table;
+	struct dma_fence *fence;
 };
 
 /**
@@ -72,6 +86,7 @@ struct iio_dma_buffer_block {
  * @pos: Read offset in the active block
  * @block_size: Size of each block
  * @next_dequeue: index of next block that will be dequeued
+ * @enabled: Whether the buffer is operating in fileio mode
  */
 struct iio_dma_buffer_queue_fileio {
 	struct iio_dma_buffer_block *blocks[2];
@@ -80,6 +95,7 @@ struct iio_dma_buffer_queue_fileio {
 	size_t block_size;
 
 	unsigned int next_dequeue;
+	bool enabled;
 };
 
 /**
@@ -95,6 +111,7 @@ struct iio_dma_buffer_queue_fileio {
  *   the DMA controller
  * @incoming: List of buffers on the incoming queue
  * @active: Whether the buffer is currently active
+ * @num_dmabufs: Total number of DMABUFs attached to this queue
  * @fileio: FileIO state
  */
 struct iio_dma_buffer_queue {
@@ -107,6 +124,7 @@ struct iio_dma_buffer_queue {
 	struct list_head incoming;
 
 	bool active;
+	atomic_t num_dmabufs;
 
 	struct iio_dma_buffer_queue_fileio fileio;
 };
@@ -144,4 +162,17 @@ int iio_dma_buffer_init(struct iio_dma_buffer_queue *queue,
 void iio_dma_buffer_exit(struct iio_dma_buffer_queue *queue);
 void iio_dma_buffer_release(struct iio_dma_buffer_queue *queue);
 
+struct iio_dma_buffer_block *
+iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
+			     struct dma_buf_attachment *attach);
+void iio_dma_buffer_detach_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block);
+int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block,
+				  struct dma_fence *fence,
+				  struct sg_table *sgt,
+				  size_t size, bool cyclic);
+void iio_dma_buffer_lock_queue(struct iio_buffer *buffer);
+void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer);
+
 #endif
-- 
2.43.0


