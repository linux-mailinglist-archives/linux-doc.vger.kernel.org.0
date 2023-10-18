Return-Path: <linux-doc+bounces-508-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACCF7CE366
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 19:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372ED281D59
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 17:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35133D383;
	Wed, 18 Oct 2023 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1x+gwyp"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603DD35885
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:06:14 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13053B0;
	Wed, 18 Oct 2023 10:06:13 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-79fd60f40ebso175703339f.1;
        Wed, 18 Oct 2023 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697648772; x=1698253572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
        b=g1x+gwypl/sOzhrG9aYfwnOJiYrVdCbeA/hW+0d2ACEvuFFjBgT9DcJReCu7eOxzi/
         6uGWioFWWyLvRY+/e1Pb7itX3aGT7GX+EIcgiu+7zd4/RuToSDcvdsuTNy0HaaGGl1mF
         pVfLfsk5/nkf6XPfioQvwsiuWeGF3RTlsI2NYIwnS4CiEgym5wzVsfZHt500PXT7VwtX
         IgbKCtGANHcPQnJttVuv+qDyuVKJdP1uQcyTfMk+IFvRnuE7sbBDzXf/kvvrVXvBGdGm
         3PCEykI2XYb3EVexUO1KsrMYMEd1nV8OVK5QBFqxMJBouvdp/jcHUXw3kaY5T5DoHojC
         Dh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697648772; x=1698253572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
        b=emlMniJgINiP6+cLOaaGRvAHWdRZc+6SbYypuqTMpqqBsSrfEXRWfpRqYoyQPtuijo
         IMoc9cu4kQtL1V3n8ONmhlbx79lVQdKReBWi7cLoNv2V5ILBDqpHi9k43pAUglNe4V82
         dyt4ZFfOuC6SdrB2aB90zZQdKgajly/3/uFdUPMHC8qPEkpoeZRiYQNGBP84vkTuMbFg
         zSelreoXqNC7jP1RXT+jHudu1uWwv5Zb1oByG8IbxwbXSYCgW+OTsG2r2/034Sdovkz8
         9I/eWR1RjgJ5fsMZjENQvmrS6CKwMjAhgKnOzlr6KTP7GeGv9CkhjdTgchKqisvDvmvu
         J1Vw==
X-Gm-Message-State: AOJu0Yx5H3c27V87tD3xNfC6kyZo3b64rmbWPMSdqwJb8lY9a4FWRpXE
	K0KbHzSkrEs+2U87d7VQ18dqc91JoasrLQ==
X-Google-Smtp-Source: AGHT+IEVOEqYR1bLjUL265nBqQl4ufL7qKQgsJ6xo+Ioj0FHEoq+lERcF7qknhIgjNBA2fErjZMwUg==
X-Received: by 2002:a05:6602:158d:b0:785:d5d4:9f26 with SMTP id e13-20020a056602158d00b00785d5d49f26mr5816349iow.9.1697648772072;
        Wed, 18 Oct 2023 10:06:12 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 10:06:11 -0700 (PDT)
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
Subject: [PATCH v7c 02/24] dyndbg: reword "class unknown," to "class:_UNKNOWN_"
Date: Wed, 18 Oct 2023 11:05:42 -0600
Message-ID: <20231018170604.569042-3-jim.cromie@gmail.com>
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

This appears in the control-file to report an unknown class-name, which
indicates that the class_id is not authorized, and dyndbg will ignore
changes to it.  Generally, this means that a DYNDBG_CLASSMAP_DEFINE or
DYNDBG_CLASSMAP_USE is missing.

But the word "unknown" appears in quite a few prdbg formats, so thats
a suboptimal search term to find occurrences of the problem.  Thus
change it to "_UNKNOWN_" which properly shouts the condition.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6fba6423cc10..ceb3067a5c83 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1151,7 +1151,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_puts(m, "\n");
 
-- 
2.41.0


