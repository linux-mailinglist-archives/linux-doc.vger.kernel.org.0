Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 246956A090D
	for <lists+linux-doc@lfdr.de>; Thu, 23 Feb 2023 13:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbjBWM4l (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Feb 2023 07:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbjBWM4k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Feb 2023 07:56:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F89199EE
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 04:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677156952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PT6kgDTp7/GY4ysTzhnQOlEbU8Ib9XDdtbwXVzEvIDI=;
        b=OyZwUgfiTSQb0oXyy4q+khFNd1z0Q2i1Zaa/fy/c4JFYJIbrhpLMdaistzrRWMAHSlgSm2
        sxXdDkeA3bbdjwRR4GRS+u5ForDEzZYridcXGWyOeON7srpF3WBR7UmYbNnyVpq3HAfoeL
        ZHLQa0KRmYVMUS3oN1PVXWNQX7SEfWQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-J5K4w4GIOJi3P_0EWbGUSQ-1; Thu, 23 Feb 2023 07:55:51 -0500
X-MC-Unique: J5K4w4GIOJi3P_0EWbGUSQ-1
Received: by mail-wm1-f69.google.com with SMTP id l20-20020a05600c1d1400b003e10d3e1c23so5064888wms.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 04:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT6kgDTp7/GY4ysTzhnQOlEbU8Ib9XDdtbwXVzEvIDI=;
        b=haHXrTtiHX4UdlkpGNVyvdswwdhshARKsqOBYPYnArdfQs5cYyAgT/anZ3KTMUObgP
         Vzc6qJlApx8n83VY6TCNGnad3bR/6oICqdbAptKWFHe/uD0mzjvR484mfAP7xBzp6MX2
         6bDWm3Qyy7amqRV9528jZUntKvLcRlCKfDoYzN9gavvQ/6RIrxG08fmgms1+Xz+YJHHH
         b0vjwR1pxSgw7fXjACQUYLHSTNcmo+18Z4Bl6K0YEk0PutE6Q7WsnE6a5zXlCiBSkyio
         HBsSwW2+scBC4uOT1YRqo5gc5xsJZhGNUcpNGIHm27y8eLCcc+IUeeSsXC4j9QLi0mGJ
         QA9w==
X-Gm-Message-State: AO0yUKUoLtaStRy4Zg0FifQ3iJ/kvJEv6Zey8lo8yO5+tQIh/vGyPxnN
        BakHkXgRKXI38KbLts69W5HtoZxkGW19rQ12Ml2ppCfSG0UHl0cCav9dakwsqRkUmHq1L1Zvf2r
        bnKJTdW0hvuM+aY7pmb/B
X-Received: by 2002:a05:600c:13d4:b0:3ea:dbdd:66e1 with SMTP id e20-20020a05600c13d400b003eadbdd66e1mr129158wmg.28.1677156950088;
        Thu, 23 Feb 2023 04:55:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+z4Zckn4kGh4RDzbT5i3WSb5X8+Y/ga4x3DBVsKlX44yNblYKhzFO6jE19EiwrBNHiOOrHYg==
X-Received: by 2002:a05:600c:13d4:b0:3ea:dbdd:66e1 with SMTP id e20-20020a05600c13d400b003eadbdd66e1mr129131wmg.28.1677156949645;
        Thu, 23 Feb 2023 04:55:49 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c4f4300b003df5be8987esm4390794wmq.20.2023.02.23.04.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 04:55:49 -0800 (PST)
Message-ID: <2905adaa-97f8-912d-5d23-bee92eb4483e@redhat.com>
Date:   Thu, 23 Feb 2023 13:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "Eranian, Stephane" <eranian@google.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "fweimer@redhat.com" <fweimer@redhat.com>,
        "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
        "jannh@google.com" <jannh@google.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "kcc@google.com" <kcc@google.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "oleg@redhat.com" <oleg@redhat.com>,
        "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "Schimpe, Christina" <christina.schimpe@intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        "debug@rivosinc.com" <debug@rivosinc.com>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        "gorcunov@gmail.com" <gorcunov@gmail.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc:     "Yu, Yu-cheng" <yu-cheng.yu@intel.com>
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-20-rick.p.edgecombe@intel.com>
 <458b3d39-ddce-c0f2-fe80-4e0cc5b101bd@redhat.com>
 <c67f511516d2f28385bbe079b7d7d40f136adb27.camel@intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v6 19/41] x86/mm: Check shadow stack page fault errors
In-Reply-To: <c67f511516d2f28385bbe079b7d7d40f136adb27.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23.02.23 00:07, Edgecombe, Rick P wrote:
> On Mon, 2023-02-20 at 13:57 +0100, David Hildenbrand wrote:
>>>     
>>> +     /*
>>> +      * When a page becomes COW it changes from a shadow stack
>>> permission
>>> +      * page (Write=0,Dirty=1) to (Write=0,Dirty=0,SavedDirty=1),
>>> which is simply
>>> +      * read-only to the CPU. When shadow stack is enabled, a RET
>>> would
>>> +      * normally pop the shadow stack by reading it with a "shadow
>>> stack
>>> +      * read" access. However, in the COW case the shadow stack
>>> memory does
>>> +      * not have shadow stack permissions, it is read-only. So it
>>> will
>>> +      * generate a fault.
>>> +      *
>>> +      * For conventionally writable pages, a read can be serviced
>>> with a
>>> +      * read only PTE, and COW would not have to happen. But for
>>> shadow
>>> +      * stack, there isn't the concept of read-only shadow stack
>>> memory.
>>> +      * If it is shadow stack permission, it can be modified via
>>> CALL and
>>> +      * RET instructions. So COW needs to happen before any memory
>>> can be
>>> +      * mapped with shadow stack permissions.
>>> +      *
>>> +      * Shadow stack accesses (read or write) need to be serviced
>>> with
>>> +      * shadow stack permission memory, so in the case of a shadow
>>> stack
>>> +      * read access, treat it as a WRITE fault so both COW will
>>> happen and
>>> +      * the write fault path will tickle maybe_mkwrite() and map
>>> the memory
>>> +      * shadow stack.
>>> +      */
>>
>> Again, I suggest dropping all details about COW from this comment
>> and
>> from the patch description. It's just one such case that can happen.
> 
> Hi David,

Hi Rick,

> 
> I was just trying to edit this one to drop COW details, but I think in
> this case, one of the major reasons for the code *is* actually COW. We
> are not working around the whole inadvertent shadow stack memory piece
> here, but something else: Making sure shadow stack memory is faulted in
> and doing COW if required to make this possible. I came up with this,
> does it seem better?

Regarding the fault handling I completely agree. We have to treat a read 
like a write event. And as read-only shadow stack PTEs don't exist, we 
have to tell the MM to create a writable one for us.

> 
> 
> /*
>   * For conventionally writable pages, a read can be serviced with a
>   *
> read only PTE. But for shadow stack, there isn't a concept of
>   * read-
> only shadow stack memory. If it a PTE has the shadow stack
>   *
> permission, it can be modified via CALL and RET instructions. So
>   * core
> MM needs to fault in a writable PTE and do things it already
>   * does for
> write faults.
>   *
>   * Shadow stack accesses (read or write) need to be
> serviced with
>   * shadow stack permission memory, so in the case of a
> shadow stack
>   * read access, treat it as a WRITE fault so both any
> required COW will
>   * happen and the write fault path will tickle
> maybe_mkwrite() and map
>   * the memory shadow stack.
>   */

That sounds good! I'd rewrite the last part slightly.

"
Shadow stack accesses (read or write) need to be serviced with
shadow stack permission memory, which always include write permissions. 
So in the case of a shadow stack read access, treat it as a WRITE fault. 
This will make sure that MM will prepare everything (e.g., break COW) 
such that maybe_mkwrite() can create a proper shadow stack PTE.
"

-- 
Thanks,

David / dhildenb

