Return-Path: <linux-doc+bounces-22349-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5C949C2F
	for <lists+linux-doc@lfdr.de>; Wed,  7 Aug 2024 01:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42A51285CBA
	for <lists+linux-doc@lfdr.de>; Tue,  6 Aug 2024 23:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725B9178CC3;
	Tue,  6 Aug 2024 23:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KmzQG+hO"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBE317838F;
	Tue,  6 Aug 2024 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985984; cv=none; b=ocPNChP384E/cxGoW4J/XbxCB9UHSoi78BJ5274FtP5iKbGqTuLj4qnek6y4u1rtbKt6V5+gfNdkHxBihrY9Foyf2S0CaQeej2pWowFn5+m1sScNMjUWhsML6ho6xfKN1qbbGxw1wY/fTuKkAtrLaBhu8FBeacW27NkY8A27wSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985984; c=relaxed/simple;
	bh=y8JMvjZKmbOiDToC9FKrf+E/PhC++4sWVQy/16zupWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhnihlVV3i6qiTjVVq3G9sSikFdkzNvD+kGB057mL0gh5eWAYntuNjgPS6vsO+5MeRrPRjN6iTe0sDzN8rgTfh3JSI4hIOLy2vTQpHAAobAcbEUqeseJofqageHkwihU4WSpemZB7yW0N/BJKj0nBt+9Z2f/bNSVL4n+yNT+buU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KmzQG+hO; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 6 Aug 2024 23:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722985980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HnyXrR8XDpflHPUuNI6RY18Phx7apWIQli7NjzfMYCs=;
	b=KmzQG+hO6u5sI2HpcTv6nRfcZpp+6ZBrBx8itXmXde3cTOqLA0lYQIVfYjJveJaCzvRL3W
	wtt4MYbmgC9r2Lt2C3reE6a31wbHJQ6Z9K4Q39bfTasW8JANkTVuQwJEh/QtPQ77npD6ju
	ccALNSDyy97bl1FIfmw9tWscJBbRh2g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: David Finkel <davidf@vimeo.com>
Cc: Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com,
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v7 1/2] mm, memcg: cg2 memory{.swap,}.peak write handlers
Message-ID: <ZrKt9Xd_hQ3kM8jY@google.com>
References: <20240730231304.761942-1-davidf@vimeo.com>
 <20240730231304.761942-2-davidf@vimeo.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730231304.761942-2-davidf@vimeo.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 30, 2024 at 07:13:03PM -0400, David Finkel wrote:
> Other mechanisms for querying the peak memory usage of either a process
> or v1 memory cgroup allow for resetting the high watermark. Restore
> parity with those mechanisms, but with a less racy API.
> 
> For example:
>  - Any write to memory.max_usage_in_bytes in a cgroup v1 mount resets
>    the high watermark.
>  - writing "5" to the clear_refs pseudo-file in a processes's proc
>    directory resets the peak RSS.
> 
> This change is an evolution of a previous patch, which mostly copied the
> cgroup v1 behavior, however, there were concerns about races/ownership
> issues with a global reset, so instead this change makes the reset
> filedescriptor-local.
> 
> Writing any non-empty string to the memory.peak and memory.swap.peak
> pseudo-files reset the high watermark to the current usage for
> subsequent reads through that same FD.
> 
> Notably, following Johannes's suggestion, this implementation moves the
> O(FDs that have written) behavior onto the FD write(2) path. Instead, on
> the page-allocation path, we simply add one additional watermark to
> conditionally bump per-hierarchy level in the page-counter.
> 
> Additionally, this takes Longman's suggestion of nesting the
> page-charging-path checks for the two watermarks to reduce the number of
> common-case comparisons.
> 
> This behavior is particularly useful for work scheduling systems that
> need to track memory usage of worker processes/cgroups per-work-item.
> Since memory can't be squeezed like CPU can (the OOM-killer has
> opinions), these systems need to track the peak memory usage to compute
> system/container fullness when binpacking workitems.
> 
> Most notably, Vimeo's use-case involves a system that's doing global
> binpacking across many Kubernetes pods/containers, and while we can use
> PSI for some local decisions about overload, we strive to avoid packing
> workloads too tightly in the first place. To facilitate this, we track
> the peak memory usage. However, since we run with long-lived workers (to
> amortize startup costs) we need a way to track the high watermark while
> a work-item is executing. Polling runs the risk of missing short spikes
> that last for timescales below the polling interval, and peak memory
> tracking at the cgroup level is otherwise perfect for this use-case.
> 
> As this data is used to ensure that binpacked work ends up with
> sufficient headroom, this use-case mostly avoids the inaccuracies
> surrounding reclaimable memory.
> 
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Suggested-by: Waiman Long <longman@redhat.com>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Reviewed-by: Michal Koutn� <mkoutny@suse.com>
> Signed-off-by: David Finkel <davidf@vimeo.com>

Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>

Thanks!

