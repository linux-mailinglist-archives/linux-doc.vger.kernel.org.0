Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DD6398D38
	for <lists+linux-doc@lfdr.de>; Wed,  2 Jun 2021 16:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhFBOjZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Jun 2021 10:39:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51501 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232055AbhFBOjW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jun 2021 10:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622644654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m/QwAefnsRXdsP3/z6cvtajoG5iQ+RdDqTRbmixBgeQ=;
        b=anazLgnTQtygSC48PiOS9AQYq4nW8dRaYEJgY40fgw9dWQ4DFBav296Px5OK+guNCbXpYC
        0mZTarSPiiyTe/kXCJ5oX5nTO8soVYCr5aB096f1OLScHVkREzzLbpFEBiZdOFeEzEjD5h
        9H+2pmxcvxI05786h5uLUjNlRWQJSC4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-UG7_bN5vMVa20Gw0hWivBQ-1; Wed, 02 Jun 2021 10:37:33 -0400
X-MC-Unique: UG7_bN5vMVa20Gw0hWivBQ-1
Received: by mail-qt1-f200.google.com with SMTP id w1-20020ac87a610000b02902433332a0easo1465240qtt.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Jun 2021 07:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m/QwAefnsRXdsP3/z6cvtajoG5iQ+RdDqTRbmixBgeQ=;
        b=I/c1Py6r6k5ZKe0nb9j2PLK3LQy1lkutLTDhsSFinMGbmbjrpuitw1qTMBQLOy+z2Z
         +Ekxp58MQ3ooxN6VGSAckZBl6aWXJHVtm5mYobJUKNiOUTYo1nMPEtYbqAcJ5r3X7l1P
         lotZz4pgdN4jNNfkx/mS7AEE/BFVe0uGpGGt7SH03LRhj+RM4xeZcWrt5F1L/o3Y5mlA
         EefDN1OLoG+0ExQHRbO1Ui5KSxLoMWsq/H95+c/L5/N7+Wj1QAWh7uaIriZ3lpUbm0s1
         QoyFzhpNa5moKxgE+B2w6SG3L7yzvC5rPZHx0nM7II1ARn0bUtV3iV8rjeE2rTZHuxss
         j5gg==
X-Gm-Message-State: AOAM533RneHGsDDjg+J4KiFFkug4GluR42LuPJYr65lvFS6wVl1C+rHP
        LP//2f3y65AxLXky6gwqzh2Q5MjVrMlD317XlFy/S5kR6WATVKfVBrXrJi7YfS3syh4kTNRDDo3
        1jEanQPr+620Ilh1arBkv
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr24760220qta.303.1622644653346;
        Wed, 02 Jun 2021 07:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTs6tJ8uqmSORfD2Z3iGZv/0i+S2lgFtI+HHVdQRE2EuDI89DE3ak/M7GvRJs9513WyidOxA==
X-Received: by 2002:ac8:5b81:: with SMTP id a1mr24760200qta.303.1622644652986;
        Wed, 02 Jun 2021 07:37:32 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
        by smtp.gmail.com with ESMTPSA id e127sm87950qkf.62.2021.06.02.07.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:37:32 -0700 (PDT)
Date:   Wed, 2 Jun 2021 10:37:30 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Balbir Singh <bsingharora@gmail.com>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, jglisse@redhat.com, willy@infradead.org,
        jgg@nvidia.com, hughd@google.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YLeXqp/U0DgylI/u@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
 <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
 <YKzk0ILRsyazMs2W@balbir-desktop>
 <8844f8c1-d78c-e0f9-c046-592bd75d4c07@nvidia.com>
 <YLdGXSw0zdiovn4i@balbir-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YLdGXSw0zdiovn4i@balbir-desktop>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 02, 2021 at 06:50:37PM +1000, Balbir Singh wrote:
> On Wed, May 26, 2021 at 12:17:18AM -0700, John Hubbard wrote:
> > On 5/25/21 4:51 AM, Balbir Singh wrote:
> > ...
> > > > How beneficial is this code to nouveau users?  I see that it permits a
> > > > part of OpenCL to be implemented, but how useful/important is this in
> > > > the real world?
> > > 
> > > That is a very good question! I've not reviewed the code, but a sample
> > > program with the described use case would make things easy to parse.
> > > I suspect that is not easy to build at the moment?
> > > 
> > 
> > The cover letter says this:
> > 
> > This has been tested with upstream Mesa 21.1.0 and a simple OpenCL program
> > which checks that GPU atomic accesses to system memory are atomic. Without
> > this series the test fails as there is no way of write-protecting the page
> > mapping which results in the device clobbering CPU writes. For reference
> > the test is available at https://ozlabs.org/~apopple/opencl_svm_atomics/
> > 
> > Further testing has been performed by adding support for testing exclusive
> > access to the hmm-tests kselftests.
> > 
> > ...so that seems to cover the "sample program" request, at least.
> 
> Thanks, I'll take a look
> 
> > 
> > > I wonder how we co-ordinate all the work the mm is doing, page migration,
> > > reclaim with device exclusive access? Do we have any numbers for the worst
> > > case page fault latency when something is marked away for exclusive access?
> > 
> > CPU page fault latency is approximately "terrible", if a page is resident on
> > the GPU. We have to spin up a DMA engine on the GPU and have it copy the page
> > over the PCIe bus, after all.
> > 
> > > I presume for now this is anonymous memory only? SWP_DEVICE_EXCLUSIVE would
> > 
> > Yes, for now.
> > 
> > > only impact the address space of programs using the GPU. Should the exclusively
> > > marked range live in the unreclaimable list and recycled back to active/in-active
> > > to account for the fact that
> > > 
> > > 1. It is not reclaimable and reclaim will only hurt via page faults?
> > > 2. It ages the page correctly or at-least allows for that possibility when the
> > >     page is used by the GPU.
> > 
> > I'm not sure that that is *necessarily* something we can conclude. It depends upon
> > access patterns of each program. For example, a "reduction" parallel program sends
> > over lots of data to the GPU, and only a tiny bit of (reduced!) data comes back
> > to the CPU. In that case, freeing the physical page on the CPU is actually the
> > best decision for the OS to make (if the OS is sufficiently prescient).
> >
> 
> With a shared device or a device exclusive range, it would be good to get the device
> usage pattern and update the mm with that knowledge, so that the LRU can be better
> maintained. With your comment you seem to suggest that a page used by the GPU might
> be a good candidate for reclaim based on the CPU's understanding of the age of
> the page should not account for use by the device
> (are GPU workloads - access once and discard?) 

Hmm, besides the aging info, this reminded me: do we need to isolate the page
from lru too when marking device exclusive access?

Afaict the current patch didn't do that so I think it's reclaimable.  If we
still have the rmap then we'll get a mmu notify CLEAR when unmapping that
special pte, so device driver should be able to drop the ownership.  However we
dropped the rmap when marking exclusive.  Now I don't know whether and how
it'll work if page reclaim runs with the page being exclusively owned if
without isolating the page..

-- 
Peter Xu

