Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B82350AC36
	for <lists+linux-doc@lfdr.de>; Fri, 22 Apr 2022 01:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442718AbiDUXrd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 21 Apr 2022 19:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239543AbiDUXrc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Apr 2022 19:47:32 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1D63A71F
        for <linux-doc@vger.kernel.org>; Thu, 21 Apr 2022 16:44:41 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id a15-20020a63cd4f000000b003a9f17da993so3590501pgj.13
        for <linux-doc@vger.kernel.org>; Thu, 21 Apr 2022 16:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5O0kxWZmLwFRE//70CU4SnK5FsmrfXu8oMUA9u7C7Og=;
        b=EEuRmGT5N/AhXYspmngFDGUt6HR2mHaVhu/fczoNdkx1S+Tiw4e5ODeE/h0GtPvaG2
         bvqoiL5mnjZ/aduPS9JOdCT/WFHetjHQ/fFxUMLwUz2iHstQGYdLFY9nEc3RGO/pFRId
         m0WQO8I7VArJ1uX3NbmYYEA88ykvSfC0OpSqsvj5vs/DO49GYszGs0S7tk5R8f4jxym8
         I2h1Y/p24TBtaEZqcwGkSWTlCVdJnfbO6lXa5S28c65m4gPlKPQoodGuay5Lob9zUCDG
         714Wv7IzMi+PqiG7UTFB2mdWmfKUmZO1+0ChdhKc8za/syH6jJBY1fE/GNCPODAwzk8P
         Nyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5O0kxWZmLwFRE//70CU4SnK5FsmrfXu8oMUA9u7C7Og=;
        b=sERq3I3AFomnBUVZz84bBwUm7C5I9mqJfG9934v3Nxr9pf92kxlbm0+6GJmpnTW9L+
         ogH3T4Y3NfiDFJXCIoGVorBq+Rk0gOw6l97ci1zEjsJgH1PWqQGpAUgjoUM4rPb7dKfN
         zFIxuXfIWbMub4ByIUGXyOfDwFnefiQ7AXhPA5gsAMaBVJX3Toox8twF0alU0gWZazC4
         v01JCnFArOYjzRo0XxMM2JW9Ca5SepGlolOwvg9mKAv9GvzasgFGF90YuD/fefUQFqA8
         VViov1BHUg8fn2lZV+3i5SXRjeohRGfPnWUmClaJr5k/NM2BATxze/TgKWDT4UQh+Xnf
         Ku8A==
X-Gm-Message-State: AOAM533p5gGWE+W2FL+nnxwnwiwAWDEESflqY1Jn4Rd9qbdIIJaM9ExU
        FD2MrzBEPg8SPLcHO1Pxjl5PYbcKGXRs8+sP
X-Google-Smtp-Source: ABdhPJwbrNyYgwlg049kNO7De6jIXhM0txTIQgoR7t77/mZCi0rHv0F4AqswEeup+3MsId9P62g42WOoKu2wvlT1
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a65:6216:0:b0:39d:5e6c:7578 with SMTP
 id d22-20020a656216000000b0039d5e6c7578mr1558461pgv.114.1650584680523; Thu,
 21 Apr 2022 16:44:40 -0700 (PDT)
Date:   Thu, 21 Apr 2022 23:44:22 +0000
Message-Id: <20220421234426.3494842-1-yosryahmed@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 0/4] memcg: introduce per-memcg proactive reclaim
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
        Tim Chen <tim.c.chen@linux.intel.com>,
        Dan Schatzberg <schatzberg.dan@gmail.com>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org,
        Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series adds a memory.reclaim proactive reclaim interface.
The rationale behind the interface and how it works are in the first
patch.

---

Changes in V4:
mm/memcontrol.c:
- Return -EINTR on signal_pending().
- On the final retry, drain percpu lru caches hoping that it might
  introduce some evictable pages for reclaim.
- Simplified the retry loop as suggested by Dan Schatzberg.

selftests:
- Always return -errno on failure from cg_write() (whether open() or
  write() fail), also update cg_read() and read_text() to return -errno
  as well for consistency. Also make sure to correctly check that the
  whole buffer was written in cg_write().
- Added a maximum number of retries for the reclaim selftest.

Changes in V3:
- Fix cg_write() (in patch 2) to properly return -1 if open() fails
  and not fail if len == errno.
- Remove debug printf() in patch 3.

Changes in V2:
- Add the interface to root as well.
- Added a selftest.
- Documented the interface as a nested-keyed interface, which makes
  adding optional arguments in the future easier (see doc updates in the
  first patch).
- Modified the commit message to reflect changes and added a timeout
  argument as a suggested possible extension
- Return -EAGAIN if the kernel fails to reclaim the full requested
  amount.

---

Shakeel Butt (1):
  memcg: introduce per-memcg reclaim interface

Yosry Ahmed (3):
  selftests: cgroup: return -errno from cg_read()/cg_write() on failure
  selftests: cgroup: fix alloc_anon_noexit() instantly freeing memory
  selftests: cgroup: add a selftest for memory.reclaim

 Documentation/admin-guide/cgroup-v2.rst       | 21 +++++
 mm/memcontrol.c                               | 44 +++++++++
 tools/testing/selftests/cgroup/cgroup_util.c  | 44 ++++-----
 .../selftests/cgroup/test_memcontrol.c        | 94 ++++++++++++++++++-
 4 files changed, 176 insertions(+), 27 deletions(-)

-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

