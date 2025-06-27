Return-Path: <linux-doc+bounces-51001-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 929FCAEBB54
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jun 2025 17:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3DBD3BDF98
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jun 2025 15:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5904D2EA175;
	Fri, 27 Jun 2025 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g7Jr+VeM"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF322EA475
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037060; cv=none; b=BB08wt813IE7iUSmBxqSUkfuE+RBgiPJyd4jorlqHCDTa6pYDoGCvEMmf06X2tj/YitudAlLdoQMW/51P9/DoE9TYQs5OMe3qFOgEl1q5zKK0tHk9yMDY4+w+A0LkHz/322VxgWbbQIHauDNAOvCf1u63QzeeuCN2VMhAnMI8rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037060; c=relaxed/simple;
	bh=/OXqtSvPg+k3AqO7qzky2yzDoCuXDl3KOx88Ba0kcOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRCn0XIF6wfM1Qli/qPX+tph30xy5BD912e9bFzSIZPxAvIH7YB6m/SA8mzXYn/7oa59k7k00KkHuO7We2l5lSHz99q1bQn3hFYzsNOYuj+o/ovLmSkTSQpt6q2+V4o/pM3w+c7PbrAKTihZ8XeFYnvF47URZCghVcjYNETRFcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g7Jr+VeM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751037057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2zLLrPPni+LNLupOh21b7NzZcq1VuLK+h5aTqE/Uei0=;
	b=g7Jr+VeMpT99P0Poxo6+ufoVtSSK6/iLGlunhYjJi4mq/FZStgM/S5RrCtET6yfuVZDkj5
	XO+4y0WgVqr4ricRZH7F7MKXfZvedAKRynTsUI3jYRWcH0BO3mpMPyFIHA1HIi8/bgiPZA
	/ix+Toj6QdqoXtXe/hKAv31eHVun7ww=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-RVa0SdgBMyqojgjpLRHIJA-1; Fri,
 27 Jun 2025 11:10:51 -0400
X-MC-Unique: RVa0SdgBMyqojgjpLRHIJA-1
X-Mimecast-MFC-AGG-ID: RVa0SdgBMyqojgjpLRHIJA_1751037050
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F8881944A83;
	Fri, 27 Jun 2025 15:10:50 +0000 (UTC)
Received: from bfoster (unknown [10.22.64.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1D741956095;
	Fri, 27 Jun 2025 15:10:48 +0000 (UTC)
Date: Fri, 27 Jun 2025 11:14:26 -0400
From: Brian Foster <bfoster@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-block@vger.kernel.org, gfs2@lists.linux.dev
Subject: Re: [PATCH 05/12] iomap: add public helpers for uptodate state
 manipulation
Message-ID: <aF61Uv0G-xKBkw7g@bfoster>
References: <20250627070328.975394-1-hch@lst.de>
 <20250627070328.975394-6-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627070328.975394-6-hch@lst.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Fri, Jun 27, 2025 at 09:02:38AM +0200, Christoph Hellwig wrote:
> From: Joanne Koong <joannelkoong@gmail.com>
> 
> Add a new iomap_start_folio_write helper to abstract away the
> write_bytes_pending handling, and export it and the existing
> iomap_finish_folio_write for non-iomap writeback in fuse.
> 
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> [hch: split from a larger patch]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Reviewed-by: Brian Foster <bfoster@redhat.com>

>  fs/iomap/buffered-io.c | 20 +++++++++++++++-----
>  include/linux/iomap.h  |  5 +++++
>  2 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index a72ab487c8ab..d152456d41a8 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -1535,7 +1535,18 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops,
>  }
>  EXPORT_SYMBOL_GPL(iomap_page_mkwrite);
>  
> -static void iomap_finish_folio_write(struct inode *inode, struct folio *folio,
> +void iomap_start_folio_write(struct inode *inode, struct folio *folio,
> +		size_t len)
> +{
> +	struct iomap_folio_state *ifs = folio->private;
> +
> +	WARN_ON_ONCE(i_blocks_per_folio(inode, folio) > 1 && !ifs);
> +	if (ifs)
> +		atomic_add(len, &ifs->write_bytes_pending);
> +}
> +EXPORT_SYMBOL_GPL(iomap_start_folio_write);
> +
> +void iomap_finish_folio_write(struct inode *inode, struct folio *folio,
>  		size_t len)
>  {
>  	struct iomap_folio_state *ifs = folio->private;
> @@ -1546,6 +1557,7 @@ static void iomap_finish_folio_write(struct inode *inode, struct folio *folio,
>  	if (!ifs || atomic_sub_and_test(len, &ifs->write_bytes_pending))
>  		folio_end_writeback(folio);
>  }
> +EXPORT_SYMBOL_GPL(iomap_finish_folio_write);
>  
>  /*
>   * We're now finished for good with this ioend structure.  Update the page
> @@ -1668,7 +1680,6 @@ ssize_t iomap_add_to_ioend(struct iomap_writeback_ctx *wpc, struct folio *folio,
>  		loff_t pos, loff_t end_pos, unsigned int dirty_len)
>  {
>  	struct iomap_ioend *ioend = wpc->wb_ctx;
> -	struct iomap_folio_state *ifs = folio->private;
>  	size_t poff = offset_in_folio(folio, pos);
>  	unsigned int ioend_flags = 0;
>  	unsigned int map_len = min_t(u64, dirty_len,
> @@ -1711,8 +1722,7 @@ ssize_t iomap_add_to_ioend(struct iomap_writeback_ctx *wpc, struct folio *folio,
>  	if (!bio_add_folio(&ioend->io_bio, folio, map_len, poff))
>  		goto new_ioend;
>  
> -	if (ifs)
> -		atomic_add(map_len, &ifs->write_bytes_pending);
> +	iomap_start_folio_write(wpc->inode, folio, map_len);
>  
>  	/*
>  	 * Clamp io_offset and io_size to the incore EOF so that ondisk
> @@ -1880,7 +1890,7 @@ static int iomap_writepage_map(struct iomap_writeback_ctx *wpc,
>  		 * all blocks.
>  		 */
>  		WARN_ON_ONCE(atomic_read(&ifs->write_bytes_pending) != 0);
> -		atomic_inc(&ifs->write_bytes_pending);
> +		iomap_start_folio_write(inode, folio, 1);
>  	}
>  
>  	/*
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index b65951cdb0b5..1a07d8fa9459 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -460,6 +460,11 @@ void iomap_sort_ioends(struct list_head *ioend_list);
>  ssize_t iomap_add_to_ioend(struct iomap_writeback_ctx *wpc, struct folio *folio,
>  		loff_t pos, loff_t end_pos, unsigned int dirty_len);
>  int ioend_writeback_submit(struct iomap_writeback_ctx *wpc, int error);
> +
> +void iomap_start_folio_write(struct inode *inode, struct folio *folio,
> +		size_t len);
> +void iomap_finish_folio_write(struct inode *inode, struct folio *folio,
> +		size_t len);
>  int iomap_writepages(struct iomap_writeback_ctx *wpc);
>  
>  /*
> -- 
> 2.47.2
> 
> 


