Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B9034FF67
	for <lists+linux-doc@lfdr.de>; Wed, 31 Mar 2021 13:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbhCaLZo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 31 Mar 2021 07:25:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59133 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235172AbhCaLZO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 07:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617189907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0YukIclCbkitu8LAK2OczA30OhLVEbhRlLWMHuTB+bk=;
        b=dYx3cACKU30Ux3GGPg2qc6+y/2xJMSv8GIe1Xuj1ZE8n7ZdmD9AVsvgoJVQoAnO4XJ3V38
        9/v6AtTsnjYoo+co/Le2dvRCDH0xx6WMxQwRhcLpanrCQsGK5rutvXkZYFPyAHXBAJIQ7t
        DH9Kl6/pumY73pXK40HkTa6gXMF1DWs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-OijqmnEtO3STf-rJDKxEaw-1; Wed, 31 Mar 2021 07:25:05 -0400
X-MC-Unique: OijqmnEtO3STf-rJDKxEaw-1
Received: by mail-ej1-f72.google.com with SMTP id h14so650993ejg.7
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 04:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=0YukIclCbkitu8LAK2OczA30OhLVEbhRlLWMHuTB+bk=;
        b=rANYYx+mFUkQZapF9Eca1j7kAwP7dUnvTRykepb83nCuWLzr8UlJgz3kw19jLvjtVD
         LWlHgdBIq8FP/MJnWZRQ2x5oxsVJqcODscWgjqZytBBsfda3d6n4Z1egV4ezpQPP7cHb
         mQrgSUNvHcpW54CuykJmqGUFS1E/TKsIAOcsjVHi3vKzaQ0EoeURBeCGjcpVAhcwQa59
         SqJ6uyItO3vRdyIMuvrilOwrE8cv+c8I5L5b6JHLF419aHLDutVr6RCtTYANRr7L3br/
         8dzio9XnTznFo0Y8EIcGa5F+b/dnQ8xip3q4rgKqUtJWZyYJXGqViIXgkjlHV8Clg6fx
         lbeg==
X-Gm-Message-State: AOAM532JqxTEmXXOR2CVQ22nifDO5c3qMpn7G17UDU9nBN4stKSlj/Oj
        P9l5H+jUWuDY4m78cqad4rcZBfA3v4ePT4bZm27IH71dk2QUTkV+4Pn0eIzJ66x/gNmCcjhdu3b
        AbvrQ4b87G1a4xuPmsShM
X-Received: by 2002:a17:906:1a44:: with SMTP id j4mr2985730ejf.401.1617189904377;
        Wed, 31 Mar 2021 04:25:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqArdkg2azP7NIVFS6iYV1n6tCIuDgMxMfpypu+EIdM461jdEjsoZjRmXorrL3A1k1T5ogQQ==
X-Received: by 2002:a17:906:1a44:: with SMTP id j4mr2985697ejf.401.1617189904137;
        Wed, 31 Mar 2021 04:25:04 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id z9sm1389068edr.75.2021.03.31.04.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 04:25:03 -0700 (PDT)
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
In-Reply-To: <9b68907b-cb99-db0d-9151-0d3d5cf3c972@redhat.com>
References: <20210330185841.44792-1-eesposit@redhat.com>
 <20210330185841.44792-2-eesposit@redhat.com> <YGPmDbO++agqdqQL@google.com>
 <1be7c716-8160-926e-6d76-fb15b4adc066@redhat.com>
 <877dlnu56q.fsf@vitty.brq.redhat.com>
 <9b68907b-cb99-db0d-9151-0d3d5cf3c972@redhat.com>
Date:   Wed, 31 Mar 2021 13:25:02 +0200
Message-ID: <87y2e3sgz5.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Emanuele Giuseppe Esposito <eesposit@redhat.com> writes:

> On 31/03/2021 09:56, Vitaly Kuznetsov wrote:
>> Emanuele Giuseppe Esposito <eesposit@redhat.com> writes:
>> 
>>> On 31/03/2021 05:01, Sean Christopherson wrote:
>>>> On Tue, Mar 30, 2021, Emanuele Giuseppe Esposito wrote:
>>>>> Calling the kvm KVM_GET_[SUPPORTED/EMULATED]_CPUID ioctl requires
>>>>> a nent field inside the kvm_cpuid2 struct to be big enough to contain
>>>>> all entries that will be set by kvm.
>>>>> Therefore if the nent field is too high, kvm will adjust it to the
>>>>> right value. If too low, -E2BIG is returned.
>>>>>
>>>>> However, when filling the entries do_cpuid_func() requires an
>>>>> additional entry, so if the right nent is known in advance,
>>>>> giving the exact number of entries won't work because it has to be increased
>>>>> by one.
>>>>>
>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>> ---
>>>>>    arch/x86/kvm/cpuid.c | 6 ++++++
>>>>>    1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
>>>>> index 6bd2f8b830e4..5412b48b9103 100644
>>>>> --- a/arch/x86/kvm/cpuid.c
>>>>> +++ b/arch/x86/kvm/cpuid.c
>>>>> @@ -975,6 +975,12 @@ int kvm_dev_ioctl_get_cpuid(struct kvm_cpuid2 *cpuid,
>>>>>    
>>>>>    	if (cpuid->nent < 1)
>>>>>    		return -E2BIG;
>>>>> +
>>>>> +	/* if there are X entries, we need to allocate at least X+1
>>>>> +	 * entries but return the actual number of entries
>>>>> +	 */
>>>>> +	cpuid->nent++;
>>>>
>>>> I don't see how this can be correct.
>>>>
>>>> If this bonus entry really is needed, then won't that be reflected in array.nent?
>>>> I.e won't KVM overrun the userspace buffer?
>>>>
>>>> If it's not reflected in array.nent, that would imply there's an off-by-one check
>>>> somewhere, or KVM is creating an entry that it doesn't copy to userspace.  The
>>>> former seems unlikely as there are literally only two checks against maxnent,
>>>> and they both look correct (famous last words...).
>>>>
>>>> KVM does decrement array->nent in one specific case (CPUID.0xD.2..64), i.e. a
>>>> false positive is theoretically possible, but that carries a WARN and requires a
>>>> kernel or CPU bug as well.  And fudging nent for that case would still break
>>>> normal use cases due to the overrun problem.
>>>>
>>>> What am I missing?
>>>
>>> (Maybe I should have put this series as RFC)
>>>
>>> The problem I see and noticed while doing the KVM_GET_EMULATED_CPUID
>>> selftest is the following: assume there are 3 kvm emulated entries, and
>>> the user sets cpuid->nent = 3. This should work because kvm sets 3
>>> array->entries[], and copies them to user space.
>>>
>>> However, when the 3rd entry is populated inside kvm (array->entries[2]),
>>> array->nent is increased once more (do_host_cpuid and
>>> __do_cpuid_func_emulated). At that point, the loop in
>>> kvm_dev_ioctl_get_cpuid and get_cpuid_func can potentially iterate once
>>> more, going into the
>>>
>>> if (array->nent >= array->maxnent)
>>> 	return -E2BIG;
>>>
>>> in __do_cpuid_func_emulated and do_host_cpuid, returning the error. I
>>> agree that we need that check there because the following code tries to
>>> access the array entry at array->nent index, but from what I understand
>>> that access can be potentially useless because it might just jump to the
>>> default entry in the switch statement and not set the entry, leaving
>>> array->nent to 3.
>> 
>> The problem seems to be exclusive to __do_cpuid_func_emulated(),
>> do_host_cpuid() always does
>> 
>> entry = &array->entries[array->nent++];
>> 
>> Something like (completely untested and stupid):
>> 
>> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
>> index 6bd2f8b830e4..54dcabd3abec 100644
>> --- a/arch/x86/kvm/cpuid.c
>> +++ b/arch/x86/kvm/cpuid.c
>> @@ -565,14 +565,22 @@ static struct kvm_cpuid_entry2 *do_host_cpuid(struct kvm_cpuid_array *array,
>>          return entry;
>>   }
>>   
>> +static bool cpuid_func_emulated(u32 func)
>> +{
>> +       return (func == 0) || (func == 1) || (func == 7);
>> +}
>> +
>>   static int __do_cpuid_func_emulated(struct kvm_cpuid_array *array, u32 func)
>>   {
>>          struct kvm_cpuid_entry2 *entry;
>>   
>> +       if (!cpuid_func_emulated())
>> +               return 0;
>> +
>>          if (array->nent >= array->maxnent)
>>                  return -E2BIG;
>>   
>> -       entry = &array->entries[array->nent];
>> +       entry = &array->entries[array->nent++];
>>          entry->function = func;
>>          entry->index = 0;
>>          entry->flags = 0;
>> @@ -580,18 +588,14 @@ static int __do_cpuid_func_emulated(struct kvm_cpuid_array *array, u32 func)
>>          switch (func) {
>>          case 0:
>>                  entry->eax = 7;
>> -               ++array->nent;
>>                  break;
>>          case 1:
>>                  entry->ecx = F(MOVBE);
>> -               ++array->nent;
>>                  break;
>>          case 7:
>>                  entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
>>                  entry->eax = 0;
>>                  entry->ecx = F(RDPID);
>> -               ++array->nent;
>> -       default:
>>                  break;
>>          }
>> 
>> should do the job, right?
>> 
>> 
>
> Yes, it would work better. Alternatively:
>
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index ba7437308d28..452b0acd6e9d 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -567,34 +567,37 @@ static struct kvm_cpuid_entry2 
> *do_host_cpuid(struct kvm_cpuid_array *array,
>
>   static int __do_cpuid_func_emulated(struct kvm_cpuid_array *array, u32 
> func)
>   {
> -	struct kvm_cpuid_entry2 *entry;
> -
> -	if (array->nent >= array->maxnent)
> -		return -E2BIG;
> +	struct kvm_cpuid_entry2 entry;
> +	bool changed = true;
>
> -	entry = &array->entries[array->nent];
> -	entry->function = func;
> -	entry->index = 0;
> -	entry->flags = 0;
> +	entry.function = func;
> +	entry.index = 0;
> +	entry.flags = 0;
>
>   	switch (func) {
>   	case 0:
> -		entry->eax = 7;
> -		++array->nent;
> +		entry.eax = 7;
>   		break;
>   	case 1:
> -		entry->ecx = F(MOVBE);
> -		++array->nent;
> +		entry.ecx = F(MOVBE);
>   		break;
>   	case 7:
> -		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> -		entry->eax = 0;
> -		entry->ecx = F(RDPID);
> -		++array->nent;
> +		entry.flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
> +		entry.eax = 0;
> +		entry.ecx = F(RDPID);
> +		break;
>   	default:
> +		changed = false;
>   		break;
>   	}
>
> +	if (changed) {
> +		if (array->nent >= array->maxnent)
> +			return -E2BIG;
> +
> +		memcpy(&array->entries[array->nent++], &entry, sizeof(entry));
> +	}
> +
>   	return 0;
>   }
>
> pros: avoids hard-coding another function that would check what the 
> switch already does. it will be more flexible if another func has to be 
> added. cons: there is a memcpy for each entry.

Looks good to me,

I'd drop just 'bool changed' and replaced it with 'goto out' in the
'default' case.

memcpy() here is not a problem I believe, this path is not that
performace critical.

-- 
Vitaly

