Return-Path: <linux-doc+bounces-84476-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKx5E/Bb62lGLwAAu9opvQ
	(envelope-from <linux-doc+bounces-84476-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 14:02:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36B45E260
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 14:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A9FD300CBCB
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 12:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AA0318ED6;
	Fri, 24 Apr 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="XXhpjgvn"
X-Original-To: linux-doc@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BE12BE057;
	Fri, 24 Apr 2026 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032085; cv=none; b=tFOgtRUzi70+3Mo9nA4BVh2yjMactNzCoRgKO+Mp6DOgZGd702UW/4Vj4eCQgedOT2TUGXhjF2FUEDOJ+Gu4Zg5PrRBP15GoPvw+gGst+FGPov6wZ/bovQWWOAUINONyLXM/RVkvfXcoQAPxq4u/UR3WqrvjLYdUKdYeqrJHoFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032085; c=relaxed/simple;
	bh=E6kxJ9fReFDTbKh3AUWR9Dl60bN6M6XqZ0+lTvf764s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9CpmFZyy9nzhXvPXzmu9aHW7RqlQTSlrFmybhVIdPnVeUuuSCQ+m3RSzFm7+VkEOqIRwYjPjWzKVty76J1UFN8xf3i8mBOYvH4irk840W1ShxoV9Nve7mfHkRDM0LFB8IJttHNtoiI1yMSiT+szlRzpMS0QqZ/qY3GQWvuncsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=XXhpjgvn; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=i9gfDuuaXGFcGzcTQeLr1pg8fqm0C7Flns4/9cvFi4g=; b=XXhpjgvn+c0oE9J0xyNK5mpMTS
	kUx+kT9SiAQJQHow1kuklllfRYjp1nacBmIV6NiAm/4iuo9zbo2lQ1vk2QMuF/Esq985vSWJtpHH6
	onBsQragEGxgW8PFJ9SQZ/kB3P+ktm0N+nqjXTxia0n6bW449lIyALBK8wobcvq9eS+rGZChiCBPU
	O+/ml6KOuQugS7YhUCdPf8qPgzTIuUaexfm26y8itblIlcOGXAnxNRq07GFDLeBrqcCQKKlIGhGQr
	HyQc51x84G0ritTwD28VsX+RGp5ar9kMoruGbjgnfZewEtZl9FqpY+b+mznM4BVfzx5CmAz6IXf5Z
	d8WmURlQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wGFDW-0039ct-3A;
	Fri, 24 Apr 2026 12:01:07 +0000
Date: Fri, 24 Apr 2026 05:01:01 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v4 2/3] mm/memory-failure: add panic option for
 unrecoverable pages
Message-ID: <aeta8Ifvmqi6-E8w@gmail.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <20260415-ecc_panic-v4-2-2d0277f8f601@debian.org>
 <6b505601-747a-0812-7544-63a8ab3cffce@huawei.com>
 <aejlg62nxcF_5g2v@gmail.com>
 <c1517ad3-91d1-2ea1-efa7-0f29415d513d@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1517ad3-91d1-2ea1-efa7-0f29415d513d@huawei.com>
X-Debian-User: leitao
X-Rspamd-Queue-Id: 3E36B45E260
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84476-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,meta.com,gmail.com,linux-foundation.org,lwn.net,linuxfoundation.org,kernel.org,oracle.com,google.com,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, Apr 23, 2026 at 10:38:19AM +0800, Miaohe Lin wrote:
> > are you suggesting I drop MF_MSG_KERNEL_HIGH_ORDER from here, or, document this
> > will not hit userspace pages?
> 
> No, maybe we should rule out or document above rare case if I'm not miss something.

Good catch. A buddy page being concurrently allocated to userspace can
briefly satisfy get_hwpoison_page() == 0 && !is_free_buddy_page(), and
that page is recoverable via the standard SIGBUS path — panicking on
it would be wrong.

The page allocator can't filter it out either.

check_new_pages() is gated by is_check_pages_enabled() and is a no-op
when CONFIG_DEBUG_VM=n.

For v6 I'll try to rule out the race inside panic_on_unrecoverable_mf() so
action_result() stays unchanged:

	case MF_MSG_KERNEL_HIGH_ORDER:
	p = pfn_to_online_page(pfn);
	if (!p)
		return true;
	cpu_relax();
	return page_count(p) == 0 &&
		!PageLRU(p) &&
		!page_mapped(p) &&
		!page_folio(p)->mapping &&
		!is_free_buddy_page(p);


A buddy page being allocated must transit rmqueue() → prep_new_page() →
post_alloc_hook() before the caller can use it. Each step either bumps
_refcount or sets state we can observe (PageLRU, ->mapping). cpu_relax()
lets that remote-CPU progress become visible before we resample.

A genuine non-buddy high-order kernel tail page stays unowned across the
recheck, so the panic still fires on the case this series targets.

The window is much narrowed now, not eliminated — I'll say so in the changelog.

I also added a selftest that enables the sysctl, injects MADV_HWPOISON
on a userspace anon page in a forked child, and asserts SIGBUS (not a
panic). I've been running this in a loop for hours, and I haven't seen any
false positive.

Thanks for the review,
--breno

