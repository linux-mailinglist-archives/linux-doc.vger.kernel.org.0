Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F5F4F8B3C
	for <lists+linux-doc@lfdr.de>; Fri,  8 Apr 2022 02:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbiDGWpU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 7 Apr 2022 18:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbiDGWpS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Apr 2022 18:45:18 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C07154708
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 15:43:16 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id b6-20020a62a106000000b0050564d6fd75so2124921pff.22
        for <linux-doc@vger.kernel.org>; Thu, 07 Apr 2022 15:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=y5kLkmkUaSU939NtOaJ7kENjr4CmmYfn21w5A3thUOw=;
        b=aC4OyXHf4zXH3aVAvZP2isai1NfAJODoi+h/jeo6227aWE7/UNx9vRmO7K+nXkcUCS
         s9XKz5FGq6IV0H9j+f+1kDwfB30+hx0do0q53S76ja207606eviWCohtmayr6fBCQkc9
         1sdXknXpZ8XndmgJ0pmTjd+HlUgoMvkYzs0X0cvxqWJxIXvpQCLE6EqIIH5GaCzK8CCe
         BoyeDi/gfXP8ur0yX+EDhja7a4Syvq3k4W5aUcs+AOjSwT/bQ9kfoNOctrzIXGKXolUY
         HQTj7jzxgVCV7PvyxiSwk7tVEZ5t/ZR1BP6DcRSt4XfGFmUJEjpNtVsoDBd1xjfp8X45
         CuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=y5kLkmkUaSU939NtOaJ7kENjr4CmmYfn21w5A3thUOw=;
        b=0jznHhpe1jMkcZY5HAan77wbT/AAL2dCvDLXFhvyHeZRw6LWO0TYQfteqmOc/Mme38
         4KAB33gykmsiSJupSA4aO7OQoijx1qDsxrZx7mm9DrD88azwC3Q0MmFYLtbtuF5PbU3f
         ddbrAvHsKH8SZmMbHtgtjTJ36hwwMHwH7TIi+32TFXmAxYQIMFytr0JhdRMOaF4pKFqJ
         4AmmlpV3UpJj0YJ2YVRXzoEBsJjZgJNFmJGy8b+GcVJO1OohUH8ral7djQVZjWKSVxVs
         0jVK7dBNLk/5/4r3AJ4x6dEWeimuNRe+12uPljJfQcfrDIHN4ZqkLlTtCul61z5FuqZ2
         b92A==
X-Gm-Message-State: AOAM530SpRqoqEhsrtRXRfsCduymsySAY9Uohw+TagMIss5h3AHghu75
        LQXQEvYhMS9AELDMP9bN100QNfQh1WQRQ2Ge
X-Google-Smtp-Source: ABdhPJzAfAdkZv56FwwXuFe+YfahfkLJGsk0DNVeMx/4t1ZRPrLKIDZTAq05tzSlpuEAwmu1ISfvaIvzERAscaYz
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a17:90a:694c:b0:1cb:301f:94f3 with SMTP
 id j12-20020a17090a694c00b001cb301f94f3mr2839762pjm.241.1649371396274; Thu,
 07 Apr 2022 15:43:16 -0700 (PDT)
Date:   Thu,  7 Apr 2022 22:42:44 +0000
In-Reply-To: <20220407224244.1374102-1-yosryahmed@google.com>
Message-Id: <20220407224244.1374102-5-yosryahmed@google.com>
Mime-Version: 1.0
References: <20220407224244.1374102-1-yosryahmed@google.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
Subject: [PATCH v2 4/4] selftests: cgroup: add a selftest for memory.reclaim
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
        Vaibhav Jain <vaibhav@linux.ibm.com>, Huang@google.com,
        Ying <ying.huang@intel.com>,
        "=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new test for memory.reclaim that verifies that the interface
correctly reclaims memory as intended, from both anon and file pages.

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index c1ec71d83af7..915dffef2287 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -761,6 +761,90 @@ static int test_memcg_max(const char *root)
 	return ret;
 }
 
+/*
+ * This test checks that memory.reclaim reclaims the given
+ * amount of memory (from both anon and file).
+ */
+static int test_memcg_reclaim(const char *root)
+{
+	int ret = KSFT_FAIL, fd;
+	char *memcg;
+	long current, to_reclaim;
+	char buf[64];
+
+	memcg = cg_name(root, "memcg_test");
+	if (!memcg)
+		goto cleanup;
+
+	if (cg_create(memcg))
+		goto cleanup;
+
+	current = cg_read_long(memcg, "memory.current");
+	if (current != 0)
+		goto cleanup;
+
+	cg_run_nowait(memcg, alloc_anon_noexit, (void *) MB(50));
+	sleep(1);
+
+	fd = get_temp_fd();
+	if (fd < 0)
+		goto cleanup;
+
+	cg_run_nowait(memcg, alloc_pagecache_50M_noexit, (void *)(long)fd);
+	sleep(1);
+
+	current = cg_read_long(memcg, "memory.current");
+	if (!values_close(current, MB(100), 10))
+		goto cleanup;
+
+	/*
+	 * Reclaim until current reaches 30M, make sure to reclaim over 50M to
+	 * hit both anon and file.
+	 */
+	while (true) {
+		int err;
+
+		current = cg_read_long(memcg, "memory.current");
+		to_reclaim = current - MB(30);
+
+		/*
+		 * We only keep looping if we get EAGAIN, which means we could
+		 * not reclaim the full amount.
+		 */
+		if (to_reclaim <= 0)
+			goto cleanup;
+
+
+		snprintf(buf, sizeof(buf), "%ld", to_reclaim);
+		err = cg_write(memcg, "memory.reclaim", buf);
+		if (!err) {
+			/*
+			 * If writing succeeds, then the written amount should have been
+			 * fully reclaimed (and maybe more).
+			 */
+			current = cg_read_long(memcg, "memory.current");
+			if (!values_close(current, MB(30), 3) && current > MB(30))
+				goto cleanup;
+			break;
+		}
+
+		/* The kernel could not reclaim the full amount, try again. */
+		if (err == EAGAIN)
+			continue;
+
+		/* We got an unexpected error. */
+		goto cleanup;
+	}
+
+	ret = KSFT_PASS;
+cleanup:
+	cg_destroy(memcg);
+	free(memcg);
+	close(fd);
+
+	return ret;
+}
+
 static int alloc_anon_50M_check_swap(const char *cgroup, void *arg)
 {
 	long mem_max = (long)arg;
@@ -1264,6 +1348,7 @@ struct memcg_test {
 	T(test_memcg_high),
 	T(test_memcg_high_sync),
 	T(test_memcg_max),
+	T(test_memcg_reclaim),
 	T(test_memcg_oom_events),
 	T(test_memcg_swap_max),
 	T(test_memcg_sock),
-- 
2.35.1.1178.g4f1659d476-goog

