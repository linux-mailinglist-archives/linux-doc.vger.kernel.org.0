Return-Path: <linux-doc+bounces-93811-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zEOGD+KUP2q+UgkAu9opvQ
	(envelope-from <linux-doc+bounces-93811-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 11:16:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F66D189B
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 11:16:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="m/n1itRs";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Chf0MxmK;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93811-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93811-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D70C302D5D7
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 09:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA77314A6B;
	Sat, 27 Jun 2026 09:16:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A67B3939A6;
	Sat, 27 Jun 2026 09:16:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782551769; cv=none; b=Li5NAMj5B5eSiN4f6hdRnzloHpHG2Wu5I4Z2PXru3cKEU7xpyyo2pGQBjUZnbGv+CwUee8JSaLmfyOTgBpFBGKBRrb3wCyjwb2x8AHcubcPFuo5lVosSKl4QogUV2Ld+w3bnPovPZBtIMRcKxkAzUieVGl9OTMvgI+/zrctBA8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782551769; c=relaxed/simple;
	bh=sTAhDUleXYtlvjsypG1oul3MvhHMsnPeBHtM1mSZpME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t67iJoNXE3QNLvAPFiVvcUv22z4G0IDN1zbg3CRfFqlpJg7+qkyYMT9NyiPMFLNcaMCpPoZ6RMryejde7STOGvZvph2Cmb7gqSUSfgjbEg/+GiA1XO/UpETGZdfK5pLmh2iL7JbjJJfj4X7Ipcmi7ag1CipeL7F26RyoIQA+xE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m/n1itRs; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Chf0MxmK; arc=none smtp.client-ip=80.241.56.171
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gnRjV3RPdz9tWS;
	Sat, 27 Jun 2026 11:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pXQ+5vRw8gFPOsPV7D/1ZGV5eGUKSwaLPREyxVc1zFc=;
	b=m/n1itRsS/aAWVXYzbQ7IF2q48yifmUJfhit3nzZP9H1J5NXfPGbs0ReLL/hZwdKn40bQU
	bSLHKCctVNl9h9swx3Kc/8RSw2hRcvW5dXlEB4u/HM5f4EStdxXl2+L5soFNZpv7KmS5ir
	Ew2nIQK1Ekr6/p1BuXNwYMBF0uHSu/kdF6bqsAUJ+VEW5RzkDOWUvq6Ud3zUtjFSM0S4DZ
	BN101D5XlHlAdlIiRkWORcFSFqxmBXL98FTLerzRolwRpng7Jsz/s55uFyykvR8VE+hLqL
	+6MWgJNrC68vuxFf8hK7lXaZFTzr6qgG69TREIMpOrytGODXU2vFRwk71DFs/g==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pXQ+5vRw8gFPOsPV7D/1ZGV5eGUKSwaLPREyxVc1zFc=;
	b=Chf0MxmK2ONKnVlhFY2t4mYk6oRrCLmv3p/KV3SQX4DjG4BUuNlEYRfljWa1HQG2bwKGId
	f2oHZc/uHuH//NZB3Iw7QKdETMzoFDqoRYQG8czAowOoIOzDUH75go9brsBrLEWo7tUJat
	cZPD2wxjV+7H784QUkrno6xakBGfol/b/GLugnsijn2a5A0+FrbgENvOa0y+HahFMtL2dV
	BsR93hvmfCehuqJbBrnp8JaAjlFT+tQgtD2LwbnIP2lfxYsToWqJcyxdgcUMClm9W/6N8L
	xMPjW+i+H9TnwFbq2jih+z2ZjjQUd7qHyrZZfT/kCUVCpcXA4DSVb2Mko44Isg==
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	dm-devel@lists.linux.dev (open list:DEVICE-MAPPER  (LVM)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: device-mapper: adopt new coding style of type-aware kmalloc-family
Date: Sat, 27 Jun 2026 11:15:07 +0200
Message-ID: <20260627091506.29534-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: if1srcg7xfuct4h3mouatgp5usae4eap
X-MBO-RS-ID: 54a6d1f2fbb6e1a076e
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93811-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:agk@redhat.com,m:snitzer@kernel.org,m:mpatocka@redhat.com,m:bmarzins@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:dm-devel@lists.linux.dev,m:manuelebner@mailbox.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B3F66D189B

Change the Documentation to reflect this commit 69050f8d6d07 ("treewide: Replace
kmalloc with kmalloc_obj for non-scalar types")
kmalloc -> kmalloc_objs

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/admin-guide/device-mapper/statistics.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/device-mapper/statistics.rst b/Documentation/admin-guide/device-mapper/statistics.rst
index 41ded0bc5933..2190b90118f8 100644
--- a/Documentation/admin-guide/device-mapper/statistics.rst
+++ b/Documentation/admin-guide/device-mapper/statistics.rst
@@ -30,7 +30,7 @@ region, etc.  Unique region_ids enable multiple userspace programs to
 request and process statistics for the same DM device without stepping
 on each other's data.
 
-The creation of DM statistics will allocate memory via kmalloc or
+The creation of DM statistics will allocate memory via kmalloc_objs or
 fallback to using vmalloc space.  At most, 1/4 of the overall system
 memory may be allocated by DM statistics.  The admin can see how much
 memory is used by reading:
-- 
2.54.0


