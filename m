Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8EC387027
	for <lists+linux-doc@lfdr.de>; Tue, 18 May 2021 05:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238065AbhERDJv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 May 2021 23:09:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51974 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231625AbhERDJv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 23:09:51 -0400
Received: from localhost.localdomain (unknown [112.20.109.240])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxicmaL6NgxqgYAA--.37699S4;
        Tue, 18 May 2021 11:08:24 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH 2/2] docs/zh_CN: add core api local_ops.rst translation
Date:   Tue, 18 May 2021 11:08:52 +0800
Message-Id: <d3b3209a81bd225f6c6983c49b16a6ac8d93f054.1621255695.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1621255695.git.siyanteng@loongson.cn>
References: <cover.1621255695.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxicmaL6NgxqgYAA--.37699S4
X-Coremail-Antispam: 1UD129KBjvJXoW3JFW8Cry3tw1DtF18Ww15Arb_yoWfWrWrpF
        yqkr97ta13JFyqyFyxKF17tF15ua18Aas09ay8AFy3tF4xtrZ8Ar4xKr9IvF93W34kuFW8
        JFZIgry5Aryav37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUUjNt3UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/local_ops.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   3 +-
 .../translations/zh_CN/core-api/local_ops.rst | 194 ++++++++++++++++++
 2 files changed, 195 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/local_ops.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 8f0b3fe8723d..c7a004bf2bd6 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -59,11 +59,10 @@ Linux如何让一切同时发生。 详情请参阅
 
    irq/index
    refcount-vs-atomic
-
+   local_ops
 
 Todolist:
 
-   local_ops
    padata
    ../RCU/index
 
diff --git a/Documentation/translations/zh_CN/core-api/local_ops.rst b/Documentation/translations/zh_CN/core-api/local_ops.rst
new file mode 100644
index 000000000000..1294cc1864ff
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/local_ops.rst
@@ -0,0 +1,194 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/local_ops.rst
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_local_ops:
+
+
+========================
+本地原子操作的语义和行为
+========================
+
+:作者: Mathieu Desnoyers
+
+
+本文解释了本地原子操作的目的，如何为任何给定的架构实现这些操作，并说明
+如何正确使用这些操作。它还强调了在内存写入顺序很重要的情况下，跨CPU读取
+这些本地变量时必须采取的预防措施。
+
+.. note::
+
+    注意，基于 ``local_t`` 的操作不建议在通用的内核中使用。请使用 ``this_cpu``
+    操作来代替使用，除非真的有特殊目的。大多数内核中使用的 ``local_t`` 已
+    经被 ``this_cpu`` 操作所取代。 ``this_cpu`` 操作在一条指令中结合了重
+    定位和类似 ``local_t`` 的语义，产生了更紧凑和更快的执行代码。
+
+
+本地原子操作的目的
+==================
+
+本地原子操作的目的是提供快速和高度可重入的每CPU计数器。它们通过移除LOCK前
+缀和通常需要在CPU间同步的内存屏障，将标准原子操作的性能成本降到最低。
+
+在许多情况下，拥有快速的每CPU原子计数器是很有趣的：它不需要禁用中断来保护中
+断处理程序，它允许在NMI处理程序中使用连贯的计数器。它对追踪目的和各种性能监
+测计数器特别有用。
+
+本地原子操作只保证在拥有数据的CPU上的变量修改的原子性。因此，必须注意确保只
+有一个CPU写到 ``local_t`` 的数据。这是通过使用每CPU的数据来实现的，并确
+保我们在一个抢占式安全上下文中修改它。然而，从任何一个CPU读取 ``local_t``
+数据都是允许的：这样它就会显得与所有者CPU的其他内存写入顺序不一致。
+
+
+针对特定架构的实现
+==================
+
+这可以通过稍微修改标准的原子操作来实现：只有它们的UP变体必须被保留。这通常
+意味着删除LOCK前缀（在i386和x86_64上）和任何SMP同步屏障。如果架构在 SMP
+和UP之间没有不同的行为，在你的架构的 ``local.h`` 中包括 ``asm-generic/local.h``
+就足够了。
+
+通过在一个结构中嵌入一个 ``atomic_long_t`` ， ``local_t`` 类型被定义为
+一个不透明的 ``signed long`` 字符串。这样做的目的是为了使从这个类型到
+``long`` 的转换失败。该定义看起来像::
+
+    typedef struct { atomic_long_t a; } local_t;
+
+
+使用本地原子操作时应遵循的规则
+==============================
+
+* 被本地操作触及的变量必须是每cpu的变量。
+
+* 只有这些变量的CPU所有者才可以写入这些变量。
+
+* 这个CPU可以从任何上下文（进程、中断、软中断、nmi...）中使用本地操作来更新
+  它的local_t变量。
+
+* 当在进程上下文中使用本地操作时，必须禁用抢占（或中断），以确保进程在获得每
+  CPU变量和进行实际的本地操作之间不会被迁移到不同的CPU。
+
+* 当在中断上下文中使用本地操作时，在主线内核上不需要特别注意，因为它们将在局
+  部CPU上运行，并且已经禁用了抢占。然而，我建议无论如何都要明确地禁用抢占，
+  以确保它在-rt内核上仍能正确工作。
+
+* 读取本地cpu变量将提供该变量的当前拷贝。
+
+* 对这些变量的读取可以从任何CPU进行，因为对 “ ``long`` ”，对齐的变量的更新
+  总是原子的。由于写程序的CPU没有进行内存同步，所以在读取其他cpu的变量时，可
+  以读取该变量的过期副本。
+
+
+如何使用本地原子操作
+====================
+
+::
+
+    #include <linux/percpu.h>
+    #include <asm/local.h>
+
+    static DEFINE_PER_CPU(local_t, counters) = LOCAL_INIT(0);
+
+
+计数器
+======
+
+计数是在一个signed long的所有位上进行的。
+
+在可抢占的上下文中，围绕本地原子操作使用 ``get_cpu_var()`` 和
+``put_cpu_var()`` ：它确保在对每个cpu变量进行写访问时，抢占被禁用。比如
+说::
+
+    local_inc(&get_cpu_var(counters));
+    put_cpu_var(counters);
+
+如果你已经在一个抢占式安全上下文中，你可以使用 ``this_cpu_ptr()`` 代替::
+
+    local_inc(this_cpu_ptr(&counters));
+
+
+
+读取计数器
+==========
+
+那些本地计数器可以从外部的CPU中读取，以求得计数的总和。请注意，local_read
+所看到的跨CPU的数据必须被认为是相对于拥有该数据的CPU上发生的其他内存写入来
+说不符合顺序的。::
+
+    long sum = 0;
+    for_each_online_cpu(cpu)
+            sum += local_read(&per_cpu(counters, cpu));
+
+如果你想使用远程local_read来同步CPU之间对资源的访问，必须在写入者和读取者
+的CPU上分别使用显式的 ``smp_wmb()`` 和 ``smp_rmb()`` 内存屏障。如果你使
+用 ``local_t`` 变量作为写在缓冲区中的字节的计数器，就会出现这种情况：在缓
+冲区写和计数器增量之间应该有一个 ``smp_wmb()`` ，在计数器读和缓冲区读之间
+也应有一个 ``smp_rmb()`` 。
+
+下面是一个使用 ``local.h`` 实现每个cpu基本计数器的示例模块::
+
+    /* test-local.c
+     *
+     * Sample module for local.h usage.
+     */
+
+
+    #include <asm/local.h>
+    #include <linux/module.h>
+    #include <linux/timer.h>
+
+    static DEFINE_PER_CPU(local_t, counters) = LOCAL_INIT(0);
+
+    static struct timer_list test_timer;
+
+    /* IPI called on each CPU. */
+    static void test_each(void *info)
+    {
+            /* Increment the counter from a non preemptible context */
+            printk("Increment on cpu %d\n", smp_processor_id());
+            local_inc(this_cpu_ptr(&counters));
+
+            /* This is what incrementing the variable would look like within a
+             * preemptible context (it disables preemption) :
+             *
+             * local_inc(&get_cpu_var(counters));
+             * put_cpu_var(counters);
+             */
+    }
+
+    static void do_test_timer(unsigned long data)
+    {
+            int cpu;
+
+            /* Increment the counters */
+            on_each_cpu(test_each, NULL, 1);
+            /* Read all the counters */
+            printk("Counters read from CPU %d\n", smp_processor_id());
+            for_each_online_cpu(cpu) {
+                    printk("Read : CPU %d, count %ld\n", cpu,
+                            local_read(&per_cpu(counters, cpu)));
+            }
+            mod_timer(&test_timer, jiffies + 1000);
+    }
+
+    static int __init test_init(void)
+    {
+            /* initialize the timer that will increment the counter */
+            timer_setup(&test_timer, do_test_timer, 0);
+            mod_timer(&test_timer, jiffies + 1);
+
+            return 0;
+    }
+
+    static void __exit test_exit(void)
+    {
+            del_timer_sync(&test_timer);
+    }
+
+    module_init(test_init);
+    module_exit(test_exit);
+
+    MODULE_LICENSE("GPL");
+    MODULE_AUTHOR("Mathieu Desnoyers");
+    MODULE_DESCRIPTION("Local Atomic Ops");
-- 
2.27.0

