Return-Path: <linux-doc+bounces-13885-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 884758A09A1
	for <lists+linux-doc@lfdr.de>; Thu, 11 Apr 2024 09:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15DE61F24F1C
	for <lists+linux-doc@lfdr.de>; Thu, 11 Apr 2024 07:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A089D13DDD3;
	Thu, 11 Apr 2024 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kj+VHARA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7503B13D258
	for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 07:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712820311; cv=none; b=GeMs2euqURTrPI0pk0f0u7H7R45A+I+I6kRJMVNcJm4YX5wTFM9Z+Fj4rG0xMwcbzjSS6KR+tOZc3am/41ohUh0yRErnfgF3xHS8uWtz3uEqNjCgBzp01fz5RyjQpg1ILfeMgMiTpkF1rHfRue6GMKEb1hHLfjBS/crMllGq9wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712820311; c=relaxed/simple;
	bh=pJ8R9jxOZjfn6ejs9V833kwm1L/LeDLWxab3d8yLYsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kg3h+XAn8PYgmf8RcPfetzIa/J7TtIZODlZHAFUxCF98gR9wuTjqocJuVxPLKR4C799a8OiaQgC886dDHhL2mzAnu5PU3LQVtd7pSTQA36TiI8toI5TYhDUCwCsDsPwMYukjOna4DLHhlrW6x1RG9WJqws6v589fDbs4SiDK/g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kj+VHARA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-346a5dea2f4so162592f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 00:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712820308; x=1713425108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrjK0EsdKVt9QT2OnXkSvn4/gsAT0jsR16VIcuO+mkY=;
        b=kj+VHARA3JQNk+YG+fgc9qULTOdLzWbfJbtJZZwhgHMAhvAhu1c4jKEao99NPKQgoe
         MGZUvDaQnpZqmcMB+9ofvCsvK5QJjKbwyZsv7QjvkrDKyc2eg9DHHo4oYwGmdh2Xf6MP
         V+hW7jO374WlUnh/qa9xx/rUWLGzjQM4uyFaadb3sm60lJ1dfyEcoL+CuIQDbObSggii
         IZxRVBmbnJ/0IkAUiH3rLQNJA+qPmcpIeMGtjLlls5DYhFc9OP4rWbQN/kw7h2XDG3Ux
         9HZpl+vbKADGael0/TXsO3yBRy7GsRqEbSQRwcIHDI9TT9VAA1r7vcIm9B8smLnTmzv8
         fCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712820308; x=1713425108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrjK0EsdKVt9QT2OnXkSvn4/gsAT0jsR16VIcuO+mkY=;
        b=lxJsXv6439f/aqoyyCdeb3e6jEKcgYTChRNcvu8TsjZrgzGgCuDmYT8eclw5zxZXOW
         pYp6EjU2iI28fWyNjIFdIhWkdL0beNeGFOn08nRng2KmIJyAv9ytSSYbQshH3xZd9sxE
         zniv/xlpdj+CcZ+bWF2X5fozC3v9tjzRHVOp1KtpNcgTpV/ROWvXmIdtOfJ9d+8Ewjs1
         4J2+YqosN5Mxz+gb/w9NHMSX6pHwPAoMOFNb6GRT8kHZ2Hn5XP7KHVOpnf457eJJtz0J
         VBsBKVBc6gRocyy0UP94WZTsA93Q+izZETcBRgPKHcJZd0QiBscyP6dr325rLwUoa/uV
         y2UA==
X-Forwarded-Encrypted: i=1; AJvYcCV1z2FKA7O8elWVqPtUXl2G0EWTgz7RkpgdRaXuF2pT44XK+rHa0LfSDPdEMfz1J5ZBc7UXaHVxYnT3TRK2y3tqE6TS6OgRGc4w
X-Gm-Message-State: AOJu0YyWZG9We6+PyU8omj5BvAD2GpdZvmUg9WTbnA6Fxu16hFQSsEJz
	5pA90i3JmMPpmq1QrrDLyGnxSBStEL16Vz5yyv46MzlpbqkuPYpwd624cmKbwtg=
X-Google-Smtp-Source: AGHT+IH7bDLPf+9sHTexaPC0l7JskFDeRSsnaH3OC8OfIIJJ6Vv6zjsrHnmGf08EGNEGbKXzsGI5Kw==
X-Received: by 2002:a5d:4150:0:b0:346:4945:8851 with SMTP id c16-20020a5d4150000000b0034649458851mr3608971wrq.0.1712820307707;
        Thu, 11 Apr 2024 00:25:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3624:d9b3:4998:d76b? ([2a01:e0a:999:a3a0:3624:d9b3:4998:d76b])
        by smtp.gmail.com with ESMTPSA id b10-20020a056000054a00b00341b7d5054bsm1083326wrf.72.2024.04.11.00.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 00:25:07 -0700 (PDT)
Message-ID: <1287e6e9-cb8e-4a78-9195-ce29f1c4bace@rivosinc.com>
Date: Thu, 11 Apr 2024 09:25:06 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
To: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
 <20240410-judgingly-appease-5df493852b70@spud>
 <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZhcTiakvfbjb2hon@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/04/2024 00:32, Deepak Gupta wrote:
> On Wed, Apr 10, 2024 at 11:27:16PM +0100, Conor Dooley wrote:
>> On Wed, Apr 10, 2024 at 11:16:11PM +0100, Conor Dooley wrote:
>>> On Wed, Apr 10, 2024 at 02:32:41PM -0700, Deepak Gupta wrote:
>>> > On Wed, Apr 10, 2024 at 11:11:00AM +0200, Clément Léger wrote:
>>> > > Add parsing for Zcmop ISA extension which was ratified in commit
>>> > > b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
>>> > >
>>> > > Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>> > > ---
>>> > > arch/riscv/include/asm/hwcap.h | 1 +
>>> > > arch/riscv/kernel/cpufeature.c | 1 +
>>> > > 2 files changed, 2 insertions(+)
>>> > >
>>> > > diff --git a/arch/riscv/include/asm/hwcap.h
>>> b/arch/riscv/include/asm/hwcap.h
>>> > > index b7551bad341b..cff7660de268 100644
>>> > > --- a/arch/riscv/include/asm/hwcap.h
>>> > > +++ b/arch/riscv/include/asm/hwcap.h
>>> > > @@ -86,6 +86,7 @@
>>> > > #define RISCV_ISA_EXT_ZCB        77
>>> > > #define RISCV_ISA_EXT_ZCD        78
>>> > > #define RISCV_ISA_EXT_ZCF        79
>>> > > +#define RISCV_ISA_EXT_ZCMOP        80
>>> > >
>>> > > #define RISCV_ISA_EXT_XLINUXENVCFG    127
>>> > >
>>> > > diff --git a/arch/riscv/kernel/cpufeature.c
>>> b/arch/riscv/kernel/cpufeature.c
>>> > > index 09dee071274d..f1450cd7231e 100644
>>> > > --- a/arch/riscv/kernel/cpufeature.c
>>> > > +++ b/arch/riscv/kernel/cpufeature.c
>>> > > @@ -265,6 +265,7 @@ const struct riscv_isa_ext_data
>>> riscv_isa_ext[] = {
>>> > >     __RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
>>> > >     __RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
>>> > >     __RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
>>> > > +    __RISCV_ISA_EXT_DATA(zcmop, RISCV_ISA_EXT_ZCMOP),
>>> >
>>> > As per spec zcmop is dependent on zca. So perhaps below ?
>>> >
>>> > __RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZCMOP,
>>> RISCV_ISA_EXT_ZCA)
>>>
>>> What's zicboz got to do with it, copy-pasto I guess?
> 
> Yes, copy-pasta :-)
> 
>>> If we're gonna imply stuff like this though I think we need some
>>> comments explaining why it's okay.
>>
>> Also, I'm inclined to call that out specifically in the binding, I've
>> not yet checked if dependencies actually work for elements of a string
>> array like the do for individual properties. I'll todo list that..
> 
> Earlier examples of specifying dependency on envcfg actually had functional
> use case.
> So you are right, I am not sure if its actually needed in this
> particular case.

I actually saw that and think about addressing it but AFAICT, this
should be handled by the machine firmware passing the isa string to the
kernel (ie, it should be valid). In the case of QEMU, it takes care of
setting the extension that are required by this extension itself.

If we consider to have potentially broken isa string (ie extensions
dependencies not correctly handled), then we'll need some way to
validate this within the kernel.

Clément

> 
> And yes definitley, dependency should be mentioned in binding.
> 
> 

