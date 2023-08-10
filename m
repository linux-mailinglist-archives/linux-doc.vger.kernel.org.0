Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 119CE777713
	for <lists+linux-doc@lfdr.de>; Thu, 10 Aug 2023 13:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235090AbjHJLcx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Aug 2023 07:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235151AbjHJLcx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Aug 2023 07:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034819C
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691667126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oLK9LGDlC20kprqlDXLL2d+DOs1eVcgviEjDmvnvMC4=;
        b=gao6qnNY7zeoArfM78Lsh+sncCFM0WSL3xxCeze+i440kKvOuiSbuDX4KSmTaWfs/6eY7n
        AGoMAVhXwwMEvRg7zugepJ2HaewNdlxv6sEZ7OqaoYOqLPJaW142ly3V8wxQb0HQe+om7r
        Cenh32lYUtXvAEwwBw9xJOuZ5DFEsF0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-fbVGXS3kNpWrGZmNGbO_AA-1; Thu, 10 Aug 2023 07:32:05 -0400
X-MC-Unique: fbVGXS3kNpWrGZmNGbO_AA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fe1d5e2982so4641475e9.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Aug 2023 04:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691667124; x=1692271924;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLK9LGDlC20kprqlDXLL2d+DOs1eVcgviEjDmvnvMC4=;
        b=KTlN5q545Zsiq9dz53YJyF2P5AzqF8UhqwBKTP80vgA04Tr8qcRt5wqiQcvBAXDQHk
         kKBWH2iVuZIZsRgvcfQsRiofJ1IlOfjWqEjBTqQWVOsaugyc6jZUjzGtAdTIfCJbglZO
         fH/4+LVRU3sCercxL5c47EOG89DkfGSBGnlff6lIW07bN/M5nfpDY2kAuWCtPuk5uguw
         18oMgl5Hj4nTrAAM2DS/CQocu2I/JLWy88cj+dNtEBrHszJfvK1YkItAR2+1uOO/CB3K
         IZ9gQ+LKGnlaylXn+2vw+GkvzeyVUolpVwZFTiKQ1zLxO+4btfCYTCNcXBHKTQscb69W
         9n9g==
X-Gm-Message-State: AOJu0Yw1XJlNS1iE/eV1XALisihj42vykcLjBoTP6eTPvBy6w2qK8pim
        wPrLZ82glWhijwjHMEdosEl4VkOWoFEmBEHXsBZBkIpnU2hO81FewYhQp4PSaOJgAVn2kmqJDXv
        BU1B7FFK+mmyguaWtBGhL
X-Received: by 2002:a1c:721a:0:b0:3fb:9474:54cd with SMTP id n26-20020a1c721a000000b003fb947454cdmr1581068wmc.19.1691667123840;
        Thu, 10 Aug 2023 04:32:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHPtXUwWy92l9t+AjlXLiwltHlHkd1BeIuuLATg2YdyzJZlg5cxODixzZtEFV80fVLLXGeWA==
X-Received: by 2002:a1c:721a:0:b0:3fb:9474:54cd with SMTP id n26-20020a1c721a000000b003fb947454cdmr1581050wmc.19.1691667123429;
        Thu, 10 Aug 2023 04:32:03 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id y1-20020a05600c364100b003fbb06af219sm1840009wmq.32.2023.08.10.04.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 04:32:03 -0700 (PDT)
Message-ID: <08f066e9-f137-f96c-df63-d5ccc8138470@redhat.com>
Date:   Thu, 10 Aug 2023 13:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
To:     Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
References: <20230809083256.699513-1-david@redhat.com>
 <181fcc79-b1c6-412f-9ca1-d1f21ef33e32@arm.com>
 <60b5b2a2-1d1d-661c-d61e-855178fff44d@redhat.com>
 <ae63d396-b4a4-4579-bfd2-e99a0350bbf0@redhat.com>
 <d7b22c25-3ddf-d442-e798-deeb096de29a@redhat.com>
Organization: Red Hat
In-Reply-To: <d7b22c25-3ddf-d442-e798-deeb096de29a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10.08.23 13:27, David Hildenbrand wrote:
> On 10.08.23 13:14, David Hildenbrand wrote:
>> On 09.08.23 21:17, David Hildenbrand wrote:
>>> On 09.08.23 21:07, Ryan Roberts wrote:
>>>> On 09/08/2023 09:32, David Hildenbrand wrote:
>>>>> Let's track the total mapcount for all large folios in the first subpage.
>>>>>
>>>>> The total mapcount is what we actually want to know in folio_mapcount()
>>>>> and it is also sufficient for implementing folio_mapped(). This also
>>>>> gets rid of any "raceiness" concerns as expressed in
>>>>> folio_total_mapcount().
>>>>>
>>>>> With sub-PMD THP becoming more important and things looking promising
>>>>> that we will soon get support for such anon THP, we want to avoid looping
>>>>> over all pages of a folio just to calculate the total mapcount. Further,
>>>>> we may soon want to use the total mapcount in other context more
>>>>> frequently, so prepare for reading it efficiently and atomically.
>>>>>
>>>>> Make room for the total mapcount in page[1] of the folio by moving
>>>>> _nr_pages_mapped to page[2] of the folio: it is not applicable to hugetlb
>>>>> -- and with the total mapcount in place probably also not desirable even
>>>>> if PMD-mappable hugetlb pages could get PTE-mapped at some point -- so we
>>>>> can overlay the hugetlb fields.
>>>>>
>>>>> Note that we currently don't expect any order-1 compound pages / THP in
>>>>> rmap code, and that such support is not planned. If ever desired, we could
>>>>> move the compound mapcount to another page, because it only applies to
>>>>> PMD-mappable folios that are definitely larger. Let's avoid consuming
>>>>> more space elsewhere for now -- we might need more space for a different
>>>>> purpose in some subpages soon.
>>>>>
>>>>> Maintain the total mapcount also for hugetlb pages. Use the total mapcount
>>>>> to implement folio_mapcount(), total_mapcount(), folio_mapped() and
>>>>> page_mapped().
>>>>>
>>>>> We can now get rid of folio_total_mapcount() and
>>>>> folio_large_is_mapped(), by just inlining reading of the total mapcount.
>>>>>
>>>>> _nr_pages_mapped is now only used in rmap code, so not accidentially
>>>>> externally where it might be used on arbitrary order-1 pages. The remaining
>>>>> usage is:
>>>>>
>>>>> (1) Detect how to adjust stats: NR_ANON_MAPPED and NR_FILE_MAPPED
>>>>>      -> If we would account the total folio as mapped when mapping a
>>>>>         page (based on the total mapcount), we could remove that usage.
>>>>>
>>>>> (2) Detect when to add a folio to the deferred split queue
>>>>>      -> If we would apply a different heuristic, or scan using the rmap on
>>>>>         the memory reclaim path for partially mapped anon folios to
>>>>>         split them, we could remove that usage as well.
>>>>>
>>>>> So maybe, we can simplify things in the future and remove
>>>>> _nr_pages_mapped. For now, leave these things as they are, they need more
>>>>> thought. Hugh really did a nice job implementing that precise tracking
>>>>> after all.
>>>>>
>>>>> Note: Not adding order-1 sanity checks to the file_rmap functions for
>>>>>           now. For anon pages, they are certainly not required right now.
>>>>>
>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>>>> Cc: Mike Kravetz <mike.kravetz@oracle.com>
>>>>> Cc: Hugh Dickins <hughd@google.com>
>>>>> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Yin Fengwei <fengwei.yin@intel.com>
>>>>> Cc: Yang Shi <shy828301@gmail.com>
>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>
>>>> Other than the nits and query on zeroing _total_mapcount below, LGTM. If zeroing
>>>> is correct:
>>>>
>>>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>>
>>> Thanks for the review!
>>>
>>> [...]
>>>
>>>>>      
>>>>>      static inline int total_mapcount(struct page *page)
>>>>
>>>> nit: couldn't total_mapcount() just be implemented as a wrapper around
>>>> folio_mapcount()? What's the benefit of PageCompound() check instead of just
>>>> getting the folio and checking if it's large? i.e:
>>>
>>> Good point, let me take a look tomorrow if the compiler can optimize in
>>> both cases equally well.
>>
>> I checked by adjusting total_mapcount():
>>
>> Before:
>>
>>            if (PageTransHuge(page) && total_mapcount(page) > 1)
>> ffffffff81411931:       4c 89 e7                mov    %r12,%rdi
>> ffffffff81411934:       e8 f7 b1 ff ff          call   ffffffff8140cb30 <PageTransHuge>
>> ffffffff81411939:       85 c0                   test   %eax,%eax
>> ffffffff8141193b:       74 29                   je     ffffffff81411966 <migrate_misplaced_page+0x166>
>> ffffffff8141193d:       49 8b 04 24             mov    (%r12),%rax
>>            return test_bit(PG_head, &page->flags) ||
>> ffffffff81411941:       a9 00 00 01 00          test   $0x10000,%eax
>> ffffffff81411946:       0f 85 1f 01 00 00       jne    ffffffff81411a6b <migrate_misplaced_page+0x26b>
>>                   READ_ONCE(page->compound_head) & 1;
>> ffffffff8141194c:       49 8b 44 24 08          mov    0x8(%r12),%rax
>>            return test_bit(PG_head, &page->flags) ||
>> ffffffff81411951:       a8 01                   test   $0x1,%al
>> ffffffff81411953:       0f 85 12 01 00 00       jne    ffffffff81411a6b <migrate_misplaced_page+0x26b>
>> ffffffff81411959:       41 8b 44 24 30          mov    0x30(%r12),%eax
>>                    return atomic_read(&page->_mapcount) + 1;
>> ffffffff8141195e:       83 c0 01                add    $0x1,%eax
>> ffffffff81411961:       83 f8 01                cmp    $0x1,%eax
>> ffffffff81411964:       7f 77                   jg     ffffffff814119dd <migrate_misplaced_page+0x1dd>
>>
>> So a total of 10 instructions after handling the mov/call/test/je for PageTransHuge().
>>
>> After:
>>
>>            if (PageTransHuge(page) && total_mapcount(page) > 1)
>> ffffffff81411931:       4c 89 e7                mov    %r12,%rdi
>> ffffffff81411934:       e8 f7 b1 ff ff          call   ffffffff8140cb30 <PageTransHuge>
>> ffffffff81411939:       85 c0                   test   %eax,%eax
>> ffffffff8141193b:       74 2f                   je     ffffffff8141196c <migrate_misplaced_page+0x16c>
>>            unsigned long head = READ_ONCE(page->compound_head);
>> ffffffff8141193d:       49 8b 44 24 08          mov    0x8(%r12),%rax
>>            if (unlikely(head & 1))
>> ffffffff81411942:       a8 01                   test   $0x1,%al
>> ffffffff81411944:       0f 85 fc 05 00 00       jne    ffffffff81411f46 <migrate_misplaced_page+0x746>
>> ffffffff8141194a:       0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
>>                    return page;
>> ffffffff8141194f:       4c 89 e0                mov    %r12,%rax
>> ffffffff81411952:       48 8b 10                mov    (%rax),%rdx
>>            if (likely(!folio_test_large(folio)))
>> ffffffff81411955:       f7 c2 00 00 01 00       test   $0x10000,%edx
>> ffffffff8141195b:       0f 85 da 05 00 00       jne    ffffffff81411f3b <migrate_misplaced_page+0x73b>
>> ffffffff81411961:       8b 40 30                mov    0x30(%rax),%eax
>>                    return atomic_read(&folio->_mapcount) + 1;
>> ffffffff81411964:       83 c0 01                add    $0x1,%eax
>> ffffffff81411967:       83 f8 01                cmp    $0x1,%eax
>> ffffffff8141196a:       7f 77                   jg     ffffffff814119e3 <migrate_misplaced_page+0x1e3>
>>
>> So a total of 11 (+ 1 NOP) instructions after handling the mov/call/test/je for PageTransHuge().
>>
>> Essentially one more MOV instruction.
>>
>> I guess nobody really cares :)
>>
> 
> Also, let's simply do:
> 
> static inline bool folio_mapped(struct folio *folio)
> {
> 	folio_mapcount(folio) > 1;

 > 0, obviously :)

-- 
Cheers,

David / dhildenb

