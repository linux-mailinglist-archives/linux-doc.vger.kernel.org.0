Return-Path: <linux-doc+bounces-2114-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 731237E781B
	for <lists+linux-doc@lfdr.de>; Fri, 10 Nov 2023 04:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 969C51C20C95
	for <lists+linux-doc@lfdr.de>; Fri, 10 Nov 2023 03:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24F315CE;
	Fri, 10 Nov 2023 03:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b5345Xd4"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9498B1868
	for <linux-doc@vger.kernel.org>; Fri, 10 Nov 2023 03:37:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0C0468E
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 19:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699587444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pROeszy9ePncz4nZyjZpb065/8N1ucMk0OODbP+hams=;
	b=b5345Xd4CfAHxovucD90DpRX2u+HjGodmOo2tM1PmGl9pbs2YS6YMFg3bqB0yoWOn1BbbP
	kSRaQ7GbD/VFxoBBbMZmqlPSaliyNc6mf939PPMsN/5At0ps8De3tzo/lvpMo0Zeyv3N1Z
	QtstkZ2hLbue4IfyLhwRBcqnee8hqNw=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-TfFUksFTOXyU9NsuM76kyg-1; Thu, 09 Nov 2023 22:37:23 -0500
X-MC-Unique: TfFUksFTOXyU9NsuM76kyg-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3b3ecd1be0bso67898b6e.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Nov 2023 19:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699587442; x=1700192242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pROeszy9ePncz4nZyjZpb065/8N1ucMk0OODbP+hams=;
        b=ClkES4uvCUoRpQKImAjTmwmby6AVPHzncl/KYuSiqJQw2ikj5P3A6ip88yJvxlO2C3
         /Y6rKb/4VdhqirtfSyA3RvH+y+mSIyqVI71wUQZTJ8czyPc3i85uvb1EvWMQDKqFdm5A
         Gg6RC/xdzscsyglrusZKMPZ+YSDI5yujdsNDkbnAHNrMW7BbCQKv010F9aVVI3p+fybE
         Iu0tZJ8VBU1wLuomM7s36NCTWEYW0MoGL2EQ/clRLbZeiMrm0ybF4dyBxeL82BPQHE2Z
         djkF6mNLHW+j2rQEhMpUB9CZ7XZQ961QXH3xsFmEBtcqA4souvrtqcWt+/44AGbVYREO
         2MYQ==
X-Gm-Message-State: AOJu0YwbILj81irV2HkW2ZQ8Cly4w6CMH2iea/0pwWjd05ONSTeh0mUN
	ZKx6gruWQDQbZgdzRiKMtXF3IVbeTscbmsCidIkFNRQtc5HDZ8/U6yA37ZDbhHGuu7BVtMLNha6
	d4CMK3rKgCWu9/pCfnBWN
X-Received: by 2002:a05:6808:199c:b0:3a9:e8e2:579d with SMTP id bj28-20020a056808199c00b003a9e8e2579dmr8276244oib.2.1699587442421;
        Thu, 09 Nov 2023 19:37:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPdXOyaUAzV6aldemEymWFIQu5uK8SS6EoZEeBtta4Ue7SEB3JH44cFaCIyyqf1iZkLKsTPg==
X-Received: by 2002:a05:6808:199c:b0:3a9:e8e2:579d with SMTP id bj28-20020a056808199c00b003a9e8e2579dmr8276228oib.2.1699587442206;
        Thu, 09 Nov 2023 19:37:22 -0800 (PST)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id e8-20020a63d948000000b005a9b20408a7sm5370547pgj.23.2023.11.09.19.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 19:37:21 -0800 (PST)
Message-ID: <fd78bb81-1f83-13a4-ec37-3fe0cd040ec0@redhat.com>
Date: Fri, 10 Nov 2023 11:37:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC 14/22] arm64: convert to arch_cpu_is_hotpluggable()
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
 <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <E1r0JLq-00CTxq-CF@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/7/23 18:30, Russell King (Oracle) wrote:
> Convert arm64 to use the arch_cpu_is_hotpluggable() helper rather than
> arch_register_cpu().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/kernel/setup.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 165bd2c0dd5a..42c690bb2d60 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -402,13 +402,9 @@ static inline bool cpu_can_disable(unsigned int cpu)
>   	return false;
>   }
>   
> -int arch_register_cpu(int num)
> +bool arch_cpu_is_hotpluggable(int num)
>   {
> -	struct cpu *cpu = &per_cpu(cpu_devices, num);
> -
> -	cpu->hotpluggable = cpu_can_disable(num);
> -
> -	return register_cpu(cpu, num);
> +	return cpu_can_disable(num);
>   }
>   
>   static void dump_kernel_offset(void)

-- 
Shaoqin


