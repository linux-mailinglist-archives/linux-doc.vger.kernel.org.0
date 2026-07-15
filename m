Return-Path: <linux-doc+bounces-96935-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IOGMNXqKV2pSWgAAu9opvQ
	(envelope-from <linux-doc+bounces-96935-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 15:26:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1A75EA7E
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 15:26:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cyberchaos.dev header.s=mail header.b=xmQnBRqZ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96935-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-96935-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cyberchaos.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D59C03002316
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 13:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B11448CF7;
	Wed, 15 Jul 2026 13:24:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB3A43A7F2;
	Wed, 15 Jul 2026 13:24:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121854; cv=none; b=Q0UuLTXqoB3DMyssZGZ+/TY4iigP0FiE2afx/wCrCQjBtMw8HwQd4kFKCPNa0xO43XciZBn1aDFIus+HgbmF+zkjLXGT8jyKbroSmBQ8/L0Wop3lBZO817ni2J8ktyOZ+U+wOIIhOepnhv3R0rUoMo3RtqGhtPddm53h0u1HM70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121854; c=relaxed/simple;
	bh=9LuLo1r4EGXavj9GZxF94FvTb7ysZCS5Smh3r8I+AnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOX4bZKMQpYxIZKmnc5pd0HgiFlSChtr/OFcPKX4UL9Lh9uxctqQnIoiDwz8TjQ+xlf7o8zI1bQT6/yIDck2H+pg8+xftpDJn10gJPSlvrO42AGt+ZynUiK6+wWJyEXNAdhHA6RSEeVwydJvZCNpmtPO4Nao6EVK7o7CtkmgbPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=xmQnBRqZ; arc=none smtp.client-ip=195.39.247.168
Message-ID: <5f1af8d0-ed73-4dac-9bd3-30f8e82d4b26@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1784121845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVIqYzBCwkSvrOo9fjsOyZRo3pGQHK7MTvgyv28ckXs=;
	b=xmQnBRqZk/0smY8Van6lM/3KQO2IP67/8UEp8x39A7YN4mEtT/2xL+L9Wn19C974/2iXy2
	ovgUTGAPqPyxCmFTeN2U9QpbasQczWGE4FU9wx4SZIIrqIZKetr0OwVPqFjgRhonnC0UKV
	iRYwy0FfWTgT5+044ze3nZpIp6+2CIg=
Date: Wed, 15 Jul 2026 15:24:03 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cyberchaos.dev,reject];
	R_DKIM_ALLOW(-0.20)[cyberchaos.dev:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96935-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[yureka@cyberchaos.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:yureka@cyberchaos.dev,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:anshuman.khandual@arm.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cyberchaos.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yureka@cyberchaos.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,cyberchaos.dev:dkim,cyberchaos.dev:email,cyberchaos.dev:mid,cyberchaos.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71B1A75EA7E
X-Rspamd-Action: no action

On 7/13/26 11:57, Sudeep Holla wrote:
> On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
>> Overriding the idle mechanism might be useful for debugging and performance
>> testing. Add a cmdline parameter for it, similar to the existing idle=
>> parameter already present for the x86 and ppc architectures.
>>
>> It is also useful on platforms where the WFI instruction misbehaves,
>> such as Apple Silicon SoCs. Generally, a misbehaving instruction should
>> be treated as an erratum and patched using the alternatives framework.
>> However, in the Apple Silicon case we need more flexibility because it is
>> difficult to detect whether the erratum applies. For example, Linux VMs
>> inside macOS have the same MIDR and may even seem like they're running
>> in EL2 in the case of NV, but should continue using WFI (it's trapped and
>> handled correctly by the hypervisor there). Thus, we prefer to
>> let the m1n1 bootloader add the idle=nop parameter[1].
>>
>> Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
>> Suggested-by: Will Deacon <will@kernel.org>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>> Changes in v2:
>> - Applied suggestions by Anshuman Khandual (Thanks!)
>> - Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
>> ---
>>   Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
>>   arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
>>   arch/arm64/kernel/idle.h                        | 13 +++++++++++
>>   arch/arm64/lib/delay.c                          |  5 ++++-
>>   4 files changed, 68 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index b2d7d3540ded..d7f5471edf8f 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -2239,6 +2239,29 @@ Kernel parameters
>>   
>>   			idle=nomwait: Disable mwait for CPU C-states
>>   
>> +			[ARM64,EARLY]
>> +			Format: idle=wfi, idle=yield, idle=nop
>> +
>> +			idle=wfi: Use the WFI (Wait For Interrupt) hint
>> +			instruction in the idle loop. This is the default and
>> +			allows the CPU to enter a low-power state until an
>> +			interrupt arrives.
> Just curious as when and why one would need to use idle=wfi if that is the
> default behaviour. I am missing the need to have it.
>
>> +
>> +			idle=yield: Use the YIELD hint instruction instead of
>> +			WFI. CPUs supporting simultaneous multi-threading (SMT),
>> +			can continue executing another thread when the current
>> +			thread reaches the idle loop. This will make the CPUs
>> +			eat more power, but may be useful to get slightly better
>> +			performance in some applications, since the CPUs will
>> +			not enter a low-power state.
>> +
>> +			idle=nop: Do not execute any idle instruction in the
>> +			idle loop. This is useful on platforms where WFI
>> +			misbehaves, leading to system instability or loss of CPU
>> +			state. This will make the CPUs eat more power, but may
>> +			give slightly better performance in some applications,
>> +			since the CPUs will not enter a low-power state.
>> +
>>   	idxd.sva=	[HW]
>>   			Format: <bool>
>>   			Allow force disabling of Shared Virtual Memory (SVA)
>> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
>> index 05cfb347ec26..f161711a9954 100644
>> --- a/arch/arm64/kernel/idle.c
>> +++ b/arch/arm64/kernel/idle.c
>> @@ -11,6 +11,27 @@
>>   #include <asm/cpufeature.h>
>>   #include <asm/sysreg.h>
>>   
>> +#include "idle.h"
>> +
>> +enum arm64_idle_mode idle = ARM64_IDLE_WFI;
>> +
>> +static int __init setup_idle(char *arg)
>> +{
>> +	if (!arg)
>> +		return -1;
>> +	else if (!strcmp(arg, "wfi"))
>> +		idle = ARM64_IDLE_WFI;
>> +	else if (!strcmp(arg, "yield"))
>> +		idle = ARM64_IDLE_YIELD;
>> +	else if (!strcmp(arg, "nop"))
>> +		idle = ARM64_IDLE_NOP;
>> +	else
>> +		return -1;
>> +
>> +	return 0;
>> +}
>> +early_param("idle", setup_idle);
>> +
>>   /*
>>    *	cpu_do_idle()
>>    *
>> @@ -26,8 +47,13 @@ void __cpuidle cpu_do_idle(void)
>>   
>>   	arm_cpuidle_save_irq_context(&context);
>>   
>> -	dsb(sy);
>> -	wfi();
>> +	if (likely(idle == ARM64_IDLE_WFI)) {
>> +		dsb(sy);
>> +		wfi();
>> +	} else if (idle == ARM64_IDLE_YIELD) {
>> +		dsb(sy);
>> +		asm volatile("yield" ::: "memory");
>> +	}
>>   
>>   	arm_cpuidle_restore_irq_context(&context);
>
> If WFI is replaced by NOP or YIELD, do we really need to save/restore
> IRQ context used for pseudo-NMIs which may add some overhead ?

There are optimizations, even in the ARM64_IDLE_WFI case, which could be 
done here, such as checking that an interrupt actually occurred before 
continuing (and repeating the wfi/yield/nop until this is the case). I 
would prefer not to do these optimizations in this patch series, and 
leave it as future work, because I don't understand all the implications 
at this point. Is this acceptable for you?


Thanks,

— Yureka


