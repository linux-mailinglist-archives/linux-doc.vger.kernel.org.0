Return-Path: <linux-doc+bounces-10160-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6DD85CC26
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 00:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58C10283ED7
	for <lists+linux-doc@lfdr.de>; Tue, 20 Feb 2024 23:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96E9154446;
	Tue, 20 Feb 2024 23:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jgZxWmHV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F48154432
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 23:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708472579; cv=none; b=ZJLc467iWUz0srgwB/YS3gcH/PrtsdAKw2gASuDWHevMEZCo9ScxiuIEBSLocYOXYZs3OoaUPfwHufYB1hqDUw5ZskqGJGO0nNYI+1cEjgQuqnsvTZ6b2Je2qcXALJMhD/0QlH4VaFEhVIVcAKYqv5YkCaHsouNNy7om3D9aqp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708472579; c=relaxed/simple;
	bh=7jqO1lHIVsE5d+e0YtanS1tzyQWv/2YIqeBJHjsSe8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p80XKRyNElE3zhpIbodu5i7q4TVbb/p+9HVCZUjg8lMyzEFpW5OG94WVZoCzCLF1J/JSRO2qLWtU5S2uXbC6dKr2mHTbF3xBqT7hQry48PiqXzT22OJckBMoa5uBqVsEVmvAFyXdgPECitTU/KDltZX3+7FtUZOCvN94Y8jPi+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jgZxWmHV; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bd4e6a7cb0so4244723b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 15:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708472577; x=1709077377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUPZxx4yc0Fym2aKmm76DxOfwl43+C+AKFEvJFvt0CE=;
        b=jgZxWmHVx6coL9tdqlJp3iqFiVJbgQWwli+Fr2EeoFsjmse3rPqDWcnl2UU42Hz+9D
         kEbWm3oCzZ2GX1kEkt4Cn0BBkuu6C7rgOOSGK9LhrwFDpdRRfpXubxCH/DLw0P14T2Ia
         AXXuQBcnQQtFboeMKICzNo11svf9xEYF0rD/mX0V9WIj3Rk3Ua0+kx4B5nqyhOqXs4MC
         axjcN4x5RcKuS7CHvf5zEjHwyFzTPlgcOlmw4rC0mJNf9nDYmsO7uCCYWtX1RoT1QZmu
         TIcqtmn+T80pU+N/e6lHZwVvuQyy0Gg7/cRgbVkWzV9m0i0uTpRZ60xGxhTM4DokvfQf
         lDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708472577; x=1709077377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rUPZxx4yc0Fym2aKmm76DxOfwl43+C+AKFEvJFvt0CE=;
        b=pJb5JlFmJLkcAayWbxwVmv/jPPBOsgK4dogMpjP6V0Eu7x3Dg+1uU8ml7wh0BdArgo
         LWW1N95XfM2tJhnQkxg54evlEcWS2d8IZP4X7zFiZaVPE40RTDcSwaexJwiHbG/EzKve
         YS1JFPlFHAInurywRIh/zmF3Dkv5j1UogBvtemOuSM6LZVYyB8avepSyAeOI8wdtb0Zd
         h5mXi1MLXeotmr1ZBQMvaOMaAo4+Ya0mH+AHlI6gJXX809BW7oQe2Lv90f2Aap2UMpHY
         oRFspf6lAj94NDgyOXDVSn35FOAf/ZUDoTxDxBLY2YQiC/6Idenl/uUA3+LMOHkDzsjs
         EFDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBjn/xEinecGjy65RbyLLT4pS5DhGV3p/1f8bbnlAdW6lcRmGeQOgsquP32k1DOKy35EDHSXuwhbNeOJbasbsVQKs8Zb2o7+Vk
X-Gm-Message-State: AOJu0YzyGQU+4sTXeVkTJ0RsjRBWMGGJ2SGHs/miSm5wLcF7/0nxLB0P
	XboeCYlJF6+haZErpwyh5u63UpYul39JQvM4ZUu61qHcNtb7qb7kzcRwUPilDGM=
X-Google-Smtp-Source: AGHT+IGB8ll+ozYI3O381NSidlwWWtxrXnCXwOmpDex8sV8coE6I7gWpQPn7NnyYF6GY6vUHK3eedA==
X-Received: by 2002:a05:6808:2f11:b0:3c1:5d20:179b with SMTP id gu17-20020a0568082f1100b003c15d20179bmr8468422oib.9.1708472576861;
        Tue, 20 Feb 2024 15:42:56 -0800 (PST)
Received: from [10.0.16.226] ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id o19-20020a637313000000b005dbed0ffb10sm7179064pgc.83.2024.02.20.15.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 15:42:56 -0800 (PST)
Message-ID: <3cd9c332-1187-4204-94c9-34a3c4f5958c@rivosinc.com>
Date: Tue, 20 Feb 2024 15:42:55 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: export Zihintpause ISA extension
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Robbin Ehn <rehn@rivosinc.com>
References: <20240219154905.528301-1-cleger@rivosinc.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240219154905.528301-1-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/19/24 07:49, Clément Léger wrote:
> Export the Zihintpause ISA extension through hwprobe which allows using
> "pause" instructions. Some userspace applications (OpenJDK for
> instance) uses this to handle some locking back-off.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> 
> ---
>   Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>   arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>   arch/riscv/kernel/sys_hwprobe.c       | 1 +
>   3 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index b2bcc9eed9aa..0012c8433613 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -188,6 +188,10 @@ The following keys are defined:
>          manual starting from commit 95cf1f9 ("Add changes requested by Ved
>          during signoff")
>   
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTPAUSE`: The Zihintpause extension is
> +       supported as defined in the RISC-V ISA manual starting from commit commit
> +       d8ab5c78c207 ("Zihintpause is ratified").
> +
>   * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>     information about the selected set of processors.
>   
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 9f2a8e3ff204..31c570cbd1c5 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -59,6 +59,7 @@ struct riscv_hwprobe {
>   #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
>   #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
>   #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> +#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
>   #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>   #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>   #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index a7c56b41efd2..1008d25880e1 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>   		EXT_KEY(ZTSO);
>   		EXT_KEY(ZACAS);
>   		EXT_KEY(ZICOND);
> +		EXT_KEY(ZIHINTPAUSE);
>   
>   		if (has_vector()) {
>   			EXT_KEY(ZVBB);

Reviewed-by: Atish Patra <atishp@rivosinc.com>



