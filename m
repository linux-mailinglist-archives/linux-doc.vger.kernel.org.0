Return-Path: <linux-doc+bounces-83550-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCOvNMMr4GmldAAAu9opvQ
	(envelope-from <linux-doc+bounces-83550-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 02:22:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D264409347
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 02:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D441730CA388
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 00:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2521A9F8C;
	Thu, 16 Apr 2026 00:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+HxnG/P"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CF51A6837;
	Thu, 16 Apr 2026 00:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776298920; cv=none; b=JLacH98r8GyXjdMaCTtj0FF0h6to/WtAhcEspA0lNONSaeyY8DTU9WNYx9Gh015ztd76M/keeWvD/9THVlTzKTjKahw0v1e0H8yQjLnp0y/iL0Qnupzzp+WN1/1fnIAEF1jrTrZUVdbwoD5/hmfDiDIfEY02n55DJXhYD8ijMU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776298920; c=relaxed/simple;
	bh=Te4GL7YI2bga7ObPIqHKNdIOFUrcsNxgo3oTxgGUtEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zkq6kJShU+WCA/aQ7Idn81dwDB2r3j4IYITqZNGOmEwvue84KcweI5DqGjAxm8LnsV8/SZYq+vsv9GfZE+t73SE+p6vmZGEpMaqOSyOq4T0GGgcWGIr8iYCKecaiWhrDhjRDKs+leYefMXb+EWpKqJwVO9OUcH23oLj7tmVaqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+HxnG/P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C66C2BCB5;
	Thu, 16 Apr 2026 00:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776298920;
	bh=Te4GL7YI2bga7ObPIqHKNdIOFUrcsNxgo3oTxgGUtEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M+HxnG/PtziS2/OQojQdij7ltmNZtbdZLFwU1yyphF1qknRPa+InwTfljzaqUKi4Z
	 st7rbLbvE+0Il3LawKY9RMouLrU2brG8I/lyMJrH6sfxYIxlfJb3nmWArHrkiibc8U
	 6GqvXU2B/Kf1yoTbw4g1plUrKH5ZTIRmULaeGpRjmkJFxXK8ijYiHV/If+LCAZ2Knn
	 mjGmtm2YIQWrWhiqvwEN3u0bxiBJuQgC3p/hO6uRwewmOKbTHjN0xCeXahv6iQLPHd
	 UJJgBxniDJgXxy2yj/mE1f78YLgSCQ9DjU5MLUTH0RwEE13qkmdeCnJHCUecGQvKZB
	 aBUz+SFj8alZA==
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
Subject: [RFC PATCH v1.2 2/2] Docs/admin-guide/mm/damon/stat: document kdamond_pid parameter
Date: Wed, 15 Apr 2026 17:21:47 -0700
Message-ID: <20260416002149.87090-3-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416002149.87090-1-sj@kernel.org>
References: <20260416002149.87090-1-sj@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83550-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: 2D264409347
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update DAMON_STAT usage document for newly added kdamond_pid parameter.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/stat.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/mm/damon/stat.rst b/Documentation/admin-guide/mm/damon/stat.rst
index c4b14daeb2dd6..46c5dd96aa2ed 100644
--- a/Documentation/admin-guide/mm/damon/stat.rst
+++ b/Documentation/admin-guide/mm/damon/stat.rst
@@ -89,3 +89,10 @@ percentiles of the idle time values via this read-only parameter.  Reading the
 parameter returns 101 idle time values in milliseconds, separated by comma.
 Each value represents 0-th, 1st, 2nd, 3rd, ..., 99th and 100th percentile idle
 times.
+
+kdamond_pid
+-----------
+
+PID of the DAMON thread.
+
+If DAMON_STAT is enabled, this becomes the PID of the worker thread.  Else, -1.
-- 
2.47.3

