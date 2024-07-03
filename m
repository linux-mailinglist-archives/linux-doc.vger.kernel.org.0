Return-Path: <linux-doc+bounces-19985-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C39257D8
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jul 2024 12:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EB1928D62C
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jul 2024 10:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32A3142629;
	Wed,  3 Jul 2024 10:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLvqQT6N"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA3417741;
	Wed,  3 Jul 2024 10:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720001200; cv=none; b=W2/lE4XaxRpSErBomR4GPdqHbFvXo7ZxOmNtuyPuJtEoBP2VrOCkcCbqOOdhmMRqQgc10andxi/zUECoHZmAOrA51KsCH4Rh9XrbU4QqPa+hKK/DykcMkzE+g0Je4c6sqq4o6LdBIpY/w+a7F5hu2QKKWFIrqtIGFjgQGd+2E2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720001200; c=relaxed/simple;
	bh=+9uLGhO2nA/u4DYx/nC1szVU+6fu/INfo+jo2Nez2Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWIvgz4BQSC+7wAs4oJ/ybrJIL7zUXMsynyqYRbysh3wrxfHjcHpOy8SnQhMQ55Is1sBjrYM3zwDz5/5q6WaWf87PGNcXKgI2uFyUeLUaEkgiTGT3fvbLEspaYjWDjR5ny0P4+JuBo0b5/NJmUCACSQDN4bZWdUqADF/VCnBy9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLvqQT6N; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720001199; x=1751537199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+9uLGhO2nA/u4DYx/nC1szVU+6fu/INfo+jo2Nez2Wg=;
  b=QLvqQT6NJm6kQfJVTX9Pggu2P73mWAvbz2TvDbbnDvLZrisACMQ3OrmP
   0/p63AamHihQl6joshFyGvx3/TwH/hK7sx4r6rfJV/qaKdO2M3Bt4/kpm
   HO969C2008eadN/MWlHh+4gASr/p6xDCiaPhXoJszz5ftnzrEnzhTEDIc
   6zeoF0umnQnaS7wr3++vhYIrCrXzIzkgRj5/v5251t1qewuSQ+5jT5G8x
   ED+qtTxR+vEBK35D/2tPH+hMmRRqnUxzS/2rdM79DNIsjQLHdRRhXXRBj
   vdUon4C3v/WDq/MRbrE3Q+ZK817G48ueNDn2PXjF82SkZiG7i6aB+sm1K
   A==;
X-CSE-ConnectionGUID: BedvBbiJTyOHKkr4/P73Ow==
X-CSE-MsgGUID: N4uk7JVySLicFMP5407w4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21093779"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="21093779"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 03:06:38 -0700
X-CSE-ConnectionGUID: k1kr0H5VTTK2Ycu2RYGmhQ==
X-CSE-MsgGUID: NulDsKBVRbKjwRapFu8qSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="69384979"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO tlindgre-MOBL1.intel.com) ([10.245.244.185])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 03:06:33 -0700
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-serial@vger.kernel.org,
	Tony Lindgren <tony.lindgren@linux.intel.com>,
	Dhruva Gole <d-gole@ti.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] printk: Add match_devname_and_update_preferred_console()
Date: Wed,  3 Jul 2024 13:06:08 +0300
Message-ID: <20240703100615.118762-2-tony.lindgren@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703100615.118762-1-tony.lindgren@linux.intel.com>
References: <20240703100615.118762-1-tony.lindgren@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's add match_devname_and_update_preferred_console() for driver
subsystems to call during init when the console is ready, and it's
character device name is known. For now, we use it only for the serial
layer to allow console=DEVNAME:0.0 style hardware based addressing for
consoles.

The earlier attempt on doing this caused a regression with the kernel
command line console order as it added calling __add_preferred_console()
again later on during init. A better approach was suggested by Petr where
we add the deferred console to the console_cmdline[] and update it later
on when the console is ready.

Suggested-by: Petr Mladek <pmladek@suse.com>
Co-developed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Tony Lindgren <tony.lindgren@linux.intel.com>
---
 include/linux/printk.h          |   4 ++
 kernel/printk/console_cmdline.h |   1 +
 kernel/printk/printk.c          | 103 +++++++++++++++++++++++++++-----
 3 files changed, 93 insertions(+), 15 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 65c5184470f1..7239976698e4 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -60,6 +60,10 @@ static inline const char *printk_skip_headers(const char *buffer)
 #define CONSOLE_LOGLEVEL_DEFAULT CONFIG_CONSOLE_LOGLEVEL_DEFAULT
 #define CONSOLE_LOGLEVEL_QUIET	 CONFIG_CONSOLE_LOGLEVEL_QUIET
 
+int match_devname_and_update_preferred_console(const char *match,
+					       const char *name,
+					       const short idx);
+
 extern int console_printk[];
 
 #define console_loglevel (console_printk[0])
diff --git a/kernel/printk/console_cmdline.h b/kernel/printk/console_cmdline.h
index 3ca74ad391d6..0ab573b6d4dc 100644
--- a/kernel/printk/console_cmdline.h
+++ b/kernel/printk/console_cmdline.h
@@ -6,6 +6,7 @@ struct console_cmdline
 {
 	char	name[16];			/* Name of the driver	    */
 	int	index;				/* Minor dev. to use	    */
+	char	devname[32];			/* DEVNAME:0.0 style device name */
 	bool	user_specified;			/* Specified by command line vs. platform */
 	char	*options;			/* Options for the driver   */
 #ifdef CONFIG_A11Y_BRAILLE_CONSOLE
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index dddb15f48d59..7d91593f0ecf 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2429,18 +2429,23 @@ static void set_user_specified(struct console_cmdline *c, bool user_specified)
 	console_set_on_cmdline = 1;
 }
 
-static int __add_preferred_console(const char *name, const short idx, char *options,
+static int __add_preferred_console(const char *name, const short idx,
+				   const char *devname, char *options,
 				   char *brl_options, bool user_specified)
 {
 	struct console_cmdline *c;
 	int i;
 
+	if (!name && !devname)
+		return -EINVAL;
+
 	/*
 	 * We use a signed short index for struct console for device drivers to
 	 * indicate a not yet assigned index or port. However, a negative index
-	 * value is not valid for preferred console.
+	 * value is not valid when the console name and index are defined on
+	 * the command line.
 	 */
-	if (idx < 0)
+	if (name && idx < 0)
 		return -EINVAL;
 
 	/*
@@ -2448,9 +2453,10 @@ static int __add_preferred_console(const char *name, const short idx, char *opti
 	 *	if we have a slot free.
 	 */
 	for (i = 0, c = console_cmdline;
-	     i < MAX_CMDLINECONSOLES && c->name[0];
+	     i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
 	     i++, c++) {
-		if (strcmp(c->name, name) == 0 && c->index == idx) {
+		if ((name && strcmp(c->name, name) == 0 && c->index == idx) ||
+		    (devname && strcmp(c->devname, devname) == 0)) {
 			if (!brl_options)
 				preferred_console = i;
 			set_user_specified(c, user_specified);
@@ -2461,7 +2467,10 @@ static int __add_preferred_console(const char *name, const short idx, char *opti
 		return -E2BIG;
 	if (!brl_options)
 		preferred_console = i;
-	strscpy(c->name, name, sizeof(c->name));
+	if (name)
+		strscpy(c->name, name);
+	if (devname)
+		strscpy(c->devname, devname);
 	c->options = options;
 	set_user_specified(c, user_specified);
 	braille_set_options(c, brl_options);
@@ -2486,8 +2495,13 @@ __setup("console_msg_format=", console_msg_format_setup);
  */
 static int __init console_setup(char *str)
 {
-	char buf[sizeof(console_cmdline[0].name) + 4]; /* 4 for "ttyS" */
-	char *s, *options, *brl_options = NULL;
+	static_assert(sizeof(console_cmdline[0].devname) >= sizeof(console_cmdline[0].name) + 4);
+	char buf[sizeof(console_cmdline[0].devname)];
+	char *brl_options = NULL;
+	char *ttyname = NULL;
+	char *devname = NULL;
+	char *options;
+	char *s;
 	int idx;
 
 	/*
@@ -2496,17 +2510,23 @@ static int __init console_setup(char *str)
 	 * for exactly this purpose.
 	 */
 	if (str[0] == 0 || strcmp(str, "null") == 0) {
-		__add_preferred_console("ttynull", 0, NULL, NULL, true);
+		__add_preferred_console("ttynull", 0, NULL, NULL, NULL, true);
 		return 1;
 	}
 
 	if (_braille_console_setup(&str, &brl_options))
 		return 1;
 
+	/* For a DEVNAME:0.0 style console the character device is unknown early */
+	if (strchr(str, ':'))
+		devname = buf;
+	else
+		ttyname = buf;
+
 	/*
 	 * Decode str into name, index, options.
 	 */
-	if (isdigit(str[0]))
+	if (ttyname && isdigit(str[0]))
 		scnprintf(buf, sizeof(buf), "ttyS%s", str);
 	else
 		strscpy(buf, str);
@@ -2523,12 +2543,18 @@ static int __init console_setup(char *str)
 #endif
 
 	for (s = buf; *s; s++)
-		if (isdigit(*s) || *s == ',')
+		if ((ttyname && isdigit(*s)) || *s == ',')
 			break;
-	idx = simple_strtoul(s, NULL, 10);
+
+	/* @idx will get defined when devname matches. */
+	if (devname)
+		idx = -1;
+	else
+		idx = simple_strtoul(s, NULL, 10);
+
 	*s = 0;
 
-	__add_preferred_console(buf, idx, options, brl_options, true);
+	__add_preferred_console(ttyname, idx, devname, options, brl_options, true);
 	return 1;
 }
 __setup("console=", console_setup);
@@ -2548,7 +2574,51 @@ __setup("console=", console_setup);
  */
 int add_preferred_console(const char *name, const short idx, char *options)
 {
-	return __add_preferred_console(name, idx, options, NULL, false);
+	return __add_preferred_console(name, idx, NULL, options, NULL, false);
+}
+
+/**
+ * match_devname_and_update_preferred_console - Update a preferred console
+ *	when matching devname is found.
+ * @devname: DEVNAME:0.0 style device name
+ * @name: Name of the corresponding console driver, e.g. "ttyS"
+ * @idx: Console index, e.g. port number.
+ *
+ * The function checks whether a device with the given @devname is
+ * preferred via the console=DEVNAME:0.0 command line option.
+ * It fills the missing console driver name and console index
+ * so that a later register_console() call could find (match)
+ * and enable this device.
+ *
+ * It might be used when a driver subsystem initializes particular
+ * devices with already known DEVNAME:0.0 style names. And it
+ * could predict which console driver name and index this device
+ * would later get associated with.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int match_devname_and_update_preferred_console(const char *devname,
+					       const char *name,
+					       const short idx)
+{
+	struct console_cmdline *c = console_cmdline;
+	int i;
+
+	if (!devname || !strlen(devname) || !name || !strlen(name) || idx < 0)
+		return -EINVAL;
+
+	for (i = 0; i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
+	     i++, c++) {
+		if (!strcmp(devname, c->devname)) {
+			pr_info("associate the preferred console \"%s\" with \"%s%d\"\n",
+				devname, name, idx);
+			strscpy(c->name, name);
+			c->index = idx;
+			return 0;
+		}
+	}
+
+	return -ENOENT;
 }
 
 bool console_suspend_enabled = true;
@@ -3318,8 +3388,11 @@ static int try_enable_preferred_console(struct console *newcon,
 	int i, err;
 
 	for (i = 0, c = console_cmdline;
-	     i < MAX_CMDLINECONSOLES && c->name[0];
+	     i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
 	     i++, c++) {
+		/* Console not yet initialized? */
+		if (!c->name[0])
+			continue;
 		if (c->user_specified != user_specified)
 			continue;
 		if (!newcon->match ||
-- 
2.45.2


