Return-Path: <linux-doc+bounces-90915-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ozrHMDhOIWq0CwEAu9opvQ
	(envelope-from <linux-doc+bounces-90915-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 12:06:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD463ECF6
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 12:06:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=AKrTzwxF;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90915-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90915-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2EF630A29B5
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 10:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C77C3FB7F3;
	Thu,  4 Jun 2026 09:59:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A4B3E638F;
	Thu,  4 Jun 2026 09:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567183; cv=none; b=OqVuvKbzhwqJDN5fgU6mybNoEIA+ToBkI46MaJHe2fB7j/bHZIkkbm/H9h09hQgWeOJJA/ORaVFgh21RliWfScSY1v7sA+1/0Hs08b+ZWL64RPrwUnLJhLdTudGjPlIeK3ekmYQoTspup9WEpv9/UBw/4RpF9dkPfu6HDbtGuGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567183; c=relaxed/simple;
	bh=j0yde657AyQhx2FMzyIpckgkxnZYNH3r8JEq8/bisoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s3BpdNF5GVEEqXqIESihzIBiuBBMRLtzedMwDLD3WrYw/WqYauxJ5w+gmKmenFf0hM+AEb5g01EW9umRyQq0Tz4dYFKlMHtUEmUyeixlnGVgAdaZWLeDYHSeuPjLM2ppejWAV0db5EY5XGX1ZR+L1DbXXivpQvyxJ9HoLmj4hf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKrTzwxF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CBCDC2BCF7;
	Thu,  4 Jun 2026 09:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780567183;
	bh=j0yde657AyQhx2FMzyIpckgkxnZYNH3r8JEq8/bisoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AKrTzwxFm7rkHxpo1B7HpNYbGno7IUrpXrTkWd4k2+/5WrQEXHos6UJIG2Fxzk32b
	 /YIiDAP7MFZ1cKkaZ9Dw2hot+vL8RdHMa+BzCkNRcs93hYahC7E0KulDKfoKrZM1TV
	 jFrd6giyLEBD5NQrVjpUlqv2ybQRmhelFZUM8gMlDSAuhxQx6ArYDckCNBAZqNzcGn
	 YdPGbHxHZaiboN3tL7OKG8zPXLu8e+Wv2oPr7gQrR8A+sYi8fEv+HpDdNzLKVobRWw
	 me+/TGPgeHiM9pXTgASEEJetgeOOtJZXHnZzOmf5G9mUCLte4vE4S1tIiL0ybhqbSB
	 kxYSRbQMiAt3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014A9CD6E72;
	Thu,  4 Jun 2026 09:59:43 +0000 (UTC)
From: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Date: Thu, 04 Jun 2026 10:58:58 +0100
Subject: [PATCH v16 04/14] lib: kstrtox: add initial value to
 _parse_integer_limit()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-adf41513-iio-driver-v16-4-1a7d09143bc2@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780567181; l=2039;
 i=rodrigo.alencar@analog.com; s=default; h=from:subject:message-id;
 bh=E5LdU8JOCTVd77KslWCd6DlpfzZCyFPV4Z1fW685/A4=;
 b=cN8sRipwhFQl1XXm6PbB5GabZgWh4kkqLQz+4qpJUL9BD0fzRI4ASVs4V7JRshsmhxVUlG/Ql
 ZJUUmAHcvOACpegWpB0ivzTtQtcCHU1FsTfwaW8s5QrVyOEjKwtJV4e
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
	TAGGED_FROM(0.00)[bounces-90915-lists,linux-doc=lfdr.de,rodrigo.alencar.analog.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:mid,analog.com:email,analog.com:replyto,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95FD463ECF6

From: Rodrigo Alencar <rodrigo.alencar@analog.com>

Add init parameter to _parse_integer_limit() that defines an initial
value for the accumulated result when parsing an 64-bit integer. The
new function prototype is adjusted so that the _parse_integer() macros
stay consistent allowing for one more argument, which defaults to 0.

Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
---
 lib/kstrtox.c | 4 ++--
 lib/kstrtox.h | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/kstrtox.c b/lib/kstrtox.c
index 0399856713c1..cc6869a97bf2 100644
--- a/lib/kstrtox.c
+++ b/lib/kstrtox.c
@@ -50,12 +50,12 @@ const char *_parse_integer_fixup_radix(const char *s, unsigned int *base)
  */
 noinline
 unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *p,
-				  size_t max_chars)
+				  size_t max_chars, unsigned long long init)
 {
 	unsigned long long res;
 	unsigned int rv;
 
-	res = 0;
+	res = init;
 	rv = 0;
 	while (max_chars--) {
 		unsigned int c = *s;
diff --git a/lib/kstrtox.h b/lib/kstrtox.h
index ff84fe434a00..73dee79fd8ed 100644
--- a/lib/kstrtox.h
+++ b/lib/kstrtox.h
@@ -7,13 +7,16 @@
 #define KSTRTOX_OVERFLOW	(1U << 31)
 const char *_parse_integer_fixup_radix(const char *s, unsigned int *base);
 unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *res,
-				  size_t max_chars);
+				  size_t max_chars, unsigned long long init);
 
 #define _parse_integer0(s, base, res, ...)						\
-	_parse_integer_limit(s, base, res, INT_MAX)
+	_parse_integer_limit(s, base, res, INT_MAX, 0)
 
 #define _parse_integer1(s, base, res, max_chars, ...)					\
-	_parse_integer_limit(s, base, res, max_chars)
+	_parse_integer_limit(s, base, res, max_chars, 0)
+
+#define _parse_integer2(s, base, res, max_chars, init, ...)				\
+	_parse_integer_limit(s, base, res, max_chars, init)
 
 #define _parse_integer(s, base, res, ...)						\
 	CONCATENATE(_parse_integer, COUNT_ARGS(__VA_ARGS__))(s, base, res, __VA_ARGS__)

-- 
2.43.0



