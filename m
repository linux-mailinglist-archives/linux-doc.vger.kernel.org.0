Return-Path: <linux-doc+bounces-85166-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCwcI/0g8mm/oAEAu9opvQ
	(envelope-from <linux-doc+bounces-85166-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 17:17:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A59496AC5
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 17:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC5CF300250D
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 15:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E517367F48;
	Wed, 29 Apr 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ape4TI7d"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F6364943;
	Wed, 29 Apr 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777475000; cv=none; b=gD18eaxrFOKusGh3beK1epQbYnZ7XXRiNTnK7lcFiunZOLl8JykWw8SEADQ7+7SzLXNT72xUtk2LDtKWmgltyt7Urq+b3s7WmLWuajBF+/X2K0sfEFJoNjCc7mh3H881fzGMiRRdjEjmntidPG+o8JibJ6UrO0K9bOUkjVJYbrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777475000; c=relaxed/simple;
	bh=wHY7NZ09E2YAzVEs87LZ3Rdze2bK9PtC20hVAyMT/fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aXiU2UTaNChD4zh7ncJ510TZUXTy10yZzHTm4r7o/HHG3oTm+SGShPt3k6VNBUtBSwKagznC/1iYQ22EBVjcDL08xMhTSY5w8k/NQ5h9xLZB22rPUfJ2aS+KBg1FItsfuQZ2YyCyyhh6zpWyoaqUwYl4WPHHWzilAX1vZMM11k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ape4TI7d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF6EC19425;
	Wed, 29 Apr 2026 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777475000;
	bh=wHY7NZ09E2YAzVEs87LZ3Rdze2bK9PtC20hVAyMT/fE=;
	h=From:To:Cc:Subject:Date:From;
	b=ape4TI7dvLir+K3xFlQYl/KgbBgUzEQL3hP3X85XEpm/V92AN4y1fkJv1382y7kSu
	 DjlQcQkQBUzL+98SjF2DJ7pHZmg1CoCjBDsNDOyfPUsXFUaHb0DJDkHOrFrz3IEwta
	 NunRwOnns40QklKQ1QHzdKS8dQYWrM0b5RdVV+8J/UosmJUmYn1VC+RjadM5iU4pxU
	 ZzHv9KSXgvQykSV9QCNxSoqVQHERRepdFEUvF5aY+vzf1kSQoB9qVaZmsGZML1JMQE
	 d14iKo4UE2hyfU8chAD93vVrWETQQrV25fPVGjF9D5dmwUK9rVNPEnrMVs/5lvxC7O
	 BCV7SZzDUFZwQ==
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
Subject: [PATCH 0/2] mm/damon/sysfs: document filters/ directory as deprecated
Date: Wed, 29 Apr 2026 08:03:04 -0700
Message-ID: <20260429150309.82282-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A8A59496AC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85166-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Commit ab71d2d30121 ("mm/damon/sysfs-schemes: let
damon_sysfs_scheme_set_filters() be used for different named
directories") introduced alternatives of 'filters' directory, namely
core_filters/ and 'ops_filters/ directories.  Now the alternatives are
well stabilized and ready for all users.  All filters/ directory use
cases are expected to be able to be migrated to the alternatives.  An
LTS kernel having the alternatives, namely 6.18.y, is also released.
Existence of filters/ directory is only confusing.

It would be better not immediately removing the directory, though.
There could be users that need time before migrating to the
alternatives. There might be unexpected use cases that the alternatives
cannot support.  Doing the deprecation step by step across multiple
years like DAMON debugfs deprecation would be safer.  Start the
deprecation changes by announcing the deprecation on the documents.

Every year, one more action for completely removing the directory will
be followed, like DAMON debugfs deprecation did.  Following yearly
actions are currently expected.  In 2027, deprecation warning kernel
messages will be printed once, for use of filters/ directory.  In 2028,
filters/ directory will be renamed to filters_DEPRECATED/.  In 2029,
filters_DEPRECATED/ directory will be removed.

Changes from RFC
- rfc: https://lore.kernel.org/20260421044928.141388-1-sj@kernel.org
- Wordsmith deprecation notice.
- Rebase to latest mm-new.

SeongJae Park (2):
  Docs/admin-guide/mm/damon/usage: mark scheme filters sysfs dir as
    deprecated
  Docs/ABI/damon: mark schemes/<S>/filters/ deprecated

 .../ABI/testing/sysfs-kernel-mm-damon         | 62 ++++++++++---------
 Documentation/admin-guide/mm/damon/usage.rst  |  8 +--
 2 files changed, 38 insertions(+), 32 deletions(-)


base-commit: 97bd4e9ac10095f9b55f4a38d5d0757bc2a287fa
-- 
2.47.3

