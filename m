Return-Path: <linux-doc+bounces-79710-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH/rCzFKuWnG/QEAu9opvQ
	(envelope-from <linux-doc+bounces-79710-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 13:33:53 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0962A9F20
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 13:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF5B33037EFE
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 12:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748A53C1411;
	Tue, 17 Mar 2026 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="azwEds3Q"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CB3A8725;
	Tue, 17 Mar 2026 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750814; cv=none; b=PSm4aJqfjvT19I21E3DzWdZCcTmvtf4POtBeJY8ZfzqW98C8SGKgGBWwpAfLCag1QA9MGtnroBMdecKOU/VC8/pkQI7F9dZ5DDiC1/l/ttHf+nZ8XJqgjSz06z4K1bjVBc+IxhPOoDrNCftT7vMyhluGGN+LZCeX7HsfdtikKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750814; c=relaxed/simple;
	bh=/Ubtx+ApZZl9jVjU6WtLtrBxpASD5/PODvEX7hrgzvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kOmy2tSy6pFUVm5fc8aOfeh+Y7vGpuuteOu43IhNn2bq+e6fnWTq6N6QzqQ1PCTyHhmo5DSGagy0y/0ToZIukSKbXdc4AizqaF4ihemULhqqPxWZsPF0PcpwCqCrdsU0R2Mo/PBp6FbTJPrzwF251thMu9CYtUtFfGE9dGfIrRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=azwEds3Q; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fZrwS0S8Dz44Jg;
	Tue, 17 Mar 2026 13:33:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773750808;
	bh=/Ubtx+ApZZl9jVjU6WtLtrBxpASD5/PODvEX7hrgzvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=azwEds3Q6hWAhQF9bduzwKNy4SGuiO9lXwtv3bruTEelytAl71jIP7kEWrv4AINHe
	 s75RJTZnfSyXnmKC8dqWx5nN2rrqjCmoDPQCRQ8lGiJNYISFd0Y3cEZVV1UX/usjfK
	 qYYIaHUwxNtc7bv7bcAERIWYswoC96k5kVCy3y8iHdEefB0jCZelvKNDztEoRky2Hm
	 PmJUHmOCJBimxJ25LnC+5lYmjK8MHf1N57ufkBAdr7CrxtZLU9RXplmuqBILEfuTp0
	 fc3/KLDnnrORX+aO8h9mpmGxSRrOHo/+86Ppu50zcH+Y0A9r0Wznsa79a26zUaHH4N
	 O77IOiP2StkuQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fZrwR6qRBz42mC;
	Tue, 17 Mar 2026 13:33:27 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fZrwR4cclz8sgW;
	Tue, 17 Mar 2026 13:33:27 +0100 (CET)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 20D8B635A2;
	Tue, 17 Mar 2026 13:33:27 +0100 (CET)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] docs: reporting-issues: add conclusion to the
 step-by-step guide
Date: Tue, 17 Mar 2026 13:33:06 +0100
Message-ID: 
 <bc18f678b6854879dc7691ecbb762d717da4baa3.1773750701.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773750701.git.linux@leemhuis.info>
References: <cover.1773750701.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177375080736.2889269.16948562741891668169@mxe9fb.netcup.net>
X-NC-CID: e0xsZ0y6F9jPA24NM7G/wiOF/W0CiUXaRpzpUtwqc+DtM5KzH4A=
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79710-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[leemhuis.info];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[linux@leemhuis.info,linux-doc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leemhuis.info:dkim,leemhuis.info:email,leemhuis.info:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA0962A9F20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Text based on a section
Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
and slightly improved after review feedback.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 Documentation/admin-guide/reporting-issues.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 9f9c5db25a6c1a..aa058b295c5f33 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -241,6 +241,20 @@ kernels regularly rebased on those. If that is the case, follow these steps:
 The reference section below explains each of these steps in more detail.
 
 
+Conclusion of the step-by-step guide
+------------------------------------
+
+Did you run into trouble following the step-by-step guide not cleared up by the
+reference section below? Did you spot errors? Or do you have ideas on how to
+improve the guide?
+
+If any of that applies, please let the developers know by sending a short note
+or a patch to Thorsten Leemhuis <linux@leemhuis.info> while ideally CCing the
+public Linux docs mailing list <linux-doc@vger.kernel.org>. Such feedback is
+vital to improve this text further, which is in everybody's interest, as it will
+enable more people to master the task described here.
+
+
 Reference section: Reporting issues to the kernel maintainers
 =============================================================
 
-- 
2.53.0


