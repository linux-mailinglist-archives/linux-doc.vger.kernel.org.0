Return-Path: <linux-doc+bounces-79925-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCRgHadtumnRWQIAu9opvQ
	(envelope-from <linux-doc+bounces-79925-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:17:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5472B8CA0
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BF203195676
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 09:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7806D3A6404;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O44EzMM3"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0568039E16C;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=q86CLMiCZCuZPB4jNZpLM2TfhbYJHAva8P9x96vOWyQ0MReDgGIfjkSiJmVDcAQa1VjYBDToN1Bwz/6fqNKQBBS9mTKKAQsNOEdlzZWCCVEKTV5E//7WBXZavFuPL8ZRGsO96xo0x9FZjmjEL4c0mgso9QGzbDyhN/y09fB8W5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=X1yEX8lbYO0S5xeoDrx5PLqGmHxcZe9gt4OR2H1Y1no=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mS3L2fKNaV8oI958X6hGBXT+HIpu8Nm4UZK7kXQFF/N3VY1XwqWmRzJEgDHfQrwuh3nWh/Q17ho+yY+x2OnM+P6zAYbYTOUBz+5eV/2QRABrAkVQ+n0iAza2x7zClxfaoeSa4iKLlwdNs2zFVBhPeWBXJZApUeDoFmfoa/Je0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O44EzMM3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D38DC2BCC4;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=X1yEX8lbYO0S5xeoDrx5PLqGmHxcZe9gt4OR2H1Y1no=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O44EzMM3fkg8xY0/+XIe0G63xhtWyglXyLSFymMQq29oF2tz5uh67C9hiheDrKn+L
	 pJmsdCvm7VYO6SVRxH4mlJdQLGvSBK6Ot1BSLJ5phzD39LjOeBN8WBdvbIYCmFP3r1
	 8wiXN+lIsfxWEMPz9l/A1Nh0eif+jtQu19qbwrCFKsF7Quk8n/4rG9V306TtCs1ioh
	 IYfVnEDhaDBkYFreIS3r5j14AVO7K5BY17LghKcCy2sNFqc54bhJPFtGwF9ITFxJpo
	 SrRj25CEuSo8NbHNpU87tSHM/x2lYZiZUfwf9Ccdx8Z+Wc6hdUfbUntkKq7KBSzmHH
	 /4iqJHOL7YXGw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpu-2zA8;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 10/14] docs: add a schema to help creating unittests for kernel-doc
Date: Wed, 18 Mar 2026 10:11:10 +0100
Message-ID: <f42fd816ee0d257c736b30977b10f04f6bea27c2.1773823995.git.mchehab+huawei@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-79925-lists,linux-doc=lfdr.de,huawei];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,json-schema.org:url]
X-Rspamd-Queue-Id: DB5472B8CA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of hardcoding lots of tests inside a file, let's place
them inside a yaml file.

Add first a schema to handle it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/unittests/kdoc-test-schema.yaml | 156 ++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 tools/unittests/kdoc-test-schema.yaml

diff --git a/tools/unittests/kdoc-test-schema.yaml b/tools/unittests/kdoc-test-schema.yaml
new file mode 100644
index 000000000000..cf5079711cd8
--- /dev/null
+++ b/tools/unittests/kdoc-test-schema.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright(c) 2026: Mauro Carvalho Chehab <mchehab@kernel.org>.
+
+# KDoc Test File Schema
+
+# This schema contains objects and properties needed to run kernel-doc
+# self-tests.
+
+$schema: "http://json-schema.org/draft-07/schema#"
+
+tests:
+  type: array
+  minItems: 1
+  description: |
+    A list of kernel-doc tests.
+
+  properties:
+    type: object
+    properties:
+      name:
+        type: string
+        description: |
+          Test name. Should be an unique identifier within the schema.
+          Don't prepend it with "test", as the dynamic test creation will
+          do it.
+
+      description:
+        type: string
+        description: |
+          Test description
+
+      source:
+        type: string
+        description: |
+          C source code that should be parsed by kernel-doc.
+
+      fname:
+        type: string
+        description: |
+          The filename that contains the element.
+          When placing real testcases, please use here the name of
+          the C file (or header) from where the source code was picked.
+
+      exports:
+        type: array
+        items: { type: string }
+        description: |
+          A list of export identifiers that are expected when parsing source.
+
+      expected:
+        type: array
+        minItems: 1
+        description: |
+          A list of expected values. This list consists on objects to check
+          both kdoc_parser and/or kdoc_output objects.
+
+        items:
+          type: object
+          properties:
+            #
+            #  kdoc_item
+            #
+            kdoc_item:
+              type: object
+              description: |
+                Object expected to represent the C source code after parsed
+                by tools/lib/python/kdoc/kdoc_parser.py KernelDoc class.
+                See tools/lib/python/kdoc/kdoc_item.py for its contents.
+
+              properties:
+                name:
+                  type: string
+                  description: |
+                    The name of the identifier (function name, struct name, etc).
+                type:
+                  type: string
+                  description: |
+                    Type of the object, as filled by kdoc_parser. can be:
+                    - enum
+                    - typedef
+                    - union
+                    - struct
+                    - var
+                    - function
+                declaration_start_line:
+                  type: integer
+                  description: |
+                    The line number where the kernel-doc markup started.
+                    The first line of the code is line number 1.
+                sections:
+                  type: object
+                  additionalProperties: { type: string }
+                  description: |
+                    Sections inside the kernel-doc markups:
+                    - "description"
+                    - "return"
+                    - any other part of the markup that starts with "something:"
+                sections_start_lines:
+                  type: object
+                  additionalProperties: { type: integer }
+                  description: |
+                    a list of section names and the starting line of it.
+                parameterlist:
+                  type: array
+                  items: { type: string }
+                  description: |
+                    Ordered list of parameter names.
+
+                parameterdesc_start_lines:
+                  type: object
+                  additionalProperties: { type: integer }
+                  description: |
+                    Mapping from parameter name to the line where its
+                    description starts.
+                parameterdescs:
+                  type: object
+                  additionalProperties: { type: string }
+                  description: |
+                    Mapping from parameter name to its description.
+
+                parametertypes:
+                  type: object
+                  additionalProperties: { type: string }
+                  description: |
+                    Mapping from parameter name to its type.
+
+                other_stuff:
+                  type: object
+                  additionalProperties: {}
+                  description: |
+                    Extra properties that will be stored at the item.
+                    Should match what kdoc_output expects.
+
+              required:
+                - name
+                - type
+                - declaration_start_line
+
+            rst:
+              type: string
+              description: |
+                The expected output for RestOutput class.
+
+            man:
+              type: string
+              description: |
+                The expected output for ManOutput class.
+
+        anyOf:
+          required: kdoc_item
+          required: source
+
+    required:
+      - name
+      - fname
+      - expected
-- 
2.53.0


