Return-Path: <linux-doc+bounces-2374-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1377EB32F
	for <lists+linux-doc@lfdr.de>; Tue, 14 Nov 2023 16:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 272F41C2086F
	for <lists+linux-doc@lfdr.de>; Tue, 14 Nov 2023 15:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A610D41228;
	Tue, 14 Nov 2023 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E941227
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 15:13:01 +0000 (UTC)
Received: from harvie.cz (harvie.cz [77.87.242.242])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id AFABBC3;
	Tue, 14 Nov 2023 07:13:00 -0800 (PST)
Received: from anemophobia.amit.cz (unknown [31.30.84.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by harvie.cz (Postfix) with ESMTPSA id B5E7F180282;
	Tue, 14 Nov 2023 16:12:58 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: tomas.mudrunka@gmail.com
Cc: corbet@lwn.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v6] /proc/sysrq-trigger: accept multiple keys at once
Date: Tue, 14 Nov 2023 16:12:52 +0100
Message-ID: <20231114151252.117575-1-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114124152.97010-1-tomas.mudrunka@gmail.com>
References: <20231114124152.97010-1-tomas.mudrunka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just for convenience.
This way we can do:
`echo _reisub > /proc/sysrq-trigger`
Instead of:
`for i in r e i s u b; do echo "$i" > /proc/sysrq-trigger; done;`

This can be very useful when trying to execute sysrq combo remotely
or from userspace. When sending keys in multiple separate writes,
userspace can be killed before whole combo is completed.
Therefore putting all keys in single write is more robust approach.

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
V5 -> V6: Documentation now has notice about undefined behavior
V4 -> V5: Added this list of changes
V3 -> V4: Bulk is now bool instead of char (and fixed typo)
V2 -> V3: Fixed code styling (and introduced typo)
V1 -> V2: Bulk mode only activated by underscore now, added docs

 Documentation/admin-guide/sysrq.rst | 11 ++++++++++-
 drivers/tty/sysrq.c                 | 17 ++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
index 51906e473..e7a82cba7 100644
--- a/Documentation/admin-guide/sysrq.rst
+++ b/Documentation/admin-guide/sysrq.rst
@@ -75,10 +75,19 @@ On other
 	submit a patch to be included in this section.
 
 On all
-	Write a character to /proc/sysrq-trigger.  e.g.::
+	Write single character to /proc/sysrq-trigger.
+	Only first character is interpreted, rest of string is ignored.
+	However it is not reccomended to write any extra characters
+	as the behavior is undefined and might change in the future versions.
+	e.g.::
 
 		echo t > /proc/sysrq-trigger
 
+	Alternatively write multiple keys combo prepended by underscore.
+	All characters are interpreted this way. e.g.::
+
+		echo _reisub > /proc/sysrq-trigger
+
 The :kbd:`<command key>` is case sensitive.
 
 What are the 'command' keys?
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 6b4a28bcf..ad07bc812 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -1150,16 +1150,27 @@ EXPORT_SYMBOL(unregister_sysrq_key);
 #ifdef CONFIG_PROC_FS
 /*
  * writing 'C' to /proc/sysrq-trigger is like sysrq-C
+ * If first character in write is underscore, all characters are interpreted.
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

