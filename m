Return-Path: <linux-doc+bounces-75063-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAnmK50MgmmCOQMAu9opvQ
	(envelope-from <linux-doc+bounces-75063-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 15:56:29 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8FDAE14
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 15:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEEA03094A4C
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E78B3ACF0E;
	Tue,  3 Feb 2026 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iw3egPAY"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989193ACEF9;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=YGG3flz/3bkkVgR9Zc9CliaC9vZ405nzBm9FxBBWzE9rUMMY5/br827hVnCUE1r+ChuFtSYdFjfi8fpLw4THtXFgKCzDnilOK5nPtNG0LvhvqRs3U/I584l/vX8kYWXSRWk9XbyTqeg7z7NYOzRo6V/Itqd+VLErcKf+XdxqZnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=evoBKNHKPvItoY9jitBsJ0pNF0jXPhqQ6qV4iI8PcEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CibFdxYNySNt8QIBfbSWgVSpTqmNkfJAb9JNUvJvzCEIuFYczc2FOxGOqjQQqbHow9EQ8vh9FondhVoTbMhihee8QOtgVAQhTIy361VE4oJro9+J2moLJ7/O5A/AmpS6cST3tY8lPqKBkMz/EtrRrFlhLVX7SVBA9CDi3mh0yN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iw3egPAY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4179C2BCAF;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130554;
	bh=evoBKNHKPvItoY9jitBsJ0pNF0jXPhqQ6qV4iI8PcEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iw3egPAYA419fVh3rFnF8EZIFK1u7V4HfqXv2CRWioPSAeQeAFsIXzmilM07g1GSf
	 cBsztuJEmHC4GjgWbKnVKWYd0RGfEDeb7NiN6isacV2CjZ7WLYGisS307eVuZNXFqU
	 dF+hLGQEn13HuqIxq9r/BZ0gd6La0FFVif4pCbWrNOu94w3h8ETzHSlbuqSrClD6Za
	 0brN5SfRclHR3jOLrozJXuEZMfJqqafLTeVhQC2Q5W7eiqRf4u207kud0sFSu0TBIi
	 XlEChsjpem7PA/XnZReH98E1r1CMVc9eajkYJcdGk0EUsyfhJEEwIvOttIOZgW3dLN
	 5v7ZCMVT3B/hQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHon-000000027Ui-0EqI;
	Tue, 03 Feb 2026 15:55:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Carvalho Chehab <mchehab@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 10/15] docs: add a schema to help creating unittests for kernel-doc
Date: Tue,  3 Feb 2026 15:55:38 +0100
Message-ID: <c5c0dcbcd43bdc9dfb8a897d2dfdbfb7eeaa9d7a.1770128540.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770128540.git.mchehab+huawei@kernel.org>
References: <cover.1770128540.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75063-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,json-schema.org:url]
X-Rspamd-Queue-Id: 40F8FDAE14
X-Rspamd-Action: no action

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
2.52.0


