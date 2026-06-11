Return-Path: <linux-doc+bounces-91894-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pYWYLzUbKmp+iwMAu9opvQ
	(envelope-from <linux-doc+bounces-91894-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 04:19:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD1466DCBE
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 04:19:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nTeGiyfc;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91894-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91894-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E065A3230F44
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 02:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727523043CE;
	Thu, 11 Jun 2026 02:13:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC42F8E8F;
	Thu, 11 Jun 2026 02:13:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781143992; cv=none; b=ltnmVsawpFdXyyPHfS0UbzU15Q9ik54Ri+QfcxxiiMfohJV39oNe6Hh3XVK599azlT3WhE7IqCHGKICQ6cTt8415zt2ol5Uh1jfGQc8nbLW82qAOFWFoMpQ4M9xkLSo/i2nlMbXAgSW1B8BM4DXk62sG2M8Vd9wkCHTVLS58WCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781143992; c=relaxed/simple;
	bh=Xap7H8UAoIUA/wNcy62mnSSsuF0nEhKYiIONliI17Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qz4d9NE9KIdOcfo/ZgZOHqHmG6cfAz35D+q6X8p7gkkAWCic5aRVEywryC9bSKRz63ZHw75Gw+3MyC0Eq9Gnk0q7mSanae8xrv3tkhSdjI8X/9o5wS/KT21FHIZtcC50Li38CsGmhb2NA0RROr9lL1jfIe5ZQX1q5/v9OFMfEsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTeGiyfc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887A71F0089A;
	Thu, 11 Jun 2026 02:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781143986;
	bh=yTN+srMePk/Xv13TFRHLOX/XvmjjSigDrHt4kkZOhYo=;
	h=From:To:Cc:Subject:Date;
	b=nTeGiyfcKlrKdYD9wIjuwPFyGJBJYbvGlIVWJtLnEIsQt9W+ie01O3FgUk9kGHF/0
	 x2X6hIW6EIenizvu6K8+PAEtP0+s+OGrg5rA6BSYgSQ/5w+CMMlmsRvV+NTZ9ZvUZ3
	 r2lhUEBvoroaMdqQaLTcOOWpb1CgtT3R5n8eraUiYIrkAfUEc7S6CaXa+KoZHQ7asL
	 VvZ8XzWRwEuQDm/5w9qj95ntTOX4U9PYtFs/Qa/Rv5J1ZNGwAj8Tbv3gWvUe0Z2ibF
	 F+HWm35ccI5zWwgIz+mEpq+oc/kVo2uOFA/9Bmi/2tL3cYN7sgYfmWdRcUls4XRQzs
	 xTUNbfUl1i9KA==
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
Subject: [PATCH v4 0/2] PM: dpm_watchdog: Improve DPM watchdog configurability
Date: Thu, 11 Jun 2026 02:12:16 +0000
Message-ID: <20260611021219.2093476-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-91894-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CD1466DCBE

This series improves the configurability of the DPM watchdog.

Currently, the DPM watchdog timeouts are fixed at compile time, and the
watchdog is always enabled if compiled in.  Also, the module parameters
defined in drivers/base/power/main.c use the generic and non-descriptive
"main" prefix.

This series addresses these limitations.

Patch 1 renames the module parameter prefix for drivers/base/power/main.c
from "main" to "pm_sleep".

Patch 2 introduces the "dpm_watchdog_enabled" module parameter to allow
enabling/disabling the watchdog at boot time and runtime.  It also adds
CONFIG_DPM_WATCHDOG_ENABLED to set default value of the module parameter
at compile time.

---
v4:
- Address review comments.
- Patch 3 in v3 has applied separately.

v3: https://lore.kernel.org/all/20260608021526.1023248-1-tzungbi@kernel.org
- Address review comments on patch 2.

v2: https://lore.kernel.org/all/20260604090756.2884671-1-tzungbi@kernel.org
- Form a new series.

v1: Doesn't exist.

Tzung-Bi Shih (2):
  PM: sleep: Rename module parameters prefix to "pm_sleep"
  PM: dpm_watchdog: Allow disabling DPM watchdog by default

 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 drivers/base/power/main.c                       | 14 ++++++++++++++
 kernel/power/Kconfig                            | 10 ++++++++++
 3 files changed, 31 insertions(+)

-- 
2.54.0.1099.g489fc7bff1-goog


