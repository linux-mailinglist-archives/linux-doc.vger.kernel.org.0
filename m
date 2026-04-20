Return-Path: <linux-doc+bounces-83892-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JRlCKCU5mnGyQEAu9opvQ
	(envelope-from <linux-doc+bounces-83892-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 23:03:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5B9433E0C
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 23:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CDAD3018288
	for <lists+linux-doc@lfdr.de>; Mon, 20 Apr 2026 21:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A043876CE;
	Mon, 20 Apr 2026 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHYZkX4X"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F3387566;
	Mon, 20 Apr 2026 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776719005; cv=none; b=n5niPRP6pHgc1wRg6UesTUX+89N9g2zqhUCe6Ze9wPJJEQzAHsG21Hu8HOD8tyhSBRG1vazqxwYej4NFEHjGc8JVPi6S4iyoxdlGBIeSs4qQFJMszt5C6KdbsPKbgt5PEPMhKvfezP75DXnlwwhpqRL6gADjTwVkgv6M8INJdBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776719005; c=relaxed/simple;
	bh=VP9IrJ4l0SklCndrbkVfEFo0OIEf+svLpxw4cCq58sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lKJtmdOOKO8834eobkohsPNqTcPetzlxyjzae/xiR5bDK1wYaqkndjTWtg4doBzWjV9xdB+bNtzVedK6WJfi4vRYCKopw3ZrxKPIpXb8N95Zo1SDFz8Or6DYbEuM7io5AxfPoPf4DUAqrx5KD4323bWXyZryHElrUdeQw6vkF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHYZkX4X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48236C19425;
	Mon, 20 Apr 2026 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776719005;
	bh=VP9IrJ4l0SklCndrbkVfEFo0OIEf+svLpxw4cCq58sA=;
	h=From:Date:Subject:To:Cc:From;
	b=ZHYZkX4X+t1uekxCCKt2BxvMYVS9JWkFL2KxK272j37gx7wlUlUc64FqXCYa9x0Y4
	 hcew88WEu5suzgwjNPRtPfGM0JilyidCIP01H9HXRc8PWzsqbMSjOIXklT/AcsuajF
	 aAqlfKA6bTBrfCN7WsMUAP0oswwQxcaROmjMUe8LETkWym2YrQ5+ZpbuoZ2J1qtpEk
	 lDSvWJK2AN7xuZgMWV6hkbb7sR7+tpPsg0TdXAMgjnq+CNnj+eLE1XWTAZdMykJQrk
	 +hjSknHB3Yedxsfbb1sM4Hov4RnUL70z1vBW0mLSooAaESBqDhEdu8qZgZXRSL4Mk0
	 +ooPvqhCL/xgw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 20 Apr 2026 23:03:16 +0200
Subject: [PATCH] docs/mm: clarify that we are not looking for LLM generated
 content
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJOU5mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMD3Zyc3JT8ZF0jw6Q007TElKQUszQloOKCotS0zAqwQdGxtbUAIqR
 GZVgAAAA=
To: linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Matthew Wilcox <willy@infradead.org>, Harry Yoo <harry@kernel.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83892-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C5B9433E0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Let's make it clear that we are not looking for LLM generated content
from contributors not familiar with the details of MM, as it shifts the
real work onto reviewers.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 Documentation/mm/index.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 7aa2a8886908..13a79f5d092c 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -7,6 +7,19 @@ of Linux.  If you are looking for advice on simply allocating memory,
 see the :ref:`memory_allocation`.  For controlling and tuning guides,
 see the :doc:`admin guide <../admin-guide/mm/index>`.
 
+.. note::
+
+  Unfortunately, parts of this guide are still incomplete or missing.
+  While we appreciate contributions, documentation in this area is hard
+  to get right and requires a lot of attention to detail.  New contributors
+  should reach out to the relevant maintainers early.
+
+  This guide is expected to reflect reality, which requires contributors
+  to have a detailed understanding.  Documentation generated with LLMs
+  by contributors unfamiliar with these details shifts the real work onto
+  reviewers, which is why such contributions will be rejected without
+  further comment.
+
 .. toctree::
    :maxdepth: 1
 

---
base-commit: da6b5aae84beb0917ecb0c9fbc71169d145397ff
change-id: 20260420-llmdoc-21bf5fadbd6f

Best regards,
-- 
David Hildenbrand (Arm) <david@kernel.org>


