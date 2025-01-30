Return-Path: <linux-doc+bounces-36486-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF394A23500
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 21:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A8931887F53
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 20:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E35D1F0E49;
	Thu, 30 Jan 2025 20:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="yVJ5D56e"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310B81EF09C
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 20:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738268399; cv=none; b=FccT85saT5zzEq+8DZnuE3yaU4+2XLwoNn9+M7QalkxPo9wB4TNL+EJjmjnSqgttb09glRLJbr37y2qMyWTWL9oFdoq44h9mESLOKJI35BNSpDrM/dGvQL+e9mlyQuO/HZcNoveuxifCL7cRamYd8rJ+uky9MO60c/ba8s/oIqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738268399; c=relaxed/simple;
	bh=dh+YK0XtVTC60LSRwsJYkEJFptTxFWBu/84xF34W6iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYdKDx6Cq22yC1w6LY232bSXOsjQDWKRoq86AtQJ+f4YYVFRn6zhN2eInh/rs+jYQjkNq6ATO317OxrJpfUW+eYEWw/bbNkCwx2PTsh3RZVil9pFD4qaKgyA6qYhUtwSPK1Qm7FHkPrZ4+ktPnJye4CxqDSwj3RuRyhjmHJprIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=yVJ5D56e; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7be49f6b331so119889285a.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 12:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1738268395; x=1738873195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z51AAJ9zLJofEtdedIFqQZN9K/yyiAQiMmQX40ASiiE=;
        b=yVJ5D56eDuNCIIeDfx4E2S4KJwxgzAdy0xaw2Z35gsWTTs2Zl2qIFBg+I7lb6yCLzc
         EaGUftEbsx2hc3Pw/sKiAMmire6vab/IwNBKxn6dgPpEc6qBxMhksM86Fd4xBksjrC5A
         qpajS+G1fpnE5Y2eBGraK8CFa/a6qm5K/5xVNQ0C7+pi7LGm2m1+DCu/YjOnTSkeL1Y5
         ITzb5t7H0OC5bz9njHuVTg0k6LCchfO8pA/ENJf1QIpozYKCAG7WS6RcHLIg8S+jjMOd
         a9mrVjKyeTs2aH66FkksyZ6u6ACwCUB5BoBU3wFrmcO4EM88ABmuRlnwtnEtSwG0YTm9
         AHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738268395; x=1738873195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z51AAJ9zLJofEtdedIFqQZN9K/yyiAQiMmQX40ASiiE=;
        b=bH043UHHPymgpA+rtQ6dUvKzsGJRE8fASkc1mBzuTCqrGSICiPOMuc/8JL8WiX0wdT
         +ERb9QPdQrfDDDeSfNbf2D3RaUh5WTtpcq/ylZWOoE8SZSB00QwKbJI+FF9IO5nT/3PJ
         EPgEFuniUZyqKElc2TcWHIhxELha4HMNVkh/cgQo0LuwyrrGwAmiHLCFq8/qY48f+ykm
         NOmvtpuct95NqeHZVEg11JppV8KxLbJTHTMbNWUxWwNLQ/GzfOxJ2WIH3ypo9T/nVmuf
         amTmExlOrv2uiCTw52mKP7soY9DYl10VJF7lHzSJbXX5Gr5OdsdiDZ/HRFgc9kTQEJ2m
         fm0g==
X-Forwarded-Encrypted: i=1; AJvYcCV+JQSmvSdheQKgtjjyxbVDsvOoRQUqKnfxxDEktRTzUisXVmCrgqiUd2MTjbGTKNt5xytuosKPG8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGyFgkQAZ7XvP2xivadpcx9yF8E4YoIASjmPMgq1DN81CN0atu
	7f8WaV/ESPMRJfXlUEuKI9CQOJFZ+MEFjitm4QmY3j2XIKLeeevxe3EyzeOTFPA=
X-Gm-Gg: ASbGncvOOQZv1u5O7xm8UhM4HzMeU7XBSgZxyTd50SfkfTyjyIwz1H2kE7ez+uc3RSM
	vEbtrSfAJ6XJpZqhNJSb0M48+vELZEsUqffR7dox/7QDId/9s1pSzi8Whh4bK9UriMbIPvQ69HH
	v9jYwLmBSvE660DZypuLobbT/n1Bnm3BLx4Q+sRP1aIJxZHijgS4rwvXlLXwdUAEZReGa4Q5eAW
	na+BG5IwrtYZCZeN3gAgu35yrE4c2t3G9zzHHQjzL/rQsI/GpHhJzLE21+ypN81E/5zLK5DBXTL
	uoihhXxWUm9tdw==
X-Google-Smtp-Source: AGHT+IHG1JSOh0nlUVEK+WfyizNl08mq/IVx9s0pot0IjDtoSwn6IimZwwRkGUrT/Jjf7Q98QZJwgA==
X-Received: by 2002:a05:620a:4051:b0:7bc:db11:495b with SMTP id af79cd13be357-7bffcd9d350mr1321689885a.50.1738268394707;
        Thu, 30 Jan 2025 12:19:54 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:cbb0:8ad0:a429:60f5])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-46fdf173efbsm10153071cf.61.2025.01.30.12.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 12:19:54 -0800 (PST)
Date: Thu, 30 Jan 2025 15:19:45 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Waiman Long <llong@redhat.com>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Peter Hunt <pehunt@redhat.com>
Subject: Re: [RFC PATCH] mm, memcg: introduce memory.high.throttle
Message-ID: <20250130201945.GA13575@cmpxchg.org>
References: <20250129191204.368199-1-longman@redhat.com>
 <Z5qLQ1o6cXbcvc0o@google.com>
 <366fd30f-033d-48d6-92b4-ac67c44d0d9b@redhat.com>
 <20250130163904.GB1283@cmpxchg.org>
 <baf1f9bf-4226-47f5-b795-c8862fd0554f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baf1f9bf-4226-47f5-b795-c8862fd0554f@redhat.com>

On Thu, Jan 30, 2025 at 12:07:31PM -0500, Waiman Long wrote:
> On 1/30/25 11:39 AM, Johannes Weiner wrote:
> > On Thu, Jan 30, 2025 at 09:52:29AM -0500, Waiman Long wrote:
> >> On 1/29/25 3:10 PM, Yosry Ahmed wrote:
> >>> On Wed, Jan 29, 2025 at 02:12:04PM -0500, Waiman Long wrote:
> >>>> Since commit 0e4b01df8659 ("mm, memcg: throttle allocators when failing
> >>>> reclaim over memory.high"), the amount of allocator throttling had
> >>>> increased substantially. As a result, it could be difficult for a
> >>>> misbehaving application that consumes increasing amount of memory from
> >>>> being OOM-killed if memory.high is set. Instead, the application may
> >>>> just be crawling along holding close to the allowed memory.high memory
> >>>> for the current memory cgroup for a very long time especially those
> >>>> that do a lot of memcg charging and uncharging operations.
> >>>>
> >>>> This behavior makes the upstream Kubernetes community hesitate to
> >>>> use memory.high. Instead, they use only memory.max for memory control
> >>>> similar to what is being done for cgroup v1 [1].
> >>>>
> >>>> To allow better control of the amount of throttling and hence the
> >>>> speed that a misbehving task can be OOM killed, a new single-value
> >>>> memory.high.throttle control file is now added. The allowable range
> >>>> is 0-32.  By default, it has a value of 0 which means maximum throttling
> >>>> like before. Any non-zero positive value represents the corresponding
> >>>> power of 2 reduction of throttling and makes OOM kills easier to happen.
> >>>>
> >>>> System administrators can now use this parameter to determine how easy
> >>>> they want OOM kills to happen for applications that tend to consume
> >>>> a lot of memory without the need to run a special userspace memory
> >>>> management tool to monitor memory consumption when memory.high is set.
> >>>>
> >>>> Below are the test results of a simple program showing how different
> >>>> values of memory.high.throttle can affect its run time (in secs) until
> >>>> it gets OOM killed. This test program allocates pages from kernel
> >>>> continuously. There are some run-to-run variations and the results
> >>>> are just one possible set of samples.
> >>>>
> >>>>     # systemd-run -p MemoryHigh=10M -p MemoryMax=20M -p MemorySwapMax=10M \
> >>>> 	--wait -t timeout 300 /tmp/mmap-oom
> >>>>
> >>>>     memory.high.throttle	service runtime
> >>>>     --------------------	---------------
> >>>>               0		    120.521
> >>>>               1		    103.376
> >>>>               2		     85.881
> >>>>               3		     69.698
> >>>>               4		     42.668
> >>>>               5		     45.782
> >>>>               6		     22.179
> >>>>               7		      9.909
> >>>>               8		      5.347
> >>>>               9		      3.100
> >>>>              10		      1.757
> >>>>              11		      1.084
> >>>>              12		      0.919
> >>>>              13		      0.650
> >>>>              14		      0.650
> >>>>              15		      0.655
> >>>>
> >>>> [1] https://docs.google.com/document/d/1mY0MTT34P-Eyv5G1t_Pqs4OWyIH-cg9caRKWmqYlSbI/edit?tab=t.0
> >>>>
> >>>> Signed-off-by: Waiman Long <longman@redhat.com>
> >>>> ---
> >>>>    Documentation/admin-guide/cgroup-v2.rst | 16 ++++++++--
> >>>>    include/linux/memcontrol.h              |  2 ++
> >>>>    mm/memcontrol.c                         | 41 +++++++++++++++++++++++++
> >>>>    3 files changed, 57 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> >>>> index cb1b4e759b7e..df9410ad8b3b 100644
> >>>> --- a/Documentation/admin-guide/cgroup-v2.rst
> >>>> +++ b/Documentation/admin-guide/cgroup-v2.rst
> >>>> @@ -1291,8 +1291,20 @@ PAGE_SIZE multiple when read back.
> >>>>    	Going over the high limit never invokes the OOM killer and
> >>>>    	under extreme conditions the limit may be breached. The high
> >>>>    	limit should be used in scenarios where an external process
> >>>> -	monitors the limited cgroup to alleviate heavy reclaim
> >>>> -	pressure.
> >>>> +	monitors the limited cgroup to alleviate heavy reclaim pressure
> >>>> +	unless a high enough value is set in "memory.high.throttle".
> >>>> +
> >>>> +  memory.high.throttle
> >>>> +	A read-write single value file which exists on non-root
> >>>> +	cgroups.  The default is 0.
> >>>> +
> >>>> +	Memory usage throttle control.	This value controls the amount
> >>>> +	of throttling that will be applied when memory consumption
> >>>> +	exceeds the "memory.high" limit.  The larger the value is,
> >>>> +	the smaller the amount of throttling will be and the easier an
> >>>> +	offending application may get OOM killed.
> >>> memory.high is supposed to never invoke the OOM killer (see above). It's
> >>> unclear to me if you are referring to OOM kills from the kernel or
> >>> userspace in the commit message. If the latter, I think it shouldn't be
> >>> in kernel docs.
> >> I am sorry for not being clear. What I meant is that if an application
> >> is consuming more memory than what can be recovered by memory reclaim,
> >> it will reach memory.max faster, if set, and get OOM killed. Will
> >> clarify that in the next version.
> > You're not really supposed to use max and high in conjunction. One is
> > for kernel OOM killing, the other for userspace OOM killing. That's tho
> > what the documentation that you edited is trying to explain.
> >
> > What's the usecase you have in mind?
> 
> That is new to me that high and max are not supposed to be used 
> together. One problem with v1 is that by the time the limit is reached 
> and memory reclaim is not able to recover enough memory in time, the 
> task will be OOM killed. I always thought that by setting high to a bit 
> below max, say 90%, early memory reclaim will reduce the chance of OOM 
> kills. There are certainly others that think like that.

I can't fault you or them for this, because this was the original plan
for these knobs. However, this didn't end up working in practice.

If you have a non-throttling, non-killing limit, then reclaim will
either work and keep the workload to that limit; or it won't work, and
the workload escapes to the hard limit and gets killed.

You'll notice you get the same behavior with just memory.max set by
itself - either reclaim can keep up, or OOM is triggered.

> So the use case here is to reduce the chance of OOM kills without 
> letting really mishaving tasks from holding up useful memory for too long.

That brings us to the idea of a medium amount of throttling.

The premise would be that, by throttling *to a certain degree*, you
can slow the workload down just enough to tide over the pressure peak
and avert the OOM kill.

This assumes that some tasks inside the cgroup can independently make
forward progress and release memory, while allocating tasks inside the
group are already throttled.

[ Keep in mind, it's a cgroup-internal limit, so no memory freeing
  outside of the group can alleviate the situation. Progress must
  happen from within the cgroup. ]

But this sort of parallelism in a pressured cgroup is unlikely in
practice. By the time reclaim fails, usually *every task* in the
cgroup ends up having to allocate. Because they lose executables to
cache reclaim, or heap memory to swap etc, and then page fault.

We found that more often than not, it just deteriorates into a single
sequence of events. Slowing it down just drags out the inevitable.

As a result we eventually moved away from the idea of gradual
throttling. The last remnants of this idea finally disappeared from
the docs last year (commit 5647e53f7856bb39dae781fe26aa65a699e2fc9f).

memory.high now effectively puts the cgroup to sleep when reclaim
fails (similar to oom killer disabling in v1, but without the caveats
of that implementation). This is useful to let userspace implement
custom OOM killing policies.

