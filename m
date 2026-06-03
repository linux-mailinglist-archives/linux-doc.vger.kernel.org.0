Return-Path: <linux-doc+bounces-90668-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fcvwIfHiH2pIrwAAu9opvQ
	(envelope-from <linux-doc+bounces-90668-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 10:16:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E04216359B1
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 10:16:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="vB5ZLR/f";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Jq5tHoFr;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90668-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90668-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01A483122621
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 08:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934D2407CE5;
	Wed,  3 Jun 2026 08:08:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D5E407CE2;
	Wed,  3 Jun 2026 08:08:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474109; cv=none; b=R1GIhOeidgE5t1J8XhRjpmALY3Dr5jUvRmbdjkvvf7iH2p4L/LT8lqZADRqUH0UQTpZ2eNyF+co3GuRuagkBnYksrBNL1uVdJYmnWeaSc2iMJp2is6OEIShqEk7Tzb3Kilm50HACXion/n6zsrMDM4xEX8heSYQcHXVfBjO+BMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474109; c=relaxed/simple;
	bh=SE8Dwi88Lf1Inohdf6BvMO7M/kjuqgl7K1q1znaGzE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vDh4bLXghjJU/4i2sThmkqMI4gpoo5gOwLXO07CnXtFuTQI/O20QBcl7gKTq+uLv1N7evI335dqcKcXWLJxZDSXuLyWI8FweKNsYGOuGZKpbtt+kzPPJVS5xrWS7+F8pe0ba7HqC5yzPKPkyI6l0xMw680N6AXRlxTYcznWhWFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vB5ZLR/f; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Jq5tHoFr; arc=none smtp.client-ip=80.241.56.151
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gVgLc1CxQz9tkS;
	Wed,  3 Jun 2026 10:08:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780474104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pQJmvSGaMSGIUzkPJDwFH479DdXRHj98eq2KmHK4Osw=;
	b=vB5ZLR/fBgWZ+3ZLgqFg0PFTGvzUQhqw0lzNGZaeKfpIPWQNjiNSvXEYSYarAHbTGsVUsc
	ZNijaz0NX3SWhO2wK4leycptIkE9gaxJjJDDgSRIng3Lva604inAthuozayA4zidBRWRTA
	YeLIhBVdjoKXvkkEimKh+Eqk4kG+mk+cPwuSP25QsWpiJwsbv1tHq4Q49AjRI2XYXntQz2
	ZWn46YU5nWfQnkd9IBRlXbW89vUcfROLrUtdmz05Vp3D/XJZmxPq4ZokCChQFnqd3Ugt5H
	rOn6gAl2GqTcY2j12AFh4aUZQ1m7lgJRhW9hmiwJ5jNg6GPYvdim7PpjazAJ6Q==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780474102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pQJmvSGaMSGIUzkPJDwFH479DdXRHj98eq2KmHK4Osw=;
	b=Jq5tHoFrZtAlaRXx3MPWmJ8pjLlYHaL8xK1n2wRND6WCBHhIDmwvKNeNLC8bkEG/ayN6pf
	VzfEvmvhQxMJB2Mk4YXWChcIMZEsJtIYcWp0ZP6oB8cp0eeIOc3hQ2jz2bqHIghzBqMTlm
	BhtC/mq/enWGRUfIISQHKda4t7YB7moTT6UzLtmUyyVSWiuwXJfLlvUNx13q1BnCi9JPYS
	8oTDpwULbMZUpm3/uqpAesbyTKE5sN5CGVXugIiIaHrJh6bcirUzbmhbvYIW87L088UYM4
	rROXg4bnjV3tIsnsAGABaQxGURCY4DOjZT4NSOiR7NRURGMe5YoKxWdKo9+nvg==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: index.rst: add entry of other sub-directory
Date: Wed,  3 Jun 2026 10:04:31 +0200
Message-ID: <20260603080430.344391-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 410cd39a8eb029b0e21
X-MBO-RS-META: 41gtn4j6gzzu841n6dqhm3hoki1crmhu
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
	TAGGED_FROM(0.00)[bounces-90668-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:rostedt@goodmis.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-rt-devel@lists.linux.dev,m:manuelebner@mailbox.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:mid,mailbox.org:dkim,mailbox.org:from_mime,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E04216359B1

add reference to scheduler/sched-rt-group.rst

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/core-api/real-time/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/core-api/real-time/index.rst b/Documentation/core-api/real-time/index.rst
index f08d2395a22c..661b419e7f8f 100644
--- a/Documentation/core-api/real-time/index.rst
+++ b/Documentation/core-api/real-time/index.rst
@@ -15,3 +15,4 @@ the required changes compared to a non-PREEMPT_RT configuration.
    differences
    hardware
    architecture-porting
+   Real-Time group scheduling <../../scheduler/sched-rt-group>
-- 
2.54.0


