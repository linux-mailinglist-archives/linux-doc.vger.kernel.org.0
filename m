Return-Path: <linux-doc+bounces-80626-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOVmLAQFwWlUPgQAu9opvQ
	(envelope-from <linux-doc+bounces-80626-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 10:16:52 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 472DB2EED60
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 10:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7987F3051D3A
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 09:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFB238654C;
	Mon, 23 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcxXn9Kb"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19683386453;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=cLCgMZpJPMxLi6VvanM0fyJcQgwg+K7ZZsaRO/GqCqw0PpKDkx7eLuZTj6EzwuYFplnEZMDuJIIzqUgAEZICRQnRJ6e74Z6nDhAABJJBUNxqHhhFStiG4eaoXzn7kZZn+d5GVQye43MEWQDd4yRs0NIaSlaPzWbkUIpAnC6OBNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=fPzInczANAdOGjNACOlImNH9I8DEnTQnoNy6KxDMv84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CL903bWcEqOPFeY1JALADuWXzSrvdUkC1TnD8n4ra15u5D89Q9VYG1MEIvX6LqxfEdv1I39S1qTU6gmSkKtpc1l3DXN9sls6UOyQHSexRwUqNruV6eEiyCczekYABBD01bW38yIt9fChq2+NiIkmStSdpgMHz0V9n+uV8Gi9dqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcxXn9Kb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3572C2BC9E;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=fPzInczANAdOGjNACOlImNH9I8DEnTQnoNy6KxDMv84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WcxXn9KbyrozgA4LcNrurgvB0aXFzvx395cXPq97WNBvy5kvoTHwYsGDdzvu/aV+1
	 P5Biji5gFqwd0K7A03F/DOtK1BHPNyurf3u1Xg5IsGtwTNoa8FOtlKd4uspevalYnF
	 ZX8ka64VQTklRi2s9ZOD6/JTwagU6Q1LS43rz2qCUFU4CdQPkX9pY/Pf5+i00ZaFCa
	 DaJxJcoqJMcYEfwZN/jVNkXY+H/mje6uklt7cA99xPW9i+UxMBvwwixlQRadfKG4AZ
	 tR80hXq/5jszy9DZ2dNIewvfHLkRUyHozirLX14b9Eomv8YR4LFX9DmmysbnVbAXqX
	 aU6KSHPmmCYXg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWU-1wWB;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 04/10] docs: kdoc_yaml_file: add a representer to make strings look nicer
Date: Mon, 23 Mar 2026 10:10:47 +0100
Message-ID: <422041a8b49b2609de5749092fe074b7948c32a6.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774256269.git.mchehab+huawei@kernel.org>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80626-lists,linux-doc=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.30.226.201:received,100.90.174.1:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 472DB2EED60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The strings representation is not ok, currently. Add a helper
function to improve it, and drop blank lines at beginning and
at the end of the dumps

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_yaml_file.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_yaml_file.py b/tools/lib/python/kdoc/kdoc_yaml_file.py
index db131503c3f6..18737abb1176 100644
--- a/tools/lib/python/kdoc/kdoc_yaml_file.py
+++ b/tools/lib/python/kdoc/kdoc_yaml_file.py
@@ -126,7 +126,7 @@ class KDocTestFile():
                 else:
                     key = "rst"
 
-                expected_dict[key]= out_style.output_symbols(fname, [arg])
+                expected_dict[key]= out_style.output_symbols(fname, [arg]).strip()
 
             name = f"{base_name}_{i:03d}"
 
@@ -148,8 +148,20 @@ class KDocTestFile():
         """
         import yaml
 
+        # Helper function to better handle multilines
+        def str_presenter(dumper, data):
+            if "\n" in data:
+                return dumper.represent_scalar("tag:yaml.org,2002:str", data, style="|")
+
+            return dumper.represent_scalar("tag:yaml.org,2002:str", data)
+
+        # Register the representer
+        yaml.add_representer(str, str_presenter)
+
         data = {"tests": self.tests}
 
         with open(self.test_file, "w", encoding="utf-8") as fp:
-            yaml.safe_dump(data, fp, sort_keys=False, default_style="|",
-                           default_flow_style=False, allow_unicode=True)
+            yaml.dump(data, fp,
+                      sort_keys=False, width=120, indent=2,
+                      default_flow_style=False, allow_unicode=True,
+                      explicit_start=False, explicit_end=False)
-- 
2.53.0


