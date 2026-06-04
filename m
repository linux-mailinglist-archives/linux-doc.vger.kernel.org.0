Return-Path: <linux-doc+bounces-90905-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b6gXLyFEIWr6CAEAu9opvQ
	(envelope-from <linux-doc+bounces-90905-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 11:23:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0A63E803
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 11:23:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UBcLHbq6;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90905-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90905-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7E8C30B0648
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 09:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC063413D8B;
	Thu,  4 Jun 2026 09:08:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F63FFAA7;
	Thu,  4 Jun 2026 09:08:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564128; cv=none; b=V+OQdgUdx1SaVSPJGNheec37+l3QAAeem0hkmsBBapIzc3mtznMrRUrVPS1sYrPScnucfWXPjgA6XnXChA83WNWHwtm2vQN8BQ1QFCpnKjhPrRbxnHls6RUFq9kvYwaxQJC7WneqDGjJwHu32+Dfz8I13+f2hOemLKLjSwHzTSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564128; c=relaxed/simple;
	bh=gR/tI7V1xtGpHTVg4yxmUFL8pTB/bPH3uiuf6LSiPWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3Jeiyy5PemjQ5CO3DfIdUdGhos0RLmG0HSbWN32gqoypoAKDH1Pmsxts7DHXM5Qz8IuhqkxXhF6GplDmfiQCvXithLWbpfmpMxZhs1OJNdSflHptN93nkBucOgPTxBOCoQPrqX+d0zY0y30Pfs3i7NMnO1ScZTBvxyd+RTgNJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBcLHbq6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263401F00899;
	Thu,  4 Jun 2026 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780564127;
	bh=dkAMsc4FtFAFIxdfhhEA2HI+PsCBrhGiEI43ClSKD38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UBcLHbq69TBDnhWQhHbjlvB3u/Hx/2qTimnfWywIWcjzbMMsaVcFXgB9tMrx4bVj6
	 xL3a2vjCPhZ26TqVTt7hpfnfHVb7Uo4uIKtR5eCgMFTUSM3/+cGyDlpYlJGKj2BfCa
	 LQo6wNI3vwmU3PcKTdUm+ZSZBHvBVij8bol96vSSM7X4oA3K+aeyKko7uF/kxeLG4p
	 7fmhldUc5vrTzDXd6Zqx4dwyWQLwZL5ZdL4FfmOcpsSSLyld3nUl5l1tlZFDyJE8BB
	 V0pNW0jg8GQpfhU6MUn3ZqgVpe4PWaaffzCtBw2Kqb1LtDKMV2/6c0NtXp/rEn5ROR
	 bv05E+gFaZMwA==
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
	senozhatsky@chromium.org
Subject: [PATCH v2 0/3] PM: dpm_watchdog: Improve DPM watchdog configurability
Date: Thu,  4 Jun 2026 09:07:52 +0000
Message-ID: <20260604090756.2884671-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
In-Reply-To: <20260604090756.2884671-1-tzungbi@kernel.org>
References: <20260604090756.2884671-1-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90905-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:rafael@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:tzungbi@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:tfiga@chromium.org,m:senozhatsky@chromium.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0A0A63E803

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
v2:
- Form a new series.

v1: Doesn't exist.

Tzung-Bi Shih (3):
  PM: core: Rename module parameters prefix to "power"
  PM: dpm_watchdog: Allow disabling DPM watchdog by default
  PM: dpm_watchdog: Add sysctl interface for DPM watchdog timeouts

 .../admin-guide/kernel-parameters.txt         |  8 ++
 drivers/base/power/main.c                     | 75 ++++++++++++++++++-
 kernel/power/Kconfig                          |  9 +++
 3 files changed, 88 insertions(+), 4 deletions(-)

-- 
2.54.0.1032.g2f8565e1d1-goog


