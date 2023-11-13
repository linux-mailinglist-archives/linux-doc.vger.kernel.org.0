Return-Path: <linux-doc+bounces-2196-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE627E939D
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 01:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13E48B207F1
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 00:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57D3256A;
	Mon, 13 Nov 2023 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h8KQd98/"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AE920E1
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 00:38:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C30E49F
	for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699835889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1nf6XEV98s0CEk667q+uBgTZE/SGODZkiF15Lal4kk=;
	b=h8KQd98/GEKJzORHx2wfKS2d8qiY110UBpsBEbdRXv4/y5PivgPj1JbxDbPZfB/3DNYR3T
	q6BDqln+8FIoznZ0EG2zfUCjCovb/uDlIxVUJoGzTB7QCrvpNzS3Bpxc1ZOm27oiyA11iq
	2Q6QXeGzN0ooFxHKhSCfkip+mko+0es=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-nbF_n_vcNwyqy3qAiS00XQ-1; Sun, 12 Nov 2023 19:38:08 -0500
X-MC-Unique: nbF_n_vcNwyqy3qAiS00XQ-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1f08758b52cso3720924fac.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699835887; x=1700440687;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1nf6XEV98s0CEk667q+uBgTZE/SGODZkiF15Lal4kk=;
        b=tnOftvb5UuKixlESiQMo+t1TY1UzmhJNtYtcQua/YObirStYe/pkm4OsGQVTCekiFH
         96zUJQcSzYZ03DiXisxCBL/yAmjc2RwqN3t1ISKlo59UNofJfNyuPubpMu1pxQBS+B7j
         gdtcWPfhMZJiBN+IVc343WjWvYADuqSutcoKR189v+TL5PgOBGoKYl3F/vYnAlXztP2v
         pm0xpDk10O5xb2l+oro1WophWfLwBUE8DkxoHK+SaFaGbJfda/ASHH/k6Rf79Sq7ljPz
         JjHTx8ECSiamiimyI2KrEoEN4zkm5sRWf8LNCHPuOyZo+8nQKXZnr+A5uMcF3O+zfkNC
         eB6A==
X-Gm-Message-State: AOJu0YxNkoEawEx31jOmLFiwlo25N2BZPLsinf2IKJ3EAtbdMpOIYrNJ
	/S0SIqinwdMy9fY7w1+LwbydfhIaVo9mu7uxv4cnwmWE8Ofq8IJeyN6qqkCkcRJ+sYTmTOiv5fA
	MizRCWWx7CSS9+t0SrKoc
X-Received: by 2002:a05:6870:d0c6:b0:1e9:e605:27a2 with SMTP id k6-20020a056870d0c600b001e9e60527a2mr7370996oaa.40.1699835887685;
        Sun, 12 Nov 2023 16:38:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHcRcNW/0WRXgRcvJUbygUPuUiuO/tgZdTNz8Uw3rp5U7itGOHSrxQdNmH0YwAJkfF7sIkzQ==
X-Received: by 2002:a05:6870:d0c6:b0:1e9:e605:27a2 with SMTP id k6-20020a056870d0c600b001e9e60527a2mr7370991oaa.40.1699835887444;
        Sun, 12 Nov 2023 16:38:07 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id lx7-20020a17090b4b0700b00280c6f35546sm2774851pjb.49.2023.11.12.16.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:38:07 -0800 (PST)
Message-ID: <8cdb97b5-515a-474d-918c-2f0d5ecad266@redhat.com>
Date: Mon, 13 Nov 2023 10:37:56 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/22] drivers: base: Use present CPUs in
 GENERIC_CPU_DEVICES
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLB-00CTwy-7y@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLB-00CTwy-7y@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/23 20:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Three of the five ACPI architectures create sysfs entries using
> register_cpu() for present CPUs, whereas arm64, riscv and all
> GENERIC_CPU_DEVICES do this for possible CPUs.
> 
> Registering a CPU is what causes them to show up in sysfs.
> 
> It makes very little sense to register all possible CPUs. Registering
> a CPU is what triggers the udev notifications allowing user-space to
> react to newly added CPUs.
> 
> To allow all five ACPI architectures to use GENERIC_CPU_DEVICES, change
> it to use for_each_present_cpu(). Making the ACPI architectures use
> GENERIC_CPU_DEVICES is a pre-requisite step to centralise their
> cpu_register() logic, before moving it into the ACPI processor driver.
> When ACPI is disabled this work would be done by
> cpu_dev_register_generic().
> 
> Of the ACPI architectures that register possible CPUs, arm64 and riscv
> do not support making possible CPUs present as they use the weak 'always
> fails' version of arch_register_cpu().
> 
> Only two of the eight architectures that use GENERIC_CPU_DEVICES have a
> distinction between present and possible CPUs.
> 
> The following architectures use GENERIC_CPU_DEVICES but are not SMP,
> so possible == present:
>   * m68k
>   * microblaze
>   * nios2
> 
> The following architectures use GENERIC_CPU_DEVICES and consider
> possible == present:
>   * csky: setup_smp()
>   * processor_probe() sets possible for all CPUs and present for all CPUs
>     except the boot cpu, which will have been done by
>     init/main.c::start_kernel().
> 
> um appears to be a subarchitecture of x86.
> 
> The remaining architecture using GENERIC_CPU_DEVICES are:
>   * openrisc and hexagon:
>     where smp_init_cpus() makes all CPUs < NR_CPUS possible,
>     whereas smp_prepare_cpus() only makes CPUs < setup_max_cpus present.
> 
> After this change, openrisc and hexagon systems that use the max_cpus
> command line argument would not see the other CPUs present in sysfs.
> This should not be a problem as these CPUs can't bre brought online as
> _cpu_up() checks cpu_present().
> 
> After this change, only CPUs which are present appear in sysfs.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/base/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


