Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE7E217AB8
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2020 23:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729056AbgGGVwE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Jul 2020 17:52:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46139 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729043AbgGGVwE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jul 2020 17:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594158723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2er0aNLBQV2gIBNyC9uXErvIZxgp1FWSJ0RFq0zI9K0=;
        b=Vvlth00mo3UYzOruXZg64Oz8KeNsHMi3xAdVfHKc8qSr7l/32GbpPTlbbKcDj5aLIUzM+8
        9baLYRaC2DOpdmsjsm7+bBKgpMiR9RtXYNCzDyooqDB1JRQ4wUBQ89qowROgd0/vkocfhL
        aQGVU11F2bI8LM5zS30zRvyX/avV3Lw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-t-uwUxV3M4OaAFzkT7dZJQ-1; Tue, 07 Jul 2020 17:52:01 -0400
X-MC-Unique: t-uwUxV3M4OaAFzkT7dZJQ-1
Received: by mail-wm1-f70.google.com with SMTP id y204so803888wmd.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2020 14:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2er0aNLBQV2gIBNyC9uXErvIZxgp1FWSJ0RFq0zI9K0=;
        b=Yk3wbzXR7Y5RU5i/APisFOoYCF/a1L83CFR7LPjnLyJK18Syj2sKJjqyqMqIKZqDJS
         U2oCZxon6TsAQKpI7+StslgHImLICw/r47bXQQKdVTQer6XhJ2jv5iGv68PtnN66if0R
         5MC6nXq8OiDmS8kNIu4gGpqS5fJqb3/eE6xPi+ZVIS2tz5T5pL7olhJy6zN/9uUpMIuA
         c122OTziDJgWldsLLIv3PRnErcWNt0WKTJy45E9wpWbzmK8deQO/Iy7YOutpm7gW5+oT
         A+7XgUAOTFDntm66SoHVZbH2oP8ZmBone4xTh0ZNANd5hXyl19U5oTqgp3zGMwk1BCA4
         IHkA==
X-Gm-Message-State: AOAM531GvyAks6xfTLUqMg3mdHZn7b31coDfSQGalJXcedeLHhfbB9xy
        NAG+uRvWlunPojFFxfVoC/uRq/CIrlhMYUTigBl5ISIpmtfloRUOGu0Cs57L4Xcy/HsQEdqVCOH
        848eKyo9+mCWtTWiJJA6J
X-Received: by 2002:a05:600c:241:: with SMTP id 1mr6023755wmj.119.1594158719933;
        Tue, 07 Jul 2020 14:51:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIpmpXuw2PJCwb7uqNw0kg7Wrr1nz+wOneSDUnHkzV5klsewRb97ktM0f//9gTqHyZmBrCjg==
X-Received: by 2002:a05:600c:241:: with SMTP id 1mr6023711wmj.119.1594158719656;
        Tue, 07 Jul 2020 14:51:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7c9b:2885:1733:3575? ([2001:b07:6468:f312:7c9b:2885:1733:3575])
        by smtp.gmail.com with ESMTPSA id k11sm2922650wrd.23.2020.07.07.14.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 14:51:59 -0700 (PDT)
Subject: Re: [PATCH 2/4] KVM: x86: Introduce paravirt feature CR0/CR4 pinning
To:     Dave Hansen <dave.hansen@intel.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     "Andersen, John" <john.s.andersen@intel.com>, corbet@lwn.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, shuah@kernel.org, liran.alon@oracle.com,
        drjones@redhat.com, rick.p.edgecombe@intel.com,
        kristen@linux.intel.com, vkuznets@redhat.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        mchehab+huawei@kernel.org, gregkh@linuxfoundation.org,
        paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com,
        jgross@suse.com, mike.kravetz@oracle.com, oneukum@suse.com,
        luto@kernel.org, peterz@infradead.org, fenghua.yu@intel.com,
        reinette.chatre@intel.com, vineela.tummalapalli@intel.com,
        dave.hansen@linux.intel.com, arjan@linux.intel.com,
        caoj.fnst@cn.fujitsu.com, bhe@redhat.com, nivedita@alum.mit.edu,
        keescook@chromium.org, dan.j.williams@intel.com,
        eric.auger@redhat.com, aaronlewis@google.com, peterx@redhat.com,
        makarandsonare@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        kernel-hardening@lists.openwall.com
References: <20200617190757.27081-1-john.s.andersen@intel.com>
 <20200617190757.27081-3-john.s.andersen@intel.com>
 <0fa9682e-59d4-75f7-366f-103d6b8e71b8@intel.com>
 <20200618144314.GB23@258ff54ff3c0>
 <124a59a3-a603-701b-e3bb-61e83d70b20d@intel.com>
 <20200707211244.GN20096@linux.intel.com>
 <19b97891-bbb0-1061-5971-549a386f7cfb@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <31eb5b00-9e2a-aa10-0f20-4abc3cd35112@redhat.com>
Date:   Tue, 7 Jul 2020 23:51:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <19b97891-bbb0-1061-5971-549a386f7cfb@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/07/20 23:48, Dave Hansen wrote:
> On 7/7/20 2:12 PM, Sean Christopherson wrote:
>>>>> Let's say Intel loses its marbles and adds a CR4 bit that lets userspace
>>>>> write to kernel memory.  Linux won't set it, but an attacker would go
>>>>> after it, first thing.
>> That's an orthogonal to pinning.  KVM never lets the guest set CR4 bits that
>> are unknown to KVM.  Supporting CR4.NO_MARBLES would require an explicit KVM
>> change to allow it to be set by the guest, and would also require a userspace
>> VMM to expose NO_MARBLES to the guest.
>>
>> That being said, this series should supporting pinning as much as possible,
>> i.e. if the bit can be exposed to the guest and doesn't require special
>> handling in KVM, allow it to be pinned.  E.g. TS is a special case because
>> pinning would require additional emulator support and IMO isn't interesting
>> enough to justify the extra complexity.  At a glance, I don't see anything
>> that would prevent pinning FSGSBASE.
> 
> Thanks for filling in the KVM picture.
> 
> If we're supporting as much pinning as possible, can we also add
> something to make it inconvenient for someone to both make a CR4 bit
> known to KVM *and* ignore the pinning aspects?
> 
> We should really make folks think about it.  Something like:
> 
> #define KVM_CR4_KNOWN 0xff
> #define KVM_CR4_PIN_ALLOWED 0xf0
> #define KVM_CR4_PIN_NOT_ALLOWED 0x0f
> 
> BUILD_BUG_ON(KVM_CR4_KNOWN !=
>              (KVM_CR4_PIN_ALLOWED|KVM_CR4_PIN_NOT_ALLOWED));
> 
> So someone *MUST* make an active declaration about new bits being pinned
> or not?

I would just make all unknown bits pinnable (or perhaps all CR4 bits in
general).

Paolo

