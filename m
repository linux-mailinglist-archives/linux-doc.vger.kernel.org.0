Return-Path: <linux-doc+bounces-83139-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIQCJTvG22lHGgkAu9opvQ
	(envelope-from <linux-doc+bounces-83139-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Apr 2026 18:20:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F523E4B57
	for <lists+linux-doc@lfdr.de>; Sun, 12 Apr 2026 18:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E40493004F2C
	for <lists+linux-doc@lfdr.de>; Sun, 12 Apr 2026 16:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136F5285050;
	Sun, 12 Apr 2026 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaBgWyNs"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41462F1FC7;
	Sun, 12 Apr 2026 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010804; cv=none; b=B/0GKh6XwcHWbm9XjiRhzST3VmLBuJ77NNs6JT70VfEf8ib3gRsM6CFohIa32y0tRtxkHkOTCtbsm9aHhPnicuG8t4Jjhsj8p9pVXGmO+NGHcMZ8aPeS1cf4VSRt3f5m9egM0TUCJwCoyM8UGe4kUGvKErL4C4FlKhOFODM8ZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010804; c=relaxed/simple;
	bh=x42u0yyujS0MNNJ5zIzlJ5WzcqjchBB5xjDhcoIlpNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGIeRRBGMLDNiydWs1FidVmLhVhpmghPs8TXNcNIdynojXUYti5O6Akh1C5JyG+uaN2hqVbp7F5euGUWkdTgk2fMaIPUjhcbbvSFzTNdZtdSIxbOYT79IbmztA8P9eie0bT/JnlsZG5FXMAOrU0aeadFTjLnkufbPDTSNwUg1A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaBgWyNs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40374C2BCB0;
	Sun, 12 Apr 2026 16:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776010803;
	bh=x42u0yyujS0MNNJ5zIzlJ5WzcqjchBB5xjDhcoIlpNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AaBgWyNs0nJ4v872EAZLuHaG0uWbUqGvdCTMDz0tlV8ECu0fvS1XnSqClMa706SpE
	 1cR0AWCe0uig23iWzz2L20aqpH5+1z6OIbv3sfdNHaEkL/V/0R3lsWcLAq1EqLXA5x
	 sour1JLGYxaOHd3Vd8IE23KNf7XjfXdSr7LibcwEaK2p48Aq9ZD7SER0DL14Cpz8EZ
	 UbMq+K0aCzQGGAsvyXFP5nf3X8CjMyVMGayNQBxfo7BetPG1VGWYJpGayNfOzPbwba
	 6VdMzOYS9oEx9bQ4nsP/lgQ2os9Yf0XvTHymFcDpOP3Q43EhUNFoURtYTt/TUik8zP
	 XEwX/G9+ult1A==
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
Subject: [RFC PATCH v5.2 05/11] Docs/mm/damon/design: document fail_charge_{num,denom}
Date: Sun, 12 Apr 2026 09:19:48 -0700
Message-ID: <20260412161957.82835-6-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260412161957.82835-1-sj@kernel.org>
References: <20260412161957.82835-1-sj@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83139-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 35F523E4B57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update DAMON design document for the DAMOS action failed region quota
charge ratio.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 622d24e35961e..fa7392b5a331d 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -576,6 +576,28 @@ interface <sysfs_interface>`, refer to :ref:`weights <sysfs_quotas>` part of
 the documentation.
 
 
+.. _damon_design_damos_quotas_failed_memory_charging_ratio:
+
+Action-failed Memory Charging Ratio
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+DAMOS action to a given region can fail for some subsets of the memory of the
+region.  For example, if the action is ``pageout`` and the region has some
+unreclaimable pages, applying the action to the pages will fail.  The amount of
+system resource that is taken for such failed action applications is usually
+different from that for successful action applications.  For such cases, users
+can set different charging ratio for such failed memory.  The ratio can be
+specified using ``fail_charge_num`` and ``fail_charge_denom`` parameters.  The
+two parameters represent the numerator and denominator of the ratio.  The
+feature is enabled only if ``fail_charge_denom`` is not zero.
+
+For example, let's suppose a DAMOS action is applied to a region of 1,000 MiB
+size.  The action is successfully applied to only 700 MiB of the region.
+``fail_charge_num`` and ``fail_charge_denom`` are set to ``1`` and ``1024``,
+respectively.  Then only 700 MiB and 300 KiB of size (``700 MiB + 300 MiB * 1 /
+1024``) will be charged.
+
+
 .. _damon_design_damos_quotas_auto_tuning:
 
 Aim-oriented Feedback-driven Auto-tuning
-- 
2.47.3

