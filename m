Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7AC54F513
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jun 2022 12:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381710AbiFQKOM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Jun 2022 06:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381709AbiFQKOK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jun 2022 06:14:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 58CFC69716
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655460846;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OO/vzqKXxtmhmREmRXYJJgBI7tFlamAdTQoTX2eqNDk=;
        b=GWPkoTSQW1cXR9tZjTTR2CIbJDiJY9iP0Be6aehgk8Dcz3haU9L0VHiIWAkcsbfZ7QdRr4
        viTxSs8QrmtoKLCMCDjfV1FDF/Xuwvrgkd5SwjyDNSYewZMVIAR4G8vPiFandWXwtG/Ql5
        pw7syzFMxdpdfyTlkruULcHqa5kZeW8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-RqKw9P81NvmNiZyIZwGTjA-1; Fri, 17 Jun 2022 06:14:05 -0400
X-MC-Unique: RqKw9P81NvmNiZyIZwGTjA-1
Received: by mail-wm1-f70.google.com with SMTP id v125-20020a1cac83000000b0039c832fbd02so2518280wme.4
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 03:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=OO/vzqKXxtmhmREmRXYJJgBI7tFlamAdTQoTX2eqNDk=;
        b=14JVHeLmATTX/vnRE9CGCWkPif6otQnnZvg0+q4lCQVIrkEsUiyQyuYwPI49PBkb1i
         d8R2wptS52RniD+ZIjVZ7y8iS/GlR0nuOKPv8fwzqN7PN2SMOHcb+sX48UsksaLA0Gbe
         /FoIXUXlHdmYbsAo+YLg68EIxHzrYwnr4D9JS2YcW3zhY6io+YFgW8wkp+Udzu1zo86k
         PnH2gTioZBI5TRT+3NxJlXttlIYTE8g7KW37GWGSPsSFi6E6scdFtAVAcBIYQE4HDlIH
         UfQ3jfjHFz8gX6c6tCeSiakgUs24CSzDAj5sZWa060LFXSWxdYfbgPcK5H3oqKjUlltX
         cjYQ==
X-Gm-Message-State: AOAM533i5LV4TP0brWnvtL9KQuVWY4Mwpk9k7oVnz+W/gOSejYvi7H1g
        icCJvKzjlYY03+vGSHR/VA6W6iWF+PTqRTWlr8rsuEwUgBcR8Pf69Lrxa5HZ2g9ZEqFbuHG5wJz
        xZ2eng6OG4YYlswEuwGf7
X-Received: by 2002:a05:600c:4f47:b0:39c:62cc:75da with SMTP id m7-20020a05600c4f4700b0039c62cc75damr20098279wmq.114.1655460843750;
        Fri, 17 Jun 2022 03:14:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAqCbokM4EypDJ6RFBar89VSpzcIn9BxE48MuTqUwN0XUnXRQ8aU829NJZHCJkS0ZFmCCu7w==
X-Received: by 2002:a05:600c:4f47:b0:39c:62cc:75da with SMTP id m7-20020a05600c4f4700b0039c62cc75damr20098249wmq.114.1655460843470;
        Fri, 17 Jun 2022 03:14:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:7e00:bb5b:b526:5b76:5824? (p200300cbc70a7e00bb5bb5265b765824.dip0.t-ipconnect.de. [2003:cb:c70a:7e00:bb5b:b526:5b76:5824])
        by smtp.gmail.com with ESMTPSA id q17-20020a056000137100b002183ee5c0c5sm4276786wrz.50.2022.06.17.03.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:14:02 -0700 (PDT)
Message-ID: <a2f5cb7e-0aaa-cb3c-5437-3aba9ae015d1@redhat.com>
Date:   Fri, 17 Jun 2022 12:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Muchun Song <songmuchun@bytedance.com>, corbet@lwn.net,
        akpm@linux-foundation.org, paulmck@kernel.org,
        mike.kravetz@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
References: <20220520025538.21144-1-songmuchun@bytedance.com>
 <20220520025538.21144-3-songmuchun@bytedance.com>
 <53024884-0182-df5f-9ca2-00652c64ce36@redhat.com>
 <YqqqPjkh9r8ZrH0r@localhost.localdomain>
 <24d5ec20-9c9e-93aa-11f4-c4619f51f7d1@redhat.com>
 <YqwVTT+50vt5WpeG@localhost.localdomain>
 <186924ab-651f-71a1-93d2-3500a67dffee@redhat.com>
 <YqxPTUuqdDpoU9o3@localhost.localdomain>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 2/2] mm: memory_hotplug: introduce
 SECTION_CANNOT_OPTIMIZE_VMEMMAP
In-Reply-To: <YqxPTUuqdDpoU9o3@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.06.22 11:54, Oscar Salvador wrote:
> On Fri, Jun 17, 2022 at 09:43:33AM +0200, David Hildenbrand wrote:
>> VmemmapSelfHosted, then the function names get nicer.
> 
> Definitely.
> 
>>
>>> +#endif
>>> +
>>>  /*
>>>   * On an anonymous page mapped into a user virtual memory area,
>>>   * page->mapping points to its anon_vma, not to a struct address_space;
>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>> index 1089ea8a9c98..e2de7ed27e9e 100644
>>> --- a/mm/hugetlb_vmemmap.c
>>> +++ b/mm/hugetlb_vmemmap.c
>>> @@ -101,6 +101,14 @@ void hugetlb_vmemmap_free(struct hstate *h, struct page *head)
>>>  {
>>>  	unsigned long vmemmap_addr = (unsigned long)head;
>>>  	unsigned long vmemmap_end, vmemmap_reuse, vmemmap_pages;
>>> +	struct mem_section *ms = __pfn_to_section(page_to_pfn(head));
>>> +	struct page *memmap;
>>> +
>>> +	memmap = sparse_decode_mem_map(ms->section_mem_map,
>>> +				       pfn_to_section_nr(page_to_pfn(head)));
>>
>> Why can't we check the head page directly? Either I need more coffee or
>> this can be simplified.
> 
> Uhm, maybe I'm the one who needs coffe here but we have something like:
> 
> [    hot-plugges section   ]
> [memmap pages][normal pages]

Oh, right, we need the memmap for our hugetlb page (which resides in the
reserved section), but these are not marked. We need the memmap of that
memmap.

I assume one could directly via the page address. Because we want the
memmap of the memmap.

vmmemmap_page = virt_to_page(head);

Not sure, though, if that would work with that function.

-- 
Thanks,

David / dhildenb

