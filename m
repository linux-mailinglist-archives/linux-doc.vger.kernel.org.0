Return-Path: <linux-doc+bounces-79963-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMM4ADC2umlWawIAu9opvQ
	(envelope-from <linux-doc+bounces-79963-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 15:26:56 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1152BD148
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 15:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 286703005A99
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 14:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB1B3DB630;
	Wed, 18 Mar 2026 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVjoDxyf"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD643DA7FD;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843979; cv=none; b=RyPXQpu13M2mFESz5saZSECSj1dYtAb2ezzgysN+3h1lL5huyER61rUCLL3Cfy46pz9oRklROWh8Fswbl9687koLiWUCTKvwEWhpi06YD882IDsYYqvR1x+A3CbRCePjactt+J8S+sUbIM72BG+l0mzMsjRYLPzsn/bJCPvMiqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843979; c=relaxed/simple;
	bh=PVuUxY0UBh/TyohCLNBhmSJDN0/gR3uZQAbhIHlOaYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxOEypoTkYtM5upWY90V6xbz5FHcu9KkjW2w30zEelJ51alTDPlOa0LAzDBOATQ2xDTf9wzXz+xJUxru6W4NZGQpd7sZjGoJP30Rs1DZ9ZGUyQA18NflnFwfQ/01zL5qN4qWkD19Nhol0hYPr2FJXDtYjo3A6wK94QxVrSoIKdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVjoDxyf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BD0C19421;
	Wed, 18 Mar 2026 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843979;
	bh=PVuUxY0UBh/TyohCLNBhmSJDN0/gR3uZQAbhIHlOaYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qVjoDxyfBh9pOFVUGxDd4owgC3/enwXoDLD0CpGuaCbUJRKmVD03r8hf4rF5BfrJc
	 j4MU3wp17JGIjbSWLnHPrZAQF4N5fNe+CLX7smzt9PAOpN2HYX8J7t7Co3fCXSY6ON
	 w2K9ZzM7eQaPBgead4raEyCIbyPqBsff3l8B3NXN95eMe8Yo0+PKqRLNj1hizpVd29
	 Sr8f+5IQ93WWCJdDLXrSME54dm3syQLSmztVD/ArvEu4E0Wf2yKMiXnC2wZH96x47v
	 32Rvm4pA/pGTtZbofw5OSasGXy1vnqJVTY3qBGIDOt5KT7AF4INBAOHOjFpLWOnpX2
	 ymYoSC5tvr8Uw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2rqk-00000004Hc9-0C8k;
	Wed, 18 Mar 2026 15:26:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] docs: kdoc_yaml_file: add a representer to make strings look nicer
Date: Wed, 18 Mar 2026 15:26:09 +0100
Message-ID: <04a4a28730881a4362b69a12552519448463d3b0.1773841456.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773841456.git.mchehab+huawei@kernel.org>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79963-lists,linux-doc=lfdr.de,huawei];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE1152BD148
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
2.52.0


