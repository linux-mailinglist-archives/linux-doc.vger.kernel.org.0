Return-Path: <linux-doc+bounces-93632-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bS5NNhXFPWpo6QgAu9opvQ
	(envelope-from <linux-doc+bounces-93632-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 02:17:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4806C9407
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 02:17:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QnR1gZzR;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93632-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-93632-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AC28E3022882
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 00:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1962526E71F;
	Fri, 26 Jun 2026 00:17:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435625B087;
	Fri, 26 Jun 2026 00:16:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782433021; cv=none; b=gbYe8X6J+wAsMkxtAqHObzRtBzz2EmHjTQy7NdJw0fdZ6r3ptTlXSKOanN7xh2NzFO4uRfrQupzEJvcxdTHUbBMGdKmpn5IUKn5WgXDKu3MbEixxDdgWfl9vG7xNULYU/0p2IQy1tlJy7YuBSiBPfcPbQLte3X/fjRrNBfSUJEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782433021; c=relaxed/simple;
	bh=JtiCXAgV1NzVF6OXtSFqRwlXwQF3WJU35MlaHYuZCdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asob+rb4lXBfv3bI9He3qEjP7rZ/djSqZDe4eOig+B3P3zYusGW1ShLEEsXm+SaJ2Vo+JW/PGsRSaXgfvq1R4304EXktchFm4a20IS6F8Q55PuRrmApEfY2CeEmpJZpEJt6g7K4LGjqNmMmPVEwG+Alil7ZHEKQAK7xWjm4ZhPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnR1gZzR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A917A1F00A3A;
	Fri, 26 Jun 2026 00:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782433019;
	bh=pRKZafStRhOZUg4JkpnCijAYobhpC1LwOvV2Kj0cqgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QnR1gZzRhRPKnJAQ2r2PCT4CxE2aafs15g/Z2MBYLUx/poayWUtFh03IxNoZsUpnM
	 f2io6H6SIKaedqp/Y5aBZZrrpSpgNelqaMQ1ZeX5UmQn6/LuC8tl9ISObGYA3uMxqc
	 heuwrpPbH7q+yk/GZH3m+C2gg+3iTs3rQgli9ES1OhUF7CYJdyXzPaXO3Y9WBDMvBE
	 5icDCsNA3GGaXXRlMokCWRKyhi0iNTd+1G9gVPAlwyi+HLsERw5FRfZ7TGaQAdP5AC
	 g5T1cIGjNEdQCitrUIjzbh+rVADtX8fBq/b+JIs9jGGq76RtXaqmU5dOx+17jEOM1E
	 Z9ddFQvv26dYw==
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
Subject: [RFC PATCH v1.3 01/11] Docs/mm/damon/design: update for DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP
Date: Thu, 25 Jun 2026 17:16:32 -0700
Message-ID: <20260626001644.85825-2-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626001644.85825-1-sj@kernel.org>
References: <20260626001644.85825-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93632-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sj@kernel.org,m:liam@infradead.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:corbet@lwn.net,m:ljs@kernel.org,m:mhocko@suse.com,m:rppt@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:vbabka@kernel.org,m:damon@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE4806C9407

Commit 9138e27a3bc3 ("mm/damon: add node_eligible_mem_bp goal metric")
introduced DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP but forgot updating the
DAMON design document for that.  Update.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 2da7ca0d3d17a..f4efb51688853 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -686,9 +686,11 @@ mechanism tries to make ``current_value`` of ``target_metric`` be same to
   (1/10,000).
 - ``inactive_mem_bp``: Inactive to active + inactive (LRU) memory size ratio in
   bp (1/10,000).
+- ``node_eligible_mem_bp``: Scheme target access pattern-eligible memory ratio
+  of a node in bp (1/10,000).
 
-``nid`` is optionally required for only ``node_mem_used_bp``,
-``node_mem_free_bp``, ``node_memcg_used_bp`` and ``node_memcg_free_bp`` to
+``nid`` is optionally required for ``node_mem_used_bp``, ``node_mem_free_bp``,
+``node_memcg_used_bp``, ``node_memcg_free_bp`` and ``node_eligible_mem_bp`` to
 point the specific NUMA node.
 
 ``path`` is optionally required for only ``node_memcg_used_bp`` and
-- 
2.47.3

