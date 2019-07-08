Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62AD262AC3
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2019 23:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405278AbfGHVPg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Jul 2019 17:15:36 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38666 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405287AbfGHVPg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jul 2019 17:15:36 -0400
Received: by mail-qt1-f194.google.com with SMTP id n11so19507026qtl.5
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2019 14:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vxweX2U2+Z856CcsxOG088urab10u3d6VzbrdBwUe6o=;
        b=XkNfo7Ng1869ovdwpudNrw0wlKf9MA92JwTYiEJph+VGQaPDhIC8ozhsHnT3ZFniLu
         xX5baRnstpeEOucyVITA9Xz9gppuLf27+QYgMNoyyfvQQhbQm0IkYXSD4wudfvFtmWdc
         ft6PJVK9OseR8BeKy0amPm4xmQjutbUoow+0G2TPi/J3Zv8+jT9lkM9bUP73Sk0FgLFe
         Zo2AHEwA/8MQzVRxCMMmTV55f20IHgKxNhU3CGLLk4SdrOP78pSafOWNNt8ATwroaJWg
         DKiMOy0AoBI25TfdY+Ua4a0SXfP583XcfX5hcBjYLwNKKBDiq2qpD/Jk0nTyIcH5vILI
         mg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vxweX2U2+Z856CcsxOG088urab10u3d6VzbrdBwUe6o=;
        b=dcwKacwMmEEVK5gmG2Y9ndng5j6ZcwfA0tSHReXaeW6+HuFJp5XEOJ2c84l49f/qSL
         quNHmbSwPlkH4lATeCWQboHHgzCP1HbIna68yyLEc9jdDfa7V+HDd2vowHGFQ2/7REG3
         3nzOsQO/3MkkiD5V0IZba1wDaJ0dju6me4QSQrVkQmSGckpGzTnYX8AhxxkxnI+wix6p
         2jtdmgJFfj/pf/Q1k10M9AGucxg+2ySEYUKh5kNG/gNzvYMDXLkyv2R2fYUgQoOyqp2H
         UU5y5iv9btbyOCIc/YQZljI0AB/A1LVRDo098gnnApawQYUXMn3eUIDAV26Oy/8R3MZX
         i/0Q==
X-Gm-Message-State: APjAAAWqgiJKKcucMrnpjOPXqvc9w4EQPBM6/M2ZuJi5X2o6jExzCsT3
        ut6GoJ1m/tOE3SOrUPwRu+tYMA==
X-Google-Smtp-Source: APXvYqzOynfC/xBCJVtVyeRdCM0qBpL/RmjpG/GqV9GNhFtfJLujygjgPzG6SCWKgrGRU8fAmuANkw==
X-Received: by 2002:ac8:368a:: with SMTP id a10mr15795831qtc.143.1562620535026;
        Mon, 08 Jul 2019 14:15:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id b67sm8335620qkd.82.2019.07.08.14.15.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 14:15:34 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [v1 3/5] kexec: export common crashkernel/kexeckernel parser
Date:   Mon,  8 Jul 2019 17:15:26 -0400
Message-Id: <20190708211528.12392-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190708211528.12392-1-pasha.tatashin@soleen.com>
References: <20190708211528.12392-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To reserve memory for normal kexec reboot, the new parameter:
kexeckernel=size[KMG][@offset[KMG]] is used. Its syntax is the
same as craskernel=, therefore they can use the same function to
parse parameter settings.

Rename: __parse_crashkernel() to parse_crash_or_kexec_kernel(), and
make it public.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 .../admin-guide/kernel-parameters.txt         |  7 +++++
 include/linux/crash_core.h                    |  6 +++++
 kernel/crash_core.c                           | 27 ++++++++++---------
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5c7a0f5b0a2f..0f5ce665c7f5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -739,6 +739,13 @@
 			It will be ignored when crashkernel=X,high is not used
 			or memory reserved is below 4G.
 
+	kexeckernel=size[KMG][@offset[KMG]]
+			[KNL] Using kexec, Linux can reboot to a new kernel.
+			This parameter reserves the physical memory region
+			[offset, offset + size] for that kernel. If '@offset' is
+			omitted, then a suitable offset is selected
+			automatically.
+
 	cryptomgr.notests
 			[KNL] Disable crypto self-tests
 
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 525510a9f965..e90789ff0bec 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -74,5 +74,11 @@ int parse_crashkernel_high(char *cmdline, unsigned long long system_ram,
 		unsigned long long *crash_size, unsigned long long *crash_base);
 int parse_crashkernel_low(char *cmdline, unsigned long long system_ram,
 		unsigned long long *crash_size, unsigned long long *crash_base);
+int parse_crash_or_kexec_kernel(char *cmdline,
+				unsigned long long system_ram,
+				unsigned long long *crash_size,
+				unsigned long long *crash_base,
+				const char *name,
+				const char *suffix);
 
 #endif /* LINUX_CRASH_CORE_H */
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 9f1557b98468..11e0f9837a32 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -224,12 +224,12 @@ static __init char *get_last_crashkernel(char *cmdline,
 	return ck_cmdline;
 }
 
-static int __init __parse_crashkernel(char *cmdline,
-			     unsigned long long system_ram,
-			     unsigned long long *crash_size,
-			     unsigned long long *crash_base,
-			     const char *name,
-			     const char *suffix)
+int __init parse_crash_or_kexec_kernel(char *cmdline,
+				       unsigned long long system_ram,
+				       unsigned long long *crash_size,
+				       unsigned long long *crash_base,
+				       const char *name,
+				       const char *suffix)
 {
 	char	*first_colon, *first_space;
 	char	*ck_cmdline;
@@ -270,8 +270,9 @@ int __init parse_crashkernel(char *cmdline,
 			     unsigned long long *crash_size,
 			     unsigned long long *crash_base)
 {
-	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
-					"crashkernel=", NULL);
+	return parse_crash_or_kexec_kernel(cmdline, system_ram, crash_size,
+					   crash_base, "crashkernel=",
+					   NULL);
 }
 
 int __init parse_crashkernel_high(char *cmdline,
@@ -279,8 +280,9 @@ int __init parse_crashkernel_high(char *cmdline,
 			     unsigned long long *crash_size,
 			     unsigned long long *crash_base)
 {
-	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
-				"crashkernel=", suffix_tbl[SUFFIX_HIGH]);
+	return parse_crash_or_kexec_kernel(cmdline, system_ram, crash_size,
+					   crash_base, "crashkernel=",
+					   suffix_tbl[SUFFIX_HIGH]);
 }
 
 int __init parse_crashkernel_low(char *cmdline,
@@ -288,8 +290,9 @@ int __init parse_crashkernel_low(char *cmdline,
 			     unsigned long long *crash_size,
 			     unsigned long long *crash_base)
 {
-	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
-				"crashkernel=", suffix_tbl[SUFFIX_LOW]);
+	return parse_crash_or_kexec_kernel(cmdline, system_ram, crash_size,
+					   crash_base, "crashkernel=",
+					   suffix_tbl[SUFFIX_LOW]);
 }
 
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
-- 
2.22.0

