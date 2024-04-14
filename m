Return-Path: <linux-doc+bounces-13611-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E389B99A
	for <lists+linux-doc@lfdr.de>; Mon,  8 Apr 2024 10:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AC9AB20E48
	for <lists+linux-doc@lfdr.de>; Mon,  8 Apr 2024 08:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5B625778;
	Mon,  8 Apr 2024 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Bip6JL3E"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC422C85F
	for <linux-doc@vger.kernel.org>; Mon,  8 Apr 2024 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563278; cv=none; b=AOwYw1g43BE6eeUOaCE0YggZT2MrUIRnk2C5Vdpi2L82V6RiyyVmzrq9Wl/IKozHbnEhq3h9QHp9awx5IRunFsk+rK2fnGCoQ2YrvQouybuXF+F9c4HKyCXBtLPhcyHXMs/ARgEuo2JfWoc2LPhGF3/B9G+WLeHhbRQVVLqPyh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563278; c=relaxed/simple;
	bh=oFtZMMMzF5IIyBLE1OofkhOkb8Z20H1FcMxpZ0BjJv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pb9EJQISVq2HJu7p+MPWjkXiY+F9pWBeAQNllNsVAVZDlcKlWhQ0s7SRd6pzCWyuH04mnATMv84SrJ2v+b03+aiPYo+aKQR0vDVwPJNNd6qFUPBZKtg8fMmDWgYcdSmraEU5Ppu0SL5RSiOTHHYzyPXISvx9Aok3cf5eKOj8lY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Bip6JL3E; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-416463e82fbso1612565e9.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2024 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712563275; x=1713168075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEXus2Ynno1AeuPQLNpTk8iPF9Mbvy8RxA45xKLQHC0=;
        b=Bip6JL3E5DmYfcHSQhhsjkUrX2FhlhScGfa3gp3f7UXkyJ6GwmgIrMmBAkeJwGHzZT
         4bYXkqgmjaKO2CxXaUgbKsBJpBzduYctad1Y7wq9sNGEzKrHH3oA9s/RMJMiwo+0XeaJ
         UOB2hjcxyvBBe98dnlClXCpESUeIFaKrnEgSKcASp/7AbGNKuA7oHeGvsgQFFPC4y/M0
         iZdDt9refM7EPnt1/ks0Gl+5WTG0+y86cYwKTKVE+RzDUgCG4HeQfoh+3fSdg5niiuhX
         qyb7qhc0Z/R5gaOIRI96amQkpLa3wponaInlsOcdTbNzd4lq92F4WQ8CUEkTcJEkhXwK
         0nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563275; x=1713168075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEXus2Ynno1AeuPQLNpTk8iPF9Mbvy8RxA45xKLQHC0=;
        b=B+J9gTCSZ94sVG0m9Q/DMv6A1V6v1Vz0FHXlEA8RbTHRXaLDgBoqIMThxkJUEE1dOi
         GNDPliAEhriIzGxgbxumgg2N1d1TkUZ2tBGMwM+fzKICcWMxMFKn91H+tfs/HwHycDdL
         5GYLrrMQ846vZGKRGj68UAWVVwNvsKEgu67O2CyTF1uVID7b6B5BIYAWVlKmdMr3JihQ
         Ugo7H8m+v4rsAhiypMtRyzSxP3AVRrcDoLWG/q1TDybuyQUSORnCKKs+3MKfBnWnK8Nt
         oOuOBTPjJPCVzevdx0QSgdWavX5h+aNZoRyVaLED0j9lbHZoMmbBpTda4Pe0sRQX1qMY
         QeSw==
X-Forwarded-Encrypted: i=1; AJvYcCXQmAU4nFPb9ar6sCaIW0RrvtSSmoDA2sKDJQSBnL3fmopkQbabTOYqMmowpNMBAQjPECBrwf9LDuUf8COCTj6ncnWOMLfvPOx2
X-Gm-Message-State: AOJu0YxgoYPFmIedm1u1ePY7D4TmXTT0BTXUfOOCrkqaHmZO255koU/e
	Zy1KapLOC+0ihxwmhlvErMEM3bez+51ItLaEpSY9Ys65kgHFLYxn/+Otsx3luVM=
X-Google-Smtp-Source: AGHT+IEQUCd5IWDe0mYq0rDe9VUQhrgm0s8IGNzOcuAIRUoN4LcKFabia6A+gxLsv3jGCmScuNsjTA==
X-Received: by 2002:a05:600c:3b96:b0:416:7b2c:df09 with SMTP id n22-20020a05600c3b9600b004167b2cdf09mr834824wms.1.1712563274884;
        Mon, 08 Apr 2024 01:01:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6327:edd6:6580:3ead? ([2a01:e0a:999:a3a0:6327:edd6:6580:3ead])
        by smtp.gmail.com with ESMTPSA id n32-20020a05600c3ba000b00415612e29a1sm12515475wms.30.2024.04.08.01.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 01:01:13 -0700 (PDT)
Message-ID: <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>
Date: Mon, 8 Apr 2024 10:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
To: Deepak Gupta <debug@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240404103254.1752834-1-cleger@rivosinc.com>
 <20240405-091c6c174f023d74b434059d@orel>
 <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/04/2024 19:33, Deepak Gupta wrote:
> On Fri, Apr 5, 2024 at 8:26 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>>
>> On Thu, Apr 04, 2024 at 12:32:46PM +0200, Clément Léger wrote:
>>> The Zimop ISA extension was ratified recently. This series adds support
>>> for parsing it from riscv,isa, hwprobe export and kvm support for
>>> Guest/VM.
>>
>> I'm not sure we need this. Zimop by itself isn't useful, so I don't know
>> if we need to advertise it at all. When an extension comes along that
>> redefines some MOPs, then we'll advertise that extension, but the fact
>> Zimop is used for that extension is really just an implementation detail.
> 
> Only situation I see this can be useful is this:--
> 
> An implementer, implemented Zimops in CPU solely for the purpose that they can
> run mainline distro & packages on their hardware and don't want to leverage any
> feature which are built on top of Zimop.

Yes, the rationale was that some binaries using extensions that overload
MOPs could still be run. With Zimop exposed, the loader could determine
if the binary can be executed without potentially crashing. We could
also let the program run anyway but the execution could potentially
crash unexpectedly, which IMHO is not really good for the user
experience nor for debugging. I already think that the segfaults which
happens when executing binaries that need some missing extension are not
so easy to debug, so better add more guards.

> 
> As an example zicfilp and zicfiss are dependent on zimops. glibc can
> do following
> 
> 1) check elf header if binary was compiled with zicfiss and zicfilp,
> if yes goto step 2, else goto step 6.
> 2) check if zicfiss/zicfilp is available in hw via hwprobe, if yes
> goto step 5. else goto step 3
> 3) check if zimop is available via hwprobe, if yes goto step 6, else goto step 4

I think you meant step 5 rather than step 6.

Clément

> 4) This binary won't be able to run successfully on this platform,
> issue exit syscall. <-- termination
> 5) issue prctl to enable shadow stack and landing pad for current task
> <-- enable feature
> 6) let the binary run <-- let the binary run because no harm can be done

