Return-Path: <linux-doc+bounces-78336-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCMfHaeCrGkLqQEAu9opvQ
	(envelope-from <linux-doc+bounces-78336-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 07 Mar 2026 20:55:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DC822D6C0
	for <lists+linux-doc@lfdr.de>; Sat, 07 Mar 2026 20:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25082301110F
	for <lists+linux-doc@lfdr.de>; Sat,  7 Mar 2026 19:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBFE3A7F74;
	Sat,  7 Mar 2026 19:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSOiYs1b"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77D3A7F6C;
	Sat,  7 Mar 2026 19:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772913249; cv=none; b=uv7YgIAloHyjIhKXQ+gM9Ef5Xj0C8WbxIr+vjN4EG+QvPWcUmp/bYpxc85uwUneXSPjONLLe5BRaop9CCRpLJpUW6AfVa+f9kfULxL3RY/bLcdplYfPlK7Hqn72oiZihIgWHgKnie72uBxfxl2/hgqOStRp3Wh02LOFUvqE5vng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772913249; c=relaxed/simple;
	bh=aXU5Q1Q+3FzifQR8qcbWlvPD8SNvGBDeL5AQyGi3NNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7/epfGRVzp/ZRsDXAxsktROO8m2U/bEpefv70w5FpUURnFaV4pnFGX/jfCHW7B3VKj2ZBFqmHQ8WhIjq8zbGu0Pft/FkbSKfeIUVKe/0cKRqcgM2aSjCfREgXmuWI7GXFbCmU/tYNW1M2FxTgcjICKiIcdqU/S85nMLCyjEwpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSOiYs1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B39C4AF10;
	Sat,  7 Mar 2026 19:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772913249;
	bh=aXU5Q1Q+3FzifQR8qcbWlvPD8SNvGBDeL5AQyGi3NNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FSOiYs1b2B/+nNgtIR8T1MYGu38lIX3TFEhAazL66ct1GCypCUfspGzVQbYE/HhCM
	 210DDt3yYiTv0sasfiK0pv62AHXnD1Mig/VY7E+ZHdh1DDAwyG4iPiXtragubZU6U+
	 2WBYCtG1FzeiQlBddfdwmOEiAmQJAhmTgBzcL6a/cCxI/dweD3ed5dLrJS/qgDWE7L
	 uA5fMuqQLjpt1hbDvQroNeVfEJn+R8iMcTpe0bZKLLU5iR3UX4jlOcNukNqe2wqO0P
	 3hw6VVXPsf1WfFd6//Ig+4bJeeHuWA2K4GGZuW4VXGnHDgIpF+dRN+ZrMg7rs5ZyGy
	 6QIEZEpiZkjPg==
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
	linux-mm@kvack.org
Subject: [PATCH 6/7] Docs/mm/damon/maintainer-profile: use flexible review cadence
Date: Sat,  7 Mar 2026 11:53:54 -0800
Message-ID: <20260307195356.203753-7-sj@kernel.org>
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
X-Rspamd-Queue-Id: C4DC822D6C0
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
	TAGGED_FROM(0.00)[bounces-78336-lists,linux-doc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The document mentions the maitainer is working in the usual 9-5 fashion.
The maintainer nowadays prefers working in a more flexible way.  Update
the document to avoid contributors having a wrong time expectation.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/maintainer-profile.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/mm/damon/maintainer-profile.rst b/Documentation/mm/damon/maintainer-profile.rst
index 41b1d73b9bd7b..bcb9798a27a86 100644
--- a/Documentation/mm/damon/maintainer-profile.rst
+++ b/Documentation/mm/damon/maintainer-profile.rst
@@ -63,10 +63,10 @@ management subsystem maintainer.
 Review cadence
 --------------
 
-The DAMON maintainer does the work on the usual work hour (09:00 to 17:00,
-Mon-Fri) in PT (Pacific Time).  The response to patches will occasionally be
-slow.  Do not hesitate to send a ping if you have not heard back within a week
-of sending a patch.
+The DAMON maintainer usually work in a flexible way, except early morning in PT
+(Pacific Time).  The response to patches will occasionally be slow.  Do not
+hesitate to send a ping if you have not heard back within a week of sending a
+patch.
 
 Mailing tool
 ------------
-- 
2.47.3

