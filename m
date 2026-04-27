Return-Path: <linux-doc+bounces-84745-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHgTJfJe72njAgEAu9opvQ
	(envelope-from <linux-doc+bounces-84745-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:04:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E54731B0
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 15:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46D8230704C6
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 13:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00413C2788;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f67TXgqg"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996D93C1991;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294818; cv=none; b=Nkdr0hoNxhLDOu3/l7pZE03KoG1Bw1a2ZGqsYAsOFbbHyMWppXcHwV/lcw8QLJR3O7rBbz26VSnrNJOYOAb3H+Lz9UG5n7waSATjXSY0mAJeQTDDV5/nzK7qtoaTUhGurOPPIGfjdeLYiyOL6+SjGnNnaQf7WLkx+2SBSPn8fEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294818; c=relaxed/simple;
	bh=PN4FPVYRORp3XTpdvjjtDtB0ZIfuMMKyf0YVAqRdNAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EvaBK2UKmsHk1pwmUgFNych/F/54X8bfr9KWCMu5AipwmQxe4U74yQ+bbQiBSshUT6X/RCQycAixhrS76V5ObTRuC39jRy88uCtONvw3N7j8GdJUXiEfBF43N+Y7eX2c6Db+9KczvSS8RPVgRcJA9EWZ/XIi8+e6+U8di1L5CHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f67TXgqg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7F0C2BCB7;
	Mon, 27 Apr 2026 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294818;
	bh=PN4FPVYRORp3XTpdvjjtDtB0ZIfuMMKyf0YVAqRdNAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f67TXgqg4zjIJXENGzkvz4GYvaiC4BnkIHchingFfznXrPsjIsst3PnS4JJM6TMU6
	 lr0I6L2NkyapP2M2oaEzOt4QAxLCsf6hMNffZdI/gk2xsoXJJd+/LyABHdtETjAZKz
	 CaetEIpb/VpaGEycmkr0WEXi13ALVnvNFxaCKM7IZS7uS3s4wNb5K4ITsU3rTNy3Db
	 rK7FxGyf+M3j9RLpinBI3pulSNPiC5XE/I/0AY04guqc7b4jA2zniQZaEPZOWYmNqe
	 X+yS3ZQE07hSdiQN/SDpWqd+jly9Vud05bLYqUyaYeVgvhsltb0LP+1LiDsM8hCJAr
	 M5UvBvigcK8kg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZQ-0000000Bx9g-2kW1;
	Mon, 27 Apr 2026 15:00:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 07/12] docs: maintainers_include: add external profile URLs
Date: Mon, 27 Apr 2026 15:00:07 +0200
Message-ID: <753dd27fbab209fc1b87862bd6204b2026a85313.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: C45E54731B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84745-lists,linux-doc=lfdr.de,huawei];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Some subsystem profiles are maintained elsewhere. Add them to
the output.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 28 +++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index cf428db7599c..f1b8d4b00c2a 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -37,6 +37,7 @@ class MaintainersParser:
 
     def __init__(self, base_path, path):
         self.profiles = {}
+        self.profile_urls = {}
 
         result = list()
         result.append(".. _maintainers:")
@@ -81,6 +82,16 @@ class MaintainersParser:
                     else:
                         self.profiles[fname] += f", {subsystem_name}"
 
+            match = re.match(r"P:\s*(https?://.*)", line)
+            if match:
+                url = match.group(1).strip()
+                if url not in self.profile_urls:
+                    if self.profile_urls.get(url) is None:
+                        self.profile_urls[url] = subsystem_name
+                    else:
+                        self.profile_urls[url] += f", {subsystem_name}"
+
+
             # Linkify all non-wildcard refs to ReST files in Documentation/.
             pat = r'(Documentation/([^\s\?\*]*)\.rst)'
             m = re.search(pat, line)
@@ -219,18 +230,31 @@ class MaintainersProfile(Include):
     def emit(self, base_path, path):
         """Parse all the MAINTAINERS lines looking for profile entries"""
 
-        profiles = MaintainersParser(base_path, path).profiles
+        maint = MaintainersParser(base_path, path)
 
         output  = ".. toctree::\n"
         output += "   :maxdepth: 2\n\n"
 
-        items = sorted(profiles.items(), key=lambda kv: (kv[1] or "", kv[0]))
+        items = sorted(maint.profiles.items(),
+                       key=lambda kv: (kv[1] or "", kv[0]))
         for fname, profile in items:
             if profile:
                 output += f"   {profile} <{fname}>\n"
             else:
                 output += f"   {fname}\n"
 
+        output += "\n**External profiles**\n\n"
+
+        items = sorted(maint.profile_urls.items(),
+                       key=lambda kv: (kv[1] or "", kv[0]))
+        for url, profile in items:
+            if profile:
+                output += f"- {profile} <{url}>\n"
+            else:
+                output += f"- {url}\n"
+
+        output += "\n"
+
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
-- 
2.53.0


