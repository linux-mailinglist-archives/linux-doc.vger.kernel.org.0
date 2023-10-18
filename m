Return-Path: <linux-doc+bounces-526-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FEA7CE3A5
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 19:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F72EB2129F
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 17:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0C63D3A9;
	Wed, 18 Oct 2023 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrNu7Vy2"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0543D3AC
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:06:37 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73BCD49;
	Wed, 18 Oct 2023 10:06:35 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7a5d26511f7so263463239f.2;
        Wed, 18 Oct 2023 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697648795; x=1698253595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnWyGzBg+EfQ/17pthf1gkMUPd8BVnFczw04j1DAB6Y=;
        b=lrNu7Vy2sHVKMTg5WSOarXHeqD67RPeGS5mORQxkC2YBI/CY8+PY/AZc1IH28qSxov
         5MDeR8aCDSjTmTkYMsnDwxBwAvSJeyLJ3qTsqmVOB54ZMFmW827V+8NJTB0jh+KNyXwe
         wm7aWqEaflxWws0NpCON70u1EDd/v6Rz7ey9hqkPPkgVYn7PKRn8Vn68dsE+JMTyXIky
         GAu2r4SMNqDTNMSgDuY3/SPqsQ3PZphRV662JRHzEwzipHpz05Z8DJLpMfLDGsqgZ1uO
         SrR5+/g1eZUgBvbNlT4p4D55hxVhZ8RZ6LzaksPbOTXS04FECGJYE5v2p/ZoIGpSLlgw
         oEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697648795; x=1698253595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnWyGzBg+EfQ/17pthf1gkMUPd8BVnFczw04j1DAB6Y=;
        b=hKTm4WadvsfYXZmg1hy/At61Db9A4e/atnG7eUli6u2qhp58KxiwASiJ7LVQjUbIrB
         JXZ8LMGrhT1hjLABOGK61F0fnFo6ko9JTfAZFfS+DokmfI0RqQUZ8iFUqYhVpIi/gDXH
         tnc+jqJvXocPQA3BXSkltlGqrNNIAtJLMdfVoNJuWpu4y5R9UmpSrQWWf46iujTcmlTE
         C494BUKvLYUwl0U99qi90x6PwrZov6YoCqqqQ6NL/7H4GBq94ceIwrJU5EyQ9RrgQ1bW
         EaIrwjTme7L1uMNUR8zgfUNmAfQTc9IXrAqA3xjhRdcSugyUyr1aS8HV4/LM4VMlAw0d
         z5PQ==
X-Gm-Message-State: AOJu0YyB7UfFM8g5VCgHh4D0PsCUwYUgQT+OHx0CcyXyItwZqTArMOub
	uTJxnbmiHLhy2NJuFwy6Ht1YYfCWXpqFig==
X-Google-Smtp-Source: AGHT+IFeheNXZBGnOFX29lWvMdz9W+sw0/6ZtrOHpH1g7X3NeT601F54bgeT0BHNqWdWEMi59Mg+zw==
X-Received: by 2002:a05:6602:1584:b0:790:f735:4d30 with SMTP id e4-20020a056602158400b00790f7354d30mr6712709iow.13.1697648794854;
        Wed, 18 Oct 2023 10:06:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 10:06:34 -0700 (PDT)
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
Subject: [PATCH v7c 21/24] dyndbg: change WARN_ON to WARN_ON_ONCE
Date: Wed, 18 Oct 2023 11:06:01 -0600
Message-ID: <20231018170604.569042-22-jim.cromie@gmail.com>
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

This shouldn't ever happen, and 1st 2 conditions never have.

The 3rd condition did happen, due to corrupt linkage due to a missing
align(8) in DYNDBG_CLASSMAP_USE, on the static struct allocation into
the __dyndbg_class_users section.

Not sure whether changing to _ONCE is appropriate - this is a
module-load activity, so it won't continuously spam syslog.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
undo BUG_ON addition
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 9db797a0cf82..213110ec1e9c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1281,7 +1281,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 	 */
 	for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
 
-		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
+		if (WARN_ON_ONCE(!cli || !cli->map || !cli->user_mod_name))
 			continue;
 
 		if (!strcmp(cli->user_mod_name, dt->mod_name)) {
-- 
2.41.0


