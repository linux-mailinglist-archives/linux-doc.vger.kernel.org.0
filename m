Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1711429AB
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jan 2020 12:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgATLjI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jan 2020 06:39:08 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33382 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgATLjH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jan 2020 06:39:07 -0500
Received: by mail-pl1-f195.google.com with SMTP id ay11so13091027plb.0;
        Mon, 20 Jan 2020 03:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=c6BUXbDXtY2E3YsQMlPsu4WORAb8dSZykDOIxrwF7pI=;
        b=PmnOQLzuV2YjCEJ2RkYITwbmTw2jKxBQ3sCSLgyNHuW/w4eRELSz8Pg2jNDMyJov9z
         BX8pqZo8SIn5j4/ILlGzGODQU2SRl1pNLMzKlfTj6hcwAm+Sa3OWVlc7O8O1fnmPD2sg
         3yOk+yvS3Rex3zQ68qY1jFk195jv16RieaXwAUcf+jpvEAEHIzwd/OiYUtLSkjPvNAsR
         nLX8kxd3UK002441xQ8/H3IGjgZ66qehAN8tvQlQ3eMRfaYkiAB9p9FdLEtjNr909WcY
         kQooV7Q3uiPTAzorh6wLa+QjQBdSVSwXVFHpq74BQ36JS/DB1Pepr9VsT44/wQyB9qVq
         W0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=c6BUXbDXtY2E3YsQMlPsu4WORAb8dSZykDOIxrwF7pI=;
        b=pjxJm4SwEr7yhVbdfxmUUqCkToEUM1s1KOCSetq3cr/56Kipu37gBA2pSlxKz9HluK
         Y4iaL0HAhTUa9iPsQ2WlCQs5MC4uFVy70Gk5iAv5ODDYbuakHYGVDZ90DYh9VzYJ8pph
         n3FB6GvgxBiIaMZ/WyJ5EMHrrVBOXrJiVoHVGGU1pV818zTIKKfQnwCdHHxJ7NEzU5uc
         FB2BLYMCwGi2UtgYwppKzFg9mxlEV1eGAk/cy1lmYyRuEaAZg2hgLWt14hLCxRF3kS4T
         nndt/ZgOxFy3l0SAU5PsWLFF6Nli5s4Y3jBw5GVngbOvo1MNl3WNP9wDw7iBY0lE8drs
         m2vg==
X-Gm-Message-State: APjAAAWZVkiaMUq/LbuUmOskUGy71qA/xox1oR/GM45xUVwthJ8Ypo4v
        OYSNIx5azr8Hqtjz/dd93UA=
X-Google-Smtp-Source: APXvYqzPX3cTeumPiZ51wSjYXUMQdIoF60NOBmTzFxaIkCEMkrsgcaeLSN0/2re/f7wu1jEsV7jh7Q==
X-Received: by 2002:a17:90b:4004:: with SMTP id ie4mr23164772pjb.49.1579520347132;
        Mon, 20 Jan 2020 03:39:07 -0800 (PST)
Received: from localhost ([43.224.245.181])
        by smtp.gmail.com with ESMTPSA id q22sm39790762pfg.170.2020.01.20.03.39.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 03:39:06 -0800 (PST)
From:   lijiazi <jqqlijiazi@gmail.com>
X-Google-Original-From: lijiazi <lijiazi@xiaomi.com>
To:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        lijiazi <lijiazi@xiaomi.com>
Subject: [PATCH v3 2/3] lib/vsprintf: introduce OF_DEVICE_NODE_FLAG_MAX
Date:   Mon, 20 Jan 2020 19:38:28 +0800
Message-Id: <2d432e67cab2eb51f36f5b2e904a185ef48df6e0.1579423564.git.lijiazi@xiaomi.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
In-Reply-To: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

introduce OF_DEVICE_NODE_FLAG_MAX for %pOF related printk.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: lijiazi <lijiazi@xiaomi.com>
---
Changes in v3:
 - fix incorrect multi-line comment style.
 - split v2 to 3 patches.
---
 include/linux/of.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index c669c0a..c5bbfa6 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -147,6 +147,13 @@ extern raw_spinlock_t devtree_lock;
 #define OF_OVERLAY		5 /* allocated for an overlay */
 #define OF_OVERLAY_FREE_CSET	6 /* in overlay cset being freed */
 
+/*
+ * add OF_DEVICE_NODE_FLAG_MAX for %pOF related printk.
+ * if there is any change on these flags, please synchronize the change
+ * to device_node_string function in lib/vsprintf.c.
+ */
+#define OF_DEVICE_NODE_FLAG_MAX 6 /* Maximum available flags */
+
 #define OF_BAD_ADDR	((u64)-1)
 
 #ifdef CONFIG_OF
-- 
2.7.4

