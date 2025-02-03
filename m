Return-Path: <linux-doc+bounces-36678-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 456EFA2609C
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 17:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ADFC1882828
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 16:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C22A20B7F4;
	Mon,  3 Feb 2025 16:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/BkCABa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9720B7E2
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601610; cv=none; b=Hg4gV3HWch3vCGfhwhX9O9sLbtFAFVREzgPZeyCSlPXpZy9r7Dl/cRRsPsiMSqtPuZoPGuP++wBAnw5WNNZF1eNtjHrs8Rc4SrlnL3ew8TKq3aXkzDr6y8XiwjR/50U321qvHwzgJbVwgOaY79URhKqd6/nilBDIHmfJvsK7nxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601610; c=relaxed/simple;
	bh=Ds3byfJ1AO/me1YGgn0bfmISNCYdk+XEEOHYxRIkGig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/9Iy2b+p8UusHFezWujNbS5E8op2hschXuiP7wBKJwiAqqNq4GG/0Vfnx+7TOdzD4ehAiJMtmwJ0JoqaJT0eTbxRL4pZMIOZKt8TnCwkwly7QlTC3v2UiyCMZntfj05gK6smNgZ8LKGvZizIurptcQE4yX80V8qZxZG8rIExVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/BkCABa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436a03197b2so32017055e9.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 08:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738601605; x=1739206405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+J7eNNBUeiMaQBqhywmdHOLp8ZXQuDa6JlgRioEAbqY=;
        b=u/BkCABaTZ9jHQi+RjdV0O44BhmkYWmRurmdT+3ylQGRbKQhHeenWRpo4QxRrvzgJt
         21xy9ZMTdpAnTdQPLEo5fldiTQH7mOX1xFajJ6S4dBpmer3eU25v1ywc/KuXGR48zO4+
         49tWJfMjA5u46R4jRk22B3pXQMMD1iu/qYWJUrTH4Y+gdipZ38y+y0+pPZa346lnqraP
         iyZUR7fb/SHC07l5hKi2ZkTfm3+bfdtOdHvsFr4WT1pSLFBCAAjOKWtN0sRTYbH+9jFQ
         duXzDnzi54a2pRK+HimwbC0BNZDGFfHTXuDS1RH9SUNinEP6sOprdVDHOlRNeG3zmAaj
         Oyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601605; x=1739206405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+J7eNNBUeiMaQBqhywmdHOLp8ZXQuDa6JlgRioEAbqY=;
        b=AKP2Vsn4ELOJyF5IglrjhcE6MXZA6s+ISMK6OA6gbpszFDzkqh2j6pA/tJdojKHqxr
         EbOeTmttUu4wA4/BwwCxNR0Gx5HFqvQ/JVjYQeumQ0ccjJiOKC5wAExRw4CZixZyBR3K
         nqkEJe4pxdMjreggr/ZbU3YtuMmJfCH/qZ+mXDZ3hz42pAxPn/Gxy98Cq1556nhZoN0B
         u0ksJnNgO7CQLKrUk3Q1yLDVhLBwwY0T0jYad1vodMMjb9xWS4rJsEcUxhopTpZWW/yn
         bZOm3NviOU4IWZLjza9lWqVu367y4V+XTwXof2N01ePivYOQN29/SASrBJjVWPytsK5V
         DA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQmcbIU66fZj6vIiJ0PTV9MvVlt8YTtI6JVXxuCQFhDOw0EHDpX8xW50nlfE0aieegHX02NJukHM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcQ1zTNieqDCpUye6dI7wQpR0wyc5+hFEFnk7SGeIckDjh4lq
	go+QZuk8ZqwBINpiGRPkFqnPME1zDWzfSAw1xEjAb1NuEWHXwFASB+Rb7mK/NyvCGtuU98TckTu
	Wvdc=
X-Gm-Gg: ASbGncvOmvpAWQjbRYQIXPmIae0eWdKzbB5Ovz/Jku1fOfBNt8H6ay/IKKlHcdd0HfD
	YG2g7vfRRYHwtCB/2xyRCkus1OGadVlZgaNfNACpUSlSuwKeQJb6BhmB0Z/QB19JcMh2fv6C7J1
	Z0GOE+xQ7Htdc8tl4YRV2plVN7p9KzTLBJ4nRLrybCBVS46z1rh0Xh4RjKsNdIu6AFws7A/ad1A
	28HsFO21jTFh0cwWR4LNsCHSfTQaa7/prvHWL+AkWF8YV7IMg5yx168XqoIVBhNbh8i5wN67S2h
	RARFT7N6limelJ6Skm2kelfV9w==
X-Google-Smtp-Source: AGHT+IHxJH9l5LqfIsDIyvjJyxCpQmT/vQcNn/uwccEqM3EMsFvjUN+56zGNPlrlw+4whp1yttbLsQ==
X-Received: by 2002:a05:6000:401e:b0:38a:a083:9200 with SMTP id ffacd0b85a97d-38c520a3d4cmr21536417f8f.44.1738601605149;
        Mon, 03 Feb 2025 08:53:25 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc13202sm201309215e9.5.2025.02.03.08.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 08:53:24 -0800 (PST)
Message-ID: <0415d354-0c44-4fff-b92b-b0f5c9c72b11@linaro.org>
Date: Mon, 3 Feb 2025 16:53:23 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: "Rob Herring (Arm)" <robh@kernel.org>
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250202-arm-brbe-v19-v19-11-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 12:43 am, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> The ARMv9.2 architecture introduces the optional Branch Record Buffer
> Extension (BRBE), which records information about branches as they are
> executed into set of branch record registers. BRBE is similar to x86's
> Last Branch Record (LBR) and PowerPC's Branch History Rolling Buffer
> (BHRB).
> 
> BRBE supports filtering by exception level and can filter just the
> source or target address if excluded to avoid leaking privileged
> addresses. The h/w filter would be sufficient except when there are
> multiple events with disjoint filtering requirements. In this case, BRBE
> is configured with a union of all the events' desired branches, and then
> the recorded branches are filtered based on each event's filter. For
> example, with one event capturing kernel events and another event
> capturing user events, BRBE will be configured to capture both kernel
> and user branches. When handling event overflow, the branch records have
> to be filtered by software to only include kernel or user branch
> addresses for that event. In contrast, x86 simply configures LBR using
> the last installed event which seems broken.
> 
> The event and branch exception level filtering are separately
> controlled. On x86, it is possible to request filtering which is
> disjoint (e.g. kernel only event with user only branches). It is also
> possible on x86 to configure branch filter such that no branches are
> ever recorded (e.g. -j save_type). For BRBE, events with mismatched
> exception level filtering or a configuration that will result in no
> samples are rejected. This can be relaxed in the future if such a need
> arises.
> 
> The handling of KVM guests is similar to the above. On x86, branch
> recording is always disabled when a guest is running. However,
> requesting branch recording in guests is allowed. The guest events are
> recorded, but the resulting branches are all from the host. For BRBE,
> branch recording is similarly disabled when guest is running. In
> addition, events with branch recording and "exclude_host" set are
> rejected. Requiring "exclude_guest" to be set did not work. The default
> for the perf tool does set "exclude_guest" if no exception level
> options are specified. However, specifying kernel or user defaults to
> including both host and guest. In this case, only host branches are
> recorded.
> 
> BRBE can support some additional exception, FIQ, and debug branch
> types, but they are not supported currently. There's no control in the
> perf ABI to enable/disable these branch types, so they could only be
> enabled for the 'any' filter which might be undesired or unexpected.
> The other architectures don't have any support similar events (at least
> with perf). These can be added in the future if there is demand by
> adding additional specific filter types.
> 
> BRBE records are invalidated whenever events are reconfigured, a new
> task is scheduled in, or after recording is paused (and the records
> have been recorded for the event). The architecture allows branch
> records to be invalidated by the PE under implementation defined
> conditions. It is expected that these conditions are rare.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Co-developed-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v19:
> - Drop saving of branch records when task scheduled out. (Mark)
> - Got rid of added armpmu ops. All BRBE support contained within pmuv3
>    code.
> - Dropped armpmu.num_branch_records as reg_brbidr has same info.
> - Make sched_task() callback actually get called. Enabling requires a
>    call to perf_sched_cb_inc().
> - Fix freeze on overflow for VHE
> - The cycle counter doesn't freeze BRBE on overflow, so avoid assigning
>    it when BRBE is enabled.
> - Drop all the Arm specific exception branches. Not a clear need for
>    them.
> - Simplify enable/disable to avoid RMW and document ISBs needed
> - Fix handling of branch 'cycles' reading. CC field is
>    mantissa/exponent, not an integer.
> - Save BRBFCR and BRBCR settings in event->hw.branch_reg.config and
>    event->hw.extra_reg.config to avoid recalculating the register value
>    each time the event is installed.
> - Rework s/w filtering to better match h/w filtering
> - Reject events with disjoint event filter and branch filter
> - Reject events if exclude_host is set
> 
> v18: https://lore.kernel.org/all/20240613061731.3109448-6-anshuman.khandual@arm.com/
> ---
>   drivers/perf/Kconfig         |  11 +
>   drivers/perf/Makefile        |   1 +
>   drivers/perf/arm_brbe.c      | 794 +++++++++++++++++++++++++++++++++++++++++++
>   drivers/perf/arm_brbe.h      |  47 +++
>   drivers/perf/arm_pmu.c       |  15 +-
>   drivers/perf/arm_pmuv3.c     |  87 ++++-
>   include/linux/perf/arm_pmu.h |   8 +
>   7 files changed, 958 insertions(+), 5 deletions(-)
> 
[...]
> +bool brbe_branch_attr_valid(struct perf_event *event)
> +{
> +	u64 branch_type = event->attr.branch_sample_type;
> +
> +	/*
> +	 * Ensure both perf branch filter allowed and exclude
> +	 * masks are always in sync with the generic perf ABI.
> +	 */
> +	BUILD_BUG_ON(BRBE_PERF_BRANCH_FILTERS != (PERF_SAMPLE_BRANCH_MAX - 1));
> +
> +	if (branch_type & BRBE_EXCLUDE_BRANCH_FILTERS) {
> +		pr_debug_once("requested branch filter not supported 0x%llx\n", branch_type);
> +		return false;
> +	}
> +
> +	/* Ensure at least 1 branch type is enabled */
> +	if (!(branch_type & BRBE_ALLOWED_BRANCH_TYPES)) {
> +		pr_debug_once("no branch type enabled 0x%llx\n", branch_type);
> +		return false;
> +	}
> +
> +	/*
> +	 * No branches are recorded in guests nor nVHE hypervisors, so
> +	 * excluding the host or both kernel and user is invalid.
> +	 *
> +	 * Ideally we'd just require exclude_guest and exclude_hv, but setting
> +	 * event filters with perf for kernel or user don't set exclude_guest.
> +	 * So effectively, exclude_guest and exclude_hv are ignored.
> +	 */
> +	if (event->attr.exclude_host || (event->attr.exclude_user && event->attr.exclude_kernel))
> +		return false;

Is there a reason to do the pr_debugs for the two cases above, but not 
for the remaining ones? Seems like it should be all or nothing.

> +
> +	/*
> +	 * Require that the event filter and branch filter permissions match.
> +	 *
> +	 * The event and branch permissions can only mismatch if the user set
> +	 * at least one of the privilege branch filters in PERF_SAMPLE_BRANCH_PLM_ALL.
> +	 * Otherwise, the core will set the branch sample permissions in
> +	 * perf_copy_attr().
> +	 */
> +	if ((event->attr.exclude_user != !(branch_type & PERF_SAMPLE_BRANCH_USER)) ||
> +	    (event->attr.exclude_kernel != !(branch_type & PERF_SAMPLE_BRANCH_KERNEL)) ||

I don't think this one is right. By default perf_copy_attr() copies the 
exclude_ settings into the branch settings so this works, but if the 
user sets any _less_ permissive branch setting this fails. For example:

  # perf record -j any,u -- true
  Error:
  cycles:PH: PMU Hardware or event type doesn't support branch stack
  sampling.

Here we want the default sampling permissions (exclude_kernel == 0, 
exclude_user == 0), but only user branch records, which doesn't match. 
It should be allowed because it doesn't include anything that we're not 
allowed to see.

This also makes the Perf branch test skip because it uses 
any,save_type,u to see if BRBE exists.


> +	    (!is_kernel_in_hyp_mode() &&
> +	     (event->attr.exclude_hv != !(branch_type & PERF_SAMPLE_BRANCH_HV))))
> +		return false;
> +
> +	event->hw.branch_reg.config = branch_type_to_brbfcr(event->attr.branch_sample_type);
> +	event->hw.extra_reg.config = branch_type_to_brbcr(event->attr.branch_sample_type);
> +
> +	return true;
> +}
> +
[...]
> +static const int brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXIT + 1][2] = {
> +	[BRBINFx_EL1_TYPE_DIRECT_UNCOND] = { PERF_BR_UNCOND, 0 },

Does the second field go into 'new_type'? They all seem to be zero so 
I'm not sure why new_type isn't ignored instead of having it mapped.

> +	[BRBINFx_EL1_TYPE_INDIRECT] = { PERF_BR_IND, 0 },
> +	[BRBINFx_EL1_TYPE_DIRECT_LINK] = { PERF_BR_CALL, 0 },
> +	[BRBINFx_EL1_TYPE_INDIRECT_LINK] = { PERF_BR_IND_CALL, 0 },
> +	[BRBINFx_EL1_TYPE_RET] = { PERF_BR_RET, 0 },
> +	[BRBINFx_EL1_TYPE_DIRECT_COND] = { PERF_BR_COND, 0 },
> +	[BRBINFx_EL1_TYPE_CALL] = { PERF_BR_CALL, 0 },
> +	[BRBINFx_EL1_TYPE_ERET] = { PERF_BR_ERET, 0 },
> +	[BRBINFx_EL1_TYPE_IRQ] = { PERF_BR_IRQ, 0 },

How do ones that don't map to anything appear in Perf? For example 
BRBINFx_EL1_TYPE_TRAP is missing, and the test that was attached to the 
previous versions fails because it doesn't see the trap that jumps to 
the kernel, but it does still see the ERET back to userspace:

   [unknown]/trap_bench+0x20/-/-/-/0/ERET/-

In older versions we'd also have BRBINFx_EL1_TYPE_TRAP mapping to 
PERF_BR_SYSCALL so you could see it go into the kernel before the return:

   trap_bench+0x1C/[unknown]/-/-/-/0/SYSCALL/-
   [unknown]/trap_bench+0x20/-/-/-/0/ERET/-

> +};
> +
> +static void brbe_set_perf_entry_type(struct perf_branch_entry *entry, u64 brbinf)
> +{
> +	int brbe_type = brbinf_get_type(brbinf);
> +
> +	if (brbe_type <= BRBINFx_EL1_TYPE_DEBUG_EXIT) {
> +		const int *br_type = brbe_type_to_perf_type_map[brbe_type];
> +
> +		entry->type = br_type[0];
> +		entry->new_type = br_type[1];
> +	}
> +}
> +

[...]

> +	if (branch_sample & PERF_SAMPLE_BRANCH_ANY_RETURN) {
> +		set_bit(PERF_BR_RET, event_type_mask);
> +
> +		if (!event->attr.exclude_kernel)
> +			set_bit(PERF_BR_ERET, event_type_mask);

You could argue that ERET should be included even if exclude_kernel is 
set, otherwise you miss the point that you returned to in userspace and 
leave a gap in the program flow. See the trap and eret example above.

It looks like we still have the zeroing of the kernel address in this 
version if we only have userspace priviledge, so it should be fine to 
show the ERET and the target address.



