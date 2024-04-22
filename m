Return-Path: <linux-doc+bounces-14738-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 719AF8AC822
	for <lists+linux-doc@lfdr.de>; Mon, 22 Apr 2024 10:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFDC31F21A6D
	for <lists+linux-doc@lfdr.de>; Mon, 22 Apr 2024 08:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6918A54FA3;
	Mon, 22 Apr 2024 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CEMHhUch"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C80554FB5
	for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713775995; cv=none; b=aaSAQmc7RHCIIXqOMqk3Qm7jr4Q4w7E7bNJPzm+83kgTFB/jv9SMGULgSAL3gGAYVc8ygOExmyEjjx6/urJb0SrGrHpT4oD2iZaSPJwQ4kyVHXmop5JnCnwd5ToMYZU2swubQgwke+8wxDrfvAmlIVZ4hTZL7ZnRAG1ZPRkVYgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713775995; c=relaxed/simple;
	bh=knFRrVHv/hXP0hrnXxi3FsPJj1U2CbJeo94T4pn0sEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVwiutFZ03BH0kXgVHEcpFRSLEjFZpd3fIpMCCwWZrPb5gONzrW0XxAaWogTIn8AZ3IqOD34ImCRkjAg51olb7mYizRVoDXiuEurrLMlWG5zmpOpv7VyM0lFXr5QDR7hZkF5Wm0In9GrXQ+CZzcou/GiSm3IpWLXQB0ue1JpAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CEMHhUch; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-349fd1d3723so858720f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713775992; x=1714380792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSJifQLOOtjWe2caLguw5JxOp3zY6VKsL2huHk/+dLw=;
        b=CEMHhUchJNQvjTBZSnWxa7JlW45AdnicxGM+sHRNdpG1+LKLOPYb4xITd0rL0jIdHe
         S4pxZqdrFFzKGeGJib+2edypzIEAjo/0g3CDY1AhJUBklADPmPp6Jzh06Awlx65aDdjM
         XWGDJUW7MzDHZXbutnNghNLiyyjxxgZbrlqka6XzPcGVNXJ3J+vDQ9ImGQa033nDfE4x
         VUnDi2xDFhXEYq5EbhNg6uNixK5eBsiB/iNT2K8Qa2bTwp6sh5ao7QHTXhDiNK464lA0
         nlYs81raAp67lAo8YoA1e7ysTStznB7LSv597bPrlFWjE3zj0k7m6lOJ78E6Tuocs2JB
         KSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713775992; x=1714380792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BSJifQLOOtjWe2caLguw5JxOp3zY6VKsL2huHk/+dLw=;
        b=tFdROozCEUdup81YKGrhsjtbtjmeHwUAAIE82MRT41x9F2k2aAHW+zLbTzzQSKPBn1
         P+QwMjRkBaD99YyftSNavEuSsoxmuAOPNBBKwiS+Ouc4+O84HDeq02Nkhg91SkrI6HH9
         0Aj4p+7VAyErWVBgA+FEikOmmRlfC5eM1+QLaYNYctoUgbBGXMbdqJ94HPhDUia2x/fn
         OtAnYx7/861gTP0hf+vodeEqttaZgVT00IbNo/ZCB8ZK798tk+yHPQpGN9eTRKXGORvJ
         NOaKuRY7eSminrlXxQ47PrO92GerfbtRx67DgJHHTHnGIDhl9b5wugmGZqim7axTyUr8
         vYzA==
X-Forwarded-Encrypted: i=1; AJvYcCU5UHu2xoEvQTI8qpMemGRHQ7mRb/YNYSmkuM5P2qAFEiaeU97Wir+PDjYORydHLzGIHufiw/7BGq9YMTUE763/hxNHmLSZl/u8
X-Gm-Message-State: AOJu0YxhyuXsJlCQUaK20y8qwKqTfKQxbv6UnNov++SDXY2kbAaZ/f6B
	2dfey7mXYwLeHgd2j71GsQRJkSV6CjkySyNvrUHnCMUDgZWuP03Nu/zFFyWNzoM=
X-Google-Smtp-Source: AGHT+IHRas3l39C/N5OldWvLjh8/Ocyg0dgZzgEEfR5deo9HXajPzyL+wuWZHMyf6dRNz3xpRu97wA==
X-Received: by 2002:a05:600c:3b09:b0:418:ef65:4b11 with SMTP id m9-20020a05600c3b0900b00418ef654b11mr7146190wms.2.1713775991653;
        Mon, 22 Apr 2024 01:53:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:dc65:11af:998:225e? ([2a01:e0a:999:a3a0:dc65:11af:998:225e])
        by smtp.gmail.com with ESMTPSA id g7-20020a05600c310700b0041a92bb0c10sm25826wmo.2.2024.04.22.01.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 01:53:11 -0700 (PDT)
Message-ID: <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
Date: Mon, 22 Apr 2024 10:53:10 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
 <20240419-clinic-amusing-d23b1b6d2af2@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240419-clinic-amusing-d23b1b6d2af2@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 19/04/2024 17:51, Conor Dooley wrote:
> On Thu, Apr 18, 2024 at 02:42:27PM +0200, Clément Léger wrote:
>> The Zc* standard extension for code reduction introduces new extensions.
>> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
>> are left out of this patch since they are targeting microcontrollers/
>> embedded CPUs instead of application processors.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/hwcap.h | 4 ++++
>>  arch/riscv/kernel/cpufeature.c | 4 ++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 543e3ea2da0e..b7551bad341b 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -82,6 +82,10 @@
>>  #define RISCV_ISA_EXT_ZACAS		73
>>  #define RISCV_ISA_EXT_XANDESPMU		74
>>  #define RISCV_ISA_EXT_ZIMOP		75
>> +#define RISCV_ISA_EXT_ZCA		76
>> +#define RISCV_ISA_EXT_ZCB		77
>> +#define RISCV_ISA_EXT_ZCD		78
>> +#define RISCV_ISA_EXT_ZCF		79
>>  
>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>>  
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 115ba001f1bc..09dee071274d 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -261,6 +261,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
>> +	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
>> +	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
>> +	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
>> +	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
>>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>  	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> 
> Ye, this looks exactly like what I "feared".

Ok but for instance, Qemu actually set Zc* based on C/F/D. So the ISA
string containing theses dependencies should actually also be allowed.
So should we simply ignore them in the ISA string and always do our own
"post-processing" based on C/F/D ?

Thanks,

Clément

