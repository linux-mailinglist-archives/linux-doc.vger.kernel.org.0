Return-Path: <linux-doc+bounces-21708-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBDE9423A5
	for <lists+linux-doc@lfdr.de>; Wed, 31 Jul 2024 02:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6CADB23F12
	for <lists+linux-doc@lfdr.de>; Wed, 31 Jul 2024 00:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035D33C482;
	Wed, 31 Jul 2024 00:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AiDr/d8d"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B80FBF6
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 00:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722384043; cv=none; b=QzZrd9adCtGSAoyL8kyDlaIOaEGlC3AtBC+s995xInjCHsy9ZlyHNAeckTmD77GU4pyVYbviOCiro5LRDTc0LPoPBGwoFSfqYZMZPVUzLREHNT9RLOsTHheRrTKaKHyJJVg3QogU6V9e8Ib4rnjxFqHjznXuP8gIVH+xJVqFziU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722384043; c=relaxed/simple;
	bh=dPtgxEF39y7tufQdF+g0puYtqRlVBHzeN+kaxzB5Bdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uo2AlxGS8VyO+zJCrGu0GKBY/eYDDYAkxLvRSekBaysZ1HlY+RM8QCdbiUd7uiE7QZLeudcyFgYSUbZd4KwbhH10DEluNW6FC50odZtUbfUbI+kA4zTMqEtqd+jPRG4NN3hygF3otgIUrG2pEQtDGomIl6Mi7e/jjgPEAfDIVKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AiDr/d8d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722384040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DqY5AwvBWg4EHFX8v7m/gB2IpLCYEyw1Y9QmtLSSf7M=;
	b=AiDr/d8de7dUI4q0PshglFBG0QCAIjqFcnfgY1LqXrSpLfHdhxFZdKWPSdCogGN+S2tqQT
	RxYzQYsnMNKqW6hi5ArhbhvfjKyM44K8wpdMWT5mvK2WQvG/h6rkbRmnYvdLGe+ON2m9IP
	Ok7L7aWoruI6wmardgXpI2q6KLcio0A=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-x-8CEpv0MEuYKfg9aXRM7w-1; Tue,
 30 Jul 2024 20:00:34 -0400
X-MC-Unique: x-8CEpv0MEuYKfg9aXRM7w-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E4841955D48;
	Wed, 31 Jul 2024 00:00:28 +0000 (UTC)
Received: from [10.22.16.52] (unknown [10.22.16.52])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80331300018D;
	Wed, 31 Jul 2024 00:00:25 +0000 (UTC)
Message-ID: <5ea8f4f4-14f7-4df2-b0a2-cae5d6697dc6@redhat.com>
Date: Tue, 30 Jul 2024 20:00:24 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-cgroup v7] cgroup: Show # of subsystem CSSes in
 cgroup.stat
To: Tejun Heo <tj@kernel.org>
Cc: Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Kamalesh Babulal <kamalesh.babulal@oracle.com>
References: <20240715150034.2583772-1-longman@redhat.com>
 <ZpVcxlx1VR3FaoYI@google.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZpVcxlx1VR3FaoYI@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4


On 7/15/24 13:30, Roman Gushchin wrote:
> On Mon, Jul 15, 2024 at 11:00:34AM -0400, Waiman Long wrote:
>> Cgroup subsystem state (CSS) is an abstraction in the cgroup layer to
>> help manage different structures in various cgroup subsystems by being
>> an embedded element inside a larger structure like cpuset or mem_cgroup.
>>
>> The /proc/cgroups file shows the number of cgroups for each of the
>> subsystems.  With cgroup v1, the number of CSSes is the same as the
>> number of cgroups.  That is not the case anymore with cgroup v2. The
>> /proc/cgroups file cannot show the actual number of CSSes for the
>> subsystems that are bound to cgroup v2.
>>
>> So if a v2 cgroup subsystem is leaking cgroups (usually memory cgroup),
>> we can't tell by looking at /proc/cgroups which cgroup subsystems may
>> be responsible.
>>
>> As cgroup v2 had deprecated the use of /proc/cgroups, the hierarchical
>> cgroup.stat file is now being extended to show the number of live and
>> dying CSSes associated with all the non-inhibited cgroup subsystems that
>> have been bound to cgroup v2. The number includes CSSes in the current
>> cgroup as well as in all the descendants underneath it.  This will help
>> us pinpoint which subsystems are responsible for the increasing number
>> of dying (nr_dying_descendants) cgroups.
>>
>> The CSSes dying counts are stored in the cgroup structure itself
>> instead of inside the CSS as suggested by Johannes. This will allow
>> us to accurately track dying counts of cgroup subsystems that have
>> recently been disabled in a cgroup. It is now possible that a zero
>> subsystem number is coupled with a non-zero dying subsystem number.
>>
>> The cgroup-v2.rst file is updated to discuss this new behavior.
>>
>> With this patch applied, a sample output from root cgroup.stat file
>> was shown below.
>>
>> 	nr_descendants 56
>> 	nr_subsys_cpuset 1
>> 	nr_subsys_cpu 43
>> 	nr_subsys_io 43
>> 	nr_subsys_memory 56
>> 	nr_subsys_perf_event 57
>> 	nr_subsys_hugetlb 1
>> 	nr_subsys_pids 56
>> 	nr_subsys_rdma 1
>> 	nr_subsys_misc 1
>> 	nr_dying_descendants 30
>> 	nr_dying_subsys_cpuset 0
>> 	nr_dying_subsys_cpu 0
>> 	nr_dying_subsys_io 0
>> 	nr_dying_subsys_memory 30
>> 	nr_dying_subsys_perf_event 0
>> 	nr_dying_subsys_hugetlb 0
>> 	nr_dying_subsys_pids 0
>> 	nr_dying_subsys_rdma 0
>> 	nr_dying_subsys_misc 0
>>
>> Another sample output from system.slice/cgroup.stat was:
>>
>> 	nr_descendants 34
>> 	nr_subsys_cpuset 0
>> 	nr_subsys_cpu 32
>> 	nr_subsys_io 32
>> 	nr_subsys_memory 34
>> 	nr_subsys_perf_event 35
>> 	nr_subsys_hugetlb 0
>> 	nr_subsys_pids 34
>> 	nr_subsys_rdma 0
>> 	nr_subsys_misc 0
>> 	nr_dying_descendants 30
>> 	nr_dying_subsys_cpuset 0
>> 	nr_dying_subsys_cpu 0
>> 	nr_dying_subsys_io 0
>> 	nr_dying_subsys_memory 30
>> 	nr_dying_subsys_perf_event 0
>> 	nr_dying_subsys_hugetlb 0
>> 	nr_dying_subsys_pids 0
>> 	nr_dying_subsys_rdma 0
>> 	nr_dying_subsys_misc 0
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Tejun, is this patch ready to be merged or do you have other suggestion 
you have in mind?

Thanks,
Longman


