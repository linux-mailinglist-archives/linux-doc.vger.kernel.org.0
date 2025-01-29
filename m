Return-Path: <linux-doc+bounces-36382-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F9A224FC
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 21:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D6CB167CA4
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 20:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EB31E1041;
	Wed, 29 Jan 2025 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hzuCrchv"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0401F29A2
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 20:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738181469; cv=none; b=FG8RaVTLO7FRyGu6i4jeFgCF3cl8vAq9kSmyHBo/ANXgL1Rd6qFFWvYy0RxSBElF9haBalotFXQ99VFsXY2uZwVoBIC37WG7Oaqt3XSfIjcdIax5/DACS4hbTiMIas15YehCfRq+Sd8UsdCNFSiujOLg6MFbqgHuowavrALhhMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738181469; c=relaxed/simple;
	bh=qNt6bQsNIb2gQr0qxtOMZ/hAFubrBQRY7x1CrC3ZEZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3Mad2wabeTckmSctWHCjS8+2d0zESt2RleQVSmYmmO0h/1+Va5zGacxAsaMGm4S30YIBkwj0s+oWAQGym3pD1cHH0Dj3IeGoyHG9Yp6UUiMqN8nufXdHpS+/GbJD7C7rwBZBmYJs8eSohoH82yHgNvOxM5kYk9nTPVlU6N4STY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hzuCrchv; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 29 Jan 2025 20:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738181449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g9umiVwN/QUCDpwaQnKZwQo14XSxl/jQYTb+ttIgz38=;
	b=hzuCrchvtEoRFZRyFd992iuNaXN+ag5yJpAWKcnin798f1GKnlI3goTV7zQJsUtnvA7mik
	tRxvC8pUYxS8UUigK/eFhI05eprDtavL0J699iVycyc5uL/+c5l17S6fLy/6z1RPQp9n3d
	Xic81VrZqXYUvBSykIhsMhlf1imf4WU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Peter Hunt <pehunt@redhat.com>
Subject: Re: [RFC PATCH] mm, memcg: introduce memory.high.throttle
Message-ID: <Z5qLQ1o6cXbcvc0o@google.com>
References: <20250129191204.368199-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129191204.368199-1-longman@redhat.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jan 29, 2025 at 02:12:04PM -0500, Waiman Long wrote:
> Since commit 0e4b01df8659 ("mm, memcg: throttle allocators when failing
> reclaim over memory.high"), the amount of allocator throttling had
> increased substantially. As a result, it could be difficult for a
> misbehaving application that consumes increasing amount of memory from
> being OOM-killed if memory.high is set. Instead, the application may
> just be crawling along holding close to the allowed memory.high memory
> for the current memory cgroup for a very long time especially those
> that do a lot of memcg charging and uncharging operations.
> 
> This behavior makes the upstream Kubernetes community hesitate to
> use memory.high. Instead, they use only memory.max for memory control
> similar to what is being done for cgroup v1 [1].
> 
> To allow better control of the amount of throttling and hence the
> speed that a misbehving task can be OOM killed, a new single-value
> memory.high.throttle control file is now added. The allowable range
> is 0-32.  By default, it has a value of 0 which means maximum throttling
> like before. Any non-zero positive value represents the corresponding
> power of 2 reduction of throttling and makes OOM kills easier to happen.
> 
> System administrators can now use this parameter to determine how easy
> they want OOM kills to happen for applications that tend to consume
> a lot of memory without the need to run a special userspace memory
> management tool to monitor memory consumption when memory.high is set.
> 
> Below are the test results of a simple program showing how different
> values of memory.high.throttle can affect its run time (in secs) until
> it gets OOM killed. This test program allocates pages from kernel
> continuously. There are some run-to-run variations and the results
> are just one possible set of samples.
> 
>   # systemd-run -p MemoryHigh=10M -p MemoryMax=20M -p MemorySwapMax=10M \
> 	--wait -t timeout 300 /tmp/mmap-oom
> 
>   memory.high.throttle	service runtime
>   --------------------	---------------
>             0		    120.521
>             1		    103.376
>             2		     85.881
>             3		     69.698
>             4		     42.668
>             5		     45.782
>             6		     22.179
>             7		      9.909
>             8		      5.347
>             9		      3.100
>            10		      1.757
>            11		      1.084
>            12		      0.919
>            13		      0.650
>            14		      0.650
>            15		      0.655
> 
> [1] https://docs.google.com/document/d/1mY0MTT34P-Eyv5G1t_Pqs4OWyIH-cg9caRKWmqYlSbI/edit?tab=t.0
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 16 ++++++++--
>  include/linux/memcontrol.h              |  2 ++
>  mm/memcontrol.c                         | 41 +++++++++++++++++++++++++
>  3 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index cb1b4e759b7e..df9410ad8b3b 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1291,8 +1291,20 @@ PAGE_SIZE multiple when read back.
>  	Going over the high limit never invokes the OOM killer and
>  	under extreme conditions the limit may be breached. The high
>  	limit should be used in scenarios where an external process
> -	monitors the limited cgroup to alleviate heavy reclaim
> -	pressure.
> +	monitors the limited cgroup to alleviate heavy reclaim pressure
> +	unless a high enough value is set in "memory.high.throttle".
> +
> +  memory.high.throttle
> +	A read-write single value file which exists on non-root
> +	cgroups.  The default is 0.
> +
> +	Memory usage throttle control.	This value controls the amount
> +	of throttling that will be applied when memory consumption
> +	exceeds the "memory.high" limit.  The larger the value is,
> +	the smaller the amount of throttling will be and the easier an
> +	offending application may get OOM killed.

memory.high is supposed to never invoke the OOM killer (see above). It's
unclear to me if you are referring to OOM kills from the kernel or
userspace in the commit message. If the latter, I think it shouldn't be
in kernel docs.


