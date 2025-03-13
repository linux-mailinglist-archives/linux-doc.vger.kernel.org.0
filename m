Return-Path: <linux-doc+bounces-40739-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E6EA5F818
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 15:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18FA6420C64
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 14:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F3A268C53;
	Thu, 13 Mar 2025 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="P7yi17oi"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9DC268686
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 14:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741876044; cv=none; b=FVB2nuE+MlHE5oPwsY0Lo9cvzt3v9N9UZycAe4WRPMLdYybONYbN4AONESUT6km5MJuFmjkQJbTqIeiPuFXSjr5OAkuhR/0JVS7LvCk4r3Z1FnDXk/lw4JwAm6N6SsIrfB3x+LCAHeAd1u+8Id2oECsyiOYNFJ5FYAeqCW0c/CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741876044; c=relaxed/simple;
	bh=oKvFJqfjCg0oe1WKlBfVLElWET9EO+f7JfuuJyGbUVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za2WgRp3mzf8PGJGF7guPuC+RU0qGL+Y+tWwixknmCiH3i/l5lWJ8Q3tGCJAu3yr8z89x/tiNQx1v7qy+3fmOOmiQqvKv/xvHUYQTiGaybTShlwNUWsqafMeZxR0IDz7I+r6wZrB/7B0dCB67/qCk8dhpid4IQGwNqCSQJ23JVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=P7yi17oi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso663036f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 07:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741876039; x=1742480839; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XLr2/Str8PUdULF1c2O3jE557wb7uOe7x8v7FUGx02s=;
        b=P7yi17oiP/kFyc7tFrJt1WkF3+jMRiMD0Icna6K78dT50QHQRWFdSHF6nvm8TDfg/h
         B2EtVmFVn9nXYvF58uA8KB1VM/QQC1FKN1B2U8BAnAeI/RVdSxN8UF2V9sEnWLhAiBXj
         /geP+giTm8aI3ss2BGq/LSi08PAt8qqwGDRUFmItaYbnbqj8azD63AXnGPcA+YCEhHEj
         161TDSSeOyu1ZHQD7uJcBNiOLnVwNVWPKNLixvjn9pUjBYIVanWtOIwnrd1TynV37EHW
         5ZFvrkUl2lWzpeMGzM+7SGSFZvUb2RNJQDvWeSkv87GO7qR65n8lXrdfyY1/OYFluqDQ
         uPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876039; x=1742480839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLr2/Str8PUdULF1c2O3jE557wb7uOe7x8v7FUGx02s=;
        b=fMZpJ44So+mjyQFBU/d5r0rhHaaIkEjMwBTtyrX5ZoyYfXzFDjW59wZ6fzXd5Jhaqk
         pxYLOfsNhRUktjSm0IZY4i74ZCmUpRx0u3MB/rijYsPi8Y6rNpDhDstHSu9eqc+oqUzA
         jFfgpeYL/aospPyQXswKIjDJCRfpGlpYhnVpsj7EJfvk1rXn9pu5ALWeJR4hAdsEpvZk
         rmAOyFsBP2XWiYj0+n/GFqCwzon7I9z/0EEOSLHFRdbe9KqzbaVVdkLjFmJ6iBsCOmtF
         v3noj/htuPrV0Uor/zvAotqr/p2XyHy8u+V6ezOKtGhKaubRzjhuGMKNyp6i35n34Z9z
         b22w==
X-Forwarded-Encrypted: i=1; AJvYcCVhqXmnwGdKT6iYCyCRFlgu3DEreh6B8wPpE29Cvj3Q0UPrVHD4VrRtewCDx4hQPDXicNtu9m/PKAs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4XdRDT4Rli97ym/AzmU2Zrr8IBGXvjS/QccGt5JefGuyg61E
	EzWfgu3Ttup96cgvPymREG0MUv/9TPBYqIOPj+RgdiHgX3VLiQ4j+iFCJ8GHIdk=
X-Gm-Gg: ASbGncs3Js4dJAJg/1ad8Gr/fKPb1Lt0aQr1Aw4FvTTsWg/y6+WaUgT655S/neSPGfE
	RKD23G5Owzeey1z5Ib2vRBAv7mwaEsGtVj5gfxza2rldpsvMIYylY3bqlYzsfkb6lLtVpx0D8z7
	OUXumJQfMru6DoHfN1C1phBe7YV2a1a1bkxCMGeGCwzsTmy7fH1S8OqPVoXM1r1/1vw7TacsnKZ
	9YUPv7I2ijSLjIqwPDXUv8V4bkmZ+xvWevPb/cFGLV4tpVLe1s0aiG1fw3H5eixAUd1NnNjIW9h
	F8WEzg6nCwVZQi1sqs0rpOD93b7sqzf7Byol9uKe1ZM=
X-Google-Smtp-Source: AGHT+IGx3Sab5SDKogjK4G9G6vPewBpr2VjhUbGJwcX+nwTAiQQruD0qs0HuNiII4DaXFL2TeXeVoQ==
X-Received: by 2002:a5d:64cb:0:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39140b8e9f4mr17833900f8f.22.1741876038933;
        Thu, 13 Mar 2025 07:27:18 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b34sm2303314f8f.55.2025.03.13.07.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:27:18 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:27:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 14/17] RISC-V: KVM: add SBI extension init()/deinit()
 functions
Message-ID: <20250313-f08cee46c912f729d1829d37@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-15-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310151229.2365992-15-cleger@rivosinc.com>

On Mon, Mar 10, 2025 at 04:12:21PM +0100, Cl�ment L�ger wrote:
> The FWFT SBI extension will need to dynamically allocate memory and do
> init time specific initialization. Add an init/deinit callbacks that
> allows to do so.
> 
> Signed-off-by: Cl�ment L�ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
>  arch/riscv/kvm/vcpu.c                 |  2 ++
>  arch/riscv/kvm/vcpu_sbi.c             | 29 +++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 4ed6203cdd30..bcb90757b149 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -49,6 +49,14 @@ struct kvm_vcpu_sbi_extension {
>  
>  	/* Extension specific probe function */
>  	unsigned long (*probe)(struct kvm_vcpu *vcpu);
> +
> +	/*
> +	 * Init/deinit function called once during VCPU init/destroy. These
> +	 * might be use if the SBI extensions need to allocate or do specific
> +	 * init time only configuration.
> +	 */
> +	int (*init)(struct kvm_vcpu *vcpu);
> +	void (*deinit)(struct kvm_vcpu *vcpu);
>  };
>  
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> @@ -69,6 +77,7 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>  bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
>  
>  int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  				   unsigned long *reg_val);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 60d684c76c58..877bcc85c067 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -185,6 +185,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>  
>  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>  {
> +	kvm_riscv_vcpu_sbi_deinit(vcpu);
> +
>  	/* Cleanup VCPU AIA context */
>  	kvm_riscv_vcpu_aia_deinit(vcpu);
>  
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index d1c83a77735e..858ddefd7e7f 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -505,8 +505,37 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
>  			continue;
>  		}
>  
> +		if (!ext->default_disabled && ext->init &&
> +		    ext->init(vcpu) != 0) {
> +			scontext->ext_status[idx] = KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
> +			continue;
> +		}

I think this new block should be below the assignment below (and it can
drop the continue) and it shouldn't check default_disabled (as I've done
below). IOW, we should always run ext->init when there is one to run here.
Otherwise, I how will it get run later?

> +
>  		scontext->ext_status[idx] = ext->default_disabled ?
>  					KVM_RISCV_SBI_EXT_STATUS_DISABLED :
>  					KVM_RISCV_SBI_EXT_STATUS_ENABLED;

                if (ext->init && ext->init(vcpu))
                    scontext->ext_status[idx] = KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;

>  	}
>  }
> +
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +	const struct kvm_riscv_sbi_extension_entry *entry;
> +	const struct kvm_vcpu_sbi_extension *ext;
> +	int idx, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +		entry = &sbi_ext[i];
> +		ext = entry->ext_ptr;
> +		idx = entry->ext_idx;
> +
> +		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
> +			continue;
> +
> +		if (scontext->ext_status[idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE ||
> +		    !ext->deinit)
> +			continue;
> +
> +		ext->deinit(vcpu);
> +	}
> +}
> -- 
> 2.47.2
>

Thanks,
drew

