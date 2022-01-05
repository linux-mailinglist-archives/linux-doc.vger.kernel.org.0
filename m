Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356C6485A36
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jan 2022 21:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244197AbiAEUrQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Jan 2022 15:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244196AbiAEUrN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jan 2022 15:47:13 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A8BC061245
        for <linux-doc@vger.kernel.org>; Wed,  5 Jan 2022 12:47:13 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id y11so601299iod.6
        for <linux-doc@vger.kernel.org>; Wed, 05 Jan 2022 12:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Furqxct++X3Z67I8q5csxqDzYB2LumrU134TAYEe6j8=;
        b=Fyw4mrhJy80EKX10CaNTvhrvo5UYNtpP+TIP2g13/qQyjLUSXCWlucSkNZVr3ntgqs
         C4QFb/xp87SwzZLEWSrVOF7JiYNt/dpkqQtyFs7y54sXb47kdvK9xaZ2ZiCHy8h7VdOb
         6SHUkRnyPqUrXu0adKRCp84sO+hWDoKgq6/wd04NCotIviy55XEwurcErVeHzby36nff
         +MW+LV4sOa/3hN4KFONvohYHWb0XDCCflhr3GNTb+wfOTSDDQLt/PbMce2iz4nFkfVAp
         lNcFVL8Tn2UBCTf38zoMZSgX2uqtix864/RLA5a9lvaE26dEa/PipKoLIColcqs0Ahap
         VV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Furqxct++X3Z67I8q5csxqDzYB2LumrU134TAYEe6j8=;
        b=s139CgspJTYVqD7ex8UbMI31/sCxbVBl1D9ag4uD/1u18JzzR/J638Rm5+6vodtPKr
         wp4jbIMHeJ4id9EYAyF8faaPV9pm4xcbCnlx7cpEXlXpDRi+RtxefdpPV1hXHBevUaFJ
         jyBw3iIRgan69NNIpftlbf4BAdyndvAu8Ts1Z4cO9NJka5pfp4HxMrh+Mhio+cgD1o5W
         2yP/q42wzHiDCRYKLUgTBJI1bufu1eCMPFSvQOiWlItlUQMzvExckuwvkVHEV5URsDGP
         uU6ys+3JT26XGNxIQ07ewYhVsP5B4rwCswiTRETDe7KCGTCH9QUo8MrkfgfTLPVyZa+u
         bhWg==
X-Gm-Message-State: AOAM532zyJ/Wh5m6h0LqGFquvpzOKeN32jgAZADT4r8knSIzYPjcwY2g
        LUbtPuoQyS+OSh6ihUVAj6LQBg==
X-Google-Smtp-Source: ABdhPJxpC6d6X1RZlvuHC+/qFqM+DUthj0chV6UMs8SaDCQf8QNLfA/gr4qgvOSkinCyHqE9BIaduw==
X-Received: by 2002:a05:6638:3815:: with SMTP id i21mr26643190jav.39.1641415632874;
        Wed, 05 Jan 2022 12:47:12 -0800 (PST)
Received: from google.com ([2620:15c:183:200:5b02:855e:267d:5b0])
        by smtp.gmail.com with ESMTPSA id b17sm1101379iow.6.2022.01.05.12.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 12:47:12 -0800 (PST)
Date:   Wed, 5 Jan 2022 13:47:08 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Will Deacon <will@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>
Subject: Re: [PATCH v6 1/9] mm: x86, arm64: add arch_has_hw_pte_young()
Message-ID: <YdYDzKvYbBwjfU3W@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-2-yuzhao@google.com>
 <20220105104526.GA3015@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105104526.GA3015@willie-the-truck>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 05, 2022 at 10:45:26AM +0000, Will Deacon wrote:
> On Tue, Jan 04, 2022 at 01:22:20PM -0700, Yu Zhao wrote:
> > Some architectures automatically set the accessed bit in PTEs, e.g.,
> > x86 and arm64 v8.2. On architectures that don't have this capability,
> > clearing the accessed bit in a PTE usually triggers a page fault
> > following the TLB miss of this PTE.
> > 
> > Being aware of this capability can help make better decisions, e.g.,
> > whether to spread the work out over a period of time to avoid bursty
> > page faults when trying to clear the accessed bit in a large number of
> > PTEs.
> > 
> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
> > ---
> >  arch/arm64/include/asm/cpufeature.h |  5 +++++
> >  arch/arm64/include/asm/pgtable.h    | 13 ++++++++-----
> >  arch/arm64/kernel/cpufeature.c      | 19 +++++++++++++++++++
> >  arch/arm64/tools/cpucaps            |  1 +
> >  arch/x86/include/asm/pgtable.h      |  6 +++---
> >  include/linux/pgtable.h             | 13 +++++++++++++
> >  mm/memory.c                         | 14 +-------------
> >  7 files changed, 50 insertions(+), 21 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> > index ef6be92b1921..99518b4b2a9e 100644
> > --- a/arch/arm64/include/asm/cpufeature.h
> > +++ b/arch/arm64/include/asm/cpufeature.h
> > @@ -779,6 +779,11 @@ static inline bool system_supports_tlb_range(void)
> >  		cpus_have_const_cap(ARM64_HAS_TLB_RANGE);
> >  }
> >  
> > +static inline bool system_has_hw_af(void)
> > +{
> > +	return IS_ENABLED(CONFIG_ARM64_HW_AFDBM) && cpus_have_const_cap(ARM64_HW_AF);
> > +}
> > +
> >  extern int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
> >  
> >  static inline u32 id_aa64mmfr0_parange_to_phys_shift(int parange)
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index c4ba047a82d2..e736f47436c7 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -999,13 +999,16 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
> >   * page after fork() + CoW for pfn mappings. We don't always have a
> >   * hardware-managed access flag on arm64.
> >   */
> > -static inline bool arch_faults_on_old_pte(void)
> > +static inline bool arch_has_hw_pte_young(bool local)
> >  {
> > -	WARN_ON(preemptible());
> > +	if (local) {
> > +		WARN_ON(preemptible());
> > +		return cpu_has_hw_af();
> > +	}
> >  
> > -	return !cpu_has_hw_af();
> > +	return system_has_hw_af();
> >  }
> > -#define arch_faults_on_old_pte		arch_faults_on_old_pte
> > +#define arch_has_hw_pte_young		arch_has_hw_pte_young
> >  
> >  /*
> >   * Experimentally, it's cheap to set the access flag in hardware and we
> > @@ -1013,7 +1016,7 @@ static inline bool arch_faults_on_old_pte(void)
> >   */
> >  static inline bool arch_wants_old_prefaulted_pte(void)
> >  {
> > -	return !arch_faults_on_old_pte();
> > +	return arch_has_hw_pte_young(true);
> >  }
> >  #define arch_wants_old_prefaulted_pte	arch_wants_old_prefaulted_pte
> >  
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index 6f3e677d88f1..5bb553ee2c0e 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2171,6 +2171,25 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
> >  		.matches = has_hw_dbm,
> >  		.cpu_enable = cpu_enable_hw_dbm,
> >  	},
> > +	{
> > +		/*
> > +		 * __cpu_setup always enables this capability. But if the boot
> > +		 * CPU has it and a late CPU doesn't, the absent
> > +		 * ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU will prevent this late CPU
> > +		 * from going online. There is neither known hardware does that
> > +		 * nor obvious reasons to design hardware works that way, hence
> > +		 * no point leaving the door open here. If the need arises, a
> > +		 * new weak system feature flag should do the trick.
> > +		 */
> > +		.desc = "Hardware update of the Access flag",
> > +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> > +		.capability = ARM64_HW_AF,
> > +		.sys_reg = SYS_ID_AA64MMFR1_EL1,
> > +		.sign = FTR_UNSIGNED,
> > +		.field_pos = ID_AA64MMFR1_HADBS_SHIFT,
> > +		.min_field_value = 1,
> > +		.matches = has_cpuid_feature,
> > +	},
> >  #endif
> >  	{
> >  		.desc = "CRC32 instructions",
> > diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> > index 870c39537dd0..56e4ef5d95fa 100644
> > --- a/arch/arm64/tools/cpucaps
> > +++ b/arch/arm64/tools/cpucaps
> > @@ -36,6 +36,7 @@ HAS_STAGE2_FWB
> >  HAS_SYSREG_GIC_CPUIF
> >  HAS_TLB_RANGE
> >  HAS_VIRT_HOST_EXTN
> > +HW_AF
> >  HW_DBM
> >  KVM_PROTECTED_MODE
> >  MISMATCHED_CACHE_TYPE
> 
> As discussed in the previous threads, we really don't need the complexity
> of the additional cap for the arm64 part. Please can you just use the
> existing code instead? It's both simpler and, as you say, it's equivalent
> for existing hardware.
> 
> That way, this patch just ends up being a renaming exercise and we're all
> good.

No, renaming alone isn't enough. A caller needs to disable preemption
before calling system_has_hw_af(), and I don't think it's reasonable
to ask this caller to do it on x86 as well.

It seems you really prefer not to have HW_AF. So the best I can
accommodate, considering other potential archs, e.g., risc-v (I do
plan to provide benchmark results on risc-v, btw), is:

  static inline bool arch_has_hw_pte_young(bool local)
  {
	bool hw_af;

  	if (local) {
  		WARN_ON(preemptible());
  		return cpu_has_hw_af();
  	}
  
	preempt_disable();
  	hw_af = system_has_hw_af();
	preempt_enable();

	return hw_af;
  }

Or please give me something else I can call without disabling
preemption, sounds good?
