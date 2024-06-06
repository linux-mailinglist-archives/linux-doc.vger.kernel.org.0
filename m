Return-Path: <linux-doc+bounces-17879-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6FF8FF47B
	for <lists+linux-doc@lfdr.de>; Thu,  6 Jun 2024 20:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE367B26511
	for <lists+linux-doc@lfdr.de>; Thu,  6 Jun 2024 18:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2307419A289;
	Thu,  6 Jun 2024 18:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="If2w5F5Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8056319939E
	for <linux-doc@vger.kernel.org>; Thu,  6 Jun 2024 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717697722; cv=none; b=M4RLLChBIRrxu1XFWMak2IIhx0Lz3dnTjzWFrRY5uYF4IBWK13tn07EUwHoQs4+5dBtQts3hrrZYwpaUw1FYEov0MLgvbPan1ha4wUI7POrwVYTJaJGzDwXDZRPTju94BbtVp+U6CK2VXxFyY66gANb/UcXHUueji7/50vGxtP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717697722; c=relaxed/simple;
	bh=ytajylKBlzwPswUUv2PV8XK1+cwCdFg6WnD/8QncpwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSzTtggE6V7O3CDXIBp8mqVUctX7B1PM5c9BdgKZ0Ew7VH93jy+b23npRuAPDxlNiySiz3/hUeo7TmkQslLxgupx70bUMJTGg9UVl+LOF+8ElAIM/jnT6SYygwBU8EkWULvc5s2VrLFh19jN38J+wli1rPBQrenRlJebQ8GYwqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=If2w5F5Z; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: mkoutny@suse.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717697714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zm43uA+FFLHcQl+sDCvd8VPxTBF9+LzpAfW+SfYXKcA=;
	b=If2w5F5Zph9CPlLmSbDtKOFaWOdch41r+lhhzrRFSq3r8BF8SWCpDg8bIfa6Qm0usWedal
	SHHmp+IAtel164h1JJDc9izUSVY3Z4JE9sy4y3KFtJbcEMaoQZ/dxaYGQACssHxbulRoXj
	cnBeRCdKm0Ms6sR8G818cpPUl2nSbhA=
X-Envelope-To: cgroups@vger.kernel.org
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-mm@kvack.org
X-Envelope-To: tj@kernel.org
X-Envelope-To: lizefan.x@bytedance.com
X-Envelope-To: hannes@cmpxchg.org
X-Envelope-To: corbet@lwn.net
X-Envelope-To: mhocko@kernel.org
X-Envelope-To: shakeel.butt@linux.dev
X-Envelope-To: muchun.song@linux.dev
X-Envelope-To: akpm@linux-foundation.org
X-Envelope-To: jkratochvil@azul.com
Date: Thu, 6 Jun 2024 11:15:00 -0700
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Jan Kratochvil (Azul)" <jkratochvil@azul.com>
Subject: Re: [RFC PATCH v5 0/3] Add memory.max.effective for application's
 allocators
Message-ID: <ZmH8pNkk2MHvvCzb@P9FQF9L96D>
References: <20240606152232.20253-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606152232.20253-1-mkoutny@suse.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jun 06, 2024 at 05:22:29PM +0200, Michal Koutn� wrote:
> Some applications use memory cgroup limits to scale their own memory
> needs. Reading of the immediate membership cgroup's memory.max is not
> sufficient because of possible ancestral limits. The application could
> traverse upwards to figure out the tightest limit but this would not
> work in cgroup namespace where the view of cgroup hierarchy is
> incomplete and the limit may apply from outer world.
> Additionally, applications should respond to limit changes.

If the goal is to detect how much memory would it be possible to allocate,
I'm not sure that knowing all memory.max limits upper in the hierarchy
really buys anything without knowing actual usages and a potential
for memory reclaim across the entire tree.

E.g.:

A (max = 100G)
| \
B  C

C's effective max will come out as 100G, but if B.anon_usage = 100G and
there is no swap, the actual number is 0.

But if it's more about exploring the "invisible" part of the cgroup
tree configuration, it makes sense to me.
Not sure about the naming, maybe something like memory.tree.max
or memory.parent.max or even memory.hierarchical.max is a better fit.

Thanks!

