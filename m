Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622321CCDB3
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2020 22:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgEJUYs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 10 May 2020 16:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729358AbgEJUYq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 May 2020 16:24:46 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F7BC061A0C
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:45 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x2so3757680pfx.7
        for <linux-doc@vger.kernel.org>; Sun, 10 May 2020 13:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ftIoYymBGMn0ProUbxAIjGCP6irGe3xnecuHwaJ2BU=;
        b=M/cJvL8hlN3LxOR7YqQKrAGHR739tSJqQTIBdmpAhjDy0nybQzRtcOtAPrHiKVhUKj
         hsB2XqjX4rZjw8Kbgv6P7obB7m7yi8bCOQa2muYfgmO3VhYbWa1JIbtFntpsUdFnBvpg
         z2URti78Yz+e3DuPLhwr8YZHxwRBn4DNVm9MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ftIoYymBGMn0ProUbxAIjGCP6irGe3xnecuHwaJ2BU=;
        b=hG7LGjCW9RveDTEb/lo9kYkRipQlm382QzZoefUCbnkGKTjPcuTSItRwX1JrjE7Uhl
         hFSHevMgOGb9nM45RwaffZtHnyz59dBnS/D6jY2xH0g9e/28R9qr+veNBD7cvEAQGX2Y
         uBVuPZwSbfYZD9vh+67im41/7oX7TmUqWGAECXYnGYdC3sNRu+6/5krVYhuasAvvXe/P
         Br1ASYDAFA3vh5Oz2nLfOoMYHDg4h05IsbYXIpT66YmrL5yDzXQ0PjsQPY/V31wSp4Xl
         lOWCQWafCpIhv3ZSrtG1f0fNhRfV8amH4l0hZ+tV/FGjPDg3PA0QxqlVz0GjZVAh0uN+
         R8pQ==
X-Gm-Message-State: AGi0PuYWrxDxBj6rj6j9jd2/m0Dj/qJnRy868BTQEGMRRbw190kT2PXq
        bsYWcmozvUwMESG4PRPenX/IqA==
X-Google-Smtp-Source: APiQypKkKbidaXA2M8XJ6HvdzKsXRV/+gbI2nQYSE78Rxu8a98OLbZfjBGurl33BBe6rQc0sYAewRw==
X-Received: by 2002:a62:2cd7:: with SMTP id s206mr12711308pfs.183.1589142284913;
        Sun, 10 May 2020 13:24:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n9sm8014797pjt.29.2020.05.10.13.24.41
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
Subject: [PATCH v7 04/18] pstore/platform: Use backend name for console registration
Date:   Sun, 10 May 2020 13:24:22 -0700
Message-Id: <20200510202436.63222-5-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the pstore backend changes, there's no indication in the logs what
the console is (it always says "pstore"). Instead, pass through the
active backend's name.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index bf7fa7b278bd..90d146fbc7d2 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -519,13 +519,15 @@ static void pstore_console_write(struct console *con, const char *s, unsigned c)
 }
 
 static struct console pstore_console = {
-	.name	= "pstore",
 	.write	= pstore_console_write,
 	.index	= -1,
 };
 
 static void pstore_register_console(void)
 {
+	/* Show which backend is going to get console writes. */
+	strscpy(pstore_console.name, psinfo->name,
+		sizeof(pstore_console.name));
 	/*
 	 * Always initialize flags here since prior unregister_console()
 	 * calls may have changed settings (specifically CON_ENABLED).
-- 
2.20.1

