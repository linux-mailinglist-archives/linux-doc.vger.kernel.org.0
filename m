Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D2234FAE6
	for <lists+linux-doc@lfdr.de>; Wed, 31 Mar 2021 09:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhCaH5G (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Mar 2021 03:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50884 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234042AbhCaH4v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 03:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617177410;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qTxlbCttfevuY4Yr7YqkiF6Z72PQYaAdmOgBQY9mW7c=;
        b=PFpsKqUCpqHTMzg/RLSVlfOc3BLfSyt2Y3efJNXFxSINcLECB0PMAdJMaMtPMdpeDtlDxc
        aGdb+P/qafq/d8nEwoKDsTAIWO+LKnstKaE6j6pxZHKLDje5kyjQwsPEsmE/EJV33Ttca+
        Ux+c3XUkrZZj2GB6RI0EqgqlySa7pY0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-_iml-69eOT6dmneCQNU5Uw-1; Wed, 31 Mar 2021 03:56:48 -0400
X-MC-Unique: _iml-69eOT6dmneCQNU5Uw-1
Received: by mail-ej1-f71.google.com with SMTP id rl7so423400ejb.16
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 00:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=qTxlbCttfevuY4Yr7YqkiF6Z72PQYaAdmOgBQY9mW7c=;
        b=sBIIP2MvHN7ip/GrlRBpIih7u0OMBSejRsuyhqRPJCiM9wVAl1n0b7sxbg0TmoHLCm
         VuD+MQNP8l0snqEHiAux+NPrxlklYsl01u60u7DqKe3N9Vq96IfSnQwIujYAWu9F/ECE
         LS8GHX+fYQDeGNMwxlZ1w1dDizCN/stmvjE0m7q2veFBKQRMSkS3LlLHjEjXnc4YR0LL
         HiwHzlJLfhVaWLMWDUtI4aGeqebeyqYDDIPH8BSU32lT3utvCf4h+9ZTxYOpy4mcZXgq
         qNOziwprSAI51L/tLEbsCKEYbDyhpyL8TnUtQcEmGRNEUDbV8B0EzNXv0Pp+Tu2q7ujn
         hptQ==
X-Gm-Message-State: AOAM532/kWgXhkC30BmUe9LcZGIET9a4K6T0es3GH+SOgekrogGDMXIR
        WBdsIZFoFnKKkhHF07K2lM48g3zmRNuIxamTdmBR/xFXpQ4RqGruyD1pKa6pqmsBxx71sMIcEOt
        RrMcFIXma3gJ+Q8OGZtsD
X-Received: by 2002:a17:906:5acd:: with SMTP id x13mr2131022ejs.211.1617177407678;
        Wed, 31 Mar 2021 00:56:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFxYg86aXW6gt6mF+7enQi7KHzpNTvnxSHMsXQA0W96uafrJeZq+ZXQBRq2t4vfe7cU2hWCg==
X-Received: by 2002:a17:906:5acd:: with SMTP id x13mr2131005ejs.211.1617177407440;
        Wed, 31 Mar 2021 00:56:47 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id lk12sm665521ejb.14.2021.03.31.00.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 00:56:46 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc:     kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
        Alexander Graf <graf@amazon.com>,
        Andrew Jones <drjones@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 1/4] kvm: cpuid: adjust the returned nent field of
 kvm_cpuid2 for KVM_GET_SUPPORTED_CPUID and KVM_GET_EMULATED_CPUID
In-Reply-To: <1be7c716-8160-926e-6d76-fb15b4adc066@redhat.com>
References: <20210330185841.44792-1-eesposit@redhat.com>
 <20210330185841.44792-2-eesposit@redhat.com> <YGPmDbO++agqdqQL@google.com>
 <1be7c716-8160-926e-6d76-fb15b4adc066@redhat.com>
Date:   Wed, 31 Mar 2021 09:56:45 +0200
Message-ID: <877dlnu56q.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Emanuele Giuseppe Esposito <eesposit@redhat.com> writes:

> On 31/03/2021 05:01, Sean Christopherson wrote:
>> On Tue, Mar 30, 2021, Emanuele Giuseppe Esposito wrote:
>>> Calling the kvm KVM_GET_[SUPPORTED/EMULATED]_CPUID ioctl requires
>>> a nent field inside the kvm_cpuid2 struct to be big enough to contain
>>> all entries that will be set by kvm.
>>> Therefore if the nent field is too high, kvm will adjust it to the
>>> right value. If too low, -E2BIG is returned.
>>>
>>> However, when filling the entries do_cpuid_func() requires an
>>> additional entry, so if the right nent is known in advance,
>>> giving the exact number of entries won't work because it has to be increased
>>> by one.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   arch/x86/kvm/cpuid.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
>>> index 6bd2f8b830e4..5412b48b9103 100644
>>> --- a/arch/x86/kvm/cpuid.c
>>> +++ b/arch/x86/kvm/cpuid.c
>>> @@ -975,6 +975,12 @@ int kvm_dev_ioctl_get_cpuid(struct kvm_cpuid2 *cpuid,
>>>   
>>>   	if (cpuid->nent < 1)
>>>   		return -E2BIG;
>>> +
>>> +	/* if there are X entries, we need to allocate at least X+1
>>> +	 * entries but return the actual number of entries
>>> +	 */
>>> +	cpuid->nent++;
>> 
>> I don't see how this can be correct.
>> 
>> If this bonus entry really is needed, then won't that be reflected in array.nent?
>> I.e won't KVM overrun the userspace buffer?
>> 
>> If it's not reflected in array.nent, that would imply there's an off-by-one check
>> somewhere, or KVM is creating an entry that it doesn't copy to userspace.  The
>> former seems unlikely as there are literally only two checks against maxnent,
>> and they both look correct (famous last words...).
>> 
>> KVM does decrement array->nent in one specific case (CPUID.0xD.2..64), i.e. a
>> false positive is theoretically possible, but that carries a WARN and requires a
>> kernel or CPU bug as well.  And fudging nent for that case would still break
>> normal use cases due to the overrun problem.
>> 
>> What am I missing?
>
> (Maybe I should have put this series as RFC)
>
> The problem I see and noticed while doing the KVM_GET_EMULATED_CPUID 
> selftest is the following: assume there are 3 kvm emulated entries, and 
> the user sets cpuid->nent = 3. This should work because kvm sets 3 
> array->entries[], and copies them to user space.
>
> However, when the 3rd entry is populated inside kvm (array->entries[2]), 
> array->nent is increased once more (do_host_cpuid and 
> __do_cpuid_func_emulated). At that point, the loop in 
> kvm_dev_ioctl_get_cpuid and get_cpuid_func can potentially iterate once 
> more, going into the
>
> if (array->nent >= array->maxnent)
> 	return -E2BIG;
>
> in __do_cpuid_func_emulated and do_host_cpuid, returning the error. I 
> agree that we need that check there because the following code tries to 
> access the array entry at array->nent index, but from what I understand 
> that access can be potentially useless because it might just jump to the 
> default entry in the switch statement and not set the entry, leaving 
> array->nent to 3.

The problem seems to be exclusive to __do_cpuid_func_emulated(),
do_host_cpuid() always does

entry = &array->entries[array->nent++];

Something like (completely untested and stupid):

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 6bd2f8b830e4..54dcabd3abec 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -565,14 +565,22 @@ static struct kvm_cpuid_entry2 *do_host_cpuid(struct kvm_cpuid_array *array,
        return entry;
 }
 
+static bool cpuid_func_emulated(u32 func)
+{
+       return (func == 0) || (func == 1) || (func == 7);
+}
+
 static int __do_cpuid_func_emulated(struct kvm_cpuid_array *array, u32 func)
 {
        struct kvm_cpuid_entry2 *entry;
 
+       if (!cpuid_func_emulated())
+               return 0;
+
        if (array->nent >= array->maxnent)
                return -E2BIG;
 
-       entry = &array->entries[array->nent];
+       entry = &array->entries[array->nent++];
        entry->function = func;
        entry->index = 0;
        entry->flags = 0;
@@ -580,18 +588,14 @@ static int __do_cpuid_func_emulated(struct kvm_cpuid_array *array, u32 func)
        switch (func) {
        case 0:
                entry->eax = 7;
-               ++array->nent;
                break;
        case 1:
                entry->ecx = F(MOVBE);
-               ++array->nent;
                break;
        case 7:
                entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
                entry->eax = 0;
                entry->ecx = F(RDPID);
-               ++array->nent;
-       default:
                break;
        }

should do the job, right?


-- 
Vitaly

