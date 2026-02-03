Return-Path: <linux-doc+bounces-75011-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNaVGEHGgWk0JwMAu9opvQ
	(envelope-from <linux-doc+bounces-75011-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 10:56:17 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D320FD72E9
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 10:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B84C306E81A
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 09:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479CF39901B;
	Tue,  3 Feb 2026 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ESMSiqS5"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267AE39525C;
	Tue,  3 Feb 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112281; cv=none; b=SfP+hZNptA+Xy7iKNWhtPuxmNcjgsbOvWMUyC65tDJxYiQkBxfFGlajnVmZthbaOsO0aJtgUBDg/MXBK8+b6e+vKvjC/0OzRnn9B8iRxzOilcvsqwKhC8317B9sfjUbBSqAPQUgx0wvkpyZYvQa53EPBhtspAjaFlXtfS8rKGxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112281; c=relaxed/simple;
	bh=JB37f7aWRV58dvpxkW8UNrxVvq8Wiv2PvuKT2/vvQio=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Xwx0dO8wta3GuCu3mlLKRUeUADxy1UTEWXL1FfD38gnS6lymN3BwZt/wlcIrVkoKLAtxxuqf7awvGD/OdDh9FpW4iYt99OdyGKc4Yk02WYlxnmN15U9j+i5YdDZKFt593WLWV7Zu9NGUcQSFFCc8zqSVd+qOw2Z5kKfBmhTsWxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ESMSiqS5; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770112277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9LMV/UqSLQLqZskyhJdWEgGaTiL2QvED1GhTKVUM7dY=;
	b=ESMSiqS5ORHZuZjWRltobDFH6KzSxY4kRV2ycmTIHL0HadXikXjnfkOnrlbsP1Fbvat2zN
	JZTwdZTssymJkx5X6YALhYhxOhEzwJWov3PuvlVQpLQ6w9EYcqwmDE8Gi3nwvqdiTDy9DL
	vJ9KphjIGx1nE1AgsHx+O2A8hJQWtX0=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv6 11/17] mm/hugetlb: Remove fake head pages
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260202155634.650837-12-kas@kernel.org>
Date: Tue, 3 Feb 2026 17:50:34 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
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
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Message-Id: <1FFEED62-343D-433C-BB81-EB646D066AC9@linux.dev>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-12-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75011-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,redhat.com,infradead.org,gmail.com,google.com,suse.de,kernel.org,suse.cz,oracle.com,nvidia.com,suse.com,cmpxchg.org,lwn.net,xen0n.name,dabbelt.com,sifive.com,eecs.berkeley.edu,ghiti.fr,meta.com,kvack.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muchun.song@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:dkim,linux.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D320FD72E9
X-Rspamd-Action: no action



> On Feb 2, 2026, at 23:56, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
> vmemmap pages for huge pages and remapping the freed range to a single
> page containing the struct page metadata.
> 
> With the new mask-based compound_info encoding (for power-of-2 struct
> page sizes), all tail pages of the same order are now identical
> regardless of which compound page they belong to. This means the tail
> pages can be truly shared without fake heads.
> 
> Allocate a single page of initialized tail struct pages per NUMA node
> per order in the vmemmap_tails[] array in pglist_data. All huge pages of
> that order on the node share this tail page, mapped read-only into their
> vmemmap. The head page remains unique per huge page.
> 
> Redefine MAX_FOLIO_ORDER using ilog2(). The define has to produce a
> compile-constant as it is used to specify vmemmap_tail array size.
> For some reason, compiler is not able to solve get_order() at
> compile-time, but ilog2() works.
> 
> Avoid PUD_ORDER to define MAX_FOLIO_ORDER as it adds dependency to
> <linux/pgtable.h> which generates hard-to-break include loop.
> 
> This eliminates fake heads while maintaining the same memory savings,
> and simplifies compound_head() by removing fake head detection.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>



