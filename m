Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3F0595BA7
	for <lists+linux-doc@lfdr.de>; Tue, 16 Aug 2022 14:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbiHPMUC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 16 Aug 2022 08:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbiHPMTs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Aug 2022 08:19:48 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F0B76C1C;
        Tue, 16 Aug 2022 05:19:41 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9225C113E;
        Tue, 16 Aug 2022 05:19:42 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.14.225])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 550183F66F;
        Tue, 16 Aug 2022 05:19:40 -0700 (PDT)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     lukasz.luba@arm.com, siyanteng@loongson.cn, alexs@kernel.org,
        corbet@lwn.net, peterz@infradead.org
Subject: [PATCH] docs: scheduler: Update new path for the sysctl knobs
Date:   Tue, 16 Aug 2022 13:19:07 +0100
Message-Id: <20220816121907.841-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_50,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add missing update for the documentation bit of some scheduler knob.
The knobs have been moved to /debug/sched/ location (with adjusted names).

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 Documentation/scheduler/sched-design-CFS.rst                    | 2 +-
 Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/scheduler/sched-design-CFS.rst b/Documentation/scheduler/sched-design-CFS.rst
index 59b2d1fb4dc4..03db55504515 100644
--- a/Documentation/scheduler/sched-design-CFS.rst
+++ b/Documentation/scheduler/sched-design-CFS.rst
@@ -94,7 +94,7 @@ other HZ detail.  Thus the CFS scheduler has no notion of "timeslices" in the
 way the previous scheduler had, and has no heuristics whatsoever.  There is
 only one central tunable (you have to switch on CONFIG_SCHED_DEBUG):
 
-   /proc/sys/kernel/sched_min_granularity_ns
+   /sys/kernel/debug/sched/min_granularity_ns
 
 which can be used to tune the scheduler from "desktop" (i.e., low latencies) to
 "server" (i.e., good batching) workloads.  It defaults to a setting suitable
diff --git a/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst b/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
index 26b0f36f793d..3076402406c4 100644
--- a/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
+++ b/Documentation/translations/zh_CN/scheduler/sched-design-CFS.rst
@@ -80,7 +80,7 @@ p->se.vruntime。一旦p->se.vruntime变得足够大，其它的任务将成为
 CFS使用纳秒粒度的计时，不依赖于任何jiffies或HZ的细节。因此CFS并不像之前的调度器那样
 有“时间片”的概念，也没有任何启发式的设计。唯一可调的参数（你需要打开CONFIG_SCHED_DEBUG）是：
 
-   /proc/sys/kernel/sched_min_granularity_ns
+   /sys/kernel/debug/sched/min_granularity_ns
 
 它可以用来将调度器从“桌面”模式（也就是低时延）调节为“服务器”（也就是高批处理）模式。
 它的默认设置是适合桌面的工作负载。SCHED_BATCH也被CFS调度器模块处理。
-- 
2.17.1

