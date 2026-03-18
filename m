Return-Path: <linux-doc+bounces-79919-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJVSJKJtumnRWQIAu9opvQ
	(envelope-from <linux-doc+bounces-79919-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:17:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AFD2B8C90
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21DBD3191862
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 09:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146AA3A4F3E;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPICeKuq"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E7D39F169;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825080; cv=none; b=oRGDPkaut8b2yJCOUnjWjj6OUGcJ6JmI22n7f0ObqdiXq1zQeWBrNhXuQ+VAaur5+cH4myyxePBA3ZjEO5wuQUFgegAZ35rJDwFJ6VKoXvClo8wst9+vd2BAxL1Fo28uMZzIv4mj3+inFVY9uhJdGzLxV4OtvsyBnHnYfeEcSCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825080; c=relaxed/simple;
	bh=nBQ14W9/TnksHUfJjA8FVeDj3iQtD4VD4UidbU9q+Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DXozSXvBwmOAd83anAcJzATBO4dXMceSoPkEfOJddvJESAkO6Wv1nDnEFXIjAOY/3y5lPrVFmfO8G65p5s1//1ouh9OuuAHHQoxJbzmetRYZZANZwb9Xo7L35UheqfMzlQwlSTAd5YLXDE+dV01CUe7n99MLXRsrH/3qg2SKSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPICeKuq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C35C2BC87;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=nBQ14W9/TnksHUfJjA8FVeDj3iQtD4VD4UidbU9q+Pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MPICeKuq7ZktL64ab2ev/n6bMNvRYlt02pOtbtgYdSMtOMLD4tWMZhJZEArhNI4ID
	 S9wrX048aUV3quXYNdMar6rXZlz0BWxVBG+cx+XgxeVYCgUc3QQQWBfSFUdVhHxSoU
	 hCbMhPoyGKZiyZnNke3WP2tGTvynoVJJPf424Z/YCFl2mMSOJrDJ7imLUbGOxdHkt7
	 fZdA+aq4BK2zRuPPP5sSrUVzmS4+UkJtwORBQ8AIfHE9Omz7oLgCMIQ6ERtFIUi46d
	 uyVc52t147YJxDVKYQNPQvfyb1AetJRLFE9P+xPDPEP5qUCkntbFxUJkb+ud0UxNeq
	 Qm0lPb4ui2Qcw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpi-2eOa;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 07/14] docs: kdoc_item: add support to generate a KdocItem from a dict
Date: Wed, 18 Mar 2026 10:11:07 +0100
Message-ID: <fafeac23d1577927e1a3c32cddfbec1e0209ac73.1773823995.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79919-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E9AFD2B8C90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When reading the contents on a KdocItem using YAML, the data
will be imported into a dict.

Add a method to create a new KdocItem from a dict to allow
converting such input into a real KdocItem.

While here, address an issue that, if the class is initialized
with an internal parameter outside the 4 initial arguments,
it would end being added inside other_stuff, which breaks
initializing it from a dict.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_item.py | 35 +++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index c0585cdbcbd1..5f41790efacb 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -25,12 +25,31 @@ class KdocItem:
         self.parameterdesc_start_lines = {}
         self.parameterdescs = {}
         self.parametertypes = {}
+
+        self.warnings = []
+
         #
         # Just save everything else into our own dict so that the output
         # side can grab it directly as before.  As we move things into more
         # structured data, this will, hopefully, fade away.
         #
-        self.other_stuff = other_stuff
+        known_keys = {
+            'declaration_start_line',
+            'sections',
+            'sections_start_lines',
+            'parameterlist',
+            'parameterdesc_start_lines',
+            'parameterdescs',
+            'parametertypes',
+            'warnings',
+        }
+
+        self.other_stuff = {}
+        for k, v in other_stuff.items():
+            if k in known_keys:
+                setattr(self, k, v)           # real attribute
+            else:
+                self.other_stuff[k] = v
 
     def get(self, key, default = None):
         """
@@ -41,6 +60,20 @@ class KdocItem:
     def __getitem__(self, key):
         return self.get(key)
 
+    @classmethod
+    def from_dict(cls, d):
+        """Create a KdocItem from a plain dict."""
+
+        cp = d.copy()
+        name        = cp.pop('name', None)
+        fname       = cp.pop('fname', None)
+        type        = cp.pop('type', None)
+        start_line  = cp.pop('start_line', 1)
+        other_stuff = cp.pop('other_stuff', {})
+
+        # Everything that’s left goes straight to __init__
+        return cls(name, fname, type, start_line, **cp, **other_stuff)
+
     #
     # Tracking of section and parameter information.
     #
-- 
2.53.0


