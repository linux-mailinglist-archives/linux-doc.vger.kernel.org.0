Return-Path: <linux-doc+bounces-84537-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNeDI1mv62mRQQAAu9opvQ
	(envelope-from <linux-doc+bounces-84537-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 19:58:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6574622B5
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 19:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3F1430094E7
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 17:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFE934887E;
	Fri, 24 Apr 2026 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="R9qkjMSy";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pwT3bnAO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF037083C;
	Fri, 24 Apr 2026 17:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777053524; cv=none; b=cVQQcZ4F1K4GBeSiP/J0OVdiILrLWVtfwX797EY3Jx3NBbNZLElccMvHU9v3rRG0moq5Xto+KWaKNP56rDgkGqO0QVQ1oZ3i6VO0mFRxfPvTKbaNaH5IYN5PJk53It7Pl7IEiy3TprtnqKJ+j5v3XABaaQCAzRSb5nJ4TOzJwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777053524; c=relaxed/simple;
	bh=sj2zLB+Bl1tnaPu7qA0bLpFA09Tf7aV9cm6dXK29j2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxKIRgaYQ+8oLxT86xMHKMN8sZx0hRT7P7ngTjvcWqVvOiNv1Z734kmtvFlOvpUX9lbxvDdiHG5s8Tu3qC6EMTMrTABjNfde6t9X2okkIua8PVZ3Wf7VkS0LD1W5UeV/hz+3tM7lP3F81rz3/mm00CiXXfh6aaaySC8YMXNp/o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=R9qkjMSy; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pwT3bnAO; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g2LL85nN1z9vH2;
	Fri, 24 Apr 2026 19:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777053520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbmj4N7zVRXMGmZLFvMThNK9FT5J1PyFY4flNNsMSN8=;
	b=R9qkjMSyiwaQjWRzXBNpTSUIWbWsAfXsv49hFEeAOdYYlwR+JiW6o+S45yOmPKBHGQVUpT
	1O8J6J9TvxacnjFiCOyHVnsPZ0KvjnzBJDNVv+j6pQ4/ovOO99PEbPHzkgagw0ANLSUwi1
	EgWR63TXF30/qVnUEx/blRgVibsi3Qi4/SC9geXIeGR3o9qHtjk6GkXzG5qv8BTJlAwUZU
	ZQTZCxH9OzeEsc5NAFMLwxs27CecxtJKIf3NVZFhmXVZREYPmdm1IrUpoFJsSFqy+KJrXb
	X6qkle2GxesheTs8L4DSU/EE9cSPl5UJDm7C4gGSmcLe407g73hl/0qxg/6amg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777053519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbmj4N7zVRXMGmZLFvMThNK9FT5J1PyFY4flNNsMSN8=;
	b=pwT3bnAOb25Bn9wWaYULL37PxonTvnBMeSVvOzX9cI6Q8bdWB6m0RNqSW4mp5GcFT86Dml
	YPt1tzGS2UP5PiuFkJ+Sq69vvixA7YUSmUqC3+b5BZuY2S+nPBUP4pI9ISYnqfsx6SFUDr
	ZfAxlDErVCukSTZgDzhz5AARbasAUmDGECgNs+AVqhu0U5r3bCqnrzXdch6zC+O4PTc1VE
	1YywZhgGJ9Hh7OwvqnY3rwCNIa7UoC4evGzCq4OdTJ4ACgD7OUr5w2HBvOpmLvUXeQLDVW
	3YEs13xtO8IfshXpfKUsAuETjeaCHnf77FD8c3SVVQSKSOZ6JE9oQfoNXBzGAA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org,
	linux-mm@kvack.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v3 3/3] Documentation: deprecated.rst: kmalloc-family: mark argument as optional
Date: Fri, 24 Apr 2026 19:57:41 +0200
Message-ID: <20260424175740.258522-2-manuelebner@mailbox.org>
In-Reply-To: <20260424174743.257951-2-manuelebner@mailbox.org>
References: <20260424174743.257951-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ea0f62450519231096e
X-MBO-RS-META: bw1i5j7yaog7suqknwjmjp5j44mwcpws
X-Rspamd-Queue-Id: 0B6574622B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-84537-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]

put the optional argument (gfp) in square brackets
add whitespace for readability

eg. ptr = kmalloc_obj(*ptr, gfp);
 -> ptr = kmalloc_obj(*ptr [, gfp] );

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/process/deprecated.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index fed56864d036..b431993fd08e 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -392,12 +392,12 @@ allocations. For example, these open coded assignments::
 
 become, respectively::
 
-	ptr = kmalloc_obj(*ptr, gfp);
-	ptr = kzalloc_obj(*ptr, gfp);
-	ptr = kmalloc_objs(*ptr, count, gfp);
-	ptr = kzalloc_objs(*ptr, count, gfp);
-	ptr = kmalloc_flex(*ptr, flex_member, count, gfp);
-	__auto_type ptr = kmalloc_obj(struct foo, gfp);
+	ptr = kmalloc_obj(*ptr [, gfp] );
+	ptr = kzalloc_obj(*ptr [, gfp] );
+	ptr = kmalloc_objs(*ptr, count [, gfp] );
+	ptr = kzalloc_objs(*ptr, count [, gfp] );
+	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
+	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
 
 If `ptr->flex_member` is annotated with __counted_by(), the allocation
 will automatically fail if `count` is larger than the maximum
-- 
2.53.0


