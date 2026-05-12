Return-Path: <linux-doc+bounces-87140-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKnFKsE9A2po2AEAu9opvQ
	(envelope-from <linux-doc+bounces-87140-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:48:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6B9522E3A
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BE5E308C9F9
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 14:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC213CDBB7;
	Tue, 12 May 2026 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8bnVnRH"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDFF3CDBA3;
	Tue, 12 May 2026 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596629; cv=none; b=K7fjECWi3t2HvPk79ohgF7WOouytW7NSFEcjqopOeeLJYjJplqY/5J/EM6KfxfMLe87yAmQGU8QZNZAzk4Du/X+w0TslzAk0Om57i5fiT9Wy9dwY3YgjYg+ppb5RG1hVlWvsfMwGzJ+khD+Pv97/TvTzr1uicI4dCiqpb9zEV34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596629; c=relaxed/simple;
	bh=QiZyClLpM+jtGeAv4uUzZ2zYrmnjLH6QxsmmjjG7o5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QHQapYn/3l93rA/1zgXX1+rr8CakSvYL/fXnQI8E/Frr3KOPiJrgc3iPHuyPk6E67VUlIB1TeEDOTyTrGigTijjPC8PWQeqYdgKIEuApPIpXMaS+0zUy5nGp/7L2qod8ZfLEYoVWTdCwQ7DxnAoSewsigNc2/xO1W0axVmePuJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8bnVnRH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AA0C2BCF5;
	Tue, 12 May 2026 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778596629;
	bh=QiZyClLpM+jtGeAv4uUzZ2zYrmnjLH6QxsmmjjG7o5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j8bnVnRHe0oMq1ecjHuGJ5gFJ+0gNOQuH6/dC+xnhET/c6Y4OvlTL1PpRIpwqy2l9
	 jZcxe7i8FDDpWSHTHU1ZpMLpLw1MqE0PfoKmoLjMjWib6a9JZTgIaof48NUalaPccm
	 QgczXgD2MUURpkTcAFah3jxP2DxhEubA0B2E3UVbeZ3F/1PeHMvV4LFnAy/Elfw9wL
	 6itwvyNSOHyLF0m89hwrOMeyU3V5T06EZv0vdIz+T6lxsDCqNL+frXU/sDzXIgDhUd
	 mkkjT/jDJwg2G9crHdHrHhTeZSH0l27Xpwuxl+7OaayCoPnVN5QK0Cx3OFu1TglsDa
	 gahkHk+7+tg3g==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
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
Subject: [RFC PATCH v2 28/28] Docs/admin-guide/mm/damon/usage: update for memcg damon filter
Date: Tue, 12 May 2026 07:36:43 -0700
Message-ID: <20260512143645.113201-29-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512143645.113201-1-sj@kernel.org>
References: <20260512143645.113201-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4D6B9522E3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87140-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Update DAMON usage document for the newly added belonging memory cgroup
attribute monitoring feature.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 465bcdf89b182..84741b4cd1877 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -74,7 +74,7 @@ comma (",").
     │ │ │ │ │ │ nr_regions/min,max
     │ │ │ │ │ │ :ref:`probes <damon_usage_sysfs_probes>`/nr_probes
     │ │ │ │ │ │ │ 0/filters/nr_filters
-    │ │ │ │ │ │ │ │ │ 0/type,matching,allow
+    │ │ │ │ │ │ │ │ │ 0/type,matching,allow,path
     │ │ │ │ │ │ │ │ │ ...
     │ │ │ │ │ │ │ │ ...
     │ │ │ │ │ :ref:`targets <sysfs_targets>`/nr_targets
@@ -289,7 +289,9 @@ the data attribute for the probe.
 In the beginning, ``filters`` directory has only one file, ``nr_filters``.
 Writing a number (``N``) to the file creates the number of child directories
 named ``0`` to ``N-1``.  Each directory represents each filter and work in a
-way similar to that for :ref:`DAMOS filter <sysfs_filters>`.
+way similar to that for :ref:`DAMOS filter <sysfs_filters>`.  When the filter
+``type`` is ``memcg``, ``path`` file works the role of ``memcg_path`` for
+:ref:`DAMOS filter <sysfs_filters>`.
 
 .. _sysfs_targets:
 
-- 
2.47.3

