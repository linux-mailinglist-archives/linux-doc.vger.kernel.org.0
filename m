Return-Path: <linux-doc+bounces-84789-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLIMDYV+72lKBwEAu9opvQ
	(envelope-from <linux-doc+bounces-84789-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 17:19:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D472B4750B4
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 17:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A08B336A82B
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE29333372A;
	Mon, 27 Apr 2026 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njaiG58w"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9597B332ECB;
	Mon, 27 Apr 2026 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302761; cv=none; b=o0XGodtl6+FfG+nAa5hEIOkD9wFhyXpf8WWI5ol7rHOxxXgZrWQL3YRbXXl8xz+FUbjMh1FkC0JJshnD0Ljyi8Xp+LmK1+iLTczBZH9Was1EUOKerq2GkyhMK681yVkXOEnO9wAGA3otM2ABZVx9mqquKOojwYbWnksBRRvmYTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302761; c=relaxed/simple;
	bh=cefZkLteoGUCWc4MRoifuuAEqrfO3tIQ452Q0kCEVdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eitN1inJWHwH35SYdOGLbLYDhq+gQQcRCcOGgXC9urkZveM/anQfXImuDky28Leo/WYBk9uYIkuTSf4xODTWgkz87yFoKk9TIQT7k40yyjvBnW2P/KNAT/BpaDmUAoGPnfBDn+Hl3FaSjqNmy1jNLwF6sf2FA6FNRp0+eAFAZuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njaiG58w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C19C19425;
	Mon, 27 Apr 2026 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777302761;
	bh=cefZkLteoGUCWc4MRoifuuAEqrfO3tIQ452Q0kCEVdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=njaiG58wjsoDLEqvI2yOa/BxJ00RrwagWompIzbxHgrQ58S+/Bsnq2TIQK+l7yvjm
	 1iuSJc3qvdzX/n1j+GgrTOsHCUrlV8VhnNjgsojSBdOkg8jjbK2bSGYCtHgXOzSrI6
	 A0umOBQDdD/THIPDnwDAd5v4yh7TaR5S4AkibyBJ/kKWY71cFeD7DTfgnUNI4QxkRu
	 RY4JyOYgROABt/a8OU3yOKMocI/3TZHv8ZAsfyYys1SW1lrA3e9cXM1ezBnVvfmGsx
	 4Vr5PRf4PYjssXCFEkjOcgKTzKONXW8wgVv811rASHZlOjrTIWBuuVOUgpL+Sbq2c7
	 ZVKXX7m3WX56w==
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
Subject: [PATCH v2 03/10] Docs/mm/damon/design: update for context pause/resume feature
Date: Mon, 27 Apr 2026 08:12:22 -0700
Message-ID: <20260427151231.113429-4-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427151231.113429-1-sj@kernel.org>
References: <20260427151231.113429-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D472B4750B4
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-84789-lists,linux-doc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Update DAMON design document for the context execution pause/resume
feature.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 365e068a8dbe4..622d24e35961e 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -19,6 +19,13 @@ types of monitoring.
 To know how user-space can do the configurations and start/stop DAMON, refer to
 :ref:`DAMON sysfs interface <sysfs_interface>` documentation.
 
+Users can also request each context execution to be paused and resumed.  When
+it is paused, the kdamond does nothing other than applying online parameter
+update.
+
+To know how user-space can pause/resume each context, refer to :ref:`DAMON
+sysfs context <sysfs_context>` usage documentation.
+
 
 Overall Architecture
 ====================
-- 
2.47.3

