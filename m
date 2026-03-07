Return-Path: <linux-doc+bounces-78332-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG0oLLB/rGmiqAEAu9opvQ
	(envelope-from <linux-doc+bounces-78332-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 07 Mar 2026 20:42:40 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A947822D5A7
	for <lists+linux-doc@lfdr.de>; Sat, 07 Mar 2026 20:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E683300BEAE
	for <lists+linux-doc@lfdr.de>; Sat,  7 Mar 2026 19:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99354392C2C;
	Sat,  7 Mar 2026 19:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxcdUQH0"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768BA38F244;
	Sat,  7 Mar 2026 19:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772912547; cv=none; b=U2bdQ7LE/gikXdB7wiz3NnZA1ODZZfhxuTS8c9T/tB7Gi6eru1R5e/8+DYBp5KEc2OKGk83XtD3Hfsf3yGXEMT51ePR73GHTlTUAGKEtU2AnRvW4y4FqakEuJR6kVRhpg2d3hyvsmU7pcmbJNDIpXwThPZLLtAY0rSh7L1JJKv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772912547; c=relaxed/simple;
	bh=hW/2ycay+HzENCaHwC79wBirLF865EtYyfXIYZ2Fx5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q+1a6VaEOm8c8Q8BS/+R2fWYDN/7OCbEtbC5jqAGIlmZJtKrS4WmyCm4JR8cEC0ndHBWuF5DFSG5EdJ6fsDuZ/W9vwTc6GJq6US9k3SmyVphwwXbKotLYm7KeaS8h2ueX9E7Obv4mEoZNumXuIbhYN4RwwhiekAS6tPa44J4LVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxcdUQH0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115ABC19423;
	Sat,  7 Mar 2026 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772912547;
	bh=hW/2ycay+HzENCaHwC79wBirLF865EtYyfXIYZ2Fx5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cxcdUQH0a72LRUKSuKr2PQIYUV7QCuuqMbyh0lvh+rbp4NC15TkcqN7yqbsEiNNdW
	 UyC3v6strUjJ6vR7fJFz+JmYgiXuyJ859bS4erZvLJ1Bc9SHn9Az3SutHOxiyAUiO/
	 53e5x7bHFeoPboFbdotMv3aKrkbVBl5Igi6hJSb5nLKbc24BohDnqK28AO3dm2ZLSI
	 nzLAtE7QgfWRFdIlqYQneMIB7cUyB93R/V1oWqKdIg6D07IoHfqGpzCoYSRKnMGsKp
	 cFWDG5glsciRKnAnPBe7ZZM5dnVlT9Fzk7Zq+5UVpUQ9+lEh5zcfeWL3M2eY2QYL3k
	 SbZHA3hgnOFKA==
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
Subject: [PATCH 2/2] Docs/mm/damon/design: document the power-of-two limitation for addr_unit
Date: Sat,  7 Mar 2026 11:42:21 -0800
Message-ID: <20260307194222.202075-3-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307194222.202075-1-sj@kernel.org>
References: <20260307194222.202075-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A947822D5A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-78332-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.980];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The min_region_sz is set as max(DAMON_MIN_REGION_SZ / addr_unit, 1).
DAMON_MIN_REGION_SZ is the same to PAGE_SIZE, and addr_unit is what the
user can arbitrarily set.  Commit c80f46ac228b ("mm/damon/core: disallow
non-power of two min_region_sz") made min_region_sz to always be a power
of two.  Hence, addr_unit should be a power of two when it is smaller
than PAGE_SIZE.  While 'addr_unit' is a user-exposed parameter, the rule
is not documented.  This can confuse users.  Specifically, if the user
sets addr_unit as a value that is smaller than PAGE_SIZE and not a power
of two, the setup will explicitly fail.

Document the rule on the design document.  Usage documents reference the
design document for detail, so updating only the design document should
suffice.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 28d932ceaf7ed..29fff20b3c2a9 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -150,6 +150,8 @@ address on the given address space.  Support of ``address unit`` parameter is
 up to each operations set implementation.  ``paddr`` is the only operations set
 implementation that supports the parameter.
 
+If the value is smaller than ``PAGE_SIZE``, only a power of two should be used.
+
 .. _damon_core_logic:
 
 Core Logics
-- 
2.47.3

