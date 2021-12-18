Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99197479C29
	for <lists+linux-doc@lfdr.de>; Sat, 18 Dec 2021 19:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbhLRStT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 18 Dec 2021 13:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21143 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233871AbhLRStT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Dec 2021 13:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639853358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uhRiwrLblv6LrtKBUtcukWvIk/VX3NESiRZY2ifPa0E=;
        b=PuCGx+yr/W+ENVR91wIpfdA/oBVOL0WN2cZaDCGPHoP7nObmu5UipjYHa9KojgD9lpGPiO
        Ufzbwe9gr+yL0myobSv4mfyuusKP00/XQ+ciwRk/eI+P5mIZykPpC2sOJhTTGTkfy1x4Jw
        EqImgqOmxmc9JAleA9AT70YBgntMHmU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-_r6f94ECNpm2wd5205z7vQ-1; Sat, 18 Dec 2021 13:49:16 -0500
X-MC-Unique: _r6f94ECNpm2wd5205z7vQ-1
Received: by mail-wr1-f71.google.com with SMTP id x20-20020adfbb54000000b001a0d044e20fso1694072wrg.11
        for <linux-doc@vger.kernel.org>; Sat, 18 Dec 2021 10:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=uhRiwrLblv6LrtKBUtcukWvIk/VX3NESiRZY2ifPa0E=;
        b=J3SbMN//vYYxN1Tk/DtRdF8/LrBQn+IiBq6x8Oi6/PI7Dr4h6rbCTIWFLgkDLHLBi8
         3nY4PFkE/Adf1mFQ9yTWe9O/v3COeQ6MoXHGkMOIBg//UQcTcBa7cbDASMpaXg66IFe7
         R10+dSraxwGHZTsGszeyYkHAD6KgVAwVs9PES7YYHtuE5d19xvq61ukBrmh0VG5Ie3iL
         878ixqdbT5ep+CpZZQ0bN4a4J8kU/tCvQk6EcMjfYMg+++u/7f1Nv7IHRqVVUZQtv0kp
         NUja1sjzUJn35TnEgAiuENNm3dC2PhKsA8/ECPTjmlh03utn6zopXof2raItQ3LimoiL
         g0hg==
X-Gm-Message-State: AOAM533G1HFe6YmYzZcfhgKwLWF58R0tj9U0dHbnR96XNmOeGmSD9pSW
        w4zpabLek1mRDPB99O14n9X5miHZVkhdDq7q1LHFrimZc6a/dV7KT4y2XjQTLK4HboFVe034chP
        OoLdgKobJp8iqa3EL7QnF
X-Received: by 2002:adf:ec09:: with SMTP id x9mr7147736wrn.111.1639853355586;
        Sat, 18 Dec 2021 10:49:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDFt+1rFxfXccOI3RI6oyMbenaBedcvYZKSfxCuOqeF99P3goaUxXr5SX8S8gOs1yQJRRu9w==
X-Received: by 2002:adf:ec09:: with SMTP id x9mr7147714wrn.111.1639853355380;
        Sat, 18 Dec 2021 10:49:15 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6703.dip0.t-ipconnect.de. [91.12.103.3])
        by smtp.gmail.com with ESMTPSA id s189sm12480345wme.0.2021.12.18.10.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 10:49:14 -0800 (PST)
Message-ID: <6c570757-018f-f6bb-a0fc-2c0d4a845201@redhat.com>
Date:   Sat, 18 Dec 2021 19:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 06/11] mm: support GUP-triggered unsharing via
 FAULT_FLAG_UNSHARE (!hugetlb)
Content-Language: en-US
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nadav Amit <namit@vmware.com>,
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
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211218184233.GB1432915@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18.12.21 19:42, Jason Gunthorpe wrote:
> On Fri, Dec 17, 2021 at 07:38:39PM -0800, Linus Torvalds wrote:
>> On Fri, Dec 17, 2021 at 7:30 PM Nadav Amit <namit@vmware.com> wrote:
>>>
>>> In such a case, I do think it makes sense to fail uffd-wp (when
>>> page_count() > 1), and in a prototype I am working on I do something
>>> like that.
>>
>> Ack. If uddf-wp finds a page that is pinned, just skip it as not
>> write-protectable.
>>
>> Because some of the pinners might be writing to it, of course - just
>> not through the page tables.
> 
> That doesn't address the qemu use case though. The RDMA pin is the
> 'coherent r/o pin' we discussed before, which requires that the pages
> remain un-write-protected and the HW DMA is read only.
> 
> The VFIO pin will enable dirty page tracking in the system IOMMU so it
> gets the same effect from qemu's perspective as the CPU WP is doing.
> 
> In these operations every single page of the guest will be pinned, so
> skip it just means userfault fd wp doesn't work at all.
> 
> Qemu needs some solution to be able to dirty track the CPU memory for
> migration..
> 
>> So that sounds like the right thing to do. I _think_ we discussed this
>> the last time this came up. I have some dim memory of that. Jason,
>> ring a bell?
> 
> We talked about clear_refs alot, but it was never really clear the use
> case, I think. Plus that discussion never finialized to anything.
> 
> David's latest summary seems accurate, if I paraphrase at a high
> level, Linus's approach always does enough COWs but might do extra and
> David's approach tries to do exactly the right number of COWs.
> 
> It looks like to have the same functionality with Linus's approach we
> need to have a way for userspace to opt out of COW and work in an
> entirely deterministic non-COW world. WP&GUP can never work together
> otherwise which leaves qemu stranded.
> 
> Or, we follow David's approach and make COW be precise and accept the
> complexity..

Thanks Jason,

I would really enjoy us discussion how we can eventually make it
*precise* COW model work instead of living with a broken MM subsystem,
as all the reproducers show. IMHO we should stop throwing more band-aids
at it.

Is my approach complete? Sounds like it's not because Linus raised a
good point that the mapcount in the current state might not be stable
for our use case. I'm very happy that he reviewed this series.

I have some ideas to make the "_mapcount" of anonymous pages express
exactly that: how many active (PTE mapped) users do we have and how many
inactive (swap entries, migration entries) do we have. We can certainly
discuss any such approaches, but first there should be the will to try
getting it right ...

-- 
Thanks,

David / dhildenb

