Return-Path: <linux-doc+bounces-96662-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hFMZF2rYVWoJuQAAu9opvQ
	(envelope-from <linux-doc+bounces-96662-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 08:34:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B683C751836
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 08:34:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=mpci2fWA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96662-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96662-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DC9F3031C88
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 06:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9A3361DC1;
	Tue, 14 Jul 2026 06:31:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02A4352032;
	Tue, 14 Jul 2026 06:31:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010676; cv=none; b=rfiuca5qeGMULEshs1gKi3+LSmBohv2Gd/IzNoZx0PiCqbbpXwMCe5WdOtF6yHWW2n0/ggkowiF5yccjhE+aldM/WLyFm38iaVNPiYcYQO3no0/KC5FrNC4qPM7P5glkr4XzStkvvYDjt8N1Wupdb77RFcrqBkov60DoQlIW2Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010676; c=relaxed/simple;
	bh=U3iuYOz9TU45S1aP4JHBCmO0vOu8KB3u2IrtxW9ZV80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTtIfNKd1mEJKB41XwSctjQkS2N8xSS9U3GVcHshacZEWAMYT0AcezruutOzLrEpOXlKeADNvYySBJ9xAXRT04mHrAkD1o10UIY9bk540H7RgXb8I/P6YA6fHj1R/o7hirjLG/QlB0W93NkyU6/i6jX4krSekyAHmffgV3wgKgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mpci2fWA; arc=none smtp.client-ip=148.163.156.1
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E3Bvbq140221;
	Tue, 14 Jul 2026 06:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=N8D4cV
	71CDrgEoVd03rrl1yIAfxB8Ao6PuLkzv9aqjc=; b=mpci2fWA6CusUE2KFJVuVP
	fWQu1B7sSb72Wr3gJoq9nazckakQlNU0q0yFKj/zut5TSobHWQqMPuZmHys3YUCu
	Obhefsd7dUscNqBlU4XGjtPycrnEplmEjPoSp2lX4FG1yBLhuSLVgYAoKc3V3IvH
	EbN5S2n14ddIYL79Gqa8ot4ADpuf4oFfCeOuf1cMXpCRFDK7XeNKzZgDWKEF/vvI
	0kL4trPoXn8vN7T3YHQT5nlsQ6SyLaG2V1L7qETkhM+FHug5y6+4Kq8Z7y8yhVfN
	kA+KUNucLLZ0gQaXMOsUewNpn+LrVAYowWir5WlddXxxx7EP1PmOFVGQy9CGiSVA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbegt4k4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:31:09 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66E6JctU013070;
	Tue, 14 Jul 2026 06:31:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc2uy0yum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 06:31:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66E6V7Ti20185354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jul 2026 06:31:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1FAF2004F;
	Tue, 14 Jul 2026 06:31:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD0E52004E;
	Tue, 14 Jul 2026 06:30:53 +0000 (GMT)
Received: from [9.124.217.122] (unknown [9.124.217.122])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jul 2026 06:30:53 +0000 (GMT)
Message-ID: <df198506-9c6e-4e79-bf3b-798668322708@linux.ibm.com>
Date: Tue, 14 Jul 2026 12:00:51 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/12] cpumask: Introduce cpu_preferred_mask
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-3-sshegde@linux.ibm.com> <alT78Nzt3xa-7G5Y@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <alT78Nzt3xa-7G5Y@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 4lRTHD1xyxyFulqI_DPZ9p_OFVaQFn8s
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MiBTYWx0ZWRfX4+6wipSZInEu
 nucdUv0I30QrlNRmrTOKxrQbi7IzNoaeVdnfJMdQTaTVwOAPf95h1ggN74IkTry76HglaGDxIz+
 3Po9kAb+dQTpoYVoK991/VFhZBmD5Ko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MiBTYWx0ZWRfXxM+95NB2anHF
 +VcliBSadMBvog85J30vXv4ad+SySyiJOWWNE9SCZ3ItH00viU1mkx9FkQmzdXhsbxwZSdFedSk
 bhzPYscfz+EBZAHHm67FZxz37NB5s/q43sulZFTrse7ZfK+hx/cUUlszZBX6W87WAb1RZSLNjQM
 +fGPofQs6Fo1WbM4GA8ODdAkpgMTTlfjyiG0A1VYI9MSso/3QzL3fZxQwJ+GBmsq57ixQX55/o5
 QmrgtvdpVwWZnSJ5GmnLSGNTne3RfEWEolIffTeCdpT0qDn/ygxCY2LrBgFz5hd4hmgiJBHRIVg
 UODmjjz6YREVUhibJGjieFGoEq3KxYYNTiWo6ojvlsnW5/fva7OX52vBIjYFo0kHfCy+XPO6TZY
 IM+R0D3fVSLeyH2viUuButoHzwuip8wQdsT+xxQeHA8Y/dSn/CSpYLABUbUNUALWdl5SBSIU+wd
 DsskTZFqp0S5fVJUHww==
X-Authority-Analysis: v=2.4 cv=IqMutr/g c=1 sm=1 tr=0 ts=6a55d7ae cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=NEAV23lmAAAA:8
 a=VnNF1IyMAAAA:8 a=-8b0X5Djfwh5J_lnODcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8GJIlo0xgRgXct1QuYP_fYbdSMK2UWWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96662-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ynorov@nvidia.com,m:linux-kernel@vger.kernel.org,m:mingo@kernel.org,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:yury.norov@gmail.com,m:kprateek.nayak@amd.com,m:iii@linux.ibm.com,m:corbet@lwn.net,m:tglx@kernel.org,m:gregkh@linuxfoundation.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:vschneid@redhat.com,m:huschle@linux.ibm.com,m:rostedt@goodmis.org,m:dietmar.eggemann@arm.com,m:maddy@linux.ibm.com,m:srikar@linux.ibm.com,m:hdanton@sina.com,m:chleroy@kernel.org,m:vineeth@bitbyteword.org,m:frederic@kernel.org,m:arighi@nvidia.com,m:pauld@redhat.com,m:christian.loehle@arm.com,m:tj@kernel.org,m:tommaso.cucinotta@gmail.com,m:maz@kernel.org,m:rafael@kernel.org,m:rdunlap@infradead.org,m:kernellwp@gmail.com,m:linux-doc@vger.kernel.org,m:yurynorov@gmail.com,m:tommasocucinotta@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,infradead.org,redhat.com,linaro.org,gmail.com,amd.com,linux.ibm.com,lwn.net,linuxfoundation.org,google.com,goodmis.org,arm.com,sina.com,bitbyteword.org,nvidia.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.ibm.com:from_mime,linux.ibm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B683C751836

Hi Yury,

On 7/13/26 8:23 PM, Yury Norov wrote:
> On Fri, Jul 10, 2026 at 03:26:38AM +0530, Shrikanth Hegde wrote:
>> Provide cpu_preferred_mask infrastructure. Define get/set macros
>> which could be used to get/set CPU state as preferred.
>>
>> PREFERRED_CPU config will be selected by the driver which handles
>> steal time values. It is going to set/clear preferred CPU state.
>> This driver will be called steal_monitor and it is introduced in
>> subsequent patches. It periodically samples the steal time and
>> decides on preferred CPU state.
>>
>> A CPU is set to preferred when it becomes active. Later it may be
>> marked as non-preferred depending on steal time values with
>> steal_monitor being enabled.
>>
>> Always maintain design construct of preferred is subset of active.
>> i.e. preferred ⊆ active ⊆ online ⊆ present ⊆ possible
>>
>> With PREFERRED_CPU=n, ensure set_cpu_preferred is a nop and get
>> method returns the active state in that case.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v6->v7:
>> - removed CONFIG_PREFERRED_CPU as user option.
>> - Use do { } while (0) for nop
>>
>>   include/linux/cpumask.h | 24 ++++++++++++++++++++++++
>>   kernel/Kconfig.preempt  |  3 +++
>>   kernel/cpu.c            |  6 ++++++
>>   kernel/sched/core.c     |  5 +++++
>>   4 files changed, 38 insertions(+)
>>
>> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
>> index d3cda0544954..34d08a3d80e1 100644
>> --- a/include/linux/cpumask.h
>> +++ b/include/linux/cpumask.h
>> @@ -122,12 +122,20 @@ extern struct cpumask __cpu_enabled_mask;
>>   extern struct cpumask __cpu_present_mask;
>>   extern struct cpumask __cpu_active_mask;
>>   extern struct cpumask __cpu_dying_mask;
>> +
>> +#ifdef CONFIG_PREFERRED_CPU
>> +extern struct cpumask __cpu_preferred_mask;
>> +#else
>> +#define __cpu_preferred_mask __cpu_active_mask
>> +#endif
>> +
>>   #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
>>   #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
>>   #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
>>   #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
>>   #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
>>   #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
>> +#define cpu_preferred_mask ((const struct cpumask *)&__cpu_preferred_mask)
>>   
>>   extern atomic_t __num_online_cpus;
>>   extern unsigned int __num_possible_cpus;
>> @@ -1164,6 +1172,12 @@ void init_cpu_possible(const struct cpumask *src);
>>   #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (active))
>>   #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dying))
>>   
>> +#ifdef CONFIG_PREFERRED_CPU
>> +#define set_cpu_preferred(cpu, preferred) assign_cpu((cpu), &__cpu_preferred_mask, (preferred))
>> +#else
>> +#define set_cpu_preferred(cpu, preferred) do { } while (0)
>> +#endif
>> +
>>   void set_cpu_online(unsigned int cpu, bool online);
>>   void set_cpu_possible(unsigned int cpu, bool possible);
>>   
>> @@ -1258,6 +1272,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
>>   	return cpumask_test_cpu(cpu, cpu_dying_mask);
>>   }
>>   
>> +static __always_inline bool cpu_preferred(unsigned int cpu)
>> +{
>> +	return cpumask_test_cpu(cpu, cpu_preferred_mask);
>> +}
>> +
>>   #else
>>   
>>   #define num_online_cpus()	1U
>> @@ -1296,6 +1315,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
>>   	return false;
>>   }
>>   
>> +static __always_inline bool cpu_preferred(unsigned int cpu)
>> +{
>> +	return cpu == 0;
>> +}
>> +
>>   #endif /* NR_CPUS > 1 */
>>   
>>   #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
>> diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
>> index 88c594c6d7fc..ed02e4431230 100644
>> --- a/kernel/Kconfig.preempt
>> +++ b/kernel/Kconfig.preempt
>> @@ -192,3 +192,6 @@ config SCHED_CLASS_EXT
>>   	  For more information:
>>   	    Documentation/scheduler/sched-ext.rst
>>   	    https://github.com/sched-ext/scx
>> +
>> +config PREFERRED_CPU
>> +	bool
> 
> This still should depend on PARAVIRT and SMP. And maybe to enforce it
> even stronger, your driver should fail to build if PREFERRED_CPU is
> disabled. Imagine a scenario when someone makes PREFERRED_CPU
> depending on some other config, but doesn't modify your driver. That
> way you'll build the STEAL_MONITOR successfully, but because
> PREFERRED_CPU is off, you'll end up with non-working functionality at
> best, or corrupted cpu_active_mask at worst.
> 

Sorry, i may not understand all the intricacies of kconfigs.
But, Since driver selects PREFERRED_CPU, and PREFERRED_CPU can't be enabled
individually, driver again can't depend on PREFERRED_CPU right?

As per previous discussion, it is probably better that driver selects PREFERRED_CPU.
Keeping them both independent and selectable brings too many variations.
No?


I guess you meant below.

In kernel/Kconfig.preempt:
config PREFERRED_CPU
	bool
	depends on SMP && PARAVIRT

Driver's Kconfig (this is there already)
config VIRT_STEAL_GOVERNOR
	tristate "Virtual Steal Time Governor"
	depends on SMP && PARAVIRT
	select PREFERRED_CPU


> Also, the name 'steal monitor' implies monitoring, while in fact
> you're actively affecting the scheduling process.
> 
> Maybe 'steal governor'?
> 

Make sense. Will do.

> Thanks,
> Yury


