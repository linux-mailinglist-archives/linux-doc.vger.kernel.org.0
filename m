Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41802D3FA4
	for <lists+linux-doc@lfdr.de>; Wed,  9 Dec 2020 11:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729725AbgLIKMe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Dec 2020 05:12:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46690 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729780AbgLIKMO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 05:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607508646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4TGW49VFxxgzg6HHlJEgqhfXkJr229AXz30lVfSS/wA=;
        b=Qh7ycNgT6o6tFmOa9yt2tqhIY8fPWRGar9OWtnMgufVpHyR5QERIg6bAbx1dc0ZAN+YKk3
        xiBqX3NXQBElrRWAdow0slfFZjsuFuW5fyrzQ6wwt0oTp7X1JFeGNZpaXIjv91vMsS8Rrb
        096T0FBBsLVp1Q74wYBLszTnDb4b/EM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-F-PKDTCLPnu8Iu_PevaM0A-1; Wed, 09 Dec 2020 05:10:42 -0500
X-MC-Unique: F-PKDTCLPnu8Iu_PevaM0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C67B8101;
        Wed,  9 Dec 2020 10:10:37 +0000 (UTC)
Received: from [10.36.114.167] (ovpn-114-167.ams2.redhat.com [10.36.114.167])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B53EA6E41C;
        Wed,  9 Dec 2020 10:10:31 +0000 (UTC)
Subject: Re: [External] Re: [PATCH v7 06/15] mm/hugetlb: Disable freeing
 vmemmap if struct page size is not power of two
From:   David Hildenbrand <david@redhat.com>
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
References: <20201130151838.11208-1-songmuchun@bytedance.com>
 <20201130151838.11208-7-songmuchun@bytedance.com>
 <ba57ea7d-709b-bf36-d48a-cc72a26012cc@redhat.com>
 <CAMZfGtV5200NZXH9Z_Z9qXo5FCd9E6JOTXjQtzcF0xGi-gCuPg@mail.gmail.com>
 <4b8a9389-1704-4d8c-ec58-abd753814dd9@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a6d11bc6-033d-3a0b-94ce-cbd556120b6d@redhat.com>
Date:   Wed, 9 Dec 2020 11:10:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4b8a9389-1704-4d8c-ec58-abd753814dd9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09.12.20 11:06, David Hildenbrand wrote:
> On 09.12.20 11:03, Muchun Song wrote:
>> On Wed, Dec 9, 2020 at 5:57 PM David Hildenbrand <david@redhat.com> wrote:
>>>
>>> On 30.11.20 16:18, Muchun Song wrote:
>>>> We only can free the tail vmemmap pages of HugeTLB to the buddy allocator
>>>> when the size of struct page is a power of two.
>>>>
>>>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>>>> ---
>>>>  mm/hugetlb_vmemmap.c | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>>> index 51152e258f39..ad8fc61ea273 100644
>>>> --- a/mm/hugetlb_vmemmap.c
>>>> +++ b/mm/hugetlb_vmemmap.c
>>>> @@ -111,6 +111,11 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
>>>>       unsigned int nr_pages = pages_per_huge_page(h);
>>>>       unsigned int vmemmap_pages;
>>>>
>>>> +     if (!is_power_of_2(sizeof(struct page))) {
>>>> +             pr_info("disable freeing vmemmap pages for %s\n", h->name);
>>>
>>> I'd just drop that pr_info(). Users are able to observe that it's
>>> working (below), so they are able to identify that it's not working as well.
>>
>> The below is just a pr_debug. Do you suggest converting it to pr_info?
> 
> Good question. I wonder if users really have to know in most cases.
> Maybe pr_debug() is good enough in environments where we want to debug
> why stuff is not working as expected.
> 

Oh, another thought, can we glue availability of
HUGETLB_PAGE_FREE_VMEMMAP (or a new define based on the config and the
size of a stuct page) to the size of struct page somehow?

I mean, it's known at compile time that this will never work.

-- 
Thanks,

David / dhildenb

