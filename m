Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19E6390091
	for <lists+linux-doc@lfdr.de>; Tue, 25 May 2021 14:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbhEYMGm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 May 2021 08:06:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52618 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232064AbhEYMGm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 25 May 2021 08:06:42 -0400
Received: from localhost.localdomain (unknown [112.20.113.102])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0Lv56xg8OkDAA--.3200S2;
        Tue, 25 May 2021 20:05:04 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/zh_CN:add core-api padata translation
Date:   Tue, 25 May 2021 20:05:01 +0800
Message-Id: <20210525120501.2149992-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0Lv56xg8OkDAA--.3200S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr4UWryDCFWrurWUXr47Arb_yoWfKryDpr
        9rGryfKayUKrykurn5Gr1xGr1fG3yxWwsFya1xGF1Sqr13tr4rJr4jqFyrAFy7Wryvk34D
        AFWFgFW29342kFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5JwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5rWrDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/padata.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../translations/zh_CN/core-api/padata.rst    | 158 ++++++++++++++++++
 2 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/padata.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index a1dd792e46f7..fc2f326d6d23 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -65,12 +65,12 @@ Linux如何让一切同时发生。 详情请参阅
    :maxdepth: 1
 
    irq/index
+   padata
 
 Todolist:
 
    refcount-vs-atomic
    local_ops
-   padata
    ../RCU/index
 
 低级硬件管理
diff --git a/Documentation/translations/zh_CN/core-api/padata.rst b/Documentation/translations/zh_CN/core-api/padata.rst
new file mode 100644
index 000000000000..607cbad3075a
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/padata.rst
@@ -0,0 +1,158 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/padata.rst
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_core_api_padata.rst:
+
+==================
+padata并行执行机制
+==================
+
+:Date: 2020年5月
+
+Padata是一种机制，通过这种机制，内核可以将工作分散到多个CPU上并行完成，同时
+可以选择保持它们的顺序。
+
+它最初是为IPsec开发的，它需要在不对这些数据包重新排序的其前提下，为大量的数
+据包进行加密和解密。这是目前padata的序列化作业支持的唯一用途。
+
+Padata还支持多线程作业，将作业平均分割，同时在线程之间进行负载均衡和协调。
+
+序列化作业运行
+==============
+
+初始化
+------
+
+使用padata序列化作业运行的第一步是建立一个padata_instance结构体，以全面
+控制作业的运行方式::
+
+    #include <linux/padata.h>
+
+    struct padata_instance *padata_alloc(const char *name);
+
+'name'简单地标识了这个实例。
+
+然后，通过分配一个padata_shell来完成padata的初始化::
+
+   struct padata_shell *padata_alloc_shell(struct padata_instance *pinst);
+
+一个padata_shell用于向padata提交一个作业，并允许一系列这样的作业被独立地
+序列化。一个padata_instance可以有一个或多个padata_shell与之相关联，每个
+都允许一系列独立的作业。
+
+修改cpumasks
+------------
+
+用于运行作业的CPU可以通过两种方式改变，通过padata_set_cpumask()编程或通
+过sysfs。前者的定义是::
+
+    int padata_set_cpumask(struct padata_instance *pinst, int cpumask_type,
+			   cpumask_var_t cpumask);
+
+这里cpumask_type是PADATA_CPU_PARALLEL或PADATA_CPU_SERIAL之一，其中并
+行cpumask描述了哪些处理器将被用来并行执行提交给这个实例的作业，串行cpumask
+定义了哪些处理器被允许用作串行化回调处理器。 cpumask指定了要使用的新cpumask。
+
+一个实例的 cpumasks 可能有 sysfs 文件。例如，pcrypt的文件在
+/sys/kernel/pcrypt/<instance-name>。在一个实例的目录中，有两个文件，parallel_cpumask
+和serial_cpumask，任何一个cpumask都可以通过在文件中回显（echo）一个bitmask
+来改变，比如说::
+
+    echo f > /sys/kernel/pcrypt/pencrypt/parallel_cpumask
+
+读取其中一个文件会显示用户提供的cpumask，它可能与“可用”的cpumask不同。
+
+Padata内部维护着两对cpumask，用户提供的cpumask和“可用的”cpumask(每一对由一个
+并行和一个串行cpumask组成)。用户提供的cpumasks在实例分配时默认为所有可能的CPU，
+并且可以如上所述进行更改。可用的cpumasks总是用户提供的cpumasks的一个子集，只包
+含用户提供的掩码中的在线CPU；这些是padata实际使用的cpumasks。因此，向padata提
+供一个包含离线CPU的cpumask是合法的。一旦用户提供的cpumask中的一个离线CPU上线，
+padata就会使用它。
+
+改变CPU掩码是很昂贵的操作，所以它不应该被频繁地更改。
+
+运行一个作业
+-------------
+
+实际上向padata实例提交工作需要创建一个padata_priv结构体，它代表一个作业::
+
+    struct padata_priv {
+        /* Other stuff here... */
+	void                    (*parallel)(struct padata_priv *padata);
+	void                    (*serial)(struct padata_priv *padata);
+    };
+
+这个结构体几乎肯定会被嵌入到一些针对要做的工作的大结构体中。它的大部分字段对
+padata来说是私有的，但是这个结构体在初始化时应该被清零，并且应该提供parallel()和
+serial()函数。在完成工作的过程中，这些函数将被调用，我们马上就会遇到。
+
+工作的提交是通过::
+
+    int padata_do_parallel(struct padata_shell *ps,
+		           struct padata_priv *padata, int *cb_cpu);
+
+ps和padata结构体必须如上所述进行设置；cb_cpu指向作业完成后用于最终回调的首选CPU；
+它必须在当前实例的CPU掩码中（如果不是，cb_cpu指针将被更新为指向实际选择的CPU）。
+padata_do_parallel()的返回值在成功时为0，表示工作正在进行中。-EBUSY 意味着有人
+在其他地方正在搞乱实例的 CPU 掩码，而-EINVAL是关于cb_cpu不在串行cpumask中的吐槽，
+在并行或串行 cpumasks 中没有在线的 CPU，或者一个停止的实例。
+
+每个提交给padata_do_parallel()的作业将依次传递给一个CPU上的上述parallel()函数
+的一个调用，所以真正的并行是通过提交多个作业来实现的。 parallel()在运行时禁用软
+件中断，因此不能睡眠。parallel()函数把获得的padata_priv结构体指针作为其唯一的参
+数；关于实际要做的工作的信息可能是通过使用container_of()找到封装结构体来获得的。
+
+请注意，parallel()没有返回值；padata子系统假定parallel()将从此时开始负责这项工
+作。作业不需要在这次调用中完成，但是，如果parallel()留下了未完成的工作，它应该准
+备在前一个作业完成之前，用新的作业再次被调用。
+
+序列化作业
+----------
+
+当一个作业完成时，parallel()(或任何实际完成该工作的函数)应该通过调用通知padata这
+个事实::
+
+    void padata_do_serial(struct padata_priv *padata);
+
+在未来的某个时刻，padata_do_serial()将触发对padata_priv结构体中serial()函数的调
+用。这个调用将发生在要求最初调用padata_do_parallel()的CPU上；它也是在本地软件中断
+被禁用的情况下运行的。
+请注意，这个调用可能会被推迟一段时间，因为padata代码会努力确保作业按照提交的顺序完
+成。
+
+销毁
+----
+
+清理一个padata实例时，可以预见的是调用两个free函数，这两个函数对应于分配的逆过程。::
+
+    void padata_free_shell(struct padata_shell *ps);
+    void padata_free(struct padata_instance *pinst);
+
+用户有责任确保在调用上述任何一项之前，所有未完成的工作都已完成。
+
+运行多线程作业
+==============
+
+一个多线程作业有一个主线程和零个或多个辅助线程，主线程参与作业，然后等待所有辅助线
+程完成。padata将作业分割成称为chunk的单元，其中chunk是一个线程在一次调用线程函数
+中完成的作业片段。
+
+用户必须做三件事来运行一个多线程作业。首先，通过定义一个padata_mt_job结构体来描述
+作业，这在接口部分有解释。这包括一个指向线程函数的指针，padata每次将作业块分配给线
+程时都会调用这个函数。然后，定义线程函数，它接受三个参数： `start` 、 `end` 和 `arg` ，
+其中前两个参数限定了线程操作的范围，最后一个是指向作业共享状态的指针，如果有的话。
+准备好共享状态，它通常被分配在主线程的堆栈中。最后，调用padata_do_multithreaded()，
+它将在作业完成后返回。
+
+接口
+====
+
+该API在以下内核代码中:
+
+include/linux/padata.h
+
+kernel/padata.c
-- 
2.27.0

