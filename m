Return-Path: <linux-doc+bounces-32192-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0EB9E6FAA
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2024 14:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9566A283879
	for <lists+linux-doc@lfdr.de>; Fri,  6 Dec 2024 13:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB547207DFB;
	Fri,  6 Dec 2024 13:56:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC5B207DF3;
	Fri,  6 Dec 2024 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733493404; cv=none; b=tcjupMWC34DY5A9AJRTheT3mE1MZc1qjacNoS26kV3EVasZDk5x+mpb0HfevwDbSZuKfD87KmagC+PnK2U7jKluI29Sx1NPboY+y5ssy/b9c94gVyUg7bDl8p8nXlSDN+zakOcyEh4Ps5qI7IWnP6q2cmF4Nl0QtBCvu5W6qRUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733493404; c=relaxed/simple;
	bh=F3rCa+EKfVeSDueTC/VEylWHAVYRd3DnEwFNfdPo2Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tjKLso5JCZJF5cR4/8AwKB6s85NKGxzrndAjdV3esFO8DM62AHRAbn1JuWaSuLAgYja+FC9wFxpxOT4Av2iW0GfSU7jQVDEJU3HyRwE45NRFUuFUl2F4CUD0KN9A7rN65Gbq3o+3/DdVI6XTjqKsdHWGTyNNaokFgIOlzqsiu0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 416AA12FC;
	Fri,  6 Dec 2024 05:57:09 -0800 (PST)
Received: from e125905.cambridge.arm.com (e125905.cambridge.arm.com [10.1.194.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D5E23F71E;
	Fri,  6 Dec 2024 05:56:37 -0800 (PST)
From: Beata Michalska <beata.michalska@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	ionela.voinescu@arm.com,
	sudeep.holla@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: sumitg@nvidia.com,
	yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com,
	zhanjie9@hisilicon.com,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Phil Auld <pauld@redhat.com>,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v8 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq sysfs entry
Date: Fri,  6 Dec 2024 13:55:57 +0000
Message-Id: <20241206135600.4083965-2-beata.michalska@arm.com>
In-Reply-To: <20241206135600.4083965-1-beata.michalska@arm.com>
References: <20241206135600.4083965-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the CPUFreq core exposes two sysfs attributes that can be used
to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
and scaling_cur_freq. Both provide slightly different view on the
subject and they do come with their own drawbacks.

cpuinfo_cur_freq provides higher precision though at a cost of being
rather expensive. Moreover, the information retrieved via this attribute
is somewhat short lived as frequency can change at any point of time
making it difficult to reason from.

scaling_cur_freq, on the other hand, tends to be less accurate but then
the actual level of precision (and source of information) varies between
architectures making it a bit ambiguous.

The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
distinct interface, exposing an average frequency of a given CPU(s), as
reported by the hardware, over a time frame spanning no more than a few
milliseconds. As it requires appropriate hardware support, this
interface is optional.

Note that under the hood, the new attribute relies on the information
provided by arch_freq_get_on_cpu, which, up to this point, has been
feeding data for scaling_cur_freq attribute, being the source of
ambiguity when it comes to interpretation. This has been amended by
restoring the intended behavior for scaling_cur_freq, with a new
dedicated config option to maintain status quo for those, who may need
it.

CC: Jonathan Corbet <corbet@lwn.net>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: H. Peter Anvin <hpa@zytor.com>
CC: Phil Auld <pauld@redhat.com>
CC: x86@kernel.org
CC: linux-doc@vger.kernel.org
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 Documentation/admin-guide/pm/cpufreq.rst | 16 ++++++++++-
 arch/x86/kernel/cpu/aperfmperf.c         |  2 +-
 arch/x86/kernel/cpu/proc.c               |  7 +++--
 drivers/cpufreq/Kconfig.x86              | 12 ++++++++
 drivers/cpufreq/cpufreq.c                | 36 +++++++++++++++++++++---
 include/linux/cpufreq.h                  |  2 +-
 6 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
index fe1be4ad88cb..76f3835afe01 100644
--- a/Documentation/admin-guide/pm/cpufreq.rst
+++ b/Documentation/admin-guide/pm/cpufreq.rst
@@ -248,6 +248,19 @@ are the following:
 	If that frequency cannot be determined, this attribute should not
 	be present.
 
+``cpuinfo_avg_freq``
+        An average frequency (in KHz) of all CPUs belonging to a given policy,
+        derived from a hardware provided feedback and reported on a time frame
+        spanning at most few milliseconds.
+
+        This is expected to be based on the frequency the hardware actually runs
+        at and, as such, might require specialised hardware support (such as AMU
+        extension on ARM). If one cannot be determined, this attribute should
+        not be present.
+
+        Note, that failed attempt to retrieve current frequency for a given
+        CPU(s) will result in an appropriate error.
+
 ``cpuinfo_max_freq``
 	Maximum possible operating frequency the CPUs belonging to this policy
 	can run at (in kHz).
@@ -293,7 +306,8 @@ are the following:
 	Some architectures (e.g. ``x86``) may attempt to provide information
 	more precisely reflecting the current CPU frequency through this
 	attribute, but that still may not be the exact current CPU frequency as
-	seen by the hardware at the moment.
+	seen by the hardware at the moment. This behavior though, is only
+	available via c:macro:``CPUFREQ_ARCH_CUR_FREQ`` option.
 
 ``scaling_driver``
 	The scaling driver currently in use.
diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
index 0b69bfbf345d..a00059139ca4 100644
--- a/arch/x86/kernel/cpu/aperfmperf.c
+++ b/arch/x86/kernel/cpu/aperfmperf.c
@@ -413,7 +413,7 @@ void arch_scale_freq_tick(void)
  */
 #define MAX_SAMPLE_AGE	((unsigned long)HZ / 50)
 
-unsigned int arch_freq_get_on_cpu(int cpu)
+int arch_freq_get_on_cpu(int cpu)
 {
 	struct aperfmperf *s = per_cpu_ptr(&cpu_samples, cpu);
 	unsigned int seq, freq;
diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
index e65fae63660e..34d8fb93fb70 100644
--- a/arch/x86/kernel/cpu/proc.c
+++ b/arch/x86/kernel/cpu/proc.c
@@ -86,9 +86,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
 
 	if (cpu_has(c, X86_FEATURE_TSC)) {
-		unsigned int freq = arch_freq_get_on_cpu(cpu);
+		int freq = arch_freq_get_on_cpu(cpu);
 
-		seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
+		if (freq <= 0)
+			seq_puts(m, "cpu MHz\t\t: Unknown\n");
+		else
+			seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
 	}
 
 	/* Cache size */
diff --git a/drivers/cpufreq/Kconfig.x86 b/drivers/cpufreq/Kconfig.x86
index 97c2d4f15d76..212e1b9afe21 100644
--- a/drivers/cpufreq/Kconfig.x86
+++ b/drivers/cpufreq/Kconfig.x86
@@ -340,3 +340,15 @@ config X86_SPEEDSTEP_RELAXED_CAP_CHECK
 	  option lets the probing code bypass some of those checks if the
 	  parameter "relaxed_check=1" is passed to the module.
 
+config CPUFREQ_ARCH_CUR_FREQ
+	default y
+	bool "Current frequency derived from HW provided feedback"
+	help
+	  This determines whether the scaling_cur_freq sysfs attribute returns
+	  the last requested frequency or a more precise value based on hardware
+	  provided feedback (as architected counters).
+	  Given that a more precise frequency can now be provided via the
+	  cpuinfo_avg_cur_freq attribute, by enabling this option,
+	  scaling_cur_freq maintains the provision of a counter based frequency,
+	  for compatibility reasons.
+
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 04fc786dd2c0..70df2a24437b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -747,9 +747,14 @@ show_one(cpuinfo_transition_latency, cpuinfo.transition_latency);
 show_one(scaling_min_freq, min);
 show_one(scaling_max_freq, max);
 
-__weak unsigned int arch_freq_get_on_cpu(int cpu)
+__weak int arch_freq_get_on_cpu(int cpu)
 {
-	return 0;
+	return -EOPNOTSUPP;
+}
+
+static inline bool cpufreq_avg_freq_supported(struct cpufreq_policy *policy)
+{
+	return arch_freq_get_on_cpu(policy->cpu) != -EOPNOTSUPP;
 }
 
 static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
@@ -757,8 +762,11 @@ static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
 	ssize_t ret;
 	unsigned int freq;
 
-	freq = arch_freq_get_on_cpu(policy->cpu);
-	if (freq)
+	freq = IS_ENABLED(CONFIG_CPUFREQ_ARCH_CUR_FREQ)
+		? arch_freq_get_on_cpu(policy->cpu)
+		: 0;
+
+	if (freq > 0)
 		ret = sysfs_emit(buf, "%u\n", freq);
 	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
 		ret = sysfs_emit(buf, "%u\n", cpufreq_driver->get(policy->cpu));
@@ -802,6 +810,19 @@ static ssize_t show_cpuinfo_cur_freq(struct cpufreq_policy *policy,
 	return sysfs_emit(buf, "<unknown>\n");
 }
 
+/*
+ * show_cpuinfo_avg_freq - average CPU frequency as detected by hardware
+ */
+static ssize_t show_cpuinfo_avg_freq(struct cpufreq_policy *policy,
+				     char *buf)
+{
+	int avg_freq = arch_freq_get_on_cpu(policy->cpu);
+
+	if (avg_freq > 0)
+		return sysfs_emit(buf, "%u\n", avg_freq);
+	return avg_freq != 0 ? avg_freq : -EINVAL;
+}
+
 /*
  * show_scaling_governor - show the current policy for the specified CPU
  */
@@ -964,6 +985,7 @@ static ssize_t show_bios_limit(struct cpufreq_policy *policy, char *buf)
 }
 
 cpufreq_freq_attr_ro_perm(cpuinfo_cur_freq, 0400);
+cpufreq_freq_attr_ro(cpuinfo_avg_freq);
 cpufreq_freq_attr_ro(cpuinfo_min_freq);
 cpufreq_freq_attr_ro(cpuinfo_max_freq);
 cpufreq_freq_attr_ro(cpuinfo_transition_latency);
@@ -1091,6 +1113,12 @@ static int cpufreq_add_dev_interface(struct cpufreq_policy *policy)
 			return ret;
 	}
 
+	if (cpufreq_avg_freq_supported(policy)) {
+		ret = sysfs_create_file(&policy->kobj, &cpuinfo_avg_freq.attr);
+		if (ret)
+			return ret;
+	}
+
 	ret = sysfs_create_file(&policy->kobj, &scaling_cur_freq.attr);
 	if (ret)
 		return ret;
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index d4d2f4d1d7cb..a7b6c0ccf9bc 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1194,7 +1194,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
 }
 #endif
 
-extern unsigned int arch_freq_get_on_cpu(int cpu);
+extern int arch_freq_get_on_cpu(int cpu);
 
 #ifndef arch_set_freq_scale
 static __always_inline
-- 
2.25.1


