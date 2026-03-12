Return-Path: <linux-doc+bounces-79003-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN6wFgDUsmktQAAAu9opvQ
	(envelope-from <linux-doc+bounces-79003-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 15:56:00 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ACD273BBB
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 15:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF9C230530C4
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 14:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AE3379EEB;
	Thu, 12 Mar 2026 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTF21tnz"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D9136E46C;
	Thu, 12 Mar 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327297; cv=none; b=EoSGXO3pqb3t+t9b2FwCA+5Gz3cYvSQL4DJkoHYrsASCpZoag+pxUDFmoAIKuG8eQ+6qwD2k9kk4e+nL1tCFj4MWLA8UL4MpfZ/GoZ28+SXyENoMq8KwRDJi4CNLCEYTnMUCHjw4SQJJ2H4j652zf70l6AobyLma3zWfwsy0VME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327297; c=relaxed/simple;
	bh=xUBIjCPiqikLumDJV0/ro119OoQ7PDq8BR8ypLrh5DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qn55OpmDzesH0mJNjzjvr0LMI8TIbAq8k4Heai6Di6JLUAi0njaP+6jR2rW034xYattDSOR2WuOx6sRvBh6g04sdhdfhF0TTR7xUgKpDzUFwrViGSPLn1Q3a85ucTfyGbze4dwvjxDb1sk0BjYkspJolWfMnmk1on5zQ8PcfKDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTF21tnz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB6FC2BC87;
	Thu, 12 Mar 2026 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327297;
	bh=xUBIjCPiqikLumDJV0/ro119OoQ7PDq8BR8ypLrh5DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JTF21tnzAGWmtxzbqh8d8uO4V7XvbZqmfPZVn0yG3aL6+BG+8DVhfbwuiQZCIDyWT
	 e7wljT5cfYivsEcqfTJN7dOqHhX7MZ3c6tRoWaH/z0gJZltCXrvWN9I5zScS4zRYsG
	 WPpuryfJbFbl3RY03EykPRX0Jer+cihEALlzd70jHT9ClSPwgH51OJJpNm7d4VQyHM
	 x5uHzJAmCequQvb0AEyfkV25sBLa9aZwvBl/mC28pzI/FrhgXA58qrbqSH3Hi+OzUi
	 DMqggT9uQ6VPJOsO11sr5OLWl1WINgwcHPoUtaHTt9Le3e3hxqr6OMt05hwop52xJe
	 nEx0T01HWmUTg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w0hR9-00000008xoP-3gC3;
	Thu, 12 Mar 2026 15:54:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 03/28] docs: kdoc: don't add broken comments inside prototypes
Date: Thu, 12 Mar 2026 15:54:23 +0100
Message-ID: <2b957decdb6cedab4268f71a166c25b7abdb9a61.1773326442.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773326442.git.mchehab+huawei@kernel.org>
References: <cover.1773326442.git.mchehab+huawei@kernel.org>
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
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79003-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08ACD273BBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Parsing a file like drivers/scsi/isci/host.h, which contains
broken kernel-doc markups makes it create a prototype that contains
unmatched end comments.

That causes, for instance, struct sci_power_control to be shown this
this prototype:

    struct sci_power_control {
        * it is not. */ bool timer_started;
        */ struct sci_timer timer;
        * requesters field. */ u8 phys_waiting;
        */ u8 phys_granted_power;
        * mapped into requesters via struct sci_phy.phy_index */ struct isci_phy *requesters[SCI_MAX_PHYS];
    };

as comments won't start with "/*" anymore.

Fix the logic to detect such cases, and keep adding the comments
inside it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <18e577dbbd538dcc22945ff139fe3638344e14f0.1773074166.git.mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index edf70ba139a5..086579d00b5c 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1355,6 +1355,12 @@ class KernelDoc:
         elif doc_content.search(line):
             self.emit_msg(ln, f"Incorrect use of kernel-doc format: {line}")
             self.state = state.PROTO
+
+            #
+            # Don't let it add partial comments at the code, as breaks the
+            # logic meant to remove comments from prototypes.
+            #
+            self.process_proto_type(ln, "/**\n" + line)
         # else ... ??
 
     def process_inline_text(self, ln, line):
-- 
2.52.0


