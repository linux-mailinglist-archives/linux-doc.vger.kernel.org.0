Return-Path: <linux-doc+bounces-93807-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q/VSKP+JP2o+UQkAu9opvQ
	(envelope-from <linux-doc+bounces-93807-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 10:29:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C76D179B
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 10:29:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=davidgow.net (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93807-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-93807-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0186300B807
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 08:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EE136A36D;
	Sat, 27 Jun 2026 08:29:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DC93016F5;
	Sat, 27 Jun 2026 08:29:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782548983; cv=none; b=bdg2Zm1i67NwF8K8oW8BiiEdA7eoGi0CzlciYzkXo+VONcQz/biZSgQB6nuqpg2CVBieJeckN7kgw5eTE8U8/slKpq4T4gZ64QA1da4TivYyUt3BKq1PwzWsfclUX7HEmSl4uK8SyhoZTNq/txLxjd/fxhbX/gXWsjwVdQBRClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782548983; c=relaxed/simple;
	bh=s7RhtMtbvIvIy5+/t84IB6bqeV2ZahRLNRigWzTvjJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+t4Q2dXJXw2e+OAg93symZeCC0x3dhKw24LZT2z2zf4+vG4RKbYKHlzyY8IhWpx25xmpqsUDen9bf1mnD53i0BYQoPOOKYdMhwkX7p+fVve3E6rcZmVBC3/ovNeq0yZedi/C16bOtGhBYPzYZp0ZFZ3LRaHnGHYS6jgnOMmUmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 5FBF31CE6E0; Sat, 27 Jun 2026 16:29:33 +0800 (AWST)
X-Spam-Level: 
Received: from sparky.lan (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 22C8D1CC62B;
	Sat, 27 Jun 2026 16:29:31 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <david@davidgow.net>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] Documentation: kunit: Test Kconfig entries shouldn't select other configs
Date: Sat, 27 Jun 2026 16:29:19 +0800
Message-ID: <20260627082921.1709181-1-david@davidgow.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[davidgow.net : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:raemoar63@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:david@davidgow.net,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@linux-m68k.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93807-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,gmail.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[david@davidgow.net,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[david@davidgow.net,linux-doc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,davidgow.net:email,davidgow.net:mid,davidgow.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E2C76D179B

Add a note to the Kconfig section of style.rst to use 'depends on' rather
than 'selects' for dependencies, as this can cause users of
CONFIG_KUNIT_ALL_TESTS to suddenly grow unexpected dependencies.

Signed-off-by: David Gow <david@davidgow.net>
---
 Documentation/dev-tools/kunit/style.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kunit/style.rst b/Documentation/dev-tools/kunit/style.rst
index eac81a714a29..449f9f816fc7 100644
--- a/Documentation/dev-tools/kunit/style.rst
+++ b/Documentation/dev-tools/kunit/style.rst
@@ -164,9 +164,10 @@ This Kconfig entry must:
 * be visible only if ``CONFIG_KUNIT_ALL_TESTS`` is not enabled.
 * have a default value of ``CONFIG_KUNIT_ALL_TESTS``.
 * have a brief description of KUnit in the help text.
-
-If we are not able to meet above conditions (for example, the test is unable to
-be built as a module), Kconfig entries for tests should be tristate.
+* depend on the feature being tested, rather than selecting it (so that
+  enabling ``CONFIG_KUNIT_ALL_TESTS`` does not enable unrelated functionality).
+* be ``tristate``, unless there is a specific reason that the test cannot be
+  built as a module.
 
 For example, a Kconfig entry might look like:
 
-- 
2.54.0


