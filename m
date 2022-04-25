Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09ED50E903
	for <lists+linux-doc@lfdr.de>; Mon, 25 Apr 2022 21:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244792AbiDYTEG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Apr 2022 15:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244778AbiDYTEE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Apr 2022 15:04:04 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B2B18E2F
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:00:59 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id 67-20020a621846000000b0050d22f49732so4394864pfy.14
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=eqHPhXVFsY1aWd5kzuU1eL2wsGrZ6tPFgC+x7Ju6qxo=;
        b=PBg+H68ojw1koOQnEJrZ6MMtj1acWkPTyAwFIkSY0wqW+D0Ubjw5x2Ksetg2ivOCuZ
         5+tPJvp8xXIWyTgLtC+OXULAzhoJB2tO+3NY5OZB2VK0H+IoAxoJ8VoDcAmflY6BOnuZ
         drcAFgQM1a/JXp2LFIgumdKBshtSyBa72bu7b+fT/jUHqCsFpJwyLx4jLvX1rBMK8Z4s
         SzNgZFO9Pt8mEDE9EBL/QcCwmtAnQ/dCvFYOcWA5AQ4H3e0AstKYC+NIlkg1m6J2jkIK
         +O74AyMLPo8rXFTpkOOt9jzBOKCtuVYM0QLUxRJQhzNOwiQgVR+/6fI4u/oBy+9Lpov5
         1sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=eqHPhXVFsY1aWd5kzuU1eL2wsGrZ6tPFgC+x7Ju6qxo=;
        b=nq/ngEXjnT6mkZxLy28jIBIU6IxCTLIess7f3z6IRHlVXe0YpBwpBLwQiYB245Th1v
         f7luMT3RUM+vF9M9rHqAFWDxkTxpADvM4l27enCid433HaV1hQ18s5S9WeTMGzlSs85i
         Dtw8azUr1pgLI5UYy9xxi4IqB6Cd2nB5Kw//TCZwc6ovbdWGdXzfVS6UFF15A+Pe0O4G
         GR/dMj7Y1xrkkJVnMKnULADxJzjHU6XjzvNByUgg+b20eoJN+3eQPXwnp2x3SqhBYv69
         yP0rlgH/e4Z6qOAE22axQTcq22QjmhjPDtWgmB9iYuTkDCM6PN9ZU6ENWEVa9p7beeQA
         FP1g==
X-Gm-Message-State: AOAM532PtIaebjXLFJr4ffy8pWWoRBfevFfz6ODRBlLkWMuQn774Ud0i
        IyL6kqAZMAoO3ja8wQxrVwgRqBmWwKTk9Ds1
X-Google-Smtp-Source: ABdhPJx21kD4fs+Pmg4O/2ap8I01dUttJqH2BxaSjv6wllmIYa+0VJzGMqxovlYs0K2IGdPVqKy9drNg7BmOd4FK
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a65:4c8e:0:b0:3aa:24bf:9e63 with SMTP
 id m14-20020a654c8e000000b003aa24bf9e63mr16510838pgt.592.1650913258801; Mon,
 25 Apr 2022 12:00:58 -0700 (PDT)
Date:   Mon, 25 Apr 2022 19:00:39 +0000
In-Reply-To: <20220425190040.2475377-1-yosryahmed@google.com>
Message-Id: <20220425190040.2475377-4-yosryahmed@google.com>
Mime-Version: 1.0
References: <20220425190040.2475377-1-yosryahmed@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v5 3/4] selftests: cgroup: fix alloc_anon_noexit() instantly
 freeing memory
From:   Yosry Ahmed <yosryahmed@google.com>
To:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>
Cc:     David Rientjes <rientjes@google.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>,
        Chen Wandun <chenwandun@huawei.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        "=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, alloc_anon_noexit() calls alloc_anon() which instantly frees
the allocated memory. alloc_anon_noexit() is usually used with
cg_run_nowait() to run a process in the background that allocates
memory. It makes sense for the background process to keep the memory
allocated and not instantly free it (otherwise there is no point of
running it in the background).

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
Acked-by: Shakeel Butt <shakeelb@google.com>
---
 tools/testing/selftests/cgroup/test_memcontrol.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 36ccf2322e21..f2ffb3a30194 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -211,13 +211,17 @@ static int alloc_pagecache_50M_noexit(const char *cgroup, void *arg)
 static int alloc_anon_noexit(const char *cgroup, void *arg)
 {
 	int ppid = getppid();
+	size_t size = (unsigned long)arg;
+	char *buf, *ptr;
 
-	if (alloc_anon(cgroup, arg))
-		return -1;
+	buf = malloc(size);
+	for (ptr = buf; ptr < buf + size; ptr += PAGE_SIZE)
+		*ptr = 0;
 
 	while (getppid() == ppid)
 		sleep(1);
 
+	free(buf);
 	return 0;
 }
 
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

