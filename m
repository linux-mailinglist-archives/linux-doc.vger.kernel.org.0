Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABCA517E27D
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2020 15:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgCIOZb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Mar 2020 10:25:31 -0400
Received: from foss.arm.com ([217.140.110.172]:53196 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726703AbgCIOZb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Mar 2020 10:25:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C805B11D4;
        Mon,  9 Mar 2020 07:25:30 -0700 (PDT)
Received: from localhost (e108754-lin.cambridge.arm.com [10.1.198.53])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AC3C3F67D;
        Mon,  9 Mar 2020 07:25:30 -0700 (PDT)
Date:   Mon, 9 Mar 2020 14:25:29 +0000
From:   Ionela Voinescu <ionela.voinescu@arm.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
        suzuki.poulose@arm.com, sudeep.holla@arm.com, lukasz.luba@arm.com,
        valentin.schneider@arm.com, dietmar.eggemann@arm.com,
        rjw@rjwysocki.net, pkondeti@codeaurora.org, peterz@infradead.org,
        mingo@redhat.com, vincent.guittot@linaro.org,
        viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>
Subject: Re: [PATCH v5 3/7] arm64/kvm: disable access to AMU registers from
 kvm guests
Message-ID: <20200309142529.GB13343@arm.com>
References: <20200226132947.29738-1-ionela.voinescu@arm.com>
 <20200226132947.29738-4-ionela.voinescu@arm.com>
 <46b89d0c9704e0a0fb7a4ac2a1fb5b7a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46b89d0c9704e0a0fb7a4ac2a1fb5b7a@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Marc,

On Thursday 27 Feb 2020 at 19:58:32 (+0000), Marc Zyngier wrote:
[..]
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index 3e909b117f0c..44354c812783 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -1003,6 +1003,20 @@ static bool access_pmuserenr(struct kvm_vcpu
> > *vcpu, struct sys_reg_params *p,
> >  	{ SYS_DESC(SYS_PMEVTYPERn_EL0(n)),					\
> >  	  access_pmu_evtyper, reset_unknown, (PMEVTYPER0_EL0 + n), }
> > 
> > +static bool access_amu(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
> > +			     const struct sys_reg_desc *r)
> > +{
> > +	kvm_inject_undefined(vcpu);
> > +
> > +	return false;
> > +}
> > +
> > +/* Macro to expand the AMU counter and type registers*/
> > +#define AMU_AMEVCNTR0_EL0(n) { SYS_DESC(SYS_AMEVCNTR0_EL0(n)),
> > access_amu }
> > +#define AMU_AMEVTYPE0_EL0(n) { SYS_DESC(SYS_AMEVTYPE0_EL0(n)),
> > access_amu }
> > +#define AMU_AMEVCNTR1_EL0(n) { SYS_DESC(SYS_AMEVCNTR1_EL0(n)),
> > access_amu }
> > +#define AMU_AMEVTYPE1_EL0(n) { SYS_DESC(SYS_AMEVTYPE1_EL0(n)),
> > access_amu }
> > +
> >  static bool trap_ptrauth(struct kvm_vcpu *vcpu,
> >  			 struct sys_reg_params *p,
> >  			 const struct sys_reg_desc *rd)
> > @@ -1078,8 +1092,10 @@ static u64 read_id_reg(const struct kvm_vcpu
> > *vcpu,
> >  			 (u32)r->CRn, (u32)r->CRm, (u32)r->Op2);
> >  	u64 val = raz ? 0 : read_sanitised_ftr_reg(id);
> > 
> > -	if (id == SYS_ID_AA64PFR0_EL1 && !vcpu_has_sve(vcpu)) {
> > -		val &= ~(0xfUL << ID_AA64PFR0_SVE_SHIFT);
> > +	if (id == SYS_ID_AA64PFR0_EL1) {
> > +		if (!vcpu_has_sve(vcpu))
> > +			val &= ~(0xfUL << ID_AA64PFR0_SVE_SHIFT);
> > +		val &= ~(0xfUL << ID_AA64PFR0_AMU_SHIFT);
> 
> This will definitely conflict with some of the ongoing rework I have[1].
> I'm happy to provide this as a stable branch for you to rebase on top,
> or use an arm64 provided branch to rebase my stoff on top.
> 
> Just let me know how you want to proceed.
>

Catalin added the AMU patches on top of 5.6-rc3 at [1].
Is this okay as a base branch for your patches?

Thanks,
Ionela.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/amu

> Thanks,
> 
>         M.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?h=kvm-arm64/debug-fixes-5.6&id=454fb7398d3626328f7f771c07d21e894e4e1a3b
> -- 
> Jazz is not dead. It just smells funny...
