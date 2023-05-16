Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605BE70471F
	for <lists+linux-doc@lfdr.de>; Tue, 16 May 2023 09:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbjEPH4T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 May 2023 03:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbjEPH4K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 May 2023 03:56:10 -0400
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540B84C27;
        Tue, 16 May 2023 00:55:48 -0700 (PDT)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id C0F70162782;
        Tue, 16 May 2023 09:55:14 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1684223715; bh=ltmMIkpXlWFWJgW4qrm50FfrVYKnQeXJbbPUFDmFZTg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VKfP35Lh1yXXj9553giwHfdTZoqsQDB37mWTxTJThZdSRN23daQlBOpnXS9vL05Pg
         uC97J1Kf+D1G2AwXt1C7FLvgYDKD0/C5ExaeYz7u0qPEJUjwJCKoWatDmvB35NtVzn
         BmagPSlWyaTvBjs2zOwAk/N9k1i37nKeAhyrN8ffWS9V54bEeKWRGeiNbkqNAWa8d5
         XLjxx+zEidTK0pogygEvPM7zA4KD0atcnJzN2BW2Rho8T/2tOcndLtEfRMxZSfYTl9
         xKoY9Niyr2ZVu7EXnpXxIRj1RtczCxJ/ATZTJK9rUSOhVzqosNzYWOYazX0+6rThnu
         dpDfs+OJ47qHg==
Date:   Tue, 16 May 2023 09:55:12 +0200
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Petr Tesarik <petrtesarik@huaweicloud.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christoph Hellwig <hch@lst.de>,
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
Subject: Re: [PATCH v2 RESEND 7/7] swiotlb: per-device flag if there are
 dynamically allocated buffers
Message-ID: <20230516095512.3c99c35e@meshulam.tesarici.cz>
In-Reply-To: <ZGJdtmP13pv06xDH@arm.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
        <69f9e058bb1ad95905a62a4fc8461b064872af97.1683623618.git.petr.tesarik.ext@huawei.com>
        <ZGEuYxR2PM6wHeDh@arm.com>
        <20230515104847.6dfdf31b@meshulam.tesarici.cz>
        <20230515120054.0115a4eb@meshulam.tesarici.cz>
        <ZGJdtmP13pv06xDH@arm.com>
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

On Mon, 15 May 2023 17:28:38 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> (some of you replies may have been filtered to various of my mailboxes,
> depending on which lists you cc'ed; replying here)
>=20
> On Mon, May 15, 2023 at 12:00:54PM +0200, Petr Tesa=C5=99=C3=ADk wrote:
> > On Mon, 15 May 2023 10:48:47 +0200
> > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote: =20
> > > On Sun, 14 May 2023 19:54:27 +0100
> > > Catalin Marinas <catalin.marinas@arm.com> wrote: =20
> > > > Now, thinking about the list_head access and the flag ordering, sin=
ce it
> > > > doesn't matter, you might as well not bother with the flag at all a=
nd
> > > > rely on list_add() and list_empty() ordering vs the hypothetical 'b=
lah'
> > > > access. Both of these use READ/WRITE_ONCE() for setting
> > > > dma_io_tlb_dyn_slots.next. You only need an smp_wmb() after the
> > > > list_add() and an smp_rmb() before a list_empty() check in =20
> >                       ^^^^^^^^^
> > Got it, finally. Well, that's exactly something I don't want to do.
> > For example, on arm64 (seeing your email address), smp_rmb() translates
> > to a "dsb ld" instruction. I would expect that this is more expensive
> > than a "ldar", generated by smp_load_acquire(). =20
>=20
> It translates to a dmb ishld which is on par with ldar (dsb is indeed a
> lot more expensive but that's not generated here).

You're right, dsb is generated for the non-smp barrier variants. Thanks
for the correction.

> > > > is_swiotlb_buffer(), no dma_iotlb_have_dyn variable.   =20
> > >=20
> > > Wait, let me check that I understand you right. Do you suggest that I
> > > convert dma_io_tlb_dyn_slots to a lockless list and get rid of the
> > > spinlock?
> > >=20
> > > I'm sure it can be done for list_add() and list_del(). I'll have
> > > to think about list_move(). =20
> >=20
> > Hm, even the documentation of llist_empty() says that it is "not
> > guaranteed to be accurate or up to date". If it could be, I'm quite
> > sure the authors would have gladly implemented it as such. =20
>=20
> It doesn't but neither does your flag.

Yes, I have already agreed in another sub-thread.

> If you want a guarantee, you'd
> need locks because a llist_empty() on its own can race with other
> llist_add/del_*() that may not yet be visible to a CPU at exactly that
> moment. BTW, the llist implementation cannot delete a random element, so
> not sure this is suitable for your implementation (it can only delete
> the first element or the whole list).
>=20
> I do think you need to change your invariants and not rely on an
> absolute list_empty() or some flag:
>=20
> P0:
> 	list_add(paddr);
> 	WRITE_ONCE(blah, paddr);
>=20
> P1:
> 	paddr =3D READ_ONCE(blah);
> 	list_empty();
>=20
> Your invariant (on P1) should be blah =3D=3D paddr =3D> !list_empty(). If
> there is another P2 removing paddr from the list, this wouldn't work
> (nor your flag) but the assumption is that a correctly written driver
> that still has a reference to paddr doesn't use it after being removed
> from the list (i.e. it doesn't do a dma_unmap(paddr) and still continue
> to use this paddr for e.g. dma_sync()).

Right. In other words, given any paddr:

  a. Either it is on the list, and then the list cannot become empty by
     any concurrent code.

  a. Or it is not on the list, but then we may skip the search
     regardless of any races with other CPUs.

> For such invariant, you'd need ordering between list_add() and the
> write of paddr (smp_wmb() would do). On P1, you need an smp_rmb() before
> list_empty() since the implementation does a READ_ONCE only).

I agree.

> You still need the locks for list modifications and list traversal as I
> don't see how you can use the llist implementation with random element
> removal.

That's right. It might even perform better than a truly non-blocking
list (cf. Valois, Harris, Zhang).

> There is another scenario to take into account on the list_del() side.
> Let's assume that there are other elements on the list, so
> list_empty() =3D=3D false:
>=20
> P0:
> 	list_del(paddr);
> 	/* the memory gets freed, added to some slab or page free list */
> 	WRITE_ONCE(slab_free_list, __va(paddr));
>=20
> P1:
> 	paddr =3D __pa(READ_ONCE(slab_free_list));/* re-allocating paddr freed o=
n P0 */
> 	if (!list_empty()) {			/* assuming other elements on the list */
> 		/* searching the list */
> 		list_for_each() {
> 			if (pos->paddr) =3D=3D __pa(vaddr))
> 				/* match */
> 		}
> 	}
>=20
> On P0, you want the list update to be visible before the memory is freed
> (and potentially reallocated on P1). An smp_wmb() on P0 would do. For
> P1, we don't care about list_empty() as there can be other elements
> already. But we do want any list elements reading during the search to
> be ordered after the slab_free_list reading. The smp_rmb() you'd add for
> the case above would suffice.

Yes, but to protect against concurrent insertions/deletions, a spinlock
is held while searching the list. The spin lock provides the necessary
memory barriers implicitly.

Again, thank you very much for your time!

Petr T
