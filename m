Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 348B3F9CAF
	for <lists+linux-doc@lfdr.de>; Tue, 12 Nov 2019 22:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfKLV5j (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Nov 2019 16:57:39 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33191 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbfKLV5j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Nov 2019 16:57:39 -0500
Received: by mail-ot1-f67.google.com with SMTP id u13so15746520ote.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2019 13:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GVsjPqJbGl0vB/+Gk+mdS3wPD6eGzXnfLsFoQJ3IvwY=;
        b=Xi5VpxURlOvKgdnc2CCM8ogRa/H5/0k5sFmSuFB8dP7mdDgr87G2ihgcoAULaWG/WG
         Hj8o+3+ie5rrJujDRUeLRQcOeiNzn8YKMM2VBeVNBKVsnBN0FQns+w7w3PsW4i65s8a5
         N+VULX92Qszd6uoAo9krZIME0J3xIfL4gJiRjCsCskWvVjLpfyuINcuFYSor/+iuZuqF
         2TY8xkdKZQu+VBpockLjH+8q98S3mNVqmKjCD+wTD8kkFuDZ2LtRYTFByjXSsRxruC6f
         SXuVKXEgsV4rmu18ICvQbVomOgOwxUGMXKdLYloN5hq1WNlcDitiNl2/AmVQ4Ykyplh2
         IsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GVsjPqJbGl0vB/+Gk+mdS3wPD6eGzXnfLsFoQJ3IvwY=;
        b=ogQvNcHDjGyfJpH7i5XkQbw+CSrTR9OMYzK7t9xt4NnVY9bvlCtvG5MlprosFlV269
         xMNMBx3CAiuxXkD1AJlAAMjndk0RxQWo9jj1zCcv2mcWU/oi+FePYXc5DChqNqrKDLFx
         oc0yFxxat84PNiwmxdKo5Hw2eJUGKhng4ru+ntoejG+j/mK8uFdk+Vl97VTmbnFETEYa
         mSYvvWiEkD8HSQAY6EMgfQZ19hO1c+vAEBaKW0f6SWsC1VZUkffWqtw+d75Dkp8w+m3E
         F3JsKGNkWf8spoPJ8NdNbYX5Mny+d/zyaE7HRZVZhspSSABhwGnzKx/QheM9ilveaEns
         q3lw==
X-Gm-Message-State: APjAAAUQ45U/sGcI3coHPk4jeogzCBNexDrdf7nD76+vVodAEvVeUEgp
        rBV7tGfwdLNag/WD9rKNd7wrjutb7SbAaAud5dVGqA==
X-Google-Smtp-Source: APXvYqzkEVRCSmKc+X1f3BY1LRLo7eG1sZvx8YX/MxrMpGOBy0kbPmD/k6U1Bv0DnK/agC4LCbQG5TvJ1BrQq2DF3mo=
X-Received: by 2002:a9d:5f11:: with SMTP id f17mr5454287oti.207.1573595857896;
 Tue, 12 Nov 2019 13:57:37 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com> <20191112000700.3455038-9-jhubbard@nvidia.com>
In-Reply-To: <20191112000700.3455038-9-jhubbard@nvidia.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 12 Nov 2019 13:57:27 -0800
Message-ID: <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and FOLL_LONGTERM
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
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
        Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
        Jonathan Corbet <corbet@lwn.net>,
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
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 11, 2019 at 4:07 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> As it says in the updated comment in gup.c: current FOLL_LONGTERM
> behavior is incompatible with FAULT_FLAG_ALLOW_RETRY because of the
> FS DAX check requirement on vmas.
>
> However, the corresponding restriction in get_user_pages_remote() was
> slightly stricter than is actually required: it forbade all
> FOLL_LONGTERM callers, but we can actually allow FOLL_LONGTERM callers
> that do not set the "locked" arg.
>
> Update the code and comments accordingly, and update the VFIO caller
> to take advantage of this, fixing a bug as a result: the VFIO caller
> is logically a FOLL_LONGTERM user.
>
> Thanks to Jason Gunthorpe for pointing out a clean way to fix this.
>
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Jerome Glisse <jglisse@redhat.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 30 +++++++++++++-----------------
>  mm/gup.c                        | 13 ++++++++-----
>  2 files changed, 21 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index d864277ea16f..017689b7c32b 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -348,24 +348,20 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
>                 flags |= FOLL_WRITE;
>
>         down_read(&mm->mmap_sem);
> -       if (mm == current->mm) {
> -               ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
> -                                    vmas);
> -       } else {
> -               ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
> -                                           vmas, NULL);
> -               /*
> -                * The lifetime of a vaddr_get_pfn() page pin is
> -                * userspace-controlled. In the fs-dax case this could
> -                * lead to indefinite stalls in filesystem operations.
> -                * Disallow attempts to pin fs-dax pages via this
> -                * interface.
> -                */
> -               if (ret > 0 && vma_is_fsdax(vmas[0])) {
> -                       ret = -EOPNOTSUPP;
> -                       put_page(page[0]);
> -               }
> +       ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
> +                                   page, vmas, NULL);

Hmm, what's the point of passing FOLL_LONGTERM to
get_user_pages_remote() if get_user_pages_remote() is not going to
check the vma? I think we got to this code state because the
get_user_pages() vs get_user_pages_remote() split predated the
introduction of FOLL_LONGTERM.

I think check_vma_flags() should do the ((FOLL_LONGTERM | FOLL_GET) &&
vma_is_fsdax()) check and that would also remove the need for
__gup_longterm_locked.
