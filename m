Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0DB2F849C
	for <lists+linux-doc@lfdr.de>; Fri, 15 Jan 2021 19:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387577AbhAOSkt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Jan 2021 13:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733089AbhAOSkt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jan 2021 13:40:49 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D710C061793
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 10:40:09 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id e15so6727921qte.9
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 10:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7iqMaLM5ngsObMfPwH4GTR7fbydas+V1RNx2qyihbRE=;
        b=OhxHt8mmLJBsBMtZBFbnzLbxdAsOB8Ka3zQhmpOBvqIxz1zjBrp/a47AIXhKA0t3km
         YlHhKjdWMqC7jNahlHbUlRUPmkRb6aO3yRCF+8ADRWKYCO7qd059e5vvQyc9p7FxMpRy
         yK6aElGVEG1rRRoH4i0ELby/mv6XobYfm7NJGIKaJEA8DWYgI7JeHVHHJ5l69RwW2WVM
         MNIBWcLwwew5ASqQAc7q4SYDX9xA6MsERsWIb//cqdNkvQpmcUggFcLkB3zoFQMDBzw9
         T/XsBb0QSqYdbXf3XNPHdZZtNVQ/dL8ZHqC6DmEFhEVb5SB5csXt7sqriqrmopJy8BxM
         omLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7iqMaLM5ngsObMfPwH4GTR7fbydas+V1RNx2qyihbRE=;
        b=KvBH4naDsyRhOH8zY1sc7WoUZTch/H96JSCT/Rnwo14GTpVXNQNcj6bh30XWwGcrfH
         xmnkOui9o4A5SJrKZyzFsp6gc95X2dxeukqkJJS5yej1wbNZFUZPtw86xRJRs1K7bUBR
         z+TH7kjwPLMdTb6j4IjaHgUDhuV14I9E/2v86dG+i8YqrsJhS95yGWUAM6cCWvyYR/Ca
         6cZzrkvM6uJx4NHgLGSfkASvd/Ih9jo9wj/VZKh1PhsvrfQBGoAhy8DQbUqHhmNgBZxJ
         C5KWOE16IkglOIt0rppGM9dCGDW3uqjNphsCvMBdDfW7E46LNa8XaWW7+NEqZmBdZ/Bs
         xNDQ==
X-Gm-Message-State: AOAM532DX01WMI+B56isctfN3osChNKMx+sqOwrRBE6LC9K48okr+IHr
        2NU+OZL7QTNPQlPTu+BTeQLdEw==
X-Google-Smtp-Source: ABdhPJwYvWXIvOLXd5qgmW2cmliLgAWyRNvV6PcZolMroOO0r5/CLLBELstEgOcEHd1noGRZeNtm8w==
X-Received: by 2002:a05:622a:4d1:: with SMTP id q17mr7113455qtx.272.1610736008331;
        Fri, 15 Jan 2021 10:40:08 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id u10sm1059825qtb.24.2021.01.15.10.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 10:40:07 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l0U10-001hs5-Uq; Fri, 15 Jan 2021 14:40:06 -0400
Date:   Fri, 15 Jan 2021 14:40:06 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 08/10] mm/gup: limit number of gup migration failures,
 honor failures
Message-ID: <20210115184006.GH4605@ziepe.ca>
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-9-pasha.tatashin@soleen.com>
 <20201217205048.GL5487@ziepe.ca>
 <CA+CK2bA4F+SipkReJzFjCSC-8kZdK4yrwCQZM+TvCTrqV2CGHg@mail.gmail.com>
 <20201218141927.GM5487@ziepe.ca>
 <CA+CK2bDULopw649ndBybA-ST5EoRMHULwcfQcSQVKT9r8zAtwQ@mail.gmail.com>
 <20210113195528.GD4605@ziepe.ca>
 <CA+CK2bDDUMOeCH8rQBL7fBdHCAUZBOykyXNL2N=hmxq7xi0giQ@mail.gmail.com>
 <CA+CK2bC=o1-qW5+d-Lud9qN1937PC4Jxf_oyxwVrKby=mH5WyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bC=o1-qW5+d-Lud9qN1937PC4Jxf_oyxwVrKby=mH5WyQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 15, 2021 at 01:10:27PM -0500, Pavel Tatashin wrote:

> I've been thinking about this some more. Again, I am not sure this is
> a bug. I understand split_huge_pmd() may split the PMD size page into
> PTEs and leave the compound page intact. However, in order for pages[]
> to have non sequential addresses in compound page, those PTEs must
> also be migrated after split_huge_pmd(), 

Why focus on migrated? Anything could happen to those PTEs: they could
be COW'd, they could be mmap/munmap'd, etc.

Jason
