Return-Path: <linux-doc+bounces-1839-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4577C7E4786
	for <lists+linux-doc@lfdr.de>; Tue,  7 Nov 2023 18:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1A2428130E
	for <lists+linux-doc@lfdr.de>; Tue,  7 Nov 2023 17:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5793C347D2;
	Tue,  7 Nov 2023 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="22o835uw"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EF4347D6
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 17:48:10 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE7B18A
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 09:48:09 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc53d0030fso47330675ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 09:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699379288; x=1699984088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywd9froD7aOGJqc09ImjtHrARMhZvSCpgT2M8r3eM5I=;
        b=22o835uwXX++RGJEcKz+duCGRpOkcuVAJo41fEXDdIFFod9H0yEPM1teCwJa0EaUhi
         fs+XXJgKWhTdwXh4FJPpdIc1A/WpIrDNp1nMSyVyDpeC6d5LR/QPLtWOUMI81QjUxlJv
         A2F5rBmW1d4iJRtZ4NxWOg+jwHYjtqe09HN+pwMs+QaCXIPTQG0Hsrwq1dyVT3jyxxYD
         9TaI7frLncsn/DnaXktkJHItoynQtq+bmCBNzSp/8U5yb/5i7IwY233d/Pv1JNrEyuLP
         +h39bCZopmkpvZnrueMz2lnx2vZAdFKj5wr+8eEsDXiFREjwo5EsJzcNYfEy0e3QgJDZ
         p6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699379288; x=1699984088;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywd9froD7aOGJqc09ImjtHrARMhZvSCpgT2M8r3eM5I=;
        b=Rv5e3NWTWkgJPJiCHyBDDBJftsx8Gd5NHa05eanj+lpC1Gt3fE9jEnYaPQmpG4T1I1
         frKSX6zhM4txsJAwuf6+UDzUgMl56GlGqhkZeIYXPyM1GBarbHWsSi9pl8Q9k/ivAmSZ
         0BvwGztg0dFVOQYuWEU25cPl/conoJIq/XI5JpTFi0f7q7DaOw5s2XjezPPqjGRXohZI
         TkVneHKBR8b/WZ5cdQkpLu9sv9ZLGCbrbaOgk/BtfwgUGlFGnirNmQ+YqU40UCIL0KSu
         +oSAKdopq66A8GRy7wp7Apua4xv92DbsXB/b94VmXhLUDaoum8EnzC2TE8SVbn/E4UZV
         Uqdg==
X-Gm-Message-State: AOJu0YwTdYpUWoXHvXKYEGFUK05EONvS1GVABxwywNmiKPCaIe6O6g8/
	eQD9+FH3Irx/G9EkbdDgLmeAxQ==
X-Google-Smtp-Source: AGHT+IE1O0IZeedx9DdABfISL9vUc/qLEJImXP8G88Ji0nXKSIqNVitCPYUEuOTU6Qgy+/VgBOwBhA==
X-Received: by 2002:a17:902:d4ce:b0:1cc:32df:8ebd with SMTP id o14-20020a170902d4ce00b001cc32df8ebdmr5416391plg.25.1699379288440;
        Tue, 07 Nov 2023 09:48:08 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id iy3-20020a170903130300b001c9dac0fbbasm115552plb.63.2023.11.07.09.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 09:48:07 -0800 (PST)
Date: Tue, 07 Nov 2023 09:48:07 -0800 (PST)
X-Google-Original-Date: Tue, 07 Nov 2023 09:47:58 PST (-0800)
Subject:     Re: [PATCH RFC 21/22] riscv: Switch over to GENERIC_CPU_DEVICES
In-Reply-To: <E1r0JMQ-00CTyb-Ee@rmk-PC.armlinux.org.uk>
CC: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
  linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, linux-csky@vger.kernel.org,
  linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
  salil.mehta@huawei.com, jean-philippe@linaro.org, jianyong.wu@arm.com, justin.he@arm.com,
  james.morse@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rmk+kernel@armlinux.org.uk
Message-ID: <mhng-6d9a28af-d626-410e-913f-33bc01890537@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 07 Nov 2023 02:31:06 PST (-0800), rmk+kernel@armlinux.org.uk wrote:
> From: James Morse <james.morse@arm.com>
>
> Now that GENERIC_CPU_DEVICES calls arch_register_cpu(), which can be
> overridden by the arch code, switch over to this to allow common code
> to choose when the register_cpu() call is made.
>
> This allows topology_init() to be removed.
>
> This is an intermediate step to the logic being moved to drivers/acpi,
> where GENERIC_CPU_DEVICES will do the work when booting with acpi=off.
>
> This patch also has the effect of moving the registration of CPUs from
> subsys to driver core initialisation, prior to any initcalls running.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Changes since RFC v2:
>  * Add note about initialisation order change.
> ---
>  arch/riscv/Kconfig        |  1 +
>  arch/riscv/kernel/setup.c | 19 ++++---------------
>  2 files changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index eaa15a20e6ae..264aa466aec3 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -69,6 +69,7 @@ config RISCV
>  	select GENERIC_ARCH_TOPOLOGY
>  	select GENERIC_ATOMIC64 if !64BIT
>  	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> +	select GENERIC_CPU_DEVICES
>  	select GENERIC_EARLY_IOREMAP
>  	select GENERIC_ENTRY
>  	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 0624f44d43ec..f8875ae1b0aa 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -50,7 +50,6 @@ atomic_t hart_lottery __section(".sdata")
>  #endif
>  ;
>  unsigned long boot_cpu_hartid;
> -static DEFINE_PER_CPU(struct cpu, cpu_devices);
>
>  /*
>   * Place kernel memory regions on the resource tree so that
> @@ -295,23 +294,13 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_set_dma_cache_alignment();
>  }
>
> -static int __init topology_init(void)
> +int arch_register_cpu(int cpu)
>  {
> -	int i, ret;
> +	struct cpu *c = &per_cpu(cpu_devices, cpu);
>
> -	for_each_possible_cpu(i) {
> -		struct cpu *cpu = &per_cpu(cpu_devices, i);
> -
> -		cpu->hotpluggable = cpu_has_hotplug(i);
> -		ret = register_cpu(cpu, i);
> -		if (unlikely(ret))
> -			pr_warn("Warning: %s: register_cpu %d failed (%d)\n",
> -			       __func__, i, ret);
> -	}
> -
> -	return 0;
> +	c->hotpluggable = cpu_has_hotplug(cpu);
> +	return register_cpu(c, cpu);
>  }
> -subsys_initcall(topology_init);
>
>  void free_initmem(void)
>  {

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

