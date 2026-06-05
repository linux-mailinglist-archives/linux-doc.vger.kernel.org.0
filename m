Return-Path: <linux-doc+bounces-91169-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8CAYKo8dI2peiwEAu9opvQ
	(envelope-from <linux-doc+bounces-91169-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 21:03:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7CB64AD26
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 21:03:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EVTgujJm;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="qSNE0/Br";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91169-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91169-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00203300F173
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 19:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A960F40BCC0;
	Fri,  5 Jun 2026 19:02:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2634D409103;
	Fri,  5 Jun 2026 19:02:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686131; cv=none; b=gMjWuwgryvjznui1JP5MluCJeQwiLVn5HfxeFn+Kiwc0dmwO/5TEka9DuKnf3xSo0BOh2WZjmEUiII5+zJ905yeELRb0DxzTiMjkD8xm03rbkRP9UvNMbVtZJHQz6V7Hp2kJMetQoxDlJ2MXATnPf3qf+Iu6JPx05aIokH8yEzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686131; c=relaxed/simple;
	bh=0QqVyOIW91CS/dpVxVeQFVuKHHeZpOQ668M9rmvFPy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hhcmJTgp1nvr2VnwfOUwKsmlLHq+0QRXJrYQwnQjUSu4ZFEDU5x2KuKK2Najvg8F8czzpKb/qy5jJBFmXycJjq2QlFWebBwERgp3lfvT3ggCKjlxPQ485sSqWcyDsbr2HWmysPmD7klefE7RVHOicpZqIe2XPx5z3t9nAXH/Dpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EVTgujJm; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qSNE0/Br; arc=none smtp.client-ip=80.241.56.151
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gX9lv4ZBVz9tfK;
	Fri,  5 Jun 2026 21:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780686123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xdw7BoCuzY9tskt/gyMq6z2JTvYknkfenS7J+LmmRWA=;
	b=EVTgujJmBxsWUZ1GbP7+9s83OVtVKai2FkseNRqqFbIV6Q7iNzBQHehcUs2FxxqNwoFaTv
	RhLkQtCr2pfugy58A/h3kxx3AmTNzql1JHwlMJaD+vF9aIH5zasDzetbexmqNg8shYcDsj
	B8DdvdcPTV6vEM/oqd/QeQ2+FEXv8vB5IXYMmpytSfj5Zwiagkt9LG7AWZYW0DhMt66C7w
	oFjoRWWfcWi81/hl9j6c679oy3iZEToYuQzceLGrNalybqYa/lphiXJ1x/jb6QPD6lCmi1
	6Neuf+ItjE8lNMt08RyFLXG2vZCf8ct+XF65ICJkgtp1+mNxMTTViMjFYsArww==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780686121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xdw7BoCuzY9tskt/gyMq6z2JTvYknkfenS7J+LmmRWA=;
	b=qSNE0/BrHG0zL9lCDRtlQPoxmrq+nt7PjemJKO9v65FuGRFk2tOIw0suXfYAH3CuRtH+A+
	XtminYewkySDGodM7LfacHPqeR8Vhm8zrrhGw5j3DndA/xW41he/7jl2s8gRkEHDAu5eoG
	zt/S2WIuVyaFRovSC/wmHUGxoZobNoHDLyVgoZzHpMn2AbmGf7uPFU0oFF72sL3JxddBNS
	+xFBEt5ImnW3pqI2bcqX5zQGGPUtsD0FQoZDtNwMetUJByL7dv8prQQD/KI0qXc/A10mmI
	GyYjNPJoXCNuKKgsfPWF7a+77oMXJd721KfcO+KL4dc26aYmkC+i/9pqXyRmJw==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2] Documentation: bug-hunting.rst: fix grammar
Date: Fri,  5 Jun 2026 21:00:56 +0200
Message-ID: <20260605190055.15921-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1j69g9c9im7baaijafxhbhtb4cti9m13
X-MBO-RS-ID: 5ae53fe0aae84c5139e
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91169-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manuelebner@mailbox.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:mid,mailbox.org:dkim,mailbox.org:from_mime,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C7CB64AD26

Fix a grammar issue to improve readability

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/admin-guide/bug-hunting.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
index 3901b43c96df..642bf8474726 100644
--- a/Documentation/admin-guide/bug-hunting.rst
+++ b/Documentation/admin-guide/bug-hunting.rst
@@ -63,8 +63,8 @@ Documentation/admin-guide/tainted-kernels.rst, "being loaded" is
 annotated with "+", and "being unloaded" is annotated with "-".
 
 
-Where is the Oops message is located?
--------------------------------------
+Where is the Oops message located?
+----------------------------------
 
 Normally the Oops text is read from the kernel buffers by klogd and
 handed to ``syslogd`` which writes it to a syslog file, typically
-- 
2.54.0


