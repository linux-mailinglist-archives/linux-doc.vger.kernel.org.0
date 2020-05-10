Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D791CCDBA
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2020 22:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgEJUYr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 10 May 2020 16:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729350AbgEJUYo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 May 2020 16:24:44 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E00CC061A0C
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:44 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id s10so3031635plr.1
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvhNGN1Tx7s0Ij5sTylqbBedyOwoifzYhuoj8ucg/Ng=;
        b=oUPw6/i/iSWSLQ8qEZxi/iwEj2X96+Bexnha6PPFG6//+4Z23RGHmmMvuexJ/VamdF
         F19pZKmlabTzyoj+NUGRdBPzFwPSXEqx8bNuJLoNAp7GF8uWqV30AiPPU5cGHI9R0Wqb
         Pny9vkYjK7rac58pWP4vQRqVTW6M4MKmJ4k2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvhNGN1Tx7s0Ij5sTylqbBedyOwoifzYhuoj8ucg/Ng=;
        b=p+2nNq+fxMfHpSTYv6dtJZpym8hfjvKJUASn55aXVlpvdA8BPFnNLlH6XkFhKcRxBA
         Y2vi+3uuOrgWMoCRsXyKksqdj8QI3inmyQRVHNFCQSnL+h9OgdmuHEdZAM5wxiM+ZiUX
         xpkskc9cATCp6/RgTN3HyYDzODnDyJFWYM4gGTIblEt3lw2QKdxzu34Esho2DySP3+Jt
         KtRvv9UWTQ7b8dAbKA6N9lEaBf4OVJukYQlhFj0oilArgBxwjRiVHePncrZTWoHs1Ltw
         XHLA2saEuTdQziVG5/JuqPSDsUBYrjyV1cXBIEaHXtyTTGuwQql80fwRgL3xFIFO5iJb
         F0kg==
X-Gm-Message-State: AGi0PubCUL+6hZdmLWj8eTrC1XEjZ3qaI719A5HiPd39W/KV6z77uNjy
        ZGs8vVex0cm8XKtGHCUdQWO+mw==
X-Google-Smtp-Source: APiQypI0peMuCdpjAI6Jjbk4+g7PSZ9VEw2TUInRV5/MACLXB5MTMLkkWXhKvUdHeRCsFkKmImLJjQ==
X-Received: by 2002:a17:90a:22e8:: with SMTP id s95mr18281973pjc.219.1589142284157;
        Sun, 10 May 2020 13:24:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 128sm7284042pfy.5.2020.05.10.13.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 13:24:41 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Rob Herring <robh@kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: [PATCH v7 03/18] pstore/platform: Move module params after declarations
Date:   Sun, 10 May 2020 13:24:21 -0700
Message-Id: <20200510202436.63222-4-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It is easier to see how module params are used if they're near the
variables they use.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index e7bf22f01928..bf7fa7b278bd 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -77,12 +77,17 @@ static DEFINE_MUTEX(psinfo_lock);
 struct pstore_info *psinfo;
 
 static char *backend;
+module_param(backend, charp, 0444);
+MODULE_PARM_DESC(backend, "specific backend to use");
+
 static char *compress =
 #ifdef CONFIG_PSTORE_COMPRESS_DEFAULT
 		CONFIG_PSTORE_COMPRESS_DEFAULT;
 #else
 		NULL;
 #endif
+module_param(compress, charp, 0444);
+MODULE_PARM_DESC(compress, "compression to use");
 
 /* Compression parameters */
 static struct crypto_comp *tfm;
@@ -853,11 +858,5 @@ static void __exit pstore_exit(void)
 }
 module_exit(pstore_exit)
 
-module_param(compress, charp, 0444);
-MODULE_PARM_DESC(compress, "Pstore compression to use");
-
-module_param(backend, charp, 0444);
-MODULE_PARM_DESC(backend, "Pstore backend to use");
-
 MODULE_AUTHOR("Tony Luck <tony.luck@intel.com>");
 MODULE_LICENSE("GPL");
-- 
2.20.1

