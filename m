Return-Path: <linux-doc+bounces-95363-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0fUYIcv3TGoOswEAu9opvQ
	(envelope-from <linux-doc+bounces-95363-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 14:57:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C871B96F
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 14:57:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=rsg.ci.i.u-tokyo.ac.jp header.s=rs20250326 header.b=R81RxZKK;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=u-tokyo.ac.jp (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95363-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95363-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57BDD315DC36
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3753F86E0;
	Tue,  7 Jul 2026 12:53:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23C63ECBEB;
	Tue,  7 Jul 2026 12:53:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428815; cv=none; b=TeTL0flOQ9Bq7ol1AI3U5Ta7m/mnBrRSu1uvIGhcYYK2rL7J6vGRDiDInAlhs3gg1Q377ybX6xisWxasHwo0BYPzH1uz8+0OknubSbhGsDrqRvU3jK17OAyyjxm4GmQY8vgeH1cSXN21EUg0J3wXIkLrLmfEEGh1tqsaaDTZ7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428815; c=relaxed/simple;
	bh=Xb+YqBjRz0qD+o6CKIOqq56fPsxW6/yG2jq8gj08s6w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sIiYPtktC28V2vXOiSFSCh7sdGQDcFwifdlCrMNxJ4Pv1+Kib1bC0vJ1GocWEnll6zoWqhfRHPx949C9HuutD51UWtDk0F9iqChTodQpj5fyeM5UPQqOHBfhJLlFh0D5YPz44bPliqItTlFgs6B2Ln7UYCMBykWx+C0N46kkznM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp; dkim=fail (0-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=R81RxZKK reason="key not found in DNS"; arc=none smtp.client-ip=49.212.243.89
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 667Cqolx003077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 7 Jul 2026 21:52:50 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=Q8mzB5h+eiRPcyM+Q6UnMUdYQq5QX0PPqK6QKz/gjn8=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783428770; v=1;
        b=R81RxZKKr830m5okZVbuAUx4R8H9TjeZgWqeLdmsDWICaaofU7CAqfRjVh3fvZD3
         mrliymgWKokZgwSB89BSujTeGSgjgItUFlZ9M/0gs0AnaVlRp91/oo2sR+MHyrRE
         u/iC4N79tmrHs+w/SIt3Sqt8TuyTZQpZf0Mkvwea9OXeOiS6J2KTyJE2gN2hjwRU
         G5EVKOY9d3cqJ2LUpgO0t9O8tlPEaetmyhzQxG/P8NrievxGEtr5Nqjr1/75WN2J
         kc4fCJhY3PMJKabOSTXG+qkwTxV6xFS6PmaWS1iBzxNRPqn7Wj8u5ZNaOoX/+aDE
         xixulSsKGWtekmOPgcjeWg==
Message-ID: <5e66748a-bfda-41a9-8614-88cbf2fe1f09@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 7 Jul 2026 21:52:49 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] KVM: arm64: PMU: Implement fixed-counters-only
 emulation
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-5-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvyvclUQ2b2YHiU@kernel.org>
 <cb5d5f13-a1a9-47dd-a717-5533a8b32b20@rsg.ci.i.u-tokyo.ac.jp>
Content-Language: en-US
In-Reply-To: <cb5d5f13-a1a9-47dd-a717-5533a8b32b20@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95363-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:oupton@kernel.org,m:maz@kernel.org,m:joey.gouly@arm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:kvmarm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devel@daynix.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rsg.ci.i.u-tokyo.ac.jp:mid,rsg.ci.i.u-tokyo.ac.jp:from_mime,u-tokyo.ac.jp:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A62C871B96F

On 2026/07/07 20:23, Akihiko Odaki wrote:
> On 2026/07/07 3:23, Oliver Upton wrote:
>> On Mon, Jul 06, 2026 at 07:03:28PM +0900, Akihiko Odaki wrote:
>>> Add internal state for PMUv3 emulation without programmable event
>>> counters. When fixed-counters-only mode is active, KVM reports no
>>> programmable counters and hides PMCEID, avoiding event-counter state
>>> whose behavior can depend on the selected hardware PMU.
>>>
>>> The cycle counter still uses a host perf event. Unlike the normal PMU
>>> path, fixed-counters-only mode may create that event from the hardware
>>> PMU attached to the VCPU's current pCPU. If the VCPU later loads on a
>>> pCPU that is not covered by the existing event's PMU, request a PMU
>>> reload so the cycle counter can be recreated against the new pCPU's PMU.
>>> Keep this affinity check limited to fixed-counters-only VMs; the normal
>>> programmable-counter mode continues to use the VM-wide PMU and does not
>>> need per-load reload decisions.
>>>
>>> Add a separate internal flag for explicit userspace PMU selection. The
>>> UAPI wiring added later will use it to keep explicit PMU selection and
>>> fixed-counters-only mode mutually exclusive while still allowing
>>> fixed-counters-only mode to replace the default PMU selected during
>>> KVM_ARM_VCPU_INIT.
>>>
>>> The UAPI wiring that sets the fixed-counters-only flag and records
>>> explicit PMU selection is added later in the series.
>>>
>>> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>>> ---
>>>   arch/arm64/include/asm/kvm_host.h |  4 ++++
>>>   arch/arm64/kvm/arm.c              |  1 +
>>>   arch/arm64/kvm/pmu-emul.c         | 43 ++++++++++++++++++++++++++++ 
>>> +++++++++--
>>>   include/kvm/arm_pmu.h             |  2 ++
>>>   4 files changed, 48 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/ 
>>> asm/kvm_host.h
>>> index 0c39d9db7d57..aa07b05b8231 100644
>>> --- a/arch/arm64/include/asm/kvm_host.h
>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>> @@ -353,6 +353,10 @@ struct kvm_arch {
>>>   #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS        10
>>>       /* Unhandled SEAs are taken to userspace */
>>>   #define KVM_ARCH_FLAG_EXIT_SEA                11
>>> +    /* PMUv3 is emulated with an explicitly specified hardware PMU */
>>> +#define KVM_ARCH_FLAG_PMU_V3_EXPLICIT            12
>>> +    /* PMUv3 is emulated without progammable event counters */
>>> +#define KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY    13
>>>       unsigned long flags;
>>>       /* VM-wide vCPU feature set */
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index 68767bb08285..1cc7754d5ace 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -687,6 +687,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, 
>>> int cpu)
>>>       if (has_vhe())
>>>           kvm_vcpu_load_vhe(vcpu);
>>>       kvm_arch_vcpu_load_fp(vcpu);
>>> +    kvm_vcpu_load_pmu(vcpu);
>>>       kvm_vcpu_pmu_restore_guest(vcpu);
>>>       if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>>>           kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>>> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
>>> index e70628653e4b..40cad183376c 100644
>>> --- a/arch/arm64/kvm/pmu-emul.c
>>> +++ b/arch/arm64/kvm/pmu-emul.c
>>> @@ -96,6 +96,11 @@ u64 kvm_pmu_evtyper_mask(struct kvm *kvm)
>>>       return mask;
>>>   }
>>> +static bool kvm_pmu_fixed_counters_only(struct kvm *kvm)
>>> +{
>>> +    return test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &kvm- 
>>> >arch.flags);
>>> +}
>>> +
>>>   /**
>>>    * kvm_pmc_is_64bit - determine if counter is 64bit
>>>    * @pmc: counter context
>>> @@ -343,7 +348,11 @@ u64 kvm_pmu_implemented_counter_mask(struct 
>>> kvm_vcpu *vcpu)
>>>   static void kvm_pmc_enable_perf_event(struct kvm_pmc *pmc)
>>>   {
>>> -    if (!pmc->perf_event) {
>>> +    struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>>> +
>>> +    if (!pmc->perf_event ||
>>> +        (kvm_pmu_fixed_counters_only(vcpu->kvm) &&
>>> +         !cpumask_test_cpu(vcpu->cpu, &to_arm_pmu(pmc->perf_event- 
>>> >pmu)->supported_cpus))) {
>>>           kvm_pmu_create_perf_event(pmc);
>>>           return;
>>>       }
>>> @@ -720,6 +729,12 @@ static void kvm_pmu_create_perf_event(struct 
>>> kvm_pmc *pmc)
>>>       int eventsel;
>>>       u64 evtreg;
>>> +    if (kvm_pmu_fixed_counters_only(vcpu->kvm)) {
>>> +        arm_pmu = kvm_pmu_probe_armpmu(vcpu->cpu);
>>> +        if (WARN_ON_ONCE(!arm_pmu))
>>> +            return;
>>> +    }
>>> +
>>>       evtreg = kvm_pmc_read_evtreg(pmc);
>>>       kvm_pmu_stop_counter(pmc);
>>> @@ -748,7 +763,7 @@ static void kvm_pmu_create_perf_event(struct 
>>> kvm_pmc *pmc)
>>>        * Don't create an event if we're running on hardware that 
>>> requires
>>>        * PMUv3 event translation and we couldn't find a valid mapping.
>>>        */
>>> -    eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
>>> +    eventsel = kvm_map_pmu_event(arm_pmu, eventsel);
>>>       if (eventsel < 0)
>>>           return;
>>> @@ -878,6 +893,9 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, 
>>> bool pmceid1)
>>>       u64 val, mask = 0;
>>>       int base, i, nr_events;
>>> +    if (kvm_pmu_fixed_counters_only(vcpu->kvm))
>>> +        return 0;
>>> +
>>
>> Even if we advertise bits in PMCEID, does it matter? There's no PMC that
>> the guest could use to count it.
>>
>> I understand it isn't aesthetic but I really want to minimize the
>> special-casing that has to be done for this feature.
> 
> This strictly ensures that sysregs are stable after migrating across 
> physical CPUs, which may have different PMCEID values.
> 
>>
>>> +void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu)
>>> +{
>>> +    /*
>>> +     * ARMV8_PMU_INSTR_IDX will need the same check once
>>> +     * FEAT_PMUv3_ICNTR is supported.
>>> +     */
>>> +    struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, 
>>> ARMV8_PMU_CYCLE_IDX);
>>> +    struct arm_pmu *cpu_pmu;
>>> +
>>> +    if (!kvm_pmu_fixed_counters_only(vcpu->kvm) ||
>>> +        !kvm_pmu_counter_is_enabled(pmc) || !pmc->perf_event)
>>> +        return;
>>> +
>>> +    cpu_pmu = to_arm_pmu(pmc->perf_event->pmu);
>>> +    if (!cpumask_test_cpu(vcpu->cpu, &cpu_pmu->supported_cpus))
>>> +        kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
>>
>> Just detect the changing PMU implementation here, KVM_REQ_RELOAD_PMU
>> will need to detect the PMCs that require an update anyway. Stash the
>> last cpu in kvm_arch_vcpu_load() and pass it to this:
>>
>> void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu)
>> {
>>     if (!kvm_pmu_fixed_counters_only(vcpu->kvm) || vcpu->cpu == last_cpu)
>>         return;
>>
>>     if (kvm_pmu_probe_armpmu(vcpu->cpu) != 
>> kvm_pmu_probe_armpmu(last_cpu))
>>         kvm_make_request(KVM_REQ_RELOAD_PMU);
>> }
> 
> It is a nice way to simplify the code and to avoid hardcoding 
> ARMV8_PMU_INSTR_IDX. I'll use the code for the next version.

I tried this but unfortunately it doesn't seem to work. 
kvm_arch_vcpu_put() sets vcpu->cpu to -1 so we cannot simply read it to 
get the last cpu in kvm_arch_vcpu_load().

Regards,
Akihiko Odaki

