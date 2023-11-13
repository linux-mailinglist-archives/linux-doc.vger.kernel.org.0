Return-Path: <linux-doc+bounces-2197-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF187E93A6
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 01:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483E11C20911
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 00:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD04B3C1D;
	Mon, 13 Nov 2023 00:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dz9tAZKe"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69B823A1
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 00:43:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39000211F
	for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699836179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iQsxdmKsC9+VQQMbyUjXPaZGEeJW41wCAFBZ7vfsBQE=;
	b=Dz9tAZKeZQLH5kwYITJxIMehuSh3eiJZPHUVm3e56fVkCUGYcUX4SMD96kzjjjfeEBvBWO
	ja2ErnaDNIL2aU4TkWJ2I7vVcDYIz6OZcoIV1GdbNW5oRWPS/shS68yqrFmshG+Jp8GVkD
	PlNBETdihDlfhBH+I/U0bQg4CablLds=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-IcyFgbPFPcatNZLIktZn2w-1; Sun, 12 Nov 2023 19:42:57 -0500
X-MC-Unique: IcyFgbPFPcatNZLIktZn2w-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6c334d2fcc5so3649441b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699836176; x=1700440976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQsxdmKsC9+VQQMbyUjXPaZGEeJW41wCAFBZ7vfsBQE=;
        b=pnkPCBK89QmklDWDjCCJAXjymnLow6RCeE8Oa7UG22vKCzrM2sH46VELJmw2XY4SBc
         b/jeI3iP9WR29kVG/GVAdfMpkIXy7OBJ1BWI7i5QdMyCV4Juy20EnPCX16C6EC7TlpJT
         OjNgBM/MRUl2tDeQ5tbPqAX6N1EDT2rCJO3WIXjT//9mGXdzIeiyRq+hmTjMLsVgK/v9
         4wgnekGIBe1WlYglBRdHteZngq1EyrvuQODN84e+8gpK0f0naMQ5kSVPZB737t6Srbcm
         e6WRIDZ8VIvN7Kw8BU9An5UprN8JBdUX9mAHz/NWbBYdKS5pRVtJz51ZSsjkrcUz8jyt
         ybyQ==
X-Gm-Message-State: AOJu0YwZ8gfMEUPv2Mf+ybqDNyV7DoDch2ltVOnWPo5yszUF9wtUiZM6
	PlDhzHYgKHjZN4yX21J8CM3w+TZxH8xRlFzUGURYhqQoGXFd4wVP/25p8853lVUlp+4V7Z+RjvG
	eH9IVJTphHoSQQFXsUIzQ
X-Received: by 2002:a05:6a20:7494:b0:174:373b:4381 with SMTP id p20-20020a056a20749400b00174373b4381mr3583338pzd.49.1699836176467;
        Sun, 12 Nov 2023 16:42:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+UqzLZrYxi+tnG161U/VKxrumNhVvJntX1X+LzLVicHXhCNQwDg9kYlUeFf4mFvRVo9YyxA==
X-Received: by 2002:a05:6a20:7494:b0:174:373b:4381 with SMTP id p20-20020a056a20749400b00174373b4381mr3583318pzd.49.1699836176231;
        Sun, 12 Nov 2023 16:42:56 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id q23-20020a62e117000000b006c0328b2440sm2948031pfh.150.2023.11.12.16.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:42:55 -0800 (PST)
Message-ID: <a51eab2e-5d23-420a-a46e-aad79af1ad50@redhat.com>
Date: Mon, 13 Nov 2023 10:42:46 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/22] drivers: base: Allow parts of
 GENERIC_CPU_DEVICES to be overridden
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLG-00CTx8-CG@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLG-00CTx8-CG@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/23 20:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Architectures often have extra per-cpu work that needs doing
> before a CPU is registered, often to determine if a CPU is
> hotpluggable.
> 
> To allow the ACPI architectures to use GENERIC_CPU_DEVICES, move
> the cpu_register() call into arch_register_cpu(), which is made __weak
> so architectures with extra work can override it.
> This aligns with the way x86, ia64 and loongarch register hotplug CPUs
> when they become present.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Changes since RFC:
>   * Dropped __init from x86/ia64 arch_register_cpu()
> Changes since RFC v2:
>   * Dropped unnecessary Loongarch asm/cpu.h changes
> ---
>   drivers/base/cpu.c  | 14 ++++++++++----
>   include/linux/cpu.h |  4 ++++
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


