Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D4B1D5954
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2020 20:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgEOSoq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 May 2020 14:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgEOSom (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 May 2020 14:44:42 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E26C061A0C
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 11:44:40 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g11so1264631plp.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 11:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ma8a3IEAfy5hkhHsO5eKEOmN1t9cPUU6UBCxHjpj29E=;
        b=kFD/V16eJ50vNYvQlv772jPHRykPYjlwl1Um5D+Hle7uWzCtgZBfQwS/KwK/nZTCfr
         j7KkvjVgSES0XLwXjE9WlI7wIu/Nf8fUAlNzwExUrzHOkC2R1ilVSTKU/mq7IEzMjFjU
         4aduh2ic/Jzv/txp6IEmmoGgNg+5FXR5uWH8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ma8a3IEAfy5hkhHsO5eKEOmN1t9cPUU6UBCxHjpj29E=;
        b=BER4a1QcwbXBGEL2mYVXxKSN2LmZDxGMAPi6aYSq+2tGctEGUWFNtGJQVEYImy+ECf
         lzNUd5e/dVD1DX1XRKQs19+rmkWtwvFqlTex2uWZKDzuQNK0snGARhd35yxcoAqYvvgA
         7uaPKKlM1qvO5xYyz+v3rrK/rNIzUbRpRZJgyJ2cWnR/sQFfvxbvGhHcdNBhfq3jesYI
         GSAwZgUe4OPEFmqIYIYS2y1f7mBhQDMobuGd9LjmXIQdOz6vqYJXqI3fpE6odAm8QZPO
         9YQmilr7MSikY7p4mpP7ob9LOU1zK+IYQyt/NB/ccn82akcuIgHcDt3plUTpfpitjCHl
         PTCw==
X-Gm-Message-State: AOAM532A8R19zXu+IFmbuPCEY5C0hQWesaFG/xSjxcUvxO4GTZyoi+ZE
        Tp1QxMm3UyIJsQ55YRY7+QF4ZA==
X-Google-Smtp-Source: ABdhPJxrmBmEg335hMMKhTsZxipJMSKlq5GwMgh5rKfEUwuGPTZ3/FFaBx7j/3lkOTeALmalHA9y/g==
X-Received: by 2002:a17:90b:41d5:: with SMTP id jm21mr4562657pjb.96.1589568280507;
        Fri, 15 May 2020 11:44:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t20sm2075905pjo.13.2020.05.15.11.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 11:44:38 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 4/6] pstore/platform: Pass max_reason to kmesg dump
Date:   Fri, 15 May 2020 11:44:32 -0700
Message-Id: <20200515184434.8470-5-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515184434.8470-1-keescook@chromium.org>
References: <20200515184434.8470-1-keescook@chromium.org>
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
Link: https://lore.kernel.org/lkml/20200506211523.15077-3-keescook@chromium.org/
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c   | 4 +++-
 include/linux/pstore.h | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 5e6c6022deb9..a9e297eefdff 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -595,8 +595,10 @@ int pstore_register(struct pstore_info *psi)
 
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
index f6f22b13e04f..eb93a54cff31 100644
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
+ *		true); see printk.always_kmsg_dump for more details.
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

