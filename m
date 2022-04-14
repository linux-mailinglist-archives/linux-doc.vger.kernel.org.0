Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E340150169B
	for <lists+linux-doc@lfdr.de>; Thu, 14 Apr 2022 17:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232538AbiDNPIP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 14 Apr 2022 11:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350006AbiDNOVg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Apr 2022 10:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDD48BCB5C
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649945563;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j1PUWoxND9yB/RqRBJNB2R/kkEVrgsT3WEOw5xZ9hqE=;
        b=b7uuRIlKYiLjzIveYIRAqpkTB9+VRlPlCBP+ef+yF2UNxpGe2D3pPNYw4IQjatjs3wItXz
        azc5xwtATOri6wQh+9U2/+nwmy+xV9bR6BZ8urncyuiphdwrTwTr82fxHNbxEg6A+QaCyN
        1HpjlIZc7h0nbBP36yDjv0TJN4h/OQE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-jk77nj0SPNKx2i0O45MxxA-1; Thu, 14 Apr 2022 10:12:41 -0400
X-MC-Unique: jk77nj0SPNKx2i0O45MxxA-1
Received: by mail-ed1-f69.google.com with SMTP id cn27-20020a0564020cbb00b0041b5b91adb5so3097334edb.15
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 07:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j1PUWoxND9yB/RqRBJNB2R/kkEVrgsT3WEOw5xZ9hqE=;
        b=hyW46ECu6nI/8SIkZy5u35qjEYMGzjE9sNMtDFdCxddVVIHI4Y7RtA/NQjYYN/AuEZ
         4L9Aep9gm+snT6gY920wHgIEjrHE8VaCPq2Sx8tXfdEEq3WKnPBk8RPmfOhY2uqycecK
         ER18VDr32FQKJQ5yfn5iVnbm0khgiXCVkp290YEcq6fmNUogw7R8N4IkESJ+C0WqH77o
         UerWZGoNhl5YF23JgU3Vl0wlPPpijVgVxh7S/PQIkXgb1tFevwoNrx/hfJpVh3bhxIbZ
         260x5Uq7bmQjjclC/1tkhaLHxMbwt2WMAb7RMzyb4Ml6D1jQISm1xbaTNxLIzD1g4Gis
         XiQg==
X-Gm-Message-State: AOAM53314T4SczIClvCb0jCvm2EQ1657p9TKD6W3xE29d9tf6D8kOXrI
        BbQ2gKWgplSGWJeottK27VOWzAzfw97av+OkgB/RgqpetSqM5vAkBuZ+WREHrjoCTouKQMLGWYL
        Xd9E95moGKagGvHm0p3/d
X-Received: by 2002:a17:907:d16:b0:6d6:e3b6:9cd8 with SMTP id gn22-20020a1709070d1600b006d6e3b69cd8mr2431090ejc.94.1649945560324;
        Thu, 14 Apr 2022 07:12:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzpmBaUrfDVV7d9ZOREkhEyKHyJVyB5pXUAJ4fe06+V64NEb8u+mjFbLOmP1i+mBi6Xh9zRQ==
X-Received: by 2002:a17:907:d16:b0:6d6:e3b6:9cd8 with SMTP id gn22-20020a1709070d1600b006d6e3b69cd8mr2431066ejc.94.1649945560128;
        Thu, 14 Apr 2022 07:12:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id g16-20020a170906521000b006d58773e992sm672870ejm.188.2022.04.14.07.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 07:12:39 -0700 (PDT)
Message-ID: <77699a19-65bd-5088-2f25-1be59364f5ee@redhat.com>
Date:   Thu, 14 Apr 2022 16:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH V3 3/4] KVM: X86: Alloc role.pae_root shadow page
Content-Language: en-US
To:     Lai Jiangshan <jiangshanlai@gmail.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        Lai Jiangshan <jiangshan.ljs@antgroup.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        linux-doc@vger.kernel.org
References: <20220330132152.4568-1-jiangshanlai@gmail.com>
 <20220330132152.4568-4-jiangshanlai@gmail.com> <YlXrshJa2Sd1WQ0P@google.com>
 <CAJhGHyD-4YFDhkxk2SQFmKe3ooqw_0wE+9u3+sZ8zOdSUfbnxw@mail.gmail.com>
 <683974e7-5801-e289-8fa4-c8a8d21ec1b2@redhat.com>
 <CAJhGHyCgo-FEgvuRfuLZikgJSyo7HGm1OfU3gme35-WBmqo7yQ@mail.gmail.com>
 <658729a1-a4a1-a353-50d6-ef71e83a4375@redhat.com>
 <CAJhGHyDYeQGUWmco=c4TA1uu=33ccW7z0fDLuYjvkGFW5WnDSQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJhGHyDYeQGUWmco=c4TA1uu=33ccW7z0fDLuYjvkGFW5WnDSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/14/22 13:06, Lai Jiangshan wrote:
>> Right, but then load_pdptrs only needs to zap the page before (or
>> instead of) calling kvm_mmu_free_roots().
>>
> 
> Guest PAE page is write-protected instead now (see patch4) and
> kvm_mmu_pte_write() needs to handle this special write operation
> with respect to sp->pae_off (todo).
> And load_pdptrs() doesn't need to check if the pdptrs are changed.

Write-protecting the PDPTR page is unnecessary, the PDPTRs cannot change 
without another CR3.  That should be easy to do in account_shadowed and 
unaccount_shadowed

> I think role.guest_pae_root is needed to distinguish it from
> a sp for a level-3 guest page in a 4-level pagetable.
>
> Or just role.guest_root_level(or role.root_level) and it can replace
> role.passthrough_depth and role.guest_pae_root and role.pae_root.

Yes, I agree.  Though this would also get change patch 1 substantially, 
so I'll wait for you to respin.

Paolo

