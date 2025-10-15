Return-Path: <linux-doc+bounces-63421-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA56BE00F6
	for <lists+linux-doc@lfdr.de>; Wed, 15 Oct 2025 20:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 729453AB0AE
	for <lists+linux-doc@lfdr.de>; Wed, 15 Oct 2025 18:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85088341646;
	Wed, 15 Oct 2025 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NAHM1olm"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2B303A0C
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552041; cv=none; b=Qsc+hdvQacH+rLCpnwAc5cLX7zkCfxATWdjQKB3id0Wxq/dhVnrOk7Jw4fhI3DXNJMafQ+8AQkl+/eADOTpbrZXx3GpGYX8ypQso3mxPBtrS4nTr0lbLfepmkfcsm94jia2jEUj6iSqfbCjFdfHSf/9lvBmfIlCTwgd7BqU8ryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552041; c=relaxed/simple;
	bh=K8ohR1EkQUiBzkOk8etT1f69udFGn03qH0unxY56kNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7JbDyKnYTnVr2JkTuWgcMb6rpRHae0X3RoGY1U7qwSoQYSHIoqses1WLTnmonANLeNXJ+bikAeakY2HsLvCQykrAV6aYDVcD3hyCMuw7kYgdEb7+NabCNXIIbIck1ZFEAhyPQeS95pYG9U16z46tU4/ggX6bNkOpcFwy7hgxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NAHM1olm; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 15 Oct 2025 11:13:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760552032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oDsh02qbewzSlDYWVBVvoBK8rVznFkpLkjpUNC636rA=;
	b=NAHM1olmXpEQr5qQuoLB5PapFs+mzWhfgze58nPBWRn7EX9l27GhL0IaH5KqmUBbKhZiwE
	bH2v64/OiN85fLWxfvIHZttlxpkhb9Q6+89YjtdYwtc0IucCOFKxExMArmvGIwYyD54ARO
	kR1Kw1HtnoBhW0vlA5OEc2Uq6PM7VH4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Barry Song <21cnbao@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, 
	Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Jonathan Corbet <corbet@lwn.net>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Simon Horman <horms@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Huacai Zhou <zhouhuacai@oppo.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network
 buffer allocation
Message-ID: <yisxjdnn73ebybkdl4tisji3d7ozmsm4se2whenidjwbn2z5kl@tvigrv54qp7z>
References: <20251013101636.69220-1-21cnbao@gmail.com>
 <aO11jqD6jgNs5h8K@casper.infradead.org>
 <CAGsJ_4x9=Be2Prbjia8-p97zAsoqjsPHkZOfXwz74Z_T=RjKAA@mail.gmail.com>
 <CANn89iJpNqZJwA0qKMNB41gKDrWBCaS+CashB9=v1omhJncGBw@mail.gmail.com>
 <CAGsJ_4xGSrfori6RvC9qYEgRhVe3bJKYfgUM6fZ0bX3cjfe74Q@mail.gmail.com>
 <CANn89iKSW-kk-h-B0f1oijwYiCWYOAO0jDrf+Z+fbOfAMJMUbA@mail.gmail.com>
 <CAGsJ_4wJHpD10ECtWJtEWHkEyP67sNxHeivkWoA5k5++BCfccA@mail.gmail.com>
 <pow5zt7dmo2wiydophoap6ntaycyjt2yrszo3ue7mg2hgnzcmv@oi3epbtyoufn>
 <CAGsJ_4w-=MNAKyNk6hvAYMbi_tdiehM4dFtz3x0-V-0kCh83PQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4w-=MNAKyNk6hvAYMbi_tdiehM4dFtz3x0-V-0kCh83PQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Oct 15, 2025 at 04:28:17AM +0800, Barry Song wrote:
> On Tue, Oct 14, 2025 at 10:38 PM Shakeel Butt <shakeel.butt@linux.dev> wrote:
> 
> > >
> > > It might be worth exploring these settings further, but I can’t quite see
> > > their connection to high-order allocations,
> >
> > I don't think there is a connection between them. Is there a reason you
> > are expecting a connection/relation between them?
> 
> Eric replied to my email about frequent high-order allocation requests,
> suggesting that I might be missing some proper configurations for these
> settings[1]. So I’m trying to understand whether these configurations affect
> the frequency of high-order allocations.

If I understand Eric correctly, those configurations do indirectly
affect the number of memory allocations and their lifetime (irrespective
of order). In one scenario, setting tcp_wmem[0] higher, allow the kernel
to allocate more memory even when the system is under memory pressure.
See tcp_wmem_schedule(). In your case it would be up to 0.5MiB per
socket.

Have you tested the configuration values suggested by Eric?

