Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81448699044
	for <lists+linux-doc@lfdr.de>; Thu, 16 Feb 2023 10:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjBPJnL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Feb 2023 04:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBPJmr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 04:42:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA874DBF9
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 01:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676540480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gmwi3nEDJwaAff3Fc8Gdw19GfxhLDRlC4Hp/kbYrQqc=;
        b=QUm924d1eQ4/YeSGNU+9zftH1vyBIPQ3uswRg69oerBJHX2NQCCPiVlHOfWfktArNep4JC
        0IkDs6vNmWi5TeWt0o4YQsXQDJbBg/wwQJ8kw+ka8d3rmi39nhEH7DyaOkfT5TorvXMV3W
        BSsz6vzYEBygMTXdI5RX8BpQOwGD6gw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-1vLF6NTBNZie6s1MyQ3ylw-1; Thu, 16 Feb 2023 04:41:19 -0500
X-MC-Unique: 1vLF6NTBNZie6s1MyQ3ylw-1
Received: by mail-wm1-f70.google.com with SMTP id n7-20020a05600c500700b003e2165f33cbso97204wmr.5
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 01:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gmwi3nEDJwaAff3Fc8Gdw19GfxhLDRlC4Hp/kbYrQqc=;
        b=Uvj5WN2+F9ebg45TVwYaDGgnMHccvYTeskDIwVoOtyOXoa/gkpT8WHIhQUuVTNDNoM
         yKSLJb1Q8/NmpJ2YhyTnI1Des0YY6D1SlV8j4xlxaCVMMmr8vXGUi46o7H+/qij4J6MU
         LPLiYK+EujA29+s+noQ8gRlu9VXpbXCAibXPx/60bpgjf7T9YdtuDK2IA6/WgzpV/aXs
         NgMZIuybamMRyr/RBnB/KbbJB5EwGDgM8Zwxi+X5b11rRZzj1HZlZbKQaJ6FPyiH8uFi
         ou1QavV5YsQcBDXHILVs07aUlszq8NyQ6rmLK3FW3VSwLPBOITt+oZbWTtA5btYpH1Qf
         3q3w==
X-Gm-Message-State: AO0yUKXfm8DZHu23mjE3AdABNe4MnD2OhKyb/Y2+Rsrei0GUZ90L9kS/
        D4s4Glmi3Dm0J61tSND9Mw80SKMPgHfaLjBpmVGfAs+Vq8Q1j00MWAh1Ff7B0iz5LNV+1CQ6jlg
        LJhTDLsIC7+W7eln9n74r
X-Received: by 2002:a05:600c:43d2:b0:3e1:f8af:7942 with SMTP id f18-20020a05600c43d200b003e1f8af7942mr4417119wmn.22.1676540477732;
        Thu, 16 Feb 2023 01:41:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/oggqqqV4UfbebLA50a7kFC2t5aIQUzgDU4Y/+rLroQMqzr7b1jBFCFplQuftcMkUVk4L02g==
X-Received: by 2002:a05:600c:43d2:b0:3e1:f8af:7942 with SMTP id f18-20020a05600c43d200b003e1f8af7942mr4417078wmn.22.1676540477379;
        Thu, 16 Feb 2023 01:41:17 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:bc00:2acb:9e46:1412:686a? (p200300cbc708bc002acb9e461412686a.dip0.t-ipconnect.de. [2003:cb:c708:bc00:2acb:9e46:1412:686a])
        by smtp.gmail.com with ESMTPSA id j26-20020a05600c1c1a00b003df245cd853sm1211974wms.44.2023.02.16.01.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:41:16 -0800 (PST)
Message-ID: <62c84fa8-d7c4-5163-fe1e-f2c7e5a2c7aa@redhat.com>
Date:   Thu, 16 Feb 2023 10:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 0/9] KVM: mm: fd-based approach for supporting KVM
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Chao Peng <chao.p.peng@linux.intel.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J . Bruce Fields" <bfields@fieldses.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
        ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
        dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
        tabba@google.com, Michael Roth <michael.roth@amd.com>,
        mhocko@suse.com, wei.w.wang@intel.com
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <Y+27kRxJoXlMcbtH@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y+27kRxJoXlMcbtH@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16.02.23 06:13, Mike Rapoport wrote:
> Hi,
> 
> On Fri, Dec 02, 2022 at 02:13:38PM +0800, Chao Peng wrote:
>> This patch series implements KVM guest private memory for confidential
>> computing scenarios like Intel TDX[1]. If a TDX host accesses
>> TDX-protected guest memory, machine check can happen which can further
>> crash the running host system, this is terrible for multi-tenant
>> configurations. The host accesses include those from KVM userspace like
>> QEMU. This series addresses KVM userspace induced crash by introducing
>> new mm and KVM interfaces so KVM userspace can still manage guest memory
>> via a fd-based approach, but it can never access the guest memory
>> content.
> 
> Sorry for jumping late.
> 
> Unless I'm missing something, hibernation will also cause an machine check
> when there is TDX-protected memory in the system. When the hibernation
> creates memory snapshot it essentially walks all physical pages and saves
> their contents, so for TDX memory this will trigger machine check, right?

I recall bringing that up in the past (also memory access due to kdump, 
/prov/kcore) and was told that the main focus for now is preventing 
unprivileged users from crashing the system, that is, not mapping such 
memory into user space (e.g., QEMU). In the long run, we'll want to 
handle such pages also properly in the other events where the kernel 
might access them.

-- 
Thanks,

David / dhildenb

