Return-Path: <linux-doc+bounces-78207-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIz1H9D2qmlxZAEAu9opvQ
	(envelope-from <linux-doc+bounces-78207-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:46:24 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B8224234
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 16:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 898B230225BC
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2026 15:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D526F3ED10F;
	Fri,  6 Mar 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfkJDEEn"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FDD3ECBF0;
	Fri,  6 Mar 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811960; cv=none; b=AnnxCwGgz6wR0ZkMHHNUNHs47Ec1ToeANl9yPXNbjIwCGKfSd0ClxgtcmIa+l45n6FoQ2/PUZqzikZdy71ST0bVKG0WvHq35utmuMIHJqOkeu02LkBCB3XW04anrtH1/xptItZeBlzzr38/enNVXYI7g+faZk5gsFor2VwNI9uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811960; c=relaxed/simple;
	bh=9wu4zIA922C3Stn1+dXiQYG1rhAOlEJZPy1s0WQ2X8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZFEM9WqbxgeVkAk77hj682ijm+qafXZZG7gcry6bhSCF8Opm6KHysXKF8BaIqWskfEftwGSLwecdCJ8QdRgPR8fVsC7lv+ArMrPzTw7fktuqcNJbBZgtCTotjL0QATZ20c6B2wwavd9CCBOMP5WlYEKSPWgZJOJBheDw6Q1T04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfkJDEEn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5C4C2BC87;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811960;
	bh=9wu4zIA922C3Stn1+dXiQYG1rhAOlEJZPy1s0WQ2X8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EfkJDEEnAV8iTyjZ9yIB9BL73WQ4Y0BA1nL2W36lAqgVV6TtzX+cvn9b3g3pZLjJQ
	 50GsAwo3WoZK4ffkz6AfCNJIeFW3HDvngH7l/mFXpOSFxeecQQvt41fyWqyNDA0jH6
	 QHL9ZDvFASK+lCrc4XCtTSV6U0mHxRRhfQAprfNDON3UN1NFPunXG0YKnzGbjMm8tO
	 o3xuxSbazrz0nGz11bZ2EvaGcgu6E9UBEpRcB+d3ow0335juYjU8fJLSz/8OMZoYFp
	 LoE2TvZnAcwQrcXcOlv0idsgBorAWaPZG4oLy1k3p+Z4pEOR/FxojACCCVQM8gFIfP
	 Xl1MLSSi+jiKQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNG-00000007Eih-0QU3;
	Fri, 06 Mar 2026 16:45:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] docs: kdoc_output: add a logic to handle tables inside kernel-doc markups
Date: Fri,  6 Mar 2026 16:45:49 +0100
Message-ID: <442ad76442c325044eb9f34a155d5f484341fb35.1772810752.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 8E6B8224234
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78207-lists,linux-doc=lfdr.de,huawei];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,self.data:url]
X-Rspamd-Action: no action

specially when DOC is used, it is not uncommon to have tables
inside a kernel-doc markup.

Add support for simple tables and complex grid tables when output
in groff format.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 130 +++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 9caffe0d9753..7848514a4d22 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -744,6 +744,126 @@ class ManFormat(OutputFormat):
 
         return self.data
 
+    def emit_table(self, colspec_row, rows):
+
+        if not rows:
+            return ""
+
+        out = ""
+        colspec = "\t".join(["l"] * len(rows[0]))
+
+        out += "\n.TS\n"
+        out += "box;\n"
+        out += f"{colspec}.\n"
+
+        if colspec_row:
+            out_row = []
+
+            for text in colspec_row:
+                out_row.append(f"\\fB{text}\\fP")
+
+            out += "\t".join(out_row) + "\n_\n"
+
+        for r in rows:
+            out += "\t".join(r) + "\n"
+
+        out += ".TE\n"
+
+        return out
+
+    def grid_table(self, lines, start):
+        """
+        Ancillary function to help handling a grid table inside the text.
+        """
+
+        i = start + 1
+        rows = []
+        colspec_row = None
+
+        while i < len(lines):
+            line = lines[i]
+
+            if KernRe(r"^\s*\|.*\|\s*$").match(line):
+                parts = []
+
+                for p in line.strip('|').split('|'):
+                    parts.append(p.strip())
+
+                rows.append(parts)
+
+            elif KernRe(r'^\+\=[\+\=]+\+\s*$').match(line):
+                if rows and rows[0]:
+                    if not colspec_row:
+                        colspec_row = [""] * len(rows[0])
+
+                    for j in range(0, len(rows[0])):
+                        content = []
+                        for row in rows:
+                            content.append(row[j])
+
+                        colspec_row[j] = " ".join(content)
+
+                    rows = []
+
+            elif KernRe(r"^\s*\+[-+]+\+.*$").match(line):
+                pass
+
+            else:
+                break
+
+            i += 1
+
+        return i, self.emit_table(colspec_row, rows)
+
+    def simple_table(self, lines, start):
+        """
+        Ancillary function to help handling a simple table inside the text.
+        """
+
+        i = start
+        rows = []
+        colspec_row = None
+
+        pos = []
+        for m in KernRe(r'\-+').finditer(lines[i]):
+            pos.append((m.start(), m.end() - 1))
+
+        i += 1
+        while i < len(lines):
+            line = lines[i]
+
+            if KernRe(r"^\s*[\-]+[ \t\-]+$").match(line):
+                i += 1
+                break
+
+            elif KernRe(r'^[\s=]+$').match(line):
+                if rows and rows[0]:
+                    if not colspec_row:
+                        colspec_row = [""] * len(rows[0])
+
+                    for j in range(0, len(rows[0])):
+                        content = []
+                        for row in rows:
+                            content.append(row[j])
+
+                        colspec_row[j] = " ".join(content)
+
+                    rows = []
+
+            else:
+                row = [""] * len(pos)
+
+                for j in range(0, len(pos)):
+                    start, end = pos[j]
+
+                    row[j] = line[start:end].strip()
+
+                rows.append(row)
+
+            i += 1
+
+        return i, self.emit_table(colspec_row, rows)
+
     def output_highlight(self, block):
         """
         Outputs a C symbol that may require being highlighted with
@@ -764,6 +884,16 @@ class ManFormat(OutputFormat):
             line = KernRe(r"^\s*").sub("", org_line)
 
             if line:
+                if KernRe(r"^\+\-[-+]+\+.*$").match(line):
+                    i, text = self.grid_table(lines, i)
+                    self.data += text
+                    continue
+
+                if KernRe(r"^\-+[ \t]\-[ \t\-]+$").match(line):
+                    i, text = self.simple_table(lines, i)
+                    self.data += text
+                    continue
+
                 if line[0] == ".":
                     self.data += "\\&" + line + "\n"
                     i += 1
-- 
2.52.0


