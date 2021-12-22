Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96ADE47CE4C
	for <lists+linux-doc@lfdr.de>; Wed, 22 Dec 2021 09:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbhLVIaK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Dec 2021 03:30:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35938 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239432AbhLVIaJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Dec 2021 03:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640161809;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K5R13w0zfTN1gfH0nX3lNZrmWuAI/MqkwgiuEDiE6RY=;
        b=b2l3Ctb8ntNNMRGC/rzzH+KFoqt1NE5ttO/6Bq9G0PtVq7eXOOQNTDbAAeoqiH+rdJH57Q
        muShoCAp4sMNTK1gftxD11tEYZFe5ZOjStBnrl/mwngOrtUUk7mnfZIK41tIliTrlcQEsn
        5KRNhrEe32nO8JsRfxU41fsem3QvL6I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-7T-qdBLfOEiUDSXCr2z-hQ-1; Wed, 22 Dec 2021 03:30:07 -0500
X-MC-Unique: 7T-qdBLfOEiUDSXCr2z-hQ-1
Received: by mail-wm1-f70.google.com with SMTP id ay40-20020a05600c1e2800b003458b72e865so362683wmb.9
        for <linux-doc@vger.kernel.org>; Wed, 22 Dec 2021 00:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=K5R13w0zfTN1gfH0nX3lNZrmWuAI/MqkwgiuEDiE6RY=;
        b=jXVpxAnLWY9VRnpoal5Qk/evzLXYG0vKvEXmdvQaAbI/2Vpnisl7Ds+YKP4anJpKFY
         hsBBzvID8yGehr2wbJzZBFMgvzSosyeyvKLXMU/U4x+Z3W+oT5VGCb4lmtsFUsaiPIAj
         9wdHgGZw0iMx3S/9CpTQNsUmRUWALp7lPDLwx4ivogDD4VDNUgvM2p2zAhy75VWqzUuR
         8bA35bkX6upUOpIEBKOWhyW90pDWSJkpM0dLDw+58odlQ125YtI01Sg4CCFxW8kgYsdA
         amF8SMzkG3ILkrEkUfi74kDRHUc+FdFCH3oEUw+2RHfFY1BLiz31k74MyPCWQn4jh/Od
         ES4w==
X-Gm-Message-State: AOAM532lsfwlEfUAfrDtVviDgv+7w/P3I1r7J4MfxKMs+r0/htBomjcI
        1ws/qJOVUEPZHtO6WXi9DgHNj/vJvNXOdTCWkBKl+NIC5xF4aYfMZUuvsSFt4pKPuNpsZHIg/TR
        +tlp62QUUR4tlG6CPdrg2
X-Received: by 2002:a1c:4d0d:: with SMTP id o13mr119033wmh.70.1640161806601;
        Wed, 22 Dec 2021 00:30:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaZ676bBfkbDM9ipvMcx7Mwzr6YXpVK+BGvG7K1IdqnkI9kzwsmGfVYCo0meG5jwXnlGK2Tw==
X-Received: by 2002:a1c:4d0d:: with SMTP id o13mr119007wmh.70.1640161806438;
        Wed, 22 Dec 2021 00:30:06 -0800 (PST)
Received: from [192.168.3.132] (p5b0c646a.dip0.t-ipconnect.de. [91.12.100.106])
        by smtp.gmail.com with ESMTPSA id m35sm10660481wms.1.2021.12.22.00.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 00:30:06 -0800 (PST)
Message-ID: <e6d5d38c-c309-5646-84e2-5840fc037a5c@redhat.com>
Date:   Wed, 22 Dec 2021 09:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
Content-Language: en-US
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Nadav Amit <namit@vmware.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Roman Gushchin <guro@fb.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        Donald Dutile <ddutile@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Oleg Nesterov <oleg@redhat.com>, Jan Kara <jack@suse.cz>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com>
 <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com>
 <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
 <CAHk-=whYT0Q1F=bxG0yi=LN5gXY64zBwefsbkLoRiP5p598d5A@mail.gmail.com>
 <fca16906-8e7d-5d04-6990-dfa8392bad8b@redhat.com>
 <20211221010312.GC1432915@nvidia.com>
 <fd7e3195-4f36-3804-1793-d453d5bd3e9f@redhat.com>
 <CAHk-=wgQq3H6wfkW7+MmduVgBOqHeiXQN97yCMd+m1mM-1xCLQ@mail.gmail.com>
 <900b7d4a-a5dc-5c7b-a374-c4a8cc149232@redhat.com>
 <20211221235916.GI1432915@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211221235916.GI1432915@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22.12.21 00:59, Jason Gunthorpe wrote:
> On Tue, Dec 21, 2021 at 06:40:30PM +0100, David Hildenbrand wrote:
> 
>> What adds complexity to correctly maintain the "exclusive" state are at
>> least:
>> * KSM (might be harder, have to think about it)
> 
> I know little about it, but isn't KSM like fork where it is trying to
> WP pages with the intention of copying them? Shouldn't KSM completely
> reject WP'ing a page that is under any kind of writable GUP?

I think KSM will, similar to fork(), always have to try removing
PageAnonExclusive() while synchronizing against concurrent GUP pins. If
that fails, the page cannot be converted to KSM and consequently not be
shared.

That will need some rework of KSM  AFAIU, but shouldn't be impossible to do.

-- 
Thanks,

David / dhildenb

