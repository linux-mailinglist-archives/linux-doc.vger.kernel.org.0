Return-Path: <linux-doc+bounces-75454-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI0UKj2QhWkODgQAu9opvQ
	(envelope-from <linux-doc+bounces-75454-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 07:54:53 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EACDDFAC9A
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 07:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC999300766A
	for <lists+linux-doc@lfdr.de>; Fri,  6 Feb 2026 06:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2088D33859A;
	Fri,  6 Feb 2026 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F9Dz3QsE"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D1E335BCD
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 06:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770360885; cv=none; b=kT71TLrk/ZA3sl4P85cidYmSTAlJIivQt/GbEgi99BPfVVS8vPNhzoPovjDbFhea6lsPwT1LFJePhOwB0l/qapVaFEusuXhwvNvRp/2R8nSiOSbQlo1iIMqUC0DqjR0AdVAW4Bpuruq6MXHFQ1yj2Xoqezd1h0DxSSKbp0kDkZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770360885; c=relaxed/simple;
	bh=3oTWdqwWvXRMB9C3HNjj0F6PR03MBSw8jI5GliF/NLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6JaCVeX/NmOPmyYTDIY2322/+VISe8s0+daLDm/LG6ezrX5cwChCL81P8ZciDf0SNEgA/jEGppSKcgjHhDidRiEPz6DPdhAtqgna0sB4T64kCTL6kXYIMBP48DIIC/dO3aXl/r7+mzt/9aC4T40oDtXdMJlBNPetiRXuEx0N00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=F9Dz3QsE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9xNs+9VWc7Ygo9BV05swnUFHNFQfyvhK7EPSHEJBvPs=; b=F9Dz3QsE7xFZU2e4ocOG/UowSH
	TJMgVPo3YUwUCXRZ8LuWEdyNNLK2TiHhfou/TCE5QJg78LXLAJsrERGkKMMMUz9mqTtyPvBl+yWxC
	dqB6biX+YlUL/maWHLFTEv88CHlvsA43K1jRE3vKqIKLF8UB2MNt2bxRfHI9ukiltOoKIhfPPiN17
	O44eScQ/nrJqFuMguuJjJ8tAcnN5hsnXzJX584f7C0mz3gpt7NgemHI/cZ+6gXTtKnciGFBYdobjt
	xmlzAkDex29s+sX+3deB56xkmO5P3w7NaFcu1b8Zjg7crWFXAHFQSkC64TMqwejghcBcGu0RexjzS
	Ih+ecJOw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voFjm-0000000Axc1-3HPB;
	Fri, 06 Feb 2026 06:54:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] docs: kdoc_parser: allow __exit in function prototypes
Date: Thu,  5 Feb 2026 22:54:40 -0800
Message-ID: <20260206065440.2412185-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75454-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email,infradead.org:dkim,infradead.org:mid,lwn.net:email]
X-Rspamd-Queue-Id: EACDDFAC9A
X-Rspamd-Action: no action

Handle functions that are marked with __exit to prevent warnings:

Documentation/networking/iucv:35: ../net/iucv/iucv.c:1918: WARNING: Error in declarator or parameters
Invalid C declaration: Expecting "(" in parameters. [error at 12]
  void __exit iucv_exit (void)
  ------------^

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>

 tools/lib/python/kdoc/kdoc_parser.py |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20260204.orig/tools/lib/python/kdoc/kdoc_parser.py
+++ linux-next-20260204/tools/lib/python/kdoc/kdoc_parser.py
@@ -176,6 +176,7 @@ function_xforms  = [
     (KernRe(r"^__FORTIFY_INLINE +"), ""),
     (KernRe(r"__init +"), ""),
     (KernRe(r"__init_or_module +"), ""),
+    (KernRe(r"__exit +"), ""),
     (KernRe(r"__deprecated +"), ""),
     (KernRe(r"__flatten +"), ""),
     (KernRe(r"__meminit +"), ""),

