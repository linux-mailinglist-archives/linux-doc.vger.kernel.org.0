Return-Path: <linux-doc+bounces-83949-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOPAEvgB52kX2wEAu9opvQ
	(envelope-from <linux-doc+bounces-83949-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 06:50:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8544364C3
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 06:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A7A93013A7F
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 04:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BDD281525;
	Tue, 21 Apr 2026 04:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxAXPIWx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D43231836;
	Tue, 21 Apr 2026 04:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776746985; cv=none; b=Hq2VG5ChnaUf8fKKVt1CqDkh1q8a74IvUyRmyt5Fy/QQXlPumz4S4Bu7XTHfb3gaKD/58V5TrbTVJCagP7HB3OfHD7Ch4SnbzY4YCyHXnOakwzifBRf7yeb1nFrJqmN1Gx/OIYh8Z5+1RxH9Xyjbrg81BtJbHzTE37SdOXBH6A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776746985; c=relaxed/simple;
	bh=ka4gbLZs99fExMD1yc1xEuZ3x1da439G/UiyCjNMmiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goy/5zpH21yEsuv8ucMBLnlykPtn2Q7QPPiUC5mwUg1QNi6hY1KFlYREOylgvtQE7AnC8ebocYT3oV/3Olz+mXUoRszXCpKPgdYGNuuZeUlrT8g9rDOzdMyb+FymJEQ+gHIx1bEP8o8Ym2Xlv5ZTBuMpDjsQIFIfYkyXBO7tecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxAXPIWx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19FB8C2BCB5;
	Tue, 21 Apr 2026 04:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776746985;
	bh=ka4gbLZs99fExMD1yc1xEuZ3x1da439G/UiyCjNMmiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VxAXPIWxB31Jk6/Qmby4wm0jEL0HHoppbsPaygsvseRuCttTk7XJFZPTDRTfu/968
	 sVgGpFssrD5yjsRi1eEs/w2v4V+0904KUXmvohuEvax8kBK9jjs9+Q8IwWCa8iCbaz
	 uyUHho97AL/Gs0H4FpKrOFHa9lQ13/tdcX2Lu8mTn5yl3EbU2s5PTj3yez608G8l4m
	 U3m6/LootpFAl/x1f84gJgMI8L+y1dB60kzpCjHDMAsw/9XamrkvuqtQg/ZtN4pGG1
	 gUCE3ZK30H/owzyhL1i/hpPrMvow3RJBJ9Uls6iGb18KKEuxjDNlkjI8zZlpTu9ab4
	 vyrcMRQs2AZkw==
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
Subject: [RFC PATCH 1/2] Docs/admin-guide/mm/damon/usage: mark scheme filters sysfs dir as deprecated
Date: Mon, 20 Apr 2026 21:49:26 -0700
Message-ID: <20260421044928.141388-2-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260421044928.141388-1-sj@kernel.org>
References: <20260421044928.141388-1-sj@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83949-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: DE8544364C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The alternatives of 'filters/' directory, namely 'core_filters/' and
'ops_filters/', can fully support all the features 'filters/' directory
can do, and provide better user experience.   Having 'filters/'
directory is only confusing to users.  Announce it as deprecated on the
usage document.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index d5548e460857c..918c14a8e852b 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -486,9 +486,10 @@ layers.  Filters that requested by ``core_filters`` and ``ops_filters`` will be
 installed before those of ``filters``.  All three directories have same files.
 
 Use of ``filters`` directory can make expecting evaluation orders of given
-filters with the files under directory bit confusing.  Users are hence
-recommended to use ``core_filters`` and ``ops_filters`` directories.  The
-``filters`` directory could be deprecated in future.
+filters with the files under directory bit confusing.  For the reason,
+``filters`` directory is deprecated.  It is still functioning, but it will be
+broken and eventually removed in near future.  Users should use
+``core_filters`` and ``ops_filters`` directories instead.
 
 In the beginning, the directory has only one file, ``nr_filters``.  Writing a
 number (``N``) to the file creates the number of child directories named ``0``
-- 
2.47.3

