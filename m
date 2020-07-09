Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FCC219C6B
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2020 11:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgGIJhr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Jul 2020 05:37:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37277 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726278AbgGIJhr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jul 2020 05:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594287465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vZkZGfD7uhGw3aCbwlHuBrGlMvsJLTE0nJJY8zr08K0=;
        b=SMk6ildCunFJCiPiFFX3qziPINhGsl97vDnSB1Tja2Y3YRl3NgMunGta8b1unLB9VWPXY2
        tzQKpQM51Ob0l5Q9KogS59xHhoxtZpggHz1S3QJvyeBcioUFmclXfBbapgjN8jcrlSgXIt
        oT/VOmKAH5o+MYzavNjM9+BmVlxChOA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-_p5xOSuhMq2O9ErLCjJ5Hg-1; Thu, 09 Jul 2020 05:37:43 -0400
X-MC-Unique: _p5xOSuhMq2O9ErLCjJ5Hg-1
Received: by mail-wr1-f70.google.com with SMTP id o12so1517250wrj.23
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2020 02:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vZkZGfD7uhGw3aCbwlHuBrGlMvsJLTE0nJJY8zr08K0=;
        b=jcublPsgT0oO/oJeueElrvpToETaBTvCh69KSuN98QVt1pWC7w2tyx4p6p4gYNZnLm
         xu2Z4Zrt3Zqo8UWlS1lIGW1ibrgvmJFeZpIsdhJEeap17Ud8oKXlxGbNRYPlNS+kzoFb
         bLx2eyCIkLt5gxxZ/4cBVKi8JoC7Oi6QMGqI8ZOb7tE3XFjIKNvkJcL3LRL4U4RpWLmd
         8IGnSy55aC1iptMc6J+ZJm4H1BCwExWJt5a5FxHobC0W3m/Mc3u21R8ZwcT3zYCzPFfU
         rWyfAE/cMI01tGkYTE3FX27yCykzGhP8ZLhZWSGEHaTcorZgiWlHLFqi2jM3tEbWtCPT
         qDRw==
X-Gm-Message-State: AOAM531bmEVwztb6r4dvKupcD0Yfh8gElV+7vo40MExhQD4YCDYY5lnQ
        BirvxSWuzm0K+ZW3mLwJJWYEjXauqEdXm28h+kFsiKL2XJcurtFSnHEHJiy0HxTO7DGy08/kgS7
        CQkvvcgaYycjxBSyEhDVv
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr62388100wrr.202.1594287462640;
        Thu, 09 Jul 2020 02:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsB7+szqf5rMRlotUrNNWYyOY5QqqyygFQfXJIgIgWNl9g8ybRGwWmy9MiscFM9mSBYt3iVg==
X-Received: by 2002:adf:fd8e:: with SMTP id d14mr62388080wrr.202.1594287462420;
        Thu, 09 Jul 2020 02:37:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c? ([2001:b07:6468:f312:9541:9439:cb0f:89c])
        by smtp.gmail.com with ESMTPSA id a4sm5012609wrg.80.2020.07.09.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:37:41 -0700 (PDT)
Subject: Re: [PATCH v3 0/8] Refactor handling flow of KVM_SET_CPUID*
To:     Xiaoyao Li <xiaoyao.li@intel.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Jim Mattson <jmattson@google.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20200708065054.19713-1-xiaoyao.li@intel.com>
 <55ce27bc-7ff7-3552-0e2d-ce69c66fd68e@redhat.com>
 <e6432b0d-c509-28e0-7720-a4a0e22ea4d9@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a5c0b6dc-518a-8963-0c0e-ad55189bd356@redhat.com>
Date:   Thu, 9 Jul 2020 11:37:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e6432b0d-c509-28e0-7720-a4a0e22ea4d9@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/07/20 06:27, Xiaoyao Li wrote:
> On 7/8/2020 8:10 PM, Paolo Bonzini wrote:
>> On 08/07/20 08:50, Xiaoyao Li wrote:
>>> This serial is the extended version of
>>> https://lkml.kernel.org/r/20200528151927.14346-1-xiaoyao.li@intel.com
>>>
>>> First two patches are bug fixing, and the others aim to refactor the
>>> flow
>>> of SET_CPUID* as:
>>>
>>> 1. cpuid check: check if userspace provides legal CPUID settings;
>>>
>>> 2. cpuid update: Update some special CPUID bits based on current vcpu
>>>                   state, e.g., OSXSAVE, OSPKE, ...
>>>
>>> 3. update vcpu model: Update vcpu model (settings) based on the final
>>> CPUID
>>>                        settings.
>>>
>>> v3:
>>>   - Add a note in KVM api doc to state the previous CPUID configuration
>>>     is not reliable if current KVM_SET_CPUID* fails [Jim]
>>>   - Adjust Patch 2 to reduce code churn [Sean]
>>>   - Commit message refine to add more justification [Sean]
>>>   - Add a new patch (7)
>>>
>>> v2:
>>> https://lkml.kernel.org/r/20200623115816.24132-1-xiaoyao.li@intel.com
>>>   - rebase to kvm/queue: a037ff353ba6 ("Merge branch 'kvm-master'
>>> into HEAD")
>>>   - change the name of kvm_update_state_based_on_cpuid() to
>>>     kvm_update_vcpu_model() [Sean]
>>>   - Add patch 5 to rename kvm_x86_ops.cpuid_date() to
>>>     kvm_x86_ops.update_vcpu_model()
>>>
>>> v1:
>>> https://lkml.kernel.org/r/20200529085545.29242-1-xiaoyao.li@intel.com
>>>
>>> Xiaoyao Li (8):
>>>    KVM: X86: Reset vcpu->arch.cpuid_nent to 0 if SET_CPUID* fails
>>>    KVM: X86: Go on updating other CPUID leaves when leaf 1 is absent
>>>    KVM: X86: Introduce kvm_check_cpuid()
>>>    KVM: X86: Split kvm_update_cpuid()
>>>    KVM: X86: Rename cpuid_update() to update_vcpu_model()
>>>    KVM: X86: Move kvm_x86_ops.update_vcpu_model() into
>>>      kvm_update_vcpu_model()
>>>    KVM: lapic: Use guest_cpuid_has() in kvm_apic_set_version()
>>>    KVM: X86: Move kvm_apic_set_version() to kvm_update_vcpu_model()
>>>
>>>   Documentation/virt/kvm/api.rst  |   4 ++
>>>   arch/x86/include/asm/kvm_host.h |   2 +-
>>>   arch/x86/kvm/cpuid.c            | 107 ++++++++++++++++++++------------
>>>   arch/x86/kvm/cpuid.h            |   3 +-
>>>   arch/x86/kvm/lapic.c            |   4 +-
>>>   arch/x86/kvm/svm/svm.c          |   4 +-
>>>   arch/x86/kvm/vmx/nested.c       |   2 +-
>>>   arch/x86/kvm/vmx/vmx.c          |   4 +-
>>>   arch/x86/kvm/x86.c              |   1 +
>>>   9 files changed, 81 insertions(+), 50 deletions(-)
>>>
>>
>> Queued patches 1/2/3/7/8, thanks.
> 
> Paolo,
> 
> I notice that you queued patch 8 into kvm/queue branch as
> commit 84dd4897524e "KVM: X86: Move kvm_apic_set_version() to
> kvm_update_vcpu_model()"
> 
> Can you change the subject of that commit to "KVM: X86: Move
> kvm_apic_set_version() to kvm_update_cpuid()" ?

Good catch, thanks.

Paolo

