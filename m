Return-Path: <linux-doc+bounces-40730-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BED57A5F4A8
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 13:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B367189F596
	for <lists+linux-doc@lfdr.de>; Thu, 13 Mar 2025 12:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94D0267396;
	Thu, 13 Mar 2025 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="g8/beGCL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58EE267384
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741869559; cv=none; b=jiNKfJ2LLZrrVEQVABgIW1xifytaMisjaJC+oMB2Hpfg6dguLflIRzbm4ao925HWx7Oc8fdDHi6UPgWmh9W3rPHMU6lHjvJpTHmbhAvEN/xR7bGyv3TwKl9p/vkYGp0nVWsMrx5/N2wfOnhOzOscVcvBNf6S1VPtXZcuBF77Yf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741869559; c=relaxed/simple;
	bh=cg5D6pfaTmMxWwYRdSc3ve1jzhcFg1ZIMZvTd79kFXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZdzRjksqxBEedp7FBh6RskhJtD2Pbyy3xgXUCcDAscKyWcmZanEg6YlQvsktuAUAUVSr2kjtKKxzd2b58uPABh/w7HWzwqv6Isx2Hrwk9F/r0C9TWae6NlcsnLwqza193+Pt2c8s9ubgdGFtI3gq0Uc+HGnt8WzfoQNDK68ofc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=g8/beGCL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390cf7458f5so713830f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741869556; x=1742474356; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xSlQ1L6rFi2oeV1zF6QF9pposhG4AHSuAju9zq00g0c=;
        b=g8/beGCLOIwMbAr2nOkT6riGp9wK5SU+DNXVeYT8uNdesrrwWIU5ahZ6rcrcSpz+xi
         fouAPAFJKfZxZqeyMRMDQAdFXtxnw0fjXVc0fLArJTBF0RK+C6S8o4a0mnCbf2/cYdJP
         qIk7jOORmsHdORaeoK4TZvXgSElkeq1sN2h21She9BJLs32XBBVVWDcSja/wwO20pn0x
         5vFZ+tsoYK2IiNObKtBp4hV2sAnNGqf0FQtagqEjIAaplToKtn+1iCL+vvUocrICMasP
         7z7xUfI2deJU0YW7K9/Ls2Q9a6FE+3nF1vGOM+tGxt/5u/k1KH1N7YqiMwYLTSnEhUvP
         k0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741869556; x=1742474356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSlQ1L6rFi2oeV1zF6QF9pposhG4AHSuAju9zq00g0c=;
        b=XIwEOzsJhamBvni25IxTGQ3yiS8aO9LD2q+oLPLH2CL7J6r/nNCX/U9A+78vhRaaay
         Fav5PKLRCftZuJKqXRsML0IZ0ZaZu6ybFxDZBMrLFYSYygQsnv3GStYg6skaYJJiR1/d
         TSA9R/259E+uDFRLnzDImiay6acj5O2wgDWWnksyJAqRp92PZEqtaeYHCcAzeGgGKfNx
         QS8/nO+KeIpSCsrt8+xGVBzD5JIqOy/ugizssRzBlnfVl3UpLPp4M0bVLZJWKAumm1SB
         uODCPDxG+A5PBg63qMWwkNpyUOVoPa2ZD/HmoDFv/khyjZGY6upuETGli5yxVF61GOZs
         FW1w==
X-Forwarded-Encrypted: i=1; AJvYcCWQC45TO4rWFNkPh1s6MUDatkAptrCDFFjx8s2IV4EyYZbZ98mWN0K2iXGYnSHtDHRijRJin+zfTIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi/K9BKj0HpOdG03TQ9LWSGxKDOH0mFW5nD07kKN4ItTmZn+Wi
	Ck8Baveb721Cff6F+L7KoIxvguEyZJP6Oge7aWqQhBG4BD/ei48GAy2triE8n7A=
X-Gm-Gg: ASbGnctr4gVosIUyVOYx0sPrdDyFCTzUgepOFVkyADjKjiMO/fkCp8dfkWpKsvBG9s9
	HWQWBfD96iFrGN86yx5C8OYPAVNBk3rqXwhMIn1NvK53iehDiKczFhh3bajSr9WiZLPDQzXq5hG
	QVqR1lnhsdg4V6aa41eqThEMdVUyyz4HD948VpiV6wbcu98S31H1f8kYNXvDuJmn+yyzVwOLnGe
	xEKf+LW0Cu5pxHG90NcExcksvNrtj0BN2xmqCsi2KtjCx+eQsp/7mpPOArkbrFtID7FemyWOIjx
	EZRRg8gQ+HLuM5r7CAeIhGAl1md2EZGwPb8FKSjDEk4=
X-Google-Smtp-Source: AGHT+IHljsBKLiMSwe9a9spi/guXRSlSUeFAziwYEZ2f83TIkAwW439SP28/QrmHbhabYpknI9/fAQ==
X-Received: by 2002:a5d:64ac:0:b0:38d:dfb8:3679 with SMTP id ffacd0b85a97d-39132d228c5mr22022486f8f.17.1741869556082;
        Thu, 13 Mar 2025 05:39:16 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df33aasm1978419f8f.2.2025.03.13.05.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:39:15 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:39:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 02/17] riscv: sbi: add FWFT extension interface
Message-ID: <20250313-5c22df0c08337905367fa125@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-3-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310151229.2365992-3-cleger@rivosinc.com>

On Mon, Mar 10, 2025 at 04:12:09PM +0100, Cl�ment L�ger wrote:
> This SBI extensions enables supervisor mode to control feature that are
> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> DTE, etc).
> 
> Signed-off-by: Cl�ment L�ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h |  5 ++
>  arch/riscv/kernel/sbi.c      | 97 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 102 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index bb077d0c912f..fc87c609c11a 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -503,6 +503,11 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
>  				unsigned long asid);
>  long sbi_probe_extension(int ext);
>  
> +int sbi_fwft_all_cpus_set(u32 feature, unsigned long value, unsigned long flags,
> +			  bool revert_on_failure);
> +int sbi_fwft_get(u32 feature, unsigned long *value);
> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
> +
>  /* Check if current SBI specification version is 0.1 or not */
>  static inline int sbi_spec_is_0_1(void)
>  {
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 1989b8cade1b..256910db1307 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -299,6 +299,103 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
>  	return 0;
>  }
>  
> +int sbi_fwft_get(u32 feature, unsigned long *value)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +/**
> + * sbi_fwft_set() - Set a feature on all online cpus

copy+paste of description from sbi_fwft_all_cpus_set(). This function
only sets the feature on the calling hart.

> + * @feature: The feature to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +struct fwft_set_req {
> +	u32 feature;
> +	unsigned long value;
> +	unsigned long flags;
> +	cpumask_t mask;
> +};
> +
> +static void cpu_sbi_fwft_set(void *arg)
> +{
> +	struct fwft_set_req *req = arg;
> +
> +	if (sbi_fwft_set(req->feature, req->value, req->flags))
> +		cpumask_clear_cpu(smp_processor_id(), &req->mask);
> +}
> +
> +static int sbi_fwft_feature_local_set(u32 feature, unsigned long value,
> +				      unsigned long flags,
> +				      bool revert_on_fail)
> +{
> +	int ret;
> +	unsigned long prev_value;
> +	cpumask_t tmp;
> +	struct fwft_set_req req = {
> +		.feature = feature,
> +		.value = value,
> +		.flags = flags,
> +	};
> +
> +	cpumask_copy(&req.mask, cpu_online_mask);
> +
> +	/* We can not revert if features are locked */
> +	if (revert_on_fail && flags & SBI_FWFT_SET_FLAG_LOCK)

Should use () around the flags &. I thought checkpatch complained about
that?

> +		return -EINVAL;
> +
> +	/* Reset value is the same for all cpus, read it once. */

How do we know we're reading the reset value? sbi_fwft_all_cpus_set() may
be called multiple times on the same feature. And harts may have had
sbi_fwft_set() called on them independently. I think we should drop the
whole prev_value optimization.

> +	ret = sbi_fwft_get(feature, &prev_value);
> +	if (ret)
> +		return ret;
> +
> +	/* Feature might already be set to the value we want */
> +	if (prev_value == value)
> +		return 0;
> +
> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> +	if (cpumask_equal(&req.mask, cpu_online_mask))
> +		return 0;
> +
> +	pr_err("Failed to set feature %x for all online cpus, reverting\n",
> +	       feature);

nit: I'd let the above line stick out. We have 100 chars.

> +
> +	req.value = prev_value;
> +	cpumask_copy(&tmp, &req.mask);
> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> +	if (cpumask_equal(&req.mask, &tmp))
> +		return 0;

I'm not sure we want the revert_on_fail support either. What happens when
the revert fails and we return -EINVAL below? Also returning zero when
revert succeeds means the caller won't know if we successfully set what
we wanted or just successfully reverted.

> +
> +	return -EINVAL;
> +}
> +
> +/**
> + * sbi_fwft_all_cpus_set() - Set a feature on all online cpus
> + * @feature: The feature to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + * @revert_on_fail: true if feature value should be restored to it's orignal

its original

> + * 		    value on failure.

Line 'value' up under 'true'

> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +int sbi_fwft_all_cpus_set(u32 feature, unsigned long value, unsigned long flags,
> +			  bool revert_on_fail)
> +{
> +	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
> +		return sbi_fwft_set(feature, value, flags);
> +
> +	return sbi_fwft_feature_local_set(feature, value, flags,
> +					  revert_on_fail);
> +}
> +
>  /**
>   * sbi_set_timer() - Program the timer for next timer event.
>   * @stime_value: The value after which next timer event should fire.
> -- 
> 2.47.2

Thanks,
drew

