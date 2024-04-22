Return-Path: <linux-doc+bounces-14742-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833DB8ACBC9
	for <lists+linux-doc@lfdr.de>; Mon, 22 Apr 2024 13:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A71A51C22C42
	for <lists+linux-doc@lfdr.de>; Mon, 22 Apr 2024 11:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE82145FEE;
	Mon, 22 Apr 2024 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pNXhE4qy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AF4145FF1
	for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713784471; cv=none; b=fgleT9Ajx6Ad/a/axEZEdTfY9AQ+ixJpkdfiojt+VcaDlaNxj7MBz+4RGeTmXBAvHV1NLys3/i5byN5CJh7Lu/BR00L3piTAZs5/WQ5Qzn2+6GtsRhtpQE/v04lXtUmgJXKpBWkvlXKyGom2LMB/8aIB8C9R9cxs8zQA/1nGCFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713784471; c=relaxed/simple;
	bh=zZ5Qg5WxBAkfsgf85z6RtZBesdjrnTKjsOr6tnZ/Cqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILBWGd+7x2JCSOwrkiTNbEqovK0YjRTWu5rOSVHT13kGPXgNd2q3kWKGoC92s3zllWMbE+4Mnf5jOxOJ9Ele9biTkHiq/g/a63LQJyE7K54NLY+/JG6NTtGFpziF1opphCCy9pnCtzye0KPHSqcOtMj3BHd1kM4uN8v7aeYsdsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pNXhE4qy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34a0cc29757so498890f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713784468; x=1714389268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txTWpp1pw11cuzo3l6Yv3qVL9j61JY83c5SyuufTWno=;
        b=pNXhE4qyq+5L68XkpJZ9k4DIYLY5EVhHt8ZpX4UksINZRYugQIOX0/CQSHWTTBdJOL
         NYLxEpKS9Ju3q+ASPY0odC9Jad8Q83Ji//dxiXqvCuZjqngtJWZghJ0bgdtH9vNetCTT
         lYMRqRVqx20tnMFK2/S86T8Qq+iXx1dEtfFLPdZ89mTISoGQ5achtG5x/0Qs73XKHgli
         6OI7rEJfRyUxL3rDi7G8zDjCo0TuKbJwgBFkkPSOE13kQvr0222+0MFg9i9EJtziApRD
         Zlgj8MT9SLGc4t273aKWYLwgmNjOC8QjiEerI4Q/wq4PKn5z0oWF+W+/EJZFxfbqylq7
         LqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713784468; x=1714389268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txTWpp1pw11cuzo3l6Yv3qVL9j61JY83c5SyuufTWno=;
        b=fHEDvesCd9yDfxB2laheN/bLwuvjy7VFeI1TkamCyystp4l8FQRGuYjA5Yv63eusli
         HxLyWhFhPhNKO2ZfsY/sQXoYnP9e1ttXdvGL4/jNDjOxbixM0Mmkp5iTLWjYJo19uhJX
         1pStRwTN8RC745vdMAZcBDqmSs8oxLaQXZew+wH98LQq6x4DOWcW0W+2cUUtsgmvyN6Q
         2P/ueRKiabq9hTJzQQ+2seMgSGXSZz90yWYDnGt7oEAo7A/6uiEeHZPZOPRYW/VCpq4F
         aILaBdPHlxQvtQwFxIxC7r91kegXY7wjk3qbTD/zC5t4OQoOFSPoNtDV8MMZ9UdCgA/k
         Iadg==
X-Forwarded-Encrypted: i=1; AJvYcCV21arV9BlhR4BpVxpz8DJb9HGSdgAHQQH8VAAZBnrgnxM8lMF7814pLMrao02EcbsdC9FAu1BMGMZAWnE8jUMoqldaQnUTghZd
X-Gm-Message-State: AOJu0YwSZuSOUcvlrYkmhTAC7sF4/65AvLzqdAzSFI4RcV3lfU5Tme5c
	ayuq58ksYqCJRinmn5hOKwb+EjtbGGnUf0aDW3qWJwQM3gyaP+aUR/I47h7cAN4=
X-Google-Smtp-Source: AGHT+IFg50yN4QrZNx2LlD1EJ2tT/EI9hFZ2bUjcoiDOKnV7sj3JlUWpq/52eyPbnKALbKb6A7dtxw==
X-Received: by 2002:a5d:6511:0:b0:34a:f759:271d with SMTP id x17-20020a5d6511000000b0034af759271dmr2082090wru.6.1713784467909;
        Mon, 22 Apr 2024 04:14:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9f43:3ca4:162c:d540? ([2a01:e0a:999:a3a0:9f43:3ca4:162c:d540])
        by smtp.gmail.com with ESMTPSA id cg3-20020a5d5cc3000000b00349bd105089sm11706450wrb.47.2024.04.22.04.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 04:14:27 -0700 (PDT)
Message-ID: <032530b8-a26e-494f-bd9c-3e1661add5d4@rivosinc.com>
Date: Mon, 22 Apr 2024 13:14:26 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
 <20240419-clinic-amusing-d23b1b6d2af2@spud>
 <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
 <20240422-daylight-sassy-ff3b0d867fef@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240422-daylight-sassy-ff3b0d867fef@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/04/2024 11:35, Conor Dooley wrote:
> On Mon, Apr 22, 2024 at 10:53:10AM +0200, Clément Léger wrote:
>> On 19/04/2024 17:51, Conor Dooley wrote:
>>> On Thu, Apr 18, 2024 at 02:42:27PM +0200, Clément Léger wrote:
>>>> The Zc* standard extension for code reduction introduces new extensions.
>>>> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
>>>> are left out of this patch since they are targeting microcontrollers/
>>>> embedded CPUs instead of application processors.
>>>>
>>>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>>> ---
>>>>  arch/riscv/include/asm/hwcap.h | 4 ++++
>>>>  arch/riscv/kernel/cpufeature.c | 4 ++++
>>>>  2 files changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>>>> index 543e3ea2da0e..b7551bad341b 100644
>>>> --- a/arch/riscv/include/asm/hwcap.h
>>>> +++ b/arch/riscv/include/asm/hwcap.h
>>>> @@ -82,6 +82,10 @@
>>>>  #define RISCV_ISA_EXT_ZACAS		73
>>>>  #define RISCV_ISA_EXT_XANDESPMU		74
>>>>  #define RISCV_ISA_EXT_ZIMOP		75
>>>> +#define RISCV_ISA_EXT_ZCA		76
>>>> +#define RISCV_ISA_EXT_ZCB		77
>>>> +#define RISCV_ISA_EXT_ZCD		78
>>>> +#define RISCV_ISA_EXT_ZCF		79
>>>>  
>>>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>>>>  
>>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>>> index 115ba001f1bc..09dee071274d 100644
>>>> --- a/arch/riscv/kernel/cpufeature.c
>>>> +++ b/arch/riscv/kernel/cpufeature.c
>>>> @@ -261,6 +261,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>>>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
>>>>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
>>>>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
>>>> +	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
>>>> +	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
>>>> +	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
>>>> +	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
>>>>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
>>>>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>>>>  	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
>>>
>>> Ye, this looks exactly like what I "feared".
>>
>> Ok but for instance, Qemu actually set Zc* based on C/F/D. So the ISA
>> string containing theses dependencies should actually also be allowed.
>> So should we simply ignore them in the ISA string and always do our own
>> "post-processing" based on C/F/D?
> 
> I'm not familiar with the contents of all of these extensions, but I
> assume the reasoning for splitting them out is that you can implement
> them but not maybe not implement C (or something similar)? If that's the
> case, you cannot always imply.

Yeah, they can be implemented independently so we need to be able to
parse them independently. However, the kernel currently requires C so we
should always have Zca/Zcf/Zcd. But if that changes in the future, then,
that won't be true anymore. Better keep it generic probably

Clément


