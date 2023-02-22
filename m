Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E19269FA2A
	for <lists+linux-doc@lfdr.de>; Wed, 22 Feb 2023 18:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbjBVR2d (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Feb 2023 12:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbjBVR2b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Feb 2023 12:28:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD7CD522
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 09:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677086861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SzSur+FSaYUJcIGyahlfWtEgRpcKvg8gms7yhet56SU=;
        b=Wgm7JyRqDs5f1EStE2oFY5wJdMM4WJrD9nTBsCGHgAgt2VngnRY3rvEyL/esSiocFMpqiW
        k+tydI6PUL5zatREzFX5ICxnJskGOlqz+Sw+4prVOlLb3vDAmeSfVKJ9X9nc7v/d10+1qK
        Y84EPS5vjMzu3hiJCoFNSLtdCoEKa3g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-OVXhD2w7Ngac5z1hI4nb7Q-1; Wed, 22 Feb 2023 12:27:40 -0500
X-MC-Unique: OVXhD2w7Ngac5z1hI4nb7Q-1
Received: by mail-wm1-f69.google.com with SMTP id m28-20020a05600c3b1c00b003e7d4662b83so2512244wms.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Feb 2023 09:27:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzSur+FSaYUJcIGyahlfWtEgRpcKvg8gms7yhet56SU=;
        b=JTr4ofga2uzWx3aCY7L3d/bFI1PG/68oH/DVsphgaJoBtcmec0tkpDCNJur4buo7WA
         UJ2l7aex/wkiu64wwvugQe6ap3bxuTsP0DwKcrKS2PrywEXGQxumNp15OrasRDX7vwGE
         eymVbgk7CGFAFNJ/q80xCjiBXEK3f4ODyzGGQBoHW0e6i9z1QXW9g4lCQ2XgJcFRfJo+
         C3qfmPGFBilrffFTyYXF5UJxZM8eEYJx1qqWRZGL1NSMSeF+H3goJRam0l/mF4DuJHc3
         bO+IHIyjXsE529qnT3gpOZ9NpE/hwy8X2UuCZwKTEPZHHwFhX2HnQSzn4Pp0JKfPRgtl
         I6eg==
X-Gm-Message-State: AO0yUKXqUijKE6KsNzJfq2qvZXXGl+tzW/E7t11+UbK6z8XWSjjtso47
        llqoILWzL48PnKHHQRDtz9Kzv34ejZ9Ws+Mypitc074pnVSphif2FZODer5zx2BvtXJlHSLOGUG
        9EPWZSGW3SPNdmZVYRoHp
X-Received: by 2002:a05:600c:2b0f:b0:3dc:4633:9844 with SMTP id y15-20020a05600c2b0f00b003dc46339844mr6416520wme.17.1677086858677;
        Wed, 22 Feb 2023 09:27:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+2ColwpBX2YIJ7Q58//QCtiLzANp/eE+ZgjuRgvuBMvs+hGqRsuXh8po64HNr5TiB7HD48GA==
X-Received: by 2002:a05:600c:2b0f:b0:3dc:4633:9844 with SMTP id y15-20020a05600c2b0f00b003dc46339844mr6416496wme.17.1677086858276;
        Wed, 22 Feb 2023 09:27:38 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:a100:95ad:6325:131:6b1d? (p200300cbc704a10095ad632501316b1d.dip0.t-ipconnect.de. [2003:cb:c704:a100:95ad:6325:131:6b1d])
        by smtp.gmail.com with ESMTPSA id ay14-20020a05600c1e0e00b003e20cf0408esm9612340wmb.40.2023.02.22.09.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 09:27:37 -0800 (PST)
Message-ID: <62b48389-0e61-17da-6a72-d4a16e003352@redhat.com>
Date:   Wed, 22 Feb 2023 18:27:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 14/41] x86/mm: Introduce _PAGE_SAVED_DIRTY
Content-Language: en-US
To:     Dave Hansen <dave.hansen@intel.com>,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
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
 <20230218211433.26859-15-rick.p.edgecombe@intel.com>
 <70681787-0d33-a9ed-7f2a-747be1490932@redhat.com>
 <6f19d7c7ad9f61fa8f6c9bd09d24524dbe17463f.camel@intel.com>
 <6e1201f5-da25-6040-8230-c84856221838@redhat.com>
 <273414f5-2a7c-3cc0-dc27-d07baaa5787b@intel.com>
 <52f001ef-a409-4f33-f28f-02e806ef305a@redhat.com>
 <74b91f3e-17f7-6d89-a7d1-7373101bf8b7@intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <74b91f3e-17f7-6d89-a7d1-7373101bf8b7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22.02.23 18:23, Dave Hansen wrote:
> On 2/22/23 01:05, David Hildenbrand wrote:
>> This series wasn't in -next and we're in the merge window. Is the plan
>> to still include it into this merge window?
> 
> No way.  It's 6.4 material at the earliest.
> 
> I'm just saying to Rick not to worry _too_ much about earlier feedback
> from me if folks have more recent review feedback.

Great. So I hope we can get this into -next soon and that we'll only get 
non-earth-shattering feedback so this can land in 6.4.

-- 
Thanks,

David / dhildenb

