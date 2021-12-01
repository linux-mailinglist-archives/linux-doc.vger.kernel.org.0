Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2185465173
	for <lists+linux-doc@lfdr.de>; Wed,  1 Dec 2021 16:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350851AbhLAP0R (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Dec 2021 10:26:17 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:28140 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbhLAP0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Dec 2021 10:26:16 -0500
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J42p45zF0z1DJrk;
        Wed,  1 Dec 2021 23:20:12 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 23:22:54 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 23:22:53 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v2] doc/zh-CN: Update cpu-freq/cpu-drivers.rst to make it more readable
Date:   Wed, 1 Dec 2021 23:50:33 +0800
Message-ID: <20211201155033.7925-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are some syntax errors in this document.
Also make it more readable.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
v2:
Add proofreader. Fix some mistakes.

 .../zh_CN/cpu-freq/cpu-drivers.rst            | 107 +++++++++---------
 1 file changed, 56 insertions(+), 51 deletions(-)

diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
index 0fc5d1495789..3cae98aaa1fd 100644
--- a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
@@ -8,7 +8,9 @@
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
 
-.. _cn_cpu-drivers.rst:
+:校译:
+
+ 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
 
 =======================================
 如何实现一个新的CPUFreq处理器驱动程序？
@@ -38,14 +40,14 @@
 1. 怎么做？
 ===========
 
-如此，你刚刚得到了一个全新的CPU/芯片组及其数据手册，并希望为这个CPU/芯片组添加cpufreq
+如果，你刚刚得到了一个全新的CPU/芯片组及其数据手册，并希望为这个CPU/芯片组添加cpufreq
 支持？很好，这里有一些至关重要的提示：
 
 
 1.1 初始化
 ----------
 
-首先，在__initcall_level_7 (module_init())或更靠后的函数中检查这个内核是否
+首先，在 __initcall level 7 (module_init())或更靠后的函数中检查这个内核是否
 运行在正确的CPU和正确的芯片组上。如果是，则使用cpufreq_register_driver()向
 CPUfreq核心层注册一个cpufreq_driver结构体。
 
@@ -60,11 +62,11 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
  .setpolicy 或 .fast_switch 或 .target 或 .target_index - 差异见
  下文。
 
-并且可选择
+其它可选成员
 
- .flags - cpufreq核的提示。
+ .flags - 给cpufreq核心的提示。
 
- .driver_data - cpufreq驱动程序的特定数据。
+ .driver_data - cpufreq驱动程序的特有数据。
 
  .get_intermediate 和 target_intermediate - 用于在改变CPU频率时切换到稳定
  的频率。
@@ -79,10 +81,10 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
  .suspend - 一个指向per-policy暂停函数的指针，该函数在关中断且在该策略的调节器停止
  后被调用。
 
- .resume - 一个指向per-policy恢复函数的指针，该函数在关中断且在调节器再一次开始前被
+ .resume - 一个指向per-policy恢复函数的指针，该函数在关中断且在调节器再一次启动前被
  调用。
 
- .attr - 一个指向NULL结尾的"struct freq_attr"列表的指针，该函数允许导出值到
+ .attr - 一个指向NULL结尾的"struct freq_attr"列表的指针，该列表允许导出值到
  sysfs。
 
  .boost_enabled - 如果设置，则启用提升(boost)频率。
@@ -93,14 +95,14 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
 1.2 Per-CPU 初始化
 ------------------
 
-每当一个新的CPU被注册到设备模型中，或者在cpufreq驱动注册自己之后，如果此CPU的cpufreq策
-略不存在，则会调用per-policy的初始化函数cpufreq_driver.init。请注意，.init()和.exit()程序
-只对策略调用一次，而不是对策略管理的每个CPU调用一次。它需要一个 ``struct cpufreq_policy
+每当一个新的CPU被注册到设备模型中，或者当cpufreq驱动注册自身之后，如果此CPU的cpufreq策
+略不存在，则会调用per-policy的初始化函数cpufreq_driver.init。请注意，.init()和.exit()例程
+只为某个策略调用一次，而不是对该策略管理的每个CPU调用一次。它需要一个 ``struct cpufreq_policy
 *policy`` 作为参数。现在该怎么做呢？
 
 如果有必要，请在你的CPU上激活CPUfreq功能支持。
 
-然后，驱动程序必须填写以下数值:
+然后，驱动程序必须填写以下值:
 
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.min_freq 和	   |					  |
@@ -110,7 +112,7 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency |                                      |
 |				    | CPU在两个频率之间切换所需的时间，以  |
-|				    | 纳秒为单位（如适用，否则指定         |
+|				    | 纳秒为单位（如不适用，设定为         |
 |				    | CPUFREQ_ETERNAL）                    |
 +-----------------------------------+--------------------------------------+
 |policy->cur			    | 该CPU当前的工作频率(如适用)          |
@@ -119,33 +121,34 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
 |policy->min,			    |					   |
 |policy->max,			    |					   |
 |policy->policy and, if necessary,  |					   |
-|policy->governor		    | 必须包含该cpu的 “默认策略”。稍后     |
+|policy->governor		    | 必须包含该CPU的 "默认策略"。稍后     |
 |				    | 会用这些值调用                       |
-|				    | cpufreq_driver.verify and either     |
-|				    | cpufreq_driver.setpolicy or          |
+|				    | cpufreq_driver.verify和下面函数      |
+|				    | 之一：cpufreq_driver.setpolicy或     |
 |				    | cpufreq_driver.target/target_index   |
 |				    | 		                           |
 +-----------------------------------+--------------------------------------+
-|policy->cpus			    | 用与这个CPU一起做DVFS的(在线+离线)   |
-|				    | CPU(即与它共享时钟/电压轨)的掩码更新 |
-|				    | 这个                                 |
+|policy->cpus			    | 该policy通过DVFS框架影响的全部CPU    |
+|				    | (即与本CPU共享 "时钟/电压" 对)构成   |
+|				    | 掩码(同时包含在线和离线CPU)，用掩码  |
+|				    | 更新本字段                           |
 |				    |                                      |
 +-----------------------------------+--------------------------------------+
 
-对于设置其中的一些值(cpuinfo.min[max]_freq, policy->min[max])，频率表助手可能会有帮
+对于设置其中的一些值(cpuinfo.min[max]_freq, policy->min[max])，频率表辅助函数可能会有帮
 助。关于它们的更多信息，请参见第2节。
 
 
 1.3 验证
 --------
 
-当用户决定设置一个新的策略(由 “policy,governor,min,max组成”)时，必须对这个策略进行验证，
+当用户决定设置一个新的策略(由 "policy,governor,min,max组成" )时，必须对这个策略进行验证，
 以便纠正不兼容的值。为了验证这些值，cpufreq_verify_within_limits(``struct cpufreq_policy
 *policy``, ``unsigned int min_freq``, ``unsigned int max_freq``)函数可能会有帮助。
-关于频率表助手的详细内容请参见第2节。
+关于频率表辅助函数的详细内容请参见第2节。
 
 您需要确保至少有一个有效频率（或工作范围）在 policy->min 和 policy->max 范围内。如果有必
-要，先增加policy->max，只有在没有办法的情况下，才减少policy->min。
+要，先增大policy->max，只有在没有解决方案的情况下，才减小policy->min。
 
 
 1.4 target 或 target_index 或 setpolicy 或 fast_switch?
@@ -154,34 +157,35 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
 大多数cpufreq驱动甚至大多数cpu频率升降算法只允许将CPU频率设置为预定义的固定值。对于这些，你
 可以使用->target()，->target_index()或->fast_switch()回调。
 
-有些cpufreq功能的处理器可以自己在某些限制之间切换频率。这些应使用->setpolicy()回调。
+有些具有硬件调频能力的处理器可以自行依据某些限制来切换CPU频率。它们应使用->setpolicy()回调。
 
 
 1.5. target/target_index
 ------------------------
 
-target_index调用有两个参数：``struct cpufreq_policy * policy``和``unsigned int``
-索引(于列出的频率表)。
+target_index调用有两个参数：``struct cpufreq_policy * policy`` 和 ``unsigned int``
+索引(用于索引频率表项)。
 
 当调用这里时，CPUfreq驱动必须设置新的频率。实际频率必须由freq_table[index].frequency决定。
 
-它应该总是在错误的情况下恢复到之前的频率(即policy->restore_freq)，即使我们之前切换到中间频率。
+在发生错误的情况下总是应该恢复到之前的频率(即policy->restore_freq)，即使我们已经切换到了
+中间频率。
 
 已弃用
 ----------
-目标调用有三个参数。``struct cpufreq_policy * policy``, unsigned int target_frequency,
+target调用有三个参数。``struct cpufreq_policy * policy``, unsigned int target_frequency,
 unsigned int relation.
 
 CPUfreq驱动在调用这里时必须设置新的频率。实际的频率必须使用以下规则来确定。
 
-- 紧跟 "目标频率"。
+- 尽量贴近 "目标频率" 。
 - policy->min <= new_freq <= policy->max (这必须是有效的!!!)
 - 如果 relation==CPUFREQ_REL_L，尝试选择一个高于或等于 target_freq 的 new_freq。("L代表
   最低，但不能低于")
 - 如果 relation==CPUFREQ_REL_H，尝试选择一个低于或等于 target_freq 的 new_freq。("H代表
   最高，但不能高于")
 
-这里，频率表助手可能会帮助你--详见第2节。
+这里，频率表辅助函数可能会帮助你--详见第2节。
 
 1.6. fast_switch
 ----------------
@@ -195,42 +199,43 @@ CPUfreq驱动在调用这里时必须设置新的频率。实际的频率必须
 1.7 setpolicy
 -------------
 
-setpolicy调用只需要一个``struct cpufreq_policy * policy``作为参数。需要将处理器内或芯片组内动态频
+setpolicy调用只需要一个 ``struct cpufreq_policy * policy`` 作为参数。需要将处理器内或芯片组内动态频
 率切换的下限设置为policy->min，上限设置为policy->max，如果支持的话，当policy->policy为
-CPUFREQ_POLICY_PERFORMANCE时选择面向性能的设置，当CPUFREQ_POLICY_POWERSAVE时选择面向省电的设置。
+CPUFREQ_POLICY_PERFORMANCE时选择面向性能的设置，为CPUFREQ_POLICY_POWERSAVE时选择面向省电的设置。
 也可以查看drivers/cpufreq/longrun.c中的参考实现。
 
 1.8 get_intermediate 和 target_intermediate
 --------------------------------------------
 
-仅适用于 target_index() 和 CPUFREQ_ASYNC_NOTIFICATION 未设置的驱动。
+仅适用于未设置 target_index() 和 CPUFREQ_ASYNC_NOTIFICATION 的驱动。
 
 get_intermediate应该返回一个平台想要切换到的稳定的中间频率，target_intermediate()应该将CPU设置为
-该频率，然后再跳转到'index'对应的频率。核心会负责发送通知，驱动不必在target_intermediate()或
-target_index()中处理。
+该频率，然后再跳转到 'index' 对应的频率。cpufreq核心会负责发送通知，驱动不必在
+target_intermediate()或target_index()中处理它们。
 
-在驱动程序不想因为某个目标频率切换到中间频率的情况下，它们可以从get_intermediate()中返回'0'。在这种情况
-下，核心将直接调用->target_index()。
+在驱动程序不想为某个目标频率切换到中间频率的情况下，它们可以让get_intermediate()返回 '0' 。
+在这种情况下，cpufreq核心将直接调用->target_index()。
 
-注意：->target_index()应该在失败的情况下恢复到policy->restore_freq，因为core会为此发送通知。
+注意：->target_index()应该在发生失败的情况下将频率恢复到policy->restore_freq，
+因为cpufreq核心会为此发送通知。
 
 
-2. 频率表助手
-=============
+2. 频率表辅助函数
+=================
 
-由于大多数cpufreq处理器只允许被设置为几个特定的频率，因此，一个带有一些函数的 “频率表”可能会辅助处理器驱动
-程序的一些工作。这样的 "频率表" 由一个cpufreq_frequency_table条目构成的数组组成，"driver_data" 中包
-含了驱动程序的具体数值，"frequency" 中包含了相应的频率，并设置了标志。在表的最后，需要添加一个
-cpufreq_frequency_table条目，频率设置为CPUFREQ_TABLE_END。而如果想跳过表中的一个条目，则将频率设置为
-CPUFREQ_ENTRY_INVALID。这些条目不需要按照任何特定的顺序排序，但如果它们是cpufreq 核心会对它们进行快速的DVFS，
+由于大多数支持cpufreq的处理器只允许被设置为几个特定的频率，因此，"频率表" 和一些相关函数可能会辅助处理器驱动
+程序的一些工作。这样的 "频率表" 是一个由struct cpufreq_frequency_table的条目构成的数组，"driver_data" 成员包
+含驱动程序的专用值，"frequency" 成员包含了相应的频率，此外还有标志成员。在表的最后，需要添加一个
+cpufreq_frequency_table条目，频率设置为CPUFREQ_TABLE_END。如果想跳过表中的一个条目，则将频率设置为
+CPUFREQ_ENTRY_INVALID。这些条目不需要按照任何特定的顺序排序，如果排序了，cpufreq核心执行DVFS会更快一点，
 因为搜索最佳匹配会更快。
 
-如果策略在其policy->freq_table字段中包含一个有效的指针，cpufreq表就会被核心自动验证。
+如果在policy->freq_table字段中包含一个有效的频率表指针，频率表就会被cpufreq核心自动验证。
 
 cpufreq_frequency_table_verify()保证至少有一个有效的频率在policy->min和policy->max范围内，并且所有其他
-标准都被满足。这对->verify调用很有帮助。
+准则都被满足。这对->verify调用很有帮助。
 
-cpufreq_frequency_table_target()是对应于->target阶段的频率表助手。只要把数值传递给这个函数，这个函数就会返
+cpufreq_frequency_table_target()是对应于->target阶段的频率表辅助函数。只要把值传递给这个函数，这个函数就会返
 回包含CPU要设置的频率的频率表条目。
 
 以下宏可以作为cpufreq_frequency_table的迭代器。
@@ -238,8 +243,8 @@ cpufreq_frequency_table_target()是对应于->target阶段的频率表助手。
 cpufreq_for_each_entry(pos, table) - 遍历频率表的所有条目。
 
 cpufreq_for_each_valid_entry(pos, table) - 该函数遍历所有条目，不包括CPUFREQ_ENTRY_INVALID频率。
-使用参数 "pos"-一个``cpufreq_frequency_table * `` 作为循环变量，使用参数 "table"-作为你想迭代
-的``cpufreq_frequency_table * `` 。
+使用参数 "pos"-一个 ``cpufreq_frequency_table *`` 作为循环指针，使用参数 "table"-作为你想迭代
+的 ``cpufreq_frequency_table *`` 。
 
 例如::
 
@@ -250,5 +255,5 @@ cpufreq_for_each_valid_entry(pos, table) - 该函数遍历所有条目，不包
 		pos->frequency = ...
 	}
 
-如果你需要在driver_freq_table中处理pos的位置，不要减去指针，因为它的代价相当高。相反，使用宏
+如果你需要在driver_freq_table中处理pos的位置，不要做指针减法，因为它的代价相当高。作为替代，使用宏
 cpufreq_for_each_entry_idx() 和 cpufreq_for_each_valid_entry_idx() 。
-- 
2.17.1

