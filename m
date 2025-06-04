Return-Path: <linux-doc+bounces-48155-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC325ACE5A2
	for <lists+linux-doc@lfdr.de>; Wed,  4 Jun 2025 22:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 375D5189B76B
	for <lists+linux-doc@lfdr.de>; Wed,  4 Jun 2025 20:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1740522FE02;
	Wed,  4 Jun 2025 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j/vQ3yr+"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA322B8A9
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 20:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067851; cv=none; b=DyPZ6gpQOD3zRpDMlBRHsFzG6j1C1U0BORyIZywv0cyMHBQQ6ti1Z3edJLnPuIPvGznwh6hdDxVusCPQPGkgCEdaOS53fiRPiR53mNM4ccedMx8SdxGb4VON7XuitBcZ6qNrt7nWme6X7DhBSiDfIJwaPWHsJUNq+MpERLwgUYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067851; c=relaxed/simple;
	bh=mS4fz7cgO9m1HSXc8SA6kSBVkdgVjgUeW9KFvTjpWvk=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=hUa4yrCtYIvls3EdG38DNVGWTH10eyHLPNtWs4fNm7JRrxO6IIi2HVybA3lRZdZ4rdb9oddy1KvIUxo587u3iYbWaxvcTHxfNtMLTJKiDMaBHDMWG2mC0jKudK9LN81tXyolTuzC7asoerNMziMD8jMbRjoOsYPCVVz2O7E1RKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j/vQ3yr+; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3ddb4dcebfaso4764055ab.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749067848; x=1749672648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0gzEZMaKBz+geZl5pxHGq7kFzj0QyinBj1xrmpUWk4=;
        b=j/vQ3yr+c0Qu7EdPzMYn3NKNhi1yp0gPzMpyng81GqmpwUFHaYeZKjAAMM1v6eD4b8
         WLzWeJD3o4R6iBybZ6o0CdVHLh9p71HyzkWKYl5lV0+n2T9gNu62Ti5EJxcceqq1QUbU
         TLgJpMOSvAVYOKPpVBzAPEr1gxrAb/HIrebUKawbuxLfrbwYOQ/JMQ/j4NDhwBGkoafg
         3geVMCu/hRsYt7UDnDdkAfPpplVqD/NuWhTAfvS8DYNBSX+IR86CkuNEAG7zjzTHlL6d
         p/kQ47K5GEfMvxtfnXnf5kUknQxj/xHdAGDMzrPoJgnfgs5Dd2GchdBzmYBlr5FrddZV
         CBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067848; x=1749672648;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0gzEZMaKBz+geZl5pxHGq7kFzj0QyinBj1xrmpUWk4=;
        b=Y1wZoR6m9RyW6UUBb+krpXOiMYChi7Ij7i0GjfPAXZaWi42NqNL9QpcwEZ9CiZ7vA1
         pKR0R/7G053xGGE+YGXatkS0399ohzFUBrWAkpuQxAQsNR15bwwNZ89Tu3Xubeb5pEa4
         bm4WWArwwwjbBKtuQkIOYIiT1UbTETBBencI8fvdT313DsQVKbTt5AkWxFlh6GUJ1S6w
         syv9vRQn3dtqATuWnWR82MJm6O/DoYod/sT4wlXutxvPE27+jJVfEWY5P7Tf5BBMBepl
         OadyVlAFuhvV4PL69BkbWDhBRVc7e3+B3i3SNJjXnyqNmxeaZd//4CxizSm8jEuygnOv
         FoVw==
X-Forwarded-Encrypted: i=1; AJvYcCUwCekPLlRkneFIjS64wKzwxN2xDSh/pTA0z9rwcx2LvUCeWWeF+1JKMskRHCLdKaY5viWVRFWD7i8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS4EIZzj0u6EQohoGMaftrrs5niUB3jh87NaAhFjQhDZkRVitl
	SxWY90cnhSLD5k1fry4p3mXqneMM6F/BLNSl2k8hkMS+Q78N2EmSDoVpPXzVn9Z3MEROEBEP/ZQ
	1V/oAG7He6588IPHqirTfv69TpA==
X-Google-Smtp-Source: AGHT+IEebJ+gdBmXEWqe1Fe3czqgQNBwW10WesxaqzS4IgnDmyZIhGpgkmk6gkpNi9jz//MbXeTmhCWS5OjtRGNtmg==
X-Received: from ilfj26.prod.google.com ([2002:a05:6e02:221a:b0:3dd:7629:ec3a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3e06:b0:3dc:87c7:a5b5 with SMTP id e9e14a558f8ab-3ddbfc344efmr50438865ab.3.1749067847917;
 Wed, 04 Jun 2025 13:10:47 -0700 (PDT)
Date: Wed, 04 Jun 2025 20:10:47 +0000
In-Reply-To: <aD91vp8QXdIjs1Nh@linux.dev> (message from Oliver Upton on Tue, 3
 Jun 2025 15:22:54 -0700)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntqzzz1d4o.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 10/17] KVM: arm64: Writethrough trapped PMEVTYPER register
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jun 02, 2025 at 07:26:55PM +0000, Colton Lewis wrote:
>> With FGT in place, the remaining trapped registers need to be written
>> through to the underlying physical registers as well as the virtual
>> ones. Failing to do this means delaying when guest writes take effect.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kvm/sys_regs.c | 27 +++++++++++++++++++++++++--
>>   1 file changed, 25 insertions(+), 2 deletions(-)

>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index d368eeb4f88e..afd06400429a 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/printk.h>
>>   #include <linux/uaccess.h>
>>   #include <linux/irqchip/arm-gic-v3.h>
>> +#include <linux/perf/arm_pmu.h>
>>   #include <linux/perf/arm_pmuv3.h>

>>   #include <asm/arm_pmuv3.h>
>> @@ -942,7 +943,11 @@ static bool pmu_counter_idx_valid(struct kvm_vcpu  
>> *vcpu, u64 idx)
>>   {
>>   	u64 pmcr, val;

>> -	pmcr = kvm_vcpu_read_pmcr(vcpu);
>> +	if (kvm_vcpu_pmu_is_partitioned(vcpu))
>> +		pmcr = read_pmcr();

> Reading PMCR_EL0 from EL2 is not going to have the desired effect.
> PMCR_EL0.N only returns HPMN when read from the guest.

Okay. I'll change that.

>> +	else
>> +		pmcr = kvm_vcpu_read_pmcr(vcpu);
>> +
>>   	val = FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
>>   	if (idx >= val && idx != ARMV8_PMU_CYCLE_IDX) {
>>   		kvm_inject_undefined(vcpu);
>> @@ -1037,6 +1042,22 @@ static bool access_pmu_evcntr(struct kvm_vcpu  
>> *vcpu,
>>   	return true;
>>   }

>> +static void writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct  
>> sys_reg_params *p,
>> +				   u64 reg, u64 idx)
>> +{
>> +	u64 evmask = kvm_pmu_evtyper_mask(vcpu->kvm);
>> +	u64 val = p->regval & evmask;
>> +
>> +	__vcpu_sys_reg(vcpu, reg) = val;
>> +
>> +	if (idx == ARMV8_PMU_CYCLE_IDX)
>> +		write_pmccfiltr(val);
>> +	else if (idx == ARMV8_PMU_INSTR_IDX)
>> +		write_pmicfiltr(val);
>> +	else
>> +		write_pmevtypern(idx, val);
>> +}
>> +

> How are you preventing the VM from configuring an event counter to count
> at EL2?

I had thought that's what kvm_pmu_evtyper_mask() did since masking with
that is what kvm_pmu_set_counter_event_type() writes to the vCPU register.

> I see that you're setting MDCR_EL2.HPMD (which assumes FEAT_PMUv3p1) but
> due to an architecture bug there's no control to prohibit the cycle
> counter until FEAT_PMUv3p5 (MDCR_EL2.HCCD).

I'll fix that.

> Since you're already trapping PMCCFILTR you could potentially configure
> the hardware value in such a way that it filters EL2.

Sure.

>>   static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct  
>> sys_reg_params *p,
>>   			       const struct sys_reg_desc *r)
>>   {
>> @@ -1063,7 +1084,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu  
>> *vcpu, struct sys_reg_params *p,
>>   	if (!pmu_counter_idx_valid(vcpu, idx))
>>   		return false;

>> -	if (p->is_write) {
>> +	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
>> +		writethrough_pmevtyper(vcpu, p, reg, idx);

> What about the vPMU event filter?

I'll check that too.

>> +	} else if (p->is_write) {
>>   		kvm_pmu_set_counter_event_type(vcpu, p->regval, idx);
>>   		kvm_vcpu_pmu_restore_guest(vcpu);
>>   	} else {
>> --
>> 2.49.0.1204.g71687c7c1d-goog


> Thanks,
> Oliver

