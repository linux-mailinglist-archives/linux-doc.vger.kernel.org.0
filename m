Return-Path: <linux-doc+bounces-80320-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNDWDg8YvWnG6QIAu9opvQ
	(envelope-from <linux-doc+bounces-80320-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 10:49:03 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E202D8444
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 10:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6CFB31046DB
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 09:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEC13603E4;
	Fri, 20 Mar 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVSXhx3p"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DE35E956;
	Fri, 20 Mar 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000006; cv=none; b=CY2bne/5405oY9lhGx3bDH5h0fHn8hlaZohNt0Hi3bAHU+wKUDxaGt7nQ+w+8LghI7I8oMikM4by0fbS2p47gj2FQ/NesgVoCRcpKza4w01HE+XraArUnFt5IqF8dobk9igLh6G4sEZMWVuuwivkNeEh0Mm1ZlX3z0HqzWw7RUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000006; c=relaxed/simple;
	bh=oGBXFVA6b5hSd8r6F4eDGUdi4rjMPmXLArBN5DXSie4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1BBFynBXhDD5oIDA4jvVpFfLLTz0PYUP7CxYHEwJegH8mhr+KMB1W4qTWjIE/I8mcbWrzHdOyBzOJCGxBSDWWiKL+VrtJ7AvdP7kP3Hp9clLAePU/WjMkU4PeI25xC0XVSRfosWfbw5kzcnt5TuJB3pTT8oCB9rVZPt1XqV5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVSXhx3p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63C1C2BCB0;
	Fri, 20 Mar 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000006;
	bh=oGBXFVA6b5hSd8r6F4eDGUdi4rjMPmXLArBN5DXSie4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PVSXhx3pC9IZPX3P8nkd7JZx7x+PSPFda1Aagvkj7mjsUlsrwhG0DeT0qTYNh/h/g
	 0gxNpWTkD3I3OV5njMXksKqmDDxyioN2vVxWydj19iAA//qTnURb1+yL3PUrTblpb+
	 3GeyZjV3G7sk4mW1yiLo+Fv48cupajDvB5yiep/slUZb/fI8AQV+oBNV/xDP2S0by2
	 k6c7zLXGHDH//zy0cGJZbdv4EttKJ319clTSd6NqVEcjp8ZrutJeMF3tyAT8M//ZCX
	 aFDZq/frRtQpSwQlkASuFGCKrF0ynBd/l9vjrwbCOEE03Pm6kCP04/Qc1j6pqRV0D6
	 eLPzBaha7QIyg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w3WRH-0000000CbvC-3cZJ;
	Fri, 20 Mar 2026 10:46:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH RFC 2/2] HACK: add a parse_c.py file to test CDataParser
Date: Fri, 20 Mar 2026 10:46:41 +0100
Message-ID: <99bb5de72b3510f45c6aec7b505a7b48b060dbe3.1773998596.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773998596.git.mchehab+huawei@kernel.org>
References: <cover.1773998596.git.mchehab+huawei@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-80320-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,example.py:url,parse_c.py:url]
X-Rspamd-Queue-Id: 90E202D8444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch should not be merged. It is a quick tool to test
CDataParser.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 parse_c.py | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100755 parse_c.py

diff --git a/parse_c.py b/parse_c.py
new file mode 100755
index 000000000000..740445998965
--- /dev/null
+++ b/parse_c.py
@@ -0,0 +1,87 @@
+#!/usr/bin/env python3
+# example.py
+"""
+Run a quick demo on a real C source file.
+
+Usage
+-----
+    python -m c_struct_parser.example <path/to/c/file.c>
+"""
+
+import argparse
+
+from tools.lib.python.kdoc.data_parser import CDataParser
+
+TEST = """
+struct property_entry {
+	const char *name;
+	size_t length;
+	bool is_inline;   /* TEST */
+	struct foo {
+		char *bar[12];
+		struct foobar {
+			enum enum_type my_enum; /* TEST	2 */
+			struct {
+				uint_t test; /* TEST 3 */
+				static const int anonymous;
+			};
+		};
+		;;        /* This is valid, but should not occur in practice */
+		{};       /* Same here */
+	};
+	enum dev_prop_type type;
+		enum {
+			EXPRESSION_LITERAL,
+			EXPRESSION_BINARY,
+			EXPRESSION_UNARY,
+			EXPRESSION_FUNCTION,
+			EXPRESSION_ARRAY
+		} literal;
+
+	union {
+		const void *pointer;
+		union {
+			u8 boou8_data[sizeof(u64) / sizeof(u8)];
+			u16 u16_data[sizeof(u64) / sizeof(u16)];
+			u32 u32_data[sizeof(u64) / sizeof(u32)];
+			u64 u64_data[sizeof(u64) / sizeof(u64)];
+			const char *str[sizeof(u64) / sizeof(char *)];
+		};
+	};
+	char *prop_name;
+};
+"""
+
+
+def main():
+    p = argparse.ArgumentParser(description="Parse a C struct/union/enum definition.")
+
+    p.add_argument("fname", nargs="?", help="C source file to parse")
+
+    args = p.parse_args()
+
+    if args.fname:
+        with open(args.fname, "r", encoding="utf-8") as f:
+            source = f.read()
+    else:
+        source = TEST
+
+    parser = CDataParser(source)
+
+    item = parser.item
+
+    print(repr(item))
+
+    print(f"{item.decl_type} {item.decl_name}\n")
+
+    print("parameterlist:")
+    for p in item.parameterlist:
+        print(f"  - {p}")
+
+    print("\nparametertypes:")
+    for k, v in item.parametertypes.items():
+        print(f"  - {k}: {v}")
+
+
+if __name__ == "__main__":
+    main()
-- 
2.53.0


