Return-Path: <linux-doc+bounces-7543-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E9883CA98
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 19:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7C2DB2130F
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jan 2024 18:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C71D1350CA;
	Thu, 25 Jan 2024 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CGkvof0E"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FA61350C4
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706206217; cv=none; b=hUhaOnm0oX8+q73wK5lTOKELtyslYi+6HHDvtnyORU4xV7K+RuSr9oHrWt0lT6xESyF+POEpBs/oWeZ2qoH5qiSFH6UvWrlRmFMAM257Ggn0ef3x4wK+Od6QqP/Ig+KiGKXR+HWqviafNcIdzQq+s79ID4TYhHcqeNb2OfI1Vbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706206217; c=relaxed/simple;
	bh=IjkBfYyXyZuxLRiem9LViq3PHGioJn1sHgJBkjshdog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgBzif2hQF/8QkwRhrP6UHPHeWnjdfMH5OQ7r4i6s5Yt1ok+4V9nmAaZxcyZByc1Y6K1YvkmJ2E8/l8UYAgk+ph2PT+juido9O1HWSeQPHnHoGZUsft1NsgRhj1BJelUKKsZbI+zBjxFB2cKzeU6A2TlQDhA68FGAvdc5lvjDvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=CGkvof0E; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55369c59708so1639252a12.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 10:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1706206214; x=1706811014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tOrqes/9yVROTQ69tGyE0dsjLuB7wrcHht59zsTqBI=;
        b=CGkvof0EtzcKmw7WNMprPWIIDhnUd5DMGi6YIWp80nwC41xYArFvglosFhOYI0TLRu
         a7ObXw4SQpWaG6OJcsZcHqhoHHfKhfsGj3fVQDJ1mG2TIvsYgUF/8x1HR/Dx9efT+8go
         7GMqiShf5ClOvHKiVH6nA3o3TGI4tfUz4e970=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706206214; x=1706811014;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tOrqes/9yVROTQ69tGyE0dsjLuB7wrcHht59zsTqBI=;
        b=OQZL/gvI9GloW+XuFg9ajl2nDAxYirHteed2tnzTiQUCzpv4lbSSQpMdbc7/L/R7F7
         dXmEhtjtUHd7G0F31OLYZ5VcsS5E5NCw2Hu8Be/EaMDjfPLbi4aITkUGHlmwadqjmuUI
         f3ujGWaX1ICnC0rqpa3qcW5cFBct97S9c0ohVOBFtlLFXoMbQOyMpoona7/Xk2/Xgo0D
         JzotMmYPSngMAt4Y2pLVY6wGsfX+Vxsmr11Rc2DHKwm9h3BOdLhCwykI2+8EBcR3cSZ5
         lQLU9gkT9f4bNiwyrXHUc3kRt//W/CFB4K2ApXJzTxJ4LuUuUigCsSBZ8evLrYZEP60v
         3qNA==
X-Gm-Message-State: AOJu0Yx7wKjyk0C8ihqVy9rb/bP9zj+YryvoxEVINVwIk1md8T1HiP6g
	9XowGT29xUUu0D55n1BkML1yX69CVlKweTAaHoZO50+s3N7xF7JXIvkmWM4m/tY=
X-Google-Smtp-Source: AGHT+IHiPqW8oQ3VVW2VkOd3YkCZla2B2xfbN2rRDbyJzKzFaaBeBkii2OIRJhk353wOIuVlybUpFg==
X-Received: by 2002:aa7:c595:0:b0:55c:c283:30c6 with SMTP id g21-20020aa7c595000000b0055cc28330c6mr63184edq.0.1706206213777;
        Thu, 25 Jan 2024 10:10:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id fj9-20020a0564022b8900b00559cb738c1bsm10748896edb.4.2024.01.25.10.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:10:13 -0800 (PST)
Date: Thu, 25 Jan 2024 19:10:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 1/6] dma-buf: Add dma_buf_{begin,end}_access()
Message-ID: <ZbKkA68PuekJGIrP@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-2-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119141402.44262-2-paul@crapouillou.net>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Fri, Jan 19, 2024 at 03:13:57PM +0100, Paul Cercueil wrote:
> These functions should be used by device drivers when they start and
> stop accessing the data of DMABUF. It allows DMABUF importers to cache
> the dma_buf_attachment while ensuring that the data they want to access
> is available for their device when the DMA transfers take place.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Putting my detailed review comments here just so I don't have to remember
them any longer. We need to reach consensus on the big picture direction
first.

> 
> ---
> v5: New patch
> ---
>  drivers/dma-buf/dma-buf.c | 66 +++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-buf.h   | 37 ++++++++++++++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8fe5aa67b167..a8bab6c18fcd 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -830,6 +830,8 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>   *     - dma_buf_mmap()
>   *     - dma_buf_begin_cpu_access()
>   *     - dma_buf_end_cpu_access()
> + *     - dma_buf_begin_access()
> + *     - dma_buf_end_access()
>   *     - dma_buf_map_attachment_unlocked()
>   *     - dma_buf_unmap_attachment_unlocked()
>   *     - dma_buf_vmap_unlocked()
> @@ -1602,6 +1604,70 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
>  
> +/**
> + * @dma_buf_begin_access - Call before any hardware access from/to the DMABUF
> + * @attach:	[in]	attachment used for hardware access
> + * @sg_table:	[in]	scatterlist used for the DMA transfer
> + * @direction:  [in]    direction of DMA transfer

I think for the kerneldoc would be good to point at the other function
here, explain why this might be needed and that for most reasonable
devices it's probably not, and link between the function pairs.

Also we need to document that dma_buf_map does an implied
dma_buf_begin_access (because dma_sg_map does an implied
dma_sg_sync_for_device) and vice versa for dma_buf_end_access. Which also
means that dma_buf_map/unmap should link to these functions in their
kerneldoc too.

Finally I think we should document here that it's ok to call these from
dma_fence signalling critical section and link to the relevant discussion
in the dma_fence docs for that.

> + */
> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
> +			 struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	struct dma_buf *dmabuf;
> +	bool cookie;
> +	int ret;
> +
> +	if (WARN_ON(!attach))
> +		return -EINVAL;
> +
> +	dmabuf = attach->dmabuf;
> +
> +	if (!dmabuf->ops->begin_access)
> +		return 0;
> +
> +	cookie = dma_fence_begin_signalling();
> +	ret = dmabuf->ops->begin_access(attach, sgt, dir);
> +	dma_fence_end_signalling(cookie);
> +
> +	if (WARN_ON_ONCE(ret))
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);

So explicit device side coherency management is not going to be very
compatible with dynamic buffer managament where the exporter can move the
buffer around. The reason for that is that for a dynamic exporter we cache
the sg mapping, which means any device-side coherency management which
dma_buf_map/unmap would do will not happen (since it's cached),
potentially breaking things for importers that rely on the assumption that
dma_buf_map/unmap already implies dma_buf_begin/end_device_access.

I think for now it's sufficient to put a WARN_ON(dma_buf_is_dymamic() &&
ops->begin|end_access) or similar into dma_buf_export and bail out with an
error to catch that.

Aside from the nits I do think this is roughly what we brievely discussed
well over a decade ago in the original dma-buf kickoff meeting at a linaro
connect in Budapest :-)

Cheers, Sima

> +
> +/**
> + * @dma_buf_end_access - Call after any hardware access from/to the DMABUF
> + * @attach:	[in]	attachment used for hardware access
> + * @sg_table:	[in]	scatterlist used for the DMA transfer
> + * @direction:  [in]    direction of DMA transfer
> + */
> +int dma_buf_end_access(struct dma_buf_attachment *attach,
> +		       struct sg_table *sgt, enum dma_data_direction dir)
> +{
> +	struct dma_buf *dmabuf;
> +	bool cookie;
> +	int ret;
> +
> +	if (WARN_ON(!attach))
> +		return -EINVAL;
> +
> +	dmabuf = attach->dmabuf;
> +
> +	if (!dmabuf->ops->end_access)
> +		return 0;
> +
> +	cookie = dma_fence_begin_signalling();
> +	ret = dmabuf->ops->end_access(attach, sgt, dir);
> +	dma_fence_end_signalling(cookie);
> +
> +	if (WARN_ON_ONCE(ret))
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  {
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 8ff4add71f88..8ba612c7cc16 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -246,6 +246,38 @@ struct dma_buf_ops {
>  	 */
>  	int (*end_cpu_access)(struct dma_buf *, enum dma_data_direction);
>  
> +	/**
> +	 * @begin_access:
> +	 *
> +	 * This is called from dma_buf_begin_access() when a device driver
> +	 * wants to access the data of the DMABUF. The exporter can use this
> +	 * to flush/sync the caches if needed.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
> +	int (*begin_access)(struct dma_buf_attachment *, struct sg_table *,
> +			    enum dma_data_direction);
> +
> +	/**
> +	 * @end_access:
> +	 *
> +	 * This is called from dma_buf_end_access() when a device driver is
> +	 * done accessing the data of the DMABUF. The exporter can use this
> +	 * to flush/sync the caches if needed.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
> +	int (*end_access)(struct dma_buf_attachment *, struct sg_table *,
> +			  enum dma_data_direction);
> +
>  	/**
>  	 * @mmap:
>  	 *
> @@ -606,6 +638,11 @@ void dma_buf_detach(struct dma_buf *dmabuf,
>  int dma_buf_pin(struct dma_buf_attachment *attach);
>  void dma_buf_unpin(struct dma_buf_attachment *attach);
>  
> +int dma_buf_begin_access(struct dma_buf_attachment *attach,
> +			 struct sg_table *sgt, enum dma_data_direction dir);
> +int dma_buf_end_access(struct dma_buf_attachment *attach,
> +		       struct sg_table *sgt, enum dma_data_direction dir);
> +
>  struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info);
>  
>  int dma_buf_fd(struct dma_buf *dmabuf, int flags);
> -- 
> 2.43.0
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

