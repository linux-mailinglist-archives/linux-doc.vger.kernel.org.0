Return-Path: <linux-doc+bounces-17748-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 721C08FC9DA
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2024 13:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 121131F255F1
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2024 11:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EEF194132;
	Wed,  5 Jun 2024 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="WtNPhX1v"
X-Original-To: linux-doc@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A7B192B85;
	Wed,  5 Jun 2024 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585790; cv=none; b=fKfdPWHG0hgGiwq+gBXYSy2z/kELGiRAun6Tr11UNqQT6PNror4sUyTickjObndN+3lzrK91zknyamj/nIanB9kbyBQwVgzTd4fj4qsIi19I89zoZmdyru9n6eVnuC15WAWmYWwgyn13+aJkHdHABJjtCxd6JimIAHIi68VR9Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585790; c=relaxed/simple;
	bh=u9+c6wVNF78e6GyDk+6bMnAW0JBJDD1opDEfpOd/3VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdv9J3juYQm1SYc06T5xBNBkTdnqpR6gI4LuCxpzqRU7eKXRhWXYuRB7if6y0oS1GjoqONrxIAV1aj/pxDLUWTonUQaiUIvievIEdRfgNbj1gYjCGH+VSt3LKZsRV6RNMVxWkjDc/VwIHBZxcpMKLtSnLiNQ+bLkm4FgthBaeqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=WtNPhX1v; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1717585743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSABxmTqsywGV191EjxiHZ1qFDB0JGwtzve6lD4D3Pk=;
	b=WtNPhX1vq75wIUQwfWJmsw1rDYwhrWW/nFT5oO/gsR3cHbt/KhMQtfBnSN09LW9DoDX4Jk
	sOU44k5Es2Ms8IrSi01TmErzJHbt6oXkcS+4IYr4257kWgug9iYGr8uMQk2flYp34KDCD7
	he3axQR5MD4AHKtPp0xoqmFNHWtLrdk=
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
Subject: [PATCH v10 5/6] iio: buffer-dmaengine: Support new DMABUF based userspace API
Date: Wed,  5 Jun 2024 13:08:44 +0200
Message-ID: <20240605110845.86740-6-paul@crapouillou.net>
In-Reply-To: <20240605110845.86740-1-paul@crapouillou.net>
References: <20240605110845.86740-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the functions provided by the buffer-dma core to implement the
DMABUF userspace API in the buffer-dmaengine IIO buffer implementation.

Since we want to be able to transfer an arbitrary number of bytes and
not necesarily the full DMABUF, the associated scatterlist is converted
to an array of DMA addresses + lengths, which is then passed to
dmaengine_prep_slave_dma_array().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>

---
v3: Use the new dmaengine_prep_slave_dma_array(), and adapt the code to
    work with the new functions introduced in industrialio-buffer-dma.c.

v5: - Use the new dmaengine_prep_slave_dma_vec().
    - Restrict to input buffers, since output buffers are not yet
      supported by IIO buffers.

v6: - Populate .lock_queue / .unlock_queue callbacks
    - Switch to atomic memory allocations in .submit_queue, because of
      the dma_fence critical section
    - Make sure that the size of the scatterlist is enough

v7: Adapted patch for the changes made in patch 1.

v10:
  - Remove extra flags parameter to dmaengine_prep_peripheral_dma_vec()
  - Add support for TX transfers
---
 .../buffer/industrialio-buffer-dmaengine.c    | 62 ++++++++++++++++---
 1 file changed, 53 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
index 918f6f8d65b6..12aa1412dfa0 100644
--- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
+++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
@@ -65,25 +65,62 @@ static int iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 		iio_buffer_to_dmaengine_buffer(&queue->buffer);
 	struct dma_async_tx_descriptor *desc;
 	enum dma_transfer_direction dma_dir;
+	struct scatterlist *sgl;
+	struct dma_vec *vecs;
 	size_t max_size;
 	dma_cookie_t cookie;
+	size_t len_total;
+	unsigned int i;
+	int nents;
 
 	max_size = min(block->size, dmaengine_buffer->max_size);
 	max_size = round_down(max_size, dmaengine_buffer->align);
 
-	if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN) {
-		block->bytes_used = max_size;
+	if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN)
 		dma_dir = DMA_DEV_TO_MEM;
-	} else {
+	else
 		dma_dir = DMA_MEM_TO_DEV;
-	}
 
-	if (!block->bytes_used || block->bytes_used > max_size)
-		return -EINVAL;
+	if (block->sg_table) {
+		sgl = block->sg_table->sgl;
+		nents = sg_nents_for_len(sgl, block->bytes_used);
+		if (nents < 0)
+			return nents;
+
+		vecs = kmalloc_array(nents, sizeof(*vecs), GFP_ATOMIC);
+		if (!vecs)
+			return -ENOMEM;
+
+		len_total = block->bytes_used;
+
+		for (i = 0; i < nents; i++) {
+			vecs[i].addr = sg_dma_address(sgl);
+			vecs[i].len = min(sg_dma_len(sgl), len_total);
+			len_total -= vecs[i].len;
+
+			sgl = sg_next(sgl);
+		}
 
-	desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
-		block->phys_addr, block->bytes_used, dma_dir,
-		DMA_PREP_INTERRUPT);
+		desc = dmaengine_prep_peripheral_dma_vec(dmaengine_buffer->chan,
+							 vecs, nents, dma_dir,
+							 DMA_PREP_INTERRUPT);
+		kfree(vecs);
+	} else {
+		max_size = min(block->size, dmaengine_buffer->max_size);
+		max_size = round_down(max_size, dmaengine_buffer->align);
+
+		if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN)
+			block->bytes_used = max_size;
+
+		if (!block->bytes_used || block->bytes_used > max_size)
+			return -EINVAL;
+
+		desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
+						   block->phys_addr,
+						   block->bytes_used,
+						   dma_dir,
+						   DMA_PREP_INTERRUPT);
+	}
 	if (!desc)
 		return -ENOMEM;
 
@@ -133,6 +170,13 @@ static const struct iio_buffer_access_funcs iio_dmaengine_buffer_ops = {
 	.space_available = iio_dma_buffer_usage,
 	.release = iio_dmaengine_buffer_release,
 
+	.enqueue_dmabuf = iio_dma_buffer_enqueue_dmabuf,
+	.attach_dmabuf = iio_dma_buffer_attach_dmabuf,
+	.detach_dmabuf = iio_dma_buffer_detach_dmabuf,
+
+	.lock_queue = iio_dma_buffer_lock_queue,
+	.unlock_queue = iio_dma_buffer_unlock_queue,
+
 	.modes = INDIO_BUFFER_HARDWARE,
 	.flags = INDIO_BUFFER_FLAG_FIXED_WATERMARK,
 };
-- 
2.43.0


