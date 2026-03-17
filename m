Return-Path: <linux-doc+bounces-79805-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNEkHGqZuWn5KwIAu9opvQ
	(envelope-from <linux-doc+bounces-79805-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:11:54 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96E2B0ACF
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 19:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 186C03056E09
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D643F54CB;
	Tue, 17 Mar 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iO9bch1Q"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45323EB810;
	Tue, 17 Mar 2026 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770988; cv=none; b=kMniCi1YWb2DoC0zjE9+VQvRPomRK5cGEGsvNVfRzbu71dejzr6wwuxDTvQhXAzFndOmTiaAbQvZ/GHAN+kpv6Aw9CigMkJSotpb8cxm7a3M5QdLLZl8OUDHC7daJ3VDFpnsAQAuNlQxWlYQHTdoCNCq7OqFJw+B97yFmBR8ne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770988; c=relaxed/simple;
	bh=xUBIjCPiqikLumDJV0/ro119OoQ7PDq8BR8ypLrh5DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hDc5Ah1aFIK7K+GUX8dvy5J1n6uaWB16AgSwZRGmakzUr5316p7biYJDGsr396NWglkma52JIM1miJqJJUHeyo5ZlhfYdgRqRNBmaUhbzXtVATs80ibe7jqJzJZ2+7V1iPWom49i2JK1Khfo2SlNJbBP82N9FAnz4TKYIAANUag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iO9bch1Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CF2C2BC9E;
	Tue, 17 Mar 2026 18:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773770987;
	bh=xUBIjCPiqikLumDJV0/ro119OoQ7PDq8BR8ypLrh5DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iO9bch1QYjwx5A64hjbjXnwvv1lSbjisITynowNNomQaF7acj9NwYa0naYkwxLCjw
	 7zAbSYj8SnnAWXAKj2scVHfqBovy/RQNKuBOjZhkxdoM3mt2P76qMEKHcRO6upc1d1
	 C3l1rt3BSrQ4b0D3SyDffRdIFSL13FDUwbmrvkdO46SyWqeASwMYlCafDuHYHBH+mQ
	 Q6gNkTDqRoctJaEN0GfzuLbsuiCBWkCvArMOK3zq8i79ttKiQde6iqq3xc0A81p9RK
	 G0Nfh26c522cezt0F1o1Sh0iOsFQcHDOmS2sjVo3VNUQftHF/5thXLDwOHAEqNOeie
	 5c2cQBAfnoIRA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2YrR-0000000H5Hy-3oxl;
	Tue, 17 Mar 2026 19:09:45 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 03/22] docs: kdoc: don't add broken comments inside prototypes
Date: Tue, 17 Mar 2026 19:09:23 +0100
Message-ID: <12ac4a97e2bd5a19d6537122c10098690c38d2c7.1773770483.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773770483.git.mchehab+huawei@kernel.org>
References: <cover.1773770483.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-79805-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2C96E2B0ACF
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


