Return-Path: <linux-doc+bounces-18613-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55459908D5A
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2024 16:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C1961C2153A
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2024 14:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBDD9463;
	Fri, 14 Jun 2024 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DOtNGdK9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB739441
	for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718375317; cv=none; b=n6Bv93IFtNKZLgD5n6cdlGDKEkNAP3ZRBYr+2groQyy+ofBOv0rUHmM40tRg34LNPRN1/QX7OCBSo4J3JJpEjeadHPwJbHE3lbkkfo+WZaNU44kml/SV66kC3NQZx51zB0Is7xqOrwlT1Dr586LCXkywBPONUlP4kzzVhskbV1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718375317; c=relaxed/simple;
	bh=a8giHmOguwIdhSxsi+Yd0a2rm54oi3KcKwGr9bPc3Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksZXk67eZlIN85oTFwV+BmA4O+Pprnx7xQVwv3HDj0NvgNXI1BNugfwlGzHGekPfhksnYHlOEiJl0cVlUMyyJq6MVxgZIN2o4CcQ8BFBsXnERkC0nxMD4uQkv7ZPQSRqOlSdz6eTluS625GU6Qfo/hD/HnyDWKn9JPe4z+vcFF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DOtNGdK9; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6c4926bf9baso1880903a12.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718375315; x=1718980115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+AS47E60QeHhUZsqoLBw7psRgmmP43ASuDhPpTTvN0=;
        b=DOtNGdK9m/Nzz6FCeWtSbvu/54qzv5BSvUh8ZlNYFGxAPo/K1NrwNZILFjog9U/tbj
         HRqINOGYme49IkmVw+UBN6adOfIKPzzELJ50JJhCkNhCWEWXIsVSWzrjsV71KB0Vh+YM
         RhDwa+GsGRf5Ag0lqtbosNePnAUCSXftXLkRc5gp/aXN5ZjgLgXgOpzi8JF0dJbeDRfg
         rqUVDov5aQxnT2V4RtuRTmVkDP2cq4ELv3JzwWsYfHDmBYY/O/J3HR98363gNxgA62LB
         rjZ/hDLY1oEW7WbwS/zSKuDD4X+4SRjIxXr5xddCA6V/me2O40lXRhgCV2DtrU9fWLA9
         GEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718375315; x=1718980115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+AS47E60QeHhUZsqoLBw7psRgmmP43ASuDhPpTTvN0=;
        b=dexqiF++YkI7xavAajrW8Sno2Jtqk9lWN4T9NpggpvqVbTMICYmHYvL8IXRki/3mZO
         MVOKO15ByB7aIVOcn/Oogi5rpRCqpzPVlOvMpGQU/CIgUBJ1Ckaokd/Cs+yygt+vPvaq
         G7xKyhkdIwQ65xRMsl/1QCr0HWELpb0rBUvrhJUgDTQbIMa1smmJs0a98xvErW5Sq0dm
         OXM+Gqyz66JnXKWu1WKEaqnnWq6NM8D+wEbaNeKd9AEsMCmZTvhcUinEKwBgQh7/fv3x
         Y4MPF/TpsoePHgqueb3U7wb0eQ2pRGQQEDdtTLuy8B8XB4x6Q4ZHjCQcvNV2UWc0u4AO
         KKKA==
X-Forwarded-Encrypted: i=1; AJvYcCVgelqZNqScZXmQqbpFA8KPYe0U9T5DfPLViapDOGvJ09kJeud4eK4LbtplWlxJcQiRksg3yvlXsRTvMmdOyfDZG8h/HMHCEwf6
X-Gm-Message-State: AOJu0Yy32yl+kYusd97XW8LtSRAfBL2X4rizUn8ppxiIV0faVzJELQXz
	7SenAbHAi2uaHiwHDK91jdVgdO+K2H0JgOkICgbK1XOqIP0VWjZG5Y3p3B/vigM=
X-Google-Smtp-Source: AGHT+IFlCjL08b27lesj/M0GSbfgPmaNXoKZh84hCGeFfyGBJsLwWWKLF7r4KbtLWMpGVc+/CtaW+Q==
X-Received: by 2002:a05:6a20:4314:b0:1b2:5baa:7acb with SMTP id adf61e73a8af0-1bae7e14cb3mr4139421637.1.1718375315129;
        Fri, 14 Jun 2024 07:28:35 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm3211617b3a.19.2024.06.14.07.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 07:28:34 -0700 (PDT)
Message-ID: <acb7a467-fc0e-4f32-8410-cd7aafce8bae@rivosinc.com>
Date: Fri, 14 Jun 2024 10:28:17 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] RISC-V: Detect unaligned vector accesses
 supported.
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>,
 Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240613191616.2101821-1-jesse@rivosinc.com>
 <20240613191616.2101821-5-jesse@rivosinc.com>
 <20240614-viral-dinghy-71d5f6585a55@wendy>
 <20240614-distaste-negligee-ba9216a8684e@wendy>
Content-Language: en-US
From: Jesse Taube <jesse@rivosinc.com>
In-Reply-To: <20240614-distaste-negligee-ba9216a8684e@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/14/24 04:40, Conor Dooley wrote:
> On Fri, Jun 14, 2024 at 09:36:55AM +0100, Conor Dooley wrote:
>> On Thu, Jun 13, 2024 at 03:16:13PM -0400, Jesse Taube wrote:
>>> --- a/arch/riscv/kernel/unaligned_access_speed.c
>>> +++ b/arch/riscv/kernel/unaligned_access_speed.c
>>> @@ -19,7 +19,8 @@
>>>   #define MISALIGNED_BUFFER_ORDER get_order(MISALIGNED_BUFFER_SIZE)
>>>   #define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
>>>   
>>> -DEFINE_PER_CPU(long, misaligned_access_speed);
>>> +DEFINE_PER_CPU(long, misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
>>> +DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED;
>>>   
>>>   #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>>>   static cpumask_t fast_misaligned_access;
>>> @@ -268,12 +269,18 @@ static int check_unaligned_access_all_cpus(void)
>>>   
>>>   	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
>>>   		for_each_online_cpu(cpu) {
>>> +#ifdef CONFIG_RISCV_VECTOR_MISALIGNED
>>> +			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_VEC_MISALIGNED_FAST;
>>> +#endif
>>> +#ifdef CONFIG_RISCV_MISALIGNED
>>>   			per_cpu(misaligned_access_speed, cpu) = RISCV_HWPROBE_MISALIGNED_FAST;
>>> +#endif
>>
>> Can you IS_ENABLED()-ify these two as well please?
> 
> Ah, you can't cos the variable doesn't exist in the other case.

Yeah kinda just dealing with how it was originally written ideally we 
would use IS_ENABLED. I don't really want to have a 500+ diff patch
IS_ENABLED()-ifying the original code as well. I can do that if 
necessary though.

Thank,
Jesse Taube

