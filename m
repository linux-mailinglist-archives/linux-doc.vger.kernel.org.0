Return-Path: <linux-doc+bounces-40848-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B7A61098
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 13:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3EB3B0E3C
	for <lists+linux-doc@lfdr.de>; Fri, 14 Mar 2025 12:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFECE1FECC0;
	Fri, 14 Mar 2025 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OxKgb/MP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B421FE470
	for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741953740; cv=none; b=TFBD+7m4e3gJ0/FKZB8MNCSNmLR1QISljmuhOXsBrSNYPXjSE+XevlVIUjvGPd1XRdaAFpuORNc5bsGiJkwNDRQE3sEF+6BMouHK85fV6fcqMfzi9NH2RhkOl7V/2iCEyYmR7k/8UNUB4q7kFopi1WN2Q/ESACeFH8QAoHkvHxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741953740; c=relaxed/simple;
	bh=CE1LfODofEga2dWCiWcV704lH/vvDsp8M/xAH9bl1Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXs96Aq89FlijcRrRt0GWHwXNscqe1WgC/puirkA2kulBocOKmmNf3Yryyb0sq6T/xKxNKhpJi+rS7f0zESf2Oxak+eXdILl6ObT6TWqm+6o6zIH6d1NWLxkfl5lZbiCVv2rSkQUGjcXpPyWqNFeK4pkv+cRcwmXhKbg2YCG3+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OxKgb/MP; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so1313288f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Mar 2025 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741953737; x=1742558537; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KiKvhRrb/Taq72fdOcKbw7HOX5fTF1yEq4aGHxD5ojg=;
        b=OxKgb/MP+0ItAL8rFE3rMqXpJ8+nw6ZEj+m25AOoBHMR3Zh4pM0kLArot0s2zpoVm8
         NeBMXbSbz3oBxepACdaVaSetE4q6YW9vowds6bShlo/abuxyV61EucixSLJ2Om6Wy9Jy
         nMlc/ESew/hkhaUevNQwkJJwJAPXOZtkHBo/ZwrN1FR4GyNtc37lHZjhGKl4Tjk85hIf
         7pOgDlZ/4joEiG+3cukUfXysi4dCL31a9U2bfhbfRwr93VIGJeGtRJ0XPJqnICE2LIve
         q3BEeF9zF4dpshhrOcbnRmdbeWRYFalptX218U9g74kLXmzbl9F2gum78uh0jtPZ7Gk/
         DHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741953737; x=1742558537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiKvhRrb/Taq72fdOcKbw7HOX5fTF1yEq4aGHxD5ojg=;
        b=TPd+yHkRTpmg5SyCQrkf2750RqQOiaKZUhtVm30au560ufI34ka35IRFrbY97rBLr2
         CA9RBJSYuiAckPCsokuMtt2+woRFvNnvWnhGsK9E7n1GIjOBKePUSS0+WWyL5eIWa2QQ
         NiSeB9He2NYUmrMhGDou/SCfY+w9WpMU2wL948qngUNsDhg7WywTDX40y9gLCVsycMF/
         xSdlSp9c5k/hSgvCywWdqPitM4RCf1f4BKFJAKSxsy74wc6FpCyNCWVkGVvXl1aAq77a
         12neF+/VZVC92qHkPobZ6l2QL2rJ187wJCUu5dVfkFuTsQVf0vgMbF4mOhPSOSz90ypU
         L4Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXqU2mNuScLxZP59E7kVjLEOZ7O9kU+oqgzyKGThQApunhVtKQeKebGOqsouduuQthymEAhiWxi9dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjfZkpbmQrkec+XMgRcOKmLg2478wR5uoN+t1gDbrBVUo4x1vD
	/wE1Hf3xMhem/p2UIwgxgKvYylazaj2vRJsrF23Hodp9EbS9AgidpdauQ3SUsIM=
X-Gm-Gg: ASbGncvxsz2FTGm3bVdA8xkq9tDjbpl5C//8Jh3qDTOVuEJgKrbT1ewXRMAH/deW3OP
	AhUetF743ufXltEiFn6CpJX7MFWGmcUb4Ssi7I4BA4pMjr2UeDYFr2ib8SYj8Qww9SBru8ahFxO
	onPRdMITUX3wYKnAU35KI2hEGpiioHeP0kEQWGvaaNK8GDQ8nt2F00ScBECRLlZhRJmxYwcFH2T
	DI6qk5UaNpJNkeGnEgfEyG5AkvYzkgbkak8rfjYBiourfje8cPWDGyxIW231mGhxe5rVcvgUzBU
	Pb4/PkQPETS7RfrWHJA3id8H9RrQhH3U
X-Google-Smtp-Source: AGHT+IGDT22UVNAcE40RgfSq2VmR6JimLpd4/ZEJSqqFul3nbrXtD+Up4CuV3WGzrZnYVB9JFFtoWA==
X-Received: by 2002:a05:6000:2ac:b0:390:e853:85bd with SMTP id ffacd0b85a97d-3971ffb22c0mr3063778f8f.48.1741953736471;
        Fri, 14 Mar 2025 05:02:16 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ec14bsm5302335f8f.100.2025.03.14.05.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 05:02:16 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:02:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 02/17] riscv: sbi: add FWFT extension interface
Message-ID: <20250314-10d8d58329aceac21e727ebe@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-3-cleger@rivosinc.com>
 <20250313-5c22df0c08337905367fa125@orel>
 <dad465de-e5da-4ebb-8395-ea9e181a6f57@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dad465de-e5da-4ebb-8395-ea9e181a6f57@rivosinc.com>

On Fri, Mar 14, 2025 at 12:33:55PM +0100, Cl�ment L�ger wrote:
> 
> 
> On 13/03/2025 13:39, Andrew Jones wrote:
> > On Mon, Mar 10, 2025 at 04:12:09PM +0100, Cl�ment L�ger wrote:
> >> This SBI extensions enables supervisor mode to control feature that are
> >> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> >> DTE, etc).
> >>
> >> Signed-off-by: Cl�ment L�ger <cleger@rivosinc.com>
> >> ---
> >>  arch/riscv/include/asm/sbi.h |  5 ++
> >>  arch/riscv/kernel/sbi.c      | 97 ++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 102 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> >> index bb077d0c912f..fc87c609c11a 100644
> >> --- a/arch/riscv/include/asm/sbi.h
> >> +++ b/arch/riscv/include/asm/sbi.h
> >> @@ -503,6 +503,11 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
> >>  				unsigned long asid);
> >>  long sbi_probe_extension(int ext);
> >>  
> >> +int sbi_fwft_all_cpus_set(u32 feature, unsigned long value, unsigned long flags,
> >> +			  bool revert_on_failure);
> >> +int sbi_fwft_get(u32 feature, unsigned long *value);
> >> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
> >> +
> >>  /* Check if current SBI specification version is 0.1 or not */
> >>  static inline int sbi_spec_is_0_1(void)
> >>  {
> >> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> >> index 1989b8cade1b..256910db1307 100644
> >> --- a/arch/riscv/kernel/sbi.c
> >> +++ b/arch/riscv/kernel/sbi.c
> >> @@ -299,6 +299,103 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
> >>  	return 0;
> >>  }
> >>  
> >> +int sbi_fwft_get(u32 feature, unsigned long *value)
> >> +{
> >> +	return -EOPNOTSUPP;
> >> +}
> >> +
> >> +/**
> >> + * sbi_fwft_set() - Set a feature on all online cpus
> > 
> > copy+paste of description from sbi_fwft_all_cpus_set(). This function
> > only sets the feature on the calling hart.
> > 
> >> + * @feature: The feature to be set
> >> + * @value: The feature value to be set
> >> + * @flags: FWFT feature set flags
> >> + *
> >> + * Return: 0 on success, appropriate linux error code otherwise.
> >> + */
> >> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
> >> +{
> >> +	return -EOPNOTSUPP;
> >> +}
> >> +
> >> +struct fwft_set_req {
> >> +	u32 feature;
> >> +	unsigned long value;
> >> +	unsigned long flags;
> >> +	cpumask_t mask;
> >> +};
> >> +
> >> +static void cpu_sbi_fwft_set(void *arg)
> >> +{
> >> +	struct fwft_set_req *req = arg;
> >> +
> >> +	if (sbi_fwft_set(req->feature, req->value, req->flags))
> >> +		cpumask_clear_cpu(smp_processor_id(), &req->mask);
> >> +}
> >> +
> >> +static int sbi_fwft_feature_local_set(u32 feature, unsigned long value,
> >> +				      unsigned long flags,
> >> +				      bool revert_on_fail)
> >> +{
> >> +	int ret;
> >> +	unsigned long prev_value;
> >> +	cpumask_t tmp;
> >> +	struct fwft_set_req req = {
> >> +		.feature = feature,
> >> +		.value = value,
> >> +		.flags = flags,
> >> +	};
> >> +
> >> +	cpumask_copy(&req.mask, cpu_online_mask);
> >> +
> >> +	/* We can not revert if features are locked */
> >> +	if (revert_on_fail && flags & SBI_FWFT_SET_FLAG_LOCK)
> > 
> > Should use () around the flags &. I thought checkpatch complained about
> > that?
> > 
> >> +		return -EINVAL;
> >> +
> >> +	/* Reset value is the same for all cpus, read it once. */
> > 
> > How do we know we're reading the reset value? sbi_fwft_all_cpus_set() may
> > be called multiple times on the same feature. And harts may have had
> > sbi_fwft_set() called on them independently. I think we should drop the
> > whole prev_value optimization.
> 
> That's actually used for revert_on_failure as well not only the
> optimization.

At least the comment should drop the word 'Reset' and if there's a chance
that not all harts having the same value then we should call get on all
of them. (We'll probably want SBI FWFT functions which operate on
hartmasks eventually.)

> 
> > 
> >> +	ret = sbi_fwft_get(feature, &prev_value);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	/* Feature might already be set to the value we want */
> >> +	if (prev_value == value)
> >> +		return 0;
> >> +
> >> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> >> +	if (cpumask_equal(&req.mask, cpu_online_mask))
> >> +		return 0;
> >> +
> >> +	pr_err("Failed to set feature %x for all online cpus, reverting\n",
> >> +	       feature);
> > 
> > nit: I'd let the above line stick out. We have 100 chars.
> > 
> >> +
> >> +	req.value = prev_value;
> >> +	cpumask_copy(&tmp, &req.mask);
> >> +	on_each_cpu_mask(&req.mask, cpu_sbi_fwft_set, &req, 1);
> >> +	if (cpumask_equal(&req.mask, &tmp))
> >> +		return 0;
> > 
> > I'm not sure we want the revert_on_fail support either. What happens when
> > the revert fails and we return -EINVAL below? Also returning zero when
> > revert succeeds means the caller won't know if we successfully set what
> > we wanted or just successfully reverted.
> 
> So that might actually be needed for features that needs to be enabled
> on all hart or not enabled at all. If we fail to enable all of them,
> them the hart will be in some non coherent state between the harts.
> The returned error code though is wrong and I'm not sure we would have a
> way to gracefully handle revertion failure (except maybe panicking ?).

How about offlining all harts which don't have the desired state, along
with complaining loudly to the boot log.

Thanks,
drew

