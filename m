Return-Path: <linux-doc+bounces-75067-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dIBEILcMgmkKOwMAu9opvQ
	(envelope-from <linux-doc+bounces-75067-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 15:56:55 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E875DDAE48
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 15:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 104FC309ECF7
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 14:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC7F3AE6F7;
	Tue,  3 Feb 2026 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hN/0/vB8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A254A3ACEFE;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=oy3sLthCN9nZi9qCAjRpu1zezErfJfFJM7TF0XFhZz3JasKUtLGY6X1cu3Um/OB3nYsAC1n+hUzxHIh2fLoCT7rR6HmLyYMF4rmd3tmfMa3aFjmIHu4fyXh1MEhr3rZXp4DEjORd6TNs7F4ZVAHZ0sq/OUYQpahz1xa9BCFeSrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=17maUKpPJIi7w1foiKEU2VL1TpBiPLMmE6g5vXMaPPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dk0Vhiv+igG+a44cPWF4dt63al0u59BlM30zJw3jO4f8uyE6pKkGJGZNTkblPICqk/9+tk6wSdmNeFsamUYl+dZNnsbTd3ObMKNlM64RPCdeef9hggrRW/IAF4WyZcUv4/7ZYfsu1KsLt7nHK6MjhOQdtqkH3OHBzTl5TOq6nPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hN/0/vB8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF3DC2BC86;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130554;
	bh=17maUKpPJIi7w1foiKEU2VL1TpBiPLMmE6g5vXMaPPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hN/0/vB8P2viE4jK2hZPmWbCPuy9ipAhbu6ODwL3O2A5CK7gg4R9qsExYYTK65+oP
	 ZF4FZEXoDo85ba/U51i2ZqySOt6ZZ8MsH4VzP1/kh81ntU1xRgfz/IMa8tEXQ6px1c
	 50ryOvcbHaEmBvnVd9g9a5mXB1mdayGnuMr2PMWe3QV7NBq1T4YKGWGMWiwiTsUj/6
	 BR3EL5RCNEv8fpfxa8NjFtlz/hLFnrTS1lxUftnKbpj7THMU9t68bOcNVyWSAHovic
	 P0PyuhmpZT8PXvFsmZCBise4nnZoYnXEIcvNpq4YUUWf9Wr5Bu0aqeAuxeiKP7zAZU
	 7W1tUCGUSyv4A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHon-000000027Ua-00if;
	Tue, 03 Feb 2026 15:55:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 08/15] docs: kdoc_item: fix a typo on sections_start_lines
Date: Tue,  3 Feb 2026 15:55:36 +0100
Message-ID: <a988e935f6455fdabbac1bd4c6be74d8e1ef9198.1770128540.git.mchehab+huawei@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75067-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,self.data:url]
X-Rspamd-Queue-Id: E875DDAE48
X-Rspamd-Action: no action

Currently, there are 15 occurrences of section?_start_lines,
with 10 using the plural way.

This is an issue, as, while kdoc_output works with KdocItem,
the term doesn't match its init value.

The variable sections_start_lines stores multiple sections,
so placing it in plural is its correct way.

So, ensure that, on all parts of kdoc, this will be referred
as sections_start_lines.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_item.py   | 2 +-
 tools/lib/python/kdoc/kdoc_output.py | 2 +-
 tools/lib/python/kdoc/kdoc_parser.py | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index 5f41790efacb..fe08cac861c2 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -82,7 +82,7 @@ class KdocItem:
         Set sections and start lines.
         """
         self.sections = sections
-        self.section_start_lines = start_lines
+        self.sections_start_lines = start_lines
 
     def set_params(self, names, descs, types, starts):
         """
diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index ece03cd9d321..6ab5a13edbb5 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -389,7 +389,7 @@ class RestFormat(OutputFormat):
             else:
                 self.data += f'{self.lineprefix}**{section}**\n\n'
 
-            self.print_lineno(args.section_start_lines.get(section, 0))
+            self.print_lineno(args.sections_start_lines.get(section, 0))
             self.output_highlight(text)
             self.data += "\n"
         self.data += "\n"
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index a280fe581937..940c848d4d80 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -152,7 +152,7 @@ class KernelEntry:
         self.parametertypes = {}
         self.parameterdesc_start_lines = {}
 
-        self.section_start_lines = {}
+        self.sections_start_lines = {}
         self.sections = {}
 
         self.anon_struct_union = False
@@ -232,7 +232,7 @@ class KernelEntry:
                 self.sections[name] += '\n' + contents
             else:
                 self.sections[name] = contents
-                self.section_start_lines[name] = self.new_start_line
+                self.sections_start_lines[name] = self.new_start_line
                 self.new_start_line = 0
 
 #        self.config.log.debug("Section: %s : %s", name, pformat(vars(self)))
@@ -326,7 +326,7 @@ class KernelDoc:
         for section in ["Description", "Return"]:
             if section in sections and not sections[section].rstrip():
                 del sections[section]
-        item.set_sections(sections, self.entry.section_start_lines)
+        item.set_sections(sections, self.entry.sections_start_lines)
         item.set_params(self.entry.parameterlist, self.entry.parameterdescs,
                         self.entry.parametertypes,
                         self.entry.parameterdesc_start_lines)
-- 
2.52.0


