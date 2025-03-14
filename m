Return-Path: <linux-doc+bounces-40843-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCEDA60FDE
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 12:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5B993BC717
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 11:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F95A1FECBA;
	Fri, 14 Mar 2025 11:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bqbPhERJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753F1FE45A
	for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741951290; cv=none; b=Q8wWv5ShT1V5/ukjCLiF7yxR7xRnHEbNmMkahjzFjnutKXTuJLZx9imXwEmNk8/orRNON6vl6vSnZjbHaaEq9l3jr98WMyzPbGcw9/lnpuJM8pXM80U6VX9fPruaEXNNIO4WWokocdNAjmobP8ngDIeyBC3IHad04jP85gqKhUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741951290; c=relaxed/simple;
	bh=CxQhkQEHcVp50sqGLhhVeW5rEWOlyU0IM4BxFtlaXac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtA4K+RwPD3ic8ZYpQHnGNLg2UyH03VJjxA93CQ3afELzUJ0FY9xeC40uEQ+VwRqWs6SUFFptvLUcSOexkTd9fzM9/yFHS9WVckEADG4gmctKShAFD3Ga3EDfL8QVEa7zHNwMuIouMARY3SZVPjqMmOAjhehOW9jfRzBxW71xu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bqbPhERJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so17693455e9.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741951286; x=1742556086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6XtzYhqUw84uSezb9doRczkUr+a5kXQaPrl1FQvJuA=;
        b=bqbPhERJhaprC4ZfVm+Gk5HBFmD7bbvxPLmobJO2El7zfnDpyfiecoHumIqThd1N9M
         iBBL+b5bpcuY3EbOAzIPRvhW6Vd16Pa5IaRf/lZRJCqYAT8Ts4AKezOLRvVj5ELk4xT3
         wPjLpNH8Vegf/e0OyB9D2d8KG1ycm1+VV6Odtbi7kgtyhawG31/6qmxoLret/r15zUnD
         PtaQSzLbbjcrthDqFSCSdvkRed7WGWe6TLrwFb+Ovn7UfGss3YVastAAicQQQlaMDxd/
         75SVmd80NoiH13GOgyzR0zBqCR/1nTfZeNzHJag0+8yj4wzntj2OyXJ7bTp0x7gPdY86
         UPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951286; x=1742556086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6XtzYhqUw84uSezb9doRczkUr+a5kXQaPrl1FQvJuA=;
        b=neG9+2B/WGWFf+V1xa9XrkgE/IWTy447XeOvmPq8wCWprQjPXuFlgNFR0GxyltRr+t
         9C/Fh+WycmgsfepIG5xKGpKpAZjV9KDyS/SZgMwcGCrnQs4Hqx/w63NuLZaoz0sHrZO5
         ZhNyYkPQjTadgURwW8irNgrn8hS6yLDWrInhoFTpk5F+L9raUWCwghThqHKEdXkPYSKD
         OKY5cMgR6HkiHPugGVnAem5/Au85P1RmfGoYfqlVPbEKSslD0QdsfKZwGlyO4uQwyblt
         6+PgAW15lPz73naiOiwVmQasmvjQl2lCTCTB2lUgo09oVtOMwVUNj700wumgCKdvRFJE
         3DOA==
X-Forwarded-Encrypted: i=1; AJvYcCVYe7RHbymiH87klcCOlYMMxierQJ5NH2k7m641KHliSsbZKbVmf8SN2hIWcV12lj6/J3jobLeV+x0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJYnMS01INF14WCQyVHoqpbbAMIqnJQ7AZq5FlW45cpcG29XPB
	tE/5PqrM6SyJF4L0mfNZdyBw/y3ORwPHup/8eIkHYxf2xamB1z7Yhcz/BqWuxWM=
X-Gm-Gg: ASbGncvwmp2AAMv5+vFUE6JYWPKewnjTf5n+M1gEwnxxIgm16YqJPIGnGgJZuYpLM6b
	oWSMzBRWAurBQa0uKmHz2PILpyDr8WlEBeWFakq/26GQKUPRYxKVV2yEMhIVLTUUPpCQX/xFN28
	JyOYwBFWvHdLd1DWq05q2NQeWt9A+kLzyFV6SSYMQcNcduN9vzZJIUmH7lI5bKjIGW3+wBfQZnc
	gQj/x/2CA14AbXWyEJ6v9Wo9cnmah1EnXIg95dwvAK6AvGWePsjEWAYU9uVQ8ElByWyLqDSziqs
	tUKMLYbh4yCq85INSHw25xIXKDsV0nqaFI0BjGEGht3Na2qM8l+sEERhSBY4m/cnY6JlV8imstQ
	nyTYbtL+QFKyA5w==
X-Google-Smtp-Source: AGHT+IEYaWqqZpuQnf2ljZyi0dtBkuDfK6pK0aoroD3vMSUCfCqdnElivAtTAt81Xq+zCSEqCysJ0Q==
X-Received: by 2002:a05:600c:190e:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43d1ec808ebmr27086195e9.13.1741951285516;
        Fri, 14 Mar 2025 04:21:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fac7asm14341405e9.28.2025.03.14.04.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:21:25 -0700 (PDT)
Message-ID: <c411446b-e161-48fa-a94b-e04c00f62b01@rivosinc.com>
Date: Fri, 14 Mar 2025 12:21:24 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/17] riscv: sbi: add SBI FWFT extension calls
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-4-cleger@rivosinc.com>
 <20250313-ce439653d16b484dba6a8d3e@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-ce439653d16b484dba6a8d3e@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 13/03/2025 13:44, Andrew Jones wrote:
> On Mon, Mar 10, 2025 at 04:12:10PM +0100, Clément Léger wrote:
>> Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
>> provided as a separate commit that can be left out if needed.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  arch/riscv/kernel/sbi.c | 30 ++++++++++++++++++++++++++++--
>>  1 file changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
>> index 256910db1307..af8e2199e32d 100644
>> --- a/arch/riscv/kernel/sbi.c
>> +++ b/arch/riscv/kernel/sbi.c
>> @@ -299,9 +299,19 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
>>  	return 0;
>>  }
>>  
>> +static bool sbi_fwft_supported;
>> +
>>  int sbi_fwft_get(u32 feature, unsigned long *value)
>>  {
>> -	return -EOPNOTSUPP;
>> +	struct sbiret ret;
>> +
>> +	if (!sbi_fwft_supported)
>> +		return -EOPNOTSUPP;
>> +
>> +	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_GET,
>> +			feature, 0, 0, 0, 0, 0);
>> +
>> +	return sbi_err_map_linux_errno(ret.error);
>>  }
>>  
>>  /**
>> @@ -314,7 +324,15 @@ int sbi_fwft_get(u32 feature, unsigned long *value)
>>   */
>>  int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
>>  {
>> -	return -EOPNOTSUPP;
>> +	struct sbiret ret;
>> +
>> +	if (!sbi_fwft_supported)
>> +		return -EOPNOTSUPP;
>> +
>> +	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
>> +			feature, value, flags, 0, 0, 0);
>> +
>> +	return sbi_err_map_linux_errno(ret.error);
> 
> sbi_err_map_linux_errno() doesn't know about SBI_ERR_DENIED_LOCKED.

Not only it doesn't knows about DENIED_LOCKED but also another bunch of
errors. I'll add them in a separate commit.

> 
>>  }
>>  
>>  struct fwft_set_req {
>> @@ -389,6 +407,9 @@ static int sbi_fwft_feature_local_set(u32 feature, unsigned long value,
>>  int sbi_fwft_all_cpus_set(u32 feature, unsigned long value, unsigned long flags,
>>  			  bool revert_on_fail)
>>  {
>> +	if (!sbi_fwft_supported)
>> +		return -EOPNOTSUPP;
>> +
>>  	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
>>  		return sbi_fwft_set(feature, value, flags);
>>  
>> @@ -719,6 +740,11 @@ void __init sbi_init(void)
>>  			pr_info("SBI DBCN extension detected\n");
>>  			sbi_debug_console_available = true;
>>  		}
>> +		if ((sbi_spec_version >= sbi_mk_version(2, 0)) &&
> 
> Should check sbi_mk_version(3, 0)

Oh yes that was for testing purpose and I incorrectly squashed it.

> 
>> +		    (sbi_probe_extension(SBI_EXT_FWFT) > 0)) {
>> +			pr_info("SBI FWFT extension detected\n");
>> +			sbi_fwft_supported = true;
>> +		}
>>  	} else {
>>  		__sbi_set_timer = __sbi_set_timer_v01;
>>  		__sbi_send_ipi	= __sbi_send_ipi_v01;
>> -- 
>> 2.47.2
>>
> 

Thanks,

Clément

> Thanks,
> drew


