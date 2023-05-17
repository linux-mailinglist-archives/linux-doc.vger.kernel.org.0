Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0FE7706036
	for <lists+linux-doc@lfdr.de>; Wed, 17 May 2023 08:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjEQGfS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 May 2023 02:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjEQGfR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 May 2023 02:35:17 -0400
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B9930F7;
        Tue, 16 May 2023 23:35:15 -0700 (PDT)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id A0961164A94;
        Wed, 17 May 2023 08:35:11 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1684305312; bh=OLBy/x4SffLRIOOouJqRnn62gILl6SxpisS1Gqyl1uc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=H41WNv6w/2JbwP/Snmi4AP7/GpeB5JStxv3IZhBqAeNNqhG+gfIAMUFYoClvkd3p3
         wmS0syF6/BK/hhoR2y/vDfDPnPT/vhhcKyvpDCQVeLDQfTyPzHwpaRKQ9q4kfZGHy1
         vH3Gb40ebT6bnnqA4fZQtCC9eNBRH45oOixeX6DK4F9PdE2EsEFroG180PKge9Gk6Z
         KFQD3xSAYDxgZ79tP8S1ERZwfJcG4f08/p2I1ESaNEeupqvToKY2ZLCfA9DILOJr+a
         cwWMGPNN/R7EdGRUlfSSoWIKl6g/cPg5ZVPhKLRTskMDpyonlv0x6wxEOgG+zdJpQ/
         /NbPvNlYZyqRw==
Date:   Wed, 17 May 2023 08:35:10 +0200
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
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
Message-ID: <20230517083510.0cd7fa1a@meshulam.tesarici.cz>
In-Reply-To: <ZGPEgsplBSsI9li3@arm.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
        <346abecdb13b565820c414ecf3267275577dbbf3.1683623618.git.petr.tesarik.ext@huawei.com>
        <BYAPR21MB168874BC467BFCEC133A9DCDD7789@BYAPR21MB1688.namprd21.prod.outlook.com>
        <20230516061309.GA7219@lst.de>
        <20230516083942.0303b5fb@meshulam.tesarici.cz>
        <ZGPEgsplBSsI9li3@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Catalin,

On Tue, 16 May 2023 18:59:30 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Tue, May 16, 2023 at 08:39:42AM +0200, Petr Tesa=C5=99=C3=ADk wrote:
> > On Tue, 16 May 2023 08:13:09 +0200
> > Christoph Hellwig <hch@lst.de> wrote: =20
> > > On Mon, May 15, 2023 at 07:43:52PM +0000, Michael Kelley (LINUX) wrot=
e: =20
> > > > FWIW, I don't think the approach you have implemented here will be
> > > > practical to use for CoCo VMs (SEV, TDX, whatever else).  The probl=
em
> > > > is that dma_direct_alloc_pages() and dma_direct_free_pages() must
> > > > call dma_set_decrypted() and dma_set_encrypted(), respectively.  In=
 CoCo
> > > > VMs, these calls are expensive because they require a hypercall to =
the host,
> > > > and the operation on the host isn't trivial either.  I haven't meas=
ured the
> > > > overhead, but doing a hypercall on every DMA map operation and on
> > > > every unmap operation has long been something we thought we must
> > > > avoid.  The fixed swiotlb bounce buffer space solves this problem by
> > > > doing set_decrypted() in batch at boot time, and never
> > > > doing set_encrypted().   =20
> > >=20
> > > I also suspect it doesn't really scale too well due to the number of
> > > allocations.  I suspect a better way to implement things would be to
> > > add more large chunks that are used just like the main swiotlb buffer=
s.
> > >=20
> > > That is when we run out of space try to allocate another chunk of the
> > > same size in the background, similar to what we do with the pool in
> > > dma-pool.c.  This means we'll do a fairly large allocation, so we'll
> > > need compaction or even CMA to back it up, but the other big upside
> > > is that it also reduces the number of buffers that need to be checked
> > > in is_swiotlb_buffer or the free / sync side. =20
> >=20
> > I have considered this approach. The two main issues I ran into were:
> >=20
> > 1. MAX_ORDER allocations were too small (at least with 4K pages), and
> >    even then they would often fail.
> >=20
> > 2. Allocating from CMA did work but only from process context.
> >    I made a stab at modifying the CMA allocator to work from interrupt
> >    context, but there are non-trivial interactions with the buddy
> >    allocator. Making them safe from interrupt context looked like a
> >    major task. =20
>=20
> Can you kick off a worker thread when the swiotlb allocation gets past
> some reserve limit? It still has a risk of failing to bounce until the
> swiotlb buffer is extended.

Yes, this can be done, and some form of a worker thread is in fact on
my roadmap. Initially, I want to see the impact of a "dumb" algorithm
and get some feedback from people like you. Glad your ideas move in a
similar direction as mine. :-)

> > I also had some fears about the length of the dynamic buffer list. I
> > observed maximum length for block devices, and then it roughly followed
> > the queue depth. Walking a few hundred buffers was still fast enough.
> > I admit the list length may become an issue with high-end NVMe and
> > I/O-intensive applications. =20
>=20
> You could replace the list with an rbtree, O(log n) look-up vs O(n),
> could be faster if you have many bounces active.

I could also do it for individual allocations. And I did it.

First, the paddr lookup does not search for a specific key in the tree,
but rather for a match within a range. The maple tree was invented for
exactly this purpose, so that's what I tried. There are some caveats
when using maple trees from interrupt context, but I made the necessary
modifications in my local tree.

I ran my tests against a SATA virtio disk in an x86-64 VM booted with
swiotlb=3Dforce. The results were:

     Compared to plain linked list
small-rw       -6.6%  (4KiB, 1 thread)
parallel-rw   -10.5%  (64KiB, 4 threads)
big-rw         -8.5%  (1MiB, 1 thread)

Of course, these numbers say nothing about the performance of a maple
tree for tracking additional swiotlb chunks, because the mix of
additions, deletions and lookups will be different, but my point is
that a "better" data structure may not always be better.

My testing also suggests that the lookup path is extremely hot. It was
very sensitive even to small changes (like moving the flag setting
before deletion).

Anyway, my greatest objection to allocating additional swiotlb chunks is
that _all_ of them must be searched to determine that the physical
address does _not_ belong to a swiotlb, incurring performance penalty
for non-constrained (presumably fast) devices that do not need a
swiotlb. Sure, this is irrelevant for CoCo VMs where all devices must
use swiotlb, but we've seen other scenarios which benefit from a
dynamically sized swiotlb. It's a bit frustrating if a cheap wifi
adapter reduces your disk performance...

Besides, if the list or tree of swiotlb chunks is protected with a
lock, this lock becomes contended.

Last but not least, the allocation size is dynamic in theory, but it
would most likely never shrink, because a swiotlb chunk can be freed
only if it is completely unused, which may never happen after a spike,
because some mappings are rather long-lived (which is probably wrong
but it's the current state).

Much of the above can be solved if additional swiotlb chunks are
allocated per device. OTOH I am a bit concerned about increasing memory
requirements. After all, one of the use cases is to reduce kernel
memory footprint on mobile devices.

To say something positive, I have also found one upside to additional
swiotlb chunks: They make it possible to meet all alignment and boundary
crossing constraints (unlike plain CMA allocations).

Petr T
