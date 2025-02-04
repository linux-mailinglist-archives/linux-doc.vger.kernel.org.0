Return-Path: <linux-doc+bounces-36759-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B62A270DD
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2025 13:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CD56164800
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2025 12:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA9020E003;
	Tue,  4 Feb 2025 12:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eNXGrz4p"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626020DD74
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 12:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670583; cv=none; b=qfCruhENl9eC0EykMfFz0XTvrIxBzmd2Jx+MLP0J85A5jqJQQTgxrTkX1NoTipZ1/f/6mrqNiYIIACt+ZSt3g3lhXUkdIGqgvxxhrX1fzhoxowZrKzedZC8i1KCXkbm9zi5M3G8mjv5U1LEWyEIgHSMBwbFZvGfdvl0xmoUIfEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670583; c=relaxed/simple;
	bh=sd752EQK+hSoJZZ3VpKjrWlEN8E1woEwa398Fj1ykNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W29NQ1vbJGJhGeTHjiy2RzS+zgwJ0dQBhBuSS74Sq83T+qPVrzKdbof1JvJhw2cLGg4i17myCIvr1WMCZI4hiGTkZX/gKsOTdYDEtA/SqD0qh3mbMxH+vq3tBNrRqAvdDuaLqW0zCtRIQCSQIgenvKlasLrh/c1sJQiaAutJvnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eNXGrz4p; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43622267b2eso54919125e9.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 04:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738670579; x=1739275379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lm1f7OfEgAMnPWwSwXhdT5L0CeflR0dthgCr6GhCV78=;
        b=eNXGrz4p1jeDVWL1PEJhNjYCYwH5U6J532iRUocWhCObuaw7ON6LntWD1mlYxbn9dS
         whF9qriZ7mYfno2TJIyRW2vU+QLq45+WNvPqBCFjPwz5bHcDYFib7Y/bL+//vpAI9W7v
         ywx0p2XYHxI4mUU9qckVqOaam1xlkhQ7ZiqRNKcrm3+o2DYgh8viCojuXqhRRrdU/hWH
         tPXq7MSe8n50+EcLeT88ju4TqzebamUD1lEb2qsP3lMmm8mKD/9DvMKfHqO3dgcKJDgC
         0FXewv0DObTlnzcdTSDsA2HtBMn9HI4MNFZJr73qRutIjCXLYHKtfTGdLs4lSP2titoP
         Y62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738670579; x=1739275379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm1f7OfEgAMnPWwSwXhdT5L0CeflR0dthgCr6GhCV78=;
        b=nQ8hEjCb7W+RP+1xA5rUwvF9IO1AT9oaqLoHRUdCEL80WYb52y2FW3r/EWi+KOImP5
         q/PKw6lH+Yj8XfSzR6mHnhi9hFT6eanncnHdo1KUWefJEJu+3nWk+EdmMyCMlVSALvE2
         VVkM2ifAc0bYk47XnsgJo4TJ3yNWTD+dh2fqcThWxuscE0SK6jkZhljvUqhEjsb231w5
         5BqbTm7EcvxnUIugajWRMfAs56+m4eW8oXXNDe6y5ZWeUodeq8Kbae61qWJ/lP36Uh+E
         BpCEROnRv3vIGgBHAPn6GB3DH5wRgKjEWTuVVzUzLqrTk8gO3Yd2v+H0IoCZLIRnecAL
         4O8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUA/fZaqAKfmHKwPVazy1JuR0aP/mV/X+nbYJuIxhRHMmsjDqQpMtyrczcNgFaeXcOy5/LTqR16Xl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsOTETWA77aS38hN+7kS4tvvIkJyIAXlDeatYccL+AnUkz6+46
	WLcgMDpd1LiGHIY7/ATChNeuSQ2fGXpHXUUOlnjrx5IxbSQ/bgYs98xmJdaMaPA=
X-Gm-Gg: ASbGnctUOvzhjAvUAzhEpJ4tL3b1neHiV88IAa7DVG9JpeMJneVO46cl3QitU5ipQ/x
	gecbEUhU/1O4I9Ib2rX8R+5kKvPnTuHAJRf6Gfs0jNk8moKu5c8QlGnw1D5WjSovv86buPFF/BO
	sw0ub+iOH0dXu4YS61dFroUkbc/uTgec2ZgB09Vz56fultFzseWgAaYdCpO/bzxH0nAyL0oXXJ9
	/oSr0wBwrNB5Bw4ck6ND3iC9w8E0OB47rnwAmAB8AQFqcBSTRU5LWeHXkMLVW7bONZZCCq0YbW/
	O9g3BvNRCqB9kl7J/Ah3Ah7h
X-Google-Smtp-Source: AGHT+IFNpmw2gpoiWETBy4Xo67o3V5Wg8UfFAcJzqucXT9kmrVYel/4cPyhmyC5e+MRiOEQe62ehJg==
X-Received: by 2002:a05:600c:cc8:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-438dc3c8367mr214669535e9.13.1738670578541;
        Tue, 04 Feb 2025 04:02:58 -0800 (PST)
Received: from [192.168.68.163] ([145.224.67.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm192272465e9.28.2025.02.04.04.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:02:57 -0800 (PST)
Message-ID: <630f630d-241e-45f5-b449-243147fb888b@linaro.org>
Date: Tue, 4 Feb 2025 12:02:55 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAL_JsqKTNDQn9omG3g=6Rb4Nwt6hG9Gw7-VXL_fjQeEQmmtJQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/02/2025 5:58 pm, Rob Herring wrote:
> On Mon, Feb 3, 2025 at 10:53 AM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 03/02/2025 12:43 am, Rob Herring (Arm) wrote:
>>> From: Anshuman Khandual <anshuman.khandual@arm.com>
>>>
>>> The ARMv9.2 architecture introduces the optional Branch Record Buffer
>>> Extension (BRBE), which records information about branches as they are
>>> executed into set of branch record registers. BRBE is similar to x86's
>>> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
>>> (BHRB).
>>>
>>> BRBE supports filtering by exception level and can filter just the
>>> source or target address if excluded to avoid leaking privileged
>>> addresses. The h/w filter would be sufficient except when there are
>>> multiple events with disjoint filtering requirements. In this case, BRBE
>>> is configured with a union of all the events' desired branches, and then
>>> the recorded branches are filtered based on each event's filter. For
>>> example, with one event capturing kernel events and another event
>>> capturing user events, BRBE will be configured to capture both kernel
>>> and user branches. When handling event overflow, the branch records have
>>> to be filtered by software to only include kernel or user branch
>>> addresses for that event. In contrast, x86 simply configures LBR using
>>> the last installed event which seems broken.
>>>
>>> The event and branch exception level filtering are separately
>>> controlled. On x86, it is possible to request filtering which is
>>> disjoint (e.g. kernel only event with user only branches). It is also
>>> possible on x86 to configure branch filter such that no branches are
>>> ever recorded (e.g. -j save_type). For BRBE, events with mismatched
>>> exception level filtering or a configuration that will result in no
>>> samples are rejected. This can be relaxed in the future if such a need
>>> arises.
>>>
>>> The handling of KVM guests is similar to the above. On x86, branch
>>> recording is always disabled when a guest is running. However,
>>> requesting branch recording in guests is allowed. The guest events are
>>> recorded, but the resulting branches are all from the host. For BRBE,
>>> branch recording is similarly disabled when guest is running. In
>>> addition, events with branch recording and "exclude_host" set are
>>> rejected. Requiring "exclude_guest" to be set did not work. The default
>>> for the perf tool does set "exclude_guest" if no exception level
>>> options are specified. However, specifying kernel or user defaults to
>>> including both host and guest. In this case, only host branches are
>>> recorded.
>>>
>>> BRBE can support some additional exception, FIQ, and debug branch
>>> types, but they are not supported currently. There's no control in the
>>> perf ABI to enable/disable these branch types, so they could only be
>>> enabled for the 'any' filter which might be undesired or unexpected.
>>> The other architectures don't have any support similar events (at least
>>> with perf). These can be added in the future if there is demand by
>>> adding additional specific filter types.
>>>
>>> BRBE records are invalidated whenever events are reconfigured, a new
>>> task is scheduled in, or after recording is paused (and the records
>>> have been recorded for the event). The architecture allows branch
>>> records to be invalidated by the PE under implementation defined
>>> conditions. It is expected that these conditions are rare.
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> Co-developed-by: Mark Rutland <mark.rutland@arm.com>
>>> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
>>> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>> v19:
>>> - Drop saving of branch records when task scheduled out. (Mark)
>>> - Got rid of added armpmu ops. All BRBE support contained within pmuv3
>>>     code.
>>> - Dropped armpmu.num_branch_records as reg_brbidr has same info.
>>> - Make sched_task() callback actually get called. Enabling requires a
>>>     call to perf_sched_cb_inc().
>>> - Fix freeze on overflow for VHE
>>> - The cycle counter doesn't freeze BRBE on overflow, so avoid assigning
>>>     it when BRBE is enabled.
>>> - Drop all the Arm specific exception branches. Not a clear need for
>>>     them.
>>> - Simplify enable/disable to avoid RMW and document ISBs needed
>>> - Fix handling of branch 'cycles' reading. CC field is
>>>     mantissa/exponent, not an integer.
>>> - Save BRBFCR and BRBCR settings in event->hw.branch_reg.config and
>>>     event->hw.extra_reg.config to avoid recalculating the register value
>>>     each time the event is installed.
>>> - Rework s/w filtering to better match h/w filtering
>>> - Reject events with disjoint event filter and branch filter
>>> - Reject events if exclude_host is set
>>>
>>> v18: https://lore.kernel.org/all/20240613061731.3109448-6-anshuman.khandual@arm.com/
>>> ---
>>>    drivers/perf/Kconfig         |  11 +
>>>    drivers/perf/Makefile        |   1 +
>>>    drivers/perf/arm_brbe.c      | 794 +++++++++++++++++++++++++++++++++++++++++++
>>>    drivers/perf/arm_brbe.h      |  47 +++
>>>    drivers/perf/arm_pmu.c       |  15 +-
>>>    drivers/perf/arm_pmuv3.c     |  87 ++++-
>>>    include/linux/perf/arm_pmu.h |   8 +
>>>    7 files changed, 958 insertions(+), 5 deletions(-)
>>>
>> [...]
>>> +bool brbe_branch_attr_valid(struct perf_event *event)
>>> +{
>>> +     u64 branch_type = event->attr.branch_sample_type;
>>> +
>>> +     /*
>>> +      * Ensure both perf branch filter allowed and exclude
>>> +      * masks are always in sync with the generic perf ABI.
>>> +      */
>>> +     BUILD_BUG_ON(BRBE_PERF_BRANCH_FILTERS != (PERF_SAMPLE_BRANCH_MAX - 1));
>>> +
>>> +     if (branch_type & BRBE_EXCLUDE_BRANCH_FILTERS) {
>>> +             pr_debug_once("requested branch filter not supported 0x%llx\n", branch_type);
>>> +             return false;
>>> +     }
>>> +
>>> +     /* Ensure at least 1 branch type is enabled */
>>> +     if (!(branch_type & BRBE_ALLOWED_BRANCH_TYPES)) {
>>> +             pr_debug_once("no branch type enabled 0x%llx\n", branch_type);
>>> +             return false;
>>> +     }
>>> +
>>> +     /*
>>> +      * No branches are recorded in guests nor nVHE hypervisors, so
>>> +      * excluding the host or both kernel and user is invalid.
>>> +      *
>>> +      * Ideally we'd just require exclude_guest and exclude_hv, but setting
>>> +      * event filters with perf for kernel or user don't set exclude_guest.
>>> +      * So effectively, exclude_guest and exclude_hv are ignored.
>>> +      */
>>> +     if (event->attr.exclude_host || (event->attr.exclude_user && event->attr.exclude_kernel))
>>> +             return false;
>>
>> Is there a reason to do the pr_debugs for the two cases above, but not
>> for the remaining ones? Seems like it should be all or nothing.
> 
> Shrug. Anshuman wrote the pr_debugs. I wrote this part. Honestly, I
> don't know why you'd want them only once if they are gated off by
> debug. I guess since other cases of rejecting events outside this
> function have pr_debug() we should do the same here.
> 
>>> +
>>> +     /*
>>> +      * Require that the event filter and branch filter permissions match.
>>> +      *
>>> +      * The event and branch permissions can only mismatch if the user set
>>> +      * at least one of the privilege branch filters in PERF_SAMPLE_BRANCH_PLM_ALL.
>>> +      * Otherwise, the core will set the branch sample permissions in
>>> +      * perf_copy_attr().
>>> +      */
>>> +     if ((event->attr.exclude_user != !(branch_type & PERF_SAMPLE_BRANCH_USER)) ||
>>> +         (event->attr.exclude_kernel != !(branch_type & PERF_SAMPLE_BRANCH_KERNEL)) ||
>>
>> I don't think this one is right. By default perf_copy_attr() copies the
>> exclude_ settings into the branch settings so this works, but if the
>> user sets any _less_ permissive branch setting this fails. For example:
>>
>>    # perf record -j any,u -- true
>>    Error:
>>    cycles:PH: PMU Hardware or event type doesn't support branch stack
>>    sampling.
>>
>> Here we want the default sampling permissions (exclude_kernel == 0,
>> exclude_user == 0), but only user branch records, which doesn't match.
>> It should be allowed because it doesn't include anything that we're not
>> allowed to see.
> 
> I know it is allowed(on x86), but why would we want that? If you do
> something even more restricted:
> 
> perf record -e cycles:k -j any,u -- true
> 
> That's allowed on x86 and gives you samples with user addresses. But
> all the events happened in the kernel. How does that make any sense?
> 
> I suppose in your example, we could avoid attaching branch stack on
> samples from the kernel. However, given how my example works, I'm
> pretty sure that's not what x86 does.
> 
> There's also combinations that are allowed, but record no samples.
> Though I think that was with guest events. I've gone with reject
> non-sense combinations as much as possible. We can easily remove those
> restrictions later if needed. Changing the behavior later (for the
> same configuration) wouldn't be good.
> 
> 

Rejecting ones that produce no samples is fair enough, but my example 
does produce samples. To answer the question "why would we want that?", 
nothing major, but there are a few small reasons:

  * Perf includes both user and kernel by default, so the shortest
    command to only gather user branches doesn't work (-j any,u)
  * The test already checks for branch stack support like this, so old
    Perf test versions don't work
  * You might only be optimising userspace, but still interested in the
    proportion of time spent or particular place in the kernel
  * Consistency with existing implementations and for people porting
    existing tools to Arm
  * It doesn't cost anything to support it (I think we just
    only check if exclude_* is set rather than !=)
  * Permissions checks should be handled by the core code so that
    they're consistent
  * What's the point of separate branch filters anyway if they always
    have to match the event filter?

Some of these things could be fixed in Perf, but not in older versions. 
Even if we can't think of a real use case now, it doesn't sound like the 
driver should be so restrictive of an option that doesn't do any harm.

>> This also makes the Perf branch test skip because it uses
>> any,save_type,u to see if BRBE exists.
> 
> Yes, I plan to update that if we keep this behavior.
> 
>>> +         (!is_kernel_in_hyp_mode() &&
>>> +          (event->attr.exclude_hv != !(branch_type & PERF_SAMPLE_BRANCH_HV))))
>>> +             return false;
>>> +
>>> +     event->hw.branch_reg.config = branch_type_to_brbfcr(event->attr.branch_sample_type);
>>> +     event->hw.extra_reg.config = branch_type_to_brbcr(event->attr.branch_sample_type);
>>> +
>>> +     return true;
>>> +}
>>> +
>> [...]
>>> +static const int brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXIT + 1][2] = {
>>> +     [BRBINFx_EL1_TYPE_DIRECT_UNCOND] = { PERF_BR_UNCOND, 0 },
>>
>> Does the second field go into 'new_type'? They all seem to be zero so
>> I'm not sure why new_type isn't ignored instead of having it mapped.
> 
> Well, left over from when all the Arm specific types were supported.
> So yeah, that can be simplified.
> 
>>> +     [BRBINFx_EL1_TYPE_INDIRECT] = { PERF_BR_IND, 0 },
>>> +     [BRBINFx_EL1_TYPE_DIRECT_LINK] = { PERF_BR_CALL, 0 },
>>> +     [BRBINFx_EL1_TYPE_INDIRECT_LINK] = { PERF_BR_IND_CALL, 0 },
>>> +     [BRBINFx_EL1_TYPE_RET] = { PERF_BR_RET, 0 },
>>> +     [BRBINFx_EL1_TYPE_DIRECT_COND] = { PERF_BR_COND, 0 },
>>> +     [BRBINFx_EL1_TYPE_CALL] = { PERF_BR_CALL, 0 },
>>> +     [BRBINFx_EL1_TYPE_ERET] = { PERF_BR_ERET, 0 },
>>> +     [BRBINFx_EL1_TYPE_IRQ] = { PERF_BR_IRQ, 0 },
>>
>> How do ones that don't map to anything appear in Perf? For example
>> BRBINFx_EL1_TYPE_TRAP is missing, and the test that was attached to the
>> previous versions fails because it doesn't see the trap that jumps to
>> the kernel, but it does still see the ERET back to userspace:
>>
>>     [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
>>
>> In older versions we'd also have BRBINFx_EL1_TYPE_TRAP mapping to
>> PERF_BR_SYSCALL so you could see it go into the kernel before the return:
>>
>>     trap_bench+0x1C/[unknown]/-/-/-/0/SYSCALL/-
>>     [unknown]/trap_bench+0x20/-/-/-/0/ERET/-
> 
> My read of that was we should see a CALL in this case. Whether SVC
> generates a TRAP or CALL depends on HFGITR_EL2.SVC_EL0 (table D18-2).
> I assumed "SVC due to HFGITR_EL2.SVC_EL0" means when SVC_EL0 is set
> (and set has additional conditions). We have SVC_EL0 cleared, so that
> should be a CALL. Maybe the FVP has this wrong?
> 

The test is doing this rather than a syscall:

   asm("mrs %0, ID_AA64ISAR0_EL1" : "=r" (val));   /* TRAP + ERET */

So I think trap is right. Whether that should be mapped to SYSCALL or 
some other branch type I don't know, but the point is that it's missing now.


