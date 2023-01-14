Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C17E066A89E
	for <lists+linux-doc@lfdr.de>; Sat, 14 Jan 2023 03:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbjANCUF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 13 Jan 2023 21:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjANCT7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Jan 2023 21:19:59 -0500
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63AAA8CBC8;
        Fri, 13 Jan 2023 18:19:56 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VZW9rHd_1673662790;
Received: from 30.27.94.170(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VZW9rHd_1673662790)
          by smtp.aliyun-inc.com;
          Sat, 14 Jan 2023 10:19:52 +0800
Message-ID: <d6ec50c4-5fc3-eb17-e9e8-fce334038193@linux.alibaba.com>
Date:   Sat, 14 Jan 2023 10:19:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] workqueue: Add WQ_SCHED_FIFO
To:     Nathan Huckleberry <nhuck@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tejun Heo <tj@kernel.org>
Cc:     Sandeep Dhavale <dhavale@google.com>,
        Daeho Jeong <daehojeong@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org
References: <20230113210703.62107-1-nhuck@google.com>
From:   Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20230113210703.62107-1-nhuck@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Nathan!

On 2023/1/14 05:07, Nathan Huckleberry wrote:
> Add a WQ flag that allows workqueues to use SCHED_FIFO with the least
> imporant RT priority.  This can reduce scheduler latency for IO
> post-processing when the CPU is under load without impacting other RT
> workloads.  This has been shown to improve app startup time on Android
> [1].

Thank you all for your effort on this.  Unfortunately I have no time to
setup the test [1] until now.  If it can be addressed as a new workqueue
feature, that would be much helpful to me.  Otherwise, I still need to
find a way to resolve the latest Android + EROFS latency problem.

> 
> Scheduler latency affects several drivers as evidenced by [1], [2], [3],
> [4].  Some of these drivers have moved post-processing into IRQ context.
> However, this can cause latency spikes for real-time threads and jitter
> related jank on Android.  Using a workqueue with SCHED_FIFO improves
> scheduler latency without causing latency problems for RT threads.

softirq context is actually mainly for post-interrupt handling I think.
but considering decompression/verification/decryption all workload are much
complex than that and less important than real post-interrupt handling.
I don't think softirq context is the best place to handle these
CPU-intensive jobs.  Beside, it could cause some important work moving to
softirqd unexpectedly in the extreme cases.  Also such many post-processing
jobs are as complex as they could sleep so that softirq context is
unsuitable as well.

Anyway, I second this proposal if possible:

Acked-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> 
> [1]:
> https://lore.kernel.org/linux-erofs/20230106073502.4017276-1-dhavale@google.com/
> [2]:
> https://lore.kernel.org/linux-f2fs-devel/20220802192437.1895492-1-daeho43@gmail.com/
> [3]:
> https://lore.kernel.org/dm-devel/20220722093823.4158756-4-nhuck@google.com/
> [4]:
> https://lore.kernel.org/dm-crypt/20200706173731.3734-1-ignat@cloudflare.com/
> 
> This change has been tested on dm-verity with the following fio config:
> 
> [global]
> time_based
> runtime=120
> 
> [do-verify]
> ioengine=sync
> filename=/dev/testing
> rw=randread
> direct=1
> 
> [burn_8x90%_qsort]
> ioengine=cpuio
> cpuload=90
> numjobs=8
> cpumode=qsort
> 
> Before:
> clat (usec): min=13, max=23882, avg=29.56, stdev=113.29 READ:
> bw=122MiB/s (128MB/s), 122MiB/s-122MiB/s (128MB/s-128MB/s), io=14.3GiB
> (15.3GB), run=120001-120001msec
> 
> After:
> clat (usec): min=13, max=23137, avg=19.96, stdev=105.71 READ:
> bw=180MiB/s (189MB/s), 180MiB/s-180MiB/s (189MB/s-189MB/s), io=21.1GiB
> (22.7GB), run=120012-120012msec
> 
> Cc: Sandeep Dhavale <dhavale@google.com>
> Cc: Daeho Jeong <daehojeong@google.com>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
>   Documentation/core-api/workqueue.rst | 12 ++++++++++
>   include/linux/workqueue.h            |  9 +++++++
>   kernel/workqueue.c                   | 36 +++++++++++++++++++++-------
>   3 files changed, 48 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
> index 3b22ed137662..26faf2806c66 100644
> --- a/Documentation/core-api/workqueue.rst
> +++ b/Documentation/core-api/workqueue.rst
> @@ -216,6 +216,18 @@ resources, scheduled and executed.
>   
>     This flag is meaningless for unbound wq.
>   
> +``WQ_SCHED_FIFO``
> +  Work items of a fifo wq are queued to the fifo
> +  worker-pool of the target cpu.  Fifo worker-pools are
> +  served by worker threads with scheduler policy SCHED_FIFO and
> +  the least important real-time priority.  This can be useful
> +  for workloads where low latency is imporant.
> +
> +  A workqueue cannot be both high-priority and fifo.
> +
> +  Note that normal and fifo worker-pools don't interact with
> +  each other.  Each maintains its separate pool of workers and
> +  implements concurrency management among its workers.
>   
>   ``max_active``
>   --------------
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index ac551b8ee7d9..43a4eeaf8ff4 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -134,6 +134,10 @@ struct workqueue_attrs {
>   	 * @nice: nice level
>   	 */
>   	int nice;
> +	/**
> +	 * @sched_fifo: is using SCHED_FIFO
> +	 */
> +	bool sched_fifo;
>   
>   	/**
>   	 * @cpumask: allowed CPUs
> @@ -334,6 +338,11 @@ enum {
>   	 * http://thread.gmane.org/gmane.linux.kernel/1480396
>   	 */
>   	WQ_POWER_EFFICIENT	= 1 << 7,
> +	/*
> +	 * Low real-time priority workqueues can reduce scheduler latency
> +	 * for latency sensitive workloads like IO post-processing.
> +	 */
> +	WQ_SCHED_FIFO		= 1 << 8,
>   
>   	__WQ_DESTROYING		= 1 << 15, /* internal: workqueue is destroying */
>   	__WQ_DRAINING		= 1 << 16, /* internal: workqueue is draining */
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 5dc67aa9d696..99c5e0a3dc28 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -85,7 +85,7 @@ enum {
>   	WORKER_NOT_RUNNING	= WORKER_PREP | WORKER_CPU_INTENSIVE |
>   				  WORKER_UNBOUND | WORKER_REBOUND,
>   
> -	NR_STD_WORKER_POOLS	= 2,		/* # standard pools per cpu */
> +	NR_STD_WORKER_POOLS	= 3,		/* # standard pools per cpu */
>   
>   	UNBOUND_POOL_HASH_ORDER	= 6,		/* hashed by pool->attrs */
>   	BUSY_WORKER_HASH_ORDER	= 6,		/* 64 pointers */
> @@ -1949,7 +1949,8 @@ static struct worker *create_worker(struct worker_pool *pool)
>   
>   	if (pool->cpu >= 0)
>   		snprintf(id_buf, sizeof(id_buf), "%d:%d%s", pool->cpu, id,
> -			 pool->attrs->nice < 0  ? "H" : "");
> +			 pool->attrs->sched_fifo ? "F" :
> +			 (pool->attrs->nice < 0  ? "H" : ""));
>   	else
>   		snprintf(id_buf, sizeof(id_buf), "u%d:%d", pool->id, id);
>   
> @@ -1958,7 +1959,11 @@ static struct worker *create_worker(struct worker_pool *pool)
>   	if (IS_ERR(worker->task))
>   		goto fail;
>   
> -	set_user_nice(worker->task, pool->attrs->nice);
> +	if (pool->attrs->sched_fifo)
> +		sched_set_fifo_low(worker->task);
> +	else
> +		set_user_nice(worker->task, pool->attrs->nice);
> +
>   	kthread_bind_mask(worker->task, pool->attrs->cpumask);
>   
>   	/* successful, attach the worker to the pool */
> @@ -4323,9 +4328,17 @@ static void wq_update_unbound_numa(struct workqueue_struct *wq, int cpu,
>   
>   static int alloc_and_link_pwqs(struct workqueue_struct *wq)
>   {
> -	bool highpri = wq->flags & WQ_HIGHPRI;
> +	int pool_index = 0;
>   	int cpu, ret;
>   
> +	if (wq->flags & WQ_HIGHPRI && wq->flags & WQ_SCHED_FIFO)
> +		return -EINVAL;
> +
> +	if (wq->flags & WQ_HIGHPRI)
> +		pool_index = 1;
> +	if (wq->flags & WQ_SCHED_FIFO)
> +		pool_index = 2;
> +
>   	if (!(wq->flags & WQ_UNBOUND)) {
>   		wq->cpu_pwqs = alloc_percpu(struct pool_workqueue);
>   		if (!wq->cpu_pwqs)
> @@ -4337,7 +4350,7 @@ static int alloc_and_link_pwqs(struct workqueue_struct *wq)
>   			struct worker_pool *cpu_pools =
>   				per_cpu(cpu_worker_pools, cpu);
>   
> -			init_pwq(pwq, wq, &cpu_pools[highpri]);
> +			init_pwq(pwq, wq, &cpu_pools[pool_index]);
>   
>   			mutex_lock(&wq->mutex);
>   			link_pwq(pwq);
> @@ -4348,13 +4361,13 @@ static int alloc_and_link_pwqs(struct workqueue_struct *wq)
>   
>   	cpus_read_lock();
>   	if (wq->flags & __WQ_ORDERED) {
> -		ret = apply_workqueue_attrs(wq, ordered_wq_attrs[highpri]);
> +		ret = apply_workqueue_attrs(wq, ordered_wq_attrs[pool_index]);
>   		/* there should only be single pwq for ordering guarantee */
>   		WARN(!ret && (wq->pwqs.next != &wq->dfl_pwq->pwqs_node ||
>   			      wq->pwqs.prev != &wq->dfl_pwq->pwqs_node),
>   		     "ordering guarantee broken for workqueue %s\n", wq->name);
>   	} else {
> -		ret = apply_workqueue_attrs(wq, unbound_std_wq_attrs[highpri]);
> +		ret = apply_workqueue_attrs(wq, unbound_std_wq_attrs[pool_index]);
>   	}
>   	cpus_read_unlock();
>   
> @@ -6138,7 +6151,8 @@ static void __init wq_numa_init(void)
>    */
>   void __init workqueue_init_early(void)
>   {
> -	int std_nice[NR_STD_WORKER_POOLS] = { 0, HIGHPRI_NICE_LEVEL };
> +	int std_nice[NR_STD_WORKER_POOLS] = { 0, HIGHPRI_NICE_LEVEL, 0 };
> +	bool std_sched_fifo[NR_STD_WORKER_POOLS] = { false, false, true };
>   	int i, cpu;
>   
>   	BUILD_BUG_ON(__alignof__(struct pool_workqueue) < __alignof__(long long));
> @@ -6158,8 +6172,10 @@ void __init workqueue_init_early(void)
>   			BUG_ON(init_worker_pool(pool));
>   			pool->cpu = cpu;
>   			cpumask_copy(pool->attrs->cpumask, cpumask_of(cpu));
> -			pool->attrs->nice = std_nice[i++];
> +			pool->attrs->nice = std_nice[i];
> +			pool->attrs->sched_fifo = std_sched_fifo[i];
>   			pool->node = cpu_to_node(cpu);
> +			i++;
>   
>   			/* alloc pool ID */
>   			mutex_lock(&wq_pool_mutex);
> @@ -6174,6 +6190,7 @@ void __init workqueue_init_early(void)
>   
>   		BUG_ON(!(attrs = alloc_workqueue_attrs()));
>   		attrs->nice = std_nice[i];
> +		attrs->sched_fifo = std_sched_fifo[i];
>   		unbound_std_wq_attrs[i] = attrs;
>   
>   		/*
> @@ -6183,6 +6200,7 @@ void __init workqueue_init_early(void)
>   		 */
>   		BUG_ON(!(attrs = alloc_workqueue_attrs()));
>   		attrs->nice = std_nice[i];
> +		attrs->sched_fifo = std_sched_fifo[i];
>   		attrs->no_numa = true;
>   		ordered_wq_attrs[i] = attrs;
>   	}
