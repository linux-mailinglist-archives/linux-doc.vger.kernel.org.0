Return-Path: <linux-doc+bounces-30819-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA99C8FEB
	for <lists+linux-doc@lfdr.de>; Thu, 14 Nov 2024 17:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 252DA285055
	for <lists+linux-doc@lfdr.de>; Thu, 14 Nov 2024 16:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56E316BE20;
	Thu, 14 Nov 2024 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cxCzKR6q"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C3F13C8F9
	for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2024 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731602199; cv=none; b=R+n94OxZ5/k6zlurexF7I1jyVK6jciSlBXsiPqimv9xDy7rpKdO6JbWHJ7O4lWOPM8KPJf5/YdsmOQ4YijBj/osiH1jc9fX3n5h3b6dsSvaz/+38QKQICjOlakh0cl/j1Zts8B6z9RcfUrGpcfCQNFEX27TcY5hN4OceDZDLuJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731602199; c=relaxed/simple;
	bh=Mqb4B5PP2gj2jgKl2pBH6/2Mvv5aone4vE1svJche7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCgPZT2Y5ZFOT9aAaCpa1p0t0KW5mJA3duhq0TMTqGWT8xfFrxnJmJbS64f0MpB/87wCXIT4d85HXLSa3GiYU2EYPfE8hke+ButVafrvGl14+pCXYJE9Ey3NPPWXN5veECPu0pE72AK3h2tKXeZp+mYUyUGoaFJySvfOnynB0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cxCzKR6q; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 14 Nov 2024 16:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731602196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vup4/bVsV8OYHJC5w1hijbOlf10IE8njUoT5stNuyaQ=;
	b=cxCzKR6qu2fmZZHZi0xd9UwRhtEz6Uh5DSVlrqUq5NE5ncuW6eARUNpYNthIMAUxWN2Tf2
	sKGasxz49LX254Zx0AJyCarnxPJi1ipeXLr6HwD8ftCxsf/iYBsT9z1dlxnA5yZ8u6cfeP
	OobwuVlz+TdlSzfU8iUaG3PYbltV7yk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Rientjes <rientjes@google.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, akpm@linux-foundation.org,
	nphamcs@gmail.com, shakeel.butt@linux.dev, muchun.song@linux.dev,
	chris@chrisdown.name, tj@kernel.org, lizefan.x@bytedance.com,
	mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v4 1/1] memcg/hugetlb: Add hugeTLB counters to memcg
Message-ID: <ZzYnDPzOKdEOfrTM@google.com>
References: <20241101204402.1885383-1-joshua.hahnjy@gmail.com>
 <72688d81-24db-70ba-e260-bd5c74066d27@google.com>
 <CAN+CAwPSCiAuyO2o7z20NmVUeAUHsNQacV1JvdoLeyNB4LADsw@mail.gmail.com>
 <eb4aada0-f519-02b5-c3c2-e6c26d468d7d@google.com>
 <c41adcce-473d-c1a7-57a1-0c44ea572679@google.com>
 <20241114052624.GD1564047@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114052624.GD1564047@cmpxchg.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Nov 14, 2024 at 12:26:24AM -0500, Johannes Weiner wrote:
> On Wed, Nov 13, 2024 at 02:42:29PM -0800, David Rientjes wrote:
> > On Mon, 11 Nov 2024, David Rientjes wrote:
> > 
> > > > The reason that I opted not to include a breakdown of each hugetlb
> > > > size in memory.stat is only because I wanted to keep the addition that
> > > > this patch makes as minimal as possible, while still addressing
> > > > the goal of bridging the gap between memory.stat and memory.current.
> > > > Users who are curious about this breakdown can see how much memory
> > > > is used by each hugetlb size by enabling the hugetlb controller as well.
> > > > 
> > > 
> > > While the patch may be minimal, this is solidifying a kernel API that 
> > > users will start to count on.  Users who may be interested in their 
> > > hugetlb usage may not have control over the configuration of their kernel?
> > > 
> > > Does it make sense to provide a breakdown in memory.stat so that users can 
> > > differentiate between mapping one 1GB hugetlb page and 512 2MB hugetlb 
> > > pages, which are different global resources?
> > > 
> > > > It's true that this is the case as well for total hugeltb usage, but
> > > > I felt that not including hugetlb memory usage in memory.stat when it
> > > > is accounted by memory.current would cause confusion for the users
> > > > not being able to see that memory.current = sum of memory.stat. On the
> > > > other hand, seeing the breakdown of how much each hugetlb size felt more
> > > > like an optimization, and not a solution that bridges a confusion.
> > > > 
> > > 
> > > If broken down into hugetlb_2048kB and hugetlb_1048576kB on x86, for 
> > > example, users could still do sum of memory.stat, no?>
> > > 
> > 
> > Friendly ping on this, would there be any objections to splitting the 
> > memory.stat metrics out to be per hugepage size?
> 
> I don't think it has to be either/or. We can add the total here, and a
> per-size breakdown in a separate patch (with its own changelog)?
> 
> That said, a per-size breakdown might make more sense in the hugetlb
> cgroup controller. You're mentioning separate global resources, which
> suggests this is about more explicitly controlled hugetlb use.

+1

> From a memcg POV, all hugetlb is the same. It's just (non-swappable)
> memory consumed by the cgroup.

And here too.

Thanks!

