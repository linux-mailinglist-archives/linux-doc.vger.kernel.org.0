Return-Path: <linux-doc+bounces-83742-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OtD8G/UQ42leBwEAu9opvQ
	(envelope-from <linux-doc+bounces-83742-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 07:04:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C541FFE1
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 07:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0FCD300DE3C
	for <lists+linux-doc@lfdr.de>; Sat, 18 Apr 2026 05:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639D21F37D3;
	Sat, 18 Apr 2026 05:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DoM7XdLh"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC933987;
	Sat, 18 Apr 2026 05:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776488688; cv=none; b=mklcdKch/J2XILETYkm2kCw68MAF4rZtfkDg1QeUJPd/2wU0pOZssSuJbTxJj270Y9uAiBvEucWyKoiU9VZdJCAkEgYa8NPeJPYCYmrlWllGl6/l58GblGDIHmC75yw6k4dPOZk5SYl261UjeGKEITuKC9DElcqh4F/utJJEXUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776488688; c=relaxed/simple;
	bh=m4SoyFSc4qyz+nfvRE/DEbC1Ir24RRoXLiH4ue6eCjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sV+toPX9H/PxEl9Ivhjb7FOpftB5i+L4JwzBsIBIIHr0BuHy9VwWGxvMHf5iYy+QBhvjCj3fQARZQfWQL2UXjxmTToEp5fn0iD0dqiP1+tR1r3W5gFwGxQyaYEFtcdNN5kRN1/VnD2ijVgBJcbU3GN7MIVrv/zqhmLpIHKPrn8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DoM7XdLh; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gXPL1oY4ZjCE0WWtEdPPz6N7I9mzftnuX51EgaElACA=; b=DoM7XdLhtZYC5qSA4Cp/MzhWAg
	pEIllgUcmdv5SXB1MIM7eWxfrd5O1GYf37vRCkxMxGBP/+gDP/JoFBgGwPynbyEClCqeIFtD7OvQs
	mEjPmSAv9laDPg3OGWwKRa/SkfyZ9rgZpDUraNUTGna56eTcqTbD/UL4q8XfL0hbWVi0P4IRtUqsg
	cv6/rSpBcRrpkdsppPnLDCr3f/AobljlB5hT4og1lq95+yuvFce+NtLpl9O6o7U8ZaV1VpSXfSaYH
	FkHlNUJ+F3X3ggIzyYn0puaSa2H8lxP2E0nAdVmovb+uVBGhO6+vIIQ8Oc0pnoFLwYOwZV9qm7BUb
	uMDoGrww==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDxr5-00000004zL8-2q3y;
	Sat, 18 Apr 2026 05:04:31 +0000
Date: Sat, 18 Apr 2026 06:04:31 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nick Huang <sef1548@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
Message-ID: <aeMQ36jFnCKmCSyA@casper.infradead.org>
References: <20260418000635.17499-1-sef1548@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418000635.17499-1-sef1548@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83742-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[willy@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,casper.infradead.org:mid]
X-Rspamd-Queue-Id: E68C541FFE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> - Add "Overview" section explaining the slab allocator's role and purpose
> - Document the three main slab allocator implementations (SLAB, SLUB, SLOB)

Umm.

commit 6630e950d532
Author: Vlastimil Babka <vbabka@kernel.org>
Date:   Tue Feb 28 15:38:07 2023 +0100

    mm/slob: remove slob.c

commit 16a1d968358a
Author: Vlastimil Babka <vbabka@kernel.org>
Date:   Mon Oct 2 20:43:43 2023 +0200

    mm/slab: remove mm/slab.c and slab_def.h

Care to revise?

> - Highlight SLUB as the default allocator on modern systems
> - Add "SLUB Allocator" subsection with detailed information:
> - Explain SLUB's design goals and advantages over legacy SLAB
> - Document its focus on simplification and performance
> - Note support for both uniprocessor and SMP systems
> 
> Signed-off-by: Nick Huang <sef1548@gmail.com>
> ---
>  Documentation/mm/slab.rst | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/mm/slab.rst b/Documentation/mm/slab.rst
> index 2bcc58ada302..2d1d093afb7b 100644
> --- a/Documentation/mm/slab.rst
> +++ b/Documentation/mm/slab.rst
> @@ -4,6 +4,32 @@
>  Slab Allocation
>  ===============
>  
> +Overview
> +========
> +
> +The slab allocator is responsible for efficient allocation and reuse of
> +small kernel objects. It reduces internal fragmentation and improves
> +performance by caching frequently used objects.
> +
> +The Linux kernel provides multiple slab allocator implementations,
> +including SLAB, SLUB, and SLOB. Among these, SLUB is the default
> +allocator on most modern systems.
> +
> +SLUB Allocator
> +==============
> +
> +Overview
> +--------
> +
> +SLUB is a slab allocator designed to replace the legacy SLAB allocator
> +(mm/slab.c). It addresses the complexity, scalability limitations, and
> +memory overhead of the SLAB implementation.
> +
> +The primary goal of SLUB is to simplify slab allocation while improving
> +performance on both uniprocessor (UP) and symmetric multiprocessing (SMP)
> +systems.
> +
> +
>  Functions and structures
>  ========================
>  
> -- 
> 2.43.0
> 
> 

