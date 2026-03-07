Return-Path: <linux-doc+bounces-78335-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLXhEoqCrGkLqQEAu9opvQ
	(envelope-from <linux-doc+bounces-78335-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 07 Mar 2026 20:54:50 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C822D6B2
	for <lists+linux-doc@lfdr.de>; Sat, 07 Mar 2026 20:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E405D3034E0E
	for <lists+linux-doc@lfdr.de>; Sat,  7 Mar 2026 19:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2C93A7F44;
	Sat,  7 Mar 2026 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2QCmobp"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF33A7855;
	Sat,  7 Mar 2026 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772913248; cv=none; b=grXQ5SDKIBplFjn8ayYZlcTgVmeTlq2JbnYvVcovLz/tTVsifxdoM1eeMSVTpSH0piYdWWXD1nZ6QZgbyFsOyqLZcOyM+haM4pN6+DT05a4i9IgjYBVv6x5yPATZ0MdqkyDOiCWyFonLWA1gN8XSpyN5RYFq/ZTkgDYZ5o1bp+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772913248; c=relaxed/simple;
	bh=gLiv+pNotyPVa+VV/9QXIoANdJw8lI0sD1zcvN05ExA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVNHOnUAhX1GOSFeLgqbZg3m3X36GtmgmjmN/phr+frMk9r91kDj0rVhw13tHVZYw0Kt4F/MuXuozxCwYkjxExsmz5kLD28PFFVwPt6IW+aHbU6o2RWMYKE7Masl+BFezKdNKnUNQuuve9wv5G284fTBJvvOfIqR6eJ9Q45czAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2QCmobp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B7BC2BC9E;
	Sat,  7 Mar 2026 19:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772913248;
	bh=gLiv+pNotyPVa+VV/9QXIoANdJw8lI0sD1zcvN05ExA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m2QCmobpyIIHTNmOdBlq/087P28EA10hWT0WVhLHTwQ+diKNGEGwjcBnW/xlDvg3X
	 xeQcSDw+fDTq5VDVDtT8/frS9C+p1jdjmBrfN7SuBNVSoCf7tfxN0yCoJ0NynEVTx2
	 5BGYOl0P0lxD/vOe1gxfWpHXO7uoeS+L2DTD8DukjshY0vJYqbY3DPBBuU/2GVDGSw
	 YNInUZn4JASMbrYuB1ucXx2lb2OdRhoabXpweEnxkRxJJ4yQNhUUoe17ZwuSXPZIOH
	 +TsEkO53u8XEPwuYiXu/XeV0UJI5ht/pChFzCFXYDOXEsdNcadhkxEP0fCdDBSOHpt
	 U+YkFFtTlyY7w==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
	linux-mm@kvack.org,
	wang lian <lianux.mm@gmail.com>
Subject: [PATCH 5/7] Docs/admin-guide/mm/damn/lru_sort: fix intervals autotune parameter name
Date: Sat,  7 Mar 2026 11:53:53 -0800
Message-ID: <20260307195356.203753-6-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307195356.203753-1-sj@kernel.org>
References: <20260307195356.203753-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DA0C822D6B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,lwn.net,suse.com,linuxfoundation.org,google.com,lists.linux.dev,vger.kernel.org,kvack.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-78335-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The section name should be the same as the parameter name.  Fix it.

Fixes: ed581147a417 ("Docs/admin-guide/mm/damon/lru_sort: document intervals autotuning")
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/lru_sort.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index 20a8378d5a946..73980bacc3a02 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -91,8 +91,8 @@ increases and decreases the effective level of the quota aiming the LRU
 
 Disabled by default.
 
-Auto-tune monitoring intervals
-------------------------------
+autotune_monitoring_intervals
+-----------------------------
 
 If this parameter is set as ``Y``, DAMON_LRU_SORT automatically tunes DAMON's
 sampling and aggregation intervals.  The auto-tuning aims to capture meaningful
-- 
2.47.3

