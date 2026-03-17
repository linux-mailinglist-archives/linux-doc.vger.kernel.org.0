Return-Path: <linux-doc+bounces-79822-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGGjFpScuWnULAIAu9opvQ
	(envelope-from <linux-doc+bounces-79822-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:25:24 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C04542B0E99
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03CDA32198FA
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABAC3F99EB;
	Tue, 17 Mar 2026 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcFPK4h3"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61003F99E0;
	Tue, 17 Mar 2026 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770990; cv=none; b=ayK2swwSV3vvn2Cs5VOagCem8Cf1BfGe/lMC8Fro1hjSrL6vWZoeNnfOh2lt6ToxpVuQwOvOMgjj7T3d621TmGG+Gztdw8xwOIU5H1jQ4G7f7m4TpL4t4HHdDP2VpIMNkIFA6PvUeHBLNXHvYb2J5uqQ2rEf12SAL7ydf1jH1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770990; c=relaxed/simple;
	bh=zee2diHRB7JHsdRfIDzL90thJMlji9fQpbRuAJApLrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pizpo+V7GJGHzTEF76G8IGb12x1fvc557CWsOkBc/uEJKL8gP8ulwmXsqkznwT3o9IS3hVY7SlNcr68KJNct99oQX2MCNJ1qvqD9pLqNdc9WcbuQmFIEEvZhSvjyoGggeBGKscJ87iVri6OC7Q6Ur/oe/UHCzjQw6N6nr1d3cGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcFPK4h3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C21CC2BCB0;
	Tue, 17 Mar 2026 18:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773770990;
	bh=zee2diHRB7JHsdRfIDzL90thJMlji9fQpbRuAJApLrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bcFPK4h37ag9gO0cS2nmQH3anfSw1jha6N11ZtSYBSxliD6/ICia2L41jjYoR3Kgo
	 JkhaFYNe8SVqiX+FeWY+wawNcfvP7T9Xn5vepFMzXh9J1OvqDpZcJqjBkWG5yDfGeV
	 I4BkoVxXAZeFll5fCtQ2mDL2+V3zYX6tBvHhh9x7X1K0blyxgcuMSvqEh5qaW8gkvA
	 MFQeYs0QAgh02FIyj7d5XHM3HW1+xCjMbsbiUNVv4AxtXRU6ShAsNPAX0e+Dyvlbvo
	 F8VD4w6xL8CgASKxMX8CjTMk3DFQnpWjbUjEwAnge5/RXVJwpT0OpcRatWzVL6OAHT
	 7toUiSXYJrDnw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2YrU-0000000H5ak-3mRd;
	Tue, 17 Mar 2026 19:09:48 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 18/22] docs: c_lex: setup a logger to report tokenizer issues
Date: Tue, 17 Mar 2026 19:09:38 +0100
Message-ID: <903ad83ae176196a50444e66177a4f5bcdef5199.1773770483.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773770483.git.mchehab+huawei@kernel.org>
References: <cover.1773770483.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79822-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C04542B0E99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Report file that has issues detected via CMatch and CTokenizer.

This is done by setting up a logger that will be overriden by
kdoc_parser, when used on it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/c_lex.py       | 16 ++++++++++++++++
 tools/lib/python/kdoc/kdoc_parser.py |  4 +++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index 20e50ff0ecd5..b6d58bd470a9 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -22,6 +22,22 @@ from .kdoc_re import KernRe
 
 log = logging.getLogger(__name__)
 
+def tokenizer_set_log(logger, prefix = ""):
+    """
+    Replace the module‑level logger with a LoggerAdapter that
+    prepends *prefix* to every message.
+    """
+    global log
+
+    class PrefixAdapter(logging.LoggerAdapter):
+        """
+        Ancillary class to set prefix on all message logs.
+        """
+        def process(self, msg, kwargs):
+            return f"{prefix}{msg}", kwargs
+
+    # Wrap the provided logger in our adapter
+    log = PrefixAdapter(logger, {"prefix": prefix})
 
 class CToken():
     """
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index efd58c88ff31..f90c6dd0343d 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -13,7 +13,7 @@ import sys
 import re
 from pprint import pformat
 
-from kdoc.c_lex import CTokenizer
+from kdoc.c_lex import CTokenizer, tokenizer_set_log
 from kdoc.kdoc_re import KernRe
 from kdoc.kdoc_item import KdocItem
 
@@ -253,6 +253,8 @@ class KernelDoc:
         self.config = config
         self.xforms = xforms
 
+        tokenizer_set_log(self.config.log, f"{self.fname}: CMatch: ")
+
         # Initial state for the state machines
         self.state = state.NORMAL
 
-- 
2.52.0


