Return-Path: <linux-doc+bounces-75887-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJSHNgVyjWn42gAAu9opvQ
	(envelope-from <linux-doc+bounces-75887-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 07:24:05 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF3612A93E
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 07:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D7DA301DAB6
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 06:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6174D29BDBD;
	Thu, 12 Feb 2026 06:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="By3XEsyI"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9EC29BDA1;
	Thu, 12 Feb 2026 06:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770877409; cv=none; b=JOwUcV1slSBOVo2n+EuKDFPnXDFxXhLd14/g8NBO4gAhdwUquPF826QSaNYLc0oHpzsSIQKwdmggNU4MKIMbLFac7AYBGUlhod51vsvYRPR2MmsVBHhRmMkTf7vw/qGlP6a2YTZDUBgId96P5DksbbAYM0Ij0Kp/rLNFg1m01pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770877409; c=relaxed/simple;
	bh=3t+rELlNfEbmM15iobjCBnl0Dkhx8Jvwm7r3C6rWDgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YW8LJ0MKy5UKcfItV/NNd6vJI1TXJ/w8e36+owV3lxtI/RJpotok+ofBUE0PF8bvkucdv1S6BHFHbK3xUPa6SrDBevcO1S6njwhXdwwolGEB3vcKBWa0awCEGSVN1osDuxi1HYk6BcgEzX+4JHwAWmMJgAuFI+g03eRChMZYaOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=By3XEsyI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DAEC2BCB3;
	Thu, 12 Feb 2026 06:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770877409;
	bh=3t+rELlNfEbmM15iobjCBnl0Dkhx8Jvwm7r3C6rWDgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=By3XEsyIi/Qy6nLUNYymsrk5jw7Stkt1Yl3jZB1f26MwD46tQGrjfM7FkdJtkPswR
	 0msE43fqVBh5RAZbXopyhrOTtsK+C8+/BQFw/7lVJ9rWBkkf48I/ftZlkOloBNN+du
	 NSTFrCC8Ugk1aPQ3EvIzYHHOM+PxbRuDtxGz2K3TqWmsyg4Yt0z0/00tzFWt8FiOCN
	 EE380K0XQBx+Cp1ihSYpQhWm6EuaK0EoKODa1o/BVpKtuhKwxNd3sQs1gHsSpmEBdT
	 mgklbX9OG70ow5ae4xVgEoVQ51dv+fyL1KPUYCpIbA6ZUYWsl9hHdN7Xnjk4ECyfdn
	 8lZBW+IJAF5/A==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 5/5] Docs/admin-guide/mm/damon/usage: document goal_tuner sysfs file
Date: Wed, 11 Feb 2026 22:23:12 -0800
Message-ID: <20260212062314.69961-6-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212062314.69961-1-sj@kernel.org>
References: <20260212062314.69961-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75887-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EF3612A93E
X-Rspamd-Action: no action

Update the DAMON usage document for the new sysfs file for the goal
based quota auto-tuning, 'goal_tuner'.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index b0f3969b6b3b1..534e1199cf091 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -83,7 +83,7 @@ comma (",").
     │ │ │ │ │ │ │ │ sz/min,max
     │ │ │ │ │ │ │ │ nr_accesses/min,max
     │ │ │ │ │ │ │ │ age/min,max
-    │ │ │ │ │ │ │ :ref:`quotas <sysfs_quotas>`/ms,bytes,reset_interval_ms,effective_bytes
+    │ │ │ │ │ │ │ :ref:`quotas <sysfs_quotas>`/ms,bytes,reset_interval_ms,effective_bytes,goal_tuner
     │ │ │ │ │ │ │ │ weights/sz_permil,nr_accesses_permil,age_permil
     │ │ │ │ │ │ │ │ :ref:`goals <sysfs_schemes_quota_goals>`/nr_goals
     │ │ │ │ │ │ │ │ │ 0/target_metric,target_value,current_value,nid,path
@@ -377,9 +377,9 @@ schemes/<N>/quotas/
 The directory for the :ref:`quotas <damon_design_damos_quotas>` of the given
 DAMON-based operation scheme.
 
-Under ``quotas`` directory, four files (``ms``, ``bytes``,
-``reset_interval_ms``, ``effective_bytes``) and two directories (``weights`` and
-``goals``) exist.
+Under ``quotas`` directory, five files (``ms``, ``bytes``,
+``reset_interval_ms``, ``effective_bytes`` and ``goal_tuner``) and two
+directories (``weights`` and ``goals``) exist.
 
 You can set the ``time quota`` in milliseconds, ``size quota`` in bytes, and
 ``reset interval`` in milliseconds by writing the values to the three files,
@@ -390,6 +390,14 @@ apply the action to only up to ``bytes`` bytes of memory regions within the
 quota limits unless at least one :ref:`goal <sysfs_schemes_quota_goals>` is
 set.
 
+You can set the goal-based effective quota auto-tuning algorithm to use, by
+writing the algorithm name to ``goal_tuner`` file.  Reading the file returns
+the currently selected tuner algorithm.  Refer to the design documentation of
+:ref:`automatic quota tuning goals <damon_design_damos_quotas_auto_tuning>` for
+the background design of the feature and the name of the selectable algorithms.
+Refer to :ref:`goals directory <sysfs_schemes_quota_goals>` for the goals
+setup.
+
 The time quota is internally transformed to a size quota.  Between the
 transformed size quota and user-specified size quota, smaller one is applied.
 Based on the user-specified :ref:`goal <sysfs_schemes_quota_goals>`, the
-- 
2.47.3

