Return-Path: <linux-doc+bounces-76607-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Bz6DC6anGmKJgQAu9opvQ
	(envelope-from <linux-doc+bounces-76607-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 19:19:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D25217B6C2
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 19:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E44A1307B21C
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 18:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB6F33C199;
	Mon, 23 Feb 2026 18:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DwysRZ8w"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365FA33B95A;
	Mon, 23 Feb 2026 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870703; cv=none; b=gdlWCE5Xvi6kPizkioBM0gM1Mto/lGMW+WsKPQqduwZQaKG/PF13uHVwPnFeXcPk6DwoiyNH1JX4gIAh+Kf+PWEI9UddMDs9H8wG58KKs0SM+xZC7RVSmBFawR4pEHMRpt7Hg4kQRtrKJUCzNF/DCbslnXUBpJMY2DieIgBL3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870703; c=relaxed/simple;
	bh=+VZ7Kwr43qtcpUWCNbDxydoVIfRKXFsPdkZVbgvisX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNvU7kPIbv4W8c5EQTOZ9yEb4Z6TeTm0+vxZpjf1ufFRRM5h/q1wDAaUEwh5ElZVVLlkablgAc3+IYXGl08gijKnPLsFhMHXMLDTWtpzpjrXKoBcUGtbZlC9YnmMEZJUYsT+GsZcYU5j6SEYBxxcrrrWjq5Tok1SwvSi0JHdSKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DwysRZ8w; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FfglRdAZ7//oiLVr9rHZZA3KADO9fxzVK1RtdGfizyk=; b=DwysRZ8w8bsWlmYNGYULfAJmG7
	hSJNuNbMf7YB6Bw+2+sdN+gpEHiWW8es4C0T6zJwktdLc3RhPZw2vHww2zYIaIWd9OMMo2f0GMQGB
	+o+JmrdW5o641PR1oftCRk1CdSsMCxhp4d9yPIn62FPbQm05ucvWkQHqdVdKmus/qgvGWHPyoTMq0
	Bi0bMdMVoMOK4+Y5UeEhXVzRwRMx69dUFCB7knGSbhp+g85lK+Ftmjm+AdVAocCgB4qJLd5e7BYXG
	DwhcEFl1UkLOZyTvFO6oylY9vWhv/isIrE2AqJyzG9EjoCNjXR2fZEj1huiJ1sS22n3Y0H4myV9zV
	XW3KWFzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaVP-0000000Et8q-2Mg0;
	Mon, 23 Feb 2026 18:18:03 +0000
Date: Mon, 23 Feb 2026 18:18:03 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv6 08/17] mm: Make page_zonenum() use head page
Message-ID: <aZyZ2-7Xr-zUnInC@casper.infradead.org>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-9-kas@kernel.org>
 <aZJTLwV2SaaKu1k_@casper.infradead.org>
 <ec4a9a1e-8c08-4879-a787-3b9e0bc38160@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec4a9a1e-8c08-4879-a787-3b9e0bc38160@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76607-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,linux.dev,gmail.com,google.com,suse.de,suse.cz,oracle.com,nvidia.com,redhat.com,suse.com,cmpxchg.org,lwn.net,xen0n.name,dabbelt.com,sifive.com,eecs.berkeley.edu,ghiti.fr,meta.com,kvack.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim,casper.infradead.org:mid]
X-Rspamd-Queue-Id: 8D25217B6C2
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 10:06:57AM +0100, David Hildenbrand (Arm) wrote:
> On 2/16/26 00:13, Matthew Wilcox wrote:
> > On Mon, Feb 02, 2026 at 03:56:24PM +0000, Kiryl Shutsemau wrote:
> > > With the upcoming changes to HVO, a single page of tail struct pages
> > > will be shared across all huge pages of the same order on a node. Since
> > > huge pages on the same node may belong to different zones, the zone
> > > information stored in shared tail page flags would be incorrect.
> > > 
> > > Always fetch zone information from the head page, which has unique and
> > > correct zone flags for each compound page.
> > 
> > You're right that different pages in the same folio can have different
> > zone number.  But does it matter ... or to put it another way, why is
> > returning the zone number of the head page the correct way to resolve
> > this?
> 
> How can a folio cross zones?

I thought 1GB pages in hugetlb could cross zones?  Maybe that used to be
true and isn't any more, or maybe it was never true and I was just
confused.


