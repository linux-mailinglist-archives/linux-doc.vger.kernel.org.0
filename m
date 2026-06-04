Return-Path: <linux-doc+bounces-90914-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3OB3BjVOIWqwCwEAu9opvQ
	(envelope-from <linux-doc+bounces-90914-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 12:06:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B7063ECEE
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 12:06:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="U18bV6+/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90914-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90914-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 484F730A27DD
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 10:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647183F7A87;
	Thu,  4 Jun 2026 09:59:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B463E5A15;
	Thu,  4 Jun 2026 09:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567183; cv=none; b=K79JDj7/8V0bc80M5NlTKQ+rccgGq7pfbxLquTviNCz01aSi+75ThNmokT/BUcoLQBumLzdJUrCasiGds3IOa2iNBUpewxAu456Kgi50TWpN0aHQxHJeQKajEcQ+w5PGXuopqIfH3bdf1o43ALWCCThHhxSwvkGxATgRQdb+Pfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567183; c=relaxed/simple;
	bh=/CbzLZwbhgNI/4HnhuFHpmukUiXH4CM37GduoWTGC+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngDeZWFwV8pZbxH3GvITDKoc2ekR5p+ZPzXFS4rbcxTJGpw4J6ECAojFu3fFGoVCODuBauYWkCeV2+RyLbaK9hGJAd6V8FVSvt0YvVKMEO0jw/9sbiTYCWGcL/z30qCJk2KOaNzteczAgWiI2ix3/1hS5QZ+IoHFoWfXc3K9R1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U18bV6+/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6692C2BCC6;
	Thu,  4 Jun 2026 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780567183;
	bh=/CbzLZwbhgNI/4HnhuFHpmukUiXH4CM37GduoWTGC+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U18bV6+/1GdAQ39KdfY86WDpzSt9ZHLeh44bqkwxubgCsCXrNu13P62rsrCEtc7dA
	 PJhdYM8KFQU21fSeGyCVxXQm/kvprm4jLBYt8I7WXJeZAgcGmLJXzMX9BKAUDdvTaV
	 58d3j0+LrMxvhDxZd8tYsH8NlNxUVrnxDB4Fg7mmNH28jz36hqA7X4NY+YsV7LS78o
	 niVyQgSLqFw8fHZCCTovQ8BBW7AsJo9tLUu9qLYsPs1AZNArbbugEFp+vwWn+j/dxk
	 Flq8ms82RxOKj1VFg9HpQ73M/jpuh8j6cIIUKoMBhrpbAjkENpOH8qZPaGD88xWq9J
	 bVNzMHQZKQRyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A60CD6E6B;
	Thu,  4 Jun 2026 09:59:42 +0000 (UTC)
From: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Date: Thu, 04 Jun 2026 10:58:56 +0100
Subject: [PATCH v16 02/14] lib: kstrtox: Make _parse_integer() take
 variadic arguments
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-adf41513-iio-driver-v16-2-1a7d09143bc2@analog.com>
References: <20260604-adf41513-iio-driver-v16-0-1a7d09143bc2@analog.com>
In-Reply-To: <20260604-adf41513-iio-driver-v16-0-1a7d09143bc2@analog.com>
To: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux@analog.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Rodrigo Alencar <rodrigo.alencar@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780567181; l=1796;
 i=rodrigo.alencar@analog.com; s=default; h=from:subject:message-id;
 bh=EqLdZR8cjHuyGGI5BXPc4y5RppVuc83EKeDLoTQ6DB4=;
 b=sx8H+UuquyJaYcDJrY/E91i+kcVZ05EXGkglT11SjCY2W6ytTrqy9MnKlj9Bsk2QtZbGZyUOo
 JwMgRmIzHdrDHKyaVEBRphl3F4tL/mm53auxaIe3BEkBbgeNYOY7HS1
X-Developer-Key: i=rodrigo.alencar@analog.com; a=ed25519;
 pk=ULeHbgU/OYh/PG/4anHDfLgldFItQHAhOktYRVLMFRo=
X-Endpoint-Received: by B4 Relay for rodrigo.alencar@analog.com/default
 with auth_id=561
X-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Reply-To: rodrigo.alencar@analog.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-90914-lists,linux-doc=lfdr.de,rodrigo.alencar.analog.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:andriy.shevchenko@linux.intel.com,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:skhan@linuxfoundation.org,m:rodrigo.alencar@analog.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	HAS_REPLYTO(0.00)[rodrigo.alencar@analog.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:email,analog.com:mid,analog.com:email,analog.com:replyto,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9B7063ECEE

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Instead of having different functions that just use default parameters,
combine those to use variadic arguments, so the user may call it using
the same name.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
---
 lib/kstrtox.c | 6 ------
 lib/kstrtox.h | 9 ++++++++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/lib/kstrtox.c b/lib/kstrtox.c
index 97be2a39f537..0399856713c1 100644
--- a/lib/kstrtox.c
+++ b/lib/kstrtox.c
@@ -87,12 +87,6 @@ unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned lon
 	return rv;
 }
 
-noinline
-unsigned int _parse_integer(const char *s, unsigned int base, unsigned long long *p)
-{
-	return _parse_integer_limit(s, base, p, INT_MAX);
-}
-
 static int _kstrtoull(const char *s, unsigned int base, unsigned long long *res)
 {
 	unsigned long long _res;
diff --git a/lib/kstrtox.h b/lib/kstrtox.h
index 158c400ca865..00cf3255bdd2 100644
--- a/lib/kstrtox.h
+++ b/lib/kstrtox.h
@@ -2,10 +2,17 @@
 #ifndef _LIB_KSTRTOX_H
 #define _LIB_KSTRTOX_H
 
+#include <linux/args.h>
+
 #define KSTRTOX_OVERFLOW	(1U << 31)
 const char *_parse_integer_fixup_radix(const char *s, unsigned int *base);
 unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *res,
 				  size_t max_chars);
-unsigned int _parse_integer(const char *s, unsigned int base, unsigned long long *res);
+
+#define _parse_integer0(s, base, res, ...)						\
+	_parse_integer_limit(s, base, res, INT_MAX)
+
+#define _parse_integer(s, base, res, ...)						\
+	CONCATENATE(_parse_integer, COUNT_ARGS(__VA_ARGS__))(s, base, res, __VA_ARGS__)
 
 #endif

-- 
2.43.0



