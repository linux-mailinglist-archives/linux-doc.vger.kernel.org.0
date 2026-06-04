Return-Path: <linux-doc+bounces-90913-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P2AhOJxQIWqYDAEAu9opvQ
	(envelope-from <linux-doc+bounces-90913-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 12:17:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213B63EECF
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 12:17:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=WqOzcc6C;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90913-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90913-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6190A30B89ED
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 10:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E253F7898;
	Thu,  4 Jun 2026 09:59:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ABF3E558A;
	Thu,  4 Jun 2026 09:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567183; cv=none; b=AhV5bZUr8blbX98DZPfOVOe3dcx3EeOpygiiPTWgKHbylIB0tsbEciCtvCMkCQ43Z1bA4b2RJtBGHqNKHaPkDJtCBeWBOxTRO1fYCHrqjGjLBXBNSBCe/y3qL63Y5+gWQVE+6jt67vqB1U8Y0sgjxCPYsIFf9BIKNqEiLlI6R/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567183; c=relaxed/simple;
	bh=HL85O5ywfizEHOr8eGwBRTKm83kTNoC//I2DIxVkQDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3CI7rGFrgmXsmXxB8sP5no26km9W9NySkZjRMFE3poCgbq+3QLEl1FMCUfw+kckJDO1wmyS69xb14hZL5uF3ehD8QTriBB3V7EUUysH3cqIJyMxGXVdLdfow+Zk9FUTkU4wLpuSjFTsZj4W/8QKZ0wUDuMAetA0oLY7mLg5znI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqOzcc6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0786C2BCF5;
	Thu,  4 Jun 2026 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780567183;
	bh=HL85O5ywfizEHOr8eGwBRTKm83kTNoC//I2DIxVkQDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WqOzcc6CRNs9pTo4OibKaTBjYpEzaU4mUHhVQg+nPFVILZtYMlfx77smaZ2M4AzP7
	 PBMOHU2XERhWdpit3CEtnq/8TpWkVwDvRwfp6WFQtgVMafnTQQ+azZeTdj92y9NthL
	 dLsxw1x15bJfGb609bWtmJrQXCd1jTnuImbikEtuiAMg2ja1MARf8/tCiuqiWFVv2m
	 A6In7Oa0h7dwfKIX6vZEffT1vWR6htwbswKhqmVzLsD1AOY6TW+U/qHg7zBd8fEYm9
	 TQbQiwxzEn7/HgS3iepmMK/kWd1EPywAWhX/mDXugrefA1s7Q23Uh8zEi8ibxel8QM
	 YngmueHLYbjdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5444CD6E4A;
	Thu,  4 Jun 2026 09:59:42 +0000 (UTC)
From: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Date: Thu, 04 Jun 2026 10:58:57 +0100
Subject: [PATCH v16 03/14] lib: vsprintf: use _parse_integer() instead of
 _parse_integer_limit()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-adf41513-iio-driver-v16-3-1a7d09143bc2@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780567181; l=1516;
 i=rodrigo.alencar@analog.com; s=default; h=from:subject:message-id;
 bh=HnHwwNxnBXJiolG9zBUbHrPgMO46GbC/RCE69yuI1/o=;
 b=3u1uRjndj72I3RRHTZ/96+S5fBdcevBkPJrFmkplGDrC66PxSMptJrMQzvs3ikSOT33yDJUVy
 BzLeid1vQuCBCSTB+g+s34w96MbUahV9/dUD4qRnl5Xc8gpL2nkjmgy
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90913-lists,linux-doc=lfdr.de,rodrigo.alencar.analog.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:andriy.shevchenko@linux.intel.com,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:skhan@linuxfoundation.org,m:rodrigo.alencar@analog.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[rodrigo.alencar@analog.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0213B63EECF

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Use _parse_integer() that allows optional arguments to be explicitly
initialised.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
---
 lib/kstrtox.h  | 3 +++
 lib/vsprintf.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/kstrtox.h b/lib/kstrtox.h
index 00cf3255bdd2..ff84fe434a00 100644
--- a/lib/kstrtox.h
+++ b/lib/kstrtox.h
@@ -12,6 +12,9 @@ unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned lon
 #define _parse_integer0(s, base, res, ...)						\
 	_parse_integer_limit(s, base, res, INT_MAX)
 
+#define _parse_integer1(s, base, res, max_chars, ...)					\
+	_parse_integer_limit(s, base, res, max_chars)
+
 #define _parse_integer(s, base, res, ...)						\
 	CONCATENATE(_parse_integer, COUNT_ARGS(__VA_ARGS__))(s, base, res, __VA_ARGS__)
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 9f359b31c8d1..e6cf5f62738d 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -86,7 +86,7 @@ static unsigned long long simple_strntoull(const char *startp, char **endp, unsi
 	cp = _parse_integer_fixup_radix(startp, &base);
 	prefix_chars = cp - startp;
 	if (prefix_chars < max_chars) {
-		rv = _parse_integer_limit(cp, base, &result, max_chars - prefix_chars);
+		rv = _parse_integer(cp, base, &result, max_chars - prefix_chars);
 		/* FIXME */
 		cp += (rv & ~KSTRTOX_OVERFLOW);
 	} else {

-- 
2.43.0



