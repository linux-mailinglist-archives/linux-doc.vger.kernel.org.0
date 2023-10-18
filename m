Return-Path: <linux-doc+bounces-518-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 681327CE389
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 19:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C051C20E42
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 17:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9BA3D398;
	Wed, 18 Oct 2023 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr6Aq4C3"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8248E3D396
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:06:27 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4730C185;
	Wed, 18 Oct 2023 10:06:25 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-77acb04309dso284293239f.2;
        Wed, 18 Oct 2023 10:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697648784; x=1698253584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
        b=Nr6Aq4C3SjJiw3qHQe83gCz5GxFbhOuGiKw15Cj4wh819sQdZiUKSYtfEeDRcKTdWD
         7J2JeP9m4HihWsOJKExEwy6QGW9DImTxfMAwZnhAmmOmYIq2uOlZByvV4eEnPk6cD1I4
         /Rp6ihZHw1ShZ4TSghwj85YeAJHy3s9fOE00MPLxyI7midHYtEMj9OZD2Af7O5JpSeGL
         +EyT1xtN7zNvkA55nuUfCyOAx7XFVpAnl12bP9HG9jf9FeAWqtACyMTX+aT+7IBd6FdT
         br4CVguvVggxEJC7tfHTbI3Y9CbXewER09CRu/KV15sBweyUru7CzgA18v4LEy6XKoyX
         KK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697648784; x=1698253584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLvXeLnsRUQ3/TUrQnBU04ibB7JIWTVa6JOjlgQ9hVM=;
        b=Ip7O/bUAwRO/OKRV8fivzQ8A20dynRi+/w6jDrfQKagTXWC4E+WMynN/cTUkykbxxa
         uX64JN3yGThoZThyCdzt1m//Yefymn2z1diii+XaAn2Wwj46W95Nx3a6YrN9WGP64EA1
         B/VW6GsSRYu4xCiqoaeoiZuu3tfaCJr1rqDInveEckJ6mPxdvohpWPHRgdG6DsJY3AU3
         rcgdeTtBiK9hhLGkTSayBYeUGkPte5ncWE5EZLMQzrBWE5tqQH8Njon1GPsmUet0suXc
         +ovhyIk9XNzHZLBX2aN+vB98dDtqIj8FWKI7xxrm8wAqmObaxPQ1dFQuKBiS2RoiX1dG
         icIw==
X-Gm-Message-State: AOJu0YyZcnKMESsYMgWhl1ECcALkNVj3FitsuN+R8ajGjsrM1ZUKCBLY
	S4qms8fIMWfn8ILzLFRo8GHj8dNLHg1fOw==
X-Google-Smtp-Source: AGHT+IHXn5aDSBWQ4yV+ZfP2Q8uwJsUM84jyQKFm2T659/qUKTQfbS6h1rfjfndzbeqO5bduFZlWHg==
X-Received: by 2002:a05:6602:1611:b0:791:2db5:c779 with SMTP id x17-20020a056602161100b007912db5c779mr6946727iow.10.1697648784315;
        Wed, 18 Oct 2023 10:06:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 10:06:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: lb@semihalf.com,
	linux@rasmusvillemoes.dk,
	joe@perches.com,
	mcgrof@kernel.org,
	daniel.vetter@ffwll.ch,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7c 12/24] dyndbg: reduce verbose=3 messages in ddebug_add_module
Date: Wed, 18 Oct 2023 11:05:52 -0600
Message-ID: <20231018170604.569042-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The fn currently says "add-module", then "skipping" if the module has
no prdbgs.  Just check 1st and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8beb98a831f5..45870a699507 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1242,11 +1242,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.41.0


