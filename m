Return-Path: <linux-doc+bounces-94015-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioNKBvmIQmpg9QkAu9opvQ
	(envelope-from <linux-doc+bounces-94015-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 17:02:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F16DC66E
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 17:02:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ab23CYWO;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94015-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94015-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C87E0303AD81
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 14:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA34B3E8C46;
	Mon, 29 Jun 2026 14:55:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DA2E06E4;
	Mon, 29 Jun 2026 14:55:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744944; cv=none; b=a8fAD0aHe6yussXeC2QRwRN9/e5f6TgJTyTh013f4A03A82VS1uObca0TD50i7RCBGZ1+HwFhaYwd9m/Z5EtjxPpMZOjXmUQEe9B6AQ8QheITPVIR3Mgw477Swo95YI9AA3DaZgLsA4wS7JdyNNPQDqX7BD1CtA30JQp+IVo3Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744944; c=relaxed/simple;
	bh=D7N5a7qo/YAKktxwJ4n2nVSy5WQVGmL6DjXBnoaN3BM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SgZsFc0Ktkiv5PDymIw3TH+lBM7aj6JoKys+xRnGlp9ayGMnSA/HqQhJ/x5lbe1UUKRtCeSyaY0aCEcpFwcvT98XEyhCWslLpNsujzB6MPY57gW+CG6FA7Se42piIv9JUQ5QsB5YFiaTJRiQedTCcAFGFrThae8rE+yKvnyiqVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ab23CYWO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4208E1F00A3D;
	Mon, 29 Jun 2026 14:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782744943;
	bh=ttGyzzeHcyljjJxDkR2hOA9v80OHBSDRc7TeCp+VQP8=;
	h=From:To:Cc:Subject:Date;
	b=Ab23CYWOV3R+jpaIPE9R0BH1pPzkKLGN9yekJMEuyHJSGLOiW95ZIKQhVlSXKcc69
	 jJa0VyN9iR4gaTg+wwjnarmCYMOsJeLQl+kSw+AD2+qpJXKCLLUx8yZnaJGEX10knk
	 1ET102mc69Sbjd8CcoicFTKmLNpVf8/SgvhlUUT20WrdfXo2BJd3c9XT/ZfIiiq5F1
	 BPIkWBIcc773ohFNpPn8yhjl8mOtQI7eorbvIgIxIaxj3D4fT4x9EYsvH49pCx1N3P
	 U55ZUewOXAfMBD/jRdoLuDAKH6mzoHygxc5Mx9/Itt9FVy98qTpKWsZoPtYu/khVmg
	 bPdasO5kJ4vhA==
From: SJ Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SJ Park <sj@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/5] mm/damon: five misc fixups
Date: Mon, 29 Jun 2026 07:55:31 -0700
Message-ID: <20260629145538.134832-1-sj@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94015-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:sj@kernel.org,m:liam@infradead.org,m:brendan.higgins@linux.dev,m:davidgow@davidgow.net,m:david@kernel.org,m:corbet@lwn.net,m:ljs@kernel.org,m:mhocko@suse.com,m:rppt@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:vbabka@kernel.org,m:damon@lists.linux.dev,m:kunit-dev@googlegroups.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D99F16DC66E

Five patches for miscellaneous DAMON fixups.  Use better fit kernel
functions, cleanup/fixup documents, and add unit tests.

Below is a note that is better to drop from the final commit message.
The five patches were initially sent and revisioned by different
individuals.  Each patch contains changelog on their commentary area.
The patches are curated into this series by SJ, for the convenience in
reposting.

Akinobu Mita (1):
  mm/damon/core: use kvmalloc for target regions array

Asier Gutierrez (1):
  samples/damon: Fix typos in Kconfig help text

Doehyun Baek (1):
  Docs/{admin-guide,mm}/damon: fix DAMON documentation details

Philippe Laferriere (1):
  mm/damon/stat: use secs_to_jiffies() instead of msecs_to_jiffies()

Sailesh Nandanavanam (1):
  mm/damon/tests/core-kunit: add KUnit test for walk_control_obsolete
    behavior

 Documentation/admin-guide/mm/damon/usage.rst |  8 +++---
 Documentation/mm/damon/design.rst            | 12 ++++-----
 mm/damon/core.c                              |  4 +--
 mm/damon/stat.c                              |  2 +-
 mm/damon/tests/core-kunit.h                  | 28 ++++++++++++++++++++
 samples/damon/Kconfig                        |  2 +-
 6 files changed, 42 insertions(+), 14 deletions(-)


base-commit: 58a53a487b7a86995fdfba07723fb8416fccf830
-- 
2.47.3

