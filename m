Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB802704566
	for <lists+linux-doc@lfdr.de>; Tue, 16 May 2023 08:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjEPGjs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 May 2023 02:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjEPGjr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 May 2023 02:39:47 -0400
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFEF198B;
        Mon, 15 May 2023 23:39:46 -0700 (PDT)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id 5607D15ECA7;
        Tue, 16 May 2023 08:39:44 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1684219184; bh=GvZkso4wSp29I9UC5ou2LvzBueQMmr8nTqiYnF2tc68=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bXcUm28jyCTk8XZfjeaXuhCYuSVhILOLJOYVsQp5yurbY/HvcLYP+flkRN3p9uaOe
         rjuzxhEAwGu95O9ANOpee0YKhkMB6My1Fdcvhct/583WSZ/xppqypr7C+Fr4vdaW4G
         CeN6F2zempSCB0+j7aq8WwB4l9r/e21xhRkovCg8PsgIXfjpMbR7xuv3N6UqIK3wno
         LfrcGmRtMxead9d4XO7+tPnqUx8eTfj4nFWA7ITrPtEYzLHqbpIm0fzWkPaIcWE362
         2KLKzF0/Bba19VnCPm64p7CWnDIyGY289o2o+mbUEdJg2rX54/brkOf2er4OFSnVxy
         NpLYVugc8jvZQ==
Date:   Tue, 16 May 2023 08:39:42 +0200
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Christoph Hellwig <hch@lst.de>
Cc:     "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
        Petr Tesarik <petrtesarik@huaweicloud.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Kim Phillips <kim.phillips@amd.com>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
        Roberto Sassu <roberto.sassu@huawei.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2 RESEND 4/7] swiotlb: Dynamically allocated bounce
 buffers
Message-ID: <20230516083942.0303b5fb@meshulam.tesarici.cz>
In-Reply-To: <20230516061309.GA7219@lst.de>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
        <346abecdb13b565820c414ecf3267275577dbbf3.1683623618.git.petr.tesarik.ext@huawei.com>
        <BYAPR21MB168874BC467BFCEC133A9DCDD7789@BYAPR21MB1688.namprd21.prod.outlook.com>
        <20230516061309.GA7219@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christoph,

On Tue, 16 May 2023 08:13:09 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Mon, May 15, 2023 at 07:43:52PM +0000, Michael Kelley (LINUX) wrote:
> > FWIW, I don't think the approach you have implemented here will be
> > practical to use for CoCo VMs (SEV, TDX, whatever else).  The problem
> > is that dma_direct_alloc_pages() and dma_direct_free_pages() must
> > call dma_set_decrypted() and dma_set_encrypted(), respectively.  In CoCo
> > VMs, these calls are expensive because they require a hypercall to the host,
> > and the operation on the host isn't trivial either.  I haven't measured the
> > overhead, but doing a hypercall on every DMA map operation and on
> > every unmap operation has long been something we thought we must
> > avoid.  The fixed swiotlb bounce buffer space solves this problem by
> > doing set_decrypted() in batch at boot time, and never
> > doing set_encrypted().  
> 
> I also suspect it doesn't really scale too well due to the number of
> allocations.  I suspect a better way to implement things would be to
> add more large chunks that are used just like the main swiotlb buffers.
> 
> That is when we run out of space try to allocate another chunk of the
> same size in the background, similar to what we do with the pool in
> dma-pool.c.  This means we'll do a fairly large allocation, so we'll
> need compaction or even CMA to back it up, but the other big upside
> is that it also reduces the number of buffers that need to be checked
> in is_swiotlb_buffer or the free / sync side.

I have considered this approach. The two main issues I ran into were:

1. MAX_ORDER allocations were too small (at least with 4K pages), and
   even then they would often fail.

2. Allocating from CMA did work but only from process context.
   I made a stab at modifying the CMA allocator to work from interrupt
   context, but there are non-trivial interactions with the buddy
   allocator. Making them safe from interrupt context looked like a
   major task.

I also had some fears about the length of the dynamic buffer list. I
observed maximum length for block devices, and then it roughly followed
the queue depth. Walking a few hundred buffers was still fast enough.
I admit the list length may become an issue with high-end NVMe and
I/O-intensive applications.

Last but not least, when many smaller swiotlb chunks are allocated, they
must be kept in a list (or another data structure), somewhat reducing the
performance win. OK, one thing I did *not* consider back then was
allocating these additional swiotlb chunks per device. It looks a bit
too wasteful.

Petr T
