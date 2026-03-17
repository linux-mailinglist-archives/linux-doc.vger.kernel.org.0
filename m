Return-Path: <linux-doc+bounces-79715-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAn1AYJMuWnG/QEAu9opvQ
	(envelope-from <linux-doc+bounces-79715-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 13:43:46 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 086A72AA0ED
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 13:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3CCD300A25D
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 12:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBCE3C196B;
	Tue, 17 Mar 2026 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="afD3lOLn"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F783C1419;
	Tue, 17 Mar 2026 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751419; cv=none; b=EQ2fSggAE2HDJLRbj9EFlanlH2fYxBuh9+w4eK7GrMMtr+/P7iuJY0BVt/YuZnWnNUY7arM5H6yVA4w/UzxOWcL5jsX91G770dZqT0kZr4G7nXpEbc0ELUDz+o4XTvqOokEvw8vgWXr+kmdkUrsvXem9E2Gig/ktXdNNFlCFhr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751419; c=relaxed/simple;
	bh=4f7WX9UXZ066LqHEzSW6JvuBor2GR6Fo+KiOrCT/yq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MYNOUkdLMSieSXu2MDzHLX5IqPBtlrTT24zCoycyqxHP7AnpSPBZMltAzzki/twZx8iRMobn1sQIrirGNfyQAXCGWQM3xNxQ5IfPDgkWChvRkRUsXK6GdrF9D9LbOqxsbu+zR2TV0/+vUQW9fhjmX0aNDS2j1sHwJFaE7EbUpNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=afD3lOLn; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fZrwR4KQrz8cMs;
	Tue, 17 Mar 2026 12:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773750807;
	bh=4f7WX9UXZ066LqHEzSW6JvuBor2GR6Fo+KiOrCT/yq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=afD3lOLnkBdBhZ+2VqZD/wRDs0i0UGCLRQtDKgV9V25ggtWIkz4CGkFow3vDkuJxg
	 M4LaXm7qQZ8Pon2mW8zxMMwQO77FZ3u5Z13KVbjHCPGd5NXVlbERbtHq56dD/7sPeB
	 yvciSG214Ja0XEvjInXoqsyC6FppFcNT9bScuelwRyBohQ3OAzcqb0sjdBs3Arj9Wf
	 BPzg9qkZ/k8UCr3z3xG6JhTIjrMyW1EtitVGefX4UGgO+3l2tHetDRsKjl0njlu3or
	 Sby3qiOEYX68cdSEUzpnC73bOUDizOfI0Zai4n3AtzNDK1l2TT+hjxdlfXOXRf5/tv
	 jdzNWQwV7j/uA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fZrwR3ZwTz8cMg;
	Tue, 17 Mar 2026 12:33:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fZrwQ3Bmrz8sbW;
	Tue, 17 Mar 2026 13:33:26 +0100 (CET)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 93ECF635CB;
	Tue, 17 Mar 2026 13:33:25 +0100 (CET)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] docs: reporting-issues: mention text is best viewed
 rendered
Date: Tue, 17 Mar 2026 13:33:04 +0100
Message-ID: 
 <f8e3577df4a231b66e8f638f7b41614bf15b49ab.1773750701.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773750701.git.linux@leemhuis.info>
References: <cover.1773750701.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177375080582.2889257.5836671591820656891@mxe9fb.netcup.net>
X-NC-CID: ffUWQ4pCXsLGdz8NQBucWiPeINIVtVR0VW8EctvlT108AhWVI84=
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79715-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leemhuis.info:dkim,leemhuis.info:email,leemhuis.info:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DMARC_NA(0.00)[leemhuis.info];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@leemhuis.info,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 086A72AA0ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a comment before the step-by-step guide explaining that the document
is best viewed in the rendered form, as there the internal links will
work that later patches will add.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
v2
- Drop the switch from double to single quotes

v1 – https://lore.kernel.org/all/4f7e2de2a2336c52e55cc49dcda627a4e86b8793.1761481839.git.linux@leemhuis.info/
- Initial version
---
 Documentation/admin-guide/reporting-issues.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index a68e6d90927471..049dd9b663513d 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -48,6 +48,16 @@ Once the report is out, answer any questions that come up and help where you
 can. That includes keeping the ball rolling by occasionally retesting with newer
 releases and sending a status update afterwards.
 
+..
+   Note: If you see this note, you are reading the text's source file. You
+   might want to switch to a rendered version: It makes it a lot easier to
+   read and navigate this document -- especially when you want to look something
+   up in the reference section, then jump back to where you left off.
+..
+   Find the latest rendered version of this text here:
+   https://docs.kernel.org/admin-guide/reporting-issues.html
+
+
 Step-by-step guide how to report issues to the kernel maintainers
 =================================================================
 
-- 
2.53.0


