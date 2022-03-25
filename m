Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B254E6C24
	for <lists+linux-doc@lfdr.de>; Fri, 25 Mar 2022 02:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357596AbiCYBlO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Mar 2022 21:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358008AbiCYBj6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Mar 2022 21:39:58 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE504EA1A
        for <linux-doc@vger.kernel.org>; Thu, 24 Mar 2022 18:36:37 -0700 (PDT)
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KPl5K1wqhzfb2S;
        Fri, 25 Mar 2022 09:35:01 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Mar 2022 09:36:36 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 25 Mar
 2022 09:36:29 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH] docs/zh_CN: Add schedutil Chinese translation
Date:   Fri, 25 Mar 2022 10:10:51 +0800
Message-ID: <20220325021051.24958-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate scheduler/schedutil.rst into Chinese.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 .../translations/zh_CN/scheduler/index.rst    |   1 +
 .../zh_CN/scheduler/schedutil.rst             | 165 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/scheduler/schedutil.rst

diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
index 5c0e07aee299..a8eaa7325f54 100644
--- a/Documentation/translations/zh_CN/scheduler/index.rst
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -25,6 +25,7 @@ Linux调度器
     sched-domains
     sched-capacity
     sched-energy
+    schedutil
     sched-nice-design
     sched-stats
     sched-debug
diff --git a/Documentation/translations/zh_CN/scheduler/schedutil.rst b/Documentation/translations/zh_CN/scheduler/schedutil.rst
new file mode 100644
index 000000000000..82855ee3f66a
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/schedutil.rst
@@ -0,0 +1,165 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scheduler/schedutil.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+=========
+Schedutil
+=========
+
+.. note::
+
+   本文所有内容都假设频率和工作算力之间存在线性关系。我们知道这是有缺陷的，
+   但这是最可行的近似处理。
+
+PELT（实体负载跟踪，Per Entity Load Tracking）
+==============================================
+
+通过PELT，我们跟踪了各种调度器实体的一些指标，从单个任务到任务组分片到CPU
+运行队列。我们使用指数加权移动平均数（Exponentially Weighted Moving Average，
+EWMA）作为其基础，每个周期（1024us）都会衰减，衰减速率满足y^32 = 0.5。
+也就是说，最近的32ms贡献负载的一半，而历史上的其它时间则贡献另一半。
+
+具体而言：
+
+  ewma_sum(u) := u_0 + u_1*y + u_2*y^2 + ...
+
+  ewma(u) = ewma_sum(u) / ewma_sum(1)
+
+由于这本质上是一个无限几何级数的累加，结果是可组合的，即ewma(A) + ewma(B) = ewma(A+B)。
+这个属性是关键，因为它提供了在任务迁移时重新组合平均数的能力。
+
+请注意，阻塞态的任务仍然对累加值（任务组分片和CPU运行队列）有贡献，这反映了
+它们在恢复运行后的预期贡献。
+
+利用这一点，我们跟踪2个关键指标：“运行”和“可运行”。“运行”反映了一个调度实体
+在CPU上花费的时间，而“可运行”反映了一个调度实体在运行队列中花费的时间。当只有
+一个任务时，这两个指标是相同的，但一旦出现对CPU的争用，“运行”将减少以反映每个
+任务在CPU上花费的时间，而“可运行”将增加以反映争用的激烈程度。
+
+更多细节见：kernel/sched/pelt.c
+
+
+频率 / CPU不变性
+================
+
+因为CPU频率在1GHz时利用率为50%和CPU频率在2GHz时利用率为50%是不一样的，同样
+在小核上运行时利用率为50%和在大核上运行时利用率为50%是不一样的，我们允许架构
+以两个比率来伸缩时间差，其中一个是动态电压频率升降（Dynamic Voltage and
+Frequency Scaling，DVFS）比率，另一个是微架构比率。
+
+对于简单的DVFS架构（软件有完全控制能力），我们可以很容易地计算该比率为::
+
+            f_cur
+  r_dvfs := -----
+            f_max
+
+对于由硬件控制DVFS的更多动态系统，我们使用硬件计数器（Intel APERF/MPERF，
+ARMv8.4-AMU）来计算这一比率。具体到Intel，我们使用::
+
+           APERF
+  f_cur := ----- * P0
+           MPERF
+
+             4C-turbo;  如果可用并且使能了turbo
+  f_max := { 1C-turbo;  如果使能了turbo
+             P0;        其它情况
+
+                    f_cur
+  r_dvfs := min( 1, ----- )
+                    f_max
+
+我们选择4C turbo而不是1C turbo，以使其更持久性略微更强。
+
+r_cpu被定义为当前CPU的最高性能水平与系统中任何其它CPU的最高性能水平的比率。
+
+  r_tot = r_dvfs * r_cpu
+
+其结果是，上述“运行”和“可运行”的指标变成DVFS无关和CPU型号无关了。也就是说，
+我们可以在CPU之间转移和比较它们。
+
+更多细节见:
+
+ - kernel/sched/pelt.h:update_rq_clock_pelt()
+ - arch/x86/kernel/smpboot.c:"APERF/MPERF frequency ratio computation."
+ - Documentation/scheduler/sched-capacity.rst:"1. CPU Capacity + 2. Task utilization"
+
+
+UTIL_EST / UTIL_EST_FASTUP
+==========================
+
+由于周期性任务的平均数在睡眠时会衰减，而在运行时其预期利用率会和睡眠前相同，
+因此它们在再次运行后会面临（DVFS）的上涨。
+
+为了缓解这个问题，（一个默认使能的编译选项）UTIL_EST驱动一个无限脉冲响应
+（Infinite Impulse Response，IIR）的EWMA，“运行”值在出队时是最高的。
+另一个默认使能的编译选项UTIL_EST_FASTUP修改了IIR滤波器，使其允许立即增加，
+仅在利用率下降时衰减。
+
+进一步，运行队列的（可运行任务的）利用率之和由下式计算：
+
+  util_est := \Sum_t max( t_running, t_util_est_ewma )
+
+更多细节见: kernel/sched/fair.c:util_est_dequeue()
+
+
+UCLAMP
+======
+
+可以在每个CFS或RT任务上设置有效的u_min和u_max clamp值（译注：clamp可以理解
+为类似滤波器的能力，它定义了有效取值范围的最大值和最小值）；运行队列为所有正在
+运行的任务保持这些clamp的最大聚合值。
+
+更多细节见: include/uapi/linux/sched/types.h
+
+
+Schedutil / DVFS
+================
+
+每当调度器的负载跟踪被更新时（任务唤醒、任务迁移、时间流逝），我们都会调用
+schedutil来更新硬件DVFS状态。
+
+其基础是CPU运行队列的“运行”指标，根据上面的内容，它是CPU的频率不变的利用率
+估计值。由此我们计算出一个期望的频率，如下::
+
+             max( running, util_est );  如果使能UTIL_EST
+  u_cfs := { running;                   其它情况
+
+               clamp( u_cfs + u_rt, u_min, u_max );  如果使能UCLAMP_TASK
+  u_clamp := { u_cfs + u_rt;                         其它情况
+
+  u := u_clamp + u_irq + u_dl;		[估计值。更多细节见源代码]
+
+  f_des := min( f_max, 1.25 u * f_max )
+
+关于IO-wait的说明：当发生更新是因为任务从IO完成中唤醒时，我们提升上面的“u”。
+
+然后，这个频率被用来选择一个P-state或OPP，或者直接混入一个发给硬件的CPPC式
+请求。
+
+关于截止期限调度器的说明: 截止期限任务（偶发任务模型）使我们能够计算出满足
+工作负荷所需的硬f_min值。
+
+因为这些回调函数是直接来自调度器的，所以DVFS的硬件交互应该是“快速”和非阻塞的。
+在硬件交互缓慢和昂贵的时候，schedutil支持DVFS请求限速，不过会降低效率。
+
+更多信息见: kernel/sched/cpufreq_schedutil.c
+
+
+注意
+====
+
+ - 在低负载场景下，DVFS是最相关的，“运行”的值将密切反映利用率。
+
+ - 在负载饱和的场景下，任务迁移会导致一些瞬时性的使用率下降。假设我们有一个
+   CPU，有4个任务占用导致其饱和，接下来我们将一个任务迁移到另一个空闲CPU上，
+   旧的CPU的“运行”值将为0.75，而新的CPU将获得0.25。这是不可避免的，而且随着
+   时间流逝将自动修正。另注，由于没有空闲时间，我们还能保证f_max值吗？
+
+ - 上述大部分内容为，避免DVFS下滑，以及独立的DVFS域发生负载迁移时不得不
+   重新学习/提升频率。
+
-- 
2.17.1

