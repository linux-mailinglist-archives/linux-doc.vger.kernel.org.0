Return-Path: <linux-doc+bounces-85448-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1rf+LeBb9WmgKgIAu9opvQ
	(envelope-from <linux-doc+bounces-85448-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 02 May 2026 04:05:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 172514B0A08
	for <lists+linux-doc@lfdr.de>; Sat, 02 May 2026 04:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AA683017C12
	for <lists+linux-doc@lfdr.de>; Sat,  2 May 2026 02:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9008E20C00C;
	Sat,  2 May 2026 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osX1ugss"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9E118C2C;
	Sat,  2 May 2026 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777687515; cv=none; b=fS9Rn6Z58ZaA4+RXHf6nqB7qd+orOnOjhyiySFUapd7dJP5nChOb2nL2IjdgmVlb5NRFtX1vWwF2udXEwVErCKwJ1g2XMTAZLJ/ZgSAm4wvHDoGom1Lb81az3T9rBmk+cRF8gMAMQWGf751A2oB4iY4V9zq3BsD2FwTWJI8vn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777687515; c=relaxed/simple;
	bh=fB1OcL3ViFGZJkDKi9eqU2TPDeF3kgjENu7ZrO+s+Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ll1SG+gfPany130qsIj455QSTEHu47J8le/N1Pvtd/iuDla7/zQR/CnMkB1VSC0lnKA2aE6uEtD2RN8H6NOz6NGZ+P+LAZSJ5XFq0IKswR7WeZzNd6VB13cg0tcoEo/DsgEW26ml93JJYPEJc4Bz3x7avwB3M512X4pGb4MXw+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osX1ugss; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6190AC2BCB4;
	Sat,  2 May 2026 02:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777687515;
	bh=fB1OcL3ViFGZJkDKi9eqU2TPDeF3kgjENu7ZrO+s+Pw=;
	h=From:To:Cc:Subject:Date:From;
	b=osX1ugssVOVSVakmAnzjJ/AYdjcwM6kU+ht+by/Scg/ZCIvcCi7GH7XXWkpICn0CL
	 QJwcKW4i7QRz4bhrRZtB5Oy1xgjRvNIZGHem63fFTDXpigZFSBL8BgXkT7AcjZCP1u
	 Uljw/JXYvTleDEDeqAeduMkhRR1N7pAYTdBJxzsQMs3le++zQ0h+oIx9hYDpgkxlbm
	 AwCrVFtXzNas/mQzlpiiO3vZD5KM2l0/tqbKYKNGnhPK+t3J0rAQQwVobvovhJfTv6
	 qbrlflMp5PdnjfC1gZvu9YFXMqR/WrU76HlBo0U5U7mAC5fQJtWeo5EIJKGSnSXeG1
	 AS6pfezDKcVaQ==
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
Subject: [PATCH 0/2] mm/damon/stat: add kdamond_pid parameter
Date: Fri,  1 May 2026 19:05:02 -0700
Message-ID: <20260502020505.80822-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 172514B0A08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85448-lists,linux-doc=lfdr.de];
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

DAMON_STAT doesn't provide the pid of its kdamond, unlike DAMON_RECLAIM
and DAMON_LRU_SORT.  This makes user-space management of DAMON_STAT
unnecessarily complicated.  Provide the information via a new parameter,
namely kdamond_pid, and document it.

Changes from RFC v2.1
- v2.1: https://lore.kernel.org/20260430142013.80993-1-sj@kernel.org
- Add parameter description.
- Rebase to latest mm-new.
Changes from RFC v2
- v2: https://lore.kernel.org/20260425203309.108879-1-sj@kernel.org
- Rebase to latest mm-new.
Changes from RFC v1.2
- rfc v1.2: https://lore.kernel.org/20260416002149.87090-1-sj@kernel.org
- Detect and use fresh kdamond pid.
Changes from RFC v1.1
- rfc v1.1: https://lore.kernel.org/20260414235912.98174-1-sj@kernel.org
- Close the parentheses of error handling block.
Changes from RFC
- rfc: https://lore.kernel.org/20260414053742.90296-1-sj@kernel.org
- Fix damon_kdamond_pid() failure handling.

SeongJae Park (2):
  mm/damon/stat: add a parameter for reading kdamond pid
  Docs/admin-guide/mm/damon/stat: document kdamond_pid parameter

 Documentation/admin-guide/mm/damon/stat.rst |  7 ++++
 mm/damon/stat.c                             | 39 +++++++++++++++++++++
 2 files changed, 46 insertions(+)


base-commit: c9d6cc2ef4bef0a86002460ee8c39a1c76b3f1f7
-- 
2.47.3

