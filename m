Return-Path: <linux-doc+bounces-91281-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id em8wNh8mJmotSwIAu9opvQ
	(envelope-from <linux-doc+bounces-91281-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 04:17:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76A652323
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 04:17:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l8SywiJ0;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91281-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91281-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76C1E3028B29
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 02:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14759309F09;
	Mon,  8 Jun 2026 02:16:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4122576E;
	Mon,  8 Jun 2026 02:16:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780884968; cv=none; b=Ea1ubQcugF6nXskhq3uTNILSxAXBJO1xxEPO/Y6zC/MCIXQgTDpWNa7lI4DEqDN9NVHlwcVN2SRW5mU2F6zi2hYp0c2tsSGo42igIAAc/UdSMiKRu5yYcFvIk3XRgAA4YtenFDMqxWdC/pHhooE3AzteWGCsgVbUuH6pf4X6R50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780884968; c=relaxed/simple;
	bh=V40FzwuJ4auWfOPOTLCRLRlOJYDi214a7nSsjHUBmqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m6+2bxrM3bcVbnqLGEvgavdO297EkSN1FaitD1BejdEQzk+VjsPbaDhglSTT4CbWSzxvwhkcwur4Uni8A2bqxwltR/blKmf04SVendct27Khfq9Mr9Rk7wwZlOz6p25xkOpNvFCR+EY53QxzSQsiyqQrtJqJDZbt5LrIbFfNcqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8SywiJ0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314401F00898;
	Mon,  8 Jun 2026 02:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780884966;
	bh=wrCZkdcsWyfEfNrxi0taPAzIJ7QBcBW5AHiMFmIBp1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l8SywiJ0uDmt3SGupxi8m70XWD2tMqh+gOK+l5wnyZaDmRmceJUxLuM4c8QKW6M7P
	 vgMV2+PeG+NOpMvwm2UfDqM+brPclOiC5MIaIgPCR7bgxbPwIQrOf73MUfH/NzMieq
	 AZCDApVz8AcjZ4oqK0O3H1KBX+apv7th4fGLcKpzh/WevyfR9e7/BsOBLI4+RLE4Ym
	 Ka2P77/8bjPi2AHm5o9OkULGGW//Gw7qOb0mn6hSFC9Isynxhh5sBbcBqMNPrhO712
	 QDS12rkZMlJWqsV1i4slRwj5zr5WzbbVdj5EKAs5G8+m48ThQJqlvCbNDI3e2Bed7B
	 5xlYVbmIpObIQ==
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
Subject: [PATCH v3 2/3] PM: dpm_watchdog: Allow disabling DPM watchdog by default
Date: Mon,  8 Jun 2026 02:15:25 +0000
Message-ID: <20260608021526.1023248-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260608021526.1023248-1-tzungbi@kernel.org>
References: <20260608021526.1023248-1-tzungbi@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-91281-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A76A652323

Introduce the CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED Kconfig option to
allow the device suspend/resume watchdog (DPM watchdog) to be disabled
by default at compile time.

Additionally, introduce the "dpm_watchdog_enabled" module parameter to
allow the watchdog to be enabled or disabled at boot time (via
"power.dpm_watchdog_enabled") and at runtime (via sysfs).

This provides flexibility for systems that want the watchdog code
compiled in but inactive by default, allowing it to be enabled only when
needed.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v3:
- Add "PM" tag (was missing).
- Update the format and specify dependencies in kernel-parameters.txt.
- Update the help message in Kconfig to reflect that dpm_watchdog_enabled
  can be set at runtime as well.

v2: https://lore.kernel.org/all/20260604090756.2884671-3-tzungbi@kernel.org
- Use module parameter and bool for dpm_watchdog_enabled.
- Use IS_ENABLED().

v1: https://lore.kernel.org/all/20260528103215.505795-1-tzungbi@kernel.org

 Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
 drivers/base/power/main.c                       | 11 +++++++++++
 kernel/power/Kconfig                            | 10 ++++++++++
 3 files changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 00375193bd26..f2620764c28e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -47,6 +47,7 @@
 	PCI	PCI bus support is enabled.
 	PCIE	PCI Express support is enabled.
 	PCMCIA	The PCMCIA subsystem is enabled.
+	PM	Power Management support is enabled.
 	PNP	Plug & Play support is enabled.
 	PPC	PowerPC architecture is enabled.
 	PPT	Parallel port support is enabled.
@@ -5399,6 +5400,13 @@ Kernel parameters
 			function to NULL. On Idle the CPU just reduces
 			execution priority.
 
+	power.dpm_watchdog_enabled=
+			[PM] Enable or disable the device suspend/resume
+			watchdog (DPM watchdog).  Requires CONFIG_PM_SLEEP and
+			CONFIG_DPM_WATCHDOG enabled.
+			Format: <bool>
+			Default value is set by CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED.
+
 	ppc_strict_facility_enable
 			[PPC,ENABLE] This option catches any kernel floating point,
 			Altivec, VSX and SPE outside of regions specifically
diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index cd864f3a2799..7822c29b7c8d 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -534,6 +534,11 @@ module_param(dpm_watchdog_all_cpu_backtrace, bool, 0644);
 MODULE_PARM_DESC(dpm_watchdog_all_cpu_backtrace,
 		 "Backtrace all CPUs on DPM watchdog timeout");
 
+static bool __read_mostly dpm_watchdog_enabled =
+				IS_ENABLED(CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED);
+module_param(dpm_watchdog_enabled, bool, 0644);
+MODULE_PARM_DESC(dpm_watchdog_enabled, "Enable DPM watchdog");
+
 /**
  * dpm_watchdog_handler - Driver suspend / resume watchdog handler.
  * @t: The timer that PM watchdog depends on.
@@ -577,6 +582,9 @@ static void dpm_watchdog_set(struct dpm_watchdog *wd, struct device *dev)
 {
 	struct timer_list *timer = &wd->timer;
 
+	if (!dpm_watchdog_enabled)
+		return;
+
 	wd->dev = dev;
 	wd->tsk = current;
 	wd->fatal = CONFIG_DPM_WATCHDOG_TIMEOUT == CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
@@ -595,6 +603,9 @@ static void dpm_watchdog_clear(struct dpm_watchdog *wd)
 {
 	struct timer_list *timer = &wd->timer;
 
+	if (!dpm_watchdog_enabled)
+		return;
+
 	timer_delete_sync(timer);
 	timer_destroy_on_stack(timer);
 }
diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index 530c897311d4..b16bd159074a 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -268,6 +268,16 @@ config DPM_WATCHDOG
 	  captured in pstore device for inspection in subsequent
 	  boot session.
 
+config DPM_WATCHDOG_DEFAULT_ENABLED
+	bool "Enable DPM watchdog by default"
+	depends on DPM_WATCHDOG
+	default y
+	help
+	  If you say Y here, the DPM watchdog will be enabled by default.
+	  If you say N, it will be compiled in but disabled.  It can be
+	  enabled at boot time via the "power.dpm_watchdog_enabled" kernel
+	  parameter or at runtime via sysfs.
+
 config DPM_WATCHDOG_TIMEOUT
 	int "Watchdog timeout to panic in seconds"
 	range 1 120
-- 
2.54.0.1099.g489fc7bff1-goog


