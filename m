Return-Path: <linux-doc+bounces-85388-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKMkLkP/82n99QEAu9opvQ
	(envelope-from <linux-doc+bounces-85388-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 03:17:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 287794A988D
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 03:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BF35301CA46
	for <lists+linux-doc@lfdr.de>; Fri,  1 May 2026 01:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8993F2C0296;
	Fri,  1 May 2026 01:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAB/R2m+"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66655241665;
	Fri,  1 May 2026 01:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777598270; cv=none; b=GN6gd9k8nxqpZjqow5c/+Dr0f/ZYa9COcwiovHFVn2YpLZ5rv/XgA22OyYz7RIe6kBx/Agg4PIgB6s9xyEL6c2yJONENbiqmHBcPFHBSX+PfD07qI7AZLRYloYYJDUtw31rZllMlnw7DCPAXwJMohMpb0T+ObcBxy3VJ2Xye9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777598270; c=relaxed/simple;
	bh=tYUxA/J6ODEDki9sQswRmgCKXcppBQ9ffFdDu47dDsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ak1//IEgxGE0m4p6b3KMphgWe2ORpRuLCDGErFN5qBbn47YhLamszN1n+OxXXLUQ2R5er2nF2lsBAMmiaX5EfGD/Ed/gnZHFPbhMYOYKYgYKxsSt0mdnuwakGxTb6ogrCK3Vz/Vmpf9a0xAAVIEWVhXfc9UxPovuggU+8JaUdkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAB/R2m+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448D9C2BCB8;
	Fri,  1 May 2026 01:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777598269;
	bh=tYUxA/J6ODEDki9sQswRmgCKXcppBQ9ffFdDu47dDsk=;
	h=From:To:Cc:Subject:Date:From;
	b=nAB/R2m+GcpomPGZxgZ0qGbow3/0nAACzWkLFUpzxNem0w5w0g7k8d6uTwzAzH31U
	 TUTxRSDTeMCLpEXWm9NteYKgEuzlJCm7qvPNCIZElptyDieDF0xsbpuHC5KOrqnplo
	 JtXb/ncvb+LFDTI5/PxnIuVLKSzck4ShQ+awAy2fT5PYcWIBTgTPzxxozo00m2a5ss
	 j/vzuOYHkvaVo4QnoMi5bkNpIKxezRacASGDQj5KTFf4BYNuts3ZiJtmckGrMxhph1
	 Rp+TXsp8PWgpDQcw+6G2oDJE2UcVenA+dxg7VyTYICtyZb1uQj9nrrylvC1v6UG3J8
	 lZDYom71HMGjw==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
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
Subject: [PATCH 0/2] mm/damon/reclaim: support monitoring intervals auto-tuning
Date: Thu, 30 Apr 2026 18:17:37 -0700
Message-ID: <20260501011740.81988-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 287794A988D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85388-lists,linux-doc=lfdr.de];
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

The monitoring intervals auto-tuning feature of DAMON has proven to be
useful in multiple environments.  Add a new DAMON_RECLAIM parameter for
supporting the feature, and update the document for the new parameter.

Changes from RFC
- rfc link: https://lore.kernel.org/20260414052855.90123-1-sj@kernel.org
- Add notes about behavioral changes that introduced by the auto-tuning.

SeongJae Park (2):
  mm/damon/reclaim: add autotune_monitoring_intervals parameter
  Docs/admin-guide/mm/damon/reclaim: update for
    autotune_monitoring_intervals

 .../admin-guide/mm/damon/reclaim.rst          | 11 +++++++
 mm/damon/reclaim.c                            | 33 ++++++++++++++++---
 2 files changed, 39 insertions(+), 5 deletions(-)


base-commit: 061bdca57aa1fc22d0f74a7c7bd35c7576194484
-- 
2.47.3

