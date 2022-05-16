Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFC1552893B
	for <lists+linux-doc@lfdr.de>; Mon, 16 May 2022 17:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbiEPPzX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 16 May 2022 11:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiEPPzX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 11:55:23 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F72FCE09
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 08:55:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.109.92])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axqtjfc4JiGm4YAA--.8209S4;
        Mon, 16 May 2022 23:55:13 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v3 2/2] docs/zh_CN: add vm vmalloced-kernel-stacks translation
Date:   Mon, 16 May 2022 23:56:32 +0800
Message-Id: <ef2baddb668403ed68e97e4e77eef35817287180.1652713779.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1652713779.git.siyanteng@loongson.cn>
References: <cover.1652713779.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axqtjfc4JiGm4YAA--.8209S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKw4xZw17Ary5Cr48JF1fZwb_yoW3GFyrpF
        93CryfGF1Yy345A34F9w48CFyUJws7Cr45C3Z7W3Zaqr90yrWUtr1Y9rWrWa93X348AFWj
        qrWFy3ySkr1qk3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
        62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
        0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6ryrMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
        xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
        IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
        6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
        CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRRZjjPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/vmalloced-kernel-stacks.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 .../zh_CN/vm/vmalloced-kernel-stacks.rst      | 133 ++++++++++++++++++
 2 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/vmalloced-kernel-stacks.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 551f58bf7b55..d9ac73159dbc 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -41,6 +41,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    page_table_check
    remap_file_pages
    split_page_table_lock
+   vmalloced-kernel-stacks
    z3fold
    zsmalloc
 
@@ -51,4 +52,3 @@ TODOLIST:
 * slub
 * transhuge
 * unevictable-lru
-* vmalloced-kernel-stacks
diff --git a/Documentation/translations/zh_CN/vm/vmalloced-kernel-stacks.rst b/Documentation/translations/zh_CN/vm/vmalloced-kernel-stacks.rst
new file mode 100644
index 000000000000..ad23f274f6d7
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/vmalloced-kernel-stacks.rst
@@ -0,0 +1,133 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/vmalloced-kernel-stacks.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+====================
+支持虚拟映射的内核栈
+====================
+
+:作者: Shuah Khan <skhan@linuxfoundation.org>
+
+.. contents:: :local:
+
+概览
+----
+
+这是介绍 `虚拟映射内核栈功能 <https://lwn.net/Articles/694348/>` 的代码
+和原始补丁系列的信息汇总。
+
+简介
+----
+
+内核堆栈溢出通常难以调试，并使内核容易被（恶意）利用。问题可能在稍后的时间出现，使其难以
+隔离和究其根本原因。
+
+带有保护页的虚拟映射内核堆栈如果溢出，会被立即捕获，而不会放任其导致难以诊断的损
+坏。
+
+HAVE_ARCH_VMAP_STACK和VMAP_STACK配置选项能够支持带有保护页的虚拟映射堆栈。
+当堆栈溢出时，这个特性会引发可靠的异常。溢出后堆栈跟踪的可用性以及对溢出本身的
+响应取决于架构。
+
+.. note::
+        截至本文撰写时， arm64, powerpc, riscv, s390, um, 和 x86 支持VMAP_STACK。
+
+HAVE_ARCH_VMAP_STACK
+--------------------
+
+能够支持虚拟映射内核栈的架构应该启用这个bool配置选项。要求是:
+
+- vmalloc空间必须大到足以容纳许多内核堆栈。这可能排除了许多32位架构。
+- vmalloc空间的堆栈需要可靠地工作。例如，如果vmap页表是按需创建的，当堆栈指向
+  具有未填充页表的虚拟地址时，这种机制需要工作，或者架构代码（switch_to()和
+  switch_mm()，很可能）需要确保堆栈的页表项在可能未填充的堆栈上运行之前已经填
+  充。
+- 如果堆栈溢出到一个保护页，就应该发生一些合理的事情。“合理”的定义是灵活的，但
+  在没有记录任何东西的情况下立即重启是不友好的。
+
+VMAP_STACK
+----------
+
+VMAP_STACK bool配置选项在启用时分配虚拟映射的任务栈。这个选项依赖于
+HAVE_ARCH_VMAP_STACK。
+
+- 如果你想使用带有保护页的虚拟映射的内核堆栈，请启用该选项。这将导致内核栈溢出
+  被立即捕获，而不是难以诊断的损坏。
+
+.. note::
+
+        使用KASAN的这个功能需要架构支持用真实的影子内存来支持虚拟映射，并且
+        必须启用KASAN_VMALLOC。
+
+.. note::
+
+        启用VMAP_STACK时，无法在堆栈分配的数据上运行DMA。
+
+内核配置选项和依赖性不断变化。请参考最新的代码库:
+
+`Kconfig <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/Kconfig>`
+
+分配方法
+--------
+
+当一个新的内核线程被创建时，线程堆栈是由页级分配器分配的虚拟连续的内存页组成。这
+些页面被映射到有PAGE_KERNEL保护的连续的内核虚拟空间。
+
+alloc_thread_stack_node()调用__vmalloc_node_range()来分配带有PAGE_KERNEL
+保护的栈。
+
+- 分配的堆栈被缓存起来，以后会被新的线程重用，所以在分配/释放堆栈给任务时，要手动
+  进行memcg核算。因此，__vmalloc_node_range被调用时没有__GFP_ACCOUNT。
+- vm_struct被缓存起来，以便能够找到在中断上下文中启动的空闲线程。 free_thread_stack()
+  可以在中断上下文中调用。
+- 在arm64上，所有VMAP的堆栈都需要有相同的对齐方式，以确保VMAP的堆栈溢出检测正常
+  工作。架构特定的vmap堆栈分配器照顾到了这个细节。
+- 这并不涉及中断堆栈--参考原始补丁
+
+线程栈分配是由clone()、fork()、vfork()、kernel_thread()通过kernel_clone()
+启动的。留点提示在这，以便搜索代码库，了解线程栈何时以及如何分配。
+
+大量的代码是在:
+`kernel/fork.c <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/fork.c>`.
+
+task_struct中的stack_vm_area指针可以跟踪虚拟分配的堆栈，一个非空的stack_vm_area
+指针可以表明虚拟映射的内核堆栈已经启用。
+
+::
+
+        struct vm_struct *stack_vm_area;
+
+堆栈溢出处理
+------------
+
+前守护页和后守护页有助于检测堆栈溢出。当堆栈溢出到守护页时，处理程序必须小心不要再
+次溢出堆栈。当处理程序被调用时，很可能只留下很少的堆栈空间。
+
+在x86上，这是通过处理表明内核堆栈溢出的双异常堆栈的缺页异常来实现的。
+
+用守护页测试VMAP分配
+--------------------
+
+我们如何确保VMAP_STACK在分配时确实有前守护页和后守护页的保护？下面的 lkdtm 测试
+可以帮助检测任何回归。
+
+::
+
+        void lkdtm_STACK_GUARD_PAGE_LEADING()
+        void lkdtm_STACK_GUARD_PAGE_TRAILING()
+
+结论
+----
+
+- vmalloced堆栈的percpu缓存似乎比高阶堆栈分配要快一些，至少在缓存命中时是这样。
+- THREAD_INFO_IN_TASK完全摆脱了arch-specific thread_info，并简单地将
+  thread_info（仅包含标志）和'int cpu'嵌入task_struct中。
+- 一旦任务死亡，线程栈就可以被释放（无需等待RCU），然后，如果使用vmapped栈，就
+  可以将整个栈缓存起来，以便在同一cpu上重复使用。
-- 
2.27.0

