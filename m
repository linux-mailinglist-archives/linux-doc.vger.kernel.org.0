Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C3E5814A5
	for <lists+linux-doc@lfdr.de>; Tue, 26 Jul 2022 15:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239278AbiGZN4u (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 26 Jul 2022 09:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239273AbiGZN4S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 09:56:18 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DE0252BE
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 06:56:02 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id q22so8047210pgt.9
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tIOWG9s1e92ioNrCIhQiWnhjfykkKqEOovZ30+o7rsY=;
        b=z34578kv4QOUyL7TvZFzZpPA4AYzA6Gu2O5I8HXV4tntB7q/NM4+Bv8UgrT0NoxnCi
         Wk7E+VLDegKGumqa7x9ETTh7OoqaEcwJIOsnkabVesBS94Z9AqePzXmoiZb/lZt4d8vo
         lctw/epQkSukMGXL4Qd1pHG5fSyR5/r8OO34EoZPfnRpF9iGCstcJQnnoF3ZrzLrzv8/
         ytgE508NcxPz4KF8OigDa5QfQtbqDeKPPSxkjw/hw2wvxTERH+6blZaunmuEKHxboZfZ
         8Gkcu2YvLz2iMglP3GD70i0sS/lAeJ5paWVpcUl7+BDFUZOHJ6ZXs30Dw04tvvyWF1Ik
         6WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tIOWG9s1e92ioNrCIhQiWnhjfykkKqEOovZ30+o7rsY=;
        b=D3uZvsP+rB6BYKnzlhz8vy3bYOc1bxkv57pnQZ6jjzYqOX9Qp6r1DKx6mzVHHFA0bi
         z6j8nZ49+4CIO6iiAHB+tBBEmpQXMLXMRs8qGePGedkZfdHX7VLiX+4XPzzW1B6dVPk0
         umVPawYnCALQn4A7ejQp3sQff3splK2ZMZb7biojwvdoKfBKD/WZfilRNFCNSfbF3e/u
         LkqLB/oKnVsb3JjC08Oc0oh75MAP8y/LBxZEt1tRvClEAhiLPQgCiCaWoT/DfvCIlJvV
         TFiNT/GUX/Df0CoPXut7H1P+Dm2dhSMlq56Q6EALFw9uu+TbGPIlH/AiU70MFhsHAoUa
         YXOA==
X-Gm-Message-State: AJIora+4+hGgyFI/Dg3Umr5GAragOTMG2IwawbpjoCBgjEZhhTAqnRcf
        BIuTPhY+4KC/Eh8btItWTbrNHA==
X-Google-Smtp-Source: AGRyM1sBXRO7j/x5DpcNw7dXgW8+Gm81Vjs+8Eg5faqajmzonhpy6coS/ETEip6y6NCCPHqYhS6rQw==
X-Received: by 2002:a63:4e11:0:b0:419:e9dd:a867 with SMTP id c17-20020a634e11000000b00419e9dda867mr14614522pgb.481.1658843761290;
        Tue, 26 Jul 2022 06:56:01 -0700 (PDT)
Received: from [10.5.61.95] ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id t12-20020aa7946c000000b0052bf678dac6sm4690540pfq.193.2022.07.26.06.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 06:56:00 -0700 (PDT)
Message-ID: <1fa5ebfa-b441-f42c-b721-544458b93cd0@bytedance.com>
Date:   Tue, 26 Jul 2022 21:55:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [External] Re: [PATCH 9/9] sched/psi: add PSI_IRQ to track
 IRQ/SOFTIRQ pressure
Content-Language: en-US
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-10-zhouchengming@bytedance.com>
 <Yt7gOhbqYzIKyhfv@cmpxchg.org>
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <Yt7gOhbqYzIKyhfv@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/7/26 02:26, Johannes Weiner wrote:
> On Thu, Jul 21, 2022 at 12:04:39PM +0800, Chengming Zhou wrote:
>> Now PSI already tracked workload pressure stall information for
>> CPU, memory and IO. Apart from these, IRQ/SOFTIRQ could have
>> obvious impact on some workload productivity, such as web service
>> workload.
>>
>> When CONFIG_IRQ_TIME_ACCOUNTING, we can get IRQ/SOFTIRQ delta time
>> from update_rq_clock_task(), in which we can record that delta
>> to CPU curr task's cgroups as PSI_IRQ_FULL status.
>>
>> Note we don't use PSI_IRQ_SOME since IRQ/SOFTIRQ always happen in
>> the current task on the CPU, make nothing productive could run
>> even if it were runnable, so we only use PSI_IRQ_FULL.
> 
> That sounds reasonable.
> 
>> For performance impact consideration, this is enabled by default when
>> CONFIG_IRQ_TIME_ACCOUNTING, but can be disabled by kernel cmdline
>> parameter "psi_irq=".
> 
> If there isn't a concrete usecase already, let's not add another
> commandline parameter for now.

Ok, will remove it.

> 
>> @@ -63,9 +64,11 @@ enum psi_states {
>>  	PSI_MEM_FULL,
>>  	PSI_CPU_SOME,
>>  	PSI_CPU_FULL,
>> +	PSI_IRQ_SOME,
>> +	PSI_IRQ_FULL,
>>  	/* Only per-CPU, to weigh the CPU in the global average: */
>>  	PSI_NONIDLE,
>> -	NR_PSI_STATES = 7,
>> +	NR_PSI_STATES = 9,
>>  };
> 
> Unfortunately, this grows the psi state touched by the scheduler into
> a second cacheline. :( Please reclaim space first.

Thank you for pointing this out!

> 
> I think we can remove the NR_CPU task count, which frees up one
> u32. Something like the below diff should work (untested!)
> 
> And you should be able to remove PSI_IRQ_SOME, since it's not used
> anyway. Then we'd be good to go.

Very good solution for this, I will test it later.

Thanks!

> 
> diff --git a/include/linux/psi_types.h b/include/linux/psi_types.h
> index c7fe7c089718..31dc76e2d8ea 100644
> --- a/include/linux/psi_types.h
> +++ b/include/linux/psi_types.h
> @@ -15,13 +15,6 @@ enum psi_task_count {
>  	NR_IOWAIT,
>  	NR_MEMSTALL,
>  	NR_RUNNING,
> -	/*
> -	 * This can't have values other than 0 or 1 and could be
> -	 * implemented as a bit flag. But for now we still have room
> -	 * in the first cacheline of psi_group_cpu, and this way we
> -	 * don't have to special case any state tracking for it.
> -	 */
> -	NR_ONCPU,
>  	/*
>  	 * For IO and CPU stalls the presence of running/oncpu tasks
>  	 * in the domain means a partial rather than a full stall.
> @@ -39,9 +32,11 @@ enum psi_task_count {
>  #define TSK_IOWAIT	(1 << NR_IOWAIT)
>  #define TSK_MEMSTALL	(1 << NR_MEMSTALL)
>  #define TSK_RUNNING	(1 << NR_RUNNING)
> -#define TSK_ONCPU	(1 << NR_ONCPU)
>  #define TSK_MEMSTALL_RUNNING	(1 << NR_MEMSTALL_RUNNING)
>  
> +/* Only one task can be scheduled, no corresponding task count */
> +#define TSK_ONCPU	(1 << NR_PSI_TASK_COUNTS)
> +
>  /* Resources that workloads could be stalled on */
>  enum psi_res {
>  	PSI_IO,
> diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> index a4fa3aadfcba..232e1dbfad46 100644
> --- a/kernel/sched/psi.c
> +++ b/kernel/sched/psi.c
> @@ -215,7 +215,7 @@ void __init psi_init(void)
>  	group_init(&psi_system);
>  }
>  
> -static bool test_state(unsigned int *tasks, enum psi_states state)
> +static bool test_state(unsigned int *tasks, enum psi_states state, bool oncpu)
>  {
>  	switch (state) {
>  	case PSI_IO_SOME:
> @@ -228,9 +228,9 @@ static bool test_state(unsigned int *tasks, enum psi_states state)
>  		return unlikely(tasks[NR_MEMSTALL] &&
>  			tasks[NR_RUNNING] == tasks[NR_MEMSTALL_RUNNING]);
>  	case PSI_CPU_SOME:
> -		return unlikely(tasks[NR_RUNNING] > tasks[NR_ONCPU]);
> +		return unlikely(tasks[NR_RUNNING] > oncpu);
>  	case PSI_CPU_FULL:
> -		return unlikely(tasks[NR_RUNNING] && !tasks[NR_ONCPU]);
> +		return unlikely(tasks[NR_RUNNING] && !oncpu);
>  	case PSI_NONIDLE:
>  		return tasks[NR_IOWAIT] || tasks[NR_MEMSTALL] ||
>  			tasks[NR_RUNNING];
> @@ -692,9 +692,9 @@ static void psi_group_change(struct psi_group *group, int cpu,
>  			     bool wake_clock)
>  {
>  	struct psi_group_cpu *groupc;
> -	u32 state_mask = 0;
>  	unsigned int t, m;
>  	enum psi_states s;
> +	u32 state_mask;
>  
>  	groupc = per_cpu_ptr(group->pcpu, cpu);
>  
> @@ -710,6 +710,26 @@ static void psi_group_change(struct psi_group *group, int cpu,
>  
>  	record_times(groupc, now);
>  
> +	/*
> +	 * Start with TSK_ONCPU, which doesn't have a corresponding
> +	 * task count - it's just a boolean flag directly encoded in
> +	 * the state mask. Clear, set, or carry the current state if
> +	 * no changes are requested.
> +	 */
> +	if (clear & TSK_ONCPU) {
> +		state_mask = 0;
> +		clear &= ~TSK_ONCPU;
> +	} else if (set & TSK_ONCPU) {
> +		state_mask = TSK_ONCPU;
> +		set &= ~TSK_ONCPU;
> +	} else {
> +		state_mask = groupc->state_mask & TSK_ONCPU;
> +	}
> +
> +	/*
> +	 * The rest of the state mask is calculated based on the task
> +	 * counts. Update those first, then construct the mask.
> +	 */
>  	for (t = 0, m = clear; m; m &= ~(1 << t), t++) {
>  		if (!(m & (1 << t)))
>  			continue;
> @@ -729,9 +749,8 @@ static void psi_group_change(struct psi_group *group, int cpu,
>  		if (set & (1 << t))
>  			groupc->tasks[t]++;
>  
> -	/* Calculate state mask representing active states */
>  	for (s = 0; s < NR_PSI_STATES; s++) {
> -		if (test_state(groupc->tasks, s))
> +		if (test_state(groupc->tasks, s, state_mask & TSK_ONCPU))
>  			state_mask |= (1 << s);
>  	}
>  
> @@ -743,7 +762,7 @@ static void psi_group_change(struct psi_group *group, int cpu,
>  	 * task in a cgroup is in_memstall, the corresponding groupc
>  	 * on that cpu is in PSI_MEM_FULL state.
>  	 */
> -	if (unlikely(groupc->tasks[NR_ONCPU] && cpu_curr(cpu)->in_memstall))
> +	if (unlikely((state_mask & TSK_ONCPU) && cpu_curr(cpu)->in_memstall))
>  		state_mask |= (1 << PSI_MEM_FULL);
>  
>  	groupc->state_mask = state_mask;
> @@ -847,7 +866,8 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
>  		iter = NULL;
>  		while ((group = iterate_groups(next, &iter))) {
>  			if (identical_state &&
> -			    per_cpu_ptr(group->pcpu, cpu)->tasks[NR_ONCPU]) {
> +			    (per_cpu_ptr(group->pcpu, cpu)->state_mask &
> +			     TSK_ONCPU)) {
>  				common = group;
>  				break;
>  			}
