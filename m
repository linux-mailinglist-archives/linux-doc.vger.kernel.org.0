Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3A01C7C2F
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2020 23:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbgEFVQB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 May 2020 17:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729787AbgEFVPc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 May 2020 17:15:32 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EECC061A10
        for <linux-doc@vger.kernel.org>; Wed,  6 May 2020 14:15:31 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 18so1758966pfx.6
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2020 14:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sOeNB9LcGhN4fIyKgIhyr9C2Fp97SWGNqass42XeagE=;
        b=ZGHBnmoRWA47sVMPMpfEE3xpKwqW46dwJF7TirSqCbZ2wnFBxSIxep+nNk0hjnWMv3
         VYChVlgZYoyL6mWNVjI4oJXMHIHebQlskD7vG4WX0agEbxql04y4UlKcy7QmpFJzpTaP
         jrUIOU0VgL6sO/nSPEImXMnOARuCc9oLo/Yqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sOeNB9LcGhN4fIyKgIhyr9C2Fp97SWGNqass42XeagE=;
        b=MXUyL9sBoMUy20xqo8SwNdCnduTiDl/ei6tpr7Dgn8k9ybSjVg9frOLt44951Rnuii
         yp37TxqxrS23puBQXD7ufdyR7D/+n7FfK7SMsj/AhGYroQcq3tRNTbwDajUAjgk/HvwJ
         bnEoUP3Dhq/PL3DTkBNI1Yglr0rESnEAhK09aMpADrIZcDk2Y+e1NOV7MuL9kyqDaSDq
         dt3Mz4WT5jLLXvY5DT1vxfhQxWqDdMXWKtsqLJaFF5cqzPdq5kFkBedD3vord9gzY8aD
         jXZLc8SdRIvriiVpZ02rLOd4LF08xfN6Ojl0PZZVAMhvkfiIR/F9fTP+0JKLJozpHo7d
         bOvA==
X-Gm-Message-State: AGi0PuZb2/Q+t25QGxu2DLtyZod0BIzhnDdZOmA6wIUaUzN9xHcTwVBx
        T8iHRO5YB4WZe7AN5UI0E1gN2w==
X-Google-Smtp-Source: APiQypKmgRUjCOneWzG5vZX/d75RWcfnxHE34jEEkMp7R/IQkS1VfrFSyEBXsJX6qbQH+6arA4VbXQ==
X-Received: by 2002:a63:fd03:: with SMTP id d3mr8441436pgh.6.1588799731266;
        Wed, 06 May 2020 14:15:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y2sm2767640pfq.16.2020.05.06.14.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 14:15:29 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>, jmorris@namei.org,
        sashal@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/6] pstore/platform: Pass max_reason to kmesg dump
Date:   Wed,  6 May 2020 14:15:19 -0700
Message-Id: <20200506211523.15077-3-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506211523.15077-1-keescook@chromium.org>
References: <20200506211523.15077-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Pavel Tatashin <pasha.tatashin@soleen.com>

Add a new member to struct pstore_info for passing information about
kmesg dump maximum reason. This allows a finer control of what kmesg
dumps are sent to pstore storage backends.

Those backends that do not explicitly set this field (keeping it equal to
0), get the default behavior: store only Oopses and Panics, or everything
if the printk.always_kmsg_dump boot param is set.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Link: https://lore.kernel.org/r/20200505154510.93506-3-pasha.tatashin@soleen.com
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c   | 4 +++-
 include/linux/pstore.h | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 6fb526187953..3a3906173534 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -606,8 +606,10 @@ int pstore_register(struct pstore_info *psi)
 
 	pstore_get_records(0);
 
-	if (psi->flags & PSTORE_FLAGS_DMESG)
+	if (psi->flags & PSTORE_FLAGS_DMESG) {
+		pstore_dumper.max_reason = psinfo->max_reason;
 		pstore_register_kmsg();
+	}
 	if (psi->flags & PSTORE_FLAGS_CONSOLE)
 		pstore_register_console();
 	if (psi->flags & PSTORE_FLAGS_FTRACE)
diff --git a/include/linux/pstore.h b/include/linux/pstore.h
index e779441e6d26..e78d5c29aa8b 100644
--- a/include/linux/pstore.h
+++ b/include/linux/pstore.h
@@ -96,6 +96,12 @@ struct pstore_record {
  *
  * @read_mutex:	serializes @open, @read, @close, and @erase callbacks
  * @flags:	bitfield of frontends the backend can accept writes for
+ * @max_reason:	Used when PSTORE_FLAGS_DMESG is set. Contains the
+ *		kmsg_dump_reason enum value. KMSG_DUMP_UNDEF means
+ *		"use existing kmsg_dump() filtering, based on the
+ *		printk.always_kmsg_dump boot param" (which is either
+ *		KMSG_DUMP_OOPS when false, or KMSG_DUMP_MAX when
+ *		tree); see printk.always_kmsg_dump for more details.
  * @data:	backend-private pointer passed back during callbacks
  *
  * Callbacks:
@@ -179,6 +185,7 @@ struct pstore_info {
 	struct mutex	read_mutex;
 
 	int		flags;
+	int		max_reason;
 	void		*data;
 
 	int		(*open)(struct pstore_info *psi);
-- 
2.20.1

