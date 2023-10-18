Return-Path: <linux-doc+bounces-493-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C2A7CDD9B
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 15:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88738B20F2E
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 13:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECAD358B0;
	Wed, 18 Oct 2023 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pc4wjT4A"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0291A582
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 13:42:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D67106
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697636521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILBT+iSHEJYre2cM7vHpJtGYMUXtqABzFsja9O+e7DU=;
	b=Pc4wjT4AZfxhLYoo4Id15hq4I+F41vNDJ2ysPXqSulhz/wXGu8aCSJGFOg9KeKNMXDihw2
	sYtkkDJpEoTnIzKMwiripbp3K1PDaby/3zqX4CjZ3oqZ+kT96Zt5Jsjdc3EZ29TJG3UW8s
	h5FnsHeYtanuSM+rnF3oGkyjv2W7a2E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-QMq3P2rQM2OaGDnv-n7yWQ-1; Wed, 18 Oct 2023 09:41:58 -0400
X-MC-Unique: QMq3P2rQM2OaGDnv-n7yWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DB8C87A9F9;
	Wed, 18 Oct 2023 13:41:57 +0000 (UTC)
Received: from [10.22.17.22] (unknown [10.22.17.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97AEE1121314;
	Wed, 18 Oct 2023 13:41:56 +0000 (UTC)
Message-ID: <4e9cc6e3-7582-64af-76d7-6f9f72779146@redhat.com>
Date: Wed, 18 Oct 2023 09:41:55 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH-cgroup 1/4] workqueue: Add
 workqueue_unbound_exclude_cpumask() to exclude CPUs from wq_unbound_cpumask
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>
Cc: Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20231013181122.3518610-1-longman@redhat.com>
 <20231013181122.3518610-2-longman@redhat.com>
 <ZS-kTXgSZoc985ul@slm.duckdns.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZS-kTXgSZoc985ul@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/18/23 05:24, Tejun Heo wrote:
> Hello,
>
> On Fri, Oct 13, 2023 at 02:11:19PM -0400, Waiman Long wrote:
>> When the "isolcpus" boot command line option is used to add a set
>> of isolated CPUs, those CPUs will be excluded automatically from
>> wq_unbound_cpumask to avoid running work functions from unbound
>> workqueues.
>>
>> Recently cpuset has been extended to allow the creation of partitions
>> of isolated CPUs dynamically. To make it closer to the "isolcpus"
>> in functionality, the CPUs in those isolated cpuset partitions should be
>> excluded from wq_unbound_cpumask as well. This can be done currently by
>> explicitly writing to the workqueue's cpumask sysfs file after creating
>> the isolated partitions. However, this process can be error prone.
>> Ideally, the cpuset code should be allowed to request the workqueue code
>> to exclude those isolated CPUs from wq_unbound_cpumask so that this
>> operation can be done automatically and the isolated CPUs will be returned
>> back to wq_unbound_cpumask after the destructions of the isolated
>> cpuset partitions.
>>
>> This patch adds a new workqueue_unbound_exclude_cpumask() to enable
>> that. This new function will exclude the specified isolated CPUs
>> from wq_unbound_cpumask. To be able to restore those isolated CPUs
>> back after the destruction of isolated cpuset partitions, a new
>> wq_user_unbound_cpumask is added to store the user provided unbound
>> cpumask either from the boot command line options or from writing to
>> the cpumask sysfs file. This new cpumask provides the basis for CPU
>> exclusion.
> The behaviors around wq_unbound_cpumask is getting pretty inconsistent:
>
> 1. Housekeeping excludes isolated CPUs on boot but allows user to override
>     it to include isolated CPUs afterwards.
>
> 2. If an unbound wq's cpumask doesn't have any intersection with
>     wq_unbound_cpumask we ignore the per-wq cpumask and falls back to
>     wq_unbound_cpumask.
>
> 3. You're adding a masking layer on top with exclude which fails to set if
>     the intersection is empty.
>
> Can we do the followings for consistency?
>
> 1. User's requested_unbound_cpumask is stored separately (as in this patch).
>
> 2. The effect wq_unbound_cpumask is determined by requested_unbound_cpumask
>     & housekeeping_cpumask & cpuset_allowed_cpumask. The operation order
>     matters. When an & operation yields an cpumask, the cpumask from the
>     previous step is the effective one.
Sure. I will do that.
>
> 3. Expose these cpumasks in sysfs so that what's happening is obvious.

I can expose the requested_unbound_cpumask. As for the isolated CPUs, 
see my other reply.

>> +int workqueue_unbound_exclude_cpumask(cpumask_var_t exclude_cpumask)
>> +{
>> +	cpumask_var_t cpumask;
>> +	int ret = 0;
>> +
>> +	if (!zalloc_cpumask_var(&cpumask, GFP_KERNEL))
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * The caller of this function may have called cpus_read_lock(),
>> +	 * use cpus_read_trylock() to avoid potential deadlock.
>> +	 */
>> +	if (!cpus_read_trylock())
>> +		return -EBUSY;
> This means that a completely unrelated cpus_write_lock() can fail this
> operation and thus cpuset config writes. Let's please not do this. Can't we
> just make sure that the caller holds the lock?
This condition is actually triggered by a few hotplug tests in 
test_cpuset_prs.sh. I will make sure that either cpu read or write lock 
is held before calling this function and eliminate rcu read locking here.
>
>> +	mutex_lock(&wq_pool_mutex);
>> +
>> +	if (!cpumask_andnot(cpumask, wq_user_unbound_cpumask, exclude_cpumask))
>> +		ret = -EINVAL;	/* The new cpumask can't be empty */
> For better or worse, the usual mode-of-failure for "no usable CPU" is just
> falling back to something which works rather than failing the operation.
> Let's follow that.

In this case, it is just leaving the current unbound cpumask unchanged. 
I will follow the precedence discussed above to make sure that there is 
a graceful fallback.

Cheers,
Longman


