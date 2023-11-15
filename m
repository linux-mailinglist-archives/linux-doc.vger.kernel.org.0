Return-Path: <linux-doc+bounces-1740-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF3F7E2BF2
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 19:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD79D1C20C7E
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 18:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E822C866;
	Mon,  6 Nov 2023 18:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aW3nFXg7"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F408E2D02B;
	Mon,  6 Nov 2023 18:32:02 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5124FD49;
	Mon,  6 Nov 2023 10:32:01 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc330e8f58so33580215ad.3;
        Mon, 06 Nov 2023 10:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699295521; x=1699900321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RolW8kmfT6ZCz66bTNAjEmvRmOGj5ZqsnmWESYphJzc=;
        b=aW3nFXg7W2ZCtG249zntt53EABbUFmLyOWq1xU3YFouZ+/cjAdLhr3/TTUPVBx5/QE
         vFG7MiqiBvCrCmGhOP7d/e1oee+2R9nIXMAGq8KrsbdXGWeUQ5OWBQqGooMocH3ewtOq
         pa1COWQj1ODDIzu8V8enTiFwh9cFHi0jwlHoamhT2icH7jwyvZ1lw72i0wuSe+oC7VEH
         5Ui3ip+lF23Y1Kxm3L597x3atJq8yucY9lBWceTDWVDHkVT0dOqh16oM97a5AOAsHIjN
         +I8O7UVcaOq/yTnRDjm0Ec+64+AQKAqtTHRqiRA350kPj8fgjieu7H6wjnPICBMLcidu
         55Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699295521; x=1699900321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RolW8kmfT6ZCz66bTNAjEmvRmOGj5ZqsnmWESYphJzc=;
        b=Cpgl65TuxkHH+srSegdn4W5l8ycTCaEdUy1xqdklQeQ9wrTZ7g5Dix9ox6eY1Ak4+M
         to7GO07XTQhWFocXHvdPrGdhndu7jo2Kz0RfysQmxufukfvC9lCOI91J8IbynGVq4YdD
         VbRKTTQPNO6d6Q17YUjLFGhHS5pV2tkAQwC/9vMbURMQ1E8eLL2ffhyjcfZm9VHIuLf7
         zKOHbZHxyVcbHZErbaN01aa0sHbcxZqXX0ypcvierhtgV11hnVAgCIDOobuPElbKyG5d
         wEbFnGUJEd/v9lN6bobD/cwRD6mwm2MKsayt+f1zMjUxyu9hzgYDJHRKAPUKUDZdY1jy
         xrlQ==
X-Gm-Message-State: AOJu0YwRal6Q7FKoLcb8NGpW9LH4Nu+OwU28al+WVp11rHYBpMEX+AU5
	gKWjo3tedJhUZuz0gtAuOOc=
X-Google-Smtp-Source: AGHT+IGdvV5WuqZ+RWDIMrRsDenhCX5seXleE023kFPddMhxXei7cSUD1PW2U+fLmxlxyMLTKt2JeQ==
X-Received: by 2002:a17:903:2013:b0:1cc:251c:c381 with SMTP id s19-20020a170903201300b001cc251cc381mr19680064pla.29.1699295520329;
        Mon, 06 Nov 2023 10:32:00 -0800 (PST)
Received: from localhost (fwdproxy-prn-020.fbsv.net. [2a03:2880:ff:14::face:b00c])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e5ce00b001c9b35287aesm6213048plf.88.2023.11.06.10.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:31:59 -0800 (PST)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	cerasuolodomenico@gmail.com,
	yosryahmed@google.com,
	sjenning@redhat.com,
	ddstreet@ieee.org,
	vitaly.wool@konsulko.com,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeelb@google.com,
	muchun.song@linux.dev,
	chrisl@kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Subject: [PATCH v5 0/6] workload-specific and memory pressure-driven zswap writeback
Date: Mon,  6 Nov 2023 10:31:53 -0800
Message-Id: <20231106183159.3562879-1-nphamcs@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
v5:
   * Replace reference getting with an rcu_read_lock() section for
     zswap lru modifications (suggested by Yosry)
   * Add a new prep patch that allows mem_cgroup_iter() to return
     online cgroup.
   * Add a callback that updates pool->next_shrink when the cgroup is
     offlined (suggested by Yosry Ahmed, Johannes Weiner)
v4:
   * Rename list_lru_add to list_lru_add_obj and __list_lru_add to
     list_lru_add (patch 1) (suggested by Johannes Weiner and
	 Yosry Ahmed)
   * Some cleanups on the memcg aware LRU patch (patch 2)
     (suggested by Yosry Ahmed)
   * Use event interface for the new per-cgroup writeback counters.
     (patch 3) (suggested by Yosry Ahmed)
   * Abstract zswap's lruvec states and handling into 
     zswap_lruvec_state (patch 5) (suggested by Yosry Ahmed)
v3:
   * Add a patch to export per-cgroup zswap writeback counters
   * Add a patch to update zswap's kselftest
   * Separate the new list_lru functions into its own prep patch
   * Do not start from the top of the hierarchy when encounter a memcg
     that is not online for the global limit zswap writeback (patch 2)
     (suggested by Yosry Ahmed)
   * Do not remove the swap entry from list_lru in
     __read_swapcache_async() (patch 2) (suggested by Yosry Ahmed)
   * Removed a redundant zswap pool getting (patch 2)
     (reported by Ryan Roberts)
   * Use atomic for the nr_zswap_protected (instead of lruvec's lock)
     (patch 5) (suggested by Yosry Ahmed)
   * Remove the per-cgroup zswap shrinker knob (patch 5)
     (suggested by Yosry Ahmed)
v2:
   * Fix loongarch compiler errors
   * Use pool stats instead of memcg stats when !CONFIG_MEMCG_KEM

There are currently several issues with zswap writeback:

1. There is only a single global LRU for zswap, making it impossible to
   perform worload-specific shrinking - an memcg under memory pressure
   cannot determine which pages in the pool it owns, and often ends up
   writing pages from other memcgs. This issue has been previously
   observed in practice and mitigated by simply disabling
   memcg-initiated shrinking:

   https://lore.kernel.org/all/20230530232435.3097106-1-nphamcs@gmail.com/T/#u

   But this solution leaves a lot to be desired, as we still do not
   have an avenue for an memcg to free up its own memory locked up in
   the zswap pool.

2. We only shrink the zswap pool when the user-defined limit is hit.
   This means that if we set the limit too high, cold data that are
   unlikely to be used again will reside in the pool, wasting precious
   memory. It is hard to predict how much zswap space will be needed
   ahead of time, as this depends on the workload (specifically, on
   factors such as memory access patterns and compressibility of the
   memory pages).

This patch series solves these issues by separating the global zswap
LRU into per-memcg and per-NUMA LRUs, and performs workload-specific
(i.e memcg- and NUMA-aware) zswap writeback under memory pressure. The
new shrinker does not have any parameter that must be tuned by the
user, and can be opted in or out on a per-memcg basis.

As a proof of concept, we ran the following synthetic benchmark:
build the linux kernel in a memory-limited cgroup, and allocate some
cold data in tmpfs to see if the shrinker could write them out and
improved the overall performance. Depending on the amount of cold data
generated, we observe from 14% to 35% reduction in kernel CPU time used
in the kernel builds.

Domenico Cerasuolo (3):
  zswap: make shrinking memcg-aware
  mm: memcg: add per-memcg zswap writeback stat
  selftests: cgroup: update per-memcg zswap writeback selftest

Nhat Pham (3):
  list_lru: allows explicit memcg and NUMA node selection
  memcontrol: allows mem_cgroup_iter() to check for onlineness
  zswap: shrinks zswap pool based on memory pressure

 Documentation/admin-guide/mm/zswap.rst      |   7 +
 drivers/android/binder_alloc.c              |   5 +-
 fs/dcache.c                                 |   8 +-
 fs/gfs2/quota.c                             |   6 +-
 fs/inode.c                                  |   4 +-
 fs/nfs/nfs42xattr.c                         |   8 +-
 fs/nfsd/filecache.c                         |   4 +-
 fs/xfs/xfs_buf.c                            |   6 +-
 fs/xfs/xfs_dquot.c                          |   2 +-
 fs/xfs/xfs_qm.c                             |   2 +-
 include/linux/list_lru.h                    |  46 ++-
 include/linux/memcontrol.h                  |   9 +-
 include/linux/mmzone.h                      |   2 +
 include/linux/vm_event_item.h               |   1 +
 include/linux/zswap.h                       |  27 +-
 mm/list_lru.c                               |  48 ++-
 mm/memcontrol.c                             |  20 +-
 mm/mmzone.c                                 |   1 +
 mm/shrinker.c                               |   4 +-
 mm/swap.h                                   |   3 +-
 mm/swap_state.c                             |  26 +-
 mm/vmscan.c                                 |  26 +-
 mm/vmstat.c                                 |   1 +
 mm/workingset.c                             |   4 +-
 mm/zswap.c                                  | 430 +++++++++++++++++---
 tools/testing/selftests/cgroup/test_zswap.c |  74 ++--
 26 files changed, 625 insertions(+), 149 deletions(-)

-- 
2.34.1

