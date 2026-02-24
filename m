Return-Path: <linux-doc+bounces-76953-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPvSAA04nmm1UAQAu9opvQ
	(envelope-from <linux-doc+bounces-76953-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 00:45:17 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B818E2EA
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 00:45:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C990F3024EF2
	for <lists+linux-doc@lfdr.de>; Tue, 24 Feb 2026 23:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7779634CFCB;
	Tue, 24 Feb 2026 23:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/UCxPaF"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF4D1F09B3;
	Tue, 24 Feb 2026 23:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771976714; cv=none; b=l03zfVI9n0IKldhy6DoTfKQfkHw2m+L9hfNNmyXtVnWQ/Vp4awHyRTKp2vHjXgDgFMGxZkYTOnSxuKl2WUE7owy5Oj7Imz7oRj+WhBrOdLhf3oP1gPYDaqfVECC1Nw053ZBmMb26nZBEa91pISUxjRiRo/fgqBCYG9054BW+QqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771976714; c=relaxed/simple;
	bh=5uvJhF5LDkPTld+1CeJL8wog5w0F76/q9pZPlIbrTVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSy7xrsWcLaEJdL6JEGM3VpGq7xvnoZyisKCs6B3Nr9t49E1wpdWmq7Ba0P/KjnzSp8ENy8H77wGowcyCDZZDX21zXWjmjESUXLSfqaFca7rdso2b8+E6B/xZPG0SD9WO2lFSlPjoL0SLhJ1yXJvXtsRSIEcxwcjzhR3MvVYccQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/UCxPaF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2756C116D0;
	Tue, 24 Feb 2026 23:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771976714;
	bh=5uvJhF5LDkPTld+1CeJL8wog5w0F76/q9pZPlIbrTVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/UCxPaFsPqa+xdPI+yB+vtq/dghbqe5ao7qw2QhsssZyTjiJFZoRDeDg0C+V+F6D
	 btqHA6Ce0RsaFpsCG0phcfSDCWCGHEtDFifDJ/fGz9vUe9gQb85sktY/zDkOUPRBTy
	 lbVlB+mAMllViQm2yDW0sYPLNKChX2FtIXxjXvIByDit8prF0wE8RrNrSPE9aDHfgE
	 /YkMvY/DRKm4lF/LlPMBpgYCpc9dabq0AC3SjzEkhdpBRp5qYxa87cFPqpyTwx4z0d
	 AL8uxuu9jRkVzCPb3IiX2g9AHxWa9hGVNE1d39cKrtH4CXqWb6u3ZcbXuDyWwQtmbo
	 IitiGV/DnD/+A==
Date: Tue, 24 Feb 2026 15:45:13 -0800
From: Kees Cook <kees@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, linux-hardening@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>, Joe Perches <joe@perches.com>,
	Christoph Lameter <cl@linux.com>, Marco Elver <elver@google.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Pekka Enberg <penberg@kernel.org>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 4/5] slab: Introduce kmalloc_flex() and family
Message-ID: <202602241541.65DBBD8CB@keescook>
References: <20251203233029.it.641-kees@kernel.org>
 <20251203233036.3212363-4-kees@kernel.org>
 <675ec547-dac8-465f-b3c9-a0f97c5bdef7@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <675ec547-dac8-465f-b3c9-a0f97c5bdef7@lucifer.local>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76953-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.cz,lwn.net,linux-foundation.org,gentwo.org,google.com,linux.dev,oracle.com,kernel.org,vger.kernel.org,kvack.org,infradead.org,intel.com,nvidia.com,perches.com,linux.com,lge.com,linuxfoundation.org,gmail.com,jfarr.cc,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A8B818E2EA
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:26:36AM +0000, Lorenzo Stoakes wrote:
> Annnd now I typed that I realise that Linus fixed this up in mainline and I was
> working with a stale version of this file :))
> 
> Anyway, I see that the comment isn't fixed up, so I think that's something we
> should patch, like:
> 
>  * Returns: true if @COUNT can be represented in the @FAM's counter. When
>  * @FAM is not annotated with __counted_by(), always returns true.
> 
> ->
> 
>  * Returns: true if @COUNT cannot be represented in the @FAM's counter. When
>  * @FAM is not annotated with __counted_by(), always returns false.

Yeah, I'm working on fixing this up correctly. I think Linux is right
that we need to put the overflow checking entirely within the counter
setting. That way the checks will only happen for the cases where
counted_by is actually in use.

I am, however, still pondering that the size check (as I _intended_
it, not as it actually manifested), would catch negative sizes (i.e.
negative can't be represented in a size_t -- the default type when the
counter type is unknown) and refuse to allocate, though honestly the
allocator would probably also refuse to allocate them since they would
be very very large when cast back to size_t for the allocation itself.

-- 
Kees Cook

