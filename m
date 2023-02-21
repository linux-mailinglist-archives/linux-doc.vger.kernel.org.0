Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D2769DBF1
	for <lists+linux-doc@lfdr.de>; Tue, 21 Feb 2023 09:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbjBUIcD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Feb 2023 03:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbjBUIcC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Feb 2023 03:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A9F23852
        for <linux-doc@vger.kernel.org>; Tue, 21 Feb 2023 00:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676968275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kCboO0D4l0fCcmSpxKOmwRfVm5IgZzSNbPLhAcKwBhQ=;
        b=YJzcZx/BYTWMyJ7vp9Ob1cUCbqQiZE6gYxhE8I/ebO0OZxILgEy3wLFuxb3CFf9+RMsdc+
        kCDMPaSpl6zGwnwJvqJ/2u4qpf5tRlS/eBcm7qQ8JTMr38Z9T6BFfaRXGREcAGQaPejLGv
        IyI+SLgOfWZryCjkHePs085IgCdSGUE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-91418ydKPyOYGVVNEApPFg-1; Tue, 21 Feb 2023 03:31:14 -0500
X-MC-Unique: 91418ydKPyOYGVVNEApPFg-1
Received: by mail-wm1-f70.google.com with SMTP id k26-20020a05600c0b5a00b003dfe4bae099so1588457wmr.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Feb 2023 00:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCboO0D4l0fCcmSpxKOmwRfVm5IgZzSNbPLhAcKwBhQ=;
        b=WUTSi7Vce6sI3YfAi+RZibbYNZxTfai/RLR/asmXXC8YEUqSGO1C4ZakUoYNIGHTtU
         kZsaloSMKV1aCBjib4FfsSOP1f2XzQQ55WeaWkq9OaL0XsF3KdVuFjM2O2MIOSyb54qo
         c5qGpq9+Xc5uFdKTpQLu1ObD6kDaaItFUD6V3rVsbt3OmtIUCoOYHnW+/y6/qWHKX352
         Vb51DpXpbvCmJO44FuAXzy7mMe+lGI/WPpzUZplnabPoyFi5/EkZJgZrfByH+nblBEGU
         dBPJ0x1GWvxfG4ehSGeH/3cjDke5uWNAdlYKOq2iAOkpoyA75AptRdPYat/oQoKkIE47
         PQFQ==
X-Gm-Message-State: AO0yUKUXRe8WTwxglSRcZebZhjQ66z0f8626TuB99YZ4xeXI/39cZ3ps
        NWD5PU2onsswWKlDG0uigZMW6O+QmYBLSbVcwA1z/vH/WfHFDVLbC0Hgk+JKXH9sn5Y6S3sjtN/
        gy2d7j8b81QgBZZrDrtGA
X-Received: by 2002:a05:600c:1f06:b0:3dc:3b29:7a4 with SMTP id bd6-20020a05600c1f0600b003dc3b2907a4mr3260178wmb.0.1676968273152;
        Tue, 21 Feb 2023 00:31:13 -0800 (PST)
X-Google-Smtp-Source: AK7set+0r8eJK1vTBbYZl8FFEvRCCuV3a2A3iN25xytv7tuI4shMZpsPvaSTp+HX4M0GCokqILTrPQ==
X-Received: by 2002:a05:600c:1f06:b0:3dc:3b29:7a4 with SMTP id bd6-20020a05600c1f0600b003dc3b2907a4mr3260139wmb.0.1676968272718;
        Tue, 21 Feb 2023 00:31:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:4800:aecc:dadb:40a8:ce81? (p200300cbc7074800aeccdadb40a8ce81.dip0.t-ipconnect.de. [2003:cb:c707:4800:aecc:dadb:40a8:ce81])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c229a00b003dc49e0132asm3583198wmf.1.2023.02.21.00.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 00:31:12 -0800 (PST)
Message-ID: <c2db1af6-972c-2aef-2732-d37c41c310a1@redhat.com>
Date:   Tue, 21 Feb 2023 09:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 22/41] mm/mmap: Add shadow stack pages to memory
 accounting
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
 <20230218211433.26859-23-rick.p.edgecombe@intel.com>
 <6ccc8d30-336a-12af-1179-5dc4eca3048d@redhat.com>
 <8bd58778e062bb9526c905c5573a2ee20cb41eef.camel@intel.com>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <8bd58778e062bb9526c905c5573a2ee20cb41eef.camel@intel.com>
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

On 20.02.23 23:44, Edgecombe, Rick P wrote:
> On Mon, 2023-02-20 at 13:58 +0100, David Hildenbrand wrote:
>> On 18.02.23 22:14, Rick Edgecombe wrote:
>>> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
>>>
>>> The x86 Control-flow Enforcement Technology (CET) feature includes
>>> a new
>>> type of memory called shadow stack. This shadow stack memory has
>>> some
>>> unusual properties, which requires some core mm changes to function
>>> properly.
>>>
>>> Account shadow stack pages to stack memory.
>>>
>>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
>>> Tested-by: John Allen <john.allen@amd.com>
>>> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
>>> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>>> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>>> Cc: Kees Cook <keescook@chromium.org>
>>>
>>> ---
>>> v3:
>>>     - Remove unneeded VM_SHADOW_STACK check in accountable_mapping()
>>>       (Kirill)
>>>
>>> v2:
>>>     - Remove is_shadow_stack_mapping() and just change it to
>>> directly bitwise
>>>       and VM_SHADOW_STACK.
>>>
>>> Yu-cheng v26:
>>>     - Remove redundant #ifdef CONFIG_MMU.
>>>
>>> Yu-cheng v25:
>>>     - Remove #ifdef CONFIG_ARCH_HAS_SHADOW_STACK for
>>> is_shadow_stack_mapping().
>>> ---
>>>     mm/mmap.c | 2 ++
>>>     1 file changed, 2 insertions(+)
>>>
>>> diff --git a/mm/mmap.c b/mm/mmap.c
>>> index 425a9349e610..9f85596cce31 100644
>>> --- a/mm/mmap.c
>>> +++ b/mm/mmap.c
>>> @@ -3290,6 +3290,8 @@ void vm_stat_account(struct mm_struct *mm,
>>> vm_flags_t flags, long npages)
>>>                 mm->exec_vm += npages;
>>>         else if (is_stack_mapping(flags))
>>>                 mm->stack_vm += npages;
>>> +     else if (flags & VM_SHADOW_STACK)
>>> +             mm->stack_vm += npages;
>>
>> Why not modify is_stack_mapping() ?
> 
> It kind of sticks out a little in this conditional, but
> is_stack_mapping() has this comment:
> /*
>   * Stack area - automatically grows in one direction
>   *
>   * VM_GROWSUP / VM_GROWSDOWN VMAs are always private anonymous:
>   * do_mmap() forbids all other combinations.
>   */
> 
> Shadow stack don't grow, so it doesn't quite fit. There used to be an
> is_shadow_stack_mapping(), but it was removed because all that was
> needed (for the time being) was the simple bitwise AND:
> 
> https://lore.kernel.org/lkml/804adbac-61e6-0fd2-f726-5735fb290199@intel.com/

As there is only a single user of is_stack_mapping(), I'd simply have 
adjusted the doc of is_stack_mapping() to include shadow stacks.

-- 
Thanks,

David / dhildenb

