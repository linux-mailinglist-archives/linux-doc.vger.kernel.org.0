Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6F8D50E906
	for <lists+linux-doc@lfdr.de>; Mon, 25 Apr 2022 21:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244790AbiDYTEG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Apr 2022 15:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244804AbiDYTED (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Apr 2022 15:04:03 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1ACE49C7
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:00:55 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id t15-20020a17090ae50f00b001d925488489so54428pjy.3
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=fBFNWoBuZ+rUFYDa2D6wGphqTYvQjamUdIjSsw6TIq0=;
        b=smHSwP6GCAdbnpTWe49B9oKF0iYhl1bzB1K3BDIn9UhpSm9W7gWtmt2DRS6JQKMy8o
         BajDe1FI0jRx+0D1XfBG9Tjf8xi8/2gRrmgadMgDjdPr01tIohPi8twnF3DK6BGgIVvi
         3yOdRTAnVNgeawrn30eQ9SYwTdBmFzJ6tY5eY0W6C6U4q9dlHlnFVJU6QSb8bqBoq2P5
         R85Z1HAt6KgkwQKubfSsF9s5YBGQN4nGEmwB9Jg3JkRFLErxcvUGrbweooRE4a+KXyK+
         F2xMNNMm5DykM7dmSOdrjgcVgow14TDKqX495S1XlPEkUL5iomDIlLABrbbmXI8Ja1Oe
         JrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=fBFNWoBuZ+rUFYDa2D6wGphqTYvQjamUdIjSsw6TIq0=;
        b=3bhuyLSQ3Y4qiz8iVLqXLYtMJJw5zfZ4ajv750Q2d+ypEpJ9yyJjsxuZiraNxiIZwb
         92mre5+NcIBdy1LVUJWhNSzxqYHD1duHHjB7Pm093r/CdYN7403AB0yIbUARhe9/iNi4
         zHjdj7rnXmtGwY4HxFgPgp/6EdtUHKOh0NHLEhaBHP7eEGL0EByNhg83aT1KBD3J2u0C
         9Z100aIAHBKPrD+nMFTXdNbM8l9uilKeEKw14OrFCY5EwX4+zRrse9iYYEH3bbjAmTsO
         wGH+Dr2D3yQCpvorBG8lLh2RyC8BgDSZvbvZ2NKm/IE0TvP7keHF+qA9Np65QfHpZeka
         x76Q==
X-Gm-Message-State: AOAM533xFlAfTARKLJF1sK3piRaqKPKR7H3++q8vjrdC/IniuITv91/m
        Wjfm6Mk6+H2uAh/3elOKrIEfeZIIMDMLc5Ej
X-Google-Smtp-Source: ABdhPJxt8xE4NWnQfnST2T2fwscg58NT92N6YrUwlKz1bvN3nvLWPKcU8F4b6X/rtWS2BqN9NjKAgFqXj2Zk/cq6
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a65:6e88:0:b0:39d:2647:f75d with SMTP
 id bm8-20020a656e88000000b0039d2647f75dmr16444204pgb.523.1650913255418; Mon,
 25 Apr 2022 12:00:55 -0700 (PDT)
Date:   Mon, 25 Apr 2022 19:00:37 +0000
In-Reply-To: <20220425190040.2475377-1-yosryahmed@google.com>
Message-Id: <20220425190040.2475377-2-yosryahmed@google.com>
Mime-Version: 1.0
References: <20220425190040.2475377-1-yosryahmed@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v5 1/4] memcg: introduce per-memcg reclaim interface
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
        Yosry Ahmed <yosryahmed@google.com>,
        Michal Hocko <mhocko@suse.com>
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

From: Shakeel Butt <shakeelb@google.com>

Introduce a memcg interface to trigger memory reclaim on a memory cgroup.

Use case: Proactive Reclaim
---------------------------

A userspace proactive reclaimer can continuously probe the memcg to
reclaim a small amount of memory. This gives more accurate and
up-to-date workingset estimation as the LRUs are continuously
sorted and can potentially provide more deterministic memory
overcommit behavior. The memory overcommit controller can provide
more proactive response to the changing behavior of the running
applications instead of being reactive.

A userspace reclaimer's purpose in this case is not a complete replacement
for kswapd or direct reclaim, it is to proactively identify memory savings
opportunities and reclaim some amount of cold pages set by the policy
to free up the memory for more demanding jobs or scheduling new jobs.

A user space proactive reclaimer is used in Google data centers.
Additionally, Meta's TMO paper recently referenced a very similar
interface used for user space proactive reclaim:
https://dl.acm.org/doi/pdf/10.1145/3503222.3507731

Benefits of a user space reclaimer:
-----------------------------------

1) More flexible on who should be charged for the cpu of the memory
reclaim. For proactive reclaim, it makes more sense to be centralized.

2) More flexible on dedicating the resources (like cpu). The memory
overcommit controller can balance the cost between the cpu usage and
the memory reclaimed.

3) Provides a way to the applications to keep their LRUs sorted, so,
under memory pressure better reclaim candidates are selected. This also
gives more accurate and uptodate notion of working set for an
application.

Why memory.high is not enough?
------------------------------

- memory.high can be used to trigger reclaim in a memcg and can
  potentially be used for proactive reclaim.
  However there is a big downside in using memory.high. It can potentially
  introduce high reclaim stalls in the target application as the
  allocations from the processes or the threads of the application can hit
  the temporary memory.high limit.

- Userspace proactive reclaimers usually use feedback loops to decide
  how much memory to proactively reclaim from a workload. The metrics
  used for this are usually either refaults or PSI, and these metrics
  will become messy if the application gets throttled by hitting the
  high limit.

- memory.high is a stateful interface, if the userspace proactive
  reclaimer crashes for any reason while triggering reclaim it can leave
  the application in a bad state.

- If a workload is rapidly expanding, setting memory.high to proactively
  reclaim memory can result in actually reclaiming more memory than
  intended.

The benefits of such interface and shortcomings of existing interface
were further discussed in this RFC thread:
https://lore.kernel.org/linux-mm/5df21376-7dd1-bf81-8414-32a73cea45dd@google.com/

Interface:
----------

Introducing a very simple memcg interface 'echo 10M > memory.reclaim' to
trigger reclaim in the target memory cgroup.

The interface is introduced as a nested-keyed file to allow for future
optional arguments to be easily added to configure the behavior of
reclaim.

Possible Extensions:
--------------------

- This interface can be extended with an additional parameter or flags
  to allow specifying one or more types of memory to reclaim from (e.g.
  file, anon, ..).

- The interface can also be extended with a node mask to reclaim from
  specific nodes. This has use cases for reclaim-based demotion in memory
  tiering systens.

- A similar per-node interface can also be added to support proactive
  reclaim and reclaim-based demotion in systems without memcg.

- Add a timeout parameter to make it easier for user space to call the
  interface without worrying about being blocked for an undefined amount
  of time.

For now, let's keep things simple by adding the basic functionality.

[yosryahmed@google.com: worked on versions v2 onwards, refreshed to
current master, updated commit message based on recent
discussions and use cases]

Signed-off-by: Shakeel Butt <shakeelb@google.com>
Co-developed-by: Yosry Ahmed <yosryahmed@google.com>
Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Michal Hocko <mhocko@suse.com>
Acked-by: Wei Xu <weixugc@google.com>
Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
---
 Documentation/admin-guide/cgroup-v2.rst | 21 ++++++++++++
 mm/memcontrol.c                         | 45 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 69d7a6983f78..19bcd73cad03 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1208,6 +1208,27 @@ PAGE_SIZE multiple when read back.
 	high limit is used and monitored properly, this limit's
 	utility is limited to providing the final safety net.
 
+  memory.reclaim
+	A write-only nested-keyed file which exists for all cgroups.
+
+	This is a simple interface to trigger memory reclaim in the
+	target cgroup.
+
+	This file accepts a single key, the number of bytes to reclaim.
+	No nested keys are currently supported.
+
+	Example::
+
+	  echo "1G" > memory.reclaim
+
+	The interface can be later extended with nested keys to
+	configure the reclaim behavior. For example, specify the
+	type of memory to reclaim from (anon, file, ..).
+
+	Please note that the kernel can over or under reclaim from
+	the target cgroup. If less bytes are reclaimed than the
+	specified amount, -EAGAIN is returned.
+
   memory.oom.group
 	A read-write single value file which exists on non-root
 	cgroups.  The default value is "0".
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 725f76723220..879f1716d6e9 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6355,6 +6355,46 @@ static ssize_t memory_oom_group_write(struct kernfs_open_file *of,
 	return nbytes;
 }
 
+static ssize_t memory_reclaim(struct kernfs_open_file *of, char *buf,
+			      size_t nbytes, loff_t off)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
+	unsigned int nr_retries = MAX_RECLAIM_RETRIES;
+	unsigned long nr_to_reclaim, nr_reclaimed = 0;
+	int err;
+
+	buf = strstrip(buf);
+	err = page_counter_memparse(buf, "", &nr_to_reclaim);
+	if (err)
+		return err;
+
+	while (nr_reclaimed < nr_to_reclaim) {
+		unsigned long reclaimed;
+
+		if (signal_pending(current))
+			return -EINTR;
+
+		/*
+		 * This is the final attempt, drain percpu lru caches in the
+		 * hope of introducing more evictable pages for
+		 * try_to_free_mem_cgroup_pages().
+		 */
+		if (!nr_retries)
+			lru_add_drain_all();
+
+		reclaimed = try_to_free_mem_cgroup_pages(memcg,
+						nr_to_reclaim - nr_reclaimed,
+						GFP_KERNEL, true);
+
+		if (!reclaimed && !nr_retries--)
+			return -EAGAIN;
+
+		nr_reclaimed += reclaimed;
+	}
+
+	return nbytes;
+}
+
 static struct cftype memory_files[] = {
 	{
 		.name = "current",
@@ -6413,6 +6453,11 @@ static struct cftype memory_files[] = {
 		.seq_show = memory_oom_group_show,
 		.write = memory_oom_group_write,
 	},
+	{
+		.name = "reclaim",
+		.flags = CFTYPE_NS_DELEGATABLE,
+		.write = memory_reclaim,
+	},
 	{ }	/* terminate */
 };
 
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

