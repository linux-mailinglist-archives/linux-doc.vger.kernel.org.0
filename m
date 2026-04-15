Return-Path: <linux-doc+bounces-83427-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPOwIv7n3mmOMQAAu9opvQ
	(envelope-from <linux-doc+bounces-83427-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2026 03:21:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A83FF78B
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2026 03:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F35E93047BE8
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2026 01:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F06A26ED37;
	Wed, 15 Apr 2026 01:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPy6geJV"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0DF4369A;
	Wed, 15 Apr 2026 01:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776216057; cv=none; b=SvJwnLci+FCYelpi809U49uPgXwMCroX5JBW67XCZjOs03tkUV1XRYJZR48IlSQ5UlZFmde8Y++hH5ELNF1/RUqnP5269UNLe2/ySxYCFqcnblArhBB9VgS1p89tu+S/3CwBwxjYBQSb53cA/GuuZYl0IDxkEI2RW4KN/0T99V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776216057; c=relaxed/simple;
	bh=/73a6Fauu1hEXPiMbtwap5gMqcffhpJAS00bzrE8afg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgbkUjnSB6ODgfMmYDLEDQEpwN8U1l50oOm5C4vW7n8VIZo5YheDWFyKTvJQf28jfTZTEnkzsSZD24Y6bDiZxT2P4gFz1LlBI9mofCnMkDGtjF9UWb8m0VjlZD6XdAxwxfAlxfr6WMFnWm58XauaAbIlRppo1LbHDJBqotb4kLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPy6geJV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE52C19425;
	Wed, 15 Apr 2026 01:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776216056;
	bh=/73a6Fauu1hEXPiMbtwap5gMqcffhpJAS00bzrE8afg=;
	h=From:To:Cc:Subject:Date:From;
	b=oPy6geJV/ZHcgYgvAer8Ya5yKvPgZpm82wb4uqkM8lofq/CbDh6mcjnSalolMex7n
	 PHC0xCJQn9O/rXx/6JTyW8BG2m3wuB6pOBIUZTvfOJzYqLjyY4WvE5MyEKftMrNw8q
	 ady5yDxKOulIcFGxzXWt3kVbv+h7G6ejvUeIrwVdXiyyGu6bdtpK7DoshDOLlJtI/A
	 Yd25okJYBOeZiosBAyEEuSqoiMiUIAUSW+UWxkNneK+yD0wGaVvckUR7+z2Jzc22Qd
	 sxEsOwtPKL4kZyBon4M5lwIoU9d9mYyst9r382UrADOf/qHsM7cqDM/CObHK0VnnlT
	 DsN2Lt/LkN22g==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 0/7] mm/damon/reclaim,lru_sort: monitor all system rams by default
Date: Tue, 14 Apr 2026 18:20:28 -0700
Message-ID: <20260415012048.76508-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83427-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB3A83FF78B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DAMON_RECLAIM and DAMON_LRU_SORT set the biggest 'System RAM' resource
of the system as the default monitoring target address range.  The main
intention behind the design is to minimize the overhead coming from
monitoring of non-System RAM areas.

This could result in an odd setup when there are multiple discrete
System RAMs of considerable sizes.  For example, there are System RAMs
each having 500 GiB size.  In this case, only the first 500 GiB will be
set as the monitoring region by default.  This is particularly common on
NUMA systems.  Hence the modules allow users to set the monitoring
target address range using the module parameters if the default setup
doesn't work for them.  In other words, the current design trades ease
of setup for lower overhead.

However, because DAMON utilizes the sampling based access check and the
adaptive regions adjustment mechanisms, the overhead from the monitoring
of non-System RAM areas should be negligible in most setups.  Meanwhile,
the setup complexity is causing real headaches for users who need to run
those modules on various types of systems.  That is, the current
tradeoff is not a good deal.

Set the physical address range that can cover all System RAM areas of
the system as the default monitoring regions for DAMON_RECLAIM and
DAMON_LRU_SORT.

Technically speaking, this is changing documented behavior.  However, it
makes no sense to believe there is a real use case that really depends
on the old weird default behavior.  If the old default behavior was
working for them in the reasonable way, this change will only add a
negligible amount of monitoring overhead.  If it didn't work, the users
may already be using manual monitoring regions setup, and they will not
be affected by this change.

Patches Sequence
================

Patch 1 introduces a new core function that will be used for the new
default monitoring target region setup.  Patch 2 and 3 update
DAMON_RECLAIM and DAMON_LRU_SORT to use the new function instead of the
old one, respectively.  Patch 4 removes the old core function that was
replaced by the new one, as there is no more user of it.  Patch 5
updates DAMON_STAT to use the new one instead of its in-house
nearly-duplicate self implementation of the functionality.  Finally
patches 6 and 7 update the DAMON_RECLAIM and DAMON_LRU_SORT user
documentation for the new behaviors, respectively.

SeongJae Park (7):
  mm/damon: introduce damon_set_region_system_rams_default()
  mm/damon/reclaim: cover all system rams
  mm/damon/lru_sort: cover all system rams
  mm/damon/core: remove damon_set_region_biggest_system_ram_default()
  mm/damon/stat: use damon_set_region_system_rams_default()
  Docs/admin-guide/mm/damon/reclaim: update for entire memory monitoring
  Docs/admin-guide/mm/damon/lru_sort: update for entire memory
    monitoring

 .../admin-guide/mm/damon/lru_sort.rst         |  6 ++-
 .../admin-guide/mm/damon/reclaim.rst          |  6 ++-
 include/linux/damon.h                         |  2 +-
 mm/damon/core.c                               | 49 +++++++++--------
 mm/damon/lru_sort.c                           |  8 +--
 mm/damon/reclaim.c                            | 14 ++---
 mm/damon/stat.c                               | 53 ++-----------------
 7 files changed, 50 insertions(+), 88 deletions(-)


base-commit: 11bcd10460e9446785fc04deb5d175806a00400b
-- 
2.47.3

