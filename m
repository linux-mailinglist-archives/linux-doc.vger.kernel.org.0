Return-Path: <linux-doc+bounces-93813-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m2VnIF+VP2rRUgkAu9opvQ
	(envelope-from <linux-doc+bounces-93813-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 11:18:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D60526D18AE
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 11:18:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=UyeJ24+x;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=FVgl7sVJ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93813-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93813-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9491302C5DD
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 09:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3386E313E07;
	Sat, 27 Jun 2026 09:18:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06EB175A84;
	Sat, 27 Jun 2026 09:18:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782551900; cv=none; b=gr1jC418TBooFcTuvY3gyZV/fNUODUxc3A4s/z/s62ZhEj0zHCWhcGjn5DGzMCgX5cVyxaibsKJa1hgfhuzflIFix0h+jGHfxe/oRBMdbYcHKZQ48M2wxnRPymUwdkeHcTl7VMDZraDH1zhfMI4vXAffQctUxkaBSQD5YsKgjQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782551900; c=relaxed/simple;
	bh=2L8zScgUc3tNFyO+RZD1cdFNQ1CnMp/QFwV42q249JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZCcHc6ylj/wZd5R6St33Ih1KOXzc4frE/ZfTr5thfxCdvrwzHJB84/EhawX0GW/47KIobjSxPHhq0PQHNlhsY4VP6xxJJko/J1ZdkNBo8Qkxd/edUg5TffbYvOgidPOAwmvYoNEhuUaR8TpafkfM6Rol22I03WMZ0KqmF6YsIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UyeJ24+x; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FVgl7sVJ; arc=none smtp.client-ip=80.241.56.151
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gnRm253LSz9tgj;
	Sat, 27 Jun 2026 11:18:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0NBB/jFCgD9qO1i9EY3bNI0lxBAwYUv4tadrp4nhd4o=;
	b=UyeJ24+xBINAG8tkZpDjOrsieMKGcCu3hkY16FvnzFAAPQHUUyFxNCv05UNaCdR0V1ZU5u
	yU0ysZpNDVGPRzF5iN8bkdlqVDg9Xu7YTIvzqr/Bq4M05jQy8NA0/lTd51HqqsjJ/xpjek
	5DhwGvOUcBQk0ygibjcXMIWqSfrSpoDvbR6pCMrTdjL5UcxKEznRexIv4q6ICO6P3iJNow
	kuFoGUd+FMDYuhuHe1grVhLL8+Pbp/OMU5lZTzeoGZSoP/dFbk3s99PvPJfH94/KLlPpYE
	/6FUKClHzq2iLq1/xTTjc6yutpifMo12hTmy2C2Md9NZdCl+GLzrZ5IQDxjKZw==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0NBB/jFCgD9qO1i9EY3bNI0lxBAwYUv4tadrp4nhd4o=;
	b=FVgl7sVJ2qWdptNO14//R4h3M/EYoEXtLEa3GHfJFL6vFxno0EsYrIiQxy0NStOY6WqADl
	xmvMvsZxjS5SlsLtfjmWpDurkDboskVRNGZYJvlFnHho2I29a1prOUcyS3ueMHNZdGJexp
	bFNJ5TuIvPHUrMXHmw0nlgT/pyHxHvQ2zWZEkQkM9seL73t/HO0ZDzhEe2EY2Q34Hf1HV2
	EQ2R7EIwXhLatu8t302mV6dvPZikuHOwtnAZt9dDBqYedj/fCYWDKNcBBcHBh+q3YUA2e4
	dgR+EY16oChWCZcUqbrMGKBguSu5vrHpasxy9rULF3RRPkZyLoxihY/1F/K40A==
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] docs: watchdog: Fix brackets
Date: Sat, 27 Jun 2026 11:17:08 +0200
Message-ID: <20260627091707.29688-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: j9sqchyx86gj315ytionmepmekkdog94
X-MBO-RS-ID: c39a9ca55ba58113048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93813-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-watchdog@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rdunlap@infradead.org,m:manuelebner@mailbox.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D60526D18AE

Add missing brackets ')'.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/watchdog/watchdog-parameters.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 2359aa32e25d..8e2df5b7d241 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -59,7 +59,7 @@ advantechwdt:
 
 alim1535_wdt:
     timeout:
-	Watchdog timeout in seconds. (0 < timeout < 18000, default=60
+	Watchdog timeout in seconds. (0 < timeout < 18000, default=60)
     nowayout:
 	Watchdog cannot be stopped once started
 	(default=kernel config parameter)
@@ -68,7 +68,7 @@ alim1535_wdt:
 
 alim7101_wdt:
     timeout:
-	Watchdog timeout in seconds. (1<=timeout<=3600, default=30
+	Watchdog timeout in seconds. (1<=timeout<=3600, default=30)
     use_gpio:
 	Use the gpio watchdog (required by old cobalt boards).
 	default=0/off/no
-- 
2.54.0


