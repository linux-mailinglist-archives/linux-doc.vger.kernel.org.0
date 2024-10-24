Return-Path: <linux-doc+bounces-28533-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2EE9AECA3
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 18:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007542837F0
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2024 16:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709E61F76DA;
	Thu, 24 Oct 2024 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="togMtEry"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635441E25FC
	for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 16:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788716; cv=none; b=OeCJm/paqva9VFqRv5P/jz+6n6cRLlDum4jK7GI5DeCYftuiI4hV5beQvu687lPg+x4xzpzsFrc4DAxwF94P5vv7SoRjthzI/sapavyL6B1pTg03tZG7piH1sss7ieNiCuEUUqzPmT15E5CmQZDN+rHR0GMj8oCXxE5X4o2r7fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788716; c=relaxed/simple;
	bh=EwwFUFK+3XJyQkCZ5q0IDSEAlV5PRkel+AvB4wcYCug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAb65vu85g8mW/TjEfRPF6Ll7Ltmlrvy7N3EBCrakaxPUHom2SgCgxGHw8KoBLvRzSNcEMqSTe1/u4rPzqmE0vvf3WQxVGBTNWCkB5hU5uQmCxhikhE7+dTiSO88Ai0VnqalZJyBd+cqW4PDeM7vYenSy/PUVV1utERe1kTcch4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=togMtEry; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 24 Oct 2024 16:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729788712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p8/7V012aGi/ix5qvOdVjTsWOiWzv6xTtXKacFsTU9c=;
	b=togMtEryYhBBovyKlcUefTizUP29zonGQZK02rvyNo3MZD8niYCcAv5iUBo8jvr3cM/qgP
	CXgRL5XCGpgHnHWys39JomVl0su4ivTsgCrdQzMhQ3Tqk5pbB7gC17PIX0zcbP1cLCMZbE
	FloTphrENDTDSPH//gah6eU/bg5B9W4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [RFC PATCH 1/3] memcg-v1: fully deprecate
 move_charge_at_immigrate
Message-ID: <Zxp7ItxIf744tFbD@google.com>
References: <20241024065712.1274481-1-shakeel.butt@linux.dev>
 <20241024065712.1274481-2-shakeel.butt@linux.dev>
 <ZxoP2TLCGnSm9c8p@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxoP2TLCGnSm9c8p@tiehlicka>
X-Migadu-Flow: FLOW_OUT

On Thu, Oct 24, 2024 at 11:14:01AM +0200, Michal Hocko wrote:
> On Wed 23-10-24 23:57:10, Shakeel Butt wrote:
> > Proceed with the complete deprecation of memcg v1's charge moving
> > feature. The deprecation warning has been in the kernel for almost two
> > years and has been ported to all stable kernel since. Now is the time to
> > fully deprecate this feature.
> > 
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> 
> I fine with this move, just one detail we might need to consider
> [...]
> > @@ -606,17 +606,7 @@ static int mem_cgroup_move_charge_write(struct cgroup_subsys_state *css,
> >  		     "Please report your usecase to linux-mm@kvack.org if you "
> >  		     "depend on this functionality.\n");
> >  
> > -	if (val & ~MOVE_MASK)
> > -		return -EINVAL;
> > -
> > -	/*
> > -	 * No kind of locking is needed in here, because ->can_attach() will
> > -	 * check this value once in the beginning of the process, and then carry
> > -	 * on with stale data. This means that changes to this value will only
> > -	 * affect task migrations starting after the change.
> > -	 */
> > -	memcg->move_charge_at_immigrate = val;
> > -	return 0;
> > +	return -EINVAL;
> 
> Would it make more sense to -EINVAL only if val != 0? The reason being
> that some userspace might be just writing 0 here for whatever reason and
> see the failure unexpected.

I think it's a good idea.

Thanks!

