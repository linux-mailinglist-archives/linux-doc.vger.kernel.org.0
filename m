Return-Path: <linux-doc+bounces-78495-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIMDFsj5rmliLAIAu9opvQ
	(envelope-from <linux-doc+bounces-78495-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:48:08 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C723D065
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50CAA300F589
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2026 16:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198CA38F255;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUfyEWvr"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C42494ED;
	Mon,  9 Mar 2026 16:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074886; cv=none; b=JYBtoSbgqwDxBs2nYVYBxmOwPlu05x+OIkpgQSErUcblaFkVdahhG0RK4D1u+AoyuWb8oiQX0UYIZqE/LJr+yx3b6q/zDFBKGJaIEyii28KynKEr90U+W9qPKsTArnGVLymh76+JmveWwgK71TbOHBFXan8zZ8c3Wk1UzWhO9uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074886; c=relaxed/simple;
	bh=Og3btdqqsss2BN07XAVoT1mCvNdW9py94Li7vBmuxJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K4JoY2Px/qPV7ADdmLD8PaursFTI0zfgkYTn+CPyVRCtX2pakRlbF2HNrKq2OELYk6QquDa1Pmskj8ujMoCKIE1Jwf078toeGlpwlxqbyTrrAbzvbRb9hc1TxrZKOpoQ4AoRbq8piFI+duQ+190OUEy8H6W2YhSKuTjS0EfRkg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUfyEWvr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AFAC2BCB2;
	Mon,  9 Mar 2026 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074885;
	bh=Og3btdqqsss2BN07XAVoT1mCvNdW9py94Li7vBmuxJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUfyEWvrzNP4u8VpiIWyyDzjz8AZuCmEeDOIvLQOUdAhZS+I59gOPLT5M5H+D9f3A
	 RA+4RrdQ6euOM/yiRDCvFFHsN209Guhm5jeiQiHsJMHFwgF1T1qricAxKxF+v4DAoQ
	 KsHu46bPGadSr7OQqBQd1D2e142+tzXOaRs3P9fpLD0BGwH9/Syq6iUyXvXlWEZurl
	 YMKlI1FDSLm2z55aL0RD8NkqerYBN4OQZlity/5QV43H9GhJQArmTdZuFfQIvSRh+V
	 mJQfDni61ORCXiJa1G8qmQcLN2FOZxCjbBBnWBsRO92uczcXTeQ2LAPgjJhtk3A3c8
	 xsnpNw7yj/pMw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vzdm0-0000000Bhag-0IlN;
	Mon, 09 Mar 2026 17:48:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 3/8] docs: kdoc: don't add broken comments inside prototypes
Date: Mon,  9 Mar 2026 17:47:54 +0100
Message-ID: <18e577dbbd538dcc22945ff139fe3638344e14f0.1773074166.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773074166.git.mchehab+huawei@kernel.org>
References: <cover.1773074166.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: F00C723D065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78495-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

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


