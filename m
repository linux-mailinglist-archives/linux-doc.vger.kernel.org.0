Return-Path: <linux-doc+bounces-83303-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMx3JT/I3WmwjAkAu9opvQ
	(envelope-from <linux-doc+bounces-83303-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 06:53:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E4F3F58B5
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 06:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC94330523CF
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 04:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AB32FF176;
	Tue, 14 Apr 2026 04:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5JKgRLR"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD2B2FD1CA;
	Tue, 14 Apr 2026 04:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142379; cv=none; b=kRp5GDgLyvtRK190yv/O0UlfDO8fhCE/Hd5Ja6gxiH9r1g20/P1fKFvgzfzLMAmW5coREt+it4MCdIYUm+V/xZcFjFy2fTl/y25L6eiHjE11F24BYaWnMeqng3cXk0ly/tgY4chDxixUEicojV3TUeEU1QyLWA1rvfoyVT2sdjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142379; c=relaxed/simple;
	bh=BfEEDyBrJIkd6+k5rVK7zBS2eb2FwO/Rw5l0AYJHr24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JzYzKCX7SF5gmcE1ewGaU0U03vQ4v09PjhBPaJi+ULTeYbUFwNjL8ZSmAe+YHIPnw00FH54y7F9kkbNA3RgG0fJsKzUSi/7TD0rOF+SAwtz+GrK8SvZMlgyxx2qRKkllxtS12wdqG+OOWWDKatJSTsItepvOhklPMkuUyX7q5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5JKgRLR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F5BC19425;
	Tue, 14 Apr 2026 04:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776142379;
	bh=BfEEDyBrJIkd6+k5rVK7zBS2eb2FwO/Rw5l0AYJHr24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V5JKgRLRaK3TD/B3m5VhTQVcUENur1AMCIFZLkTVFmPS3sDwrdzLFRGQaEUFr4Umg
	 2dWFhSKCobfoSt1PEVryBL9RbBKWAFpcHjfU5uNI5jm85OyDj42RDOhbYjkJ3fplr7
	 iLbmb9phIs3VYY039eGwFOUYb53+JCLF06JToEf6Q1bwhw8XjfvQKZYGqJxo7ocCJY
	 qIdTxinBXRflpf+dAE4FG06nab3iXavRwuZz4qZpA+MhIbrIyL8ZLDZpV3Uy1m07i9
	 da4a+J9BRroAPQYrUicrAHjAYL7ffsEu8BBVkixKWf6Lz9h/wOpn/mhgAtYrLPbgB0
	 jXbP4R7oA/nSw==
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
Subject: [RFC PATCH 2/2] Docs/admin-guide/mm/damon/reclaim: update for autotune_monitoring_intervals
Date: Mon, 13 Apr 2026 21:52:51 -0700
Message-ID: <20260414045253.88529-3-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414045253.88529-1-sj@kernel.org>
References: <20260414045253.88529-1-sj@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83303-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 41E4F3F58B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update DAMON_RECLAIM usage document for the newly added monitoring
intervals auto-tuning enablement parameter.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/reclaim.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index 01a34c215b66f..b14a065586271 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -85,6 +85,17 @@ identifies the region as cold, and reclaims it.
 
 120 seconds by default.
 
+autotune_monitoring_intervals
+-----------------------------
+
+If this parameter is set as ``Y``, DAMON_RECLAIM automatically tunes DAMON's
+sampling and aggregation intervals.  The auto-tuning aims to capture meaningful
+amount of access events in each DAMON-snapshot, while keeping the sampling
+interval 5 milliseconds in minimum, and 10 seconds in maximum.  Setting this as
+``N`` disables the auto-tuning.
+
+Disabled by default.
+
 quota_ms
 --------
 
-- 
2.47.3

