Return-Path: <linux-doc+bounces-20551-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E278B92F094
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 23:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 203D51C2287C
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 21:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B89116F0E7;
	Thu, 11 Jul 2024 21:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CWtrjAve"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A3C2836A
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720731654; cv=none; b=I0k9WId9nqu5PvnTsDA+Bq7jm/bJcCATlWqakfQrCUJsQ7NRFKBY97CSv/zu0TRhE+YxHU5nN+i3wVXIoBAFzlxMD/3a4sWO90YJUVFni4b9E3iwUInudjWMDODpyBL0qNQGzBk/+bgWWjHUZ74zYwVP8dd6GyzR2gclq+7ZG7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720731654; c=relaxed/simple;
	bh=xJC3q5B+KIdmgj2GicJ24IEhPqmpJfMZ6JvdQhrHz2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5x4mUvHekdovZ0uIjS3ykbwmCwXiVLtqo7iJ8YkXyjWlvE/msvPQ8BvjPFrtyKKxbqprZPbAweX4ByXetSNfBvZCUqlvmMRq5pBa4TuvJX5eU3HYQy+gHMwFMQMY00gh7ulvwHI5dh0g9U/LW2yYaLfAmS9O3MatFTp14tQIrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CWtrjAve; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720731651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uXzacATyJ7+hzQa34R1FMVM/asZbvciRl5Ud+bdS400=;
	b=CWtrjAveDUtvEJ/S74Ia2EQJFT3Hs3dnlDbOujcXYtzXpxaexVhDNhf5dxRCDbh7r8JjVJ
	kUem1slPKX4xexgAsg0tiVNqCHD8qZpsOeEeWRhCMyQ8l3pnIXuHc14B5JK4Q3ZKEug55A
	V2T1sGYdp/cEqnOnJmOGHTm3sCZFTXs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-YAmcdNS6MqSuZzLs16-iDw-1; Thu,
 11 Jul 2024 17:00:48 -0400
X-MC-Unique: YAmcdNS6MqSuZzLs16-iDw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 820121955F43;
	Thu, 11 Jul 2024 21:00:44 +0000 (UTC)
Received: from [10.22.64.119] (unknown [10.22.64.119])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A0FED1955F40;
	Thu, 11 Jul 2024 21:00:42 +0000 (UTC)
Message-ID: <e42f41af-e8a9-4544-9194-003d6b0f0ba8@redhat.com>
Date: Thu, 11 Jul 2024 17:00:41 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] cgroup: Show # of subsystem CSSes in cgroup.stat
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh.babulal@oracle.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
References: <20240710182353.2312025-1-longman@redhat.com>
 <20240711134927.GB456706@cmpxchg.org>
 <4e1078d6-6970-4eea-8f73-56a3815794b5@redhat.com>
 <ZpAT_xu0oXjQsKM7@slm.duckdns.org>
 <76e70789-986a-44c2-bfdc-d636f425e5ae@redhat.com>
 <ZpAoD7_o8bf6yVGr@slm.duckdns.org>
 <e5348a85-22eb-48a6-876d-3180de5c7171@redhat.com>
 <ZpArhD49OonR6Oz6@slm.duckdns.org>
 <c54651db-1a06-49f6-aea7-02768ad70756@redhat.com>
 <20240711195946.GA1094169@cmpxchg.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20240711195946.GA1094169@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 7/11/24 15:59, Johannes Weiner wrote:
> On Thu, Jul 11, 2024 at 03:13:12PM -0400, Waiman Long wrote:
>> On 7/11/24 14:59, Tejun Heo wrote:
>>> On Thu, Jul 11, 2024 at 02:51:38PM -0400, Waiman Long wrote:
>>>> On 7/11/24 14:44, Tejun Heo wrote:
>>>>> Hello,
>>>>>
>>>>> On Thu, Jul 11, 2024 at 01:39:38PM -0400, Waiman Long wrote:
>>>>>> On 7/11/24 13:18, Tejun Heo wrote:
>>>>> ...
>>>>>> Currently, I use the for_each_css() macro for iteration. If you mean
>>>>>> displaying all the possible cgroup subsystems even if they are not enabled
>>>>>> for the current cgroup, I will have to manually do the iteration.
>>>>> Just wrapping it with for_each_subsys() should do, no? for_each_css() won't
>>>>> iterate anything if css doesn't exist for the cgroup.
>>>> OK, I wasn't sure if you were asking to list all the possible cgroup v2
>>>> cgroup subsystems even if they weren't enabled in the current cgroup.
>>>> Apparently, that is the case. I prefer it that way too.
>>> Yeah, I think listing all is better. If the list corresponded directly to
>>> cgroup.controllers, it may make sense to only show enabled ones but we can
>>> have dying ones and implicitly enabled memory and so on, so I think it'd be
>>> cleaner to just list them all.
>> That will means cgroup subsystems that are seldomly used like rdma, misc
>> or even hugetlb will always be shown in all the cgroup.stat output. I
>> actually prefer just showing those that are enabled. As for dying memory
>> cgroups, they will only be shown in its online ancestors. We currently
>> don't know how many level down are each of the dying ones.
> It seems odd to me to not show dead ones after a cgroup has disabled
> the controller again. They still consume memory, after all, and so
> continue to be property of that cgroup afterwards.
>
> Instead of doing for_each_css(), would it make more sense to have
>
> 	struct cgroup {
> 		...
> 		int nr_dying_subsys[CGROUP_SUBSYS_COUNT];

What exactly does new this array for? Is this for copying out 
css->nr_dying_descendants before disabling a controller? The number may 
be out of date when it is used. I would think we should store the actual 
css and clearing it again once the css is ready to be freed.

Anyway, I would suggest doing it as a separate add-on patch if we decide 
to do it instead of adding it to the current patch.

Cheers,
Longman


