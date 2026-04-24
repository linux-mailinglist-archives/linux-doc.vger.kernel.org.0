Return-Path: <linux-doc+bounces-84514-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FAiKoON62k+OQAAu9opvQ
	(envelope-from <linux-doc+bounces-84514-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 17:34:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E0460D17
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 17:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D597300B3CC
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 15:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44FD3C3BE0;
	Fri, 24 Apr 2026 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RR6MS8AZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2D3A6B92;
	Fri, 24 Apr 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044860; cv=none; b=G+fcWxoWczjVhmjEFDq/WGygmD+sdm3bFhkGPcyxWV6Vkito0RxBVxJfPw7aHhUf9NgdtkZPwJ9WV+iV4Zv8BkX5jBPdMHorxHHYw+0c+AXJFp4ZpsAtfc5IbuOLypFLSdAmtXvHA+iDphLxN/3K+jjuD1Obm7XMmzt+82T0Sw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044860; c=relaxed/simple;
	bh=Wb83QNnS4oG1uYnsCxhoZG9G0GxoLbxEGndYGFbMPik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTQ62CXXv6dg7sINghTkaZ7HQkfY/Ir3QrZeGTFaZ5onr9q4XsTw4VsB7c4xUHG8HJtlZZ35Q80ADG6DUxUAJr3fFn3SDqaMFatMc1ChT8tPdaCIxV0Aav+l8cXYHrJleiHtp0/SD2RqFZmcqJqCIW6+xBP8XJgevq00zRKPszo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RR6MS8AZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a4+pgU+NOVMpYPBvLE6fPcolyKcgS2xdHtxW5mhk/JI=; b=RR6MS8AZVqxdv9GKFbKJ9/6dWe
	tPPVqT4d/0XBnTmWSSMgDp5pcm+mJWVV5xc4riFRky0ZEx2e6t/5I+lke7VP6zkEOgcmjYodWgiId
	y0TSQCM9ssNO+ROqkh+/WDvxpudchcJPLu9YUloWhtf5JRXJzaIx+FKyCJWrhw2EJG4woWDXHSlbs
	JlNOvpaXgSQb6YRseKGK7wHZYsivOJRut6TPcBAH6rBnKBH4yC5APPF/w98oKyc0AJdIHLQRLJhtk
	MwMsyCWr25G4Tgg+GXG7EWVMZk7uZ3fZ+5wjz0+XTl/sssCBwa5t4fCASKtsk3s5wXqs1vVEVkkHX
	NZgX4Y8g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIXl-0000000FQ6e-0GXQ;
	Fri, 24 Apr 2026 15:34:13 +0000
Date: Fri, 24 Apr 2026 16:34:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Sasha Levin <sashal@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net,
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	skhan@linuxfoundation.org, jackmanb@google.com, hannes@cmpxchg.org,
	ziy@nvidia.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/7] mm: dual-bitmap page allocator consistency checker
Message-ID: <aeuNdOmgxA-k9BqY@casper.infradead.org>
References: <20260424140056.2094777-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424140056.2094777-1-sashal@kernel.org>
X-Rspamd-Queue-Id: 1C4E0460D17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84514-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[infradead.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:dkim]

On Fri, Apr 24, 2026 at 10:00:49AM -0400, Sasha Levin wrote:
> corruption must be detected before it propagates. The dual-bitmap
> implements a way to protect from corruption coming from hardware or
> software - two complementary representations of page allocation state,
> allocated independently via memblock, where any single-bit fault in
> either bitmap is immediately detectable. Performance is secondary to
> correctness in this context. A safety mechanism must be simple enough
> to audit and certify, must fail deterministically (panic, not
> log-and-hope), and its correctness matters more than its throughput.
> The dual-bitmap adds two atomic bitops per alloc/free, but for
> safety-critical deployments this cost is acceptable because the
> alternative - undetected corruption propagating silently - violates
> the system's safety case. The static key ensures zero cost for kernels
> that don't need it.

But doubling the storage requirement in order to achieve merely detection
is significantly worse than state-of-the-art in 1950 (when Richard
Hamming invented Hamming codes).  If we used a (7,3) code, we'd have
SECDED at a lower cost.  Of course, there are far better codes available
than that today.


