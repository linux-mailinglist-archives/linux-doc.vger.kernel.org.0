Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC23648CBE
	for <lists+linux-doc@lfdr.de>; Sat, 10 Dec 2022 04:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiLJD0j (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Dec 2022 22:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiLJD0i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:26:38 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 80E1725EAF
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:26:36 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8AxDOtr_JNjOJgEAA--.10593S3;
        Sat, 10 Dec 2022 11:26:35 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxoOJq_JNjyPIpAA--.37251S2;
        Sat, 10 Dec 2022 11:26:34 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 10/13] docs/zh_CN: Update the translation of usage to 6.1-rc8
Date:   Sat, 10 Dec 2022 11:27:02 +0800
Message-Id: <8c96013940845a9c59b5b607c0a98b5d4cd53636.1670642548.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670642548.git.siyanteng@loongson.cn>
References: <cover.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxoOJq_JNjyPIpAA--.37251S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3tF4kKFyxXFy5XF4DJr4ktFb_yoWDXryrpr
        yfW3s2ka12yFy5Xr1fKFy293WrJFyxGr97KasYyF1xAFyrA3sIyr4kKa48tF9rWFy5Cr9r
        Ar9Yka47tFyakwUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b-8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
        CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2
        z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07jxSdgUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 1da89ea0b006 ("Docs/admin-guide/mm/damon/usage:
document schemes/<s>/tried_regions sysfs directory")

commit 465d0eb0dc31 ("Docs/admin-guide/mm/damon/usage: fix the
example code snip")
commit f1f3afd59d78 ("Docs/admin-guide/mm/damon/usage: note DAMON
debugfs interface deprecation plan")
commit 9056a2229495 ("Docs/admin-guide/mm/damon/usage: describe
the rules of sysfs region directories")
commit c3774845541e ("Docs/admin-guide/mm/damon/usage: fix wrong
usage example of init_regions file")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 68 ++++++++++++++-----
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
index aeae2ab65dd8..17b9949d9b43 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
@@ -46,10 +46,10 @@ DAMON的sysfs接口是在定义 ``CONFIG_DAMON_SYSFS`` 时建立的。它在其s
 对于一个简短的例子，用户可以监测一个给定工作负载的虚拟地址空间，如下所示::
 
     # cd /sys/kernel/mm/damon/admin/
-    # echo 1 > kdamonds/nr && echo 1 > kdamonds/0/contexts/nr
+    # echo 1 > kdamonds/nr_kdamonds && echo 1 > kdamonds/0/contexts/nr_contexts
     # echo vaddr > kdamonds/0/contexts/0/operations
-    # echo 1 > kdamonds/0/contexts/0/targets/nr
-    # echo $(pidof <workload>) > kdamonds/0/contexts/0/targets/0/pid
+    # echo 1 > kdamonds/0/contexts/0/targets/nr_targets
+    # echo $(pidof <workload>) > kdamonds/0/contexts/0/targets/0/pid_target
     # echo on > kdamonds/0/state
 
 文件层次结构
@@ -82,6 +82,9 @@ DAMON sysfs接口的文件层次结构如下图所示。在下图中，父子关
     │ │ │ │ │ │ │ │ weights/sz_permil,nr_accesses_permil,age_permil
     │ │ │ │ │ │ │ watermarks/metric,interval_us,high,mid,low
     │ │ │ │ │ │ │ stats/nr_tried,sz_tried,nr_applied,sz_applied,qt_exceeds
+    │ │ │ │ │ │ │ tried_regions/
+    │ │ │ │ │ │ │ │ 0/start,end,nr_accesses,age
+    │ │ │ │ │ │ │ │ ...
     │ │ │ │ │ │ ...
     │ │ │ │ ...
     │ │ ...
@@ -111,7 +114,11 @@ kdamonds/<N>/
 读取 ``state`` 时，如果kdamond当前正在运行，则返回 ``on`` ，如果没有运行则返回 ``off`` 。
 写入 ``on`` 或 ``off`` 使kdamond处于状态。向 ``state`` 文件写 ``update_schemes_stats`` ，
 更新kdamond的每个基于DAMON的操作方案的统计文件的内容。关于统计信息的细节，请参考
-:ref:`stats section <sysfs_schemes_stats>`.
+:ref:`stats section <sysfs_schemes_stats>`. 将 ``update_schemes_tried_regions`` 写到
+``state`` 文件，为kdamond的每个基于DAMON的操作方案，更新基于DAMON的操作方案动作的尝试区域目录。
+将`clear_schemes_tried_regions`写入`state`文件，清除kdamond的每个基于DAMON的操作方案的动作
+尝试区域目录。 关于基于DAMON的操作方案动作尝试区域目录的细节，请参考:ref:tried_regions 部分
+<sysfs_schemes_tried_regions>`。
 
 如果状态为 ``on``，读取 ``pid`` 显示kdamond线程的pid。
 
@@ -186,6 +193,8 @@ regions/<N>/
 在每个区域目录中，你会发现两个文件（ ``start``  和  ``end`` ）。你可以通过向文件写入
 和从文件中读出，分别设置和获得初始监测目标区域的起始和结束地址。
 
+每个区域不应该与其他区域重叠。 目录“N”的“结束”应等于或小于目录“N+1”的“开始”。
+
 contexts/<N>/schemes/
 ---------------------
 
@@ -199,8 +208,8 @@ contexts/<N>/schemes/
 schemes/<N>/
 ------------
 
-在每个方案目录中，存在四个目录(``access_pattern``, ``quotas``,``watermarks``,
-和 ``stats``)和一个文件(``action``)。
+在每个方案目录中，存在五个目录(``access_pattern``、``quotas``、``watermarks``、
+``stats`` 和 ``tried_regions``)和一个文件(``action``)。
 
 ``action`` 文件用于设置和获取你想应用于具有特定访问模式的内存区域的动作。可以写入文件
 和从文件中读取的关键词及其含义如下。
@@ -229,8 +238,8 @@ schemes/<N>/quotas/
 
 每个 ``动作`` 的最佳 ``目标访问模式`` 取决于工作负载，所以不容易找到。更糟糕的是，将某些动作
 的方案设置得过于激进会造成严重的开销。为了避免这种开销，用户可以为每个方案限制时间和大小配额。
-具体来说，用户可以要求DAMON尽量只使用特定的时间（``时间配额``）来应用行动，并且在给定的时间间
-隔（``重置间隔``）内，只对具有目标访问模式的内存区域应用行动，而不使用特定数量（``大小配额``）。
+具体来说，用户可以要求DAMON尽量只使用特定的时间（``时间配额``）来应用动作，并且在给定的时间间
+隔（``重置间隔``）内，只对具有目标访问模式的内存区域应用动作，而不使用特定数量（``大小配额``）。
 
 当预计超过配额限制时，DAMON会根据 ``目标访问模式`` 的大小、访问频率和年龄，对找到的内存区域
 进行优先排序。为了进行个性化的优先排序，用户可以为这三个属性设置权重。
@@ -272,6 +281,24 @@ DAMON统计每个方案被尝试应用的区域的总数量和字节数，每个
 你应该要求DAMON sysfs接口通过在相关的 ``kdamonds/<N>/state`` 文件中写入一个特殊的关键字
 ``update_schemes_stats`` 来更新统计信息的文件内容。
 
+schemes/<N>/tried_regions/
+--------------------------
+
+当一个特殊的关键字 ``update_schemes_tried_regions`` 被写入相关的 ``kdamonds/<N>/state``
+文件时，DAMON会在这个目录下创建从 ``0`` 开始命名的整数目录。每个目录包含的文件暴露了关于每个
+内存区域的详细信息，在下一个 :ref:`聚集区间 <sysfs_monitoring_attrs>`，相应的方案的 ``动作``
+已经尝试在这个目录下应用。这些信息包括地址范围、``nr_accesses`` 以及区域的 ``年龄`` 。
+
+当另一个特殊的关键字 ``clear_schemes_tried_regions`` 被写入相关的 ``kdamonds/<N>/state``
+文件时，这些目录将被删除。
+
+tried_regions/<N>/
+------------------
+
+在每个区域目录中，你会发现四个文件(``start``, ``end``, ``nr_accesses``, and ``age``)。
+读取这些文件将显示相应的基于DAMON的操作方案 ``动作`` 试图应用的区域的开始和结束地址、``nr_accesses``
+和 ``年龄`` 。
+
 用例
 ~~~~
 
@@ -287,12 +314,12 @@ DAMON统计每个方案被尝试应用的区域的总数量和字节数，每个
     # echo 1 > kdamonds/0/contexts/0/schemes/nr_schemes
     # cd kdamonds/0/contexts/0/schemes/0
     # # set the basic access pattern and the action
-    # echo 4096 > access_patterns/sz/min
-    # echo 8192 > access_patterns/sz/max
-    # echo 0 > access_patterns/nr_accesses/min
-    # echo 5 > access_patterns/nr_accesses/max
-    # echo 10 > access_patterns/age/min
-    # echo 20 > access_patterns/age/max
+    # echo 4096 > access_pattern/sz/min
+    # echo 8192 > access_pattern/sz/max
+    # echo 0 > access_pattern/nr_accesses/min
+    # echo 5 > access_pattern/nr_accesses/max
+    # echo 10 > access_pattern/age/min
+    # echo 20 > access_pattern/age/max
     # echo pageout > action
     # # set quotas
     # echo 10 > quotas/ms
@@ -311,6 +338,11 @@ DAMON统计每个方案被尝试应用的区域的总数量和字节数，每个
 debugfs接口
 ===========
 
+.. note::
+
+  DAMON debugfs接口将在下一个LTS内核发布后被移除，所以用户应该转移到
+  :ref:`sysfs接口<sysfs_interface>`。
+
 DAMON导出了八个文件, ``attrs``, ``target_ids``, ``init_regions``,
 ``schemes``, ``monitor_on``, ``kdamond_pid``, ``mk_contexts`` 和
 ``rm_contexts`` under its debugfs directory, ``<debugfs>/damon/``.
@@ -364,7 +396,7 @@ DAMON导出了八个文件, ``attrs``, ``target_ids``, ``init_regions``,
 监测目标区域。
 
 在这种情况下，用户可以通过在 ``init_regions`` 文件中写入适当的值，明确地设置他们想要的初
-始监测目标区域。输入的每一行应代表一个区域，形式如下::
+始监测目标区域。输入应该是一个由三个整数组成的队列，用空格隔开，代表一个区域的形式如下::
 
     <target idx> <start address> <end address>
 
@@ -376,9 +408,9 @@ DAMON导出了八个文件, ``attrs``, ``target_ids``, ``init_regions``,
     # cd <debugfs>/damon
     # cat target_ids
     42 4242
-    # echo "0   1       100
-            0   100     200
-            1   20      40
+    # echo "0   1       100 \
+            0   100     200 \
+            1   20      40  \
             1   50      100" > init_regions
 
 请注意，这只是设置了初始的监测目标区域。在虚拟内存监测的情况下，DAMON会在一个 ``更新间隔``
-- 
2.31.1

