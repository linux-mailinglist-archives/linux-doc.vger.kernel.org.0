Return-Path: <linux-doc+bounces-2678-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CFF7F117E
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 12:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AAE8B20DA5
	for <lists+linux-doc@lfdr.de>; Mon, 20 Nov 2023 11:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE08134A5;
	Mon, 20 Nov 2023 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from harvie.cz (harvie.cz [77.87.242.242])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id D73CB194;
	Mon, 20 Nov 2023 03:15:00 -0800 (PST)
Received: from anemophobia.amit.cz (unknown [31.30.84.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by harvie.cz (Postfix) with ESMTPSA id 1E01F18023E;
	Mon, 20 Nov 2023 12:14:58 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: jirislaby@kernel.org
Cc: corbet@lwn.net,
	gregkh@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rdunlap@infradead.org,
	tomas.mudrunka@gmail.com
Subject: [PATCH v10] /proc/sysrq-trigger: accept multiple keys at once
Date: Mon, 20 Nov 2023 12:14:51 +0100
Message-ID: <20231120111451.527952-1-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <ea2fd8b3-95cf-4d50-8fc7-f1391b23a433@kernel.org>
References: <ea2fd8b3-95cf-4d50-8fc7-f1391b23a433@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This way we can do:
`echo _reisub > /proc/sysrq-trigger`
Instead of:
`for i in r e i s u b; do echo "$i" > /proc/sysrq-trigger; done;`

This can be very useful when trying to execute sysrq combo remotely
or from userspace. When sending keys in multiple separate writes,
userspace (eg. bash or ssh) can be killed before whole combo is completed.
Therefore putting all keys in single write is more robust approach.

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
V9 -> V10: More english fixes
V8 -> V9: Fixed english bit more
V7 -> V8: Added this list of changes
V6 -> V7: Fixed english in documentation
V5 -> V6: Documentation now has notice about undefined behavior
V4 -> V5: Added this list of changes
V3 -> V4: Bulk is now bool instead of char (and fixed typo)
V2 -> V3: Fixed code styling (and introduced typo)
V1 -> V2: Bulk mode only activated by underscore now, added docs

 Documentation/admin-guide/sysrq.rst | 11 ++++++++++-
 drivers/tty/sysrq.c                 | 19 ++++++++++++++++---
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 51906e473..2f2e5bd44 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -75,10 +75,19 @@ On other
 	submit a patch to be included in this section.
 
 On all
-	Write a character to /proc/sysrq-trigger.  e.g.::
+	Write a single character to /proc/sysrq-trigger.
+	Only the first character is processed, the rest of the string is
+	ignored. However, it is not recommended to write any extra characters
+	as the behavior is undefined and might change in the future versions.
+	E.g.::
 
 		echo t > /proc/sysrq-trigger
 
+	Alternatively, write multiple characters prepended by underscore.
+	This way, all characters will be processed. E.g.::
+
+		echo _reisub > /proc/sysrq-trigger
+
 The :kbd:`<command key>` is case sensitive.
 
 What are the 'command' keys?
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 6b4a28bcf..02217e3c9 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -1150,16 +1150,29 @@ EXPORT_SYMBOL(unregister_sysrq_key);
 #ifdef CONFIG_PROC_FS
 /*
  * writing 'C' to /proc/sysrq-trigger is like sysrq-C
+ * Normally, only the first character written is processed.
+ * However, if the first character is an underscore,
+ * all characters are processed.
  */
 static ssize_t write_sysrq_trigger(struct file *file, const char __user *buf,
 				   size_t count, loff_t *ppos)
 {
-	if (count) {
+	bool bulk = false;
+	size_t i;
+
+	for (i = 0; i < count; i++) {
 		char c;
 
-		if (get_user(c, buf))
+		if (get_user(c, buf + i))
 			return -EFAULT;
-		__handle_sysrq(c, false);
+
+		if (c == '_')
+			bulk = true;
+		else
+			__handle_sysrq(c, false);
+
+		if (!bulk)
+			break;
 	}
 
 	return count;
-- 
2.42.1

