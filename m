Return-Path: <linux-doc+bounces-95619-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CufPGqPlTWpD/wEAu9opvQ
	(envelope-from <linux-doc+bounces-95619-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 07:52:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288072206E
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 07:52:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=X5VC9pdi;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=UUoieJkR;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95619-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95619-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35307300291E
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 05:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A215737C0EC;
	Wed,  8 Jul 2026 05:52:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABAF4AEEF;
	Wed,  8 Jul 2026 05:52:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489942; cv=none; b=soPCUcjZo5a3Aorz2zIf3fGFWAFz5FAlQ287d7VkfscOwhrHVhk8AKj/1tr56c8n0m95YS5vA9I/M/D/ChunyXpZaeStj62eGWegUT62LQFv5o/uW3WEir8TACgL5q7mUL8uxSPltPNvbJOKBUKKJybiJFs11wmtNUZRJsbbuVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489942; c=relaxed/simple;
	bh=CRwEQQ/qISZocbLsCftB8CwH1KVxGRXo8oiO3OQSZf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qz2G2CTVRrGZku49mBfVjGqJJP2jKFAbvPrdNuaM+p42J+hR4gHvEobcNo+Ku+NrPQSFG+/iv8Pq1tgBcts9flpurvFK87WnVL9ruOrAOxZK55QwtnVX/8G0XeboB0gWx7AvDJ4G6C3Vp05l3mi9oqlb0QvDbwvQe5+WWkYMRkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X5VC9pdi; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UUoieJkR; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gw6gQ2xCGzKv7n;
	Wed, 08 Jul 2026 07:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783489938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Sh7udOybOC/7flZrXQSRfzdutb+rjfnQXOZsmasIgY=;
	b=X5VC9pdiT+ZDnWdQPOfD80SAD/QGYvL3ijL1ebz+ip2yAH91DVx/H7bsCmTskiWWYm7hVe
	ttAYEUpgqUe6yTZNcRBgGKA+xOTrXfSpjn9C3Djoalc+EdKVNpS1/tb2TBpUMsXMxRj8it
	lutnygoOHF93budb+XX/6Xreo5Iuyol38BEeaGEFxLBB2m1l6neywF7f4lGS4saidXjflH
	iASxJHlFAkGpqIkXyF/sajYrB8FvsnSFxN8PPA53JdDgbwC/SNOIu5D8BGANR1i52XXx3C
	yFqfS53nsx9UrJ6CcJRkH3JhJzTOp3mX9LBLR5gGzKJ4RVtyN/cw/wLIJrP6qg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783489936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Sh7udOybOC/7flZrXQSRfzdutb+rjfnQXOZsmasIgY=;
	b=UUoieJkRZExF6WIj1ViTvI2X4DhtVYB9dDkd8f+98ZLh52Dw8igDoE0+JqOwpu1lk3dVIQ
	doOt15iYftUt3WvSgNl9UzXs+HQ/anrCirkqWBEMyvcMyyiCq4bOJHTl3Wx4Gfer7CBYI0
	vVRhOxccHOcYjub6YEdburyC5WB1v9ZDoSeoLxcZK+aOUsCP2rsQExA+XsWn0bhIxiJ/UE
	JTHkXV8EDc8xZnXpaSEbrKa6l3ERH3rattMJFJ7PtSgw0BVIpG5mEfiPlY8OHljMBMp9yu
	ANk/DlFqzolVCepCgGV6xp9iP6J/qLgYtrVz09YkKZFrx1qZNshvcP9SKD+wQQ==
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rajmohan Mani <rajmohan.mani@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: admin-guide: thunderbolt: fix sentence structure
Date: Wed,  8 Jul 2026 07:49:24 +0200
Message-ID: <20260708054923.293003-3-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d924e20bbbf70659084
X-MBO-RS-META: 71e4hw787rtodazohpir5f19sawt6jps
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95619-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andreas.noever@gmail.com,m:westeri@kernel.org,m:YehezkelShB@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:rajmohan.mani@intel.com,m:gregkh@linuxfoundation.org,m:manuelebner@mailbox.org,m:rdunlap@infradead.org,m:mika.westerberg@linux.intel.com,m:linux-usb@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andreasnoever@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,infradead.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5288072206E

Replace ')' with ',' and add 'in' to sentence.

Fixes: 3fb10ea4ce86 ("thunderbolt: Add support for retimer NVM upgrade when there is no link")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
[v2] 
 fix changelog
 add Acked-by Randy
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


