Return-Path: <linux-doc+bounces-21024-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA16293719C
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 02:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EB611F21BFC
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 00:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B799184D;
	Fri, 19 Jul 2024 00:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C6iHg04D"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F8910F1
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 00:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721349935; cv=none; b=nCTy4kNXRf0OO1Aw4vT2R4mn09eCdKbxC7SpG1Xj7GBpkOKGIkZdKoVsGvqTcf8u1nuXQUh772TooVGIdoLnZ5X5VKtcfLduThcYKZCXLvBXyzrQ94cniH+J43O2PL/IpcT1gtjYQbaTVnQll6KXCk2p5BvKDzZHndgs7BIsoHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721349935; c=relaxed/simple;
	bh=z/zS3Y5rfZMuLrJMQXIl2kf1D/5slkoZWN1HnqZpQRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=WWmhvQWk1Mc6V07Z2Z3JHRAkUicqI+DxuixYTBGlgynxwNoqGKCkIdtNaEMUBJwYl5CGXr4bJnE6xAUgklieOAMPpmabG53Uw58skmHLWWT2oQH29JHKrmSXsSDFL9eygtaNMh6j+0iGHpNRNWGe53KG9GN3wCi1S5gj/Y3R5sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=C6iHg04D; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-819c1f53617so3848339f.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721349930; x=1721954730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4gn1KUCdzhlOEmQvR/nJMiqTBzLCbx9aL8Fd1UdpzI=;
        b=C6iHg04D331Fp+nUMGm1cZExFzhUPfY8tyKqj/fSBbo9Ia8lD+UsmqlQ2VzOBEV7f2
         4jkTNNJmWX10ju7XBfT08wtmHJ+ZPGYx0UaqCIuXVMGeiyD5F1driX0Hv+zJX57hdrzN
         UHLJlkEZsf26HqQrJOUnQUXeWeXeYYcw2wakuFfbPiXw6RpfQARQ11AXyUTnCrdAu/h3
         Oig9aXLZW+MYeRU/6KXnCQGpKuS1lpsiRigo++a/Cd7+hc2Rjl2sDuftjnqfM8Wbep//
         QtXMto+8ASzdT/p7I0S09hcWRtnc0pgzHjNx5g/VLrLbuvMOaTWpIxzI0yeyjtkVxw4B
         6NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721349930; x=1721954730;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4gn1KUCdzhlOEmQvR/nJMiqTBzLCbx9aL8Fd1UdpzI=;
        b=bR/eSlJFI/bB6ZE66yLySeAASBPInNCE99lK7zG3bh8SaYD/vtf8Y38CtmEggxLzJV
         FLR677V0/IBQFFMnBShatl0cW29Eq5mqQEFM6nnCvSiC3MkvkwLn88Ce0RSzuGGkEoKj
         bGHsY2rty/9KdzfUoVBZhv/2wmSBibP8LX/aW0DYr2oQivLQUfxN3AdVADQ6t+DV0gCG
         1s/Rz+rjn9JGmlDVdYxg8TrZvmLRb3Jgko6m5YQbyEx+T9ZMORJAvmeqAmb6a0WFCX8U
         1gSXQ7tCK84oA6aBGzK5P2WReS0VlA5ZigNv/84PE2JvhMPMeMY87KqofVPVjj3iWm8o
         i3OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmJiWfwkepcjmbmRvKv91Zgxk5CeK+hFKnvAvwOKb5K8JvevtKu3DHMLCWH3yakVDAka+woVBLD3o7ncsuz8OtG6PPEwzKvAUJ
X-Gm-Message-State: AOJu0YxEVZHR+k6PTe8idqCMnor93Bdz0Kr8gZPZ6KB77HUUdpp7UQF6
	f/xoIRPp0FusQ+DCCcNRYS6rdQfhQ0s1N/IEQNNUYUDlS1489vU8M4eirHm78c8=
X-Google-Smtp-Source: AGHT+IFweNJHVvrorFY+uYyttwMC6ZoZLYaj3XeQfMP5ro0QTdnF+Urlbs7Do8mCw9GvM/skm4WFGw==
X-Received: by 2002:a05:6602:1412:b0:803:c955:eda8 with SMTP id ca18e2360f4ac-8171051114bmr866519339f.6.1721349930521;
        Thu, 18 Jul 2024 17:45:30 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2342bf2cfsm102163173.8.2024.07.18.17.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 17:45:30 -0700 (PDT)
Message-ID: <8de44944-62b4-44df-88e1-bcf7417fea6e@sifive.com>
Date: Thu, 18 Jul 2024 19:45:28 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] riscv: Implement cmpxchg32/64() using Zacas
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-2-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org
In-Reply-To: <20240717061957.140712-2-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alex,

On 2024-07-17 1:19 AM, Alexandre Ghiti wrote:
> This adds runtime support for Zacas in cmpxchg operations.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               | 17 +++++++++++++++++
>  arch/riscv/Makefile              |  3 +++
>  arch/riscv/include/asm/cmpxchg.h | 26 +++++++++++++++++++++++---
>  3 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 05ccba8ca33a..1caaedec88c7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
>  	  preemption. Enabling this config will result in higher memory
>  	  consumption due to the allocation of per-task's kernel Vector context.
>  
> +config TOOLCHAIN_HAS_ZACAS
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
> +	depends on AS_HAS_OPTION_ARCH
> +
> +config RISCV_ISA_ZACAS
> +	bool "Zacas extension support for atomic CAS"
> +	depends on TOOLCHAIN_HAS_ZACAS
> +	default y
> +	help
> +	  Enable the use of the Zacas ISA-extension to implement kernel atomic
> +	  cmpxchg operations when it is detected at boot.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 06de9d365088..9fd13d7a9cc6 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -85,6 +85,9 @@ endif
>  # Check if the toolchain supports Zihintpause extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
>  
> +# Check if the toolchain supports Zacas
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
> +
>  # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
>  # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
>  KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 808b4c78462e..5d38153e2f13 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -9,6 +9,7 @@
>  #include <linux/bug.h>
>  
>  #include <asm/fence.h>
> +#include <asm/alternative.h>
>  
>  #define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
>  ({									\
> @@ -134,21 +135,40 @@
>  	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
>  })
>  
> -#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
> +#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
>  ({									\
> +	__label__ no_zacas, end;					\
>  	register unsigned int __rc;					\
>  									\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
> +		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
> +				     RISCV_ISA_EXT_ZACAS, 1)		\
> +			 : : : : no_zacas);				\
> +									\
> +		__asm__ __volatile__ (					\
> +			prepend						\
> +			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
> +			append						\
> +			: "+&r" (r), "+A" (*(p))			\
> +			: "rJ" (n)					\
> +			: "memory");					\
> +		goto end;						\
> +	}								\
> +									\
> +no_zacas:								\
>  	__asm__ __volatile__ (						\
>  		prepend							\
>  		"0:	lr" lr_sfx " %0, %2\n"				\
>  		"	bne  %0, %z3, 1f\n"				\
> -		"	sc" sc_sfx " %1, %z4, %2\n"			\
> +		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
>  		"	bnez %1, 0b\n"					\
>  		append							\

This would probably be a good place to use inline ALTERNATIVE instead of an asm
goto. It saves overall code size, and a jump in the non-Zacas case, at the cost
of 3 nops in the Zacas case. (And all the nops can go after the amocas, where
they will likely be hidden by the amocas latency.)

Regards,
Samuel

>  		"1:\n"							\
>  		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
>  		: "rJ" (co o), "rJ" (n)					\
>  		: "memory");						\
> +									\
> +end:;									\
>  })
>  
>  #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
> @@ -156,7 +176,7 @@
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(*(__ptr)) __old = (old);				\
>  	__typeof__(*(__ptr)) __new = (new);				\
> -	__typeof__(*(__ptr)) __ret;					\
> +	__typeof__(*(__ptr)) __ret = (old);				\
>  									\
>  	switch (sizeof(*__ptr)) {					\
>  	case 1:								\


