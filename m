Return-Path: <linux-doc+bounces-83549-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mip9Aqwr4GmldAAAu9opvQ
	(envelope-from <linux-doc+bounces-83549-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 02:22:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09753409330
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 02:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4DFE309B9B4
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 00:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE39614F112;
	Thu, 16 Apr 2026 00:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XO0LzLDc"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D322083;
	Thu, 16 Apr 2026 00:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776298919; cv=none; b=AgSANc5niaukv4BAUgfIkQM2hAFxOg7POrLij6l1UYy26orLBvNciRkHnzcZvtRIAF//SiNngmfRCzzMuJSJo4jgimjuAejh0LwRbJbU6X4UPOzK9N2+1RBsdLVeriNwoSTfSsKq5YYMf5RNCETlwbmmvE66FDxwVK8DtZGwQsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776298919; c=relaxed/simple;
	bh=4aCM2a3NrSe0b28zTKT01qVpGH9mP8AJfok0bnI/F04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OCHYkei0TJOgCbbuKY7cHj246uA+NKRN1ZsfpJF8A0UYYmMw474AQKO4K679Mck5rvbWa++9Bevh7eBLgT7Hq0E0UmMr4EcPdGB8l8TBNm6nLLhkq2YIWv0xDIACU4W9KEOsEh551CzJspxiVlfm/zlvOhW+m3GQzlAbtECbXFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XO0LzLDc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21B1C19424;
	Thu, 16 Apr 2026 00:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776298919;
	bh=4aCM2a3NrSe0b28zTKT01qVpGH9mP8AJfok0bnI/F04=;
	h=From:To:Cc:Subject:Date:From;
	b=XO0LzLDcbkq3gAmnsRuFTrN6VyKXKAFpBnpTwRQbzmvo+RxFbLxgdiTFJcKihAXob
	 m+TzjKNcfu24qbPZhOLSz/IV3EXPCSMqxY6RVMErTfvdT868Y8sHM33hqTY7ixMiaN
	 wbfIQ9iy9vAii4YKsjxF7xl7j0oJcX4yKNw8nQbLeaXDRG4wdfb2wmQIuQtS1V1llm
	 u39MDqgpU/srdv6eiKz1q1cmiwOWIXgUdjCaMONwhHsaofOCPmQcWa7qBk1fqvqXsz
	 WiQy3JgQUCxbdZHSYoUE7nXnmUk7MAACNpdIjkEwrSeNCUb+yocWjrwm3J64+gEAwF
	 usdS4+iN0VnYg==
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
Subject: [RFC PATCH v1.2 0/2] mm/damon/stat: add kdamond_pid parameter
Date: Wed, 15 Apr 2026 17:21:45 -0700
Message-ID: <20260416002149.87090-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83549-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 09753409330
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DAMON_STAT doesn't provide the pid of its kdamond, unlike DAMON_RECLAIM
and DAMON_LRU_SORT.  This makes user-space management of DAMON_STAT
unnecessarily complicated.  Provide the information via a new parameter,
namely kdamond_pid, and document it.

Changes from RFC v1.1
- rfc v1.1: https://lore.kernel.org/20260414235912.98174-1-sj@kernel.org
- Close the parentheses of error handling block.
Changes from RFC
- rfc: https://lore.kernel.org/20260414053742.90296-1-sj@kernel.org
- Fix damon_kdamond_pid() failure handling.

SeongJae Park (2):
  mm/damon/stat: add a parameter for reading kdamond pid
  Docs/admin-guide/mm/damon/stat: document kdamond_pid parameter

 Documentation/admin-guide/mm/damon/stat.rst |  7 +++++++
 mm/damon/stat.c                             | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+)


base-commit: bf44f59d29186d80db01e4124a8ab23b3b235b32
-- 
2.47.3

