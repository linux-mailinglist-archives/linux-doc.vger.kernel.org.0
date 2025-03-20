Return-Path: <linux-doc+bounces-41451-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64120A6ABAE
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 18:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D7033BD693
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 17:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E21822155C;
	Thu, 20 Mar 2025 17:09:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04EE1A5BBA;
	Thu, 20 Mar 2025 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490586; cv=none; b=R7rC/Y+2rAPmdBqkKUfGvNGjOF15BVZcmF+rSS1AWvGmaxoHj5O0OROrzfoz5DSbh92yzsW+3Lbiw94yR3Tp+AmhiIV3fu9NYdMpjQ4eo536vusSNli40Y6rZUI4FgYiHDLiDd01ybe53dpSCk8zmiImh3aAVafs4xW4gnSuxd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490586; c=relaxed/simple;
	bh=X7yQK3FhKEQxbqOWhMqZ5Lkw9zDTwATuFJr5mEQPZlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKn6WUTpzUrQ6HkVLmORj2vW2UbUwfV8rQpQBbjhO5CtB2t3d5YOGnnlH8Ko/57+SDaDkKXcvHZbFrkTHB0oYNT09tZBgva5ep5wKrzvcYJ8ti/MenjY2oNv/PHv/sFrlWlqRj1WjzEbspEGHAJvIpwuLrojw+Bb0WArnHuYL1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02CF1113E;
	Thu, 20 Mar 2025 10:09:52 -0700 (PDT)
Received: from e133081.arm.com (unknown [10.57.15.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EE7C3F673;
	Thu, 20 Mar 2025 10:09:39 -0700 (PDT)
Date: Thu, 20 Mar 2025 17:09:36 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	ardb@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com,
	maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
	oliver.upton@linux.dev, baohua@kernel.org, david@redhat.com,
	ioworker0@gmail.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v4 1/3] arm64: Add BBM Level 2 cpu feature
Message-ID: <20250320170936.GB487465@e133081.arm.com>
References: <20250319150533.37440-2-miko.lenczewski@arm.com>
 <20250319150533.37440-3-miko.lenczewski@arm.com>
 <f9c5839e-5d55-497e-9df3-ab778c4eae72@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9c5839e-5d55-497e-9df3-ab778c4eae72@arm.com>

On Thu, Mar 20, 2025 at 01:24:25PM +0000, Suzuki K Poulose wrote:
> On 19/03/2025 15:05, Mikołaj Lenczewski wrote:
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index fb8752b42ec8..3e4cc917a07e 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -453,6 +453,9 @@
> >   	arm64.no32bit_el0 [ARM64] Unconditionally disable the execution of
> >   			32 bit applications.
> > +	arm64.nobbml2	[ARM64] Unconditionally disable Break-Before-Make Level
> > +			2 support
> > +
> >   	arm64.nobti	[ARM64] Unconditionally disable Branch Target
> >   			Identification support
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 940343beb3d4..49deda2b22ae 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2057,6 +2057,17 @@ config ARM64_TLB_RANGE
> >   	  The feature introduces new assembly instructions, and they were
> >   	  support when binutils >= 2.30.
> > +config ARM64_BBML2_NOABORT
> > +	bool "Enable support for Break-Before-Make Level 2 detection and usage"
> > +	default y
> > +	help
> > +	  FEAT_BBM provides detection of support levels for break-before-make
> > +	  sequences. If BBM level 2 is supported, some TLB maintenance requirements
> > +	  can be relaxed to improve performance. We additonally require the
> > +	  property that the implementation cannot ever raise TLB Conflict Aborts.
> > +	  Selecting N causes the kernel to fallback to BBM level 0 behaviour
> > +	  even if the system supports BBM level 2.
> 
> minor nit: Should we mention that the feature can be disabled at runtime
> using a kernel parameter ?

Yes, this sounds very reasonable, I should have thought of that. Will
mention the commandline parameter in the kconfig option documentation.

> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index d561cf3b8ac7..1a4adcda267b 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2176,6 +2176,67 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> >   	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
> >   }
> > +static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
> > +{
> > +	/* We want to allow usage of bbml2 in as wide a range of kernel contexts
> > +	 * as possible. This list is therefore an allow-list of known-good
> > +	 * implementations that both support bbml2 and additionally, fulfill the
> > +	 * extra constraint of never generating TLB conflict aborts when using
> > +	 * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
> > +	 * kernel contexts difficult to prove safe against recursive aborts).
> > +	 *
> > +	 * Note that implementations can only be considered "known-good" if their
> > +	 * implementors attest to the fact that the implementation never raises
> > +	 * TLBI conflict aborts for bbml2 mapping granularity changes.
> > +	 */
> > +	static const struct midr_range supports_bbml2_noabort_list[] = {
> > +		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
> > +		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
> > +		{}
> > +	};
> > +
> > +	return is_midr_in_range_list(cpu_midr, supports_bbml2_noabort_list);
> > +}
> > +
> > +static inline unsigned int cpu_read_midr(int cpu)
> > +{
> > +	WARN_ON_ONCE(!cpu_online(cpu));
> > +
> > +	return per_cpu(cpu_data, cpu).reg_midr;
> > +}
> > +
> > +static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int scope)
> > +{
> > +	if (!IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT))
> > +		return false;
> > +
> > +	if (scope & SCOPE_SYSTEM) {
> > +		int cpu;
> > +
> > +		/* We are a boot CPU, and must verify that all enumerated boot
> 
> minor nit: See Documentation/process/coding-style.rst,
> Section 8 Commenting.

My bad, had skimmed the coding style at one point but clearly missed or
forgot the section on comments. Will fix up this and all other instances
of the same issue.

-- 
Kind regards,
Mikołaj Lenczewski

