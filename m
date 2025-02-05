Return-Path: <linux-doc+bounces-37023-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76819A2927D
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 16:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EE72188D098
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2025 14:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4C318DF65;
	Wed,  5 Feb 2025 14:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VtuA7DL9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF416CD33
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767083; cv=none; b=TaqgjiHgl428oYrL5HfFXytbo/N6qhCcQp70EV7xU5qt0/wqeehN4Ufm1i4MEJxGbhLo/fJQ3KseSm/iaJWo6TjNhCSJCXbuBBb9MN2FA3rIecZLSWY+OSffVGz9p4Uu4sqjy+iBvbDPeyNnli+DLY7Ek5oew5UiALx/WK88yTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767083; c=relaxed/simple;
	bh=6j/I9mAeLhYUvAZJoYLetc48K6D+e8yc42PUWCWPCEI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UFLU7wiHHURB2dx0AgPvPANofEYnGcXfTm4dTIGHlvlKbrLV0Jbs75wp8ehI6iLIyIhMqNR98xXfq0wKfxs6b4xiSA4d6Jdg4VekN1qkSxGU602T+lst2lYVa43PaCJDQuddlpejEEv+s4IKdus8oPI1Z5OGjFVINv8+EdMKISE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VtuA7DL9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso5902825e9.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2025 06:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738767080; x=1739371880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EFCT6PQkQ+ER5Dk9U9aq5FJrY7j3mLX+CioXnttznzI=;
        b=VtuA7DL91cP6TnbhtUzTOP2wIFEhh/o5noKyMJoyjujweuKYx+O+JmTR37bWZKMsJB
         4sydVzNck23EX7VOJHgoKHXH0NdGF0cTUiwg5ET1B9pexejfAiCaBDTORgrPzY4W6H3m
         R2p+lF5VIu7xuq/91xKYXvxDiuKyZQBWXZzvBsx4d2JPF1seW/Gk/XQYjzG99943yk2x
         a0i/Q9HKga6qaUXKSlVVJsWe1eUYrmxIar3a0fOdtSvu5PUuqsQU8NYBgEiTdpstOsR4
         RQMK1ZSrKaWZ81yQSMsysCZZpGQU9T1n6k2GycIeqYrB4YXAzhHjeKTmqe8GIjilWz9T
         FhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738767080; x=1739371880;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EFCT6PQkQ+ER5Dk9U9aq5FJrY7j3mLX+CioXnttznzI=;
        b=DqEKH9B12YQ44kqvgN71eyH+Sca5UVh0nW+86/MLs/yJcaNyuvXYYx+r7Bm+Ia+SiC
         QYm+0y56RJDQa3hk4/BY85O0hCqMEq7dKYV1JuJX+PyGZZCccn3kHXFidIHnfClwAHyr
         tTVeZMH+HqFaURzDIL1xkPxSy3cG8/iLGpOwDjoXjC4949HaGglXOA1FnRQqRkn7TAE1
         7//e3kmnAE/7ID+OPWCztC23vZ0qiC5ZYcJheua3R+5p97/NQ9YWs0rj7O7gTsXZ+O1m
         eEzxNkfkKxHVJpihleA4PaDnKQVMA0PCB9aRvb8AzvQDCitYBft8S/MV5oXibg28ONPi
         w2YA==
X-Forwarded-Encrypted: i=1; AJvYcCUWE1oj9gS6xEa07D2zB5B/wenV08LJ9xTabVENhEL2FI6Z3Qxp4elcveP+iJbnmJC/zFnw30YWjv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdCoYTMbybPj4g4wBE008Qcf8WIVgfwJsjPVxLXq1lQSvxZI0m
	eo/AZE0Y09wYO3RXJDZtxdTeba1xm+OwcmsRNrzv5JS5vtxhPhA+4Akmaa3k5Io=
X-Gm-Gg: ASbGncsIMbQPUKTZLfiMkm1lN7kfoXNYhByif+rOm5Hu0rl17wXCUclsVcK3tJV9/Ze
	vvfTDwis8To0MunJ5ihbwV0oIQVmfplrHmBWreCVRub4An51rxHECQk7dZphHc7BRGh65EUOPnk
	TSj53NoScLfm6TDN++xTPwf02/7m+Pckz2Qad8v8Fv0aWptp0eMkeDmE5ImjxKgS84gDNh/+YCP
	GxBLreKpm4srZa4zJ2+5s+W8Y/+ttjYXcgiOmVOe1YUp7CYaI2sISMrlyDNGlNg0h6+Yr3ryVHs
	Zuk8CY0JGFWEc3NkB86KqIjpPA==
X-Google-Smtp-Source: AGHT+IE9BujRGuXFHYGWh7zul0dGeEmc4S8uOfYrfjwucc5GW9K9kK+zJI7qxc9lpw2Mo/+9jeNk3w==
X-Received: by 2002:a5d:64a5:0:b0:385:faf5:ebb8 with SMTP id ffacd0b85a97d-38db4643fb3mr2448630f8f.7.1738767079523;
        Wed, 05 Feb 2025 06:51:19 -0800 (PST)
Received: from [192.168.68.163] ([145.224.66.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec35asm19338202f8f.15.2025.02.05.06.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 06:51:19 -0800 (PST)
Message-ID: <62ff8c83-e147-451f-8d08-44a6512e0f2e@linaro.org>
Date: Wed, 5 Feb 2025 14:51:17 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
From: James Clark <james.clark@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-11-1c1300802385@kernel.org>
 <0415d354-0c44-4fff-b92b-b0f5c9c72b11@linaro.org>
 <CAL_JsqKTNDQn9omG3g=6Rb4Nwt6hG9Gw7-VXL_fjQeEQmmtJQg@mail.gmail.com>
 <630f630d-241e-45f5-b449-243147fb888b@linaro.org>
 <CAL_JsqKY8MjD=iFf6MiT04WmCHYUxGtWG9JfX5-5fuG32F77qQ@mail.gmail.com>
 <3c7e1ce0-9a5d-43fb-9767-8e4ca92a450d@linaro.org>
Content-Language: en-US
In-Reply-To: <3c7e1ce0-9a5d-43fb-9767-8e4ca92a450d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/02/2025 2:38 pm, James Clark wrote:
> 
> 
> On 04/02/2025 3:03 pm, Rob Herring wrote:
>> On Tue, Feb 4, 2025 at 6:03 AM James Clark <james.clark@linaro.org> 
>> wrote:
>>>
>>>
>>>
>>> On 03/02/2025 5:58 pm, Rob Herring wrote:
>>>> On Mon, Feb 3, 2025 at 10:53 AM James Clark <james.clark@linaro.org> 
>>>> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 03/02/2025 12:43 am, Rob Herring (Arm) wrote:
>>>>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>>>
>>>>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>>>>> Extension (BRBE), which records information about branches as they 
>>>>>> are
>>>>>> executed into set of branch record registers. BRBE is similar to 
>>>>>> x86's
>>>>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>>>>> (BHRB).
>>
>> [...]
>>
>>>>>> +     /*
>>>>>> +      * Require that the event filter and branch filter 
>>>>>> permissions match.
>>>>>> +      *
>>>>>> +      * The event and branch permissions can only mismatch if the 
>>>>>> user set
>>>>>> +      * at least one of the privilege branch filters in 
>>>>>> PERF_SAMPLE_BRANCH_PLM_ALL.
>>>>>> +      * Otherwise, the core will set the branch sample 
>>>>>> permissions in
>>>>>> +      * perf_copy_attr().
>>>>>> +      */
>>>>>> +     if ((event->attr.exclude_user != !(branch_type & 
>>>>>> PERF_SAMPLE_BRANCH_USER)) ||
>>>>>> +         (event->attr.exclude_kernel != !(branch_type & 
>>>>>> PERF_SAMPLE_BRANCH_KERNEL)) ||
>>>>>
>>>>> I don't think this one is right. By default perf_copy_attr() copies 
>>>>> the
>>>>> exclude_ settings into the branch settings so this works, but if the
>>>>> user sets any _less_ permissive branch setting this fails. For 
>>>>> example:
>>>>>
>>>>>     # perf record -j any,u -- true
>>>>>     Error:
>>>>>     cycles:PH: PMU Hardware or event type doesn't support branch stack
>>>>>     sampling.
>>>>>
>>>>> Here we want the default sampling permissions (exclude_kernel == 0,
>>>>> exclude_user == 0), but only user branch records, which doesn't match.
>>>>> It should be allowed because it doesn't include anything that we're 
>>>>> not
>>>>> allowed to see.
>>>>
>>>> I know it is allowed(on x86), but why would we want that? If you do
>>>> something even more restricted:
>>>>
>>>> perf record -e cycles:k -j any,u -- true
>>>>
>>>> That's allowed on x86 and gives you samples with user addresses. But
>>>> all the events happened in the kernel. How does that make any sense?
>>>>
>>>> I suppose in your example, we could avoid attaching branch stack on
>>>> samples from the kernel. However, given how my example works, I'm
>>>> pretty sure that's not what x86 does.
>>>>
>>>> There's also combinations that are allowed, but record no samples.
>>>> Though I think that was with guest events. I've gone with reject
>>>> non-sense combinations as much as possible. We can easily remove those
>>>> restrictions later if needed. Changing the behavior later (for the
>>>> same configuration) wouldn't be good.
>>>>
>>>>
>>>
>>> Rejecting ones that produce no samples is fair enough, but my example
>>> does produce samples. To answer the question "why would we want that?",
>>> nothing major, but there are a few small reasons:
>>>
>>>    * Perf includes both user and kernel by default, so the shortest
>>>      command to only gather user branches doesn't work (-j any,u)
>>>    * The test already checks for branch stack support like this, so old
>>>      Perf test versions don't work
>>
>> I would be more concerned about this one except that *we* wrote that
>> test. (I'm not sure why we wrote a new test rather than adapting
>> record_lbr.sh...)
>>
> 
> record_lbr.sh was added 6 months ago, test_brstack.sh 3 years ago so 
> it's the other way around.
> 
> Although record_lbr.sh also tests --call-graph and --stitch-lbr as well, 
> so I think it's fine for test_brstack.sh to test only --branch-filter 
> options at the lowest level.
> 
> Looking at that test though I see there is a capability "/sys/devices/ 
> cpu/caps/branches". I'm wondering whether we should be adding that on 
> the Arm PMU for BRBE?
> 
> Ignoring the tests, the man pages (and some pages on the internet) give 
> this example: "--branch-filter any_ret,u,k". This doesn't work either 
> because it doesn't match the default exclude_hv option. It just seems a 
> bit awkward and incompatible to me, for not much gain.
> 

Looking at record_lbr.sh led me to the fact that --call-graph=lbr sets 
"PERF_SAMPLE_BRANCH_USER" with the default kernel/user sampling mode, 
causing the same issue.

>>>    * You might only be optimising userspace, but still interested in the
>>>      proportion of time spent or particular place in the kernel
>>
>> How do you see that? It looks completely misleading to me. 'perf
>> report' seems to only list branch stack addresses in this case. There
>> doesn't seem to be any matching of the event address to branch stack
>> addresses.
>>
> 
> Perf script will show everything with all it's various options, or -- 
> branch-history on perf report will show both too. Also there are tools 
> other than Perf, AutoFDO seems like something that BRBE can be used with.
> 
>>>    * Consistency with existing implementations and for people porting
>>>      existing tools to Arm
>>>    * It doesn't cost anything to support it (I think we just
>>>      only check if exclude_* is set rather than !=)
>>>    * Permissions checks should be handled by the core code so that
>>>      they're consistent
>>>    * What's the point of separate branch filters anyway if they always
>>>      have to match the event filter?
>>
>> IDK, I wish someone could tell me. I don't see the usecase for them
>> being mismatched.
>>
>> In any case, I don't care too much one way or the other what we do
>> here. If everyone thinks we should relax this, then that's fine with
>> me.
>>
> 
> Seeing the branch history from userspace that led up to a certain thing 
> in the kernel happening doesn't seem like that much of an edge case to 
> me. If you always have to have both on then you lose the userspace 
> branch history because the buffer isn't that big and gets overwritten.
> 
>>> Some of these things could be fixed in Perf, but not in older versions.
>>> Even if we can't think of a real use case now, it doesn't sound like the
>>> driver should be so restrictive of an option that doesn't do any harm.
>>>
>>>>> This also makes the Perf branch test skip because it uses
>>>>> any,save_type,u to see if BRBE exists.
>>>>
>>>> Yes, I plan to update that if we keep this behavior.
>>>>
>>>>>> +         (!is_kernel_in_hyp_mode() &&
>>>>>> +          (event->attr.exclude_hv != !(branch_type & 
>>>>>> PERF_SAMPLE_BRANCH_HV))))
>>>>>> +             return false;
>>>>>> +
>>>>>> +     event->hw.branch_reg.config = branch_type_to_brbfcr(event- 
>>>>>> >attr.branch_sample_type);
>>>>>> +     event->hw.extra_reg.config = branch_type_to_brbcr(event- 
>>>>>> >attr.branch_sample_type);
>>>>>> +
>>>>>> +     return true;
>>>>>> +}
>>>>>> +
>>>>> [...]
>>>>>> +static const int 
>>>>>> brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXIT + 1][2] = {
>>>>>> +     [BRBINFx_EL1_TYPE_DIRECT_UNCOND] = { PERF_BR_UNCOND, 0 },
>>>>>
>>>>> Does the second field go into 'new_type'? They all seem to be zero so
>>>>> I'm not sure why new_type isn't ignored instead of having it mapped.
>>>>
>>>> Well, left over from when all the Arm specific types were supported.
>>>> So yeah, that can be simplified.
>>>>
>>>>>> +     [BRBINFx_EL1_TYPE_INDIRECT] = { PERF_BR_IND, 0 },
>>>>>> +     [BRBINFx_EL1_TYPE_DIRECT_LINK] = { PERF_BR_CALL, 0 },
>>>>>> +     [BRBINFx_EL1_TYPE_INDIRECT_LINK] = { PERF_BR_IND_CALL, 0 },
>>>>>> +     [BRBINFx_EL1_TYPE_RET] = { PERF_BR_RET, 0 },
>>>>>> +     [BRBINFx_EL1_TYPE_DIRECT_COND] = { PERF_BR_COND, 0 },
>>>>>> +     [BRBINFx_EL1_TYPE_CALL] = { PERF_BR_CALL, 0 },
>>>>>> +     [BRBINFx_EL1_TYPE_ERET] = { PERF_BR_ERET, 0 },
>>>>>> +     [BRBINFx_EL1_TYPE_IRQ] = { PERF_BR_IRQ, 0 },
>>>>>
>>>>> How do ones that don't map to anything appear in Perf? For example
>>>>> BRBINFx_EL1_TYPE_TRAP is missing, and the test that was attached to 
>>>>> the
>>>>> previous versions fails because it doesn't see the trap that jumps to
>>>>> the kernel, but it does still see the ERET back to userspace:
>>>>>
>>>>>      [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
>>>>>
>>>>> In older versions we'd also have BRBINFx_EL1_TYPE_TRAP mapping to
>>>>> PERF_BR_SYSCALL so you could see it go into the kernel before the 
>>>>> return:
>>>>>
>>>>>      trap_bench+0x1C/[unknown]/-/-/-/0/SYSCALL/-
>>>>>      [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
>>>>
>>>> My read of that was we should see a CALL in this case. Whether SVC
>>>> generates a TRAP or CALL depends on HFGITR_EL2.SVC_EL0 (table D18-2).
>>>> I assumed "SVC due to HFGITR_EL2.SVC_EL0" means when SVC_EL0 is set
>>>> (and set has additional conditions). We have SVC_EL0 cleared, so that
>>>> should be a CALL. Maybe the FVP has this wrong?
>>>>
>>>
>>> The test is doing this rather than a syscall:
>>>
>>>     asm("mrs %0, ID_AA64ISAR0_EL1" : "=r" (val));   /* TRAP + ERET */
>>>
>>> So I think trap is right. Whether that should be mapped to SYSCALL or
>>> some other branch type I don't know, but the point is that it's 
>>> missing now.
>>
>> We aren't supporting any of the Arm specific traps/exceptions. One
>> reason is for consistency with x86 like you just argued for. The only
> 
> Does x86 leave holes in the program flow though, or is it complete? IMO 
> it makes it harder for tools to make sense of the branch buffer if there 
> are things like an ERET with no previous trap to match it up to.
> 
>> exception types supported are syscall and IRQ. Part of the issue is
>> there is no userspace control over enabling all the extra Arm ones.
>> There's no way to say enable all branches except debug, fault, etc.
>> exceptions. If we want to support these, I think there should be user
>> control over enabling them. But that can come later if there's any
>> demand for them.
>>
>> Rob
> 
> In this patchset we enable PERF_BR_IRQ with PERF_SAMPLE_BRANCH_ANY, 
> without any way to selectively disable it. I would assume trap could be 
> done with the same option.
> 
> If we're filtering some of them out it might be worth documenting that 
> "PERF_SAMPLE_BRANCH_ANY" doesn't actually mean 'any' branch type on Arm, 
> and some types are recorded but discarded out before sending to userspace.
> 
> There could be some confusion when there are partially filled or empty 
> branch buffers, and the reason wouldn't be that there weren't any 
> branches recorded, but they were all filtered out even with the 'any' 
> option.
> 


