Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBF54551BC
	for <lists+linux-doc@lfdr.de>; Thu, 18 Nov 2021 01:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241975AbhKRAh0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Nov 2021 19:37:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53052 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241970AbhKRAhZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Nov 2021 19:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637195666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=BeNhrEKZDmwOYYueDNfboE8DCNvjuM9I1jBB9AYYqeQ=;
        b=OQoxs4JOjUY6YQEPZvNBaaCNcVMpKnBG2n1u4kh4S7PdhbTy6kUnIYuwZQExGdsl8lfSe1
        IIFVkjIijvEUCwrSuFvYwKGnazBlYMjWMlB9IBEAUPyUuTmW8qd/zgzSeg7KSwB+CvsMBw
        rZpgVRfXyukLoQZKB018hJX9Bwp5Pi8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554--H9c9QWGN3OqWW7SV7v3dg-1; Wed, 17 Nov 2021 19:34:24 -0500
X-MC-Unique: -H9c9QWGN3OqWW7SV7v3dg-1
Received: by mail-pl1-f198.google.com with SMTP id p16-20020a170902e75000b0014271728fd6so2018622plf.18
        for <linux-doc@vger.kernel.org>; Wed, 17 Nov 2021 16:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BeNhrEKZDmwOYYueDNfboE8DCNvjuM9I1jBB9AYYqeQ=;
        b=FUjMxx5yXlYXViK6ghQa8Lz289SmcrLfy4IPeG7YSGSsKG+DdVJjJjq0Ifqcq0Ljj/
         khvoonfN1t+HtXap45XHFx0MqWMV2Zh/PkBply5/oCkl1FJfvQ+LGsCsTmW2uys8qZvs
         SSapZ/KHq+Ed+D8OhrDcztjpBQDZRLUzsuEDY8DMk+09hckE4My466v1YxwAKnM5hCXu
         DukAnvwD2p4OibjZHkRCyJzfSy5gZ89I3HTVfqzUHcEawY+rjTAij84isMlBDkAAc0mG
         l9s/i1MZLuZEilqesPi3ztGhw+iw6pyu6h30elQlavKxBQ3MFj+sxA+Kya+TkaLfDV7g
         G5aA==
X-Gm-Message-State: AOAM532Xu142O2kOg2jBqDot1QWPRj/YP5HP5XX6AgODUfM2BpKWzeAl
        Zsb2OKuF2lIKLWAFGgxgdo4Y4kgoh08sEGlVK20gIOUEU4LdNLF1Qdje2UqYtA4345LUJSqM99H
        vnjQ3/f+0GBt8GG8UmTxJ
X-Received: by 2002:a17:90b:4aca:: with SMTP id mh10mr5136758pjb.234.1637195663351;
        Wed, 17 Nov 2021 16:34:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0qgqZGid7zYOV0THXIIaStWGVESZVDgQ8anBVeCNdnsEnBD0O/E8F3Tq/CgNL9Ux+taUsqA==
X-Received: by 2002:a17:90b:4aca:: with SMTP id mh10mr5136707pjb.234.1637195662934;
        Wed, 17 Nov 2021 16:34:22 -0800 (PST)
Received: from xz-m1.local ([191.101.132.73])
        by smtp.gmail.com with ESMTPSA id f19sm777629pfc.122.2021.11.17.16.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 16:34:22 -0800 (PST)
Date:   Thu, 18 Nov 2021 08:34:14 +0800
From:   Peter Xu <peterx@redhat.com>
To:     Mina Almasry <almasrymina@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmckrcu@fb.com>,
        Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ivan Teterevkov <ivan.teterevkov@nutanix.com>,
        Florian Schmidt <florian.schmidt@nutanix.com>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6] mm: Add PM_THP_MAPPED to /proc/pid/pagemap
Message-ID: <YZWfhsMtH8KUaEqO@xz-m1.local>
References: <20211117194855.398455-1-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211117194855.398455-1-almasrymina@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Mina,

On Wed, Nov 17, 2021 at 11:48:54AM -0800, Mina Almasry wrote:
> Add PM_THP_MAPPED MAPPING to allow userspace to detect whether a given virt
> address is currently mapped by a transparent huge page or not.  Example
> use case is a process requesting THPs from the kernel (via a huge tmpfs
> mount for example), for a performance critical region of memory.  The
> userspace may want to query whether the kernel is actually backing this
> memory by hugepages or not.
> 
> PM_THP_MAPPED bit is set if the virt address is mapped at the PMD
> level and the underlying page is a transparent huge page.
> 
> A few options were considered:
> 1. Add /proc/pid/pageflags that exports the same info as
>    /proc/kpageflags.  This is not appropriate because many kpageflags are
>    inappropriate to expose to userspace processes.
> 2. Simply get this info from the existing /proc/pid/smaps interface.
>    There are a couple of issues with that:
>    1. /proc/pid/smaps output is human readable and unfriendly to
>       programatically parse.
>    2. /proc/pid/smaps is slow.  The cost of reading /proc/pid/smaps into
>       userspace buffers is about ~800us per call, and this doesn't
>       include parsing the output to get the information you need. The
>       cost of querying 1 virt address in /proc/pid/pagemaps however is
>       around 5-7us.

This does not seem to be fair...  Should the "800us" value relevant to the
process memory size being mapped?  As smaps requires walking the whole memory
range and provides all stat info including THP accountings.

While querying 1 virt address can only account 1 single THP at most.

It means if we want to do all THP accounting for the whole range from pagemap
we need multiple read()s, right?  The fair comparison should compare the sum of
all the read()s on the virt addr we care to a single smap call.

And it's hard to be fair too, IMHO, because all these depend on size of mm.

Smaps is, logically, faster because of two things:

  - Smaps needs only one syscall for whatever memory range (so one
    user->kernel->user switch).

    Comparing to pagemap use case of yours, you'll need to read 1 virt address
    for each PMD, so when the PMD mapped size is huge, it could turn out that
    smaps is faster even counting in the parsing time of smaps output.

  - Smaps knows how to handle things in PMD level without looping into PTEs:
    see smaps_pmd_entry().

    Smaps will not duplicate the PMD entry into 512 PTE entries, because smaps
    is doing statistic (and that's exaxtly what your use case wants!), while
    pagemap is defined in 4K page size even for huge mappings because the
    structure is defined upon the offset of the pagemap fd; that's why it needs
    to duplicate the 2M entry into 512 same ones; even if they're not really so
    meaningful.

That's also why I tried to propose the interface of smaps to allow querying
partial of the memory range, because IMHO it solves the exact problem you're
describing and it'll also be in the most efficient way, meanwhile I think it
expose all the rest smaps data too besides THP accountings so it could help
more than thp accountings.

So again, no objection on this simple and working patch, but perhaps rephrasing
the 2nd bullet as: "smaps is slow because it must read the whole memory range
rather than a small range we care"?

Thanks,

-- 
Peter Xu

