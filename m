Return-Path: <linux-doc+bounces-90904-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eeqADgBDIWqnCAEAu9opvQ
	(envelope-from <linux-doc+bounces-90904-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 11:18:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A963E753
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 11:18:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="WlbTav/o";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90904-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90904-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84D1E3066A8D
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 09:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EE03FFACE;
	Thu,  4 Jun 2026 09:08:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD133FF8B1;
	Thu,  4 Jun 2026 09:08:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564126; cv=none; b=SNgtbEA3jFYJ97AK/RPqNDH7BlJJI+/OqFFpJrdmDfF7EKDQRTHFQo5VUP0TmCXAXBu4w866Gw69ZOq7Ep/OjLzTzXHGaQKqdJCeb7AW6nPruee8XfUcQ5ydeMQfdYC3VOKoSW3DasItqNTH9P3vqHOQJII1GdW8KCKaoZlx0zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564126; c=relaxed/simple;
	bh=1NKFWL2NyVxy6Y6uj2DWwKX9cpfJCoivyYZ47AVpgy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hb8kLtZtruqjVjsDr+HoYuZZwDXteGKnDzK8XexJCKfR8KHXBrqAwYncmqjFbcjzKiqEPmUNAuhuHUnQlVtInLqWiXbudesH4hg7++zitNemY102J6zO3kxxo9pABNGkigyqCA9CLDL16MxLmEJYsNIlYpnguPNY11U19wBKfQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlbTav/o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B3E1F00893;
	Thu,  4 Jun 2026 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780564124;
	bh=FFTwwbkj61o3Y4O9YgiQkwjXl0EBdIaAq8zyegWIOt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WlbTav/oWR3Y6aYPEt4Qkua8cgeLxpxCofHpp0/VCk4Mu3Ti1qSSVqYcRiiiyH5GR
	 kifiWrEfos9iX0eWHig4g7ftPzd+m5vKCK0KFl5OnlXvArAa1k8wx/uGtgj+b8CD5j
	 EWAOZnK53Caq2YtDg3J5Qs/xLW+gQLwizq9u8V13ZqO+Q68HYBBmsO5ByCG4iJRQgY
	 ysrBRtELNJ7OfuMz20M8gqIrAPm8KwMymXQodg/J7X+PY6exO2IhCahac/1RJj7TFQ
	 tSd5oX5njjpTWy/U7eroVnGNU8dn79xZZDWQiWUE6YL9cK9IyrOLM+eYWMAX9GSG+J
	 fstaaD04OwYZw==
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
Subject: [PATCH v2 3/3] PM: dpm_watchdog: Add sysctl interface for DPM watchdog timeouts
Date: Thu,  4 Jun 2026 09:07:51 +0000
Message-ID: <20260604090756.2884671-4-tzungbi@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90904-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ctl.data:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 893A963E753

Introduce sysctl knobs to allow configuring DPM watchdog timeouts at
runtime.

Currently, these timeouts are fixed at compile time via
CONFIG_DPM_WATCHDOG_TIMEOUT and CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT.
This limits flexibility if the timeouts need to be adjusted for
different testing scenarios or hardware behaviors without rebuilding
the kernel.

Add the following sysctl files under /proc/sys/kernel/:
- dpm_watchdog_timeout_secs: The total timeout before panic. The
  maximum value is capped at CONFIG_DPM_WATCHDOG_TIMEOUT to prevent
  unreasonably large timeouts.
- dpm_watchdog_warning_timeout_secs: The warning timeout. The maximum
  value is capped at the current dpm_watchdog_timeout_secs.
Both sysctls have a minimum value of 1.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- New to the series.

v1: Doesn't exist.

 drivers/base/power/main.c | 61 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 7822c29b7c8d..c1a4b30fafb2 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -28,6 +28,7 @@
 #include <linux/interrupt.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
+#include <linux/sysctl.h>
 #include <linux/async.h>
 #include <linux/suspend.h>
 #include <trace/events/power.h>
@@ -539,6 +540,58 @@ static bool __read_mostly dpm_watchdog_enabled =
 module_param(dpm_watchdog_enabled, bool, 0644);
 MODULE_PARM_DESC(dpm_watchdog_enabled, "Enable DPM watchdog");
 
+static unsigned int __read_mostly dpm_watchdog_timeout = CONFIG_DPM_WATCHDOG_TIMEOUT;
+static unsigned int __read_mostly dpm_watchdog_warning_timeout =
+						CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
+static const unsigned int dpm_watchdog_timeout_max = CONFIG_DPM_WATCHDOG_TIMEOUT;
+
+static int proc_dodpm_watchdog_timeout_secs(const struct ctl_table *table,
+					    int write, void *buffer,
+					    size_t *lenp, loff_t *ppos)
+{
+	struct ctl_table ctl = *table;
+	unsigned int val = dpm_watchdog_timeout;
+	int ret;
+
+	ctl.data = &val;
+	ret = proc_douintvec_minmax(&ctl, write, buffer, lenp, ppos);
+	if (ret || !write)
+		return ret;
+
+	if (val < dpm_watchdog_warning_timeout)
+		dpm_watchdog_warning_timeout = val;
+	dpm_watchdog_timeout = val;
+
+	return 0;
+}
+
+static const struct ctl_table dpm_watchdog_sysctls[] = {
+	{
+		.procname	= "dpm_watchdog_timeout_secs",
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= proc_dodpm_watchdog_timeout_secs,
+		.extra1		= SYSCTL_ONE,
+		.extra2		= (void *)&dpm_watchdog_timeout_max,
+	},
+	{
+		.procname	= "dpm_watchdog_warning_timeout_secs",
+		.data		= &dpm_watchdog_warning_timeout,
+		.maxlen		= sizeof(unsigned int),
+		.mode		= 0644,
+		.proc_handler	= proc_douintvec_minmax,
+		.extra1		= SYSCTL_ONE,
+		.extra2		= (void *)&dpm_watchdog_timeout,
+	},
+};
+
+static int __init dpm_watchdog_sysctl_init(void)
+{
+	register_sysctl_init("kernel", dpm_watchdog_sysctls);
+	return 0;
+}
+subsys_initcall(dpm_watchdog_sysctl_init);
+
 /**
  * dpm_watchdog_handler - Driver suspend / resume watchdog handler.
  * @t: The timer that PM watchdog depends on.
@@ -564,9 +617,9 @@ static void dpm_watchdog_handler(struct timer_list *t)
 			dev_driver_string(wd->dev), dev_name(wd->dev));
 	}
 
-	time_left = CONFIG_DPM_WATCHDOG_TIMEOUT - CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
+	time_left = dpm_watchdog_timeout - dpm_watchdog_warning_timeout;
 	dev_warn(wd->dev, "**** DPM device timeout after %u seconds; %u seconds until panic ****\n",
-		 CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT, time_left);
+		 dpm_watchdog_warning_timeout, time_left);
 	show_stack(wd->tsk, NULL, KERN_WARNING);
 
 	wd->fatal = true;
@@ -587,11 +640,11 @@ static void dpm_watchdog_set(struct dpm_watchdog *wd, struct device *dev)
 
 	wd->dev = dev;
 	wd->tsk = current;
-	wd->fatal = CONFIG_DPM_WATCHDOG_TIMEOUT == CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
+	wd->fatal = dpm_watchdog_timeout == dpm_watchdog_warning_timeout;
 
 	timer_setup_on_stack(timer, dpm_watchdog_handler, 0);
 	/* use same timeout value for both suspend and resume */
-	timer->expires = jiffies + HZ * CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
+	timer->expires = jiffies + HZ * dpm_watchdog_warning_timeout;
 	add_timer(timer);
 }
 
-- 
2.54.0.1032.g2f8565e1d1-goog


