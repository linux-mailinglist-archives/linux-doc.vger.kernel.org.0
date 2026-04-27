Return-Path: <linux-doc+bounces-84790-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHF+GY1+72mXBwEAu9opvQ
	(envelope-from <linux-doc+bounces-84790-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 17:19:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F904750C2
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 17:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6421633A4246
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B577334C1D;
	Mon, 27 Apr 2026 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gv4wDjq8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69C3346AF;
	Mon, 27 Apr 2026 15:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302762; cv=none; b=Tz958GkeM37LumQSGsw8AaXYC/6VfQyN7oEOIwbaso6H2V4E38/+hgeqwQylAOOGyJjqikGlHtdROzI49p/Lsq5n0W8EXB1YZHZRWvzb58lidzfPmzxxKYYgdDjeGI2Izcols6V3VQ0oiQ245/aBUO5XZGhsErbJJHG6kwO+Kks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302762; c=relaxed/simple;
	bh=O8n0uNGYuU+EcM7S/clzxsj2TzvWbNFjQtjX/Z2/CrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/J8TXKUyRAhSuqsg78Iqw04/bIf6IJfDXWAPgkR+Ud+mtG6DPff5IfxR7rMk8M8nmV0Ok0dGHyzzjS7QfsBN8ZKQWcsel0fJcMStZXt8fBJmbOxr72zspS0LocmS0FtHeSH5yXBZoVwXdttXI0AOEpnZHKWBa3x+GJkkcy9RmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gv4wDjq8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A77CC2BCC4;
	Mon, 27 Apr 2026 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777302762;
	bh=O8n0uNGYuU+EcM7S/clzxsj2TzvWbNFjQtjX/Z2/CrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gv4wDjq8pC8MRYUp9YxDIQ9gWsfPychqKhZZqC5yjyusZ6ff9VMKcopk44UjgHSF6
	 mBCIXP78F9f2D7tsQVdhGGPTRaa/iOMW3SZfLCvJyoopRxkoltdEG16ODitiwn8qI8
	 BrhwdyUyT+otrpYI9SUcTRtOFQ74srhH8d8tB7DCuR2JdcU4/pxF+ly3HDWSketLZs
	 lHbPouUda6elQAGc49DFl1f7oE6mbs2pAHv7wBB9jKpBCXmo6fD+rUiIzPAtSxkaPV
	 qfyffWXOuvTaWY6L40CekFRFO4BdLMMnj/fLugA4VmYfdgFSJh3YsU7sjynUwQm3iz
	 4KP0klz1+ZQHA==
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
Subject: [PATCH v2 04/10] Docs/admin-guide/mm/damon/usage: update for pause file
Date: Mon, 27 Apr 2026 08:12:23 -0700
Message-ID: <20260427151231.113429-5-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427151231.113429-1-sj@kernel.org>
References: <20260427151231.113429-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C8F904750C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84790-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Update DAMON usage document for the DAMON context execution pause/resume
feature.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 534e1199cf091..bfdb717441f05 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -66,7 +66,8 @@ comma (",").
     │ :ref:`kdamonds <sysfs_kdamonds>`/nr_kdamonds
     │ │ :ref:`0 <sysfs_kdamond>`/state,pid,refresh_ms
     │ │ │ :ref:`contexts <sysfs_contexts>`/nr_contexts
-    │ │ │ │ :ref:`0 <sysfs_context>`/avail_operations,operations,addr_unit
+    │ │ │ │ :ref:`0 <sysfs_context>`/avail_operations,operations,addr_unit,
+    │ │ │ │   pause
     │ │ │ │ │ :ref:`monitoring_attrs <sysfs_monitoring_attrs>`/
     │ │ │ │ │ │ intervals/sample_us,aggr_us,update_us
     │ │ │ │ │ │ │ intervals_goal/access_bp,aggrs,min_sample_us,max_sample_us
@@ -194,9 +195,9 @@ details).  At the moment, only one context per kdamond is supported, so only
 contexts/<N>/
 -------------
 
-In each context directory, three files (``avail_operations``, ``operations``
-and ``addr_unit``) and three directories (``monitoring_attrs``, ``targets``,
-and ``schemes``) exist.
+In each context directory, four files (``avail_operations``, ``operations``,
+``addr_unit`` and ``pause``) and three directories (``monitoring_attrs``,
+``targets``, and ``schemes``) exist.
 
 DAMON supports multiple types of :ref:`monitoring operations
 <damon_design_configurable_operations_set>`, including those for virtual address
@@ -214,6 +215,9 @@ reading from the ``operations`` file.
 ``addr_unit`` file is for setting and getting the :ref:`address unit
 <damon_design_addr_unit>` parameter of the operations set.
 
+``pause`` file is for setting and getting the :ref:`pause request
+<damon_design_execution_model_and_data_structures>` parameter of the context.
+
 .. _sysfs_monitoring_attrs:
 
 contexts/<N>/monitoring_attrs/
-- 
2.47.3

