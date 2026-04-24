Return-Path: <linux-doc+bounces-84495-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FNyJ7Z362kQNAAAu9opvQ
	(envelope-from <linux-doc+bounces-84495-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 16:01:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45D45FECD
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 16:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BC4C300A8E7
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 14:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F433DB64C;
	Fri, 24 Apr 2026 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF6mG7Dh"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB443C660C;
	Fri, 24 Apr 2026 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777039282; cv=none; b=ObW/S5wWC82xq/5N6VmH/UOQTmDWgmppMkfXdm+XDuhD4V3HSe83jUk7ONQKow2WvjHNHdEsDnoPu4v1z44K9ScPo4J6IGiHVSMLPjGCYRwWN31eYBU8wkWD8lwpdQuo9quxl+CV2KfVkziNjuTA1Fe+Gt7SASQ3fLaX06geg+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777039282; c=relaxed/simple;
	bh=DFy9AhLANCuPcMWrswbPLcW9ACoxuoxOoAiw0fx5Ep0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FKSH4lnAkFyYm1DW3Siak/HlD9quf2sAMkXndGyqVfHQai+MAxquqRv5zd8dVeu5/p+icyxvKfsfuRdSt3P8JqyoEwnJp8L8FNTngt30ZSZGc/lx6LrYXiKqz4+cAVAsCBbQ6L7xOZ2ZCOUnsWcQaVTNeEvVzS4UxE02hiTPCBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UF6mG7Dh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7DD6C19425;
	Fri, 24 Apr 2026 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777039282;
	bh=DFy9AhLANCuPcMWrswbPLcW9ACoxuoxOoAiw0fx5Ep0=;
	h=From:To:Cc:Subject:Date:From;
	b=UF6mG7DhKt9iEDmQyL15UPzJXX6xodvOiof8RN6zvJQjMYULbqq/STXmrcmxxVuEu
	 mRpC22v3aiBpQMAPb4Sq7yFL5Y4R5glujEtTCVG8mUYE2Trd3Pni513IFcAjMQnpNY
	 VJ603ahyjx/ABQoBZLGBTQRxhcc6x7qm7rh58j8a79h7aemfifLmrUs8L0a21jY0X0
	 q5TRr5ZN+740Q/jeBf1ZlPK9gQ8egsvjuxpJlH+oRiuBHB+vaKw1H1TxiHogGDetxR
	 R3FqPVK1eCeRB2LIgWMb0NOyUJXP6l/RGlE5V2ugWgb1rHPeQJzLst1sJPRPsG+M7G
	 wUL5HSVpKOzWg==
From: Sasha Levin <sashal@kernel.org>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [RFC 0/7] mm: dual-bitmap page allocator consistency checker
Date: Fri, 24 Apr 2026 10:00:49 -0400
Message-ID: <20260424140056.2094777-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0D45D45FECD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84495-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Existing memory debugging tools - KASAN, KFENCE, page_poisoning - detect
access violations and content corruption, but none of them can detect
silent corruption in the page allocator's own metadata. If a hardware
bit flip corrupts an allocation bitmap, the allocator hands out a page
that is already in use (or fails to hand out a free one), and nothing
in the kernel notices. This series adds a dual-bitmap consistency checker
that maintains the invariant primary == ~secondary across two independently
allocated bitmaps, so that any single-bit corruption in either bitmap is
immediately detectable. The approach is based on NVIDIA safety research.

Field studies consistently show that DRAM errors at scale are far more
common than textbook assumptions suggest, even with ECC. Schroeder et al.
(SIGMETRICS 2009) found 8% of DIMMs experienced errors per year in
Google's fleet; Sridharan and Liberty (SC 2012) reported similar rates
at LANL; Meta's 2021-2022 work documented silent data corruption at
scale, including memory-related faults. The critical property of
allocator metadata corruption is that it doesn't trigger an invalid
memory access - the corrupted data is structurally valid, just wrong.
KASAN instruments accesses, not metadata integrity, so it cannot see
this class of fault.

Functional safety is a different discipline from security that aims
to reduce the risk of hardware and software misbehaving to an
acceptable level. Security hardens against adversaries; safety hardens
against random hardware failures (cosmic rays, cell wear-out, thermal
noise) and systematic software failures (bugs). ISO 26262 (automotive
functional safety) defines four Automotive Safety Integrity Levels,
ASIL A through D. ASIL-D, the most stringent, is derived from the
severity of the hazard in case of failure. IEC 61508 defines similar
levels (SIL-1 through SIL-4) for industrial systems, and there are
equivalent standards for avionics and medical devices. ISO 26262
requires Freedom From Interference (FFI): a safety element must not
be corrupted by faults in other elements. For an OS kernel, this means
the memory allocator's metadata must either be immune to corruption or
corruption must be detected before it propagates. The dual-bitmap
implements a way to protect from corruption coming from hardware or
software - two complementary representations of page allocation state,
allocated independently via memblock, where any single-bit fault in
either bitmap is immediately detectable. Performance is secondary to
correctness in this context. A safety mechanism must be simple enough
to audit and certify, must fail deterministically (panic, not
log-and-hope), and its correctness matters more than its throughput.
The dual-bitmap adds two atomic bitops per alloc/free, but for
safety-critical deployments this cost is acceptable because the
alternative - undetected corruption propagating silently - violates
the system's safety case. The static key ensures zero cost for kernels
that don't need it.

The natural question is why not use page_ext. The key objection from a
safety perspective is that page_ext stores per-page metadata in memory
that is itself subject to the same hardware faults we're trying to
detect. The dual-bitmap approach works because the two bitmaps are
independent allocations - corruption in one is caught by comparison
with the other. Embedding both in page_ext means a single fault could
corrupt both the tracking data and its redundant copy in the same
allocation region. ISO 26262 recommends this approach for protecting
against hardware faults, but it also helps against software faults -
co-locating both bitmaps in page_ext violates this principle. Beyond
the safety argument, there are practical issues: page_ext adds
8-100+ bytes per page depending on enabled features while the
dual-bitmap uses 2 bits per page total, and page_ext initializes
after the buddy allocator while the checker must be active before
memblock_free_all() hands pages to buddy.

Sasha Levin (7):
  mm: add generic dual-bitmap consistency primitives
  mm: add page consistency checker header
  mm: add Kconfig options for page consistency checker
  mm: add page consistency checker implementation
  mm/page_alloc: integrate page consistency hooks
  Documentation/mm: add page consistency checker documentation
  mm/page_consistency: add KUnit tests for dual-bitmap primitives

 Documentation/mm/index.rst            |   1 +
 Documentation/mm/page_consistency.rst | 211 +++++++++++++++
 MAINTAINERS                           |  10 +
 include/linux/dual_bitmap.h           | 216 ++++++++++++++++
 include/linux/page_consistency.h      |  84 ++++++
 mm/Kconfig.debug                      |  59 +++++
 mm/Makefile                           |   2 +
 mm/mm_init.c                          |   9 +
 mm/page_alloc.c                       |   4 +
 mm/page_consistency.c                 | 360 ++++++++++++++++++++++++++
 mm/page_consistency_test.c            | 274 ++++++++++++++++++++
 11 files changed, 1230 insertions(+)
 create mode 100644 Documentation/mm/page_consistency.rst
 create mode 100644 include/linux/dual_bitmap.h
 create mode 100644 include/linux/page_consistency.h
 create mode 100644 mm/page_consistency.c
 create mode 100644 mm/page_consistency_test.c

-- 
2.53.0


