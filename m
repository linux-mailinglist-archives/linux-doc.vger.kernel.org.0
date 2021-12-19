Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684FB47A1A1
	for <lists+linux-doc@lfdr.de>; Sun, 19 Dec 2021 18:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236093AbhLSRoS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 19 Dec 2021 12:44:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58213 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232929AbhLSRoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Dec 2021 12:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639935855;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gMlSMHa+DYdEjsx/Tqnpqm/9oL+HOai5WdGa5J7Lr38=;
        b=WoefCF/LUgqDJ7dOMrQowLjQzl8uoJyfCij56BG8S/S3keKCaBvZhG/s4g1iNWv4QLrOVQ
        Qbgf2b6E+Kzm5QcZSQvd3HwHCfJgAD/YEagYBQY/LMSXNnUzN1o+HxwTSFFR8hS89bncDV
        eN7i+k/rb4GI/VACLQ/Gp92BQXsDyZk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-RrOp3tSfNxOLpFJm7H3uXw-1; Sun, 19 Dec 2021 12:44:14 -0500
X-MC-Unique: RrOp3tSfNxOLpFJm7H3uXw-1
Received: by mail-wr1-f70.google.com with SMTP id o4-20020adfca04000000b0018f07ad171aso2756017wrh.20
        for <linux-doc@vger.kernel.org>; Sun, 19 Dec 2021 09:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=gMlSMHa+DYdEjsx/Tqnpqm/9oL+HOai5WdGa5J7Lr38=;
        b=AnDVgdxi50eVqej6iX7EKUwFArqF/eY6TyALM15YTtlpF4FAY/nnuCrfGY2OE1oYdR
         bwSHPvQcTLOD2EIB1ZRh+qx2G63hKtChmSwllUnu8hcjfzDlDDvHv9w7bJlwQNadyoyK
         Y4j22mnSppWWYSoovWYFBAPJd7819IZXJE4yNOYiLZkcQYHqQfbefD4NGWhit2wuNikX
         LkLSVP0LCs65SfBZboJxCVuIFpyUuF75GiDbGz8NfwdCIuKiGFYs2IY54AIkkXdRWnFP
         Z4Zg2V4NcQerdV7tLvhwm2e9JmhaVyS8LV8L+9Bj4B3ZS0r0+xajDk/vnqfJZIch+XV0
         eC+Q==
X-Gm-Message-State: AOAM532qIOgK6ZaG1ZE8ivEJ0X5g81168eByuGB7lIbkyRXG27yjlk6W
        KrzKSTn5Wfq6M/EAzFxDV8ktwA29WLE8tM+fYErOWKGs5k7v6zzy/exkJl6gcwIOZa7+NViwP0Z
        VSPNALOqB9Bc++XguzqJ5
X-Received: by 2002:adf:c843:: with SMTP id e3mr10159626wrh.38.1639935853351;
        Sun, 19 Dec 2021 09:44:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzftaicr3msKZsAPs3YWjGN2P8Z93a+o3wUJJuYtn1GvRH19Tg88EXvIzb88+3OpQBuvo6e9g==
X-Received: by 2002:adf:c843:: with SMTP id e3mr10159613wrh.38.1639935853012;
        Sun, 19 Dec 2021 09:44:13 -0800 (PST)
Received: from [192.168.3.132] (p4ff23c6f.dip0.t-ipconnect.de. [79.242.60.111])
        by smtp.gmail.com with ESMTPSA id k13sm13145587wri.6.2021.12.19.09.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Dec 2021 09:44:12 -0800 (PST)
Message-ID: <cd1ef96f-20af-9e5a-c084-a1f357ddb674@redhat.com>
Date:   Sun, 19 Dec 2021 18:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Nadav Amit <namit@vmware.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>,
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
References: <CAHk-=wgL5u3XMgfUN6BOqVO0OvPx3-LEri1ju-1TW4dFhHQO4g@mail.gmail.com>
 <CAHk-=wgKft6E_EeLA1GnEXcQBA9vu8m2B-M-U7PuiNa0+9gpHA@mail.gmail.com>
 <54c492d7-ddcd-dcd0-7209-efb2847adf7c@redhat.com>
 <CAHk-=wgjOsHAXttQa=csLG10Cp2hh8Dk8CnNC3_WDpBpTzBESQ@mail.gmail.com>
 <20211217204705.GF6385@nvidia.com>
 <2E28C79D-F79C-45BE-A16C-43678AD165E9@vmware.com>
 <CAHk-=wgw5bEe8+qifra-aY9fAOf2Pscp1vuXX=f4hESyCK_xLg@mail.gmail.com>
 <20211218030509.GA1432915@nvidia.com>
 <5C0A673F-8326-4484-B976-DA844298DB29@vmware.com>
 <CAHk-=wj7eSOhbWDeADL_BJKLzdDF5s_5R9v7d-4P3L6v1T3mpQ@mail.gmail.com>
 <20211218184233.GB1432915@nvidia.com>
 <5CA1D89F-9DDB-4F91-8929-FE29BB79A653@vmware.com>
 <CAHk-=wh-ETqwd6EC2PR6JJzCFHVxJgdbUcMpW5MS7gCa76EDsQ@mail.gmail.com>
 <4D97206A-3B32-4818-9980-8F24BC57E289@vmware.com>
 <CAHk-=whxvVQReBqZeaV41=sAWfT4xTfn6sMSWDfkHKVS3zX85w@mail.gmail.com>
 <5A7D771C-FF95-465E-95F6-CD249FE28381@vmware.com>
 <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
In-Reply-To: <CAHk-=wgMuSkumYxeaaxbKFoAbw_gjYo1eRXXSFcBHzNG2xauTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> 
> Btw, the extra bit doesn't really have to be in the page tables. It
> could be a bit in the page itself. We could add another page bit that
> we just clear when we do the "add ref to page as you make a virtual
> copy during fork() etc".

^ I'm playing with the idea if using a page bit to express: "This page
is exclusive". On a CoW fault, if that bit is set, I can simply reuse
the page.

The semantics under which semantics to set the bit are slightly
different than what you describe, and I'm playing with additional
unsharing (on GUP R/O) that avoids mapping the copied page similarly R/O
and simply sets the bit.

But the general idea could fly I think, devil's in the detail ...

-- 
Thanks,

David / dhildenb

