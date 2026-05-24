Return-Path: <linux-doc+bounces-89266-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nPDBCs5GE2pz9wYAu9opvQ
	(envelope-from <linux-doc+bounces-89266-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 24 May 2026 20:43:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD95C36BD
	for <lists+linux-doc@lfdr.de>; Sun, 24 May 2026 20:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80D883007F63
	for <lists+linux-doc@lfdr.de>; Sun, 24 May 2026 18:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B48309DCF;
	Sun, 24 May 2026 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S43XY/lQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C005E3438A3;
	Sun, 24 May 2026 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779648202; cv=none; b=AumxhVWI7tfZpX9bEq8uPdiz6W5EGKja7xswDHDYN6svSCHsnvyTGAlz4Gfs5M63ZUVUSam6YLmX14x5tOY3a1eK20MQWFpeZiFtKEzv+N57CZBzsVlg3qL6+ptQ3cvskp5TBHSDb2bgzivOPWuYMsgS/8BO381dYpf7fFhNRMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779648202; c=relaxed/simple;
	bh=NggFxOyp85Dz68WGS01HkR89Krwzs2Tfq33FCko+OTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifnr65igeEK7NdxtIFXXBhgFg7hRKCNhZPaCmvr9V5Xx4f8CNXi8qedSiYcww9SlSmrhxeb3I0e2ejPjDdm8qB6PMOIyEUrv85g4kzt7FCjjzBM4R4LVLZwcrGjy+MeozJCCUGTVB7kKJrD10+cpJwuDupd/ISTpGKlNnaSIX1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S43XY/lQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955FD1F000E9;
	Sun, 24 May 2026 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779648201;
	bh=CZelRHyy4+24hs+0slQHmUCKybroVh9ZqZvNGlf5w68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S43XY/lQE9+p1arX6jzhG/EZWJjAN7YzynR4seFV81jRUHOZm++U7NybpsgkxKYA1
	 lXXPkhhLB5DOvGxjcpn2HU0r5lWLIN+U4XQ8hdwdBVFCx0PY7dMsd4x4cpKFWRdSyl
	 GkCaYiPSSjBl0h0B/XUtCbAoOTrnxun10TXW79T+vF16ujP3FPth+K3R6wy74slcmP
	 soDLYz1FHAJfIYAC1Tp8lm3NRB/ATStkzma7H+zepqpx65TwjNqka46/b3SbWtlGnc
	 m/zkHD8vhxE/+9bkwSXulyCgrGzRWGyDR1cEo0LIDkrVdRl4216ucqh4luGFLDG3mh
	 r5zyM+VYHODXg==
From: SeongJae Park <sj@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	mattsva.kernel@gmail.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: fix spelling mistakes in memory management docs
Date: Sun, 24 May 2026 11:43:13 -0700
Message-ID: <20260524184313.1991-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524133701.3470-1-lance.yang@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,kvack.org,vger.kernel.org,linux-foundation.org,infradead.org,google.com,suse.com,lwn.net,linuxfoundation.org,nvidia.com,linux.alibaba.com,redhat.com,arm.com,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-89266-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 74BD95C36BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 24 May 2026 21:37:01 +0800 Lance Yang <lance.yang@linux.dev> wrote:

> Hi,
> 
> On Sun, May 24, 2026 at 02:49:21PM +0200, mattsva wrote:
> >Signed-off-by: mattsva <mattsva.kernel@gmail.com>
> 
> Missing changelog ... and Signed-off-by should use your real identity,
> not a handle :)
> 
> checkpatch.pl is your friend, please run it next time :)
> 
> >---
> > Documentation/admin-guide/mm/damon/lru_sort.rst | 2 +-
> > Documentation/admin-guide/mm/damon/reclaim.rst  | 2 +-
> > Documentation/admin-guide/mm/transhuge.rst      | 2 +-
> > 3 files changed, 3 insertions(+), 3 deletions(-)
> >
> >diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
> >index 14cc6b2db897..25e2f042a383 100644
> >--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
> >+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
> >@@ -75,7 +75,7 @@ Make DAMON_LRU_SORT reads the input parameters again, except ``enabled``.
> > 
> > Input parameters that updated while DAMON_LRU_SORT is running are not applied
> > by default.  Once this parameter is set as ``Y``, DAMON_LRU_SORT reads values
> >-of parametrs except ``enabled`` again.  Once the re-reading is done, this
> >+of parameters except ``enabled`` again.  Once the re-reading is done, this
> > parameter is set as ``N``.  If invalid parameters are found while the
> > re-reading, DAMON_LRU_SORT will be disabled.
> > 
> >diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
> >index d7a0225b4950..01a34c215b66 100644
> >--- a/Documentation/admin-guide/mm/damon/reclaim.rst
> >+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
> >@@ -67,7 +67,7 @@ Make DAMON_RECLAIM reads the input parameters again, except ``enabled``.
> > 
> > Input parameters that updated while DAMON_RECLAIM is running are not applied
> > by default.  Once this parameter is set as ``Y``, DAMON_RECLAIM reads values
> >-of parametrs except ``enabled`` again.  Once the re-reading is done, this
> >+of parameters except ``enabled`` again.  Once the re-reading is done, this
> > parameter is set as ``N``.  If invalid parameters are found while the
> > re-reading, DAMON_RECLAIM will be disabled.
> 
> Already fixed in mm-new:
> 
> https://lore.kernel.org/20260426231619.107231-3-sj@kernel.org

Thank you for checking this, Lance!

I also double confirm the typos in DAMON docs are already fixed in mm.git.

> 
> >diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
> >index 5fbc3d89bb07..5d08a2a1c15f 100644
> >--- a/Documentation/admin-guide/mm/transhuge.rst
> >+++ b/Documentation/admin-guide/mm/transhuge.rst
> >@@ -210,7 +210,7 @@ PMD-mappable transparent hugepage::
> > 	cat /sys/kernel/mm/transparent_hugepage/hpage_pmd_size
> > 
> > All THPs at fault and collapse time will be added to _deferred_list,
> >-and will therefore be split under memory presure if they are considered
> >+and will therefore be split under memory pressure if they are considered
> 
> This one as well:
> 
> https://lore.kernel.org/20260520051751.74396-1-leon.hwang@linux.dev

I also double checked this.  Lance is correct.

> 
> > "underused". A THP is underused if the number of zero-filled pages in
> > the THP is above max_ptes_none (see below). It is possible to disable
> > this behaviour by writing 0 to shrink_underused, and enable it by writing
> >-- 
> 
> So this patch is stale now: all three hunks are already covered in
> mm-new.

I agree to Lance.


Thanks,
SJ

[...]

