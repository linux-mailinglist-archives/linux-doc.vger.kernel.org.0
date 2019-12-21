Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C65831285FD
	for <lists+linux-doc@lfdr.de>; Sat, 21 Dec 2019 01:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfLUAc3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 20 Dec 2019 19:32:29 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40027 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbfLUAcZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Dec 2019 19:32:25 -0500
Received: by mail-ot1-f65.google.com with SMTP id w21so6264054otj.7
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2019 16:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x7w4UD7OpHop1e3Pz2ddMBPnhs3gOWoGc1gZLtDq0vk=;
        b=vxEhprSqaQNYHFQ4H7dcX/E/mSO1yt4IUVMZ4sAhLDFH4ZGUKPILIYVqnfnOi8vncn
         TkMivZIMeBGXnc2DZxbo8rhaadDmZ0J8YlsyjunZpHnqoJnITQdI9o+0sVlYw4wIwgNg
         hVrkgdMe4LV+bJ1UOTvAeTPb7daNE36o1jVBQU5BvO3ZoVIoBadMJDXjLnRiZsHYGooC
         TNPa9bH1kbJLrQnHkt24kZfMiD+6hcL+ePqBCPpBSGancvjEQx8QdtGwVjyhNWrmhcl4
         X37OrtjEVw+33y61x0Kg++5hk4Jka/RWupbXhqGSK3ZcyRVBMCG0sfPDxatqX5Z1NvKS
         I51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x7w4UD7OpHop1e3Pz2ddMBPnhs3gOWoGc1gZLtDq0vk=;
        b=N2AGSXh1zyzk31TBYiqEqKNSDMxqzm1/wJ3T5BU3aRbO79gCbLNlHbNTVvpok+D9ZL
         ZmpWPRbVx5KZh/68RujXvARjUn2XZBZFQpdozXqG2y/c7hy44XnxDvbgWausH2mkIJjA
         U3zotvRQRHznkN+QbDVVdoppRgeEYRRvqhOOIRy0e7R5XHAZjB1a2Or9bc/y3Si/Sz0Y
         P8oTbTx3CHVe3PMmFqlyZooT5J73Ob6yvZzW/Fh45rlTt0FFohbp1ElvzbkWYq2OPzxD
         s5p2mT332t95fJdM86gmJq5rumJ3yKrnDP0I6HVXqHP+XzWQvYz1bznLtwYzJxUYJi6A
         OK2w==
X-Gm-Message-State: APjAAAWfwfI6N6CgomDJJ6mPOfVl8M5jsx/UckjNsW4sI96wFNopsX8Q
        W9JqnM+t3FfWWZdXwiAGGMBFiAGTzUWs3CPVAcVh9Q==
X-Google-Smtp-Source: APXvYqz/XCcCPtPTpD6diyokGu99CSTPorQgAyb2cALnDUt6lAGgGTah0l7Kj7pZCHJSAA7gXN8KcX+bngnSk0tk1h8=
X-Received: by 2002:a9d:7852:: with SMTP id c18mr12814325otm.247.1576888344708;
 Fri, 20 Dec 2019 16:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20191216222537.491123-1-jhubbard@nvidia.com> <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com> <20191219210743.GN17227@ziepe.ca>
 <42a3e5c1-6301-db0b-5d09-212edf5ecf2a@nvidia.com> <20191220133423.GA13506@ziepe.ca>
In-Reply-To: <20191220133423.GA13506@ziepe.ca>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 20 Dec 2019 16:32:13 -0800
Message-ID: <CAPcyv4hX9TsTMjsv2hnbEM-TpkC9abtWGSVskr9nPwpR8c5E1Q@mail.gmail.com>
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, KVM list <kvm@vger.kernel.org>,
        linux-block@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Netdev <netdev@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Maor Gottlieb <maorg@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 20, 2019 at 5:34 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Dec 19, 2019 at 01:13:54PM -0800, John Hubbard wrote:
> > On 12/19/19 1:07 PM, Jason Gunthorpe wrote:
> > > On Thu, Dec 19, 2019 at 12:30:31PM -0800, John Hubbard wrote:
> > > > On 12/19/19 5:26 AM, Leon Romanovsky wrote:
> > > > > On Mon, Dec 16, 2019 at 02:25:12PM -0800, John Hubbard wrote:
> > > > > > Hi,
> > > > > >
> > > > > > This implements an API naming change (put_user_page*() -->
> > > > > > unpin_user_page*()), and also implements tracking of FOLL_PIN pages. It
> > > > > > extends that tracking to a few select subsystems. More subsystems will
> > > > > > be added in follow up work.
> > > > >
> > > > > Hi John,
> > > > >
> > > > > The patchset generates kernel panics in our IB testing. In our tests, we
> > > > > allocated single memory block and registered multiple MRs using the single
> > > > > block.
> > > > >
> > > > > The possible bad flow is:
> > > > >    ib_umem_geti() ->
> > > > >     pin_user_pages_fast(FOLL_WRITE) ->
> > > > >      internal_get_user_pages_fast(FOLL_WRITE) ->
> > > > >       gup_pgd_range() ->
> > > > >        gup_huge_pd() ->
> > > > >         gup_hugepte() ->
> > > > >          try_grab_compound_head() ->
> > > >
> > > > Hi Leon,
> > > >
> > > > Thanks very much for the detailed report! So we're overflowing...
> > > >
> > > > At first look, this seems likely to be hitting a weak point in the
> > > > GUP_PIN_COUNTING_BIAS-based design, one that I believed could be deferred
> > > > (there's a writeup in Documentation/core-api/pin_user_page.rst, lines
> > > > 99-121). Basically it's pretty easy to overflow the page->_refcount
> > > > with huge pages if the pages have a *lot* of subpages.
> > > >
> > > > We can only do about 7 pins on 1GB huge pages that use 4KB subpages.
> > >
> > > Considering that establishing these pins is entirely under user
> > > control, we can't have a limit here.
> >
> > There's already a limit, it's just a much larger one. :) What does "no limit"
> > really mean, numerically, to you in this case?
>
> I guess I mean 'hidden limit' - hitting the limit and failing would
> be managable.
>
> I think 7 is probably too low though, but we are not using 1GB huge
> pages, only 2M..

What about RDMA to 1GB-hugetlbfs and 1GB-device-dax mappings?
