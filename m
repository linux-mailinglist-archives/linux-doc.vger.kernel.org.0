Return-Path: <linux-doc+bounces-93552-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bYxkO1o7PWrLzggAu9opvQ
	(envelope-from <linux-doc+bounces-93552-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 16:29:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 920236C6A3E
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 16:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nIUhv7+C;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93552-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93552-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42F6305A472
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 14:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC81367B62;
	Thu, 25 Jun 2026 14:24:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933D31EA65;
	Thu, 25 Jun 2026 14:24:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782397472; cv=none; b=F1BMfaYP2IdCOL9hYUfGc0PjHgYSDDzCRoO8cjKfc+oqHJVqp6uRrj6NoJZcO49atU55xOd8IWHM26CjdtFxDD7Cjovj4ARTPIKoxOQXA/MnFRymRIEFgn4gnAS2zHogHqizL/CDg2fsYhWeDTqBuTUIwXAqrDr/iWJ8dcEviVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782397472; c=relaxed/simple;
	bh=TtVvXUa4e83o2CSHr2VG8/v8m++SEzWD+87YWhkSHP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bGVxoevx5sa/hAiIIDOKvSPK8wGmI+LVjR71pE4wuqU1KJL02MO9x4VKxcpwWLgNS49MqKnfQyRp42hFPsUtIW2gpFuIQkGOU3Y9029DCdXnqM9vesEqcuRDPRmVEILydXHp6/YS+YG5yxpOOQmJauHsMYcNxBb6TjWcofsNwjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIUhv7+C; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E131F00A3A;
	Thu, 25 Jun 2026 14:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782397471;
	bh=LZrmGHo3vflvh1oEeSShAdbEXA+TKacvFO2pVZr+qWo=;
	h=From:To:Cc:Subject:Date;
	b=nIUhv7+C8biL1usYwmhv0V2C5fEWQ1cND8G5CDAa+tzyP3ZfsNzmqyV3F/4qInD/a
	 FVGGWpQJiLeVueVbTK+oPwFmOmDNKChtSaANHgnd6FP0wqUH0/Qe0Mp8jMfDogYKUf
	 zdn1mGgjwDF1tFnxTtpJgPxTzEB3Wy7Q8mc8OQiFM9GVENLCRehlO3cNzVkxfvYk1r
	 swKx80fMe3iUaS6DUdeg3VgLLDMRKzgNwFzcpnejgE3bmMtL/0/RacN3jAawkktqmh
	 +H2KUzGmn/srKA8+9GKHQpN61CKFx+3NwGV2cATlkic5oG7V3P97TVC7fM3ZvVEN7/
	 LNCIGw0NIUHag==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v1.2 00/11] mm/damon: update, optimize, and clean up doc, tests, and code
Date: Thu, 25 Jun 2026 07:23:45 -0700
Message-ID: <20260625142357.103500-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93552-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sj@kernel.org,m:liam@infradead.org,m:akpm@linux-foundation.org,m:brendan.higgins@linux.dev,m:davidgow@davidgow.net,m:david@kernel.org,m:corbet@lwn.net,m:ljs@kernel.org,m:mhocko@suse.com,m:rppt@kernel.org,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:vbabka@kernel.org,m:damon@lists.linux.dev,m:kunit-dev@googlegroups.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 920236C6A3E

Patches 1 and 2 update the design and ABI documents for recently added
DAMON features.  Patches 3-7 add or update more unit and self tests for
DAMON to cover recently changed or added functions and sysfs files.
Patch 8 optimizes damon_commit_target_regions() to skip unnecessary
adjacent ranges setup.  Patches 9-11 clean and fix up recently added
DAMON sysfs interface code for readability.

Changes from RFC v1.1
- RFC v1.1: https://lore.kernel.org/20260625050756.91115-1-sj@kernel.org
- Document nid requirement for node_eligible_mem_bp.
- Fix typos: s/memmcg/memcg/, s/geets/gets/.
- Drop damon_rnd() randomness test case; test boundness only.
- Fixup dests dir selftest to do real test with correct file permission checks.
Changes from RFC
- RFC: https://lore.kernel.org/20260624142008.87180-1-sj@kernel.org
- Rebase directly to latest mm-new.

SeongJae Park (11):
  Docs/mm/damon/design: update for DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP
  Docs/ABI/damon: document probe files
  mm/damon/tests/core-kunit: test damon_rand()
  selftests/damon/sysfs.sh: test multiple probe dirs creation
  selftests/damon/sysfs.sh: test {core,ops}_filters/ directories
  selftests/damon/sysfs.sh: test dests dir
  selftests/damon/sysfs.sh: test all files in quota goal dir
  mm/damon/core: reduce range setup in damon_commit_target_regions()
  mm/damon/sysfs: split probe setup function out
  mm/damon/sysfs: split out filters setup function
  mm/damon/sysfs: fix typos in probe_{add,rm}_dirs: s/attr/probe/

 .../ABI/testing/sysfs-kernel-mm-damon         |  40 +++++++
 Documentation/mm/damon/design.rst             |   6 +-
 mm/damon/core.c                               |  22 +++-
 mm/damon/sysfs.c                              | 102 ++++++++++--------
 mm/damon/tests/core-kunit.h                   |  17 +++
 tools/testing/selftests/damon/sysfs.sh        |  71 +++++++++++-
 6 files changed, 205 insertions(+), 53 deletions(-)


base-commit: ada7832345164eed1bbca10543b0c46f13738215
-- 
2.47.3

