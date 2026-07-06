Return-Path: <linux-doc+bounces-95106-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bcSlIZp3S2q5RwEAu9opvQ
	(envelope-from <linux-doc+bounces-95106-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 11:38:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF44170EADE
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 11:38:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=spjOGrMA;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95106-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95106-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2466C30EBE1A
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 09:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E063DA7D7;
	Mon,  6 Jul 2026 09:06:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A86412282;
	Mon,  6 Jul 2026 09:05:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328762; cv=none; b=CkTp60JxKpdG1lPW2oI9jxpbbiIRi+/mWvUT5U999t0Q9cz1MzKcrH+JFCBOZ5BxM2ZrdJAHKDCUuQU1N4ic2pr6vQMZTvfZGUVXo5vWcutrZR1qcCajxG9ShLIBxs121gkkgrkOrCbH+8G5awJLYkgdllv5Rsg49tVa3F1W4vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328762; c=relaxed/simple;
	bh=bESqk9eewv/vehvp5JMG4OWDxAE4mHNt5/iPs1hiMS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfHzX0uslhvRj/KakRoJ8uevkRGJ+D8KVTMRSbo4CdbtnkW/wbD/PfIYFBuJ051w/EXiQTjWO2pdeY3nqnWpLRyZuIGTMhRKEOqSiDKoQm7NoJOHTBRuGdICXhOF9XS93FYh0mYlNbDlr86AVE6meK8EHao1E60rppSGJu/OsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=spjOGrMA; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF4F92BC4;
	Mon,  6 Jul 2026 02:05:49 -0700 (PDT)
Received: from [10.1.27.96] (e127648.arm.com [10.1.27.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2AA83F7B4;
	Mon,  6 Jul 2026 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783328754; bh=bESqk9eewv/vehvp5JMG4OWDxAE4mHNt5/iPs1hiMS4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=spjOGrMAtUgbwz9Ik89gqOmd72rCYEg9E6eWq0nccS4uUCTI18ijXkLIdtj8/1SNu
	 CX5SnXUv35vAN9C4jNcb73+ZnkTKCFBwrmaprozedaRLtcjnFvxGCdFtl57R2UQBhD
	 YLIcc6yYu+FKz+dLNqnqp4Puc3KGULS9JOwhuzUo=
Message-ID: <c21a1bc0-ef6d-4cd3-9575-9dd36e911a3c@arm.com>
Date: Mon, 6 Jul 2026 10:05:49 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/topology: Allow EAS without schedutil for
 artificial Energy Models
To: Lucas Lima <lucaslnobrega38@gmail.com>,
 "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: viresh.kumar@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, kprateek.nayak@amd.com, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-pm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629083542.10041-1-lucaslnobrega38@gmail.com>
 <CAJZ5v0iVD90XPsWgT8B+fw9vmFRZTVL7MasPP-=Ci0OdUmNR=A@mail.gmail.com>
 <6021784.DvuYhMxLoT@rafael.j.wysocki>
 <CAMVixxV83tSLEi_o1vmHjqfgPnnXDwo2LjP_m-Y7iEWfvUAP2g@mail.gmail.com>
 <CAJZ5v0h=u3dGbujFpU2yObyLXT0ZLZTxpG2+zLZLP7wpKsBvQw@mail.gmail.com>
 <CAMVixxXpT90bkwGTpL+T-d3ve7BTK3xXwBcaMfhvJ7R+DkxXiw@mail.gmail.com>
 <CAMVixxXCOMb330_rvgbx2Zdy4yufW0BiB5jmv04v_icK-TTVpA@mail.gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <CAMVixxXCOMb330_rvgbx2Zdy4yufW0BiB5jmv04v_icK-TTVpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95106-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lucaslnobrega38@gmail.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-pm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.loehle@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.loehle@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,arm.com:from_mime,arm.com:dkim,arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF44170EADE

On 7/2/26 22:27, Lucas Lima wrote:
> After some testing I found out schedutil is indeed slower to react to load
> changes compared to pstate active.
> 
> The methodology was to empty a cpu, run a serial float recurrence
> (kept non-vectorizable
> on purpose, to isolate frequency ramp-up rather than throughput headroom)
> and compare the average throughput over several initial time windows
> against the steady-state throughput in order to measure the CPU frequency
> ramp-up delay under pstate active and schedutil.

You might be interested in rt-app for more complex experiments along those lines.

> 
> ### P-core
>                                   pstate-eas-balanced
> pstate-eas-performance    schedutil-eas-balanced
> schedutil-eas-performance
> ------------------------------------------------------------------------------------------------------------------------------------------
> Ramp-up (average throughput at time window / steady):
>     0-0.005s (%)                  70.6                      99.4
>                59.7                      61.3
>     0-0.01s (%)                   83.0                      99.5
>                60.2                      62.1
>     0-0.02s (%)                   91.3                      99.5
>                62.9                      65.7
>     0-0.05s (%)                   96.7                      99.8
>                74.8                      77.6
>     0-0.1s (%)                    98.6                      99.9
>                86.9                      88.7
>     0-0.5s (%)                    100.0                     100.1
>                97.4                      97.8
>     0-1.0s (%)                    100.2                     100.1
>                98.7                      98.9
>   Convergence to 95% (ms)         5                         0
>                52                        47
> Steady-state:
>     Throughput (Mops/s)           649.8                     654.4
>                652.3                     651.7
> Energy:
>     Average Power (W)             9.01                      8.98
>                9.10                      9.07
>     Efficiency (J/Gop)            13.889                    13.735
>                14.000                    13.961
> 
> ### E-core
>                                   pstate-eas-balanced
> pstate-eas-performance    schedutil-eas-balanced
> schedutil-eas-performance
> ------------------------------------------------------------------------------------------------------------------------------------------
> Ramp-up (average throughput at time window / steady):
>     0-0.005s (%)                  75.6                      99.0
>                62.3                      57.9
>     0-0.01s (%)                   85.1                      99.1
>                62.2                      58.8
>     0-0.02s (%)                   92.4                      99.3
>                64.5                      61.0
>     0-0.05s (%)                   97.0                      99.7
>                72.9                      69.2
>     0-0.1s (%)                    98.6                      99.9
>                84.8                      82.1
>     0-0.5s (%)                    99.8                      100.0
>                96.9                      96.4
>     0-1.0s (%)                    100.0                     100.0
>                98.5                      98.2
>   Convergence to 95% (ms)         8                         0
>                67                        72
> Steady-state:
>     Throughput (Mops/s)           540.6                     540.8
>                540.1                     539.7
> Energy:
>     Average Power (W)             5.46                      5.47
>                5.61                      5.51
>     Efficiency (J/Gop)            10.119                    10.125
>                10.426                    10.241
> 

Thanks for the data, is this 1000HZ?
Rampup is one thing, the vast difference is obviously when tasks are migrated,
which EAS is very eager to do on wakeup, sugov 'knows' the right OPP immediately,
HWP needs to run through the same wakeup again, and during that window you're
energy calculations are bogus.

> That alone might make it worth it to use pstate active alongside EAS, as
> responsiveness gains are noticeable while busy energy consumption is similar.
> 
> Furthermore, I implemented an EPP based EAS compatibility selection: when
> EPP is set to 0 (performance), eas_compatible is set to false regardless
> of the active cpufreq driver mode -- this also overrides schedutil's own
> eas_compatible assignment in sugov_init()/sugov_exit() when running in
> passive mode. IMHO that makes more sense than gating only on the governor,
> as users selecting the performance power profile are looking for
> responsiveness above all, independently of intel_pstate or governor settings.
> 
> It's also worth noting that governors already have the ability to change
> EPP on their own (via intel_pstate_hwp_set()'s save/restore logic for
> CPUFREQ_POLICY_PERFORMANCE), which can lead to a state where the desktop's
> power profile indicator becomes inconsistent with the actual EPP value:
> 
>   1. Switch governor: powersave -> performance
>      (intel_pstate saves the current EPP internally and forces EPP to 0)
> 
>   2. Switch power profile: balanced -> performance
>      (EPP is explicitly written as 0 again; no visible change, since it
>      was already 0)
> 
>   3. Switch governor: performance -> powersave
>      (intel_pstate restores the EPP to balanced,
>      because the current EPP still reads as 0 and the
>      restore heuristic cannot tell that this 0 was an explicit choice
>      rather than the still-forced value from step 1)
> 
> After step 3, EAS becomes re-enabled, since EPP is no longer "performance"
> -- but the desktop still shows "performance" as the active power profile,
> since nothing told power-profiles-daemon that the EPP changed underneath
> it. This isn't something my patch introduces, it's an existing property
> of intel_pstate's governor-triggered EPP save/restore, but it is relevant
> here.

I think this is a separate ownership problem, but IMO the user gets a choice,
either have a userspace daemon take care of these settings or set it themselves,
i.e. step 1 mustn't happen (I'm reading that correctly that 1. wasn't set
through power-profiles-daemon? If it was that seems a bug in power-profiles-daemon).

> 
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> index 8f5ab9fa3..6d7133b94 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -791,6 +791,18 @@
> cpufreq_freq_attr_ro(energy_performance_available_preferences);
> 
>  static struct cpufreq_driver intel_pstate;
> 
> +static inline void update_eas_compatibility(struct cpufreq_policy
> *policy, struct cpudata *cpu)
> +{
> + bool eas_compatible_was = policy->eas_compatible;
> +
> + policy->eas_compatible = hwp_is_hybrid &&
> + cpu->policy != CPUFREQ_POLICY_PERFORMANCE &&
> + intel_pstate_get_epp(cpu, 0) != HWP_EPP_PERFORMANCE;
> +
> + if (policy->eas_compatible != eas_compatible_was)
> + em_rebuild_sched_domains();
> +}
> +
>  static ssize_t store_energy_performance_preference(
>   struct cpufreq_policy *policy, const char *buf, size_t count)
>  {
> @@ -856,6 +868,8 @@ static ssize_t store_energy_performance_preference(
> 
>   mutex_unlock(&intel_pstate_limits_lock);
> 
> + update_eas_compatibility(policy, cpu);
> +
>   return ret ?: count;
>  }
> 
> @@ -2922,10 +2936,7 @@ static int intel_pstate_set_policy(struct
> cpufreq_policy *policy)
>   intel_pstate_clear_update_util_hook(policy->cpu);
>   intel_pstate_hwp_set(policy->cpu);
> 
> - policy->eas_compatible = hwp_is_hybrid &&
> - cpu->policy != CPUFREQ_POLICY_PERFORMANCE;
> - if (policy->eas_compatible)
> - em_rebuild_sched_domains();
> + update_eas_compatibility(policy, cpu);
>   }
>   /*
>   * policy->cur is never updated with the intel_pstate driver, but it
> 


