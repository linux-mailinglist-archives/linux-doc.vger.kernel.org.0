Return-Path: <linux-doc+bounces-2233-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E37E99A9
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 11:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7C9B1C2098F
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 10:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D12F1C2AF;
	Mon, 13 Nov 2023 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGH7umgB"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14CC1C2AC
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 10:01:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06F1D59
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 02:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699869708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAMalQgNM0C7HuKoU35TO9KZ8bUeH1IJgfZxeS8F7ZM=;
	b=MGH7umgBu+k9C7XpufiLpz8YL/kIEH0nnDFNVXic9FQvayEkEvpWQIqxjdVxOsSFle1cq0
	PoZ4N65TVIMC8Ggw9yWp4o28i98uMbsYafmE7QoyyM0EyNYE6DRnzDrxfqt+aFwgGnJ8x5
	jtco2G08IRomVpCW5QXFogG7MRO2h1Q=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-BcP9a5eJN6ixPiwCoqhgEg-1; Mon, 13 Nov 2023 05:01:47 -0500
X-MC-Unique: BcP9a5eJN6ixPiwCoqhgEg-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-35aae13867aso14048435ab.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 02:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699869707; x=1700474507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAMalQgNM0C7HuKoU35TO9KZ8bUeH1IJgfZxeS8F7ZM=;
        b=A4HeIjaN8+DKkf3PDu7OfCRiJn/kSz0H6rUj2IpM/qg6OpR0KLJtbwJGHrm9n1G1b0
         WVGNHntArFGuzZDLtfLk11VvcKWnoRTqu/jXm/GogEQzYkLE5SSJZYzVZchm8VuYWKnW
         c/1OZVvPrjb2XJHXmyiNMQGXzsoNLxe/Qj/ToqsfDviatk8DKkRCBfKV5A46rB7HVg4A
         12y0Zmav5YedO0I2TVnhlp/CVMMY8BLNwUdb/wOwhcl9flwx+dLCOhkt/nqvPOcSOLUa
         VcFKmPzI/ImGIm8AUvKG+5qabSwqywzMwOh0nCB1A4EmDzZbMzqILu5jzNUEFX5YCN4B
         la7w==
X-Gm-Message-State: AOJu0YwOVkobSS8+vju8083aqn87hIPnuovm7CDdNS+MCAJXPURvi6lr
	xILvPUAMqE/DhR1B2E96/0gTYUfG7Fh9pTjd824eqD+09xnUa0NL12lXLXlDwZ9S9ePLSnE+oV8
	psHnxUISn4VT3YAsqjH5h
X-Received: by 2002:a05:6e02:1bc7:b0:359:56d2:aa19 with SMTP id x7-20020a056e021bc700b0035956d2aa19mr7258848ilv.6.1699869706808;
        Mon, 13 Nov 2023 02:01:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7tmXC6qf2sfNPHtOUIMeBRO/dIRdXhrQyw4Al19wk8aveBy1a/L2HugzHzm+0XUXK3jdUog==
X-Received: by 2002:a05:6e02:1bc7:b0:359:56d2:aa19 with SMTP id x7-20020a056e021bc700b0035956d2aa19mr7258823ilv.6.1699869706458;
        Mon, 13 Nov 2023 02:01:46 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id c9-20020a62e809000000b006c306943730sm3652442pfi.91.2023.11.13.02.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 02:01:46 -0800 (PST)
Message-ID: <29090279-a682-43ff-9710-181cb91bbf91@redhat.com>
Date: Mon, 13 Nov 2023 20:01:27 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/22] ACPI: Move ACPI_HOTPLUG_CPU to be disabled on
 arm64 and riscv
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JL6-00CTws-3z@rmk-PC.armlinux.org.uk>
 <8e288692-7460-4aa4-86f3-500327256bc3@redhat.com>
 <ZVHkykFMp+CMUqyf@shell.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ZVHkykFMp+CMUqyf@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/13/23 18:56, Russell King (Oracle) wrote:
> On Mon, Nov 13, 2023 at 10:29:39AM +1000, Gavin Shan wrote:
>> On 11/7/23 20:29, Russell King (Oracle) wrote:
>>> From: James Morse <james.morse@arm.com>
>>>
>>> Neither arm64 nor riscv support physical hotadd of CPUs that were not
>>> present at boot. For arm64 much of the platform description is in static
>>> tables which do not have update methods. arm64 does support HOTPLUG_CPU,
>>> which is backed by a firmware interface to turn CPUs on and off.
>>>
>>> acpi_processor_hotadd_init() and acpi_processor_remove() are for adding
>>> and removing CPUs that were not present at boot. arm64 systems that do this
>>> are not supported as there is currently insufficient information in the
>>> platform description. (e.g. did the GICR get removed too?)
>>>
>>> arm64 currently relies on the MADT enabled flag check in map_gicc_mpidr()
>>> to prevent CPUs that were not described as present at boot from being
>>> added to the system. Similarly, riscv relies on the same check in
>>> map_rintc_hartid(). Both architectures also rely on the weak 'always fails'
>>> definitions of acpi_map_cpu() and arch_register_cpu().
>>>
>>> Subsequent changes will redefine ACPI_HOTPLUG_CPU as making possible
>>> CPUs present. Neither arm64 nor riscv support this.
>>>
>>> Disable ACPI_HOTPLUG_CPU for arm64 and riscv by removing 'default y' and
>>> selecting it on the other three ACPI architectures. This allows the weak
>>> definitions of some symbols to be removed.
>>>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>> Changes since RFC:
>>>    * Expanded conditions to avoid ACPI_HOTPLUG_CPU being enabled when
>>>      HOTPLUG_CPU isn't.
>>> Changes since RFC v3:
>>>    * Dropped ia64 changes
>>> ---
>>>    arch/loongarch/Kconfig        |  1 +
>>>    arch/x86/Kconfig              |  1 +
>>>    drivers/acpi/Kconfig          |  1 -
>>>    drivers/acpi/acpi_processor.c | 18 ------------------
>>>    4 files changed, 2 insertions(+), 19 deletions(-)
>>>
>>
>> With the following nits addressed:
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>>> index d889a0b97bc1..64620e90c12c 100644
>>> --- a/arch/loongarch/Kconfig
>>> +++ b/arch/loongarch/Kconfig
>>> @@ -5,6 +5,7 @@ config LOONGARCH
>>>    	select ACPI
>>>    	select ACPI_GENERIC_GSI if ACPI
>>>    	select ACPI_MCFG if ACPI
>>> +	select ACPI_HOTPLUG_CPU if ACPI_PROCESSOR && HOTPLUG_CPU
>>>    	select ACPI_PPTT if ACPI
>>>    	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
>>>    	select ARCH_BINFMT_ELF_STATE
>>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>>> index 3762f41bb092..dbdcfc708369 100644
>>> --- a/arch/x86/Kconfig
>>> +++ b/arch/x86/Kconfig
>>> @@ -59,6 +59,7 @@ config X86
>>>    	#
>>>    	select ACPI_LEGACY_TABLES_LOOKUP	if ACPI
>>>    	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
>>> +	select ACPI_HOTPLUG_CPU			if ACPI_PROCESSOR && HOTPLUG_CPU
>>>    	select ARCH_32BIT_OFF_T			if X86_32
>>>    	select ARCH_CLOCKSOURCE_INIT
>>>    	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>>> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
>>> index f819e760ff19..a3acfc750fce 100644
>>> --- a/drivers/acpi/Kconfig
>>> +++ b/drivers/acpi/Kconfig
>>> @@ -310,7 +310,6 @@ config ACPI_HOTPLUG_CPU
>>>    	bool
>>>    	depends on ACPI_PROCESSOR && HOTPLUG_CPU
>>>    	select ACPI_CONTAINER
>>> -	default y
>>>    config ACPI_PROCESSOR_AGGREGATOR
>>>    	tristate "Processor Aggregator"
>>> diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
>>> index 0f5218e361df..4fe2ef54088c 100644
>>> --- a/drivers/acpi/acpi_processor.c
>>> +++ b/drivers/acpi/acpi_processor.c
>>> @@ -184,24 +184,6 @@ static void __init acpi_pcc_cpufreq_init(void) {}
>>>    /* Initialization */
>>>    #ifdef CONFIG_ACPI_HOTPLUG_CPU
>>> -int __weak acpi_map_cpu(acpi_handle handle,
>>> -		phys_cpuid_t physid, u32 acpi_id, int *pcpu)
>>> -{
>>> -	return -ENODEV;
>>> -}
>>> -
>>> -int __weak acpi_unmap_cpu(int cpu)
>>> -{
>>> -	return -ENODEV;
>>> -}
>>> -
>>> -int __weak arch_register_cpu(int cpu)
>>> -{
>>> -	return -ENODEV;
>>> -}
>>> -
>>> -void __weak arch_unregister_cpu(int cpu) {}
>>> -
>>
>> Since we're here, EXPORT_SYMBOL() can be dropped for these functions on
>> x86 and loongarch because they're not called from a module?
> 
> I'm confused, and don't understand your comment. You've r-b the
> previous two patches that remove the EXPORT_SYMBOL()s for
> arch_register_cpu() and arch_unregister_cpu() from x86 and loongarch.
> So it seems your comment is already addressed, and thus makes no
> sense.
> 
> Please clarify.
> 

Exactly, I must be looking into wrong code when reviewing this patch.
Please ignore my comments and my r-b still valid. Sorry for the
unnecessary confusion.

Thanks,
Gavin


