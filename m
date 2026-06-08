Return-Path: <linux-doc+bounces-91279-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NrhWBOUlJmoiSwIAu9opvQ
	(envelope-from <linux-doc+bounces-91279-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 04:16:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D8652308
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 04:16:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="dCWDI/bY";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91279-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91279-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F322E3009CCC
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 02:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733442EEE7E;
	Mon,  8 Jun 2026 02:16:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC434CB5B;
	Mon,  8 Jun 2026 02:16:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780884962; cv=none; b=ZXlQkEPJQiW1s6NRTnspqCz0vMiXLVcgza2zdrhzua35IslgHTVq70QJKgsNq5memPe1/yCs3wLxQF4cCBD8wKF0d2jfrw27VyD8/27DjsYxL8zfqud4vlL0gYLWYF/VTYrmhxZUgml0+KiwlXdKD8r5RCgKqqfpF25zm8gAIcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780884962; c=relaxed/simple;
	bh=as1cn8I3sAvGEeC+Ccs5oMsBbu5PT+oFi1OPh3uD+8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CjIKQQy1kRK4rT2ZvNUuY2Y93LcSf3dtvKzQwNPVkGWpxmUkWY9rZ/CzIHTG4Kz0i58+pCtd11k67AYeounZ9zRfqst/e7zyzRMXKF3/cJi9OiFA2Z15P1QJOMA+nozj5STTIIh+NvaLFCtiObZTCGVs8MCtcVFH9a1tGpZg5AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCWDI/bY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45651F00893;
	Mon,  8 Jun 2026 02:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780884961;
	bh=TdKMJPGr34VAMb6PbEzE4fJdx7m/8TjEUcQyEL/oeJ4=;
	h=From:To:Cc:Subject:Date;
	b=dCWDI/bYKJ2I0hjp/fmSUDPN+b7dbVqLQPrUhzqB0zZPywlc2OEDhhOnaQNILWtZQ
	 QUbIKD+17fSqtYLz71FgGb0FmSRj4GF2i2IyreQrx6xj4FDgNBz490SAGlezkXllMu
	 WtMXx+i3U8mNq8LAeqAAwUntCIxt+nKSk86HRbY69aHZNMJQG+o14rChKdi96y0ugL
	 re257J5SAB6dfU4m89MIHhmywCg2LvYwNaDvGKHKRgWEjKHAzUTJi0EmfzZi4P1BaO
	 BhnxFIs5k/mQ/BSjO5eWgaAhnvsvc30LZvB6Z/MfDZ+zWRNg7tT1oMEO5JVN+JsYpF
	 sI2/j6cXC41cQ==
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
Subject: [PATCH v3 0/3] PM: dpm_watchdog: Improve DPM watchdog configurability
Date: Mon,  8 Jun 2026 02:15:23 +0000
Message-ID: <20260608021526.1023248-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91279-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:rafael@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:tzungbi@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:tfiga@chromium.org,m:senozhatsky@chromium.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E6D8652308

This series improves the configurability of the DPM watchdog.

Currently, the DPM watchdog timeouts are fixed at compile time, and the
watchdog is always enabled if compiled in.  Also, the module parameters
defined in drivers/base/power/main.c use the generic and non-descriptive
"main" prefix.

This series addresses these limitations.

Patch 1 renames the module parameter prefix for drivers/base/power/main.c
from "main" to "power".

Patch 2 introduces the CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED to allow the DPM
watchdog to be disabled by default at compile time.  It also exposes the
"power.dpm_watchdog_enabled" module parameter to allow enabling/disabling
the watchdog at boot time and runtime.

Patch 3 introduces sysctl knobs under /proc/sys/kernel/ to allow
configuring the DPM watchdog timeouts at runtime.

---
v3:
- Address review comments on patch 2.

v2: https://lore.kernel.org/all/20260604090756.2884671-1-tzungbi@kernel.org
- Form a new series.

v1: Doesn't exist.

Tzung-Bi Shih (3):
  PM: core: Rename module parameters prefix to "power"
  PM: dpm_watchdog: Allow disabling DPM watchdog by default
  PM: dpm_watchdog: Add sysctl interface for DPM watchdog timeouts

 .../admin-guide/kernel-parameters.txt         |  8 ++
 drivers/base/power/main.c                     | 75 ++++++++++++++++++-
 kernel/power/Kconfig                          | 10 +++
 3 files changed, 89 insertions(+), 4 deletions(-)

-- 
2.54.0.1099.g489fc7bff1-goog


