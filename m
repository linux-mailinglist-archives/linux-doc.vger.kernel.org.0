Return-Path: <linux-doc+bounces-36381-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABFEA22488
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 20:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 427471887633
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2025 19:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3453192D68;
	Wed, 29 Jan 2025 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ue848SLQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66501922E6
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 19:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738178785; cv=none; b=kcD4Z670RmC3pmzvO++4h5p3tC4qlpNdqa88S47j24dd4dltc21JLbQTe7g+zmFdi2bg1Io+piF1aGT/lZyut5bPBe3zSe9+3TZdElczJEMp1OwZDclC7huPcFQFAUr6cFhgS7DQfaHDAV3IQcdxKZQrdkoMLuY02f2j26uvIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738178785; c=relaxed/simple;
	bh=JErhnK9vh1akt2Xp7ASXYg5rOnjWRbGoKUxybdHw44s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZH/u3Us1PYUfiWdf1FpBtBOKgA3zFQIYyKCCaAZ+APuGczwQKvz7OKYD+efT7ZUgyqjxP/1opbeOhe7ujB+YGpdMG2jyw5RlBysMCnhvMnoDZ6e7XO1NdLzDi9bHANo/nirmqDnQebk6qHkenQ8/IGnTt6SOuJr6ZfHjP1M2Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ue848SLQ; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 29 Jan 2025 11:26:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738178776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ESHb3thQtuXbodFmYjILE5mf+awO3LfeN6uNWFEO8zw=;
	b=Ue848SLQp7AXW2KAD9bD74z2dJ6Q8MWVgLoMSyHTXvSi90lOcXAd5dCubuCawhV6imZ/yE
	TFustaZgK70Izn6A/U2+3/f0Jn17TBGv1l/xghddJRBf9HsudRqFudSr1AF8PRJn+xSLPt
	Ur5jHoAISh1WHbzp6dTb+w5Sw7SziCQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Vitaly Wool <vitaly.wool@konsulko.com>, Seth Jennings <sjenning@redhat.com>, 
	Dan Streetman <ddstreet@ieee.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: zbud: remove zbud
Message-ID: <63bf6cenq2sg55jorlvwtstyt6xrsi3yayidh3uvdtyib3flbh@ni2ezwfvpggl>
References: <20250129180633.3501650-1-yosry.ahmed@linux.dev>
 <20250129180633.3501650-3-yosry.ahmed@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129180633.3501650-3-yosry.ahmed@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Wed, Jan 29, 2025 at 06:06:32PM +0000, Yosry Ahmed wrote:
> The zbud compressed pages allocator is rarely used, most users use
> zsmalloc. zbud consumes much more memory (only stores 1 or 2 compressed
> pages per physical page). The only advantage of zbud is a marginal
> performance improvement that by no means justify the memory overhead.
> 
> Historically, zsmalloc had significantly worse latency than zbud and
> z3fold but offered better memory savings.  This is no longer the case as
> shown by a simple recent analysis [1].  In a kernel build test on tmpfs
> in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the cost
> of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
> sense for zbud in any practical scenario.
> 
> The only alleged advantage of zbud is not having the dependency on
> CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
> zbud is only used by zswap.
> 
> Remove zbud after z3fold's removal, leaving zsmalloc as the one and only
> zpool allocator. Leave the removal of the zpool API (and its associated
> config options) to a followup cleanup after no more allocators show up.
> 
> Deprecating zbud for a few cycles before removing it was initially
> proposed [2], like z3fold was marked as deprecated for 2 cycles [3].
> However, Johannes rightfully pointed out that the 2 cycles is too short
> for most downstream consumers, and z3fold was deprecated first only as a
> courtesy anyway.
> 
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/Z5gdnSX5Lv-nfjQL@google.com/
> [3]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google.com/
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>

