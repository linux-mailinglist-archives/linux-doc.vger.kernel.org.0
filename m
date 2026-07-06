Return-Path: <linux-doc+bounces-95219-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VG/hH8zzS2qAdgEAu9opvQ
	(envelope-from <linux-doc+bounces-95219-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:28:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AA4714828
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:28:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=bqGnlarD;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=eOkuwFV4;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95219-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95219-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8303430347CD
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 18:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B3E437857;
	Mon,  6 Jul 2026 18:25:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9DB3B3C06;
	Mon,  6 Jul 2026 18:25:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362317; cv=none; b=pcZ5RnIBsbWqfaH8T7oQHZiBEJPnM+DkJceh8Wuo985g3zOOn5Q7kMTbq2htP4yyKmRui2jGqgOBKsq06o8na5G6pzG70htOi/vCf6+zatJLupr9WwlVS7S6aVR+QO838XxxHHd3lw6No2ZA6VNcBa9KMpMi3OCGdJb5adDVjsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362317; c=relaxed/simple;
	bh=taPYAofwLO2LNO1f+yUAG53BChJyr0Rqs+YiTqHTSQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4CO6yxeCN+K6jU6ThxjJdMzX0DGgTJ//Rs5+618opEm1W/UMkl51U2wzQUWzLSieCa3Ig4WT7dLS8neSnoMph/9+HEJk/7gyJpycUA7wQHYyE+FI2CVoQNlSQMwNxnJyC8KKpMdj5XX3ck6XTNoz65DZIfAMXmfgXAtstujVzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bqGnlarD; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eOkuwFV4; arc=none smtp.client-ip=80.241.56.161
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gvCT51H3gzKn7H;
	Mon, 06 Jul 2026 20:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783362313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6dSbBe8D8SlZbGm5NYlJ4nvOYSwjvIyEneEBSZcApDY=;
	b=bqGnlarDUpX8y/ht/BIcDQ9oRpHiwtA4F3IbUyiye5k6JcBQNj1Vz4TqPQSgT8Kw4/NzLB
	NFzOqNAB7Ymal9jjJUM1pTEnNURaf1znGHjncyLsgUn24l8Jq8agCkaxiw4PieSFEzL4sx
	F2VuYfW+qs+SgrHlLpLkwdPxS/pyUauR4DlNsYPO1MrhArQ1VUhOgsuoX1nvRs6345zJIx
	IbLasNfwqb8QJfjvDzP112mTOwF0Ebr8recoaQFsP8QWi5pBhqGXFKMoL/RMP7gXWEK3Vr
	9ckIfwUxNZ7JXZ/zo+ERyrLUr0V27E+IDYXi60mJHWy17hA74gwg1DeYnEfHag==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783362311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6dSbBe8D8SlZbGm5NYlJ4nvOYSwjvIyEneEBSZcApDY=;
	b=eOkuwFV4Rh00KkMFFCEA2D4Kpbsfk/oGa/sEaN5KCZoQ0GliYxA4EgZti3jIH0EsTcU0oa
	vw0qLSGZp5YfQVlxbK3H4gDGG8YZAwTwzWgW1i9wDW2tuT50UGm42ieyvifZUZ5inJte35
	p0I6T3DEH9MGejkxp8/gceyetVca62EWQp9tCXaDExBtk14LTlM694QPeUyuqcTG5HD0s6
	RCu/H1/4tgy9uMGQcjZBFX2riXJHWSHEdVQ8stDdpW4EBexLO+uaXTl5tixloT/EtBs+zT
	w5mJqj8curskpEW83FJTizIE+IsKOcUdE6ZjBDKtC5D2kICGi8UN9+P9GbJSig==
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rajmohan Mani <rajmohan.mani@intel.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: admin-guide: thunderbolt: fix sentence structure
Date: Mon,  6 Jul 2026 20:14:30 +0200
Message-ID: <20260706181429.264791-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d7103e3ad656f128414
X-MBO-RS-META: sw1sis8iopkgco4gnnnxekm7of1jfbsc
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95219-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andreas.noever@gmail.com,m:westeri@kernel.org,m:YehezkelShB@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:gregkh@linuxfoundation.org,m:rajmohan.mani@intel.com,m:manuelebner@mailbox.org,m:mika.westerberg@linux.intel.com,m:linux-usb@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andreasnoever@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lwn.net,linuxfoundation.org,intel.com];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4AA4714828

Replace ')' with ',' and add 'is' to sentence.

Fixes: 3fb10ea4ce86 ("thunderbolt: Add support for retimer NVM upgrade when there is no link")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/admin-guide/thunderbolt.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 91a6cb109988..ff25fe853706 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -294,8 +294,8 @@ for the retimers::
 
 This enumerates and adds the on-board retimers. Now retimer NVM can be
 upgraded in the same way than with cable connected (see previous
-section). However, the retimer is not disconnected as we are offline
-mode) so after writing ``1`` to ``nvm_authenticate`` one should wait for
+section). However, the retimer is not disconnected as we are in offline
+mode, so after writing ``1`` to ``nvm_authenticate`` one should wait for
 5 or more seconds before running rescan again::
 
   # echo 1 > /sys/bus/thunderbolt/devices/0-0/usb4_port1/rescan
-- 
2.54.0


