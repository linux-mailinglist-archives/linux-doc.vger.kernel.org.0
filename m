Return-Path: <linux-doc+bounces-95989-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LPj+HZa1T2pnnAIAu9opvQ
	(envelope-from <linux-doc+bounces-95989-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 16:52:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE17327C2
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 16:52:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bCDMGhY8;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=XDh1T+vW;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95989-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95989-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 799CF31E48E0
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 14:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F338530EF9A;
	Thu,  9 Jul 2026 14:30:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D51A0712;
	Thu,  9 Jul 2026 14:30:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607421; cv=none; b=COxvZOZ/dm12/64RgJk/klc47SWml3TRICDKbds80gfvUFs7XLlO4/k7gys65b82RRfB1qbi7xLw3kFordklZwU7XlF9WO4fHWNuXEL/i+ZAIe6a+CsBC4YxW1/v3EbZ6n7aj+mNA/QMDJVcm6dMdVdy4IyfuPn2VrmADhWgUWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607421; c=relaxed/simple;
	bh=Qgu/Bwb4cP611/bJ3cmbpU6voohC7G6/20j8xJnrdDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HL9kIdVN2k5oDbfos9p3/O4OSk1ezWOH58qY76p07FQ1+cLY9F/FVUqMiQaJTNWCj/4ULerjfTauIZ8aa3dJYH/Bq4KzOn2rohUWwgTviTaceJU47FdsWsKuIgyKGIA2HYxncX4bY3TM7agCUT8qRtbEN6z/gFOP9pRqTTK3zzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bCDMGhY8; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XDh1T+vW; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwy6d3DbvzKvv9;
	Thu, 09 Jul 2026 16:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783607417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iLO6cFeG8WmJoEeBH7J3n1bZ6eV3ueqetdE45C45fBo=;
	b=bCDMGhY8PGsAQaa9AI7Jh29g/homhe7aKh84ZLfBqG/fBTQqXY/BxaGuD0Xh90ORNA6c8k
	OaYyiPemo7RDSHs8PQDId9aQZ+UPtSO3J/JNKOXJSPNGViglKbcn4gdBXy3riySQO524Y0
	Bf1eyA03b74/ORzkRAUdnYJYzoWu5UND5TlQbu2zm9LHr+c5a2r/IXuP+Ra9nLzSQ5V0k/
	CH3rlwfMZWear5Lztgc4K3jS0NFTPIZSFAvlerpRiOcCPjB9SrwL+NpmwSDh5R02gHuokp
	FbPxCY0F5L5yceaMwtD3x05n7w7MgrxdEIrgUMmywm0qAY+vIF6NELM98gx3Vg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783607416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iLO6cFeG8WmJoEeBH7J3n1bZ6eV3ueqetdE45C45fBo=;
	b=XDh1T+vWTxS4s7R1Fg5Zbvi0uqHICNH/Cw9nrqE207V7ynCX8SB55l9pL45KSJvEgpX3Nk
	crHmnjg8LcFggpzcF92s0A4EIj/bd2xsASaGt0LXOT82FChcAhYtuNSPp+LdXBpITky6SS
	+9/rfoZ0AXsQT78RHq+eK1UWRG6nIUnX0yzy7y1ebN83YxguXHVKAh87ytHIvAGnO5/E+H
	WfKKLG0ISOFU50wF8yH8Ucrnl3KQVpmyEP7qq7uE+YA9o5JyBw9rAP6wUOjidH4qYwB47Z
	7X0654beoJwkJPe8WfuRxT4SJ3pIDSBpSwMJoVY9ETXx+dNjV7lYumZuO1Hcow==
To: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Silvio Fricke <silvio.fricke@gmail.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: workqueue: Fix bracket
Date: Thu,  9 Jul 2026 16:29:39 +0200
Message-ID: <20260709142939.404290-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 17ca67d6e02d0898bc7
X-MBO-RS-META: ssoc73y78nkxkowm5yzmrojd938f7hrs
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tj@kernel.org,m:jiangshanlai@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:silvio.fricke@gmail.com,m:manuelebner@mailbox.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:silviofricke@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95989-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lwn.net,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3CE17327C2

Add missing ')'.

Fixes: e7f08ffb1855 ("Documentation/workqueue.txt: convert to ReST markup")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/core-api/workqueue.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index 411e1b28b8de..bb770f556568 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -356,7 +356,7 @@ Guidelines
   well under the default limit.
 
 * A wq serves as a domain for forward progress guarantee
-  (``WQ_MEM_RECLAIM``, flush and work item attributes.  Work items
+  (``WQ_MEM_RECLAIM``), flush and work item attributes.  Work items
   which are not involved in memory reclaim and don't need to be
   flushed as a part of a group of work items, and don't require any
   special attribute, can use one of the system wq.  There is no
-- 
2.54.0


