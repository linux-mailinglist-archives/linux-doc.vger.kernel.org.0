Return-Path: <linux-doc+bounces-52463-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971BAAFDB2F
	for <lists+linux-doc@lfdr.de>; Wed,  9 Jul 2025 00:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEDEB580525
	for <lists+linux-doc@lfdr.de>; Tue,  8 Jul 2025 22:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B43262D0C;
	Tue,  8 Jul 2025 22:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NOPqh5S5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D1621B9F1
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 22:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752014283; cv=none; b=qbh15WARrzwsESoHvOZ2tcmhacqH6CAsyarxVIkgoeag9WATJdtMkVKOu5oWy6ZNmCOPLgceYDa5l/Tx+pt0XvEHj7phblgmg2thXHB8Ij2+RV/nPUgptkMu4LAcXJxVqRphtRiTeVoCu8rnFu6Tm1u3kB6Hhl8sw3IQu4H5iys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752014283; c=relaxed/simple;
	bh=JeA7p4zwf/DPSRpqESrFUAw2jCwA0F9WYGz7M2Sgufs=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=avoivSCJQ4fm9cbsYYjCNT1/4xZnaDKt+KDgyQvquvZ5mUghpQLiutL1NkVGs/VovUv48O0DoTT7I2WFbdBFuP+91IbuTdVvmnTDn4vQkWLILipp+wgiCfTImjLyS7xR/JphAEKD8Wulz7LV7GIMK1yOWZELLEoFYE478NUA53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NOPqh5S5; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3ddd03db21cso86027755ab.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 15:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752014279; x=1752619079; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3fDXmd8Za9nT5CKATz2Yu/CxtGDvmK7u4P2JzL5Q1M=;
        b=NOPqh5S5IDJ2qBpJsEVVl1wcXO0KZD+cHHn8OgSPTJj9Eh/qdBQTaNaipBeqpvHjyI
         Tzr5C0jFY3xq8Y7ybztnLDA8GT90xwwNNNKecnaalr4B8vWsUTuSxmqyV3CM/3YX2Tmk
         /uGb17J/9vAX25PO1TMhKB0NEiI9z2cuQJDI6RSV03xF6AF+cQ9IFDne3bkpd3nBsryL
         7ucQwi3dxWunQlxRtcKTcQUsL7IfJO/YnTyHW6WTn5IsxVjxdzIKs1I7RcWgwGlUE0rU
         Ta5tJiZXxOqRNfO6/fEHZqkAanlSaG8fAcTR/eDHGkDYTg1LIrCYYsvclb2Tr3Mek61V
         T/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752014279; x=1752619079;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3fDXmd8Za9nT5CKATz2Yu/CxtGDvmK7u4P2JzL5Q1M=;
        b=FaAkJ68JOqwiAo+BalU5CbFsqfv0e1WfYn0gNEfLInzSHzl6iumpUS8j0Xjbl9fv72
         C1YjJ51e3gw7hxLlwRF4JPZ1H4XOybab/ot0sEHG3Ztfgv/B2P5p28DreDOawnDaxYZG
         7cQsfcgafsEqIjJ7MQDGsEVGYBtl9o1WJDFv0zZ9wKj3hz/aq0/46hCu7DwricABtyjx
         fhK2AVoYMpAUxwqPMOphqlh9HUPu9C2GI+Sk2zxkxIN0+jIpPOzKCvItaeYM3NPjeF2v
         iT7HsjcxIUjw3Lm2n6eCsL4sJMH5MKc/Wkc8EKZsvHah9z1EmO3gHG+X73jlkYEwtgLf
         E3eg==
X-Forwarded-Encrypted: i=1; AJvYcCWnI+SVNesD3iAzOxNsyMLox/7Fy5ci/GAUgH2kl4LRIVQkwyop0vH3+A13pnsiarmV6knA2m2EznY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA6BJk437/JuvjFslZgtJE/lKslacHHrAWTyl7kNbaDf517mSk
	reYiw8iBkktsCTmdVLBrtqaqYTkqz725w0eVWndQhlqNYaReeArU8RXVibARJA5xfff4RUT9b00
	wHIDG9wNEfMq1VlumRf0/vFjgbQ==
X-Google-Smtp-Source: AGHT+IGn06nCm9CZ+nzlG32HvMMbBVuhGSihb8VF+3WUu807Tfp1nhfGPv/rtrugveMa2wQtbIoPODa59ewzY1piAQ==
X-Received: from ilkk6.prod.google.com ([2002:a05:6e02:5e86:b0:3df:42dd:4aa6])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:380f:b0:3df:154d:aa5b with SMTP id e9e14a558f8ab-3e166ff0481mr5601765ab.5.1752014279704;
 Tue, 08 Jul 2025 15:37:59 -0700 (PDT)
Date: Tue, 08 Jul 2025 22:37:58 +0000
In-Reply-To: <aGvyFiyEEsMrhN0i@J2N7QTR9R3> (message from Mark Rutland on Mon,
 7 Jul 2025 17:13:10 +0100)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsnt1pqq1f7d.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 04/22] KVM: arm64: Cleanup PMU includes
From: Colton Lewis <coltonlewis@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Mark Rutland <mark.rutland@arm.com> writes:

> On Thu, Jun 26, 2025 at 08:04:40PM +0000, Colton Lewis wrote:
>> From: Marc Zyngier <maz@kernel.org>

>> Reorganize these tangled headers.

> In prior versions of this series, there was some earlier text explaining  
> that
> there was a circular header dependency. In v2:

>     
> https://lore.kernel.org/linux-arm-kernel/20250620221326.1261128-6-coltonlewis@google.com/

> ... it said:

> | asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
> | which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
> | causes compilation problems why trying to use anything defined in any
> | of the headers in any other headers.

> Was there some reason for dropping that? It's a bit odd to start without a
> problem statement.

When I rebased on top of kvm/queue, that included a patch from Sean that
changed the the problem. I thought I wrote a new description but I guess
not. I'll include in my next reroll.

The core issue is still that including *all* of kvm_host.h in
arm_pmuv3.h is a circular dependency.

asm/kvm_host.h includes asm/kvm_pmu.h includes perf/arm_pmuv3.h includes
asm/arm_pmuv3.h includes asm/kvm_host.h

Some other things in this patch are vestigial or needed later, so I
should put them in the patches where they are used.


>> * Respect the move defining the interface between KVM and PMU in its
>>    own header asm/kvm_pmu.h

>> * Define an empty struct arm_pmu so it is defined for those interface
>>    functions when compiling with CONFIG_KVM but not CONFIG_ARM_PMU

> Which functions in particular are those? What prevents them from  
> depending on
> CONFIG_ARM_PMU?

> Mark.

Functions I introduce later. So this hunk should be in a later patch if
I need to keep it.

bool kvm_pmu_is_partitioned(struct arm_pmu *pmu);
u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);

The first, at least, has to be called in non-PMU KVM code to check if we
can use my ioctl later.

I suppose in that case it's only calling a dummy definition that returns
false, so I don't need struct arm_pmu * in the argument and can just use
void *

>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/include/asm/arm_pmuv3.h      |  2 +-
>>   arch/arm64/include/asm/kvm_host.h       | 15 +--------------
>>   arch/arm64/include/asm/kvm_pmu.h        | 15 +++++++++++++++
>>   arch/arm64/kvm/debug.c                  |  1 +
>>   arch/arm64/kvm/hyp/include/hyp/switch.h |  1 +
>>   arch/arm64/kvm/pmu.c                    |  2 ++
>>   arch/arm64/kvm/sys_regs.c               |  1 +
>>   include/linux/perf/arm_pmu.h            |  5 +++++
>>   virt/kvm/kvm_main.c                     |  1 +
>>   9 files changed, 28 insertions(+), 15 deletions(-)

>> diff --git a/arch/arm64/include/asm/arm_pmuv3.h  
>> b/arch/arm64/include/asm/arm_pmuv3.h
>> index 8a777dec8d88..32c003a7b810 100644
>> --- a/arch/arm64/include/asm/arm_pmuv3.h
>> +++ b/arch/arm64/include/asm/arm_pmuv3.h
>> @@ -6,7 +6,7 @@
>>   #ifndef __ASM_PMUV3_H
>>   #define __ASM_PMUV3_H

>> -#include <asm/kvm_host.h>
>> +#include <asm/kvm_pmu.h>

>>   #include <asm/cpufeature.h>
>>   #include <asm/sysreg.h>
>> diff --git a/arch/arm64/include/asm/kvm_host.h  
>> b/arch/arm64/include/asm/kvm_host.h
>> index 27ed26bd4381..2df76689381a 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -14,6 +14,7 @@
>>   #include <linux/arm-smccc.h>
>>   #include <linux/bitmap.h>
>>   #include <linux/types.h>
>> +#include <linux/irq_work.h>
>>   #include <linux/jump_label.h>
>>   #include <linux/kvm_types.h>
>>   #include <linux/maple_tree.h>
>> @@ -1487,25 +1488,11 @@ void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu  
>> *vcpu);
>>   void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu);
>>   void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu);

>> -static inline bool kvm_pmu_counter_deferred(struct perf_event_attr  
>> *attr)
>> -{
>> -	return (!has_vhe() && attr->exclude_host);
>> -}
>> -
>>   #ifdef CONFIG_KVM
>> -void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
>> -void kvm_clr_pmu_events(u64 clr);
>> -bool kvm_set_pmuserenr(u64 val);
>>   void kvm_enable_trbe(void);
>>   void kvm_disable_trbe(void);
>>   void kvm_tracing_set_el1_configuration(u64 trfcr_while_in_guest);
>>   #else
>> -static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr  
>> *attr) {}
>> -static inline void kvm_clr_pmu_events(u64 clr) {}
>> -static inline bool kvm_set_pmuserenr(u64 val)
>> -{
>> -	return false;
>> -}
>>   static inline void kvm_enable_trbe(void) {}
>>   static inline void kvm_disable_trbe(void) {}
>>   static inline void kvm_tracing_set_el1_configuration(u64  
>> trfcr_while_in_guest) {}
>> diff --git a/arch/arm64/include/asm/kvm_pmu.h  
>> b/arch/arm64/include/asm/kvm_pmu.h
>> index baf028d19dfc..ad3247b46838 100644
>> --- a/arch/arm64/include/asm/kvm_pmu.h
>> +++ b/arch/arm64/include/asm/kvm_pmu.h
>> @@ -11,9 +11,15 @@
>>   #include <linux/kvm_types.h>
>>   #include <linux/perf_event.h>
>>   #include <linux/perf/arm_pmuv3.h>
>> +#include <linux/perf/arm_pmu.h>

>>   #define KVM_ARMV8_PMU_MAX_COUNTERS	32

>> +#define kvm_pmu_counter_deferred(attr)			\
>> +	({						\
>> +		!has_vhe() && (attr)->exclude_host;	\
>> +	})
>> +
>>   #if IS_ENABLED(CONFIG_HW_PERF_EVENTS) && IS_ENABLED(CONFIG_KVM)
>>   struct kvm_pmc {
>>   	u8 idx;	/* index into the pmu->pmc array */
>> @@ -68,6 +74,9 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
>>   int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);

>>   struct kvm_pmu_events *kvm_get_pmu_events(void);
>> +void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
>> +void kvm_clr_pmu_events(u64 clr);
>> +bool kvm_set_pmuserenr(u64 val);
>>   void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
>>   void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
>>   void kvm_vcpu_pmu_resync_el0(void);
>> @@ -161,6 +170,12 @@ static inline u64 kvm_pmu_get_pmceid(struct  
>> kvm_vcpu *vcpu, bool pmceid1)

>>   #define kvm_vcpu_has_pmu(vcpu)		({ false; })
>>   static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
>> +static inline void kvm_set_pmu_events(u64 set, struct perf_event_attr  
>> *attr) {}
>> +static inline void kvm_clr_pmu_events(u64 clr) {}
>> +static inline bool kvm_set_pmuserenr(u64 val)
>> +{
>> +	return false;
>> +}
>>   static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
>>   static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
>>   static inline void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu) {}
>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>> index 1a7dab333f55..a554c3e368dc 100644
>> --- a/arch/arm64/kvm/debug.c
>> +++ b/arch/arm64/kvm/debug.c
>> @@ -9,6 +9,7 @@

>>   #include <linux/kvm_host.h>
>>   #include <linux/hw_breakpoint.h>
>> +#include <linux/perf/arm_pmuv3.h>

>>   #include <asm/debug-monitors.h>
>>   #include <asm/kvm_asm.h>
>> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h  
>> b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> index 7599844908c0..825b81749972 100644
>> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
>> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
>> @@ -14,6 +14,7 @@
>>   #include <linux/kvm_host.h>
>>   #include <linux/types.h>
>>   #include <linux/jump_label.h>
>> +#include <linux/perf/arm_pmuv3.h>
>>   #include <uapi/linux/psci.h>

>>   #include <asm/barrier.h>
>> diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
>> index 6b48a3d16d0d..8bfc6b0a85f6 100644
>> --- a/arch/arm64/kvm/pmu.c
>> +++ b/arch/arm64/kvm/pmu.c
>> @@ -8,6 +8,8 @@
>>   #include <linux/perf/arm_pmu.h>
>>   #include <linux/perf/arm_pmuv3.h>

>> +#include <asm/kvm_pmu.h>
>> +
>>   static DEFINE_PER_CPU(struct kvm_pmu_events, kvm_pmu_events);

>>   /*
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 99fdbe174202..eaff6d63ef77 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/printk.h>
>>   #include <linux/uaccess.h>
>>   #include <linux/irqchip/arm-gic-v3.h>
>> +#include <linux/perf/arm_pmuv3.h>

>>   #include <asm/arm_pmuv3.h>
>>   #include <asm/cacheflush.h>
>> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
>> index 6dc5e0cd76ca..fb382bcd4f4b 100644
>> --- a/include/linux/perf/arm_pmu.h
>> +++ b/include/linux/perf/arm_pmu.h
>> @@ -187,6 +187,11 @@ void armpmu_free_irq(int irq, int cpu);

>>   #define ARMV8_PMU_PDEV_NAME "armv8-pmu"

>> +#else
>> +
>> +struct arm_pmu {
>> +};
>> +
>>   #endif /* CONFIG_ARM_PMU */

>>   #define ARMV8_SPE_PDEV_NAME "arm,spe-v1"
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index e2f6344256ce..25259fcf3115 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -48,6 +48,7 @@
>>   #include <linux/lockdep.h>
>>   #include <linux/kthread.h>
>>   #include <linux/suspend.h>
>> +#include <linux/perf_event.h>

>>   #include <asm/processor.h>
>>   #include <asm/ioctl.h>
>> --
>> 2.50.0.727.gbf7dc18ff4-goog


