Return-Path: <linux-doc+bounces-87567-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMSaBRVvBmqFjgIAu9opvQ
	(envelope-from <linux-doc+bounces-87567-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 02:55:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E27548398
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 02:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 522CD3069A04
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 00:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1423A393DE0;
	Fri, 15 May 2026 00:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JI+Vej+D"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911338A71F;
	Fri, 15 May 2026 00:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778805903; cv=none; b=Yv0FEBPsBOVhQZdVdUGPDem2RtDz0YP3lUEefinkeE97Kr4XNH545XjKxWF+2o43UorWrsPn7u5rSaxHoMeluJKjNona63kh92xvcxXOwqADZJ4ONO0fFpE34pAYpimCdWBoit6SwoCitamklZWiXZPc6QH1DW3FjUvg5FAsTUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778805903; c=relaxed/simple;
	bh=LEx5E5SgJygEjMgi4VHYllCFXk9l6r4yobescOGntDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RWq9xH6xSSrWyLYw9+SdXapAstsZuQDzbL1VWEE7uONhKpjhn/BxcKtJWXWfqND2g4fbpUMvTddjk59m0BaXr+dTx6Xb0zqBAMgEeueG3d9+1EzFUnilGxDpEXayIEKQuTsONmJypvvyjTjVlDDrWcuEeXUq3mw293xZ1U7j6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JI+Vej+D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2956C2BCC6;
	Fri, 15 May 2026 00:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778805899;
	bh=LEx5E5SgJygEjMgi4VHYllCFXk9l6r4yobescOGntDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JI+Vej+D8fLahEFPr51lI3LvaaaF5WKeKwE5btBoOfLx79LJ/X4uChsd/J2DrBdac
	 9fp89cFgm3xStfQXk6ks9Aa+OGsrGUinAN2+ZDogrYrY2QG+YYqwTY/FPHUJbYicvU
	 xpUWmC1yU0EIC7URteJ3sohuFH9LmXW/EXA5UMU7MB/bw80HQLINW2Oa2t4twoqQ6i
	 Y2+3cS3I5zlOltkXw7Cd72nAm7KOVNVfhqas0nnLQ9ZV4zhanDsx7xWo6swr5efb+U
	 vuVx9PhIwi7CGk/53DY3GMscbwRpgAcixzyHJLFFM+W/LNWpZtH5tIf+x/RES9D0HO
	 0DzyUA9yemGWQ==
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
Subject: [RFC PATCH v2.2 28/28] Docs/admin-guide/mm/damon/usage: update for memcg damon filter
Date: Thu, 14 May 2026 17:44:29 -0700
Message-ID: <20260515004433.128933-29-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515004433.128933-1-sj@kernel.org>
References: <20260515004433.128933-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 16E27548398
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87567-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Update DAMON usage document for the newly added belonging memory cgroup
attribute monitoring feature.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 44224da62533e..4b1d77f7175ab 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -73,7 +73,7 @@ comma (",").
     │ │ │ │ │ │ nr_regions/min,max
     │ │ │ │ │ │ :ref:`probes <damon_usage_sysfs_probes>`/nr_probes
     │ │ │ │ │ │ │ 0/filters/nr_filters
-    │ │ │ │ │ │ │ │ │ 0/type,matching,allow
+    │ │ │ │ │ │ │ │ │ 0/type,matching,allow,path
     │ │ │ │ │ │ │ │ │ ...
     │ │ │ │ │ │ │ │ ...
     │ │ │ │ │ :ref:`targets <sysfs_targets>`/nr_targets
@@ -283,7 +283,9 @@ the data attribute for the probe.
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

