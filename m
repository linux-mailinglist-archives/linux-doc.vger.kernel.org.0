Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04AC24AB34F
	for <lists+linux-doc@lfdr.de>; Mon,  7 Feb 2022 03:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240941AbiBGCLG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 6 Feb 2022 21:11:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbiBGCLG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Feb 2022 21:11:06 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957DEC061A73
        for <linux-doc@vger.kernel.org>; Sun,  6 Feb 2022 18:11:04 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JsTdg3n9rzccjN;
        Mon,  7 Feb 2022 09:51:35 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Feb 2022 09:52:34 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Mon, 7 Feb
 2022 09:52:33 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH] docs/zh_CN: Add sched-energy Chinese translation
Date:   Mon, 7 Feb 2022 10:25:21 +0800
Message-ID: <20220207022521.27487-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate scheduler/sched-energy.rst into Chinese.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 .../translations/zh_CN/scheduler/index.rst    |   4 +-
 .../zh_CN/scheduler/sched-energy.rst          | 351 ++++++++++++++++++
 2 files changed, 353 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-energy.rst

diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
index f8f8f35d53c7..ab7925980266 100644
--- a/Documentation/translations/zh_CN/scheduler/index.rst
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -5,6 +5,7 @@
 :翻译:
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
 
 :校译:
 
@@ -23,13 +24,12 @@ Linux调度器
     sched-design-CFS
     sched-domains
     sched-capacity
+    sched-energy
 
 
 TODOList:
 
-    sched-bwc
     sched-deadline
-    sched-energy
     sched-nice-design
     sched-rt-group
     sched-stats
diff --git a/Documentation/translations/zh_CN/scheduler/sched-energy.rst b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
new file mode 100644
index 000000000000..5ea3980b0ebd
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
@@ -0,0 +1,351 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scheduler/sched-energy.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+============
+能量感知调度
+============
+
+1. 简介
+-------
+
+能量感知调度（EAS）使调度器有能力预测其决策对CPU所消耗的能量的影响。EAS依靠
+一个能量模型（EM）来为每个任务选择一个节能的CPU，同时最小化对吞吐率的影响。
+本文档致力于介绍介绍EAS是如何工作的，它背后的主要设计决策是什么，以及使其运行
+所需的条件细节。
+
+在进一步阅读之前，请注意，在撰写本文时::
+
+   /!\ EAS不支持对称CPU拓扑的平台 /!\
+
+EAS只在异构CPU拓扑结构（如Arm大小核，big.LITTLE）上运行。因为在这种情况下，
+通过调度来节约能量的潜力是最大的。
+
+EAS实际使用的EM不是由调度器维护的，而是一个专门的框架。关于这个框架的细节和
+它提供的内容，请参考其文档（见Documentation/power/energy-model.rst）。
+
+
+2. 背景和术语
+-------------
+
+从一开始就说清楚定义:
+ - 能量 = [焦耳] （比如供电设备上的电池提供的资源）
+ - 功率 = 能量/时间 = [焦耳/秒] = [瓦特]
+
+ EAS的目标是最小化能量，同时仍能将工作完成。也就是说，我们要最大化::
+
+	性能 [指令数/秒]
+	----------------
+	   功率 [瓦特]
+
+它等效于最小化::
+
+	能量 [焦耳]
+	-----------
+	   指令数
+
+同时仍然获得“良好”的性能。当前调度器只考虑性能目标，因此该式子本质上是一个
+可选的优化目标，它同时考虑了两个目标：能量效率和性能。
+
+引入EM的想法是为了让调度器评估其决策的影响，而不是盲目地应用可能仅在部分
+平台有正面效果的节能技术。同时，EM必须尽可能的简单，以最小化调度器的时延
+影响。
+
+简而言之，EAS改变了CFS任务分配给CPU的方式。当调度器决定一个任务应该在哪里
+运行时（在唤醒期间），EM被用来在不损害系统吞吐率的情况下，从几个较好的候选
+CPU中挑选一个经预测能量消耗最优的CPU。EAS的预测依赖于对平台拓扑结构特定元素
+的了解，包括CPU的“算力”，以及它们各自的能量成本。
+
+
+3. 拓扑信息
+-----------
+
+EAS（以及调度器的剩余部分）使用“算力”的概念来区分不同计算吞吐率的CPU。一个
+CPU的“算力”代表了它在最高频率下运行时能完成的工作量，且这个值是相对系统中
+算力最大的CPU而言的。算力值被归一化为1024以内，并且可与由实体负载跟踪
+（PELT）机制算出的利用率信号做对比。由于有算力值和利用率值，EAS能够估计一个
+任务/CPU有多大/有多忙，并在评估性能与能量时将其考虑在内。CPU算力由特定体系
+结构实现的arch_scale_cpu_capacity()回调函数提供。
+
+EAS使用的其余平台信息是直接从能量模型（EM）框架中读取的。一个平台的EM是一张
+表，表中每项代表系统中一个“性能域”的功率成本。（若要了解更多关于性能域的细节，
+见文档/power/energy-model.rst）
+
+当调度域被建立或重新建立时，调度器管理对拓扑代码中EM对象的引用。对于每个根域
+（rd），调度器维护一个与当前rd->span相交的所有性能域的单向链表。链表中的每个
+节点都包含一个指向EM框架所提供的结构体em_perf_domain的指针。
+
+链表被附加在根域上，以应对独占的cpuset的配置。由于独占的cpuset的边界不一定与
+性能域的边界一致，不同根域的链表可能包含重复的元素。
+
+示例1
+    让我们考虑一个有12个CPU的平台，分成3个性能域，（pd0，pd4和pd8），按以下
+    方式组织::
+
+	          CPUs:   0 1 2 3 4 5 6 7 8 9 10 11
+	          PDs:   |--pd0--|--pd4--|---pd8---|
+	          RDs:   |----rd1----|-----rd2-----|
+
+    现在，考虑用户空间决定将系统分成两个独占的cpusets，因此创建了两个独立的根域，
+    每个根域包含6个CPU。这两个根域在上图中被表示为rd1和rd2。由于pd4与rd1和rd2
+    都有交集，它将同时出现于附加在这两个根域的“->pd”链表中:
+
+       * rd1->pd: pd0 -> pd4
+       * rd2->pd: pd4 -> pd8
+
+    请注意，调度器将为pd4创建两个重复的链表节点（每个链表中各一个）。然而这
+    两个节点持有指向同一个EM框架的共享数据结构的指针。
+
+由于对这些链表的访问可能与热插拔及其它事件并发发生，因此它们受RCU锁保护，就像
+被调度器操控的拓扑结构中剩下字段一样。
+
+EAS同样维护了一个静态键（sched_energy_present），当至少有一个根域满足EAS
+启动的所有条件时，这个键就会被启动。在第6节中总结了这些条件。
+
+
+4. 能量感知任务放置
+-------------------
+
+EAS覆盖了CFS的任务唤醒平衡代码。在唤醒平衡时，它使用平台的EM和PELT信号来选择节能
+的目标CPU。当EAS被启用时，select_task_rq_fair()调用find_energy_efficient_cpu()
+来做任务放置决定。这个函数寻找在每个性能域中寻找具有最高剩余算力（CPU算力 - CPU
+利用率）的CPU，因为它能让我们保持最低的频率。然后，该函数检查将任务放在新CPU相较
+依然放在之前活动的prev_cpu是否可以节省能量。
+
+find_energy_efficient_cpu()使用compute_energy()来估算如果唤醒的任务被迁移，
+系统将消耗多少能量。compute_energy()检查各CPU当前的利用率情况，并尝试调整来
+“模拟”任务迁移。EM框架提供了API em_pd_energy()计算每个性能域在给定的利用率条件
+下的预期能量消耗。
+
+下面详细介绍一个优化能量消耗的任务放置决策的例子。
+
+示例2
+    让我们考虑一个有两个独立性能域的（伪）平台，每个性能域含有2个CPU。CPU0和CPU1
+    是小核，CPU2和CPU3是大核。
+
+    调度器必须决定将任务P放在哪个CPU上，这个任务的util_avg = 200（平均利用率），
+    prev_cpu = 0（上一次运行在CPU0）。
+
+    目前CPU的利用率情况如下图所示。CPU 0-3的util_avg分别为400、100、600和500。
+    每个性能域有三个操作性能值（OPP）。与每个OPP相关的CPU算力和功率成本列在能量
+    模型表中。P的util_avg在图中显示为"PP"::
+
+     CPU util.
+      1024                 - - - - - - -              Energy Model
+                                               +-----------+-------------+
+                                               |  Little   |     Big     |
+       768                 =============       +-----+-----+------+------+
+                                               | Cap | Pwr | Cap  | Pwr  |
+                                               +-----+-----+------+------+
+       512  ===========    - ##- - - - -       | 170 | 50  | 512  | 400  |
+                             ##     ##         | 341 | 150 | 768  | 800  |
+       341  -PP - - - -      ##     ##         | 512 | 300 | 1024 | 1700 |
+             PP              ##     ##         +-----+-----+------+------+
+       170  -## - - - -      ##     ##
+             ##     ##       ##     ##
+           ------------    -------------
+            CPU0   CPU1     CPU2   CPU3
+
+      Current OPP: =====       Other OPP: - - -     util_avg (100 each): ##
+
+
+    find_energy_efficient_cpu()将首先在两个性能域中寻找具有最大剩余算力的CPU。
+    在这个例子中是CPU1和CPU3。然后，它将估算，当P被放在它们中的任意一个时，系统的
+    能耗，并检查这样做是否会比把P放在CPU0上节省一些能量。EAS假定OPPs遵循利用率
+    （这与CPUFreq监管器schedutil的行为一致。关于这个问题的更多细节，见第6节）。
+
+    **情况1. P被迁移到CPU1**::
+
+      1024                 - - - - - - -
+
+                                            Energy calculation:
+       768                 =============     * CPU0: 200 / 341 * 150 = 88
+                                             * CPU1: 300 / 341 * 150 = 131
+                                             * CPU2: 600 / 768 * 800 = 625
+       512  - - - - - -    - ##- - - - -     * CPU3: 500 / 768 * 800 = 520
+                             ##     ##          => total_energy = 1364
+       341  ===========      ##     ##
+                    PP       ##     ##
+       170  -## - - PP-      ##     ##
+             ##     ##       ##     ##
+           ------------    -------------
+            CPU0   CPU1     CPU2   CPU3
+
+
+    **情况2. P被迁移到CPU3**::
+
+      1024                 - - - - - - -
+
+                                            Energy calculation:
+       768                 =============     * CPU0: 200 / 341 * 150 = 88
+                                             * CPU1: 100 / 341 * 150 = 43
+                                    PP       * CPU2: 600 / 768 * 800 = 625
+       512  - - - - - -    - ##- - -PP -     * CPU3: 700 / 768 * 800 = 729
+                             ##     ##          => total_energy = 1485
+       341  ===========      ##     ##
+                             ##     ##
+       170  -## - - - -      ##     ##
+             ##     ##       ##     ##
+           ------------    -------------
+            CPU0   CPU1     CPU2   CPU3
+
+    **情况3. P依旧留在prev_cpu/CPU0**::
+
+      1024                 - - - - - - -
+
+                                            Energy calculation:
+       768                 =============     * CPU0: 400 / 512 * 300 = 234
+                                             * CPU1: 100 / 512 * 300 = 58
+                                             * CPU2: 600 / 768 * 800 = 625
+       512  ===========    - ##- - - - -     * CPU3: 500 / 768 * 800 = 520
+                             ##     ##          => total_energy = 1437
+       341  -PP - - - -      ##     ##
+             PP              ##     ##
+       170  -## - - - -      ##     ##
+             ##     ##       ##     ##
+           ------------    -------------
+            CPU0   CPU1     CPU2   CPU3
+
+    从这些计算结果来看，情况1的总能量最低。所以从节约能量的角度看，CPU1是最佳候选
+    者。
+
+大核通常比小核更耗电，因此主要在任务不适合在小核运行时使用。然而，小核并不总是比
+大核节能。举例来说，对于某些系统，小核的高OPP可能比大核的低OPP能量消耗更高。因此，
+如果小核在某一特定时间点刚好有足够的利用率，在此刻被唤醒的小任务放在大核执行可能
+会更节能，尽管它在小核上运行也是合适的。
+
+即使在大核所有OPP都不如小核OPP节能的情况下，在某些特定条件下，令小任务运行在大核
+上依然可能节能。事实上，将一个任务放在一个小核上可能导致整个性能域的OPP提高，这将
+增加已经在该性能域运行的任务的能量成本。如果唤醒的任务被放在一个大核上，它的执行
+成本可能比放在小核上更高，但这不会影响小核上的其它任务，这些任务将继续以较低的OPP
+运行。因此，当考虑CPU消耗的总能量时，在大核上运行一个任务的额外成本可能小于为所有
+其它运行在小核的任务提高OPP的成本。
+
+上面的例子几乎不可能以一种通用的方式得到正确的结果；同时，对于所有平台，在不知道
+系统所有CPU每个不同OPP的运行成本时，也无法得到正确的结果。得益于基于EM的设计，
+EAS应该能够正确处理这些问题而不会引发太多麻烦。然而，为了确保对高利用率场景的
+吞吐率造成的影响最小化，EAS同样实现了另外一种叫“过度利用率”的机制。
+
+
+5. 过度利用率
+-------------
+
+从一般的角度来看，EAS能提供最大帮助的是那些涉及低、中CPU利用率的使用场景。每当CPU
+密集型的长任务运行，它们将需要所有的可用CPU算力，调度器将没有什么办法来节省能量同时
+又不损害吞吐率。为了避免EAS损害性能，一旦CPU被使用的算力超过80%，它将被标记为“过度
+利用”。只要根域中没有CPU是过度利用状态，负载均衡被禁用，而EAS将覆盖唤醒平衡代码。
+EAS很可能将负载放置在系统中能量效率最高的CPU而不是其它CPU上，只要不损害吞吐率。
+因此，负载均衡器被禁用以防止它打破EAS发现的节能任务放置。当系统未处于过度利用状态时，
+这样做是安全的，因为低于80%的临界点意味着：
+
+    a. 所有的CPU都有一些空闲时间，所以EAS使用的利用率信号很可能准确地代表各种任务
+       的“大小”。
+    b. 所有任务，不管它们的nice值是多大，都应该被提供了足够多的CPU算力。
+    c. 既然有多余的算力，那么所有的任务都必须定期阻塞/休眠，在唤醒时进行平衡就足够
+       了。
+
+只要一个CPU利用率超过80%的临界点，上述三个假设中至少有一个是不正确的。在这种情况下，
+整个根域的“过度利用”标志被设置，EAS被禁用，负载均衡器被重新启用。通过这样做，调度器
+又回到了在CPU密集的条件下基于负载的算法做负载均衡。这更好地尊重了任务的nice值。
+
+由于过度利用率的概念在很大程度上依赖于检测系统中是否有一些空闲时间，所以必须考虑
+（比CFS）更高优先级的调度类（以及中断）“窃取”的CPU算力。像这样，对过度使用率的检测
+不仅要考虑CFS任务使用的算力，还需要考虑其它调度类和中断。
+
+
+6. EAS的依赖和要求
+------------------
+
+能量感知调度依赖系统的CPU具有特定的硬件属性，以及内核中的其它特性被启用。本节列出
+了这些依赖，并对如何满足这些依赖提供了提示。
+
+
+6.1 - 非对称CPU拓扑
+^^^^^^^^^^^^^^^^^^^
+
+
+如简介所提，目前只有非对称CPU拓扑结构的平台支持EAS。通过在运行时查询
+SD_ASYM_CPUCAPACITY_FULL标志位是否在创建调度域时已设置来检查这一要求是否满足。
+
+参阅Documentation/scheduler/sched-capacity.rst以了解在sched_domain层次结构
+中设置此标志位所需满足的要求。
+
+请注意，EAS并非从根本上与SMP不兼容，但在SMP平台上还没有观察到明显的节能。这一
+限制可以在将来进行修改，如果被证明不是这样的话。
+
+
+6.2 - 当前的能量模型
+^^^^^^^^^^^^^^^^^^^^
+
+EAS使用一个平台的EM来估算调度决策对能量的影响。因此，你的平台必须向EM框架提供
+能量成本表，以启动EAS。要做到这一点，请参阅文档
+Documentation/power/energy-model.rst中的独立EM框架部分。
+
+另请注意，调度域需要在EM注册后重建，以便启动EAS。
+
+EAS使用EM对能量使用率进行预测决策，因此它在检查任务放置的可能选项时更加注重
+差异。对于EAS来说，EM的功率值是以毫瓦还是以“抽象刻度”为单位表示并不重要。
+
+
+
+6.3 - 能量模型复杂度
+^^^^^^^^^^^^^^^^^^^^
+
+任务唤醒路径是时延敏感的。当一个平台的EM太复杂（太多CPU，太多性能域，太多状态
+等），在唤醒路径中使用它的成本就会升高到不可接受。能量感知唤醒算法的复杂度为：
+
+	C = Nd * (Nc + Ns)
+
+其中：Nd是性能域的数量；Nc是CPU的数量；Ns是OPP的总数（例如：对于两个性能域，
+每个域有4个OPP，则Ns = 8）。
+
+当调度域建立时，复杂性检查是在根域上进行的。如果一个根域的复杂度C恰好高于完全
+主观设定的EM_MAX_COMPLEXITY阈值（在本文写作时，是2048），则EAS不会在此根域
+启动。
+
+如果你的平台的能量模型的复杂度太高，EAS无法在这个根域上使用，但你真的想用，
+那么你就只剩下两个可能的选择：
+
+    1. 将你的系统拆分成分离的、较小的、使用独占cpuset的根域，并在每个根域局部
+       启用EAS。这个方案的好处是开箱即用，但缺点是无法在根域之间实现负载均衡，
+       这可能会导致总体系统负载不均衡。
+    2. 提交补丁以降低EAS唤醒算法的复杂度，从而使其能够在合理的时间内处理更大
+       的EM。
+
+
+6.4 - Schedutil监管器
+^^^^^^^^^^^^^^^^^^^^^
+
+EAS试图预测CPU在不久的将来会在哪个OPP下运行，以估算它们的能量消耗。为了做到
+这一点，它假定CPU的OPP跟随CPU利用率变化而变化。
+
+尽管在实践中很难对这一假设的准确性提供硬性保证（因为，举例来说硬件可能不会做
+它被要求做的事情），相对于其他CPUFreq监管器，schedutil至少_请求_使用利用率
+信号计算的频率。因此，与EAS一起使用的唯一合理的监管器是schedutil，因为它是
+唯一一个在频率请求和能量预测之间提供某种程度的一致性的监管器。
+
+不支持将EAS与schedutil之外的任何其它监管器一起使用。
+
+
+6.5 刻度不变性使用率信号
+^^^^^^^^^^^^^^^^^^^^^^^^
+
+为了对不同的CPU和所有的性能状态做出准确的预测，EAS需要频率不变的和CPU不变的
+PELT信号。这些信号可以通过每个体系结构定义的arch_scale{cpu,freq}_capacity()
+回调函数获取。
+
+不支持在没有实现这两个回调函数的平台上使用EAS。
+
+
+6.6 多线程（SMT）
+^^^^^^^^^^^^^^^^^
+
+当前实现的EAS是不感知SMT的，因此无法利用多线程硬件节约能量。EAS认为线程是独立的
+CPU，这实际上对性能和能量消耗都是不利的。
+
+不支持在SMT上使用EAS。
-- 
2.17.1

