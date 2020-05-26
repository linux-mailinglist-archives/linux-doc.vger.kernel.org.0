Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B1E1CCDB1
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2020 22:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgEJUYo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 10 May 2020 16:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729266AbgEJUYn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 May 2020 16:24:43 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9055C05BD0A
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:43 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f15so3026094plr.3
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a6bXV7bt3FJwO+6h7hS9wdbWbj+cKT2R8klgQdvy5V4=;
        b=Vu8u0y3g/EsMOqGf92rFyvezCvoeKBq6M4OIMjHDXZQuVY5ATlo2kh28eB6tVdSW2u
         HeG9wciptveXO5MHRNtJSHj4Ogkp9s7OktTbZhn/Vvp42lUU1KrIa9rIQ0bGpNOCOKeO
         EC9TBt8Z9Lh9M/kLz05YI4DHvIcGjrjtQpGgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a6bXV7bt3FJwO+6h7hS9wdbWbj+cKT2R8klgQdvy5V4=;
        b=NckT0JXw5XZj3Xdjiwd197U8yQW21jwdZ76+QUlWQ/uxv9b6NvjnzNrX8x2kpN+sp/
         BvLAC5MJpJJKuJwcOhqlCUEwTL2P2xOKViSeVmKJ1h6SXHx/76WsCKN6Tqs6Zm2sghfB
         jDBFZZM4shHRCUS+434h5HSewB/Wm1stVyqVyYhQX5edDNd26tDTjIVgLandZenQ9L8Q
         NqaizUW/3vqlBft2lVR2AZacpYTuL5FIglCjqdy3ncyq43XBip8uhVfEa4Sh54VmIGdv
         g2NBIYYZFtnmUuXxNQnxxR3hI9segcGdHWbyJMEO0N3g5VAqFtIeMgZY843v8fxzg7Oi
         jesw==
X-Gm-Message-State: AGi0PubZ9NjSIz7EQj/EcMOXkduA33yuzX7fPDC83Cj1JXj3lSpJYRCd
        EqNhe0YbaamfMoyd7AxL2Qk2tw==
X-Google-Smtp-Source: APiQypL4ftL5PXuI6WbPG1D/aF+OyzdmBrwXgZqbvh107ELfxtW4oGZxzd33g34wmpY9M28zk4hvsQ==
X-Received: by 2002:a17:90b:374e:: with SMTP id ne14mr17664828pjb.145.1589142283365;
        Sun, 10 May 2020 13:24:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y6sm7866882pjw.15.2020.05.10.13.24.41
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
Subject: [PATCH v7 02/18] pstore/platform: Switch pstore_info::name to const
Date:   Sun, 10 May 2020 13:24:20 -0700
Message-Id: <20200510202436.63222-3-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to more cleanly pass around backend names, make the "name" member
const. This means the module param needs to be dynamic (technically, it
was before, so this actually cleans up a minor memory leak if a backend
was specified and then gets unloaded.)

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c   | 3 ++-
 include/linux/pstore.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index b882919b8784..e7bf22f01928 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -626,7 +626,7 @@ int pstore_register(struct pstore_info *psi)
 	 * Update the module parameter backend, so it is visible
 	 * through /sys/module/pstore/parameters/backend
 	 */
-	backend = psi->name;
+	backend = kstrdup(psi->name, GFP_KERNEL);
 
 	pr_info("Registered %s as persistent store backend\n", psi->name);
 
@@ -669,6 +669,7 @@ void pstore_unregister(struct pstore_info *psi)
 	free_buf_for_compression();
 
 	psinfo = NULL;
+	kfree(backend);
 	backend = NULL;
 	mutex_unlock(&psinfo_lock);
 }
diff --git a/include/linux/pstore.h b/include/linux/pstore.h
index 16a1fdafc167..eb93a54cff31 100644
--- a/include/linux/pstore.h
+++ b/include/linux/pstore.h
@@ -176,7 +176,7 @@ struct pstore_record {
  */
 struct pstore_info {
 	struct module	*owner;
-	char		*name;
+	const char	*name;
 
 	struct semaphore buf_lock;
 	char		*buf;
-- 
2.20.1

