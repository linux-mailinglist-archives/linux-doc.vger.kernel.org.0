Return-Path: <linux-doc+bounces-2113-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 347A57E7818
	for <lists+linux-doc@lfdr.de>; Fri, 10 Nov 2023 04:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5BDBB20F12
	for <lists+linux-doc@lfdr.de>; Fri, 10 Nov 2023 03:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BEB81847;
	Fri, 10 Nov 2023 03:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RbJkcdoq"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE79215B9
	for <linux-doc@vger.kernel.org>; Fri, 10 Nov 2023 03:36:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF344686
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 19:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699587417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HClD7CV8xk/CCQ0atS0PXuNYo2X0BsEeurSAtsmTxpQ=;
	b=RbJkcdoqPlFXyb9tYaaD/NTdmuF+NjKk1xye4dA88Rp08y/AKUf+cNpSrULbBlXHXPeBlF
	MdWcNobaSLoxIIXPEIv+p3kRz5GvE8h1cCZZ6WzbGpjLxYupoPY4THF/ZqRWRBMg/EOhkt
	XMs4sgRxGsKfrEkjCmrwERmBW2Nvg4U=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-W9RmDtf6Oki7FVaJpOq2Cw-1; Thu, 09 Nov 2023 22:36:55 -0500
X-MC-Unique: W9RmDtf6Oki7FVaJpOq2Cw-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6bde07512bfso55611b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Nov 2023 19:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699587414; x=1700192214;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HClD7CV8xk/CCQ0atS0PXuNYo2X0BsEeurSAtsmTxpQ=;
        b=llypnQfwHBBOlX1LbOdyFDEVwZ62nniOvn4leEeISKb8DuXQnGD0t4zs1fOZMzViAc
         hpmK2Z0C/0ZRGLQI/E90LCrJhSNgEx0rXneNYZOXu8wrPe1iWiU18CRwcwdu55+Ice3e
         jZp9KVplXmfl/JQrk5yDa56a9AepgO5TsD/1MEhUlJz28QAwfqdsdcSjwNSmGEDue509
         HVjjpxWdqWbCmwDejy5hvYF1+T3zku099nlf++yv9R3wSe/IMnHfXHujPRM/4QPmyRyk
         MRaOREqUx+aVFVcyt5VGZHdA58MTU3zdA2EGrCYSXNWjNK90F2QQ+ywCai0rbuwAMngh
         xrlA==
X-Gm-Message-State: AOJu0YwXNBxBu9DAKlbpqo0JT2IjMIWRSHoQnadVlb0uGtVj0OWSlfLT
	5Unx5vvIyRBL9rMp+DUXh7AVhvuPApduIbYbjGsD5jdvfM32NskRCc8W+QDnW76JCfSyeucSjh/
	av0Xw8u4BXHPgRluiMUIv
X-Received: by 2002:a05:6a20:7d9b:b0:183:e7bb:591b with SMTP id v27-20020a056a207d9b00b00183e7bb591bmr7377790pzj.3.1699587414402;
        Thu, 09 Nov 2023 19:36:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtZaVuVapXbb3y/agfJhHkenHQPRDZ+pGnicgr3kUFB4Kcn/5cEWlfctiRqhGPrLHUlDRuVQ==
X-Received: by 2002:a05:6a20:7d9b:b0:183:e7bb:591b with SMTP id v27-20020a056a207d9b00b00183e7bb591bmr7377759pzj.3.1699587413961;
        Thu, 09 Nov 2023 19:36:53 -0800 (PST)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id iy18-20020a170903131200b001cc2bc10510sm4267420plb.128.2023.11.09.19.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 19:36:53 -0800 (PST)
Message-ID: <7e7f37c9-c364-7749-c700-8bc29ac0c5d1@redhat.com>
Date: Fri, 10 Nov 2023 11:36:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 13/22] arm64: setup: Switch over to
 GENERIC_CPU_DEVICES using arch_register_cpu()
Content-Language: en-US
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLl-00CTxk-7O@rmk-PC.armlinux.org.uk>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <E1r0JLl-00CTxk-7O@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/7/23 18:30, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> To allow ACPI's _STA value to hide CPUs that are present, but not
> available to online right now due to VMM or firmware policy, the
> register_cpu() call needs to be made by the ACPI machinery when ACPI
> is in use. This allows it to hide CPUs that are unavailable from sysfs.
> 
> Switching to GENERIC_CPU_DEVICES is an intermediate step to allow all
> five ACPI architectures to be modified at once.
> 
> Switch over to GENERIC_CPU_DEVICES, and provide an arch_register_cpu()
> that populates the hotpluggable flag. arch_register_cpu() is also the
> interface the ACPI machinery expects.
> 
> The struct cpu in struct cpuinfo_arm64 is never used directly, remove
> it to use the one GENERIC_CPU_DEVICES provides.
> 
> This changes the CPUs visible in sysfs from possible to present, but
> on arm64 smp_prepare_cpus() ensures these are the same.
> 
> This patch also has the effect of moving the registration of CPUs from
> subsys to driver core initialisation, prior to any initcalls running.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
> Changes since RFC v2:
>   * Add note about initialisation order change.
> ---
>   arch/arm64/Kconfig           |  1 +
>   arch/arm64/include/asm/cpu.h |  1 -
>   arch/arm64/kernel/setup.c    | 13 ++++---------
>   3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7b071a00425d..84bce830e365 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -132,6 +132,7 @@ config ARM64
>   	select GENERIC_ARCH_TOPOLOGY
>   	select GENERIC_CLOCKEVENTS_BROADCAST
>   	select GENERIC_CPU_AUTOPROBE
> +	select GENERIC_CPU_DEVICES
>   	select GENERIC_CPU_VULNERABILITIES
>   	select GENERIC_EARLY_IOREMAP
>   	select GENERIC_IDLE_POLL_SETUP
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index f3034099fd95..b1e43f56ee46 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -38,7 +38,6 @@ struct cpuinfo_32bit {
>   };
>   
>   struct cpuinfo_arm64 {
> -	struct cpu	cpu;
>   	struct kobject	kobj;
>   	u64		reg_ctr;
>   	u64		reg_cntfrq;
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 417a8a86b2db..165bd2c0dd5a 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -402,19 +402,14 @@ static inline bool cpu_can_disable(unsigned int cpu)
>   	return false;
>   }
>   
> -static int __init topology_init(void)
> +int arch_register_cpu(int num)
>   {
> -	int i;
> +	struct cpu *cpu = &per_cpu(cpu_devices, num);
>   
> -	for_each_possible_cpu(i) {
> -		struct cpu *cpu = &per_cpu(cpu_data.cpu, i);
> -		cpu->hotpluggable = cpu_can_disable(i);
> -		register_cpu(cpu, i);
> -	}
> +	cpu->hotpluggable = cpu_can_disable(num);
>   
> -	return 0;
> +	return register_cpu(cpu, num);
>   }
> -subsys_initcall(topology_init);
>   
>   static void dump_kernel_offset(void)
>   {

-- 
Shaoqin


