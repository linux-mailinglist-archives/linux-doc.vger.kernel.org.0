Return-Path: <linux-doc+bounces-38156-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA5DA35F88
	for <lists+linux-doc@lfdr.de>; Fri, 14 Feb 2025 14:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38075169633
	for <lists+linux-doc@lfdr.de>; Fri, 14 Feb 2025 13:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AF9264FB0;
	Fri, 14 Feb 2025 13:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="onuQFLdR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40092264A71
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739541364; cv=none; b=CglbOOgJygGujjWCPXUjTAX8cX34466Iv+j0TjQ37StmQe4UDKvpK1nXtN4Br9O1hpakAfABvvwKKcyxhmta1OwgTyZDDJmOAZogy1mqh05+Y4eZkFxbLBMI4RDozuNNl1xr6a683ADgwjrjJ2IbxU8weAAQKUUZYPvOEIKvnCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739541364; c=relaxed/simple;
	bh=WqHfc85CnIBg5vLEOhk4ICcpaUNYC+QTXUEJ0QrkipU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToDNHLNUXdv5rPViiMPLLgZjdsSVyt+KWvZLcpqWc1VFmfp/p1vJhgllOhHqPrvYEJLiQ6s5GQuVv1V3u5d6oRRPA8JpYtaJsnswstFklKpUhDQ98YUMzni9BKX9MKroTckiM69wIaDEETlDc5zkFB1bD8mDOH47uVwiampUtxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=onuQFLdR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220c665ef4cso30097955ad.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 05:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739541360; x=1740146160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oyv4ckbJAaXr2NOVehbMO+gl4gQRomY2gyYVfwC/7iQ=;
        b=onuQFLdRVanS93hfn2FQa2not2TAsGU/41STQfgHSDZ9RrYcV5Cidb3/n5Yc9x112s
         uKdmY5YDg309lV3diYN5yYDzXc3jSehrT2Vyczr/DpcrWVqOsv41vJ6QVWv2BWG5tYq/
         MNF+t/yajpqMbVdATK9ArdrRIqioKrAvoq8QeYfSfOO/jyYoB6RXe2W4/yLtu8IGAQrM
         LM4jn8msvGkypwCrp91Z6kIfe93XpU/t+HOOn1Q5EJnD9ftg83OjAYFoVFaAhyqxO74g
         W2EcfMXBwCV4Qy/wc6cQWFQAuAtm5mcIt7wEREJnoyN4NlBGXd0FFO0edgMbF/cO8qFw
         5xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739541360; x=1740146160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyv4ckbJAaXr2NOVehbMO+gl4gQRomY2gyYVfwC/7iQ=;
        b=BaMtKqqUqEzAYi2pRK+zGJAY66ZKSYWWVLhHuG/7ryIVP2Dy7XS5HAAC0kl7qhChUd
         vESvTYTSRrOUZpmQwjac1GOx/1mYAPG7cTl62wX8L2ov9bQvI2WK0P1iKKoMxBMsrDsk
         hxpXs1qhV4tQAPofrFAnlvR1YchDLutf9BtTBM3/nSkHkEWpYWMFE8jnlhoBQo9tSrQf
         VfRtXtyVEubF/j98IAWmxdXA30Se59Tjf9W4g5ju5kogifZ3Iq+QZjXwwRksnkbV3yag
         4G/vq603mQVFzjFrwKcDuXwvb3ofs40vrjRXzH01gaxsVe7zy3GgTOaEUOWtLM83Dqi1
         k46A==
X-Forwarded-Encrypted: i=1; AJvYcCVxR9VrF/PQ+gmspYfzA/IVYhKr+QzmeOeDPrNZWnUyeN8Bogfvj13y/ocTBJ1DMhdpk93cow9qWm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0aLpCH0L4sUQxmBSSjNGL/IRGiQY4OOw6s+i7Sy/+uoEVRHP
	wmsPk7uRqOcLcqQkCwHtLyrazVxP87oeSdAs55BQxTBCjPpYGKonqdNVO7YvTAo=
X-Gm-Gg: ASbGncvlpB/kB96yny6hEz5RqtGEYCyGXIXOEnD7GeUtFKlp5KNGD9lIeO2Lhe5V0Jh
	2H1HQPHM+XCsWIlkOkZL7Ru1mVNWy7i6wNap/XWvJ0O/zavQyqk+RimAfaBd8Wh2NdGFUZS1t6K
	8gZLglWEVgFSTvq7wrQhYiWB6C1VtZgGw1WwgxjoB2SYeEMiA6b7Tp9sQjpd+bi4Q10+2TTw4pF
	qu8EWxYS2fAqgY8CZFZ/YkEPPDNfHEjfbwJNKDWoGeqL6nYAdU6DErDukRtWzQMI0q4dWpxkwEL
	yl7iMx/gAaNUtIINRmgJRjDBfkWoOc5gpeT0xcZwQZnpdCgQT2Ncw7UdcOn5
X-Google-Smtp-Source: AGHT+IFJG8yJSXBwAOW5a3Rg7tds7wmeju3GEMDTQvcg2LBmbQ5NCSQTLylp178QmOw/Q0qstwEZFw==
X-Received: by 2002:a05:6a00:2da7:b0:730:9446:4d75 with SMTP id d2e1a72fcca58-7322c5fd357mr16415480b3a.17.1739541360271;
        Fri, 14 Feb 2025 05:56:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242568b03sm3233341b3a.54.2025.02.14.05.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 05:55:59 -0800 (PST)
Message-ID: <57fbc08b-73fa-464f-b960-c4511d27598b@rivosinc.com>
Date: Fri, 14 Feb 2025 14:55:46 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] RISC-V: KVM: add support for FWFT SBI extension
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-15-cleger@rivosinc.com>
 <Z6rmrqbNtHxmjI0X@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6rmrqbNtHxmjI0X@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/02/2025 06:57, Deepak Gupta wrote:
> On Mon, Feb 10, 2025 at 10:35:47PM +0100, Clément Léger wrote:
>> Add basic infrastructure to support the FWFT extension in KVM.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>> arch/riscv/include/asm/kvm_host.h          |   4 +
>> arch/riscv/include/asm/kvm_vcpu_sbi.h      |   1 +
>> arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  37 ++++
>> arch/riscv/include/uapi/asm/kvm.h          |   1 +
>> arch/riscv/kvm/Makefile                    |   1 +
>> arch/riscv/kvm/vcpu_sbi.c                  |   4 +
>> arch/riscv/kvm/vcpu_sbi_fwft.c             | 187 +++++++++++++++++++++
>> 7 files changed, 235 insertions(+)
>> create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>> create mode 100644 arch/riscv/kvm/vcpu_sbi_fwft.c
>>
>> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/
>> asm/kvm_host.h
>> index bb93d2995ea2..c0db61ba691a 100644
>> --- a/arch/riscv/include/asm/kvm_host.h
>> +++ b/arch/riscv/include/asm/kvm_host.h
>> @@ -19,6 +19,7 @@
>> #include <asm/kvm_vcpu_fp.h>
>> #include <asm/kvm_vcpu_insn.h>
>> #include <asm/kvm_vcpu_sbi.h>
>> +#include <asm/kvm_vcpu_sbi_fwft.h>
>> #include <asm/kvm_vcpu_timer.h>
>> #include <asm/kvm_vcpu_pmu.h>
>>
>> @@ -281,6 +282,9 @@ struct kvm_vcpu_arch {
>>     /* Performance monitoring context */
>>     struct kvm_pmu pmu_context;
>>
>> +    /* Firmware feature SBI extension context */
>> +    struct kvm_sbi_fwft fwft_context;
>> +
>>     /* 'static' configurations which are set only once */
>>     struct kvm_vcpu_config cfg;
>>
>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/
>> include/asm/kvm_vcpu_sbi.h
>> index cb68b3a57c8f..ffd03fed0c06 100644
>> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> @@ -98,6 +98,7 @@ extern const struct kvm_vcpu_sbi_extension
>> vcpu_sbi_ext_hsm;
>> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
>> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
>> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
>> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
>> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>>
>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/
>> include/asm/kvm_vcpu_sbi_fwft.h
>> new file mode 100644
>> index 000000000000..5782517f6e08
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2025 Rivos Inc.
>> + *
>> + * Authors:
>> + *     Clément Léger <cleger@rivosinc.com>
>> + */
>> +
>> +#ifndef __KVM_VCPU_RISCV_FWFT_H
>> +#define __KVM_VCPU_RISCV_FWFT_H
>> +
>> +#include <asm/sbi.h>
>> +
>> +struct kvm_sbi_fwft_config;
>> +struct kvm_vcpu;
>> +
> 
> 
> Can we add some comments here for future fwft providers along below lines?
> 
> Reason being, patch defaults to `conf->supported = true` if `supported` fn
> pointer in `kvm_sbi_fwft_feature` was NULL. Although `kvm_sbi_fwft_set/get`
> does get/set fn pointers (it would happen even if `supported` fn pointer
> was NULL).

Yes sure, I'll add some kernel doc comments.

Thanks,

Clément

> 
>> +struct kvm_sbi_fwft_feature {
>> +    enum sbi_fwft_feature_t id;
>     /* If function not provided, KVM will default assume to be true */
>> +    bool (*supported)(struct kvm_vcpu *vcpu);
>     /* Must always provide function pointers for get/set */
>> +    int (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config
>> *conf, unsigned long value);
>> +    int (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config
>> *conf, unsigned long *value);
> 
> 
>> +};
>> +
>> +struct kvm_sbi_fwft_config {
>> +    const struct kvm_sbi_fwft_feature *feature;
>> +    bool supported;
>> +    unsigned long flags;
>> +};
>> +
>> +/* FWFT data structure per vcpu */
>> +struct kvm_sbi_fwft {
>> +    struct kvm_sbi_fwft_config *configs;
>> +};
>> +
>> +#define vcpu_to_fwft(vcpu) (&(vcpu)->arch.fwft_context)
>> +
>> +#endif /* !__KVM_VCPU_RISCV_FWFT_H */
>> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/
>> uapi/asm/kvm.h
>> index f06bc5efcd79..fa6eee1caf41 100644
>> --- a/arch/riscv/include/uapi/asm/kvm.h
>> +++ b/arch/riscv/include/uapi/asm/kvm.h
>> @@ -202,6 +202,7 @@ enum KVM_RISCV_SBI_EXT_ID {
>>     KVM_RISCV_SBI_EXT_DBCN,
>>     KVM_RISCV_SBI_EXT_STA,
>>     KVM_RISCV_SBI_EXT_SUSP,
>> +    KVM_RISCV_SBI_EXT_FWFT,
>>     KVM_RISCV_SBI_EXT_MAX,
>> };
>>
>> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
>> index 4e0bba91d284..06e2d52a9b88 100644
>> --- a/arch/riscv/kvm/Makefile
>> +++ b/arch/riscv/kvm/Makefile
>> @@ -26,6 +26,7 @@ kvm-y += vcpu_onereg.o
>> kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
>> kvm-y += vcpu_sbi.o
>> kvm-y += vcpu_sbi_base.o
>> +kvm-y += vcpu_sbi_fwft.o
>> kvm-y += vcpu_sbi_hsm.o
>> kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_sbi_pmu.o
>> kvm-y += vcpu_sbi_replace.o
>> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
>> index f81f06f82650..3b37deaed4e7 100644
>> --- a/arch/riscv/kvm/vcpu_sbi.c
>> +++ b/arch/riscv/kvm/vcpu_sbi.c
>> @@ -78,6 +78,10 @@ static const struct kvm_riscv_sbi_extension_entry
>> sbi_ext[] = {
>>         .ext_idx = KVM_RISCV_SBI_EXT_STA,
>>         .ext_ptr = &vcpu_sbi_ext_sta,
>>     },
>> +    {
>> +        .ext_idx = KVM_RISCV_SBI_EXT_FWFT,
>> +        .ext_ptr = &vcpu_sbi_ext_fwft,
>> +    },
>>     {
>>         .ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>>         .ext_ptr = &vcpu_sbi_ext_experimental,
>> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/
>> vcpu_sbi_fwft.c
>> new file mode 100644
>> index 000000000000..fe608bf16558
>> --- /dev/null
>> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
>> @@ -0,0 +1,187 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025 Rivos Inc.
>> + *
>> + * Authors:
>> + *     Clément Léger <cleger@rivosinc.com>
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/err.h>
>> +#include <linux/kvm_host.h>
>> +#include <asm/cpufeature.h>
>> +#include <asm/sbi.h>
>> +#include <asm/kvm_vcpu_sbi.h>
>> +#include <asm/kvm_vcpu_sbi_fwft.h>
>> +
>> +static const enum sbi_fwft_feature_t kvm_fwft_defined_features[] = {
>> +    SBI_FWFT_MISALIGNED_EXC_DELEG,
>> +    SBI_FWFT_LANDING_PAD,
>> +    SBI_FWFT_SHADOW_STACK,
>> +    SBI_FWFT_DOUBLE_TRAP,
>> +    SBI_FWFT_PTE_AD_HW_UPDATING,
>> +    SBI_FWFT_POINTER_MASKING_PMLEN,
>> +};
>> +
>> +static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(kvm_fwft_defined_features); i++) {
>> +        if (kvm_fwft_defined_features[i] == feature)
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static const struct kvm_sbi_fwft_feature features[] = {
>> +};
>> +
>> +static struct kvm_sbi_fwft_config *
>> +kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum
>> sbi_fwft_feature_t feature)
>> +{
>> +    int i = 0;
>> +    struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
>> +
>> +    for (i = 0; i < ARRAY_SIZE(features); i++) {
>> +        if (fwft->configs[i].feature->id == feature)
>> +            return &fwft->configs[i];
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, unsigned long
>> feature,
>> +                struct kvm_sbi_fwft_config **conf)
>> +{
>> +    struct kvm_sbi_fwft_config *tconf;
>> +
>> +    /* Feature are defined as 32 bits identifiers */
>> +    if (feature & ~(BIT_ULL(32) - 1))
>> +        return SBI_ERR_INVALID_PARAM;
>> +
>> +    tconf = kvm_sbi_fwft_get_config(vcpu, feature);
>> +    if (!tconf) {
>> +        if (kvm_fwft_is_defined_feature(feature))
>> +            return SBI_ERR_NOT_SUPPORTED;
>> +
>> +        return SBI_ERR_DENIED;
>> +    }
>> +
>> +    if (!tconf->supported)
>> +        return SBI_ERR_NOT_SUPPORTED;
>> +
>> +    *conf = tconf;
>> +
>> +    return SBI_SUCCESS;
>> +}
>> +
>> +static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, unsigned long
>> feature,
>> +                unsigned long value, unsigned long flags)
>> +{
>> +    int ret;
>> +    struct kvm_sbi_fwft_config *conf;
>> +
>> +    ret = kvm_fwft_get_feature(vcpu, feature, &conf);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if ((flags & ~SBI_FWFT_SET_FLAG_LOCK) != 0)
>> +        return SBI_ERR_INVALID_PARAM;
>> +
>> +    if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
>> +        return SBI_ERR_DENIED_LOCKED;
>> +
>> +    conf->flags = flags;
>> +
>> +    return conf->feature->set(vcpu, conf, value);
>> +}
>> +
>> +static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long
>> feature,
>> +                unsigned long *value)
>> +{
>> +    int ret;
>> +    struct kvm_sbi_fwft_config *conf;
>> +
>> +    ret = kvm_fwft_get_feature(vcpu, feature, &conf);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return conf->feature->get(vcpu, conf, value);
>> +}
>> +
>> +static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct
>> kvm_run *run,
>> +                    struct kvm_vcpu_sbi_return *retdata)
>> +{
>> +    int ret = 0;
>> +    struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
>> +    unsigned long funcid = cp->a6;
>> +
>> +    switch (funcid) {
>> +    case SBI_EXT_FWFT_SET:
>> +        ret = kvm_sbi_fwft_set(vcpu, cp->a0, cp->a1, cp->a2);
>> +        break;
>> +    case SBI_EXT_FWFT_GET:
>> +        ret = kvm_sbi_fwft_get(vcpu, cp->a0, &retdata->out_val);
>> +        break;
>> +    default:
>> +        ret = SBI_ERR_NOT_SUPPORTED;
>> +        break;
>> +    }
>> +
>> +    retdata->err_val = ret;
>> +
>> +    return 0;
>> +}
>> +
>> +static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
>> +{
>> +    struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
>> +    const struct kvm_sbi_fwft_feature *feature;
>> +    struct kvm_sbi_fwft_config *conf;
>> +    int i;
>> +
>> +    fwft->configs = kcalloc(ARRAY_SIZE(features), sizeof(struct
>> kvm_sbi_fwft_config),
>> +                GFP_KERNEL);
>> +    if (!fwft->configs)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(features); i++) {
>> +        feature = &features[i];
>> +        conf = &fwft->configs[i];
>> +        if (feature->supported)
>> +            conf->supported = feature->supported(vcpu);
>> +        else
>> +            conf->supported = true;
>> +
>> +        conf->feature = feature;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void kvm_sbi_ext_fwft_deinit(struct kvm_vcpu *vcpu)
>> +{
>> +    struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
>> +
>> +    kfree(fwft->configs);
>> +}
>> +
>> +static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
>> +{
>> +    int i = 0;
>> +    struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
>> +
>> +    for (i = 0; i < ARRAY_SIZE(features); i++)
>> +        fwft->configs[i].flags = 0;
>> +}
>> +
>> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
>> +    .extid_start = SBI_EXT_FWFT,
>> +    .extid_end = SBI_EXT_FWFT,
>> +    .handler = kvm_sbi_ext_fwft_handler,
>> +    .init = kvm_sbi_ext_fwft_init,
>> +    .deinit = kvm_sbi_ext_fwft_deinit,
>> +    .reset = kvm_sbi_ext_fwft_reset,
>> +};
>> -- 
>> 2.47.2
>>
>>


