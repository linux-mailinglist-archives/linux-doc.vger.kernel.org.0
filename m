Return-Path: <linux-doc+bounces-22350-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE216949C35
	for <lists+linux-doc@lfdr.de>; Wed,  7 Aug 2024 01:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCD77B26839
	for <lists+linux-doc@lfdr.de>; Tue,  6 Aug 2024 23:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966AF178CE7;
	Tue,  6 Aug 2024 23:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HJG2JX0C"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7E517838F
	for <linux-doc@vger.kernel.org>; Tue,  6 Aug 2024 23:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722986007; cv=none; b=SXeNu41VUHZCOwei19ELFEF6DwpBVF/UZuyBwcnvWooBIU4vAM/dnEi3bIid3/RYlC4wQlh6afR0xbzA9bbj38fqFMYmVFeGhed6yQQNw6Ncy6hzskYmuT3w8msUJshwI41WkWvCm/9jLxgQqMQ3/j4y9baTG5X9xPti+DtjpZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722986007; c=relaxed/simple;
	bh=HJXqT4WlmI5/nWA7FAaQ2d9qGY1CO6Vi5qziCknUC64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o27fztCuKWCfwGWGz5wA6o5Y3Ri72VkOLoYOUxBS9KMxM2PP1JD07Yy5KvFj48vHO7Lt+LFOear1Wd+eUfw2b/x6UIURhEl6HkMJKSq2Gqjg0rNKf3/0pJEEyS8GZ45Bna/K3Qj0Hum3ubL+Add3QU0tziIDCk/t/Uw1VYEh11M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HJG2JX0C; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 6 Aug 2024 23:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722986003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6XgbWk5+zORCrGBHmLwbRrI2zX45IgCUPlFXlT0n+mg=;
	b=HJG2JX0CK1a+OwUvr9bEO5D5HmOYKnsBEolj/NlGxpXdQLQb1snxltTZdefTZR7EQGFPX6
	6kbwMG0pk8mKqwtVKeXm0hTC3zzMw0gak97/ZOZ9qt/C2RvSto/+2lZOv8kFUB0BNu2dxb
	kvoyHUS3LY+9/C9fm4bI1AxDvBaKn7Y=
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
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Subject: Re: [PATCH v7 2/2] mm, memcg: cg2 memory{.swap,}.peak write tests
Message-ID: <ZrKuDX848wDcBSly@google.com>
References: <20240730231304.761942-1-davidf@vimeo.com>
 <20240730231304.761942-3-davidf@vimeo.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730231304.761942-3-davidf@vimeo.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 30, 2024 at 07:13:04PM -0400, David Finkel wrote:
> Extend two existing tests to cover extracting memory usage through the
> newly mutable memory.peak and memory.swap.peak handlers.
> 
> In particular, make sure to exercise adding and removing watchers with
> overlapping lifetimes so the less-trivial logic gets tested.
> 
> The new/updated tests attempt to detect a lack of the write handler by
> fstat'ing the memory.peak and memory.swap.peak files and skip the tests
> if that's the case. Additionally, skip if the file doesn't exist at all.
> 
> Signed-off-by: David Finkel <davidf@vimeo.com>

Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>


