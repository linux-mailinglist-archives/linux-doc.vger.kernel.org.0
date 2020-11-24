Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522192C2441
	for <lists+linux-doc@lfdr.de>; Tue, 24 Nov 2020 12:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732345AbgKXLfR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Nov 2020 06:35:17 -0500
Received: from verein.lst.de ([213.95.11.211]:54112 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730158AbgKXLfP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Nov 2020 06:35:15 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 94C046736F; Tue, 24 Nov 2020 12:35:12 +0100 (CET)
Date:   Tue, 24 Nov 2020 12:35:12 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH] WIP! media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201124113512.GA21974@lst.de>
References: <20200930160917.1234225-9-hch@lst.de> <20201118142546.170621-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201118142546.170621-1-ribalda@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 18, 2020 at 03:25:46PM +0100, Ricardo Ribalda wrote:
> On architectures where the is no coherent caching such as ARM use the
> dma_alloc_noncontiguos API and handle manually the cache flushing using
> dma_sync_single().
> 
> With this patch on the affected architectures we can measure up to 20x
> performance improvement in uvc_video_copy_data_work().

This has a bunch of crazy long lines, but otherwise looks fine to me.

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> 
> This patch depends on dma_alloc_contiguous API￼1315351diffmboxseries

How do we want to proceed?  Do the media maintainers want to pick up
that patch?  Should I pick up the media patch in the dma-mapping tree?

Can you respost a combined series to get started?
