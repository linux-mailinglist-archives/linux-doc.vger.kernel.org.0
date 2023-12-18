Return-Path: <linux-doc+bounces-5454-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DB5816D09
	for <lists+linux-doc@lfdr.de>; Mon, 18 Dec 2023 12:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 569A3283241
	for <lists+linux-doc@lfdr.de>; Mon, 18 Dec 2023 11:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF82199CA;
	Mon, 18 Dec 2023 11:42:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from harvie.cz (harvie.cz [77.87.242.242])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C9A208B5;
	Mon, 18 Dec 2023 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from anemophobia.amit.cz (unknown [31.30.84.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by harvie.cz (Postfix) with ESMTPSA id 18BC01801AE;
	Mon, 18 Dec 2023 12:42:40 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] /proc/sysrq-trigger can now pause processing for one second
Date: Mon, 18 Dec 2023 12:42:20 +0100
Message-ID: <20231218114222.283705-1-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Writing ',' to /proc/sysrq-trigger now causes processing to
pause for one second.

This is useful, because recently accepted patch allows
to write multiple keys at once to /proc/sysrq-trigger.
But it might be desirable to add slight delay between actions.

Eg. between (e)TERM and (i)KILL it makes sense to put slight delay,
so processes have chance to run TERM handlers before being KILLed.

Now we can send TERM, wait for two seconds and KILL like this:

echo _e,,i > /proc/sysrq-trigger

Originaly i've tested doing this as handler registered in
sysrq_key_table[], but that would cause delay to occur while
holding sysrq rcu lock in __handle_sysrq(), therefore i've decided
to implement this in write_sysrq_trigger() instead to allow
proper use of msleep() instead of mdelay() in locked context.

This means it will only be possible to invoke the delay using
/proc/sysrq-trigger, but there is little point in doing that
interactively using keyboard anyway.

Depends-on: /proc/sysrq-trigger: accept multiple keys at once

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
 Documentation/admin-guide/sysrq.rst |  2 ++
 drivers/tty/sysrq.c                 | 16 ++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 2f2e5bd44..b798a2695 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -161,6 +161,8 @@ Command	    Function
             will be printed to your console. (``0``, for example would make
             it so that only emergency messages like PANICs or OOPSes would
             make it to your console.)
+
+``,``	    Wait for one second (only for use with /proc/sysrq-trigger batch)
 =========== ===================================================================
 
 Okay, so what can I use them for?
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 02217e3c9..a19ce0865 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -51,6 +51,7 @@
 #include <linux/syscalls.h>
 #include <linux/of.h>
 #include <linux/rcupdate.h>
+#include <linux/delay.h>
 
 #include <asm/ptrace.h>
 #include <asm/irq_regs.h>
@@ -1166,10 +1167,21 @@ static ssize_t write_sysrq_trigger(struct file *file, const char __user *buf,
 		if (get_user(c, buf + i))
 			return -EFAULT;
 
-		if (c == '_')
+		switch (c) {
+
+		case '_':
 			bulk = true;
-		else
+			break;
+
+		case ',':
+			msleep(1000);
+			break;
+
+		default:
 			__handle_sysrq(c, false);
+			break;
+
+		}
 
 		if (!bulk)
 			break;
-- 
2.43.0


