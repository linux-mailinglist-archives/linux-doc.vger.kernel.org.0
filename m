Return-Path: <linux-doc+bounces-560-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696967CE790
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 21:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC2B1C20A05
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 19:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645BF42BE3;
	Wed, 18 Oct 2023 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSkGsTA1"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76EF41A98
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 19:19:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4739D109
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 12:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697656746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8mqtxJn0RIu5PIvWrBwIFU/c+8fQEb8PdmiMLhcCVo=;
	b=MSkGsTA1diSTrMPECECtiLMpI/aV6iXLIoo1/9LONc96UBdJ8szi38Qzin2fbQ50NSDKrd
	a0zNuFqr6hCns0EtibJqR/cedGnrVGxip0BABj1tWk/MqP8SQ6DvlEI91F2LuZNStKKZRu
	+cAW6NQgqgNYYemYHvXehzgGF6EEWTA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-6TOr_ffSO6qAkdIxLaQMiQ-1; Wed, 18 Oct 2023 15:18:55 -0400
X-MC-Unique: 6TOr_ffSO6qAkdIxLaQMiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C722A857D0C;
	Wed, 18 Oct 2023 19:18:53 +0000 (UTC)
Received: from [10.22.17.22] (unknown [10.22.17.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1651C1121319;
	Wed, 18 Oct 2023 19:18:53 +0000 (UTC)
Message-ID: <f8796057-e7f0-b589-783f-d11538aaafbf@redhat.com>
Date: Wed, 18 Oct 2023 15:18:52 -0400
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
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>
Cc: Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20231013181122.3518610-1-longman@redhat.com>
 <20231013181122.3518610-2-longman@redhat.com>
 <ZS-kTXgSZoc985ul@slm.duckdns.org>
 <4e9cc6e3-7582-64af-76d7-6f9f72779146@redhat.com>
In-Reply-To: <4e9cc6e3-7582-64af-76d7-6f9f72779146@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

On 10/18/23 09:41, Waiman Long wrote:
> On 10/18/23 05:24, Tejun Heo wrote:
>> Hello,
>>
>> On Fri, Oct 13, 2023 at 02:11:19PM -0400, Waiman Long wrote:
>>> When the "isolcpus" boot command line option is used to add a set
>>> of isolated CPUs, those CPUs will be excluded automatically from
>>> wq_unbound_cpumask to avoid running work functions from unbound
>>> workqueues.
>>>
>>> Recently cpuset has been extended to allow the creation of partitions
>>> of isolated CPUs dynamically. To make it closer to the "isolcpus"
>>> in functionality, the CPUs in those isolated cpuset partitions 
>>> should be
>>> excluded from wq_unbound_cpumask as well. This can be done currently by
>>> explicitly writing to the workqueue's cpumask sysfs file after creating
>>> the isolated partitions. However, this process can be error prone.
>>> Ideally, the cpuset code should be allowed to request the workqueue 
>>> code
>>> to exclude those isolated CPUs from wq_unbound_cpumask so that this
>>> operation can be done automatically and the isolated CPUs will be 
>>> returned
>>> back to wq_unbound_cpumask after the destructions of the isolated
>>> cpuset partitions.
>>>
>>> This patch adds a new workqueue_unbound_exclude_cpumask() to enable
>>> that. This new function will exclude the specified isolated CPUs
>>> from wq_unbound_cpumask. To be able to restore those isolated CPUs
>>> back after the destruction of isolated cpuset partitions, a new
>>> wq_user_unbound_cpumask is added to store the user provided unbound
>>> cpumask either from the boot command line options or from writing to
>>> the cpumask sysfs file. This new cpumask provides the basis for CPU
>>> exclusion.
>> The behaviors around wq_unbound_cpumask is getting pretty inconsistent:
>>
>> 1. Housekeeping excludes isolated CPUs on boot but allows user to 
>> override
>>     it to include isolated CPUs afterwards.
>>
>> 2. If an unbound wq's cpumask doesn't have any intersection with
>>     wq_unbound_cpumask we ignore the per-wq cpumask and falls back to
>>     wq_unbound_cpumask.
>>
>> 3. You're adding a masking layer on top with exclude which fails to 
>> set if
>>     the intersection is empty.
>>
>> Can we do the followings for consistency?
>>
>> 1. User's requested_unbound_cpumask is stored separately (as in this 
>> patch).
>>
>> 2. The effect wq_unbound_cpumask is determined by 
>> requested_unbound_cpumask
>>     & housekeeping_cpumask & cpuset_allowed_cpumask. The operation order
>>     matters. When an & operation yields an cpumask, the cpumask from the
>>     previous step is the effective one.
> Sure. I will do that.

I have a second thought after taking a further look at that. First of 
all, cpuset_allowed_mask isn't relevant here and the mask can certainly 
contain offline CPUs. So cpu_possible_mask is the proper fallback.

With the current patch, wq_user_unbound_cpumask is set up initially as  
(HK_TYPE_WQ ∩ HK_TYPE_DOMAIN) house keeping mask and rewritten by any 
subsequent write to workqueue/cpumask sysfs file. So using 
wq_user_unbound_cpumask has the implied precedence of user-sysfs written 
mask, command line isolcpus or nohz_full option mask and 
cpu_possible_mask. I think just fall back to wq_user_unbound_cpumask if 
the operation fails should be enough.

Cheers,
Longman



