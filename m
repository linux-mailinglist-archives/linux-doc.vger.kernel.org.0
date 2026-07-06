Return-Path: <linux-doc+bounces-95033-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AJUlEAE8S2oBOAEAu9opvQ
	(envelope-from <linux-doc+bounces-95033-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 07:24:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E83B70C91B
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 07:24:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=R6y6UZhE;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95033-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95033-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7BF4300FC78
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 05:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7313812F2;
	Mon,  6 Jul 2026 05:24:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A14358372;
	Mon,  6 Jul 2026 05:24:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315449; cv=none; b=gGhJ/ACRVSvlJmIOf5L10N9yJqCScXw96RGQAsk/+QNZSbAPIL8v33Rkt6oAT9gKvtA47fUQPlozI759pO1jJ4/XF5BQ0TH45YYB1LSwHs0120KPzZs0dbzPgze0YIHxj1fuvuaEgyB9Lr3WsUBx4XDAJj9DzOiY2Huee+PXu1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315449; c=relaxed/simple;
	bh=sTvxdnugF8/4fcHOaPl72YY8sFAFqQue4yk5uMeetnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGFC5G3oVEwBIG8yDdADgl9mu4yC2SKtdS3NYhG1VUiaRlax986BYwcOIlfNRF3N38btQDfAWg/jCkTmgqUV2IAUgTnHZHGvBs7vcnKDv5fyrQzQjtcegzlb7qrY9zg8Of20+A+8xftEiwEBjg6/GFlkNe5uOgip0kB09EGFSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=R6y6UZhE; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D6EC176A;
	Sun,  5 Jul 2026 22:23:55 -0700 (PDT)
Received: from [10.164.18.31] (unknown [10.164.18.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3482B3F7B4;
	Sun,  5 Jul 2026 22:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783315439; bh=sTvxdnugF8/4fcHOaPl72YY8sFAFqQue4yk5uMeetnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R6y6UZhEqJwc4uxNp8lZpIHR3saqCLog03rj13EybQfyBDF+jOzt6oOyzCoE0IIR5
	 ypNCuy6ljN+xir+nqd3sGmz1+H7YSavBWGHatgXQIfTytXbCiOionMJS15ZH57ncRH
	 5Wdjgy3IDuMXO+NShSX2ohKuRnZSHdNWrGPkDDsw=
Message-ID: <b0170580-eab9-44ae-a87b-d8e42d28ab1b@arm.com>
Date: Mon, 6 Jul 2026 10:53:54 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch: arm64: add early_param idle=<wfi|yield|nop>
To: Yureka Lilian <yureka@cyberchaos.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
References: <20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95033-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anshuman.khandual@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:yureka@cyberchaos.dev,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:asahi@lists.linux.dev,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anshuman.khandual@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E83B70C91B



On 05/07/26 3:32 PM, Yureka Lilian wrote:
> Overriding the idle mechanism might be useful for debugging, performance
> testing and on platforms where the WFI instruction misbehaves, such as
> Apple Silicon SoCs.

The commit message should have little more description given the proposed
code churn here e.g 'idle=' is not new but an existing kernel command line
parameter already being used on x86 platform and describe different values
it takes on arm64 platform.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Thanks to Will Daecon for suggesting this path, since, when treating the WFI
> misbehavior as an erratum, we had difficulties telling when the alternatives

This "why standard erratum method could not be used" should be mentioned along
with earlier discussion link in the commit message. Please add 'Suggested-by'.
> should be applied. This solution is more flexible and leaves it up to
> bootloader to add the appropriate idle= parameter as a workaround.

Please do mention this in commit message as well.

> --->  Documentation/admin-guide/kernel-parameters.txt | 23 ++++++++++++++++++
>  arch/arm64/kernel/idle.c                        | 31 +++++++++++++++++++++++--
>  arch/arm64/kernel/idle.h                        | 11 +++++++++
>  arch/arm64/lib/delay.c                          |  7 +++++-
>  4 files changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b2d7d3540ded..d7f5471edf8f 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2239,6 +2239,29 @@ Kernel parameters
>  
>  			idle=nomwait: Disable mwait for CPU C-states
>  
> +			[ARM64,EARLY]
> +			Format: idle=wfi, idle=yield, idle=nop
> +
> +			idle=wfi: Use the WFI (Wait For Interrupt) hint
> +			instruction in the idle loop. This is the default and
> +			allows the CPU to enter a low-power state until an
> +			interrupt arrives.
> +
> +			idle=yield: Use the YIELD hint instruction instead of
> +			WFI. CPUs supporting simultaneous multi-threading (SMT),
> +			can continue executing another thread when the current
> +			thread reaches the idle loop. This will make the CPUs
> +			eat more power, but may be useful to get slightly better
> +			performance in some applications, since the CPUs will
> +			not enter a low-power state.
> +
> +			idle=nop: Do not execute any idle instruction in the
> +			idle loop. This is useful on platforms where WFI
> +			misbehaves, leading to system instability or loss of CPU
> +			state. This will make the CPUs eat more power, but may
> +			give slightly better performance in some applications,
> +			since the CPUs will not enter a low-power state.
> +
>  	idxd.sva=	[HW]
>  			Format: <bool>
>  			Allow force disabling of Shared Virtual Memory (SVA)
> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
> index 05cfb347ec26..018bcc812d45 100644
> --- a/arch/arm64/kernel/idle.c
> +++ b/arch/arm64/kernel/idle.c
> @@ -11,6 +11,28 @@
>  #include <asm/cpufeature.h>
>  #include <asm/sysreg.h>
>  
> +#include "idle.h"
> +
> +enum idle_mode idle = WFI;
> +> +/* User can over-ride above with "idle=<wfi|yield|nop>" in cmdline */

This comment is redundant as the usage in mentioned in Documentation.
> +static int __init setup_idle(char *s)
> +{
> +	if (!s)

Small nit - renaming 's' as 'arg' or 'str' might be better I guess.
> +		return -1;
> +	else if (!strcmp(s, "wfi"))
> +		idle = WFI;
> +	else if (!strcmp(s, "yield"))
> +		idle = YIELD;
> +	else if (!strcmp(s, "nop"))
> +		idle = NOP;
> +	else
> +		return -1;
> +
> +	return 0;
> +}
> +early_param("idle", setup_idle);

Small nit - s/setup_idle/setup_arm64_idle/

> +
>  /*
>   *	cpu_do_idle()
>   *
> @@ -26,8 +48,13 @@ void __cpuidle cpu_do_idle(void)
>  
>  	arm_cpuidle_save_irq_context(&context);
>  
> -	dsb(sy);
> -	wfi();
> +	if (likely(idle == WFI)) {
> +		dsb(sy);
> +		wfi();
> +	} else if (idle == YIELD) {
> +		dsb(sy);
> +		asm volatile("yield" ::: "memory");
> +	}
>  
>  	arm_cpuidle_restore_irq_context(&context);
>  }
> diff --git a/arch/arm64/kernel/idle.h b/arch/arm64/kernel/idle.h
> new file mode 100644
> index 000000000000..350b758ea215
> --- /dev/null
> +++ b/arch/arm64/kernel/idle.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ARM64_KERNEL_IDLE_H
> +#define __ARM64_KERNEL_IDLE_H
> +
> +enum idle_mode {

Small nit - s/idle_mode/arm64_idle_mode
> +	WFI,
> +	YIELD,
> +	NOP,

Small nit - ARM64_IDLE_[WFI|YIELD|NOP] to be more descriptive
> +};
> +
> +#endif
> diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
> index e278e060e78a..d6fd09466abc 100644
> --- a/arch/arm64/lib/delay.c
> +++ b/arch/arm64/lib/delay.c
> @@ -15,9 +15,13 @@
>  
>  #include <clocksource/arm_arch_timer.h>
>  
> +#include "../kernel/idle.h"
> +
>  #define USECS_TO_CYCLES(time_usecs)			\
>  	xloops_to_cycles((time_usecs) * 0x10C7UL)
>  
> +extern enum idle_mode idle;

Could the extern be moved inside arch/arm64/kernel/idle.h instead
> +
>  static inline unsigned long xloops_to_cycles(unsigned long xloops)
>  {
>  	return (xloops * loops_per_jiffy * HZ) >> 32;
> @@ -49,7 +53,8 @@ void __delay(unsigned long cycles)
>  		 * Start with WFIT. If an interrupt makes us resume
>  		 * early, use a WFET loop to complete the delay.
>  		 */
> -		wfit(end);
> +		if (likely(idle == WFI))
> +			wfit(end);
>  		while ((__delay_cycles() - start) < cycles)
>  			wfet(end);
>  	} else 	if (arch_timer_evtstrm_available()) {
> 
> ---
> base-commit: 96cb07bd64bf4d3c8c9159636314c6fbdd9b9881
> change-id: 20260705-arm64-idle-param-c27fc0e7ea05
> 
> Best regards,
> --  
> Yureka Lilian <yureka@cyberchaos.dev>
> 
> 


