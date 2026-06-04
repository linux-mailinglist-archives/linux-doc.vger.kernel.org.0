Return-Path: <linux-doc+bounces-90953-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oAZ3EgOKIWq4IQEAu9opvQ
	(envelope-from <linux-doc+bounces-90953-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 16:21:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B102640CBD
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 16:21:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rasmusvillemoes.dk header.s=protonmail header.b=ab75Zucq;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90953-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90953-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=rasmusvillemoes.dk;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C058302416B
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 14:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1F947B422;
	Thu,  4 Jun 2026 14:08:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E343E9DF
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 14:08:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582139; cv=none; b=PdK5dkIWm7nmf66VMpufj8CZEtl9qH3qJf4KgBUeGWN0SkWSpNQWd0zs5s1fUZXgRi4m9EtJyb53zVr06ZVeV8SqOFCa687O7MbZatYeQoZR2ANJIDdE8pfjosI/EoCm/BvAKAEcJ8+E/lC23AIl3BpF/6fN5Bq3yo1/2RdDl08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582139; c=relaxed/simple;
	bh=QwKmgOxWxJ0b1TsS5GtIuVD1irqHkCllw+LGrv4g4Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDiai10IE/EU4Y6psOUlbfIki+bpXlSW7RuSHPB+KolPfwarzmehq9L8LObv0YRaWNsHVi0LNRScC+XVOOKnWm0S4uFG/Q0myhDJlp/pZo848rq8jz9aNsT/jOF/ZuNhaC1pqt5OS+8hWSlKXg8C/Jko4dubqs7W3gDrgHX152U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (2048-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=ab75Zucq; arc=none smtp.client-ip=109.224.244.106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rasmusvillemoes.dk;
	s=protonmail; t=1780582128; x=1780841328;
	bh=O37nz4oOKmkhBK1UaGgshyWGmZcNcCvfCeUTL2qHnYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ab75ZucqTbBs0+N6I3PldxtRoKDMxKeSH1iUdBPuEa8eBUFbUc2qIWaycLQ+GOrxH
	 kOH+N0UGvNqv7+tuubfSm3mvVUWV+GDvYviQwQ0N9H0DRTq8PRqlvmHd1B+qXy8ZOa
	 +pofAInRGLxbFIsdKtvx29BlJE/P+WdXC5xq8jMVSgXsNsrPXcSDsm7FrrecyLUiKh
	 1PMtMz+de756qaHqLAKxHg/l0LS0k8Lou1CRJiIZareUVi+vTCb4ckLjJYbAl33Nkr
	 Q9JzlnRqIgl+tnEQZMSy1CnjfetvFNkUDLZSGO5g0BgAFtGYBmx3maL9uxwoeX747c
	 Tj3IwT6qzSzPw==
X-Pm-Submission-Id: 4gWRHx58W9z1DDs2
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] docs: arm64: Document that text_offset is always 0
Date: Thu,  4 Jun 2026 16:08:39 +0200
Message-ID: <20260604140839.1930847-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rasmusvillemoes.dk,quarantine];
	R_DKIM_ALLOW(-0.20)[rasmusvillemoes.dk:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90953-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:ardb@kernel.org,m:will@kernel.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux@rasmusvillemoes.dk,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@rasmusvillemoes.dk,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@rasmusvillemoes.dk,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rasmusvillemoes.dk:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,rasmusvillemoes.dk:mid,rasmusvillemoes.dk:dkim,rasmusvillemoes.dk:from_mime,rasmusvillemoes.dk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B102640CBD

When trying to figure out where to place and call an arm64 Image in
memory, reading booting.rst should provide the answer. However, it
requires quite some digging to figure out that text_offset is set via
".quad 0" in head.S and is thus actually always 0 since v5.10.

Update the documentation and make that explicit. Reword the 2MB
requirement accordingly, and remove the paragraphs that only apply to
the ancient versions where text_offset could be non-zero, as they only
confuse a current reader.

Fixes: 120dc60d0bdb ("arm64: get rid of TEXT_OFFSET")
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
I've included a Fixes tag since I spent way too much time tracking
down where that text_offset might be defined. The mentioned commit did
get rid of all references to TEXT_OFFSET-the-macro, but not
text_offset-the-concept.

 Documentation/arch/arm64/booting.rst | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..f4cc25b1fd56 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -55,9 +55,6 @@ not exceed 2 megabytes in size. Since the dtb will be mapped cacheable
 using blocks of up to 2 megabytes in size, it must not be placed within
 any 2M region which must be mapped with any specific attributes.
 
-NOTE: versions prior to v4.2 also require that the DTB be placed within
-the 512 MB region starting at text_offset bytes below the kernel Image.
-
 3. Decompress the kernel image
 ------------------------------
 
@@ -93,6 +90,8 @@ Header notes:
 
 - As of v3.17, all fields are little endian unless stated otherwise.
 
+- As of v5.10, text_offset is always 0.
+
 - code0/code1 are responsible for branching to stext.
 
 - when booting through EFI, code0/code1 are initially skipped.
@@ -100,12 +99,6 @@ Header notes:
   entry point (efi_stub_entry).  When the stub has done its work, it
   jumps to code0 to resume the normal boot process.
 
-- Prior to v3.17, the endianness of text_offset was not specified.  In
-  these cases image_size is zero and text_offset is 0x80000 in the
-  endianness of the kernel.  Where image_size is non-zero image_size is
-  little-endian and must be respected.  Where image_size is zero,
-  text_offset can be assumed to be 0x80000.
-
 - The flags field (introduced in v3.17) is a little-endian 64-bit field
   composed as follows:
 
@@ -135,12 +128,9 @@ Header notes:
   end of the kernel image. The amount of space required will vary
   depending on selected features, and is effectively unbound.
 
-The Image must be placed text_offset bytes from a 2MB aligned base
-address anywhere in usable system RAM and called there. The region
-between the 2 MB aligned base address and the start of the image has no
-special significance to the kernel, and may be used for other purposes.
-At least image_size bytes from the start of the image must be free for
-use by the kernel.
+The Image must be placed at a 2MB aligned base address anywhere in
+usable system RAM and called there.  At least image_size bytes from
+the start of the image must be free for use by the kernel.
 NOTE: versions prior to v4.6 cannot make use of memory below the
 physical offset of the Image so it is recommended that the Image be
 placed as close as possible to the start of system RAM.
-- 
2.54.0


