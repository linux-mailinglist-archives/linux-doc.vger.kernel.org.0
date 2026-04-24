Return-Path: <linux-doc+bounces-84488-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAeAJ+Zt62lwMwAAu9opvQ
	(envelope-from <linux-doc+bounces-84488-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 15:19:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E802D45EE8E
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 15:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76EEE3010153
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 13:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F9F36E47F;
	Fri, 24 Apr 2026 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i9X1T2X+"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC0B36E46C;
	Fri, 24 Apr 2026 13:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777036770; cv=none; b=qnBGGpjeS5RtEIYpH7EfCcs9bbVR9XBAnvrZ9Cvqr9nv+TBMo5HiH1wQ/6RePqnaNXn3S4cOwvF+fH1aeaY438QmR2zm39QjYu8fHmRZgaavvZf0cejz7B2pXHUxDHLeNK7vPju8a5+Y51JtexENC01L0+o1eJFVNmKLJAyqQs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777036770; c=relaxed/simple;
	bh=9oviElGuemGAVi46Q61CGwpxVccZVcmFAcX0wffBesg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riErNTW8UqIwr8hlOFdWGht6SkauWwtAH0N7R+b0GVy/rR44H54w/JH+cBqjYb2woK5+QZVsCXr42qQl0SlakRF5xkq1t8YXHSh79jY/L9Qg+6hhs7cMo4KNZ6F3HZWC37Qb+uImmPozumEmnwi66vH9SYKST0eUoMscy2tYXtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=i9X1T2X+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sXX8DCyTeaTt4IdZmkdODt+bPlX1tsjH9okoeWinoGE=; b=i9X1T2X+j7Rh8FdSDr4hl4IDUK
	zsnG28/uG4V+Ypkb0qn22B3vMKmhwi58tajOcz0klI4b66gkS+auXluE/FJDxwEvVBi+LcWgjWN9R
	r7Gl6Ur74cwqK+Uj9caVGY2/pNnZ2iz9rBqyvwp+sGbSEsmWpMyLo0Rm44dMsm6raXUZSQ0n5C1gR
	q8DGKOuyUxXP7CCGXYrJsWG/YWLOqVwrzavUkJnknsGwIXZV6alWMkBDIismCv94L5wireRkMUmPC
	ludTMUXCkrlAnWE2FWrQBVY2jTlZKd92I3KTBBq2njwzHO0NeWCUF7uJ0tOEe8dJLRFAFiQgIx7C+
	OGYmjLGg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGR7-0000000FBlQ-2Efw;
	Fri, 24 Apr 2026 13:19:13 +0000
Date: Fri, 24 Apr 2026 14:19:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v5 0/4] mm/memory-failure: add panic option for
 unrecoverable pages
Message-ID: <aett0XmQ1EPSDdnY@casper.infradead.org>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
X-Rspamd-Queue-Id: E802D45EE8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84488-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[huawei.com,gmail.com,linux-foundation.org,lwn.net,linuxfoundation.org,kernel.org,oracle.com,google.com,suse.com,kvack.org,vger.kernel.org,meta.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim]

On Fri, Apr 24, 2026 at 05:23:58AM -0700, Breno Leitao wrote:
> This is a common problem on large fleets. We frequently observe multi-bit ECC
> errors hitting kernel slab pages, where memory_failure() fails to recover them
> and the system crashes later at an unrelated code path, making root cause
> analysis unnecessarily difficult.

Who is "we"?  Please attribute your patches to your employer by putting
their name in brackets after yours.  My ~/.gitconfig has:

[user]
        name = Matthew Wilcox (Oracle)


