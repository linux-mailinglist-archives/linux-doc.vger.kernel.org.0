Return-Path: <linux-doc+bounces-92721-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id woStGGBjM2pJAAYAu9opvQ
	(envelope-from <linux-doc+bounces-92721-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 05:17:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0038569D49C
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 05:17:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=pSTOXZBP;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92721-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92721-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B832C307DE2E
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 03:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0C734404F;
	Thu, 18 Jun 2026 03:17:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A71140D58F;
	Thu, 18 Jun 2026 03:17:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752666; cv=none; b=utvAnJYBAywwIpGe+wh707gSK8gVK32k8qbFZSuvHuhBFSb2zv6TYGSmU9xp7jrW92WZu+T03t/JF9/qyhcJE7Kf7lmOTAezGEvE3Eqmi2LaYRSrQtKNgJsvzoDi82nymhxQodKrDTfHSTvJYbFFmrCrV6W5RojmXZu0HX/7xzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752666; c=relaxed/simple;
	bh=sMXFaKzUyenltIoT8ArJjM2uETAE3ZMFKGkNcCf5SaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrBnb2d1K7r0HdlJAJeUAZR8FU+gPv82IwyTV3wyOOBgtohHY1VjR0aOGQ4CPxkNcFDYqDTvPfT+e+jvO9tUTbcruIjQYaLbB3pZ5ls/h7ZhN+hHhVcSTUFWauNGIv6aJWrtzUObux7SmXtV+1qLA6LrF5ouD1QctSr5H/s0VFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pSTOXZBP; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZMErdMn4fM5ebZdMPM1RRaXcObZkMc91TS7uIUs86cY=; b=pSTOXZBPNn47f5sa0hrU86rnZZ
	dhO0ExGNZNCcgFdmDVYq1xaXOcGno63AyHMYTRIN3XEMcbZwfgYmE9SUBZgi+Q/yljvqAqe+PMU9X
	+1amRFqyojYA6GUe1unKeDjAZSXt3sfLs510o66SCVYAMdZ8IAqGY39lqSaqOOVnN2qvw+xTe3cs6
	5bhdQ2TNoKKIgV+hLGWccWF9JMfr5As7bCjSDmOiFb9xq/6TLOjNEFfv9sPiFGSxonUrLMTwvofqm
	5Yw9dHPf3IZZhPOvEAa0pEgALjLo0+FiWvJn3hXYC4Ne07j5KZaOvMRP5qWNz10EV5yBm9MjbU47X
	EjjmDasA==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3Fl-0000000DjIP-2orJ;
	Thu, 18 Jun 2026 03:17:17 +0000
Date: Thu, 18 Jun 2026 04:17:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jane Chu <jane.chu@oracle.com>
Cc: akpm@linux-foundation.org, jack@suse.cz, viro@zeniv.linux.org.uk,
	brauner@kernel.org, muchun.song@linux.dev, osalvador@suse.de,
	david@kernel.org, hughd@google.com, baolin.wang@linux.alibaba.com,
	linmiaohe@huawei.com, nao.horiguchi@gmail.com, lorenzo@kernel.org,
	rppt@kernel.org, peterx@redhat.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] hugetlb: make hugetlb_fault_mutex_hash() to
 take PAGE_SIZE index
Message-ID: <ajNjPblkO9Ka_4FT@casper.infradead.org>
References: <20260617172534.1740152-1-jane.chu@oracle.com>
 <20260617172534.1740152-7-jane.chu@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617172534.1740152-7-jane.chu@oracle.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92721-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:jane.chu@oracle.com,m:akpm@linux-foundation.org,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:linmiaohe@huawei.com,m:nao.horiguchi@gmail.com,m:lorenzo@kernel.org,m:rppt@kernel.org,m:peterx@redhat.com,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:naohoriguchi@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,suse.cz,zeniv.linux.org.uk,kernel.org,linux.dev,suse.de,google.com,linux.alibaba.com,huawei.com,gmail.com,redhat.com,lwn.net,vger.kernel.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,infradead.org:dkim,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0038569D49C

On Wed, Jun 17, 2026 at 11:25:27AM -0600, Jane Chu wrote:
> Make hugetlb_fault_mutex_hash() to take a PAGE_SIZE-based index.
> This makes the helper interface consistent with filemap_get_folio(),
> and linear_page_index(), while preserving the same lock selection for
> a given hugetlb file offset.

Oh, hah.

I don't know that there's a better way to do this than the way you've
done it.  Unless we can just remove the fault mutex hash and use the
invalidate_lock instead.

