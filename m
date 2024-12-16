Return-Path: <linux-doc+bounces-32913-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C69F3D5C
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 23:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A19FA7A58F4
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 22:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589A71D63D1;
	Mon, 16 Dec 2024 22:22:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59921D618E;
	Mon, 16 Dec 2024 22:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734387737; cv=none; b=czRgFsK7nV53lJBIAzBGBA3t3Y+XJxTdKW6bpodIjEz8Dqto5IeNvd2jMbJHyz3OfQeaTO4yoKJAYob/8eRLR+Nb7KC3jg/wT8rza+kGYnTrV/gpd+cO3eyUSRNlKKn8mSyZijDkOJ1EbysrUEIh8FCk+mL15Z/Xm3VWjFBZmGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734387737; c=relaxed/simple;
	bh=MHhi9S0GHsvH3wVLCm0jNTQH0/RTJXtk4d+qFOLRA+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqSshFKT6VdVWezvESMXmYbo04jvGfiL+m4IQTrBHXdYSmYPLWk3PI4coLvveIzyH168dZBNAVzMDlx4OASAUl5KWgXs8aokv0YfaYTgUvzIC2F3V/UPhwoX7yZdlQjdqyc2bzyH0oDHugBWoVO4WWmxGM8yefujLO1eSIkwxUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6C24497;
	Mon, 16 Dec 2024 14:22:40 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C53C3F58B;
	Mon, 16 Dec 2024 14:22:06 -0800 (PST)
Date: Mon, 16 Dec 2024 23:21:21 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Kai-Heng Feng <kaihengf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, viresh.kumar@linaro.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org,
	Carol Soto <csoto@nvidia.com>
Subject: Re: [PATCH v8 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <Z2Cn4YQjw9-4m55c@arm.com>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
 <20241206135600.4083965-2-beata.michalska@arm.com>
 <3f19c5a8-9ee6-42fe-8b4c-3a66c65c8d35@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f19c5a8-9ee6-42fe-8b4c-3a66c65c8d35@nvidia.com>

On Mon, Dec 16, 2024 at 01:43:02PM +0800, Kai-Heng Feng wrote:
> Hi Beata,
> 
> On 2024/12/6 9:55 PM, Beata Michalska wrote:
> > Currently the CPUFreq core exposes two sysfs attributes that can be used
> > to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> > and scaling_cur_freq. Both provide slightly different view on the
> > subject and they do come with their own drawbacks.
> > 
> > cpuinfo_cur_freq provides higher precision though at a cost of being
> > rather expensive. Moreover, the information retrieved via this attribute
> > is somewhat short lived as frequency can change at any point of time
> > making it difficult to reason from.
> > 
> > scaling_cur_freq, on the other hand, tends to be less accurate but then
> > the actual level of precision (and source of information) varies between
> > architectures making it a bit ambiguous.
> > 
> > The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> > distinct interface, exposing an average frequency of a given CPU(s), as
> > reported by the hardware, over a time frame spanning no more than a few
> > milliseconds. As it requires appropriate hardware support, this
> > interface is optional.
> > 
> > Note that under the hood, the new attribute relies on the information
> > provided by arch_freq_get_on_cpu, which, up to this point, has been
> > feeding data for scaling_cur_freq attribute, being the source of
> > ambiguity when it comes to interpretation. This has been amended by
> > restoring the intended behavior for scaling_cur_freq, with a new
> > dedicated config option to maintain status quo for those, who may need
> > it.
> > 
> > CC: Jonathan Corbet <corbet@lwn.net>
> > CC: Thomas Gleixner <tglx@linutronix.de>
> > CC: Ingo Molnar <mingo@redhat.com>
> > CC: Borislav Petkov <bp@alien8.de>
> > CC: Dave Hansen <dave.hansen@linux.intel.com>
> > CC: H. Peter Anvin <hpa@zytor.com>
> > CC: Phil Auld <pauld@redhat.com>
> > CC: x86@kernel.org
> > CC: linux-doc@vger.kernel.org
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >   Documentation/admin-guide/pm/cpufreq.rst | 16 ++++++++++-
> >   arch/x86/kernel/cpu/aperfmperf.c         |  2 +-
> >   arch/x86/kernel/cpu/proc.c               |  7 +++--
> >   drivers/cpufreq/Kconfig.x86              | 12 ++++++++
> >   drivers/cpufreq/cpufreq.c                | 36 +++++++++++++++++++++---
> >   include/linux/cpufreq.h                  |  2 +-
> >   6 files changed, 66 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
> > index fe1be4ad88cb..76f3835afe01 100644
> > --- a/Documentation/admin-guide/pm/cpufreq.rst
> > +++ b/Documentation/admin-guide/pm/cpufreq.rst
> > @@ -248,6 +248,19 @@ are the following:
> >   	If that frequency cannot be determined, this attribute should not
> >   	be present.
> > +``cpuinfo_avg_freq``
> > +        An average frequency (in KHz) of all CPUs belonging to a given policy,
> > +        derived from a hardware provided feedback and reported on a time frame
> > +        spanning at most few milliseconds.
> > +
> > +        This is expected to be based on the frequency the hardware actually runs
> > +        at and, as such, might require specialised hardware support (such as AMU
> > +        extension on ARM). If one cannot be determined, this attribute should
> > +        not be present.
> > +
> > +        Note, that failed attempt to retrieve current frequency for a given
> > +        CPU(s) will result in an appropriate error.
> > +
> >   ``cpuinfo_max_freq``
> >   	Maximum possible operating frequency the CPUs belonging to this policy
> >   	can run at (in kHz).
> > @@ -293,7 +306,8 @@ are the following:
> >   	Some architectures (e.g. ``x86``) may attempt to provide information
> >   	more precisely reflecting the current CPU frequency through this
> >   	attribute, but that still may not be the exact current CPU frequency as
> > -	seen by the hardware at the moment.
> > +	seen by the hardware at the moment. This behavior though, is only
> > +	available via c:macro:``CPUFREQ_ARCH_CUR_FREQ`` option.
> >   ``scaling_driver``
> >   	The scaling driver currently in use.
> > diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
> > index 0b69bfbf345d..a00059139ca4 100644
> > --- a/arch/x86/kernel/cpu/aperfmperf.c
> > +++ b/arch/x86/kernel/cpu/aperfmperf.c
> > @@ -413,7 +413,7 @@ void arch_scale_freq_tick(void)
> >    */
> >   #define MAX_SAMPLE_AGE	((unsigned long)HZ / 50)
> > -unsigned int arch_freq_get_on_cpu(int cpu)
> > +int arch_freq_get_on_cpu(int cpu)
> >   {
> >   	struct aperfmperf *s = per_cpu_ptr(&cpu_samples, cpu);
> >   	unsigned int seq, freq;
> > diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
> > index e65fae63660e..34d8fb93fb70 100644
> > --- a/arch/x86/kernel/cpu/proc.c
> > +++ b/arch/x86/kernel/cpu/proc.c
> > @@ -86,9 +86,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
> >   		seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
> >   	if (cpu_has(c, X86_FEATURE_TSC)) {
> > -		unsigned int freq = arch_freq_get_on_cpu(cpu);
> > +		int freq = arch_freq_get_on_cpu(cpu);
> > -		seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
> > +		if (freq <= 0)
> > +			seq_puts(m, "cpu MHz\t\t: Unknown\n");
> > +		else
> > +			seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
> >   	}
> >   	/* Cache size */
> > diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
> > index 97c2d4f15d76..212e1b9afe21 100644
> > --- a/drivers/cpufreq/Kconfig.x86
> > +++ b/drivers/cpufreq/Kconfig.x86
> > @@ -340,3 +340,15 @@ config X86_SPEEDSTEP_RELAXED_CAP_CHECK
> >   	  option lets the probing code bypass some of those checks if the
> >   	  parameter "relaxed_check=1" is passed to the module.
> > +config CPUFREQ_ARCH_CUR_FREQ
> > +	default y
> > +	bool "Current frequency derived from HW provided feedback"
> > +	help
> > +	  This determines whether the scaling_cur_freq sysfs attribute returns
> > +	  the last requested frequency or a more precise value based on hardware
> > +	  provided feedback (as architected counters).
> > +	  Given that a more precise frequency can now be provided via the
> > +	  cpuinfo_avg_cur_freq attribute, by enabling this option,
> > +	  scaling_cur_freq maintains the provision of a counter based frequency,
> > +	  for compatibility reasons.
> > +
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 04fc786dd2c0..70df2a24437b 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -747,9 +747,14 @@ show_one(cpuinfo_transition_latency, cpuinfo.transition_latency);
> >   show_one(scaling_min_freq, min);
> >   show_one(scaling_max_freq, max);
> > -__weak unsigned int arch_freq_get_on_cpu(int cpu)
> > +__weak int arch_freq_get_on_cpu(int cpu)
> >   {
> > -	return 0;
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +static inline bool cpufreq_avg_freq_supported(struct cpufreq_policy *policy)
> > +{
> > +	return arch_freq_get_on_cpu(policy->cpu) != -EOPNOTSUPP;
> >   }
> >   static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
> > @@ -757,8 +762,11 @@ static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
> >   	ssize_t ret;
> >   	unsigned int freq;
> > -	freq = arch_freq_get_on_cpu(policy->cpu);
> > -	if (freq)
> > +	freq = IS_ENABLED(CONFIG_CPUFREQ_ARCH_CUR_FREQ)
> > +		? arch_freq_get_on_cpu(policy->cpu)
> > +		: 0;
> > +
> > +	if (freq > 0)
> >   		ret = sysfs_emit(buf, "%u\n", freq);
> >   	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
> >   		ret = sysfs_emit(buf, "%u\n", cpufreq_driver->get(policy->cpu));
> > @@ -802,6 +810,19 @@ static ssize_t show_cpuinfo_cur_freq(struct cpufreq_policy *policy,
> >   	return sysfs_emit(buf, "<unknown>\n");
> >   }
> > +/*
> > + * show_cpuinfo_avg_freq - average CPU frequency as detected by hardware
> > + */
> > +static ssize_t show_cpuinfo_avg_freq(struct cpufreq_policy *policy,
> > +				     char *buf)
> > +{
> > +	int avg_freq = arch_freq_get_on_cpu(policy->cpu);
> 
> We are seeing issues when reading cpuinfo_avg_freq on an ARM64 system:
> 
> $ cat /sys/devices/system/cpu/cpufreq/policy1/cpuinfo_avg_freq
> cat: /sys/devices/system/cpu/cpufreq/policy1/cpuinfo_avg_freq: Resource
> temporarily unavailable
> 
> The CPU is in idle state, so arch_freq_get_on_cpu() can't find a good
> alternative source for frequency info.
> 
> One way to resolve this is to have fallback methods in
> show_cpuinfo_avg_freq() so it will look like this:
> 
> static ssize_t show_cpuinfo_avg_freq(struct cpufreq_policy *policy,
>                                      char *buf)
> {
>         int avg_freq = arch_freq_get_on_cpu(policy->cpu);
>         int ret;
> 
>         if (avg_freq > 0)
>                 ret = sysfs_emit(buf, "%u\n", avg_freq);
>         else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
>                 ret = sysfs_emit(buf, "%u\n", cpufreq_driver->get(policy->cpu));
>         else
>                 ret = sysfs_emit(buf, "%u\n", policy->cur);
>         return ret;
> }
> 
> But that also makes show_cpuinfo_avg_freq() pretty much the same as
> show_scaling_cur_freq().
> 
> So is it possible to consolidate show_cpuinfo_avg_freq() into
> show_scaling_cur_freq(), by making CONFIG_CPUFREQ_ARCH_CUR_FREQ also
> available to ARM64?
>
The whole idea of this patch was to add support for retrieving the average
frequency withouth modifying expected bahaviour of the scaling_cur_freq handler.
The proposed config option is there to keep backward compatibility and allow
userspace tools to catch up with the change - I'd expect that option to be
either set as default to No or droped at some point.

---
BR
Beata
> Kai-Heng
> 
> > +
> > +	if (avg_freq > 0)
> > +		return sysfs_emit(buf, "%u\n", avg_freq);
> > +	return avg_freq != 0 ? avg_freq : -EINVAL;
> > +}
> > +
> >   /*
> >    * show_scaling_governor - show the current policy for the specified CPU
> >    */
> > @@ -964,6 +985,7 @@ static ssize_t show_bios_limit(struct cpufreq_policy *policy, char *buf)
> >   }
> >   cpufreq_freq_attr_ro_perm(cpuinfo_cur_freq, 0400);
> > +cpufreq_freq_attr_ro(cpuinfo_avg_freq);
> >   cpufreq_freq_attr_ro(cpuinfo_min_freq);
> >   cpufreq_freq_attr_ro(cpuinfo_max_freq);
> >   cpufreq_freq_attr_ro(cpuinfo_transition_latency);
> > @@ -1091,6 +1113,12 @@ static int cpufreq_add_dev_interface(struct cpufreq_policy *policy)
> >   			return ret;
> >   	}
> > +	if (cpufreq_avg_freq_supported(policy)) {
> > +		ret = sysfs_create_file(&policy->kobj, &cpuinfo_avg_freq.attr);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >   	ret = sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
> >   	if (ret)
> >   		return ret;
> > diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> > index d4d2f4d1d7cb..a7b6c0ccf9bc 100644
> > --- a/include/linux/cpufreq.h
> > +++ b/include/linux/cpufreq.h
> > @@ -1194,7 +1194,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
> >   }
> >   #endif
> > -extern unsigned int arch_freq_get_on_cpu(int cpu);
> > +extern int arch_freq_get_on_cpu(int cpu);
> >   #ifndef arch_set_freq_scale
> >   static __always_inline
> 

