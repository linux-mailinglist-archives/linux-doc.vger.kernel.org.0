Return-Path: <linux-doc+bounces-36465-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BAAA23220
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 17:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 544EB7A2B84
	for <lists+linux-doc@lfdr.de>; Thu, 30 Jan 2025 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E831E286A1;
	Thu, 30 Jan 2025 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="ThGiZdiB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF281DA5F
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738255152; cv=none; b=tKSrsZnE8f1nvHXgOJwjnBZXVXArbMWgxvitvrhHDy+uYbw+wT6spmCpQPXiCiayLTju4zaFyhhrsNJsbRPUUzEYqAnW9CIcYGgrhqxJBbIaC0ZN3DP2VhzULjog+p+JQIEIzNZiM596N9JjlBaFgtoOSY+mnihGuZEgXT1iUZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738255152; c=relaxed/simple;
	bh=a0SY6nA/mLvfu28CYEQk6nh2OCaBQfg8ugVjQnj+5+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOCyEf4+dUZfUDG+c+n7cpfDy7BtOlgHt87Vf1LqPtDhmm/dtrP6hv+pIPMpvWUys12bO6gB5YLvfFbG8gZUseDBGuB5PDVm+TlgrkV+Fo7cFUKyuhO/xYJENlrn03Q04XDyG8gN0RnaT6Ek45HzH4SqFa4qmdaaNBg6k56uHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=ThGiZdiB; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4679eacf25cso6463241cf.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 08:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1738255149; x=1738859949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7gR+gcJSWzW3+W+SZ93l8bt249cUBhXPQQlRF6rreno=;
        b=ThGiZdiBXZWnn8L1f4Q41d14chOnRM9nKQG+NdM0VSMmEvuQqaxEoJXgKUGQ6mTmZW
         4Zn0sIWGXDmAx5QeognLBjbRL6AMBLkvPxrDj1SZO2Y0Z/UbwY0ZcySFVBsgsNwfY8vk
         68TrTXHRxDXWGccVcfvIty8EmMCbbNjTDt/60s6Ptc3Q/jU/6rQh/2YCAslnftyVk708
         pdNqQf4Xh3nIj5Yv0kBwbJyUWBkOX9RtRY56nwsZNYW2PFNGwcz9RSpnRF02ELtO/BIk
         9Sn1x/AyoUgrS3XuJUfx6RZrZlBKRSf7HVkS8Gy5KIpYJ+9ju+mIY4NSLu+2zYJeGfCq
         dE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738255149; x=1738859949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gR+gcJSWzW3+W+SZ93l8bt249cUBhXPQQlRF6rreno=;
        b=bL90and3ny/47aNNst8ZCA2MQPkeAO46jQlSTYJuF/vV98QJEwZrsDYR0Wv0TSTksg
         xHNeRv48ZPyeYmqG5m2qiFFiepncRXZa2ZxGWXbHOBvW7s/GSDwu0VxIiXVQgdXsJ8k8
         EE0Q3ZM7n/s0v4WRSF9U6rCBCFoQtxMID3TAXk/STfiKAjPXomUMzWvGhVdQSbwgL8RE
         NcIAB1nKrq+sXrb6668HODqEIISZiSd2Fm4k2XfkQDZusnsFx3W1gjxn1uRvlUfegIOV
         Y03FE84BSdaa0G5OC0mpWOP2xGtky7WuGIQGtFgTXqJTy0vB3zME0b7+QUA0mEeKRWbC
         jo7A==
X-Forwarded-Encrypted: i=1; AJvYcCUr4tkUTpMQ6q50Hvep+t6juzrHJ5gAumcXTNzMKw/cdHzCxoTtRF9pztnWylpcnwH5CaMw/oWKnAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPxSP+zNoApn5ECf+Bmvd0TUVPyjDbT6VIC4icab2Yc3GTTVK
	DBWndCtSPyYV0ckvsnToYmghz32sNNIYPLoj/OTpE+TZByjBppu70vtB+bg2CrU=
X-Gm-Gg: ASbGncupk6sRboeMingxlheXrL7ARggs/C1ayu1lIFy6BEgSfl+13RF4sQq/KftDZzG
	lWpis6oKOS1cWOA3O7s+xbLuvxxQebByyleq5GX31/oZ/gv4Smk28mhHeOxj3ySrKvnD8CLtfEi
	6b6AAGidR+FwymEKXPe55PkA828UVwAcR5TU8jWlY61tB2PUvSiXnVG+6RQiPkWpMuoZ3H6qTWz
	qNJz/8xVi7BgI4EOiDunm4+KiODfu3q56/AEUi2nJcwss65a0b21WYjO1e79i8Nyi5v5gROjKWX
	O+zqvPhN3pmTAg==
X-Google-Smtp-Source: AGHT+IE9KPA5TooWOZcBOZ0Xae3DccM5mp1lvWQdBW03p7wzyAMbVCFPD0/VLHlLtVUiEH09HiZAWA==
X-Received: by 2002:ac8:59d0:0:b0:467:76cc:622d with SMTP id d75a77b69052e-46fd0a13014mr119399411cf.11.1738255149014;
        Thu, 30 Jan 2025 08:39:09 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:cbb0:8ad0:a429:60f5])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-46fdf0a753csm8456831cf.11.2025.01.30.08.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:39:08 -0800 (PST)
Date: Thu, 30 Jan 2025 11:39:04 -0500
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
Message-ID: <20250130163904.GB1283@cmpxchg.org>
References: <20250129191204.368199-1-longman@redhat.com>
 <Z5qLQ1o6cXbcvc0o@google.com>
 <366fd30f-033d-48d6-92b4-ac67c44d0d9b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <366fd30f-033d-48d6-92b4-ac67c44d0d9b@redhat.com>

On Thu, Jan 30, 2025 at 09:52:29AM -0500, Waiman Long wrote:
> On 1/29/25 3:10 PM, Yosry Ahmed wrote:
> > On Wed, Jan 29, 2025 at 02:12:04PM -0500, Waiman Long wrote:
> >> Since commit 0e4b01df8659 ("mm, memcg: throttle allocators when failing
> >> reclaim over memory.high"), the amount of allocator throttling had
> >> increased substantially. As a result, it could be difficult for a
> >> misbehaving application that consumes increasing amount of memory from
> >> being OOM-killed if memory.high is set. Instead, the application may
> >> just be crawling along holding close to the allowed memory.high memory
> >> for the current memory cgroup for a very long time especially those
> >> that do a lot of memcg charging and uncharging operations.
> >>
> >> This behavior makes the upstream Kubernetes community hesitate to
> >> use memory.high. Instead, they use only memory.max for memory control
> >> similar to what is being done for cgroup v1 [1].
> >>
> >> To allow better control of the amount of throttling and hence the
> >> speed that a misbehving task can be OOM killed, a new single-value
> >> memory.high.throttle control file is now added. The allowable range
> >> is 0-32.  By default, it has a value of 0 which means maximum throttling
> >> like before. Any non-zero positive value represents the corresponding
> >> power of 2 reduction of throttling and makes OOM kills easier to happen.
> >>
> >> System administrators can now use this parameter to determine how easy
> >> they want OOM kills to happen for applications that tend to consume
> >> a lot of memory without the need to run a special userspace memory
> >> management tool to monitor memory consumption when memory.high is set.
> >>
> >> Below are the test results of a simple program showing how different
> >> values of memory.high.throttle can affect its run time (in secs) until
> >> it gets OOM killed. This test program allocates pages from kernel
> >> continuously. There are some run-to-run variations and the results
> >> are just one possible set of samples.
> >>
> >>    # systemd-run -p MemoryHigh=10M -p MemoryMax=20M -p MemorySwapMax=10M \
> >> 	--wait -t timeout 300 /tmp/mmap-oom
> >>
> >>    memory.high.throttle	service runtime
> >>    --------------------	---------------
> >>              0		    120.521
> >>              1		    103.376
> >>              2		     85.881
> >>              3		     69.698
> >>              4		     42.668
> >>              5		     45.782
> >>              6		     22.179
> >>              7		      9.909
> >>              8		      5.347
> >>              9		      3.100
> >>             10		      1.757
> >>             11		      1.084
> >>             12		      0.919
> >>             13		      0.650
> >>             14		      0.650
> >>             15		      0.655
> >>
> >> [1] https://docs.google.com/document/d/1mY0MTT34P-Eyv5G1t_Pqs4OWyIH-cg9caRKWmqYlSbI/edit?tab=t.0
> >>
> >> Signed-off-by: Waiman Long <longman@redhat.com>
> >> ---
> >>   Documentation/admin-guide/cgroup-v2.rst | 16 ++++++++--
> >>   include/linux/memcontrol.h              |  2 ++
> >>   mm/memcontrol.c                         | 41 +++++++++++++++++++++++++
> >>   3 files changed, 57 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> >> index cb1b4e759b7e..df9410ad8b3b 100644
> >> --- a/Documentation/admin-guide/cgroup-v2.rst
> >> +++ b/Documentation/admin-guide/cgroup-v2.rst
> >> @@ -1291,8 +1291,20 @@ PAGE_SIZE multiple when read back.
> >>   	Going over the high limit never invokes the OOM killer and
> >>   	under extreme conditions the limit may be breached. The high
> >>   	limit should be used in scenarios where an external process
> >> -	monitors the limited cgroup to alleviate heavy reclaim
> >> -	pressure.
> >> +	monitors the limited cgroup to alleviate heavy reclaim pressure
> >> +	unless a high enough value is set in "memory.high.throttle".
> >> +
> >> +  memory.high.throttle
> >> +	A read-write single value file which exists on non-root
> >> +	cgroups.  The default is 0.
> >> +
> >> +	Memory usage throttle control.	This value controls the amount
> >> +	of throttling that will be applied when memory consumption
> >> +	exceeds the "memory.high" limit.  The larger the value is,
> >> +	the smaller the amount of throttling will be and the easier an
> >> +	offending application may get OOM killed.
> > memory.high is supposed to never invoke the OOM killer (see above). It's
> > unclear to me if you are referring to OOM kills from the kernel or
> > userspace in the commit message. If the latter, I think it shouldn't be
> > in kernel docs.
> 
> I am sorry for not being clear. What I meant is that if an application 
> is consuming more memory than what can be recovered by memory reclaim, 
> it will reach memory.max faster, if set, and get OOM killed. Will 
> clarify that in the next version.

You're not really supposed to use max and high in conjunction. One is
for kernel OOM killing, the other for userspace OOM killing. That's
what the documentation that you edited is trying to explain.

What's the usecase you have in mind?

