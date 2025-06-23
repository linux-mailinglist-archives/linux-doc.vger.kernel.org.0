Return-Path: <linux-doc+bounces-50219-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40427AE4CC7
	for <lists+linux-doc@lfdr.de>; Mon, 23 Jun 2025 20:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0CE21899E67
	for <lists+linux-doc@lfdr.de>; Mon, 23 Jun 2025 18:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488C62D4B4B;
	Mon, 23 Jun 2025 18:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M/Vy+IGk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589B242D68
	for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703143; cv=none; b=mUKgg3tS4bqu7hJQgV5RyB0ukS33tJPJlx6gz7UzL9UoqKiydx8S3slylmrnveq43pCc0qMmxr2WrhchplZO9RYDMI/4/CqS1zismtM5b5xMlMgLfCUR3egISirxUrpdh9p7o7QhhxVjxaslN9lTcBCoP7LgE6p+s/+P7PO+wpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703143; c=relaxed/simple;
	bh=2JKqhfr5wu8jd5BKk3NpO7rpJrVsAeJ0qnUtDbuCOi4=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=UJCBIms2642vyG8btnmF2gV/6XqgUjP9LFn+q6SV75ta/3sfQh0YMzaazB/5IYxNBNZiMvHz+vhGVVQIj/rkhzfo66n7vjWIJuibnszjX8Q+Lt+KfW0u0+GiDVZVaqD7DxeWAErQr5nF261ZCrJreo8s7L8DOaJ/bv30wFP2pyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M/Vy+IGk; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3ddd03db21cso78217555ab.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750703139; x=1751307939; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x/yRTajGyCYDVao/uBe3yoYTQK0CCPZeD6lCEoWPGDQ=;
        b=M/Vy+IGkrwrnN27cG6bMS6xRuUM2zr9GfJj9EkwEkSVYvypD0v5XbaAkF/lN3Lc5+g
         vKn1b4Z/n8SaPuK2ZEkZU52cNoIS/Eg4Xq1ReqJDwgeBlW3O6IZhMFmSfNZLiikaoDEJ
         36rvZLJkFBl8H4UUJJTOsSpmiphtii+aZOJaRbSYE7YTEDaaCz1/ssr8v1LDaBN35aRi
         u1JhQ0NW8943ysLWJhgywiLiheGj8llLQUH+IqqIvlb+ginpZOzEaZw7os+wfx6m/POc
         hHv+TiVenoH9Px8HEf1fi7qrPYHFbuCKjwGxx4IymY4a35JtMUFQwQtu0TtIixters6W
         o3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703139; x=1751307939;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/yRTajGyCYDVao/uBe3yoYTQK0CCPZeD6lCEoWPGDQ=;
        b=GaevK57QeK8LHYK9oTM1v4ajsy2ueL3b0GwCYFxyu/8oBx+swQqGRk6XKdeDwI5wj6
         oXA1hGRGRUkGbuXyqoC+aUA1W0usI1ZbO9KJi3FDdf08Ofd6gxdYwoedYDj6iFWrMtYi
         uPaw21UXZbm0DShWz7gRnh5FtVD/JahAmGz4YMJwwV1q4LhUoHvQKaeKftSJncQYnoVr
         2uQz8Gn1qRUmg/keccY4ZnkZsUI7jL6kBOAJr5erAsOJzU9yiUfLEdKWg4p/0mqZ/uaP
         G6PPJzqcnOJDk99jxdPfwi2qiuRwv6f6OOuJn4i2wbBGu5ifAS8h9qzzpx8SuGMOeom4
         ZFDw==
X-Forwarded-Encrypted: i=1; AJvYcCWHsLRuZqRQOlT1Y5QpHa7vb6DlzY6GHjWxEzFOBoHdXRyVbY2QHDmYOcN2zfOMoAELrOP41NWdJdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhzUE8a0JNGKSiyo20jRSigdBOIl2SePlX8faBXb59JVr0APTa
	xe6K2hAQbwd5kh5q4UMKMkhTYpVvA6lDLxeC4fAjGmqJEUtrbnBLHMs+amdyvI8/wK+15z9Y8HX
	wqTfh0hSlKjbbbNL738D1/yv5vQ==
X-Google-Smtp-Source: AGHT+IGB4/D8wn12ZeTFWeXtrV3NuVvtA1SOelvWAjyyu6UmZAX76nv7r6P9O4AsImXh2Otv+muKbiEPiY/O85sZZA==
X-Received: from ilbbr10.prod.google.com ([2002:a05:6e02:23ca:b0:3dd:7629:ec3a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:170d:b0:3dd:e7d6:18bb with SMTP id e9e14a558f8ab-3de38cbfd28mr144801735ab.17.1750703139323;
 Mon, 23 Jun 2025 11:25:39 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:25:38 +0000
In-Reply-To: <aFYAXjzICzgmSyLI@linux.dev> (message from Oliver Upton on Fri,
 20 Jun 2025 17:44:14 -0700)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntqzza9uxp.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 01/23] arm64: cpufeature: Add cpucap for HPMN0
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Fri, Jun 20, 2025 at 10:13:01PM +0000, Colton Lewis wrote:
>> Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
>> counters reserved for the guest.

>> This required changing HPMN0 to an UnsignedEnum in tools/sysreg
>> because otherwise not all the appropriate macros are generated to add
>> it to arm64_cpu_capabilities_arm64_features.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kernel/cpufeature.c | 8 ++++++++
>>   arch/arm64/tools/cpucaps       | 1 +
>>   arch/arm64/tools/sysreg        | 6 +++---
>>   3 files changed, 12 insertions(+), 3 deletions(-)

>> diff --git a/arch/arm64/kernel/cpufeature.c  
>> b/arch/arm64/kernel/cpufeature.c
>> index b34044e20128..278294fdc97d 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -548,6 +548,7 @@ static const struct arm64_ftr_bits ftr_id_mmfr0[] = {
>>   };

>>   static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
>>   	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
>>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
>>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,  
>> ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
>> @@ -2896,6 +2897,13 @@ static const struct arm64_cpu_capabilities  
>> arm64_features[] = {
>>   		.matches = has_cpuid_feature,
>>   		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
>>   	},
>> +	{
>> +		.desc = "Allow MDCR_EL2.HPMN = 0",

> This feedback still stands...

> 		.desc = "HPMN0",

> [*] https://lore.kernel.org/kvm/aD4ijUaSGm9b2g5H@linux.dev/

Sorry for ignoring your previous feedback. I looked at the other .desc
fields and they had more descriptive English, so I think this one should
be more than "FEAT_HPMN0" for consistency.

If you insist I'll change it.

>> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
>> +		.capability = ARM64_HAS_HPMN0,
>> +		.matches = has_cpuid_feature,
>> +		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
>> +	},
>>   #ifdef CONFIG_ARM64_SME
>>   	{
>>   		.desc = "Scalable Matrix Extension",

Here's one example.

>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 10effd4cff6b..5b196ba21629 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -39,6 +39,7 @@ HAS_GIC_CPUIF_SYSREGS
>>   HAS_GIC_PRIO_MASKING
>>   HAS_GIC_PRIO_RELAXED_SYNC
>>   HAS_HCR_NV1
>> +HAS_HPMN0
>>   HAS_HCX
>>   HAS_LDAPR
>>   HAS_LPA2
>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>> index 8a8cf6874298..d29742481754 100644
>> --- a/arch/arm64/tools/sysreg
>> +++ b/arch/arm64/tools/sysreg
>> @@ -1531,9 +1531,9 @@ EndEnum
>>   EndSysreg

>>   Sysreg	ID_AA64DFR0_EL1	3	0	0	5	0
>> -Enum	63:60	HPMN0
>> -	0b0000	UNPREDICTABLE
>> -	0b0001	DEF
>> +UnsignedEnum	63:60	HPMN0
>> +	0b0000	NI
>> +	0b0001	IMP
>>   EndEnum
>>   UnsignedEnum	59:56	ExtTrcBuff
>>   	0b0000	NI
>> --
>> 2.50.0.714.g196bf9f422-goog


