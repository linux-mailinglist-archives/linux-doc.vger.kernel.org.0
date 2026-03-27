Return-Path: <linux-doc+bounces-81508-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YmE6EIccxmncGgUAu9opvQ
	(envelope-from <linux-doc+bounces-81508-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 06:58:31 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9201933F550
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 06:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2BB8301DACB
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 05:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C15D2D8768;
	Fri, 27 Mar 2026 05:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hmfi56BQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391422D6E6F;
	Fri, 27 Mar 2026 05:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774591105; cv=none; b=LolbBxlE7eHqY4n44rogu2DuGYAnmbZz7rr27KrrH8XyJX/XIQA4y4EL15oqMak9YIjQyhMStGJu/7cJmXNwDV1Ci//HxlL+vb4TNHl6rxccI5tDH33YVq+/mHmu5IU9qAN6rtCONE76k/MzaFnngNdcxogesrKvyQ/tOlrdx5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774591105; c=relaxed/simple;
	bh=S94FvLjpiYmdjrScez5R2dpIZKxLERrqf9BHcAWr/WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=foZ7t/n1DsjmiMb84PsOsejQNF81u92GrfwIqm7jfH6jOrBM2vwcQG4gtKBUZEuUmXU4uENaai4rhdBDpy3f2ptp/PLml6QDaOg6PfPLFwQOb0nGI+QX89ELjDBvyn3lzUIuX7C8gCgo2BEOU/1IvejCB27RmS4Ejm9d3qKt96Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hmfi56BQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C455DC19423;
	Fri, 27 Mar 2026 05:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774591104;
	bh=S94FvLjpiYmdjrScez5R2dpIZKxLERrqf9BHcAWr/WU=;
	h=From:To:Cc:Subject:Date:From;
	b=Hmfi56BQruiPsh2/IFcrYwuio1v2LB0QKWVEcKegCJBGCUiBTix/gnB1wqlnC8N91
	 CARhB2+hTUsCGfZWj5/vaSP3gfux+iufDHQr32oNMG4CkI1HFHEqosVyhySblY7618
	 W39YMl3LqjH9wwCaMl69bWkPnxBRP+9GdgxDsy1l5u1NHmOPR/rbcPXNQMVoGh4zol
	 H5w+7+wg4y2SAdcwcVACgWk2aPY5J269gahjC12isGXWASkGSbKB+j2ZWyUIoWa/fE
	 dfMho8q4GyPb9CmhTZH8V4n1042hV+xrSWkjc61W/uE1Ml7YO/AKLzO9+2vQvQyXzI
	 BtSJUKJcRA9Hw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w60D8-0000000D1U5-2yCW;
	Fri, 27 Mar 2026 06:58:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] doc tools: better handle KBUILD_VERBOSE
Date: Fri, 27 Mar 2026 06:57:48 +0100
Message-ID: <7a99788db75630fb14828d612c0fd77c45ec1891.1774591065.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81508-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9201933F550
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As reported by Jacob, there are troubles when KBUILD_VERBOSE is
set at the environment.

Fix it on both kernel-doc and sphinx-build-wrapper.

Reported-by: Jacob Keller <jacob.e.keller@intel.com>
Closes: https://lore.kernel.org/linux-doc/9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper     | 7 ++++++-
 tools/lib/python/kdoc/kdoc_files.py | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 2c63d28f639d..1bb962202784 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -238,7 +238,12 @@ class SphinxBuilder:
             self.latexopts = os.environ.get("LATEXOPTS", "")
 
         if not verbose:
-            verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
+            try:
+                verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
+            except ValueError:
+                # Handles an eventual case where verbosity is not a number
+                # like KBUILD_VERBOSE=""
+                verbose = False
 
         if verbose is not None:
             self.verbose = verbose
diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index 2428cfc4e843..ed82b6e6ab25 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -238,7 +238,12 @@ class KernelFiles():
         """
 
         if not verbose:
-            verbose = bool(os.environ.get("KBUILD_VERBOSE", 0))
+            try:
+                verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
+            except ValueError:
+                # Handles an eventual case where verbosity is not a number
+                # like KBUILD_VERBOSE=""
+                verbose = False
 
         if out_style is None:
             out_style = OutputFormat()
-- 
2.53.0


