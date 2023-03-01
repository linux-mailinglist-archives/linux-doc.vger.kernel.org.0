Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFB56A68BE
	for <lists+linux-doc@lfdr.de>; Wed,  1 Mar 2023 09:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCAIRv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Mar 2023 03:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjCAIRr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Mar 2023 03:17:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E494939CC9
        for <linux-doc@vger.kernel.org>; Wed,  1 Mar 2023 00:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677658574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qQIo0hNE1IdmdTJeAfVSWSJHdp/A2L81MbqwgQGi7/s=;
        b=G8tgfKqa1YDCNLfOia9uffPGr8BtOSAMB8gRWSNAooQAMe0UhXHQXpCJQB2Udt2sM9RMTo
        pNuNHSQ78isYUfo4QcwvWV4qTar17sJww4bqBK6NopTgNVBTKCPebdPX1x8P8VHy51SalK
        pD4VD0PQhof6vljf8Z1fDnZANhOI6YU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-4Dx-Rw_YP3eNejODp7yzpA-1; Wed, 01 Mar 2023 03:16:10 -0500
X-MC-Unique: 4Dx-Rw_YP3eNejODp7yzpA-1
Received: by mail-wm1-f71.google.com with SMTP id j32-20020a05600c1c2000b003e9bdf02c9fso7997024wms.6
        for <linux-doc@vger.kernel.org>; Wed, 01 Mar 2023 00:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQIo0hNE1IdmdTJeAfVSWSJHdp/A2L81MbqwgQGi7/s=;
        b=vMEs42BFRsNXRFhaXlGNWzZp58i2azlYPx9sN04DEVclbkqsukyntqZhg0jwVFEWGT
         H9JgW6X8cyoUX3RJLodA0NwfNBVoLWi6FalIDoDIApMBrwzZVsRXHZPOBBTRNFLfBlW7
         DCZ7W8UOAtP5fSfJdR5ngCZulNVHvpdATLj+KCksyFWvcGxjZuoblSYG6X2JpUOP9PzD
         U2Skw94fE3pCDi1iPXZ6iJ3PzWLIG0Ad5juqfOON1ZWkdXaxR38gc+69k9oNlYtxx+KU
         nFB7YHc9atkVc6tys4nA7ySAnrFLDFD2/h49jV4sjiaa7PTQ9FPAnn/FUZXB7TQ/b4vs
         WtXw==
X-Gm-Message-State: AO0yUKX9CwtDHDxmUCGDiEHBn/Cw+Neo9qJmTtAxsGPT62vG32vNSsMg
        TTEMJHG4Qsvl88rpXuvKYVRyfPdmRkDRphskMInOkBdgjry70jRXr+YNn9iBjfxC12i/hW5Bq3v
        rfoxmA9aSKRmOkybhzWa9
X-Received: by 2002:adf:fa42:0:b0:2c8:9cfe:9e29 with SMTP id y2-20020adffa42000000b002c89cfe9e29mr3673905wrr.38.1677658569262;
        Wed, 01 Mar 2023 00:16:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/Zcp0KDYd3P+ttMa1nxfZFskB2aS7FMY5A6AFDn91vWMJGTRwO0n5U4FI/yi5+QKrlOm4zVQ==
X-Received: by 2002:adf:fa42:0:b0:2c8:9cfe:9e29 with SMTP id y2-20020adffa42000000b002c89cfe9e29mr3673883wrr.38.1677658568881;
        Wed, 01 Mar 2023 00:16:08 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id m15-20020a5d6a0f000000b002c707785da4sm11739026wru.107.2023.03.01.00.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 00:16:08 -0800 (PST)
Message-ID: <550c6035-6dd0-d215-226b-1a82dafa05d6@redhat.com>
Date:   Wed, 1 Mar 2023 09:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>,
        "kcc@google.com" <kcc@google.com>,
        "eranian@google.com" <eranian@google.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "Andrew.Cooper3@citrix.com" <Andrew.Cooper3@citrix.com>,
        "christina.schimpe@intel.com" <christina.schimpe@intel.com>,
        "debug@rivosinc.com" <debug@rivosinc.com>
Cc:     "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230227222957.24501-1-rick.p.edgecombe@intel.com>
 <20230227222957.24501-14-rick.p.edgecombe@intel.com>
 <1f8b78b6-9f34-b646-68f2-eac62136b9f4@csgroup.eu>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 13/41] mm: Make pte_mkwrite() take a VMA
In-Reply-To: <1f8b78b6-9f34-b646-68f2-eac62136b9f4@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01.03.23 08:03, Christophe Leroy wrote:
> 
> 
> Le 27/02/2023 à 23:29, Rick Edgecombe a écrit :
>> The x86 Control-flow Enforcement Technology (CET) feature includes a new
>> type of memory called shadow stack. This shadow stack memory has some
>> unusual properties, which requires some core mm changes to function
>> properly.
>>
>> One of these unusual properties is that shadow stack memory is writable,
>> but only in limited ways. These limits are applied via a specific PTE
>> bit combination. Nevertheless, the memory is writable, and core mm code
>> will need to apply the writable permissions in the typical paths that
>> call pte_mkwrite().
>>
>> In addition to VM_WRITE, the shadow stack VMA's will have a flag denoting
>> that they are special shadow stack flavor of writable memory. So make
>> pte_mkwrite() take a VMA, so that the x86 implementation of it can know to
>> create regular writable memory or shadow stack memory.
>>
>> Apply the same changes for pmd_mkwrite() and huge_pte_mkwrite().
> 
> I'm not sure it is a good idea to add a second argument to
> pte_mkwrite(). All pte_mkxxxx() only take a pte and nothing else.

We touched on this in previous revisions and so far there was no strong 
push back. This turned out to be cleaner and easier than the 
alternatives we evaluated.

pte_modify(), for example, takes another argument. Sure, we could try 
thinking about passing something else than a VMA to identify the 
writability type, but I am not convinced that will look particularly better.

> 
> I think you should do the same as commit d9ed9faac283 ("mm: add new
> arch_make_huge_pte() method for tile support")
> 

We already have 3 architectures intending to support shadow stacks in 
one way or the other. Replacing all pte_mkwrite() with 
arch_pte_mkwrite() doesn't sound particularly appealing to me.


-- 
Thanks,

David / dhildenb

