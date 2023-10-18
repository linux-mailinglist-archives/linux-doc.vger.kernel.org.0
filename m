Return-Path: <linux-doc+bounces-559-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250797CE650
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 20:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4891281E30
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 18:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D22743A9D;
	Wed, 18 Oct 2023 18:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNuRZFbq"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990943A98
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 18:24:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F43EF7
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697653444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CIWHA5EsQxn8oXTAVVO/hzlkn7yk8ivfF/yUbUaA+e4=;
	b=UNuRZFbqo1dXVxygD8UFNbihxiVLoAk1lHxn918M8hSei85br13Kodv948f85kbLw45mLe
	PVhxbCRETeV4LV7QbuDeT+VzWB4+jXWi+9a+otL9JtviszGQYTrAwkBUL22yFbRnhGZEgY
	EaKzxZYD8qPMqVrneQWLk8Q9QSSiQIQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-V6m3BlN7NjGuLYj_jCbQKg-1; Wed, 18 Oct 2023 14:24:02 -0400
X-MC-Unique: V6m3BlN7NjGuLYj_jCbQKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 199A0857D0C;
	Wed, 18 Oct 2023 18:24:01 +0000 (UTC)
Received: from [10.22.17.22] (unknown [10.22.17.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F7872166B26;
	Wed, 18 Oct 2023 18:24:00 +0000 (UTC)
Message-ID: <59448803-ac86-0762-d828-c3eba431ceb4@redhat.com>
Date: Wed, 18 Oct 2023 14:24:00 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH-cgroup 3/4] cgroup/cpuset: Keep track of CPUs in isolated
 partitions
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>
Cc: Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20231013181122.3518610-1-longman@redhat.com>
 <20231013181122.3518610-4-longman@redhat.com>
 <ZS-kt6X5Dd1lktAw@slm.duckdns.org>
 <9e2772e3-f615-5e80-6922-5a2dd06a8b07@redhat.com>
 <ZTAfM0msp8Cg-qLy@slm.duckdns.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZTAfM0msp8Cg-qLy@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/18/23 14:08, Tejun Heo wrote:
> On Wed, Oct 18, 2023 at 09:30:04AM -0400, Waiman Long wrote:
>> On 10/18/23 05:26, Tejun Heo wrote:
>>> On Fri, Oct 13, 2023 at 02:11:21PM -0400, Waiman Long wrote:
>>> ...
>>>> @@ -3875,6 +3931,13 @@ static struct cftype dfl_files[] = {
>>>>    		.flags = CFTYPE_ONLY_ON_ROOT | CFTYPE_DEBUG,
>>>>    	},
>>>> +	{
>>>> +		.name = "cpus.isolated",
>>>> +		.seq_show = cpuset_common_seq_show,
>>>> +		.private = FILE_ISOLATED_CPULIST,
>>>> +		.flags = CFTYPE_ONLY_ON_ROOT | CFTYPE_DEBUG,
>>>> +	},
>>> I'd much rather show this in a wq sysfs file along with other related masks,
>>> and not in a DEBUG file.
>> It can certainly be exposed as a permanent addition to the cgroup control
>> files instead of a debug only file. However this set of isolated CPUs may be
>> used by others not just by workqueue. So I doubt if it should be a sysfs
>> file in the workqueue directory. I can see if it is possible to put a
>> symlink there point back to the cgroupfs.
> I don't know whether it will happen but let's say there will be three
> subsystems which call into workqueue for this. Wouldn't it be better to have
> all of them in workqueue sysfs using a consistent naming scheme? What does
> putting it in cgroupfs buy us?

If you mean saving the exclusion cpumask no matter who the caller is, we 
can add another exclusion cpumask to save it and expose it to sysfs. 
This should be done in the first workqueue patch, not as part of this 
patch. I expose this isolated cpumask for testing purpose to be checked 
by the test_cpuset_prs.sh script for correctness. As said, I can expose 
it without cgroup_debug if you think the information is useful in general.

Cheers,
Longman


