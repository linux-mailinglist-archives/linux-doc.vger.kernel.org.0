Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F143153D617
	for <lists+linux-doc@lfdr.de>; Sat,  4 Jun 2022 10:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbiFDIXr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 4 Jun 2022 04:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbiFDIXq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Jun 2022 04:23:46 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7FF5001D
        for <linux-doc@vger.kernel.org>; Sat,  4 Jun 2022 01:23:44 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id b5so8375705plx.10
        for <linux-doc@vger.kernel.org>; Sat, 04 Jun 2022 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gVc2ROt3VZJaSei4lEakeeGLJbG5uUXJbLzBy9ooOuk=;
        b=1JSd9GB7wEj4YKQ0rpe41OxZqDdS40H/4SV2jgE4Vl1ERlQlPgGGjAV8NepqObc7Xi
         e6yhC/6o/ZKW2llrn3SG5GvqzIxAxrODbKBA+p7QAX5snJIMZoxg+g9xzQTOIexWMnwx
         7dbe1QHZLv8oBAjLErl++bSFB88xx225Lhg4lq7ce6V5RNwBu1PQQUxWZmoGcVfJJ0kO
         aIeQx88qY9SHhuCIh0VyPpqb072Z4/8q63MGTPlsGJ6b6sjmNBc19sFhJTi5YK44l29J
         q8zApnVczbRpzygGPkmbyYZX7qmLY5u8DhnH7jClu3WDC6ow6FXomGawqLpefomNdPZv
         TroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gVc2ROt3VZJaSei4lEakeeGLJbG5uUXJbLzBy9ooOuk=;
        b=f2TxvWq3z9lAjReVofFQUocCihqClI77BuqjK8b/YKcOeoRZ4GARlemxEsXWk/nVG2
         Q+GXaE92zuuuOLwvyBxNuood1VTTvzG441b4W9g7z+wMMpW5fNfGVoVRzQDkzKQq/Cbs
         zPbSTcgiJptqaH+izlsyj9B7/o9Ele7szD42LE7jr/Dze/0TDrJnJAr7GicxdmICmAlV
         BRI3s/FVwzPoCB+z46k5pgODmsIz8LHygKjuJhE1+cp/+73bpBNy0ibCNzIx3acXG0Ks
         dDy1DFB0J2BSdy6oxb3Rcf7hh1qdc4+2XnzzM1BJqGzaJOGK/WWX2g/vMkCn9nuiiSw/
         tf1A==
X-Gm-Message-State: AOAM533SKrNPAA7fnIVjHBWYEi/FYah0gUNQWLBTq8f79PM/KT6XtZiu
        VH8Iy9s4NdTSMjxpDYIWq8sYtA==
X-Google-Smtp-Source: ABdhPJznFObdaOP6dvRZZ53//CjHni+jtI87ASFORabOzFgN6puW1ce3WyaRaM2ue6sqx0jY622Rdg==
X-Received: by 2002:a17:90a:930b:b0:1d5:684b:8e13 with SMTP id p11-20020a17090a930b00b001d5684b8e13mr15032020pjo.153.1654331024388;
        Sat, 04 Jun 2022 01:23:44 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902760500b0015e8d4eb2b8sm6646378pll.258.2022.06.04.01.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 01:23:43 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     hannes@cmpxchg.org, roman.gushchin@linux.dev, shakeelb@google.com,
        songmuchun@bytedance.com, mhocko@kernel.org,
        akpm@linux-foundation.org, corbet@lwn.net
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2] mm: memcontrol: add {pgscan,pgsteal}_{kswapd,direct} items in memory.stat of cgroup v2
Date:   Sat,  4 Jun 2022 16:22:09 +0800
Message-Id: <20220604082209.55174-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are already statistics of {pgscan,pgsteal}_kswapd and
{pgscan,pgsteal}_direct of memcg event here, but now only the
sum of the two is displayed in memory.stat of cgroup v2.

In order to obtain more accurate information during monitoring
and debugging, and to align with the display in /proc/vmstat,
it better to display {pgscan,pgsteal}_kswapd and
{pgscan,pgsteal}_direct separately.

Also, for forward compatibility, we still display pgscan and
pgsteal items so that it won't break existing applications.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
Acked-by: Muchun Song <songmuchun@bytedance.com>
---
Changelog in v1 -> v2:
 - keep pgscan and pgsteal items for forward compatibility, thanks to Shakeel
 - update commit log
 - collect Acked-bys

 Documentation/admin-guide/cgroup-v2.rst | 12 ++++++
 mm/memcontrol.c                         | 54 ++++++++++++-------------
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 176298f2f4de..b2b55e7360d8 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1445,9 +1445,21 @@ PAGE_SIZE multiple when read back.
 	  pgscan (npn)
 		Amount of scanned pages (in an inactive LRU list)
 
+	  pgscan_kswapd (npn)
+		Amount of scanned pages by kswapd (in an inactive LRU list)
+
+	  pgscan_direct (npn)
+		Amount of scanned pages directly  (in an inactive LRU list)
+
 	  pgsteal (npn)
 		Amount of reclaimed pages
 
+	  pgsteal_kswapd (npn)
+		Amount of reclaimed pages by kswapd
+
+	  pgsteal_direct (npn)
+		Amount of reclaimed pages directly
+
 	  pgactivate (npn)
 		Amount of pages moved to the active LRU list
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 0d3fe0a0c75a..fd78c4d6bbc7 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1460,6 +1460,28 @@ static inline unsigned long memcg_page_state_output(struct mem_cgroup *memcg,
 	return memcg_page_state(memcg, item) * memcg_page_state_unit(item);
 }
 
+static const unsigned int memcg_vm_event_stat[] = {
+	PGSCAN_KSWAPD,
+	PGSCAN_DIRECT,
+	PGSTEAL_KSWAPD,
+	PGSTEAL_DIRECT,
+	PGFAULT,
+	PGMAJFAULT,
+	PGREFILL,
+	PGACTIVATE,
+	PGDEACTIVATE,
+	PGLAZYFREE,
+	PGLAZYFREED,
+#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
+	ZSWPIN,
+	ZSWPOUT,
+#endif
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	THP_FAULT_ALLOC,
+	THP_COLLAPSE_ALLOC,
+#endif
+};
+
 static char *memory_stat_format(struct mem_cgroup *memcg)
 {
 	struct seq_buf s;
@@ -1495,41 +1517,17 @@ static char *memory_stat_format(struct mem_cgroup *memcg)
 	}
 
 	/* Accumulated memory events */
-
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(PGFAULT),
-		       memcg_events(memcg, PGFAULT));
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(PGMAJFAULT),
-		       memcg_events(memcg, PGMAJFAULT));
-	seq_buf_printf(&s, "%s %lu\n",  vm_event_name(PGREFILL),
-		       memcg_events(memcg, PGREFILL));
 	seq_buf_printf(&s, "pgscan %lu\n",
 		       memcg_events(memcg, PGSCAN_KSWAPD) +
 		       memcg_events(memcg, PGSCAN_DIRECT));
 	seq_buf_printf(&s, "pgsteal %lu\n",
 		       memcg_events(memcg, PGSTEAL_KSWAPD) +
 		       memcg_events(memcg, PGSTEAL_DIRECT));
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(PGACTIVATE),
-		       memcg_events(memcg, PGACTIVATE));
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(PGDEACTIVATE),
-		       memcg_events(memcg, PGDEACTIVATE));
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(PGLAZYFREE),
-		       memcg_events(memcg, PGLAZYFREE));
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(PGLAZYFREED),
-		       memcg_events(memcg, PGLAZYFREED));
-
-#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(ZSWPIN),
-		       memcg_events(memcg, ZSWPIN));
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(ZSWPOUT),
-		       memcg_events(memcg, ZSWPOUT));
-#endif
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(THP_FAULT_ALLOC),
-		       memcg_events(memcg, THP_FAULT_ALLOC));
-	seq_buf_printf(&s, "%s %lu\n", vm_event_name(THP_COLLAPSE_ALLOC),
-		       memcg_events(memcg, THP_COLLAPSE_ALLOC));
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+	for (i = 0; i < ARRAY_SIZE(memcg_vm_event_stat); i++)
+		seq_buf_printf(&s, "%s %lu\n",
+			       vm_event_name(memcg_vm_event_stat[i]),
+			       memcg_events(memcg, memcg_vm_event_stat[i]));
 
 	/* The above should easily fit into one page */
 	WARN_ON_ONCE(seq_buf_has_overflowed(&s));
-- 
2.20.1

