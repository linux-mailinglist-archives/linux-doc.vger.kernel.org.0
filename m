Return-Path: <linux-doc+bounces-77612-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENb9DMC+pWknFgAAu9opvQ
	(envelope-from <linux-doc+bounces-77612-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 17:45:52 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C20E1DD276
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 17:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 423803050CE3
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2026 16:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF94421EF3;
	Mon,  2 Mar 2026 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzlM5sWZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25601426ED6;
	Mon,  2 Mar 2026 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469672; cv=none; b=dlc6tpXFX2xJ9rZYAnQcd63ejpmqLnUH1vw8MRhKDt0uMGHTL1A7iFMcP8QjkdpjTm514nD3EONLUMnoaoYIiP3Yr4FLVn0SscePvFn+xMytNzZ/SRK0MLiK7qOqrpHG7Bxs/zIrmBPn5ZdJXnzQPBFk9dTMMn0GGVuEKd7yfoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469672; c=relaxed/simple;
	bh=t77gn4U/VzR14zgC6Ju/IS9Cd/1izGmRsVc9qw15YwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XdgcKq/MsD0z5a8QCuTrKbOneakOmnoQ+dBI/0Xdm7/AgIAM88Cfr2OJcRjhsM5kpgQ4kwPoxeJSmoFthzbbja/8YecK6uE6hb3+8G6hzyzcqdlHwqh4PoLSSZuRKKgJcWT5jvHx1EJZuOOnr4SsBpictcIpI8tRp2EMRWbriXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzlM5sWZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3E2C2BC87;
	Mon,  2 Mar 2026 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772469672;
	bh=t77gn4U/VzR14zgC6Ju/IS9Cd/1izGmRsVc9qw15YwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gzlM5sWZV80NN7sK3wasPoZV7Q7S94p209U9rY9jkpHVOK4c5xM686LEAJR7meKmD
	 Fi3LURfZo88qfsxEJdWqEGsx85MsmFZUUPKF15ViQsHjB8NvU6yhCtzfJsfDJ96HfQ
	 UX6xuLDlL4p7IEktboaE3685p2Dd5Uxdp0FD2CMF6tDO9lvOPPpj3fwgwkDqAOcL5P
	 BTM8YlOVXkq/a/ZVxdzdsM2qlwKrfTJBRrvpxY724LCuqnaGUye8jxVqgTefX2ga2u
	 LMVEEMdUZeSrgJWkokxJ1K3Fn6ESeg844Gr3F69eAqffm93IOMiVpWOjj9eO/5xj5r
	 0URb++8CTdqKA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vx6KU-000000003ID-0eLH;
	Mon, 02 Mar 2026 17:41:10 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 18/18] docs: kdoc_parser: move nested match transforms to xforms_lists.py
Date: Mon,  2 Mar 2026 17:41:01 +0100
Message-ID: <762ce2a58ff024c1b0b6f6a6e05020d1415b8308.1772469446.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772469446.git.mchehab+huawei@kernel.org>
References: <cover.1772469446.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 1C20E1DD276
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-77612-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

As NestedMatch now has a sub method and a declaration close to
what KernRe does, we can move the rules to xforms_lists and
simplify kdoc_parser a little bit.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py  | 21 ---------------------
 tools/lib/python/kdoc/xforms_lists.py | 14 +++++++++++++-
 2 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index cd9857906a2b..edf70ba139a5 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -69,25 +69,6 @@ doc_begin_func = KernRe(str(doc_com) +			# initial " * '
                         r'(?:[-:].*)?$',		# description (not captured)
                         cache = False)
 
-#
-# Regexes here are guaranteed to have the end delimiter matching
-# the start delimiter. Yet, right now, only one replace group
-# is allowed.
-#
-struct_nested_prefixes = [
-    (NestedMatch(r"__cond_acquires\s*\("), ""),
-    (NestedMatch(r"__cond_releases\s*\("), ""),
-    (NestedMatch(r"__acquires\s*\("), ""),
-    (NestedMatch(r"__releases\s*\("), ""),
-    (NestedMatch(r"__must_hold\s*\("), ""),
-    (NestedMatch(r"__must_not_hold\s*\("), ""),
-    (NestedMatch(r"__must_hold_shared\s*\("), ""),
-    (NestedMatch(r"__cond_acquires_shared\s*\("), ""),
-    (NestedMatch(r"__acquires_shared\s*\("), ""),
-    (NestedMatch(r"__releases_shared\s*\("), ""),
-    (NestedMatch(r'\bSTRUCT_GROUP\('), r'\0'),
-]
-
 #
 # Ancillary functions
 #
@@ -761,8 +742,6 @@ class KernelDoc:
         members = trim_private_members(members)
         members = self.xforms.apply("struct", members)
 
-        for search, sub in struct_nested_prefixes:
-            members = search.sub(search, sub, members)
         #
         # Deal with embedded struct and union members, and drop enums entirely.
         #
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index 1bda7c4634c3..c07cbe1e6349 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -4,7 +4,7 @@
 
 import re
 
-from kdoc.kdoc_re import KernRe
+from kdoc.kdoc_re import KernRe, NestedMatch
 
 struct_args_pattern = r'([^,)]+)'
 
@@ -94,6 +94,18 @@ class CTransforms:
         (KernRe(r'DEFINE_DMA_UNMAP_ADDR\s*\(' + struct_args_pattern + r'\)', re.S), r'dma_addr_t \1'),
         (KernRe(r'DEFINE_DMA_UNMAP_LEN\s*\(' + struct_args_pattern + r'\)', re.S), r'__u32 \1'),
         (KernRe(r'VIRTIO_DECLARE_FEATURES\(([\w_]+)\)'), r'union { u64 \1; u64 \1_array[VIRTIO_FEATURES_U64S]; }'),
+
+        (NestedMatch(r"__cond_acquires\s*\("), ""),
+        (NestedMatch(r"__cond_releases\s*\("), ""),
+        (NestedMatch(r"__acquires\s*\("), ""),
+        (NestedMatch(r"__releases\s*\("), ""),
+        (NestedMatch(r"__must_hold\s*\("), ""),
+        (NestedMatch(r"__must_not_hold\s*\("), ""),
+        (NestedMatch(r"__must_hold_shared\s*\("), ""),
+        (NestedMatch(r"__cond_acquires_shared\s*\("), ""),
+        (NestedMatch(r"__acquires_shared\s*\("), ""),
+        (NestedMatch(r"__releases_shared\s*\("), ""),
+        (NestedMatch(r'\bSTRUCT_GROUP\('), r'\0'),
     ]
 
     #: Transforms for function prototypes.
-- 
2.52.0


