Return-Path: <linux-doc+bounces-91895-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ST9KF0MbKmqGiwMAu9opvQ
	(envelope-from <linux-doc+bounces-91895-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 04:19:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7466DCCF
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 04:19:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BjgvDrcX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91895-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91895-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D411A323B449
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 02:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1292530C37A;
	Thu, 11 Jun 2026 02:13:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F0D3043CF;
	Thu, 11 Jun 2026 02:13:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781143993; cv=none; b=mY+It995mWLO0Ee9+xRpBYe24OqvheTmmGFEaQt90El0HCOXAF2Z4Hr6ykaxZJFOzYNiWWeu/tt1v9QdlYJ1ucfi5/bWdHtJKD5vKdWPnyy6g4cj74yDhR7+hXkyGH62Uq9V3AtJWQd2wrQ0MSkIUobJfp6LjtFAjuF6CknHZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781143993; c=relaxed/simple;
	bh=m8yF4dkU8yKFgwp1ky/++t3fLrwNa5PWTyU3uQVTFwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJybhb3vo0qTDa83DOAwAcRgFE7q1DjFkllMI0q4pxhMw/jY+CtDPuaxon51Zw8Fs2L45w5dNwI2sMqh1LNo8fSW2fns+zXhjGSzDdKj/v3d+6qLGBtXZBjy/O1zF9zZF/gOrSbFsAN9ze2waHaCGEYFJkmpXogwFjerhYPUyEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjgvDrcX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0041F00893;
	Thu, 11 Jun 2026 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781143989;
	bh=bnKbwsDSMV9RnHZbKTo1f6nG3QI6XH6qEN+ssPp3fMs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BjgvDrcXl8r/W3r+IwF68IVVk4xzJeumvA4WPLrEtpiYoEBnqHf9Y4uYYHt23rBvx
	 WTv1DDriVmu/2mvMx8yMJQex0nIOHpWjbQKqO/d7LsztiwbLLrnhXmfED9IKnLY9jA
	 gCNaehAyhLsm3OBFbr18BleZXWjbwYCa4G0UfqeXfAWJ4wYKS8fEYL0EMojbnZsO9g
	 Pu3mz/AavX1D2ERqSgaVVEkI/sv4D+mzyoNc0p/INH3uMuwHdfN91x5xkKqBjHkbw/
	 /LrlL1FPcUUgG1Sw8N/EYnhak5gAudeUrJ2DyD1D+6rZCR4PI6MKoAbt38/0s+BeNq
	 5tSzgHSWUtHNg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	tzungbi@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 1/2] PM: sleep: Rename module parameters prefix to "pm_sleep"
Date: Thu, 11 Jun 2026 02:12:17 +0000
Message-ID: <20260611021219.2093476-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260611021219.2093476-1-tzungbi@kernel.org>
References: <20260611021219.2093476-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:rafael@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:tzungbi@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:tfiga@chromium.org,m:senozhatsky@chromium.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91895-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8F7466DCCF

Currently, the module parameters defined in drivers/base/power/main.c
use the default prefix "main" (derived from the filename).  The prefix
is too generic and non-descriptive.

Redefine MODULE_PARAM_PREFIX to "pm_sleep." to group the module
parameters under the namespace instead.  This makes the parameters more
descriptive.

---
v4:
- "power" -> "pm_sleep".

v3: https://lore.kernel.org/all/20260608021526.1023248-2-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/all/20260604090756.2884671-2-tzungbi@kernel.org
- New to the series.

v1: Doesn't exist.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/base/power/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index f71467f6ada4..c6a3300cfb7a 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -41,6 +41,9 @@
 #include "../base.h"
 #include "power.h"
 
+#undef MODULE_PARAM_PREFIX
+#define MODULE_PARAM_PREFIX "pm_sleep."
+
 typedef int (*pm_callback_t)(struct device *);
 
 /*
-- 
2.54.0.1099.g489fc7bff1-goog


