Return-Path: <linux-doc+bounces-40745-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EEFA5F987
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 16:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFD07188A041
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 15:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4726269820;
	Thu, 13 Mar 2025 15:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="f1UhVqV4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8463D2690FB
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879104; cv=none; b=CDfGMnUuq78577cnz9gi/pmJykPKwiYXDG47K8zbyi7xeyrmyTbpjAMAPdUsCsX1V7ASxehtBQXhIB22KeTye6XiqDyfVguTZ6LXUF/jSKEq3r96RMf0fNJxIkL2cU/5NXUnLcUVhBFOXDnE8V2jqzyiyzLC+acFU5p/dZOwNmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879104; c=relaxed/simple;
	bh=TmYoqe1ERxJgWNkBYOrm1mVXMHTya6wo1OaLK5bJFpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpjjZjn9J/XmUtnt59c7mpHFAMU5E2ScDC0rXsSaTHKE2c9CV+dsOhNFG8qrw40kuTdYYXH8pPCt8wiHc8aGaxTnAAjtGJlD7Z+/AsRsaadfvdytlruV2JA3+ENJV9D0sHWvxNtLAKM9mKKMV3sitG9EAiucOvKvw5MaUyMbaYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=f1UhVqV4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso10123185e9.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741879101; x=1742483901; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=isB+41NGUW/+LtTWyVmmsVADbWrUkVd/mu3pBc3RyqY=;
        b=f1UhVqV454zbsVhWO5y86H5Qzm76ICjJP/ZAGWYJacHyl3uMJ7NZulyGQDeCsWEpIw
         AfDYZ/pWsjigmto5IoFUS65xM0Q+rScmI0q1lm8Fy7/W/dWbRRaa1sqGyP7+3t+FgN9A
         InnUTc1juD1ABt0NwLcHiM7ZI0bq7M+FHjKZCWP7NcmzkQr0N0INyLPQ3oktkC6ccV7q
         LpXPhRAurElHyqJPlEb83TCHfQ/mUtoHkGz5rKH2wncLhQeCi2YFcSHuxOHRDcEdvhVF
         /A/mJkISh5yEvESccOm7V6dOyGAtESr/hfxso8LN2305sr26WuLfr+9Zg7iuxSpwgl3I
         5R4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879101; x=1742483901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=isB+41NGUW/+LtTWyVmmsVADbWrUkVd/mu3pBc3RyqY=;
        b=ZtavyOfTIn6VK9Z1WKu5ffCQsgJrHLd4ikxFGrQ6yH3aKuWh28UgfVRFQ+3GEvVl2C
         5tnYw9zf1AhY/NwSv4H4ooHfuuHYPGw0E35UivS0aGiivB2gSYsPrpRPA2P8MnMFjPA3
         V/OQJrFZQdjW4y7IXwEyp+ErPkuV1V4G3Lr7vqQeVVMslrXIJDukCga28hVZbwwVlfYf
         bvVcjsyb48ExOHk3qmT+ffsz3aJjneLh4KuOtxqko5XlGXJbYr7yh2t+k22SzLo3kvOu
         8Mt7JIhj77CEtzCOhYkj5nYl81nVtjf9L6okL+ri5xW2jBBplN946jj2b9W1Oq1kmpTz
         XnHg==
X-Forwarded-Encrypted: i=1; AJvYcCWtUMFa0lKG8J79aF3gl5KrPAqXfHYVLiJk0Ixd+8wP1La4xzk427m09Efgi3XYBMtCBfz3aKBTwk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIgebw+gjY6HLq7t4t4tPcW4usCcTJDYdLsJBqVNwpXtFcD/48
	ED26cFp8kPbD+Dh4j4AwfVM0NZ4AFYzArWzsUPM3POm6SRV7aMkgQsPj5vbdfXI=
X-Gm-Gg: ASbGncuKKaqKblsFKpU2+13+JcUJrPjvgTYk4JN1YyIXPVN0FLOrsilxQfQ8nKqnoVW
	6rUV6oWbTdv1j/20g4DbaaJoKB8cf1V/lX0FsNJPqfglBBTc5tM31akI36RUX37/U4rGUJSW5Gh
	SocB0O6EWPsY2U3T+3OPOWyGitj4oVJbV8ip+sM61697xEzKo4JT61btip7+uHDpcVmtKz/mqU5
	ZdhY471eJAuEls+rgadX4PNrkhEFFG4SaEO3iF1RU3j7J1p3XZRZfTes6U7iw39GMJK8L6wtjON
	LPyGqHeoEe0UOocsChUpB9q5GPpuWQT5
X-Google-Smtp-Source: AGHT+IGQoej17xQcxoErKHLCqvlPlZSqjGfTS7DBqmbIvkpb8XJf7iEa6MP5sQiwocZCvXTx8N2C4g==
X-Received: by 2002:a05:600c:3502:b0:43c:f4b3:b0ad with SMTP id 5b1f17b1804b1-43d01c12187mr109092455e9.19.1741879100728;
        Thu, 13 Mar 2025 08:18:20 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a8d0ab1sm56347735e9.34.2025.03.13.08.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:18:19 -0700 (PDT)
Date: Thu, 13 Mar 2025 16:18:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 16/17] RISC-V: KVM: add support for FWFT SBI extension
Message-ID: <20250313-b15bd3f690fccfc5d1a946fc@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-17-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310151229.2365992-17-cleger@rivosinc.com>

On Mon, Mar 10, 2025 at 04:12:23PM +0100, Cl�ment L�ger wrote:
> Add basic infrastructure to support the FWFT extension in KVM.
> 
> Signed-off-by: Cl�ment L�ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_host.h          |   4 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h      |   1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  31 +++
>  arch/riscv/include/uapi/asm/kvm.h          |   1 +
>  arch/riscv/kvm/Makefile                    |   1 +
>  arch/riscv/kvm/vcpu_sbi.c                  |   4 +
>  arch/riscv/kvm/vcpu_sbi_fwft.c             | 212 +++++++++++++++++++++
>  7 files changed, 254 insertions(+)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_fwft.c
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index bb93d2995ea2..c0db61ba691a 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -19,6 +19,7 @@
>  #include <asm/kvm_vcpu_fp.h>
>  #include <asm/kvm_vcpu_insn.h>
>  #include <asm/kvm_vcpu_sbi.h>
> +#include <asm/kvm_vcpu_sbi_fwft.h>
>  #include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_pmu.h>
>  
> @@ -281,6 +282,9 @@ struct kvm_vcpu_arch {
>  	/* Performance monitoring context */
>  	struct kvm_pmu pmu_context;
>  
> +	/* Firmware feature SBI extension context */
> +	struct kvm_sbi_fwft fwft_context;
> +
>  	/* 'static' configurations which are set only once */
>  	struct kvm_vcpu_config cfg;
>  
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index cb68b3a57c8f..ffd03fed0c06 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -98,6 +98,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>  
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> new file mode 100644
> index 000000000000..ec7568e0dc1a
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Rivos Inc.
> + *
> + * Authors:
> + *     Cl�ment L�ger <cleger@rivosinc.com>
> + */
> +
> +#ifndef __KVM_VCPU_RISCV_FWFT_H
> +#define __KVM_VCPU_RISCV_FWFT_H
> +
> +#include <asm/sbi.h>
> +
> +struct kvm_sbi_fwft_config;
> +struct kvm_sbi_fwft_feature;
> +struct kvm_vcpu;

Should only need the forward declaration for kvm_sbi_fwft_feature.

> +
> +struct kvm_sbi_fwft_config {
> +	const struct kvm_sbi_fwft_feature *feature;
> +	bool supported;
> +	unsigned long flags;
> +};
> +
> +/* FWFT data structure per vcpu */
> +struct kvm_sbi_fwft {
> +	struct kvm_sbi_fwft_config *configs;
> +};
> +
> +#define vcpu_to_fwft(vcpu) (&(vcpu)->arch.fwft_context)
> +
> +#endif /* !__KVM_VCPU_RISCV_FWFT_H */
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index f06bc5efcd79..fa6eee1caf41 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -202,6 +202,7 @@ enum KVM_RISCV_SBI_EXT_ID {
>  	KVM_RISCV_SBI_EXT_DBCN,
>  	KVM_RISCV_SBI_EXT_STA,
>  	KVM_RISCV_SBI_EXT_SUSP,
> +	KVM_RISCV_SBI_EXT_FWFT,
>  	KVM_RISCV_SBI_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 4e0bba91d284..06e2d52a9b88 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -26,6 +26,7 @@ kvm-y += vcpu_onereg.o
>  kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
>  kvm-y += vcpu_sbi.o
>  kvm-y += vcpu_sbi_base.o
> +kvm-y += vcpu_sbi_fwft.o
>  kvm-y += vcpu_sbi_hsm.o
>  kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_sbi_pmu.o
>  kvm-y += vcpu_sbi_replace.o
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 18726096ef44..27f22e98c8f8 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -78,6 +78,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
>  		.ext_idx = KVM_RISCV_SBI_EXT_STA,
>  		.ext_ptr = &vcpu_sbi_ext_sta,
>  	},
> +	{
> +		.ext_idx = KVM_RISCV_SBI_EXT_FWFT,
> +		.ext_ptr = &vcpu_sbi_ext_fwft,
> +	},
>  	{
>  		.ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
>  		.ext_ptr = &vcpu_sbi_ext_experimental,
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
> new file mode 100644
> index 000000000000..cce1e41d5490
> --- /dev/null
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Rivos Inc.
> + *
> + * Authors:
> + *     Cl�ment L�ger <cleger@rivosinc.com>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +#include <linux/kvm_host.h>
> +#include <asm/cpufeature.h>
> +#include <asm/sbi.h>
> +#include <asm/kvm_vcpu_sbi.h>
> +#include <asm/kvm_vcpu_sbi_fwft.h>
> +
> +struct kvm_sbi_fwft_feature {
> +	/**
> +	 * @id: Feature ID
> +	 */
> +	enum sbi_fwft_feature_t id;
> +
> +	/**
> +	 * @supported: Check if the feature is supported on the vcpu
> +	 *
> +	 * This callback is optional, if not provided the feature is assumed to
> +	 * be supported
> +	 */
> +	bool (*supported)(struct kvm_vcpu *vcpu);
> +
> +	/**
> +	 * @set: Set the feature value
> +	 *
> +	 * This callback is mandatory

Since we're doing all this documentation, then let's also state they
return SBI errors (which are longs, so we should probably return longs).

> +	 */
> +	int (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsigned long value);
> +
> +	/**
> +	 * @get: Get the feature current value
> +	 *
> +	 * This callback is mandatory
> +	 */
> +	int (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsigned long *value);
> +};
> +
> +static const enum sbi_fwft_feature_t kvm_fwft_defined_features[] = {
> +	SBI_FWFT_MISALIGNED_EXC_DELEG,
> +	SBI_FWFT_LANDING_PAD,
> +	SBI_FWFT_SHADOW_STACK,
> +	SBI_FWFT_DOUBLE_TRAP,
> +	SBI_FWFT_PTE_AD_HW_UPDATING,
> +	SBI_FWFT_POINTER_MASKING_PMLEN,
> +};
> +
> +static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(kvm_fwft_defined_features); i++) {
> +		if (kvm_fwft_defined_features[i] == feature)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static const struct kvm_sbi_fwft_feature features[] = {
> +};
> +
> +static struct kvm_sbi_fwft_config *
> +kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t feature)
> +{
> +	int i = 0;

no need for '= 0'

> +	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
> +
> +	for (i = 0; i < ARRAY_SIZE(features); i++) {
> +		if (fwft->configs[i].feature->id == feature)
> +			return &fwft->configs[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
> +				struct kvm_sbi_fwft_config **conf)
> +{
> +	struct kvm_sbi_fwft_config *tconf;
> +
> +	tconf = kvm_sbi_fwft_get_config(vcpu, feature);
> +	if (!tconf) {
> +		if (kvm_fwft_is_defined_feature(feature))
> +			return SBI_ERR_NOT_SUPPORTED;
> +
> +		return SBI_ERR_DENIED;
> +	}
> +
> +	if (!tconf->supported)
> +		return SBI_ERR_NOT_SUPPORTED;
> +
> +	*conf = tconf;
> +
> +	return SBI_SUCCESS;
> +}
> +
> +static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, u32 feature,
> +			    unsigned long value, unsigned long flags)
> +{
> +	int ret;
> +	struct kvm_sbi_fwft_config *conf;
> +
> +	ret = kvm_fwft_get_feature(vcpu, feature, &conf);
> +	if (ret)
> +		return ret;
> +
> +	if ((flags & ~SBI_FWFT_SET_FLAG_LOCK) != 0)
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
> +		return SBI_ERR_DENIED_LOCKED;
> +
> +	conf->flags = flags;
> +
> +	return conf->feature->set(vcpu, conf, value);
> +}
> +
> +static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
> +			    unsigned long *value)
> +{
> +	int ret;
> +	struct kvm_sbi_fwft_config *conf;
> +
> +	ret = kvm_fwft_get_feature(vcpu, feature, &conf);
> +	if (ret)
> +		return ret;
> +
> +	return conf->feature->get(vcpu, conf, value);
> +}
> +
> +static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +				    struct kvm_vcpu_sbi_return *retdata)
> +{
> +	int ret = 0;
> +	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	unsigned long funcid = cp->a6;
> +
> +	switch (funcid) {
> +	case SBI_EXT_FWFT_SET:
> +		ret = kvm_sbi_fwft_set(vcpu, cp->a0, cp->a1, cp->a2);
> +		break;
> +	case SBI_EXT_FWFT_GET:
> +		ret = kvm_sbi_fwft_get(vcpu, cp->a0, &retdata->out_val);
> +		break;
> +	default:
> +		ret = SBI_ERR_NOT_SUPPORTED;
> +		break;
> +	}
> +
> +	retdata->err_val = ret;
> +
> +	return 0;
> +}
> +
> +static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
> +	const struct kvm_sbi_fwft_feature *feature;
> +	struct kvm_sbi_fwft_config *conf;
> +	int i;
> +
> +	fwft->configs = kcalloc(ARRAY_SIZE(features), sizeof(struct kvm_sbi_fwft_config),
> +				GFP_KERNEL);
> +	if (!fwft->configs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(features); i++) {
> +		feature = &features[i];
> +		conf = &fwft->configs[i];
> +		if (feature->supported)
> +			conf->supported = feature->supported(vcpu);
> +		else
> +			conf->supported = true;
> +
> +		conf->feature = feature;
> +	}
> +
> +	return 0;
> +}
> +
> +static void kvm_sbi_ext_fwft_deinit(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
> +
> +	kfree(fwft->configs);
> +}
> +
> +static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
> +{
> +	int i = 0;

no need for '= 0'

> +	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
> +
> +	for (i = 0; i < ARRAY_SIZE(features); i++)
> +		fwft->configs[i].flags = 0;
> +}
> +
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
> +	.extid_start = SBI_EXT_FWFT,
> +	.extid_end = SBI_EXT_FWFT,
> +	.handler = kvm_sbi_ext_fwft_handler,
> +	.init = kvm_sbi_ext_fwft_init,
> +	.deinit = kvm_sbi_ext_fwft_deinit,
> +	.reset = kvm_sbi_ext_fwft_reset,
> +};
> -- 
> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

