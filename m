Return-Path: <linux-doc+bounces-44230-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3555A9AD7B
	for <lists+linux-doc@lfdr.de>; Thu, 24 Apr 2025 14:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 079D87B0BCA
	for <lists+linux-doc@lfdr.de>; Thu, 24 Apr 2025 12:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0127127B4F4;
	Thu, 24 Apr 2025 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ouvFTuPc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262E527A12A
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497926; cv=none; b=VZmLCTed9xSZgwzNhP89KrMb1azIWaVDuQSxvdUFrNPzMHmaw+xbGQq4FrC/Ue44vNeoxC4gSfUyadjvMX0rcUJRf61ffehJnvFMF9fccq5Sjho2CTicZFGMSv2dJBSZOQRKwGB1QTdhoJrXjZnydMzAd07YuupD5TfiDU4F5Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497926; c=relaxed/simple;
	bh=DebhlcyRhbRiLH7Hw/JJUYX8s/MyyC03g3SuMWCXRxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3nasRKbhNSjuDqZhywd1fR4YrJF27MYY8xDUkbmYgjEbnSfLTQ0ITqTCggTDTqyOZVGnZwzzibMeSJrRHme6XqFBllgwgx3OJky0SRfw+Kf1+FG18/RAmmR0Jfk1JJd/EJy7hREW+FtaPPX/4J5YCfJ9sN1AOMJUrfV2HPA0gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ouvFTuPc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c14016868so887919f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745497922; x=1746102722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sjc14tFyag0YtVPIXBTjoyM3oPXcpSiYksqErLNt2L0=;
        b=ouvFTuPcykAOFzZ4V94TFIOqFz3HqBbaFs5gRrjRHOBeQPlpD/q6tjnKPNKE70pztZ
         BlCkmNed/Uob7QUz5I6aG2Ft1Je5Vq0P0G6wBot0svpYOKfJZ5L+Rb34vMY7M793yeXw
         p7zCxEOT5TFb5MLM7HLWfG+R8FaI85cpR2NZt3GJCbDRRUPSRElu/MOlyFYmKxM5srQx
         G2TsyZI2laV9/g4cJJN5noMFVN+laNzgFBOTAuvbUDmv0D75sHqg9iGot1P3wTj9FZjw
         4BGf+hJvfETSyHx0V7U2yHSo2SH2QzStqy0+9zjf4oFMd4iaMFLfYfdKe6kGhecaUgkB
         YfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497922; x=1746102722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjc14tFyag0YtVPIXBTjoyM3oPXcpSiYksqErLNt2L0=;
        b=cuHbjKizJPyI1fv4qox7LTxzEJ+2Mq1Qall0WhSPSokOfGeZItAlvkWVEIRSu0lZXu
         hX1prkAEPNqQA8KiSrSfo6jpv26uWC0haS+1RIhGlytExyUN2HgL3GiPli5E1mcI/MZZ
         QDbldDCRWR29ZQ/AcRkyqrlTL9/TtAAf2D0v/jbdKhZCIz/bcyI+hiAJ8J1A554M1PSD
         lil04W0SBtojBXDrEZCy7MHvIf3cGwXBTUqzXUVclw5yHyE005YelMVPdJOEo23dEw+q
         CPdxhG88vdQHyv+6Kyzk3PSRtq7m9FlApKQtzl4ahDzaX0GILwl5FtAL+9mrz79lz4vl
         y7YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiljss/11OGzCXxilHmOECQuZ4lcnWuGbifCs166AC6uxHgsul1VRNXFc51Z4zwLrj7NoUtzvStCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/WKo+tClGiKh0QyhYcA5rsJqhViKr4YC5RnSuxYqbEnyV6RdM
	ZkLL1rwVDpyJVwCRjl+6jgeJH8MK/t3l3IK2ZzT/Xz7ld5QGFIs9qtka7zVDH2s=
X-Gm-Gg: ASbGnctIM/40Z7NQChEe+9546F7b3rFw6+YSS3IYbZErcGjO0amd2ljPxcnTAbWIcRY
	u3hsLGWpg7lczfhmzxLFJLHi61nTH1IXw85o3KlSBQleUoNR+xokYH3pZCgI/zX4OArMcZyGcXw
	lbkux1EzkkqfkuxczhvL2QEWWTJ5rJIFhjX5mv7hRVxOJw4+rcpIyPEEMZqSrd7BIyuiqTuX7ng
	d7gKRnhzvGN6Kz0T5yQ7deenZM9RcHCAAse2r9Nhrxpnfv2SNEBC/sMVxeKa3kbxy2VShbhheO7
	Jv3eJXBhJL+wgn5eQJMvSPCmo/ByxMDHqNa8kR6YZSKqqeCCJPVSeq44f49aSJcgiggb4uUaA2O
	UtTmsNrBiqw==
X-Google-Smtp-Source: AGHT+IFbJZjPmuMD3YIQwLoJ857azwRhf/epJ6CxLQ+gyc15vU+Ezwb55G76EYJKFKkcG3RmozFEJg==
X-Received: by 2002:a05:6000:2911:b0:39c:e28:5f0d with SMTP id ffacd0b85a97d-3a06cf5ede6mr2159263f8f.25.1745497922377;
        Thu, 24 Apr 2025 05:32:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4b52sm1997065f8f.55.2025.04.24.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:32:01 -0700 (PDT)
Message-ID: <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>
Date: Thu, 24 Apr 2025 14:32:01 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
 <20250424-c85c9d2f189fe4470038b519@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250424-c85c9d2f189fe4470038b519@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/04/2025 13:00, Andrew Jones wrote:
> On Thu, Apr 17, 2025 at 02:19:50PM +0200, Clément Léger wrote:
>> This SBI extensions enables supervisor mode to control feature that are
>> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
>> DTE, etc). Add an interface to set local features for a specific cpu
>> mask as well as for the online cpu mask.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>  arch/riscv/include/asm/sbi.h | 17 +++++++++++
>>  arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
>>  2 files changed, 74 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 7ec249fea880..c8eab315c80e 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
>>  				unsigned long asid);
>>  long sbi_probe_extension(int ext);
>>  
>> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
>> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
>> +			       unsigned long value, unsigned long flags);
> 
> I'm confused by the naming that includes 'local' and 'cpumask' together
> and...
> 
>> +/**
>> + * sbi_fwft_local_set() - Set a feature on all online cpus
>> + * @feature: The feature to be set
>> + * @value: The feature value to be set
>> + * @flags: FWFT feature set flags
>> + *
>> + * Return: 0 on success, appropriate linux error code otherwise.
>> + */
>> +static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
>> +				     unsigned long flags)
>> +{
>> +	return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value, flags);
> 
> ...that something named with just 'local' is applied to all online cpus.
> I've always considered 'local' functions to only affect the calling cpu.

Yeah I thought of that as well, local here refers to the fact that this
function applies for a local feature (as described in the SBI
documentation) but agreed that it's really missleading. Any idea for a
better naming ?

Thanks,

Clément

> 
> Thanks,
> drew


