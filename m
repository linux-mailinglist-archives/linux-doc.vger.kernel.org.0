Return-Path: <linux-doc+bounces-79714-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLLoM2ZMuWnG/QEAu9opvQ
	(envelope-from <linux-doc+bounces-79714-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 13:43:18 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF252AA0E5
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 13:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0FA53053A74
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 12:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121D73C3C19;
	Tue, 17 Mar 2026 12:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Y9iNDBJq"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67E33F361;
	Tue, 17 Mar 2026 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751395; cv=none; b=dByM2527PpmgUvy1mkFmrZntJiTndqpk211NNB3V5y7XaRdnocnjPpAIcEC4t63cboqG//BhnAFvcwHk1PtNfwDUTowEO+K5E+oZycw1AJWygyVaaM+U8HHLV0QFpH+Qemfi+Idxu1eAIh8jHTE5DHsDLxVxKXalOLniIlyftJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751395; c=relaxed/simple;
	bh=HvFK70HRpg5LxjabB1w8VIetM315CyKC751q1GpP+OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FC4zmlHwuI9w3Op9B/XeXT9rMUtrV1/2Afbw1s1Cq4lUkQfUYg+ih/yNTHNFLDk0nEWYoVP/SNh5tszKJGKzJPgpeWEP8vuWn4BkdM87C/RRgcXX3bIQO8iBITQaIVvzFtirDJabXMWilvv43mRM6SsQNj0WR0ZYV4qd5cTXwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Y9iNDBJq; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fZrwS3bzQz67bZ;
	Tue, 17 Mar 2026 13:33:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773750808;
	bh=HvFK70HRpg5LxjabB1w8VIetM315CyKC751q1GpP+OM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y9iNDBJqksIo/wi1x+u3l7YHAeHB8FNJS2F2wjpRKo3yC8VL6ya2A830iydArYFf+
	 +qp9onbhsQUqVLEXWjpGBgho+1LplDeYWzMc0Ay76E2eVJJC0dSWrPgMQJeY9Oq9fB
	 H6+yxxi24b+rt8GtbXpmacGq51OpGS89DWaQlewh+kvZr1F3qAtlrNiD/4DOokiDE4
	 lf5m//kepp0x+gGDXXKlIOvUTgmlKzfdz4jq2/4jjnsm3jkk4jMishIUR2Sp3VG4z8
	 kY7fRRDuJlaHwf2OdAXrVAxGFn6uPsgTHOURHpmd2MW+zNm3Ora/EcttxyJLpEUr2I
	 CvyNE0nxQLqtA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4fZrwS2v7Yz4xLW;
	Tue, 17 Mar 2026 13:33:28 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fZrwS0lP3z8svF;
	Tue, 17 Mar 2026 13:33:28 +0100 (CET)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A7CCC635CB;
	Tue, 17 Mar 2026 13:33:27 +0100 (CET)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] =?UTF-8?q?docs:=20verify-bugs-=E2=80=A6=20and=20qu?=
 =?UTF-8?q?ickly-build-=E2=80=A6:=20improve=20feedback=20section?=
Date: Tue, 17 Mar 2026 13:33:07 +0100
Message-ID: 
 <cb219ccd15271bfb99ecce01dcbdbb03cccd7be1.1773750701.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773750701.git.linux@leemhuis.info>
References: <cover.1773750701.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177375080792.2889273.1822819562808559532@mxe9fb.netcup.net>
X-NC-CID: ZTD0kk1SI7NByACqlbGtBMhZVZleCXzkBH5zxd+hG9lXITp04bc=
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79714-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,leemhuis.info:dkim,leemhuis.info:email,leemhuis.info:mid];
	DMARC_NA(0.00)[leemhuis.info];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@leemhuis.info,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DF252AA0E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mention sending patches in the section about feedback. This syncs them
with a section a earlier patch added to reporting-issues.rst, which
was based on these sections and improved during review.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 .../admin-guide/quickly-build-trimmed-linux.rst   | 14 ++++++++------
 .../verify-bugs-and-bisect-regressions.rst        | 15 +++++++--------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index cb4b78468a935d..cb178e0a620848 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -349,12 +349,14 @@ again.
 
 .. _submit_improvements_qbtl:
 
-Did you run into trouble following any of the above steps that is not cleared up
-by the reference section below? Or do you have ideas how to improve the text?
-Then please take a moment of your time and let the maintainer of this document
-know by email (Thorsten Leemhuis <linux@leemhuis.info>), ideally while CCing the
-Linux docs mailing list (linux-doc@vger.kernel.org). Such feedback is vital to
-improve this document further, which is in everybody's interest, as it will
+Did you run into trouble following the step-by-step guide not cleared up by the
+reference section below? Did you spot errors? Or do you have ideas on how to
+improve the guide?
+
+If any of that applies, please let the developers know by sending a short note
+or a patch to Thorsten Leemhuis <linux@leemhuis.info> while ideally CCing the
+public Linux docs mailing list <linux-doc@vger.kernel.org>. Such feedback is
+vital to improve this text further, which is in everybody's interest, as it will
 enable more people to master the task described here.
 
 Reference section for the step-by-step guide
diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
index d83601f2a459ff..7d38393f31fb16 100644
--- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -1062,16 +1062,15 @@ Conclusion
 
 You have reached the end of the step-by-step guide.
 
-Did you run into trouble following any of the above steps not cleared up by the
-reference section below? Did you spot errors? Or do you have ideas how to
+Did you run into trouble following the step-by-step guide not cleared up by the
+reference section below? Did you spot errors? Or do you have ideas on how to
 improve the guide?
 
-If any of that applies, please take a moment and let the maintainer of this
-document know by email (Thorsten Leemhuis <linux@leemhuis.info>), ideally while
-CCing the Linux docs mailing list (linux-doc@vger.kernel.org). Such feedback is
-vital to improve this text further, which is in everybody's interest, as it
-will enable more people to master the task described here -- and hopefully also
-improve similar guides inspired by this one.
+If any of that applies, please let the developers know by sending a short note
+or a patch to Thorsten Leemhuis <linux@leemhuis.info> while ideally CCing the
+public Linux docs mailing list <linux-doc@vger.kernel.org>. Such feedback is
+vital to improve this text further, which is in everybody's interest, as it will
+enable more people to master the task described here.
 
 
 Reference section for the step-by-step guide
-- 
2.53.0


