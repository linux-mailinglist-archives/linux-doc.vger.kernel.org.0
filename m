Return-Path: <linux-doc+bounces-79013-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKsuLOPTsmktQAAAu9opvQ
	(envelope-from <linux-doc+bounces-79013-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 15:55:31 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0F273B7D
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 15:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDCB33025F50
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 14:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1E53B7762;
	Thu, 12 Mar 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxIVbJTp"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36524389E16;
	Thu, 12 Mar 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327299; cv=none; b=locHk7aP8SODIY28Bk8/QJOgILmQZz4KMSJeLLhfihVz+cNQlJnwt2k5q+eyGJNqJOG3dSn/NegglAv1jpiEK7FLJtVzs7g55Jb+5SM3+7j1wUlS+eCE8Zms7Iblm+i01BkM+w1TmMNMP7YKPcvf8H8eWTD89LTVj5qATtZsxGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327299; c=relaxed/simple;
	bh=PaOLRDk0iXEcEwnWCzqzsJpfgjdAgDVAImrhDci59t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aurb93eJ3dZRjCoLK0cN2iE/2l/cIKshk9kybl2H7QqB8I1trPEdUH6FaK8eltsakZKRcphHoQrwsO+OnDYr0C5Ldn67CBinIYzvnO811CnOu9ADmzFfRVk49+E1YOHuTY14NIuIuK6KHquDmSTYyPYfQnWaTaG7I1oF/ZUoUXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxIVbJTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162EEC2BC87;
	Thu, 12 Mar 2026 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327299;
	bh=PaOLRDk0iXEcEwnWCzqzsJpfgjdAgDVAImrhDci59t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QxIVbJTpIRZrQcT3lAxZM7P5LfaKPUzvCM3GfGr+WEj9+h6qlu19Uc9iSbbf2Y2EB
	 V9+83zXFKZMiRrAfWG2oG16p3BLNbddc4gfV7/TT0FLCrq8JOIgMcpQpQP4ArERbl4
	 TpRrwYZu9VwgApr/OFD/1ons1hxBtCe2vEzP0OFfbsRfdi2GUAswfO11kI0heEDXp2
	 ahGUbKdLLc9knkJxjkLIhKaRJJm1knUMfxkvhmXU4L2oDRcvoiQrNXwPU+cuDtkIGT
	 /1GH1/Acrxllc8J9liZAYojcl5Mhg6BkGNi4SX2XGS7kzqlVoDDZXFmis1CE7+gnjA
	 xkSBAKEeF8Zvg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w0hRB-00000008xxM-1ESP;
	Thu, 12 Mar 2026 15:54:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/28] unittests: add a runner to execute all unittests
Date: Thu, 12 Mar 2026 15:54:30 +0100
Message-ID: <fb0bcc317d30200b0e91a3c18150e7394844b6d8.1773326442.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773326442.git.mchehab+huawei@kernel.org>
References: <cover.1773326442.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-79013-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69B0F273B7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We'll soon have multiple unit tests, add a runner that will
discover all of them and execute all tests.

It was opted to discover only files that starts with "test",
as this way unittest discover won't try adding libraries or
other stuff that might not contain unittest classes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/unittests/run.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100755 tools/unittests/run.py

diff --git a/tools/unittests/run.py b/tools/unittests/run.py
new file mode 100755
index 000000000000..8c19036d43a1
--- /dev/null
+++ b/tools/unittests/run.py
@@ -0,0 +1,17 @@
+#!/bin/env python3
+import os
+import unittest
+import sys
+
+TOOLS_DIR=os.path.join(os.path.dirname(os.path.realpath(__file__)), "..")
+sys.path.insert(0, TOOLS_DIR)
+
+from lib.python.unittest_helper import TestUnits
+
+if __name__ == "__main__":
+    loader = unittest.TestLoader()
+
+    suite = loader.discover(start_dir=os.path.join(TOOLS_DIR, "unittests"),
+                            pattern="test*.py")
+
+    TestUnits().run("", suite=suite)
-- 
2.52.0


