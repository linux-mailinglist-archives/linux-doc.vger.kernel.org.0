Return-Path: <linux-doc+bounces-84508-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OFBOTyB62lLNgAAu9opvQ
	(envelope-from <linux-doc+bounces-84508-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 16:42:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E246054C
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 16:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0262302C6CE
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 14:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169073DD522;
	Fri, 24 Apr 2026 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="sVfAMZEf"
X-Original-To: linux-doc@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32BE3DA7D7;
	Fri, 24 Apr 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777041629; cv=none; b=i+WehUIny+RVy5LKMslNLxEZ9DrCgxueTrcNKsvOoLxNsOm+H1rO2+I5Y8GzU3kO5GgxQVOtN0vO4cs87SnVzwDrlxRI1hpbsvtrVWRU4cXOgJ3OC8SbIDXisPcq4sMPvlPhR2nphc6ct1LkiTkL/y7RJMCaJAew6SiXYfFmrew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777041629; c=relaxed/simple;
	bh=x8irZ8p1nU8JtdbkHO84ODZq0Xtwpnt4kgEqRc4mR5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2WnK10JxtGqtMWhb/+P5LLqmfMRlAecdh5LWjtQezEdPcYqDBnWJJr8e6Ijow8gi1QrCrNPOgiE6vilz+7Zq9z2RnAZPWuLbDCrbSh4Six5vlqBPAg+CqmTa59Yh8409HDMGrZ93uJF1TQWBnWNUYSZcVAqZi4uP/rHLzuORmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=sVfAMZEf; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MZWsZXfkCJdG85BGLfewXfKgzlxRh9RmyEDX14KHVAs=; b=sVfAMZEfh7q1NDuffqvDWC4ruC
	BopU9PZQ2Y7bl9TT2MytBxrPPv2LMUeuTZI1Kk5nkD66ytloA0VRKNjeIgYS1TCMI+v4YQJCPOpAk
	IrfrVcGu3H04M/0rDDpAg4+nPOPaMxcywtVSg5LqqJbGLF2LiIEuWr+BNkSayHw6rI8/Z8ogg281L
	NPevIFXsYO39nwDJRKkhbqurwqcZxQs8W2aTahxB0NImCywDnEXjAvPHFmSdoJR03L/Q+qvscT2wM
	O7IjwD4R4atdXyGpyDRoOSEzapT2Kx3AqgoWeyUAQKaxFi8CJuUwORcAuYJv0YHCXHoIHuKy0gSKh
	7XZzuaGA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wGHhI-003F2t-1K;
	Fri, 24 Apr 2026 14:40:00 +0000
Date: Fri, 24 Apr 2026 07:39:54 -0700
From: Breno Leitao <leitao@debian.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v5 0/4] mm/memory-failure: add panic option for
 unrecoverable pages
Message-ID: <aeuANP7U9IEzA2X_@gmail.com>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
 <aett0XmQ1EPSDdnY@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aett0XmQ1EPSDdnY@casper.infradead.org>
X-Debian-User: leitao
X-Rspamd-Queue-Id: 7E1E246054C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84508-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[huawei.com,gmail.com,linux-foundation.org,lwn.net,linuxfoundation.org,kernel.org,oracle.com,google.com,suse.com,kvack.org,vger.kernel.org,meta.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 02:19:13PM +0100, Matthew Wilcox wrote:
> On Fri, Apr 24, 2026 at 05:23:58AM -0700, Breno Leitao wrote:
> > This is a common problem on large fleets. We frequently observe multi-bit ECC
> > errors hitting kernel slab pages, where memory_failure() fails to recover them
> > and the system crashes later at an unrelated code path, making root cause
> > analysis unnecessarily difficult.
> 
> Who is "we"?  Please attribute your patches to your employer by putting
> their name in brackets after yours.  My ~/.gitconfig has:
> 
> [user]
>         name = Matthew Wilcox (Oracle)

Thank you for the feedback. You're absolutely right - I avoided
"we" entirely since it lacks proper attribution. This is something
I catch before subimtting patches, but this one went through. 

I'll update the commit message when I respin the series

