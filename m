Return-Path: <linux-doc+bounces-95914-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5W++ILNsT2oJggIAu9opvQ
	(envelope-from <linux-doc+bounces-95914-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 11:41:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C442172F0F1
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 11:41:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=m4EL8QNL;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nCuhx+IQ;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95914-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95914-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E2C2302F3B7
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 09:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24833EDE53;
	Thu,  9 Jul 2026 09:29:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E098B3E47B;
	Thu,  9 Jul 2026 09:29:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589377; cv=none; b=AFnSGUGoqfIgoWn0Y7JJ3cZTBiMqi2O1IYAtmD5wWb6vdO/hRt3Xrzgdym0RkhGr0LyoNzHgosVsKD26cJcbWzBv2efhs2ohkclFnC8teeDY7dDZN/UgJ343I88olPscgLnnx4PYIoafHvDzfIYhoLSksEa6RCzWfEHOiuH6k/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589377; c=relaxed/simple;
	bh=OW1FFR7/d3swW000cxuVwZz1pzLHLwgeDEXJUYZvR40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAWprMLLof3XRgNlJxGbM6a/mAFGxfiV7SwyFNZj2IyJOn302nQ+UUeZde6Lj2S+FVXjxveboGLv3UMsfiQAoYBctREFQaYpskug8Dqa+HeCHVQo466019AXxkUVhr2zB92v5ykfGO7XtoUkddEbddkP8E9k22L8QLaNd7zATJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m4EL8QNL; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nCuhx+IQ; arc=none smtp.client-ip=80.241.56.161
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gwqRX3YC2zKnDQ;
	Thu, 09 Jul 2026 11:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783589368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MPqKsE3vrjg5Cni2ih7Mz6hed+EmMzR60oeIPkrTaTk=;
	b=m4EL8QNLD4GKW4D3wgbbhcKTVdir9Vtmn2Q+Qbpks0AKVyZs6uuETXcK8DtIyUZ94o4AQr
	AMBAGBYFNigmKI3DnMI68xEnhX7Qc9QHwduXxA7ib8Q4RJiYtoybXQcXtXaQmZw8jeZOot
	RDNyZNh8CtWVdbAe/u+96tyPfBi045RHmYl0blUPs6dFee0ocxYhZnDOeuT0N3blag3ILt
	u1seIbqYXfXqznjLJMCU9nG4Bjw8surw3bMgykvsDRNtVzc1fmUj9aZmVeMJ5w4acLPC99
	qu4RqavMik2nbwdlC2Q/ptLe/v7tT125Nh5pBdAjXCjYmTJe/8/OguvcwVJ0XA==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783589366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MPqKsE3vrjg5Cni2ih7Mz6hed+EmMzR60oeIPkrTaTk=;
	b=nCuhx+IQOrS9P7hKRk/8bwnnqsAzFc5KMKHcG/MTGPou+X89LZf1xiTSIQs63t1smVX+bX
	Jd+FjXDZdA4llsajLo0vdNBTV00F/wdGQDFxKUwNr5neYGnwXRO1o0ELy4ZZbcopcu/jVN
	aiwIAxKSEPgEeSOnyKybY0NUzd3ObgyU2aK83PWgAyglx3HjO3EHbsOqfGtesDF2/C7Psi
	OlqfCNVl7j9abPaod6wWx41rgUc8WcxtIJONiMVsPdgW7txFw4H8XpNyPmaZSMPeedVn4u
	WKM2dIP9c+y8sc++jBca0pd6jDLASlctnYz4/17Kc9uN/cRS6JCXTxLXc4K+6g==
To: Matthew Wilcox <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] errseq: add missing bracket
Date: Thu,  9 Jul 2026 11:28:59 +0200
Message-ID: <20260709092900.380694-1-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5493skuyzbui4hobtbo3sujmc8ch4tou
X-MBO-RS-ID: ad95e304c2e767a33e5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95914-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:manuelebner@mailbox.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C442172F0F1

Add missing ')' to nested functions of code block.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/core-api/errseq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/errseq.rst b/Documentation/core-api/errseq.rst
index ff332e272405..d298d4cd2f60 100644
--- a/Documentation/core-api/errseq.rst
+++ b/Documentation/core-api/errseq.rst
@@ -143,7 +143,7 @@ Because of this, it's often advantageous to first do an errseq_check to
 see if anything has changed, and only later do an
 errseq_check_and_advance after taking the lock. e.g.::
 
-        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err)) {
+        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err))) {
                 /* su.s_wd_err is protected by s_wd_err_lock */
                 spin_lock(&su.s_wd_err_lock);
                 err = errseq_check_and_advance(&wd.wd_err, &su.s_wd_err);
-- 
2.54.0


