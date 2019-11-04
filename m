Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C42E2EE9A7
	for <lists+linux-doc@lfdr.de>; Mon,  4 Nov 2019 21:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729621AbfKDUdt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 4 Nov 2019 15:33:49 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46691 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729248AbfKDUds (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Nov 2019 15:33:48 -0500
Received: by mail-qt1-f196.google.com with SMTP id u22so25941475qtq.13
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2019 12:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hy6S1CxSVssj2bkIKuMTAq97xRRQuAGtFwjKjIDSs4I=;
        b=Syo1tAT9HuH4VB5wWMiltn4K6pnLe9wn5bqONEck4zS9JKeiP8TJVYPKQw5ntGO0lO
         Y3jt4UCMH5h1noX1i5QYvgSRGj2xtl4EWsxMUf0qc20g0RvT8UUUzWn0HVswCZXk3AHb
         ewnZ/jON7bJM2qzwTcb9I0s/fHzYB6OUc+9nqxJXF9HS/7VFw2laSQrNtFyVopG8WtQX
         NCFlYEO6FvcqM9dRvuDJLZvUtP9rNpuSVWBBYCT6gAhsX9aZcpDHsP7ohxZiroP0M4+r
         rETOvZb7k+FSw/5xszaImrvpA4a1gkAgGfJ7YkwSD/5z7jV4eZZYF2MBQy/fzICGGpXU
         8Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hy6S1CxSVssj2bkIKuMTAq97xRRQuAGtFwjKjIDSs4I=;
        b=qmhTHJSbitY+a3imxezU2L/vstkCTO3l4IxHf67+pNUmD3Dx1wYVy5z1cDOOFG/w62
         iQctlGgHsnnuZQ4B+4euvh+9aZ3+fW68AUDcDsGwMkfSqL2yv+N7XsTYPSHw8E19mXGA
         1UXNFmH0oVKt2+h5B3yOD4QwJTDPE1UIFg4NtXB2AK6GcgWcocbUU6y/xH6e4YIOTiJC
         QTn1OXlKTlw9ZLgBnO1O1sDPZMHbBdRuUUlwlfuEnIs3sZBUGVshJCmK1nfX5SHD2ZO6
         m1buFArL5OJOf/OuWbzXKhgM8BdjYKgBBRxsxbMx5vx2KCUzcvHHg6uPCs9Eue8/QgRA
         30eQ==
X-Gm-Message-State: APjAAAV3NLtB/yzxZUaX0lc1ZZ2wQf2QcChPLoyLlzCHVea0oh3hLPze
        AsHSSze60R8awtrRm8Z02VdvVQ==
X-Google-Smtp-Source: APXvYqzVc13GhfjjgDTIcNfG7UlfIQ4Qj6KKRSXLf1fyFAffIYvvpHXLmVL3LHiF/HBtv2PsaaOkHw==
X-Received: by 2002:ac8:2432:: with SMTP id c47mr14284906qtc.74.1572899627734;
        Mon, 04 Nov 2019 12:33:47 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.180])
        by smtp.gmail.com with ESMTPSA id h185sm9953104qkc.7.2019.11.04.12.33.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 12:33:47 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1iRj2o-0005Hx-QL; Mon, 04 Nov 2019 16:33:46 -0400
Date:   Mon, 4 Nov 2019 16:33:46 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
        linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/18] infiniband: set FOLL_PIN, FOLL_LONGTERM via
 pin_longterm_pages*()
Message-ID: <20191104203346.GF30938@ziepe.ca>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-8-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103211813.213227-8-jhubbard@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Nov 03, 2019 at 01:18:02PM -0800, John Hubbard wrote:
> Convert infiniband to use the new wrapper calls, and stop
> explicitly setting FOLL_LONGTERM at the call sites.
> 
> The new pin_longterm_*() calls replace get_user_pages*()
> calls, and set both FOLL_LONGTERM and a new FOLL_PIN
> flag. The FOLL_PIN flag requires that the caller must
> return the pages via put_user_page*() calls, but
> infiniband was already doing that as part of an earlier
> commit.
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>  drivers/infiniband/core/umem.c              |  5 ++---
>  drivers/infiniband/core/umem_odp.c          | 10 +++++-----
>  drivers/infiniband/hw/hfi1/user_pages.c     |  4 ++--
>  drivers/infiniband/hw/mthca/mthca_memfree.c |  3 +--
>  drivers/infiniband/hw/qib/qib_user_pages.c  |  8 ++++----
>  drivers/infiniband/hw/qib/qib_user_sdma.c   |  2 +-
>  drivers/infiniband/hw/usnic/usnic_uiom.c    |  9 ++++-----
>  drivers/infiniband/sw/siw/siw_mem.c         |  5 ++---
>  8 files changed, 21 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
> index 24244a2f68cc..c5a78d3e674b 100644
> +++ b/drivers/infiniband/core/umem.c
> @@ -272,11 +272,10 @@ struct ib_umem *ib_umem_get(struct ib_udata *udata, unsigned long addr,
>  
>  	while (npages) {
>  		down_read(&mm->mmap_sem);
> -		ret = get_user_pages(cur_base,
> +		ret = pin_longterm_pages(cur_base,
>  				     min_t(unsigned long, npages,
>  					   PAGE_SIZE / sizeof (struct page *)),
> -				     gup_flags | FOLL_LONGTERM,
> -				     page_list, NULL);
> +				     gup_flags, page_list, NULL);

FWIW, this one should be converted to fast as well, I think we finally
got rid of all the blockers for that?

Jason
