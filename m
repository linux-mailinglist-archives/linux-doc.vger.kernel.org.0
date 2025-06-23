Return-Path: <linux-doc+bounces-50218-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC9EAE4CC2
	for <lists+linux-doc@lfdr.de>; Mon, 23 Jun 2025 20:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2742A189912E
	for <lists+linux-doc@lfdr.de>; Mon, 23 Jun 2025 18:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC161278767;
	Mon, 23 Jun 2025 18:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ruqqH37R"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1852223328
	for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703121; cv=none; b=cP+6ObnkSFAymN0lGF/yKnnNohH4km/8d5gsuNSwzjd7stndizjX5UeGxN7LwlK+7/mrwTb7Lt1xFi/mmiYSqUU6QaH0GAc0HgSfQqknaSS6L1MpuNLIUz7vseGjxjK3YT/O7xSjKisXyblz/aIKnjGtWacQJUIhhqkXateaoio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703121; c=relaxed/simple;
	bh=Ig5ipTdJADEoDAWoOphXIpyhS5e+nFJQDKH78u7uCTg=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Q9ycPmocmqhD0GbynegK1nXbnLMKeUjSLnPF74SddZX6r3HSSH7pod9K6szwzUmjLm+USqMnbcLnHmRuNyFY8a9aZchKl/xJYqzGGglsEabqujrqwpGdNNFU532uTM3lqCZt8un3egUU0BIg+9b3k/f/Z2GDQM78ahF7K2B2p+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ruqqH37R; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddc9e145daso79678265ab.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750703118; x=1751307918; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkKX/+jmAY5EI28pxMDSbALm6PmjD/WT98j0aaxzD8Y=;
        b=ruqqH37RFF7eaGFYweG4zc0KShUaBLkbO2jPfyZFXYkdv1y+P4JAp9eD3XzaPNtKxX
         QjqblPL9cAYN5HnjHxTgCW6LQqTusUBrX90eWdxnrQlVWMK8rIA42KM+e7tu2ZP2LRoH
         tuAWRg2xttBPbcZSzTi9rJh76jrSW70dD8ldrMcScdlGJcWQ3fWUPnBGEw2b+RR+xkRa
         NKM3/Kx+9iHyYeh8HAUIjgOARiPiVs8buCICiCYcg1TKf9dnW0MQVU5QDXXS3HK0GDDM
         kP2hlo6PHDStaBxYMFXFp8MIyWXoOKjp6MlNeVWc1C+v1mRFUwXLQV4SS85ngSMR6xoS
         Akng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703118; x=1751307918;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkKX/+jmAY5EI28pxMDSbALm6PmjD/WT98j0aaxzD8Y=;
        b=tKafa3KyYY+n6Kz3TzmMwQPFrSyMxKco1ZFRw556rK2hrT2vKXm4WQpl/u5Dl9SSLO
         nEuqz88Dkfha53fCQzj9Ffzmljg/tbHYbAH89EZq3a+3+3vtd4b92872pDXc9q015l03
         vaVPn+rDbFK5XOMG3u32i1444cgfMKCaXtWRf4YgFxDbdSjH7DttEXj0TIjaCyfvPi6a
         cNIW8/+GU7wdUdz1kNORkdqxzNDD8ANmMhTnuVy4jyuEfXRKAu2lcXhN92BupNIt5V+8
         tTdjm7wY3SoYvRlGqdBCCaClOLJAHjM4v8IhgEGJKMUSgd3XR7MLgQF80yFKcmei/HuG
         EtaA==
X-Forwarded-Encrypted: i=1; AJvYcCUkHMDYbwxz5f8nZiLhbUT+7vzloo+nBrUZiPgkjkhfzk2HRpuUZtdkHmn2JZ+BnZMb1Hwh2YDLFMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqhquhKdonoYpl6X6+BJrrijVI79KXZb6jWmIOhI3Bz0BelW+
	5GHqBRCsAqWjmuO1kEK8t3BqhahVoPCEc6m3Aaq4adb6LF4nV4z3KkRpKbWsFJKVJXF9k5+5Slz
	hzmRmO6UQNIC/q2AO2sJc91I4IA==
X-Google-Smtp-Source: AGHT+IGzBE7m3jRf0szvIWMcwTlET+uxa4mEBdZ8JNu6pA3Bo/Yc8zZA87zzxM+0+5qc5CYD+m3kIHDI/60f4MKLBA==
X-Received: from jay12.prod.google.com ([2002:a05:6638:c2dc:b0:4f0:9e8b:e246])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1806:b0:3de:1200:219f with SMTP id e9e14a558f8ab-3de38cda633mr149171615ab.22.1750703118062;
 Mon, 23 Jun 2025 11:25:18 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:25:16 +0000
In-Reply-To: <aFYAq7GcSx4pTK9Y@linux.dev> (message from Oliver Upton on Fri,
 20 Jun 2025 17:45:31 -0700)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntsejq9uyb.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 03/23] arm64: cpufeature: Add cpucap for PMICNTR
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

Hi Oliver. Thanks for review.

Oliver Upton <oliver.upton@linux.dev> writes:

> On Fri, Jun 20, 2025 at 10:13:03PM +0000, Colton Lewis wrote:
>> Add a cpucap for FEAT_PMUv3_PMICNTR, meaning there is a dedicated
>> instruction counter as well as the cycle counter.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> I don't see this capability being used in this series.

> Thanks,
> Oliver

You are correct it isn't now. I'll take it out.

>> ---
>>   arch/arm64/kernel/cpufeature.c | 7 +++++++
>>   arch/arm64/tools/cpucaps       | 1 +
>>   2 files changed, 8 insertions(+)

>> diff --git a/arch/arm64/kernel/cpufeature.c  
>> b/arch/arm64/kernel/cpufeature.c
>> index 278294fdc97d..85dea9714928 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2904,6 +2904,13 @@ static const struct arm64_cpu_capabilities  
>> arm64_features[] = {
>>   		.matches = has_cpuid_feature,
>>   		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
>>   	},
>> +	{
>> +		.desc = "PMU Dedicated Instruction Counter",
>> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
>> +		.capability = ARM64_HAS_PMICNTR,
>> +		.matches = has_cpuid_feature,
>> +		ARM64_CPUID_FIELDS(ID_AA64DFR1_EL1, PMICNTR, IMP)
>> +	},
>>   #ifdef CONFIG_ARM64_SME
>>   	{
>>   		.desc = "Scalable Matrix Extension",
>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 5b196ba21629..6dd72fcdd612 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -47,6 +47,7 @@ HAS_LSE_ATOMICS
>>   HAS_MOPS
>>   HAS_NESTED_VIRT
>>   HAS_PAN
>> +HAS_PMICNTR
>>   HAS_PMUV3
>>   HAS_S1PIE
>>   HAS_S1POE
>> --
>> 2.50.0.714.g196bf9f422-goog


