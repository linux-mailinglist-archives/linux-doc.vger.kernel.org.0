Return-Path: <linux-doc+bounces-86593-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANswJsPa/mnfxQAAu9opvQ
	(envelope-from <linux-doc+bounces-86593-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 08:57:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E264FE55C
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 08:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E7223008D7C
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 06:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DA038237A;
	Sat,  9 May 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0pX1H4T"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03D37BE88;
	Sat,  9 May 2026 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778309813; cv=none; b=RORgpeuPHCSQB/U1DY8kBp15LwJU8sq6n97MGuWRECJNcu3N8TfT9x5vP/ZMDlnDNpLuOUfBuO0bAO/Njcmq3ZrccP0aHJ2d2/PpRja34x8wgRAsJ6FftjT35vZ7qpTiQKr+TrqkTPoXgD8mLxAbJAWlj1h4KembX50F6bPs6K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778309813; c=relaxed/simple;
	bh=rUXLJYcWROxoaAwRXs6Dg6TASbey7uzPX2TcdL/dM34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PLeeAdjAnQ2SbdxRNKwN/qJ+jVRo/jd56dbsWobyyx/PPRGKOGwBvDQytjfgQh3J5yY+B76o/O0GWDuaxl9h4HmVL/GZaLVIdKiWccanHG+P7GeGT8K7tVdIzvDrPaCnyl8bu/h+qHR3sEKT9cV/B0IiYkfZwl6MAqxaQvHlJhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0pX1H4T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB3CC2BCFD;
	Sat,  9 May 2026 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778309812;
	bh=rUXLJYcWROxoaAwRXs6Dg6TASbey7uzPX2TcdL/dM34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0pX1H4TVfDa289w0zjA2AypTm2JKzhI8fdcUnPGxW7t2O9KE/B0iNIG8fjUmEaH6
	 xliUmWYhPqEX4RI2YSqv85eDsEqpStr8cTWTvSZzXE1xZQb7lD7kw3tTKPtlA6VTvD
	 b2plQSSbvelpwSNkI+09fZe9uyohH1jUBavZtIY+4tgt2feE8XXEzkk8W7Md7qISte
	 N7pDVLogovJqHRV+/QfDuHFGSDg676fr4CPov1tOlmGf5Czzjwk5haRfIrBYokgWHZ
	 VhHut+nvfnPFhriKVZx7MIzJB5FMEKV2AR+ymMb9rCUnC6gqecFGe7sJIioY6COOLj
	 M0ezjVOn2cfYw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wLbcI-00000000GJJ-3Px4;
	Sat, 09 May 2026 08:56:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 12/13] MAINTAINERS: make clearer about what's expected for "P" field
Date: Sat,  9 May 2026 08:56:45 +0200
Message-ID: <21e6def8b69bac36795dcd4047d663bb31407dcb.1778309595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778309595.git.mchehab+huawei@kernel.org>
References: <cover.1778309595.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 83E264FE55C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86593-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The "P" field is meant to point to a subsystem maintainer's
profile, stored either at the Kernel documentation or on an
external site. Make it clearer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <921e5e6a074f9d8cf77483d73e6801f49254bbb8.1777987027.git.mchehab+huawei@kernel.org>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..77244b7f9545 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25,9 +25,9 @@ Descriptions of section entries and preferred order
 	C: URI for *chat* protocol, server and channel where developers
 	   usually hang out, for example irc://server/channel.
 	P: *Subsystem Profile* document for more details submitting
-	   patches to the given subsystem. This is either an in-tree file,
-	   or a URI. See Documentation/maintainer/maintainer-entry-profile.rst
-	   for details.
+	   patches to the given subsystem. This is either an in-tree .rst file
+       inside Documentation/, or a URI.
+       See Documentation/maintainer/maintainer-entry-profile.rst for details.
 	T: *SCM* tree type and location.
 	   Type is one of: git, hg, quilt, stgit, topgit
 	F: *Files* and directories wildcard patterns.
-- 
2.54.0


