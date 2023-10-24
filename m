Return-Path: <linux-doc+bounces-971-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 568007D52E4
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 15:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9273F2818B9
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 13:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE6738DDD;
	Tue, 24 Oct 2023 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gK9u6FzT"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F657374CB
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 13:47:54 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3526610C3
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 06:47:45 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d9cad450d5fso5175298276.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 06:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698155264; x=1698760064; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7C50BM7p5C+vJ0clcF+/KvirWmdIP5XWEnNLFYgTdS0=;
        b=gK9u6FzTkX3K1iRG91cMEhTsKa38/L/46VIeL5Cn6DYQweSChvvaPKT0wYJ0zaulsS
         v3oYyFfQejo+/Wlr216GpD4ugSM+ghhKGtEXQpALFywvMH6tbnnyyxR/m1LAwap3fTjC
         ONpYfnq0a6ggqJqWWIIli0hiQxldIOngGtsYbIu3hYNk8OTYY6Gz7WJJjQPXQGC3sTqI
         x5a4QRlosGPO5OTPL/77kJSu1rntALwABru6sjyXil4t0nYV92T9GTiRiHI/EsfnqQYK
         sSWgmjuEN/WWQfiYUO6N0BOUY1Km1BDv/aRDg8P6FDhpvJIQTCUr27/77t94dWfLn9ht
         0Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155264; x=1698760064;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7C50BM7p5C+vJ0clcF+/KvirWmdIP5XWEnNLFYgTdS0=;
        b=fITiMRq1WjaaGgSma74TFVOwm7LpQsAskKWWxfwMqhdMl3GexiGuUJshRyZ/pCVko+
         wm7yAWXVh7OzTFl0TJubLn0FRO8LU9LaXqJViDtwrPgVWU6GfVBO0EVTOn5F8CWHeq5h
         bTMSqurAZ9lADNO207UWC3VhSVv7TpQozBEoFoHBJ3G6gMIC9OF9ykuwcQtsJBceDi1o
         O+GmE/X2JtK6WO+WPdJCeaqOmhvzzVVIhvICy4/Mlp+hXR7O8dMT91YbMn92IKusCfqc
         MrkR+bewMmNvBPzPQ/EkQwiLvRUrnoBI9fL8zTTnq3Pa5y7U80j+3M1ZCDwtTiXn85VN
         Pm0g==
X-Gm-Message-State: AOJu0Yz3zU/ZeBxaSru+ka4oPOoQsohoHOW5lBmTRkCTfqFrTOEBml3K
	XAi3ESkgzfgWRPvIvC5vPbj3XzelDOQ=
X-Google-Smtp-Source: AGHT+IFgQR1uDgRKslLBvCkBHAk0T4yEqB1Qvs6h4RCMdoan4Z+72V6WbgepeSBkK71dX/nU/j0JJWPs+jY=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:45ba:3318:d7a5:336a])
 (user=surenb job=sendgmr) by 2002:a25:d34e:0:b0:d9a:e3d9:99bd with SMTP id
 e75-20020a25d34e000000b00d9ae3d999bdmr212803ybf.5.1698155264079; Tue, 24 Oct
 2023 06:47:44 -0700 (PDT)
Date: Tue, 24 Oct 2023 06:46:25 -0700
In-Reply-To: <20231024134637.3120277-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231024134637.3120277-1-surenb@google.com>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231024134637.3120277-29-surenb@google.com>
Subject: [PATCH v2 28/39] timekeeping: Fix a circular include dependency
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, ldufour@linux.ibm.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, surenb@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

This avoids a circular header dependency in an upcoming patch by only
making hrtimer.h depend on percpu-defs.h

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/hrtimer.h        | 2 +-
 include/linux/time_namespace.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 0ee140176f10..e67349e84364 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -16,7 +16,7 @@
 #include <linux/rbtree.h>
 #include <linux/init.h>
 #include <linux/list.h>
-#include <linux/percpu.h>
+#include <linux/percpu-defs.h>
 #include <linux/seqlock.h>
 #include <linux/timer.h>
 #include <linux/timerqueue.h>
diff --git a/include/linux/time_namespace.h b/include/linux/time_namespace.h
index 03d9c5ac01d1..a9e61120d4e3 100644
--- a/include/linux/time_namespace.h
+++ b/include/linux/time_namespace.h
@@ -11,6 +11,8 @@
 struct user_namespace;
 extern struct user_namespace init_user_ns;
 
+struct vm_area_struct;
+
 struct timens_offsets {
 	struct timespec64 monotonic;
 	struct timespec64 boottime;
-- 
2.42.0.758.gaed0368e0e-goog


