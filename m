Return-Path: <linux-doc+bounces-92973-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xhGzE2uHNmrGAwcAu9opvQ
	(envelope-from <linux-doc+bounces-92973-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 14:28:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4976A8E44
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 14:28:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=WEXsStHl;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92973-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92973-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A0A7300621C
	for <lists+linux-doc@lfdr.de>; Sat, 20 Jun 2026 12:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E18A34388C;
	Sat, 20 Jun 2026 12:28:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9231F391842
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 12:28:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781958502; cv=none; b=S6p3nSRCoo7UbxOR1S22bZ5tp2oJYjGUgVKb1M4dx+wmmKUoqmrXFU3U19sCOie9j2Kfymf0zJ5TfZvLXrOEeaM83lvIKgbNBzCXAMmLLE6dzy/Dg0HluFVm06QFWxXv/GYOPqEslBu4k8xs0ZS22B5m3yEDng9F4HmVcbdfxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781958502; c=relaxed/simple;
	bh=UoFXDjdBbg+2Xy8AuMCMnQqEYq6q072VLR6TEOR9m4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cEEKnme9n3MrRBNedpenQkxnUO4MzzJ9YbrJ10zCUzy+EQl0tjQwdbP0WLfiIrf27pzBg3AFaW04fmU+F8BimAfCENYOXT+nQrkzuO1SkYnk5emon1YSNprtqA4x8EzV6Pd3gCZtV87txC2vuH9CWpqS+2SR6X0qOrROjEzAKoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WEXsStHl; arc=none smtp.client-ip=95.215.58.189
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781958497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AMozjfseFR3D7uPfm1ySGa3f+IL5txozUFi6PIwGyns=;
	b=WEXsStHlf3/vrNf4B3kffMSyWiEIf9T4zrfllqcZF/DCj5Xr349kdQWhAmZImVG/Xkg2Yr
	iCiSZONDg7nPDkyga5uNv8IEHD/Ok7TlKqwESMRBCnGjNXiEB82toJhKEd/tvTQtqXw46z
	691xBSrkD+fILqHXaaZoB7GvLyLO61w=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: openipmi-developer@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corey@minyard.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] docs: ipmi: Fix path of the "hotmod" module parameter
Date: Sat, 20 Jun 2026 20:27:47 +0800
Message-ID: <20260620122747.7902-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92973-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:openipmi-developer@lists.sourceforge.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corey@minyard.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:zenghui.yu@linux.dev,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D4976A8E44

The correct path of the "hotmod" module parameter should be
/sys/module/ipmi_si/parameters/hotmod. Fix it.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 Documentation/driver-api/ipmi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
index f52ab2df2569..d08cee98e34a 100644
--- a/Documentation/driver-api/ipmi.rst
+++ b/Documentation/driver-api/ipmi.rst
@@ -495,7 +495,7 @@ tuned to the user's desired performance.
 
 The driver supports a hot add and remove of interfaces.  This way,
 interfaces can be added or removed after the kernel is up and running.
-This is done using /sys/modules/ipmi_si/parameters/hotmod, which is a
+This is done using /sys/module/ipmi_si/parameters/hotmod, which is a
 write-only parameter.  You write a string to this interface.  The string
 has the format::
 
-- 
2.53.0


