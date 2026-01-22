Return-Path: <linux-doc+bounces-73602-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPt6BmaLcWkLJAAAu9opvQ
	(envelope-from <linux-doc+bounces-73602-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 03:28:54 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F9960E65
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 03:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 47FD4461B23
	for <lists+linux-doc@lfdr.de>; Thu, 22 Jan 2026 02:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF07366562;
	Thu, 22 Jan 2026 02:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xCcG8UHm"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD373624DD
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 02:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048693; cv=none; b=A3GQEiz7RBlOkCwq/RNuHnrN+FfG8WkaMJDP+meApig6+H+LENarohwPnK4m8AyeS2qjLRvl+i1qCXKnkK3RCWW3kMFrnQ02srkr50dEdsL/AmWB93uCUA2ZWHR/pLQ168qDcbxUKUW8YRPj3C1yp1Y3jRRKxepvHqnMoWMV6KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048693; c=relaxed/simple;
	bh=VsIuKKggJWF7WT8L1/ScYKbSorXso+ny+zu5uGigef8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=h+y3QuOik2/WaqU6Dlt++nR4s/LSuOcOhkvZcYJ7tf5iuE4AyjEXLuHAvtWgrqync4e9bqQNMC8XT3TleDSVCbsHOFhjjOzJPjYjj+8zX4NpEirhqov4S/DemgfOgJ+9hBm/HPpk003G3+s/sUVTcKjObnxPzhluZ3MeH05F3U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xCcG8UHm; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769048688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW9jsyRuBI9zl9ikyUs4U41azYd78tVzdBqcf0Jug7Y=;
	b=xCcG8UHmJrreH24utr+ksk+03nK1IR3rghgvX0wnZ5j7C1W+gIWUPuffwItlVajJDID0kL
	P8bbKIl+MFeDd35wQFpGGhAd4wEVjZ2wO+IjHwM0fsFygZq0ap0lV7bsq8geQQ+LVwKqQi
	xPKh2uES3qOFtzIbDETqSMTzIZb+oMY=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv4 01/14] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260121162253.2216580-2-kas@kernel.org>
Date: Thu, 22 Jan 2026 10:24:02 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <9664AA17-6F0A-4507-B2F3-4543ECE52FF1@linux.dev>
References: <20260121162253.2216580-1-kas@kernel.org>
 <20260121162253.2216580-2-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-73602-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,infradead.org,gmail.com,google.com,suse.de,suse.cz,oracle.com,nvidia.com,redhat.com,suse.com,cmpxchg.org,lwn.net,meta.com,kvack.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linux.dev,none];
	DKIM_TRACE(0.00)[linux.dev:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muchun.song@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,linux.dev:email,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Queue-Id: 07F9960E65
X-Rspamd-Action: no action



> On Jan 22, 2026, at 00:22, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.
> 
> This is preparation for adding the vmemmap_tails array to struct
> pglist_data, which requires MAX_FOLIO_ORDER to be available in mmzone.h.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>



