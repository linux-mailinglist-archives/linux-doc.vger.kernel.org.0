Return-Path: <linux-doc+bounces-12881-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940488EC7F
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 18:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DABE1C2E68A
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 17:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7879614E2DC;
	Wed, 27 Mar 2024 17:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hsP477k2"
X-Original-To: linux-doc@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350814E2CD;
	Wed, 27 Mar 2024 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711560112; cv=none; b=B8DOuDQONUFN299iZlm75Iod9w9l6kiqeRGtU+ffgB1IBGbMNfFuUcSxYy+l0fOZh5xPw9zPGcV2EoZxUBzXxfQodmrgDUClEtfaoUW1JsSuB6vq8MRzFNJ6EBkbpLzUKRf8TFSSp3V0yAgiOJc9LY7IG0fAdMZ14UQyZfPf5nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711560112; c=relaxed/simple;
	bh=WN2L+0j7iMiOZ5aTEZFuPDxdOaNryuDOQVa9EQmsxA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z/QqZjQyPIm9j5kGdoLB5N8w79ECq8TFy9bb9vuZ1dZX5OEJXvTs3YpKxtdpSGGJ6AAEEe5iJnYv+xdAs70rEQSK/mkWqquQjXQiHNHDbYSKGhAyrkloxitNasuYpITUaJ8ocXJxKIh+zz34H4eEx83g/MLO2MYrHDL+QnIGmNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hsP477k2; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42RHLACs025629;
	Wed, 27 Mar 2024 12:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1711560070;
	bh=yjpJ3hsXQbeK1yHG6JzJa2XM1CgiXbMK7UCDuiQfnPg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hsP477k2f1JXNp3Xy576HZSpHQXpIgYIqZ5Q2tpPgKGTgwMNFPFH9u7M9Hdxj2YH1
	 LaLQyfT8J/g05GqD8fQuApdZcR+yxSBDgCXrKq9k77EVkzB0yZqbod1wRrYGpQoZ0b
	 MqtyAVwpMuGXuTaOxJ9RsgsW8Ni3hFZT/XS4HnU8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42RHLAGu009787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Mar 2024 12:21:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Mar 2024 12:21:10 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Mar 2024 12:21:10 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42RHL9Cb107382;
	Wed, 27 Mar 2024 12:21:09 -0500
Message-ID: <7f175cf2-0eb0-452f-b2db-881d8a9b215c@ti.com>
Date: Wed, 27 Mar 2024 12:21:09 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] iio: core: Add new DMABUF interface infrastructure
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron <jic23@kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul
	<vkoul@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
CC: Nuno Sa <nuno.sa@analog.com>,
        Michael Hennerich
	<michael.hennerich@analog.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
References: <20240310124836.31863-1-paul@crapouillou.net>
 <20240310124836.31863-4-paul@crapouillou.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240310124836.31863-4-paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 3/10/24 7:48 AM, Paul Cercueil wrote:
> Add the necessary infrastructure to the IIO core to support a new
> optional DMABUF based interface.
> 
> With this new interface, DMABUF objects (externally created) can be
> attached to a IIO buffer, and subsequently used for data transfer.
> 
> A userspace application can then use this interface to share DMABUF
> objects between several interfaces, allowing it to transfer data in a
> zero-copy fashion, for instance between IIO and the USB stack.
> 
> The userspace application can also memory-map the DMABUF objects, and
> access the sample data directly. The advantage of doing this vs. the
> read() interface is that it avoids an extra copy of the data between the
> kernel and userspace. This is particularly userful for high-speed
> devices which produce several megabytes or even gigabytes of data per
> second.
> 
> As part of the interface, 3 new IOCTLs have been added:
> 
> IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
>   Attach the DMABUF object identified by the given file descriptor to the
>   buffer.
> 
> IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
>   Detach the DMABUF object identified by the given file descriptor from
>   the buffer. Note that closing the IIO buffer's file descriptor will
>   automatically detach all previously attached DMABUF objects.
> 
> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
>   Request a data transfer to/from the given DMABUF object. Its file
>   descriptor, as well as the transfer size and flags are provided in the
>   "iio_dmabuf" structure.
> 
> These three IOCTLs have to be performed on the IIO buffer's file
> descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> 
> ---
> v2: Only allow the new IOCTLs on the buffer FD created with
>      IIO_BUFFER_GET_FD_IOCTL().
> 
> v3: - Get rid of the old IOCTLs. The IIO subsystem does not create or
>      manage DMABUFs anymore, and only attaches/detaches externally
>      created DMABUFs.
>      - Add IIO_BUFFER_DMABUF_CYCLIC to the supported flags.
> 
> v5: - Use dev_err() instead of pr_err()
>      - Inline to_iio_dma_fence()
>      - Add comment to explain why we unref twice when detaching dmabuf
>      - Remove TODO comment. It is actually safe to free the file's
>        private data even when transfers are still pending because it
>        won't be accessed.
>      - Fix documentation of new fields in struct iio_buffer_access_funcs
>      - iio_dma_resv_lock() does not need to be exported, make it static
> 
> v6: - Remove dead code in iio_dma_resv_lock()
>      - Fix non-block actually blocking
>      - Cache dma_buf_attachment instead of mapping/unmapping it for every
>        transfer
>      - Return -EINVAL instead of IIO_IOCTL_UNHANDLED for unknown ioctl
>      - Make .block_enqueue() callback take a dma_fence pointer, which
>        will be passed to iio_buffer_signal_dmabuf_done() instead of the
>        dma_buf_attachment; and remove the backpointer from the priv
>        structure to the dma_fence.
>      - Use dma_fence_begin/end_signalling in the dma_fence critical
>        sections
>      - Unref dma_fence and dma_buf_attachment in worker, because they
>        might try to lock the dma_resv, which would deadlock.
>      - Add buffer ops to lock/unlock the queue. This is motivated by the
>        fact that once the dma_fence has been installed, we cannot lock
>        anything anymore - so the queue must be locked before the
>        dma_fence is installed.
>      - Use 'long retl' variable to handle the return value of
>        dma_resv_wait_timeout()
>      - Protect dmabufs list access with a mutex
>      - Rework iio_buffer_find_attachment() to use the internal dmabufs
>        list, instead of messing with dmabufs private data.
>      - Add an atomically-increasing sequence number for fences
> 
> v8  - Fix swapped fence direction
>      - Simplify fence wait mechanism
>      - Remove "Buffer closed with active transfers" print, as it was dead
>        code
>      - Un-export iio_buffer_dmabuf_{get,put}. They are not used anywhere
>        else so they can even be static.
>      - Prevent attaching already-attached DMABUFs
> 
> v9: - Select DMA_SHARED_BUFFER in Kconfig
>      - Remove useless forward declaration of 'iio_dma_fence'
>      - Import DMA-BUF namespace
>      - Add missing __user tag to iio_buffer_detach_dmabuf() argument
> ---
>   drivers/iio/Kconfig               |   1 +
>   drivers/iio/industrialio-buffer.c | 462 ++++++++++++++++++++++++++++++
>   include/linux/iio/buffer_impl.h   |  30 ++
>   include/uapi/linux/iio/buffer.h   |  22 ++
>   4 files changed, 515 insertions(+)
> 
> diff --git a/drivers/iio/Kconfig b/drivers/iio/Kconfig
> index 9c351ffc7bed..661127aed2f9 100644
> --- a/drivers/iio/Kconfig
> +++ b/drivers/iio/Kconfig
> @@ -14,6 +14,7 @@ if IIO
>   
>   config IIO_BUFFER
>   	bool "Enable buffer support within IIO"
> +	select DMA_SHARED_BUFFER
>   	help
>   	  Provide core support for various buffer based data
>   	  acquisition methods.
> diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
> index b581a7e80566..a987654f82fc 100644
> --- a/drivers/iio/industrialio-buffer.c
> +++ b/drivers/iio/industrialio-buffer.c
> @@ -9,14 +9,19 @@
>    * - Better memory allocation techniques?
>    * - Alternative access techniques?
>    */
> +#include <linux/atomic.h>
>   #include <linux/anon_inodes.h>
>   #include <linux/kernel.h>
>   #include <linux/export.h>
>   #include <linux/device.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-fence.h>
> +#include <linux/dma-resv.h>
>   #include <linux/file.h>
>   #include <linux/fs.h>
>   #include <linux/cdev.h>
>   #include <linux/slab.h>
> +#include <linux/mm.h>
>   #include <linux/poll.h>
>   #include <linux/sched/signal.h>
>   
> @@ -28,6 +33,32 @@
>   #include <linux/iio/buffer.h>
>   #include <linux/iio/buffer_impl.h>
>   
> +#define DMABUF_ENQUEUE_TIMEOUT_MS 5000
> +
> +MODULE_IMPORT_NS(DMA_BUF);
> +
> +struct iio_dmabuf_priv {
> +	struct list_head entry;
> +	struct kref ref;
> +
> +	struct iio_buffer *buffer;
> +	struct iio_dma_buffer_block *block;
> +
> +	u64 context;
> +	spinlock_t lock;
> +
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	enum dma_data_direction dir;
> +	atomic_t seqno;
> +};
> +
> +struct iio_dma_fence {
> +	struct dma_fence base;
> +	struct iio_dmabuf_priv *priv;
> +	struct work_struct work;
> +};
> +
>   static const char * const iio_endian_prefix[] = {
>   	[IIO_BE] = "be",
>   	[IIO_LE] = "le",
> @@ -332,6 +363,8 @@ void iio_buffer_init(struct iio_buffer *buffer)
>   {
>   	INIT_LIST_HEAD(&buffer->demux_list);
>   	INIT_LIST_HEAD(&buffer->buffer_list);
> +	INIT_LIST_HEAD(&buffer->dmabufs);
> +	mutex_init(&buffer->dmabufs_mutex);
>   	init_waitqueue_head(&buffer->pollq);
>   	kref_init(&buffer->ref);
>   	if (!buffer->watermark)
> @@ -1519,14 +1552,57 @@ static void iio_buffer_unregister_legacy_sysfs_groups(struct iio_dev *indio_dev)
>   	kfree(iio_dev_opaque->legacy_scan_el_group.attrs);
>   }
>   
> +static void iio_buffer_dmabuf_release(struct kref *ref)
> +{
> +	struct iio_dmabuf_priv *priv = container_of(ref, struct iio_dmabuf_priv, ref);
> +	struct dma_buf_attachment *attach = priv->attach;
> +	struct iio_buffer *buffer = priv->buffer;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +
> +	dma_resv_lock(dmabuf->resv, NULL);
> +	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	buffer->access->detach_dmabuf(buffer, priv->block);
> +
> +	dma_buf_detach(attach->dmabuf, attach);
> +	dma_buf_put(dmabuf);
> +	kfree(priv);
> +}
> +
> +static void iio_buffer_dmabuf_get(struct dma_buf_attachment *attach)
> +{
> +	struct iio_dmabuf_priv *priv = attach->importer_priv;
> +
> +	kref_get(&priv->ref);
> +}
> +
> +static void iio_buffer_dmabuf_put(struct dma_buf_attachment *attach)
> +{
> +	struct iio_dmabuf_priv *priv = attach->importer_priv;
> +
> +	kref_put(&priv->ref, iio_buffer_dmabuf_release);
> +}
> +
>   static int iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
>   {
>   	struct iio_dev_buffer_pair *ib = filep->private_data;
>   	struct iio_dev *indio_dev = ib->indio_dev;
>   	struct iio_buffer *buffer = ib->buffer;
> +	struct iio_dmabuf_priv *priv, *tmp;
>   
>   	wake_up(&buffer->pollq);
>   
> +	mutex_lock(&buffer->dmabufs_mutex);
> +
> +	/* Close all attached DMABUFs */
> +	list_for_each_entry_safe(priv, tmp, &buffer->dmabufs, entry) {
> +		list_del_init(&priv->entry);
> +		iio_buffer_dmabuf_put(priv->attach);
> +	}
> +
> +	mutex_unlock(&buffer->dmabufs_mutex);
> +
>   	kfree(ib);
>   	clear_bit(IIO_BUSY_BIT_POS, &buffer->flags);
>   	iio_device_put(indio_dev);
> @@ -1534,11 +1610,396 @@ static int iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
>   	return 0;
>   }
>   
> +static int iio_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
> +{
> +	if (!nonblock)
> +		return dma_resv_lock_interruptible(dmabuf->resv, NULL);
> +
> +	if (!dma_resv_trylock(dmabuf->resv))
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
> +static struct dma_buf_attachment *
> +iio_buffer_find_attachment(struct iio_dev_buffer_pair *ib,
> +			   struct dma_buf *dmabuf, bool nonblock)
> +{
> +	struct device *dev = ib->indio_dev->dev.parent;
> +	struct iio_buffer *buffer = ib->buffer;
> +	struct dma_buf_attachment *attach = NULL;
> +	struct iio_dmabuf_priv *priv;
> +
> +	mutex_lock(&buffer->dmabufs_mutex);
> +
> +	list_for_each_entry(priv, &buffer->dmabufs, entry) {
> +		if (priv->attach->dev == dev
> +		    && priv->attach->dmabuf == dmabuf) {
> +			attach = priv->attach;
> +			break;
> +		}
> +	}
> +
> +	if (attach)
> +		iio_buffer_dmabuf_get(attach);
> +
> +	mutex_unlock(&buffer->dmabufs_mutex);
> +
> +	return attach ?: ERR_PTR(-EPERM);
> +}
> +
> +static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
> +				    int __user *user_fd, bool nonblock)
> +{
> +	struct iio_dev *indio_dev = ib->indio_dev;
> +	struct iio_buffer *buffer = ib->buffer;
> +	struct dma_buf_attachment *attach;
> +	struct iio_dmabuf_priv *priv, *each;
> +	struct dma_buf *dmabuf;
> +	int err, fd;
> +
> +	if (!buffer->access->attach_dmabuf
> +	    || !buffer->access->detach_dmabuf
> +	    || !buffer->access->enqueue_dmabuf)
> +		return -EPERM;
> +
> +	if (copy_from_user(&fd, user_fd, sizeof(fd)))
> +		return -EFAULT;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->lock);
> +	priv->context = dma_fence_context_alloc(1);
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf)) {
> +		err = PTR_ERR(dmabuf);
> +		goto err_free_priv;
> +	}
> +
> +	attach = dma_buf_attach(dmabuf, indio_dev->dev.parent);
> +	if (IS_ERR(attach)) {
> +		err = PTR_ERR(attach);
> +		goto err_dmabuf_put;
> +	}
> +
> +	err = iio_dma_resv_lock(dmabuf, nonblock);
> +	if (err)
> +		goto err_dmabuf_detach;
> +
> +	priv->dir = buffer->direction == IIO_BUFFER_DIRECTION_IN
> +		? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +
> +	priv->sgt = dma_buf_map_attachment(attach, priv->dir);

Part of the fundamental design of DMABUF is the ability for all
users of a buffer to attach to the buffer before any user maps that
buffer. This allows an exporter to do constraint solving based
on all the attached buffers at map time to select the best backing
memory.

I know none of the exporters do that right now, probably due to
most of the importers doing what you do here: attach then immediately
map. This prevents the split between attach and map from being useful.

I'd recommend only doing the dma_buf_map_attachment() later when you
use the buffer, maybe part of enqueue_dmabuf() step below. Then unmap()
it after you are done with it, not only when detaching.

As this change will not affect the UAPI (which only deals with
"attach" ioctl), then this comment should not be seen as a blocker
for taking this series. We should be able to make this change later,
but just something to think about.

Andrew

> +	if (IS_ERR(priv->sgt)) {
> +		err = PTR_ERR(priv->sgt);
> +		dev_err(&indio_dev->dev, "Unable to map attachment: %d\n", err);
> +		goto err_resv_unlock;
> +	}
> +
> +	kref_init(&priv->ref);
> +	priv->buffer = buffer;
> +	priv->attach = attach;
> +	attach->importer_priv = priv;
> +
> +	priv->block = buffer->access->attach_dmabuf(buffer, attach);
> +	if (IS_ERR(priv->block)) {
> +		err = PTR_ERR(priv->block);
> +		goto err_dmabuf_unmap_attachment;
> +	}
> +
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	mutex_lock(&buffer->dmabufs_mutex);
> +
> +	/*
> +	 * Check whether we already have an attachment for this driver/DMABUF
> +	 * combo. If we do, refuse to attach.
> +	 */
> +	list_for_each_entry(each, &buffer->dmabufs, entry) {
> +		if (each->attach->dev == indio_dev->dev.parent
> +		    && each->attach->dmabuf == dmabuf) {
> +			/*
> +			 * We unlocked the reservation object, so going through
> +			 * the cleanup code would mean re-locking it first.
> +			 * At this stage it is simpler to free the attachment
> +			 * using iio_buffer_dma_put().
> +			 */
> +			mutex_unlock(&buffer->dmabufs_mutex);
> +			iio_buffer_dmabuf_put(attach);
> +			return -EBUSY;
> +		}
> +	}
> +
> +	/* Otherwise, add the new attachment to our dmabufs list. */
> +	list_add(&priv->entry, &buffer->dmabufs);
> +	mutex_unlock(&buffer->dmabufs_mutex);
> +
> +	return 0;
> +
> +err_dmabuf_unmap_attachment:
> +	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
> +err_resv_unlock:
> +	dma_resv_unlock(dmabuf->resv);
> +err_dmabuf_detach:
> +	dma_buf_detach(dmabuf, attach);
> +err_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +err_free_priv:
> +	kfree(priv);
> +
> +	return err;
> +}
> +
> +static int iio_buffer_detach_dmabuf(struct iio_dev_buffer_pair *ib,
> +				    int __user *user_req, bool nonblock)
> +{
> +	struct iio_buffer *buffer = ib->buffer;
> +	struct iio_dev *indio_dev = ib->indio_dev;
> +	struct iio_dmabuf_priv *priv;
> +	struct dma_buf *dmabuf;
> +	int dmabuf_fd, ret = -EPERM;
> +
> +	if (copy_from_user(&dmabuf_fd, user_req, sizeof(dmabuf_fd)))
> +		return -EFAULT;
> +
> +	dmabuf = dma_buf_get(dmabuf_fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	mutex_lock(&buffer->dmabufs_mutex);
> +
> +	list_for_each_entry(priv, &buffer->dmabufs, entry) {
> +		if (priv->attach->dev == indio_dev->dev.parent
> +		    && priv->attach->dmabuf == dmabuf) {
> +			list_del(&priv->entry);
> +
> +			/* Unref the reference from iio_buffer_attach_dmabuf() */
> +			iio_buffer_dmabuf_put(priv->attach);
> +			ret = 0;
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&buffer->dmabufs_mutex);
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +}
> +
> +static const char *
> +iio_buffer_dma_fence_get_driver_name(struct dma_fence *fence)
> +{
> +	return "iio";
> +}
> +
> +static void iio_buffer_dma_fence_release(struct dma_fence *fence)
> +{
> +	struct iio_dma_fence *iio_fence =
> +		container_of(fence, struct iio_dma_fence, base);
> +
> +	kfree(iio_fence);
> +}
> +
> +static const struct dma_fence_ops iio_buffer_dma_fence_ops = {
> +	.get_driver_name	= iio_buffer_dma_fence_get_driver_name,
> +	.get_timeline_name	= iio_buffer_dma_fence_get_driver_name,
> +	.release		= iio_buffer_dma_fence_release,
> +};
> +
> +static int iio_buffer_enqueue_dmabuf(struct iio_dev_buffer_pair *ib,
> +				     struct iio_dmabuf __user *iio_dmabuf_req,
> +				     bool nonblock)
> +{
> +	struct iio_buffer *buffer = ib->buffer;
> +	struct iio_dmabuf iio_dmabuf;
> +	struct dma_buf_attachment *attach;
> +	struct iio_dmabuf_priv *priv;
> +	struct iio_dma_fence *fence;
> +	struct dma_buf *dmabuf;
> +	unsigned long timeout;
> +	bool cookie, cyclic, dma_to_ram;
> +	long retl;
> +	u32 seqno;
> +	int ret;
> +
> +	if (copy_from_user(&iio_dmabuf, iio_dmabuf_req, sizeof(iio_dmabuf)))
> +		return -EFAULT;
> +
> +	if (iio_dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
> +		return -EINVAL;
> +
> +	cyclic = iio_dmabuf.flags & IIO_BUFFER_DMABUF_CYCLIC;
> +
> +	/* Cyclic flag is only supported on output buffers */
> +	if (cyclic && buffer->direction != IIO_BUFFER_DIRECTION_OUT)
> +		return -EINVAL;
> +
> +	dmabuf = dma_buf_get(iio_dmabuf.fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	if (!iio_dmabuf.bytes_used || iio_dmabuf.bytes_used > dmabuf->size) {
> +		ret = -EINVAL;
> +		goto err_dmabuf_put;
> +	}
> +
> +	attach = iio_buffer_find_attachment(ib, dmabuf, nonblock);
> +	if (IS_ERR(attach)) {
> +		ret = PTR_ERR(attach);
> +		goto err_dmabuf_put;
> +	}
> +
> +	priv = attach->importer_priv;
> +
> +	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> +	if (!fence) {
> +		ret = -ENOMEM;
> +		goto err_attachment_put;
> +	}
> +
> +	fence->priv = priv;
> +
> +	seqno = atomic_add_return(1, &priv->seqno);
> +
> +	/*
> +	 * The transfers are guaranteed to be processed in the order they are
> +	 * enqueued, so we can use a simple incrementing sequence number for
> +	 * the dma_fence.
> +	 */
> +	dma_fence_init(&fence->base, &iio_buffer_dma_fence_ops,
> +		       &priv->lock, priv->context, seqno);
> +
> +	ret = iio_dma_resv_lock(dmabuf, nonblock);
> +	if (ret)
> +		goto err_fence_put;
> +
> +	timeout = nonblock ? 0 : msecs_to_jiffies(DMABUF_ENQUEUE_TIMEOUT_MS);
> +	dma_to_ram = buffer->direction == IIO_BUFFER_DIRECTION_IN;
> +
> +	/* Make sure we don't have writers */
> +	retl = dma_resv_wait_timeout(dmabuf->resv,
> +				     dma_resv_usage_rw(dma_to_ram),
> +				     true, timeout);
> +	if (retl == 0)
> +		retl = -EBUSY;
> +	if (retl < 0) {
> +		ret = (int)retl;
> +		goto err_resv_unlock;
> +	}
> +
> +	if (buffer->access->lock_queue)
> +		buffer->access->lock_queue(buffer);
> +
> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> +	if (ret)
> +		goto err_queue_unlock;
> +
> +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> +			   dma_to_ram ? DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	cookie = dma_fence_begin_signalling();
> +
> +	ret = buffer->access->enqueue_dmabuf(buffer, priv->block, &fence->base,
> +					     priv->sgt, iio_dmabuf.bytes_used,
> +					     cyclic);
> +	if (ret) {
> +		/*
> +		 * DMABUF enqueue failed, but we already added the fence.
> +		 * Signal the error through the fence completion mechanism.
> +		 */
> +		iio_buffer_signal_dmabuf_done(&fence->base, ret);
> +	}
> +
> +	if (buffer->access->unlock_queue)
> +		buffer->access->unlock_queue(buffer);
> +
> +	dma_fence_end_signalling(cookie);
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +
> +err_queue_unlock:
> +	if (buffer->access->unlock_queue)
> +		buffer->access->unlock_queue(buffer);
> +err_resv_unlock:
> +	dma_resv_unlock(dmabuf->resv);
> +err_fence_put:
> +	dma_fence_put(&fence->base);
> +err_attachment_put:
> +	iio_buffer_dmabuf_put(attach);
> +err_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +}
> +
> +static void iio_buffer_cleanup(struct work_struct *work)
> +{
> +	struct iio_dma_fence *fence =
> +		container_of(work, struct iio_dma_fence, work);
> +	struct iio_dmabuf_priv *priv = fence->priv;
> +	struct dma_buf_attachment *attach = priv->attach;
> +
> +	dma_fence_put(&fence->base);
> +	iio_buffer_dmabuf_put(attach);
> +}
> +
> +void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int ret)
> +{
> +	struct iio_dma_fence *iio_fence =
> +		container_of(fence, struct iio_dma_fence, base);
> +	bool cookie = dma_fence_begin_signalling();
> +
> +	/*
> +	 * Get a reference to the fence, so that it's not freed as soon as
> +	 * it's signaled.
> +	 */
> +	dma_fence_get(fence);
> +
> +	fence->error = ret;
> +	dma_fence_signal(fence);
> +	dma_fence_end_signalling(cookie);
> +
> +	/*
> +	 * The fence will be unref'd in iio_buffer_cleanup.
> +	 * It can't be done here, as the unref functions might try to lock the
> +	 * resv object, which can deadlock.
> +	 */
> +	INIT_WORK(&iio_fence->work, iio_buffer_cleanup);
> +	schedule_work(&iio_fence->work);
> +}
> +EXPORT_SYMBOL_GPL(iio_buffer_signal_dmabuf_done);
> +
> +static long iio_buffer_chrdev_ioctl(struct file *filp,
> +				    unsigned int cmd, unsigned long arg)
> +{
> +	struct iio_dev_buffer_pair *ib = filp->private_data;
> +	void __user *_arg = (void __user *)arg;
> +	bool nonblock = filp->f_flags & O_NONBLOCK;
> +
> +	switch (cmd) {
> +	case IIO_BUFFER_DMABUF_ATTACH_IOCTL:
> +		return iio_buffer_attach_dmabuf(ib, _arg, nonblock);
> +	case IIO_BUFFER_DMABUF_DETACH_IOCTL:
> +		return iio_buffer_detach_dmabuf(ib, _arg, nonblock);
> +	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
> +		return iio_buffer_enqueue_dmabuf(ib, _arg, nonblock);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>   static const struct file_operations iio_buffer_chrdev_fileops = {
>   	.owner = THIS_MODULE,
>   	.llseek = noop_llseek,
>   	.read = iio_buffer_read,
>   	.write = iio_buffer_write,
> +	.unlocked_ioctl = iio_buffer_chrdev_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
>   	.poll = iio_buffer_poll,
>   	.release = iio_buffer_chrdev_release,
>   };
> @@ -1953,6 +2414,7 @@ static void iio_buffer_release(struct kref *ref)
>   {
>   	struct iio_buffer *buffer = container_of(ref, struct iio_buffer, ref);
>   
> +	mutex_destroy(&buffer->dmabufs_mutex);
>   	buffer->access->release(buffer);
>   }
>   
> diff --git a/include/linux/iio/buffer_impl.h b/include/linux/iio/buffer_impl.h
> index 89c3fd7c29ca..1a221c1d7736 100644
> --- a/include/linux/iio/buffer_impl.h
> +++ b/include/linux/iio/buffer_impl.h
> @@ -9,8 +9,12 @@
>   #include <uapi/linux/iio/buffer.h>
>   #include <linux/iio/buffer.h>
>   
> +struct dma_buf_attachment;
> +struct dma_fence;
>   struct iio_dev;
> +struct iio_dma_buffer_block;
>   struct iio_buffer;
> +struct sg_table;
>   
>   /**
>    * INDIO_BUFFER_FLAG_FIXED_WATERMARK - Watermark level of the buffer can not be
> @@ -39,6 +43,13 @@ struct iio_buffer;
>    *                      device stops sampling. Calles are balanced with @enable.
>    * @release:		called when the last reference to the buffer is dropped,
>    *			should free all resources allocated by the buffer.
> + * @attach_dmabuf:	called from userspace via ioctl to attach one external
> + *			DMABUF.
> + * @detach_dmabuf:	called from userspace via ioctl to detach one previously
> + *			attached DMABUF.
> + * @enqueue_dmabuf:	called from userspace via ioctl to queue this DMABUF
> + *			object to this buffer. Requires a valid DMABUF fd, that
> + *			was previouly attached to this buffer.
>    * @modes:		Supported operating modes by this buffer type
>    * @flags:		A bitmask combination of INDIO_BUFFER_FLAG_*
>    *
> @@ -68,6 +79,17 @@ struct iio_buffer_access_funcs {
>   
>   	void (*release)(struct iio_buffer *buffer);
>   
> +	struct iio_dma_buffer_block * (*attach_dmabuf)(struct iio_buffer *buffer,
> +						       struct dma_buf_attachment *attach);
> +	void (*detach_dmabuf)(struct iio_buffer *buffer,
> +			      struct iio_dma_buffer_block *block);
> +	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
> +			      struct iio_dma_buffer_block *block,
> +			      struct dma_fence *fence, struct sg_table *sgt,
> +			      size_t size, bool cyclic);
> +	void (*lock_queue)(struct iio_buffer *buffer);
> +	void (*unlock_queue)(struct iio_buffer *buffer);
> +
>   	unsigned int modes;
>   	unsigned int flags;
>   };
> @@ -136,6 +158,12 @@ struct iio_buffer {
>   
>   	/* @ref: Reference count of the buffer. */
>   	struct kref ref;
> +
> +	/* @dmabufs: List of DMABUF attachments */
> +	struct list_head dmabufs; /* P: dmabufs_mutex */
> +
> +	/* @dmabufs_mutex: Protects dmabufs */
> +	struct mutex dmabufs_mutex;
>   };
>   
>   /**
> @@ -159,6 +187,8 @@ void iio_buffer_init(struct iio_buffer *buffer);
>   struct iio_buffer *iio_buffer_get(struct iio_buffer *buffer);
>   void iio_buffer_put(struct iio_buffer *buffer);
>   
> +void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int ret);
> +
>   #else /* CONFIG_IIO_BUFFER */
>   
>   static inline void iio_buffer_get(struct iio_buffer *buffer) {}
> diff --git a/include/uapi/linux/iio/buffer.h b/include/uapi/linux/iio/buffer.h
> index 13939032b3f6..c666aa95e532 100644
> --- a/include/uapi/linux/iio/buffer.h
> +++ b/include/uapi/linux/iio/buffer.h
> @@ -5,6 +5,28 @@
>   #ifndef _UAPI_IIO_BUFFER_H_
>   #define _UAPI_IIO_BUFFER_H_
>   
> +#include <linux/types.h>
> +
> +/* Flags for iio_dmabuf.flags */
> +#define IIO_BUFFER_DMABUF_CYCLIC		(1 << 0)
> +#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000001
> +
> +/**
> + * struct iio_dmabuf - Descriptor for a single IIO DMABUF object
> + * @fd:		file descriptor of the DMABUF object
> + * @flags:	one or more IIO_BUFFER_DMABUF_* flags
> + * @bytes_used:	number of bytes used in this DMABUF for the data transfer.
> + *		Should generally be set to the DMABUF's size.
> + */
> +struct iio_dmabuf {
> +	__u32 fd;
> +	__u32 flags;
> +	__u64 bytes_used;
> +};
> +
>   #define IIO_BUFFER_GET_FD_IOCTL			_IOWR('i', 0x91, int)
> +#define IIO_BUFFER_DMABUF_ATTACH_IOCTL		_IOW('i', 0x92, int)
> +#define IIO_BUFFER_DMABUF_DETACH_IOCTL		_IOW('i', 0x93, int)
> +#define IIO_BUFFER_DMABUF_ENQUEUE_IOCTL		_IOW('i', 0x94, struct iio_dmabuf)
>   
>   #endif /* _UAPI_IIO_BUFFER_H_ */

