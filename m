Return-Path: <linux-doc+bounces-89789-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKP2C79sF2oqEwgAu9opvQ
	(envelope-from <linux-doc+bounces-89789-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 00:14:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8803A5EA91C
	for <lists+linux-doc@lfdr.de>; Thu, 28 May 2026 00:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0539F304D76D
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 22:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1220F3C0625;
	Wed, 27 May 2026 22:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vnMPwzyX"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB5730EF88;
	Wed, 27 May 2026 22:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779920017; cv=none; b=OaFHfMMJ/NDxbAMJZofhoKb9HGTTSG6XpKYpezqJSuxpyRGB1lawQRX6OMhz1dEmopQVOD4CL7/5gc/xYJLB43GprifND7EBMMAOaSYOHWlimfeUbCPoTcH8iSNsq9F4BLuSU26MQ6s1YFh6Eda2yktVMNCKdYeqT/u+XHZ6V4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779920017; c=relaxed/simple;
	bh=CW+Iifdz3bIRfnE9d689BzCZ0J+WwvEHLY5CKufVG68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISW1qkCItzLtnlc3EPSnzNcrRJOgwM7nm16VOUavjywABuhwek48s59sTA1lLNE3GRl5kbwMJ1tTtcOBwSLZ4fRAW80ohe3TJFGyX1H5EuEyWkS3HrGBXbsab3fjQvzqifeVhQmpbTDeNnphgDZdVdGyjTJ+PAgIbIFl/QMee1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vnMPwzyX; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dodOOnd1Ef+RhYMklOu6YQdcoDL3YHcV/9uS/rD7CTY=; b=vnMPwzyXnO+XywybwKb5KuliVo
	5ehX6LavM9xNXUc8+Uq8M0WIEYnduf7HuuJ0hPd/oAjAOU5Lx8Kq3pq4McOVaGwlrkV6ZxI1PQ9Tb
	3iaBA9kdNaKme+vzOOAat43Uy93oxPXEAdc3EPavWlDRQ99+iSmvZIl6Eb3rCA/U8S3Ci90dJI666
	WxI5xctNB1UnWl2Lzw7KaOWB62Q5TI/HvXzmX7BGqOW5lj03Z8RNfCgoP1Jzbo0BPSVM5uBrJTVwv
	bKDttAhwEqwX6OvyS8QdghV5FI7eODY2VXJx3icD+zbh9ot9Zm1+Eo+pXPbyzMw8mW/p6ljC/l/MO
	E+MWIwMQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSMV9-00000003PNc-3SNN;
	Wed, 27 May 2026 22:13:23 +0000
Date: Wed, 27 May 2026 23:13:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: lirongqing <lirongqing@baidu.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/mempool: use static key for boot-time debug enablement
Message-ID: <ahdsgyYYDn6juR_R@casper.infradead.org>
References: <20260527104634.2434-1-lirongqing@baidu.com>
 <4da5d090-8272-7f26-9e83-ea4ab489f1f4@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4da5d090-8272-7f26-9e83-ea4ab489f1f4@gentwo.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89789-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[infradead.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:dkim]
X-Rspamd-Queue-Id: 8803A5EA91C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 02:29:22PM -0700, Christoph Lameter (Ampere) wrote:
> Oh someone put an #ifdef CONFIG_SLUB_DEBUG_ON in mempool.c. Overloading
> the meaning of SLUB_DEBUG_ON as it is used in slub.c with something else.
> 
> Someone was assuming that SLUB_DEBUG_ON means the same as SLUB_DEBUG?
> 
> Please clean this mess up.

Isn't that what this patch does?

