Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479DA39328B
	for <lists+linux-doc@lfdr.de>; Thu, 27 May 2021 17:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbhE0Pkn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 May 2021 11:40:43 -0400
Received: from foss.arm.com ([217.140.110.172]:59500 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234149AbhE0Pkh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 May 2021 11:40:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0B2111D4;
        Thu, 27 May 2021 08:39:03 -0700 (PDT)
Received: from e120325.arm.com (unknown [10.57.84.138])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 656633F73B;
        Thu, 27 May 2021 08:39:02 -0700 (PDT)
From:   Beata Michalska <beata.michalska@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, valentin.schneider@arm.com,
        dietmar.eggemann@arm.com, corbet@lwn.net, rdunlap@infradead.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v6 1/3] sched/core: Introduce SD_ASYM_CPUCAPACITY_FULL sched_domain flag
Date:   Thu, 27 May 2021 16:38:40 +0100
Message-Id: <20210527153842.17567-2-beata.michalska@arm.com>
In-Reply-To: <20210527153842.17567-1-beata.michalska@arm.com>
References: <20210527153842.17567-1-beata.michalska@arm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Introducing new, complementary to SD_ASYM_CPUCAPACITY, sched_domain
topology flag, to distinguish between shed_domains where any CPU
capacity asymmetry is detected (SD_ASYM_CPUCAPACITY) and ones where
a full set of CPU capacities is visible to all domain members
(SD_ASYM_CPUCAPACITY_FULL).

With the distinction between full and partial CPU capacity asymmetry,
brought in by the newly introduced flag, the scope of the original
SD_ASYM_CPUCAPACITY flag gets shifted, still maintaining the existing
behaviour when one is detected on a given sched domain, allowing
misfit migrations within sched domains that do not observe full range
of CPU capacities but still do have members with different capacity
values. It loses though it's meaning when it comes to the lowest CPU
asymmetry sched_domain level per-cpu pointer, which is to be now
denoted by SD_ASYM_CPUCAPACITY_FULL flag.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
---
 include/linux/sched/sd_flags.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/sched/sd_flags.h b/include/linux/sched/sd_flags.h
index 34b21e971d77..57bde66d95f7 100644
--- a/include/linux/sched/sd_flags.h
+++ b/include/linux/sched/sd_flags.h
@@ -90,6 +90,16 @@ SD_FLAG(SD_WAKE_AFFINE, SDF_SHARED_CHILD)
  */
 SD_FLAG(SD_ASYM_CPUCAPACITY, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
 
+/*
+ * Domain members have different CPU capacities spanning all unique CPU
+ * capacity values.
+ *
+ * SHARED_PARENT: Set from the topmost domain down to the first domain where
+ *		  all available CPU capacities are visible
+ * NEEDS_GROUPS: Per-CPU capacity is asymmetric between groups.
+ */
+SD_FLAG(SD_ASYM_CPUCAPACITY_FULL, SDF_SHARED_PARENT | SDF_NEEDS_GROUPS)
+
 /*
  * Domain members share CPU capacity (i.e. SMT)
  *
-- 
2.17.1

