Return-Path: <linux-doc+bounces-79452-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCc8O3+nt2k2UAEAu9opvQ
	(envelope-from <linux-doc+bounces-79452-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 07:47:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF0D2953E1
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 07:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56932300C001
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 06:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFAA7263B;
	Mon, 16 Mar 2026 06:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLFHWwM4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E85CDF1
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 06:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773643644; cv=none; b=ILrBaBus0SidhIqmuZA8kp3plc05kdEhNm+kkoGiagiPMErHFTsoxLoDyYH0RT13DLfNlBlEBj/rNcD5mYMvvhm8PHuBk0t+z07qEksU0L4YO6HrZuSC5cZjqNBhrEkrojUmMcgYty0xUTSD1xpEi3+nnzkct5diQl3ZK8ifn9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773643644; c=relaxed/simple;
	bh=ZDu+xUvhrChyttr6D5WuK5J+jLBduob1K3CBSUvWzKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAUmTknEjCk+XewINMQhz1ORrIzK0OJJvL5JoGFMqkhv89uIuecxA39dpYbAGWL0gZp+QzTD3vtdRlUg7CjDMNeLPoGM3o6cuXQfBYdkBaUDUIjO8AXq8ucTh5V71wig/LoMKrbcx9cNwSE2LmrosAH9Ey2hkxCXrHmX6/v9WsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLFHWwM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C97CC19421;
	Mon, 16 Mar 2026 06:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773643644;
	bh=ZDu+xUvhrChyttr6D5WuK5J+jLBduob1K3CBSUvWzKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BLFHWwM4FysvgHmhk+4rELTKsRLvPP+wjzM/AXnEk4opaDmVP7zvG6aVaqvDS0Tl+
	 qoBwoX/XCbc/WlCD0pLZlmfo4BaEXUVJ9OXay2jnv80DISXBU9d56ms86LfF4/OkJR
	 lAwQEtTK7emx18u6CDQorQPwDUwFLrLhnd3g2Wc8i2008cM/a3YG4S5kyApwdFlxuD
	 jO+n5zvq89xJa/SgiDCSte+tJKx0eOkCJxfr/u2TIYkRrG0a6rYri9Vz3EyCpHEtxR
	 E3O/snFJxCWdflcpRk1CehXkP+qAhBhfxo1Da2SjGvUikwbsnmBf426ZaX2jP9PF6U
	 3arAVeCeun/rw==
Date: Mon, 16 Mar 2026 08:47:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Kit Dallege <xaum.io@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, corbet@lwn.net, linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document Boot Memory
Message-ID: <abendSlwDIwB4teF@kernel.org>
References: <20260314152527.100295-1-xaum.io@gmail.com>
 <0c981733-477b-496e-abe5-54eebaae04b1@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c981733-477b-496e-abe5-54eebaae04b1@lucifer.local>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,lwn.net,kvack.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-79452-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AF0D2953E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 08:43:24PM +0000, Lorenzo Stoakes (Oracle) wrote:
> NAK for being AI slop, again, obviously.
> 
> +cc Mike, the 'boot memory' maintainer, who again I'm sure will be
> overjoyed by this.
 
I'm not going to review it thoroughly because
"maintainers are entitled to reject your series without detailed review"

> Reasons, as the rest:
> - Worthless documentation
> - Everything about patch screams 'zero effort, Claude did it all'
> - Bad etiquette
> 
> On Sat, Mar 14, 2026 at 04:25:27PM +0100, Kit Dallege wrote:
> > Fill in the bootmem.rst stub created in commit 481cc97349d6
> > ("mm,doc: Add new documentation structure") as part of
> > the structured memory management documentation following
> > Mel Gorman's book outline.

We don't need to fill in missing parts just to fill files with contents, we
need quality documentation.
This doc does not improve over what we already have in
Documentation/core-api/boot-time-mm.rst.

...

> > +The memblock allocator fills this role, managing physical memory from the
> > +earliest stages of boot until the buddy allocator takes over.  The
> > +implementation is in ``mm/memblock.c`` and ``mm/mm_init.c``.
> 
> This is at least reasonable.

But still wrong. mm_init.c is not a part of memblock allocator.
 
> > +- ``kernelcore=`` sets the amount of memory that must be in non-movable
> > +  zones.
> > +- ``movablecore=`` sets the amount of memory to place in ``ZONE_MOVABLE``.
> > +- ``movable_node`` allows entire NUMA nodes to be treated as movable.
> > +- ``kernelcore=mirror`` restricts non-movable memory to mirrored regions.
> > +
> > +These parameters control the boundary between ``ZONE_MOVABLE`` and the
> > +other zones, which in turn affects how much memory is available for
> > +transparent huge pages, memory hot-remove, and CMA.

Oh, my ...
How CMA and THP are related to ZONE_MOVABLE here?!

-- 
Sincerely yours,
Mike.

