Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF5F157A018
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jul 2022 15:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbiGSNwh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jul 2022 09:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236664AbiGSNwX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 09:52:23 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79A6711414B
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 06:04:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axn+LYq9ZiM4QoAA--.11347S4;
        Tue, 19 Jul 2022 21:04:28 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 2/4] docs/zh_CN: core-api: Add circular-buffers Chinese translation
Date:   Tue, 19 Jul 2022 21:04:16 +0800
Message-Id: <945ab16a062dd6f832633fec0eccbde1899fa705.1658196777.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1658196777.git.zhoubinbin@loongson.cn>
References: <cover.1658196777.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axn+LYq9ZiM4QoAA--.11347S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Cry7uw47CrW8ZF1UtFyxXwb_yoWDXrWxpr
        9Iga4fC3Z7A34vvas8KFy5WF1UCa48AFy7Kan2kF9FgF48GwnxZr9Fka429FyfW34xAFyD
        AFWvkryIkryjy37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5GwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
        cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
        IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRivtZUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate core-api/circular-buffers.rst into Chinese.

Last English version used:

commit 714b6904e23e ("doc: Remove ".vnet" from paulmck email addresses").

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../zh_CN/core-api/circular-buffers.rst       | 209 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 2 files changed, 210 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/circular-buffers.rst

diff --git a/Documentation/translations/zh_CN/core-api/circular-buffers.rst b/Documentation/translations/zh_CN/core-api/circular-buffers.rst
new file mode 100644
index 000000000000..7c7eab7c386f
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/circular-buffers.rst
@@ -0,0 +1,209 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/circular-buffers.rst
+
+:翻译:
+
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
+
+:校译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 吴想成 Wu Xiangcheng <bobwxc@email.cn>
+
+==========
+环形缓冲区
+==========
+
+:作者: David Howells <dhowells@redhat.com>
+:作者: Paul E. McKenney <paulmck@linux.ibm.com>
+
+
+Linux 提供了许多可用于实现循环缓冲的特性。有两组这样的特性：
+
+ (1) 用于确定2次方大小的缓冲区信息的便利函数。
+
+ (2) 当缓冲区中对象的生产者和消费者不想共享一个锁时的内存屏障。
+
+如下所述，要使用这些设施，只需要一个生产者和一个消费者。可以通过序列化来处理多个
+生产者，并通过序列化来处理多个消费者。
+
+.. Contents:
+
+ (*) 什么是环形缓冲区？
+
+ (*) 测量2次幂缓冲区
+
+ (*) 内存屏障与环形缓冲区的结合使用
+     - 生产者
+     - 消费者
+
+ (*) 延伸阅读
+
+
+
+什么是环形缓冲区？
+==================
+
+首先，什么是环形缓冲区？环形缓冲区是具有固定的有限大小的缓冲区，它有两个索引：
+
+ (1) 'head'索引 - 生产者将元素插入缓冲区的位置。
+
+ (2) 'tail'索引 - 消费者在缓冲区中找到下一个元素的位置。
+
+通常，当tail指针等于head指针时，表明缓冲区是空的；而当head指针比tail指针少一个时，
+表明缓冲区是满的。
+
+添加元素时，递增head索引；删除元素时，递增tail索引。tail索引不应该跳过head索引，
+两个索引在到达缓冲区末端时都应该被赋值为0，从而允许海量的数据流过缓冲区。
+
+通常情况下，元素都有相同的单元大小，但这并不是使用以下技术的严格要求。如果要在缓
+冲区中包含多个元素或可变大小的元素，则索引可以增加超过1，前提是两个索引都没有超过
+另一个。然而，实现者必须小心，因为超过一个单位大小的区域可能会覆盖缓冲区的末端并
+且缓冲区会被分成两段。
+
+测量2次幂缓冲区
+===============
+
+计算任意大小的环形缓冲区的占用或剩余容量通常是一个费时的操作，需要使用模（除法）
+指令。但是如果缓冲区的大小为2次幂，则可以使用更快的按位与指令代替。
+
+Linux提供了一组用于处理2次幂环形缓冲区的宏。可以通过以下方式使用::
+
+	#include <linux/circ_buf.h>
+
+这些宏包括：
+
+ (#) 测量缓冲区的剩余容量::
+
+	CIRC_SPACE(head_index, tail_index, buffer_size);
+
+     返回缓冲区[1]中可插入元素的剩余空间大小。
+
+
+ (#) 测量缓冲区中的最大连续即时空间::
+
+	CIRC_SPACE_TO_END(head_index, tail_index, buffer_size);
+
+     返回缓冲区[1]中剩余的连续空间的大小，元素可以立即插入其中，而不必绕回到缓冲
+     区的开头。
+
+
+ (#) 测量缓冲区的占用率::
+
+	CIRC_CNT(head_index, tail_index, buffer_size);
+
+     返回当前占用缓冲区[2]的元素数量。
+
+
+ (#) 测量缓冲区的非覆盖占用率::
+
+	CIRC_CNT_TO_END(head_index, tail_index, buffer_size);
+
+     返回可以从缓冲区中提取的连续元素[2]的数量，而不必绕回到缓冲区的开头。
+
+这里的每一个宏名义上都会返回一个介于0和buffer_size-1之间的值，但是：
+
+ (1) CIRC_SPACE*()是为了在生产者中使用。对生产者来说，它们将返回一个下限，因为生
+     产者控制着head索引，但消费者可能仍然在另一个CPU上耗尽缓冲区并移动tail索引。
+
+     对消费者来说，它将显示一个上限，因为生产者可能正忙于耗尽空间。
+
+ (2) CIRC_CNT*()是为了在消费者中使用。对消费者来说，它们将返回一个下限，因为消费
+     者控制着tail索引，但生产者可能仍然在另一个CPU上填充缓冲区并移动head索引。
+
+     对于生产者，它将显示一个上限，因为消费者可能正忙于清空缓冲区。
+
+ (3) 对于第三方来说，生产者和消费者对索引的写入顺序是无法保证的，因为它们是独立的，
+     而且可能是在不同的CPU上进行的，所以在这种情况下的结果只是一种猜测，甚至可能
+     是错误的。
+
+内存屏障与环形缓冲区的结合使用
+==============================
+
+通过将内存屏障与环形缓冲区结合使用，可以避免以下需求：
+
+ (1) 使用单个锁来控制对缓冲区两端的访问，从而允许同时填充和清空缓冲区；以及
+
+ (2) 使用原子计数器操作。
+
+这有两个方面：填充缓冲区的生产者和清空缓冲区的消费者。在任何时候，只应有一个生产
+者在填充缓冲区，同样的也只应有一个消费者在清空缓冲区，但双方可以同时操作。
+
+
+生产者
+------
+
+生产者看起来像这样::
+
+	spin_lock(&producer_lock);
+
+	unsigned long head = buffer->head;
+	/* spin_unlock()和下一个spin_lock()提供必要的排序。 */
+	unsigned long tail = READ_ONCE(buffer->tail);
+
+	if (CIRC_SPACE(head, tail, buffer->size) >= 1) {
+		/* 添加一个元素到缓冲区 */
+		struct item *item = buffer[head];
+
+		produce_item(item);
+
+		smp_store_release(buffer->head,
+				  (head + 1) & (buffer->size - 1));
+
+		/* wake_up()将确保在唤醒任何人之前提交head */
+		wake_up(consumer);
+	}
+
+	spin_unlock(&producer_lock);
+
+这将表明CPU必须在head索引使其对消费者可用之前写入新项目的内容，同时CPU必须在唤醒
+消费者之前写入修改后的head索引。
+
+请注意，wake_up()并不保证任何形式的屏障，除非确实唤醒了某些东西。因此我们不能依靠
+它来进行排序。但是数组中始终有一个元素留空，因此生产者必须产生两个元素，然后才可
+能破坏消费者当前正在读取的元素。同时，消费者连续调用之间成对的解锁-加锁提供了索引
+读取（指示消费者已清空给定元素）和生产者对该相同元素的写入之间的必要顺序。
+
+
+消费者
+------
+
+消费者看起来像这样::
+
+	spin_lock(&consumer_lock);
+
+	/* 读取该索引处的内容之前，先读取索引 */
+	unsigned long head = smp_load_acquire(buffer->head);
+	unsigned long tail = buffer->tail;
+
+	if (CIRC_CNT(head, tail, buffer->size) >= 1) {
+
+		/* 从缓冲区中提取一个元素 */
+		struct item *item = buffer[tail];
+
+		consume_item(item);
+
+		/* 在递增tail之前完成对描述符的读取。 */
+		smp_store_release(buffer->tail,
+				  (tail + 1) & (buffer->size - 1));
+	}
+
+	spin_unlock(&consumer_lock);
+
+这表明CPU在读取新元素之前确保索引是最新的，然后在写入新的尾指针之前应确保CPU已完
+成读取该元素，这将擦除该元素。
+
+请注意，使用READ_ONCE()和smp_load_acquire()来读取反向索引。这可以防止编译器丢弃并
+重新加载其缓存值。如果您能确定反向索引将仅使用一次，则这不是严格需要的。
+smp_load_acquire()还可以强制CPU对后续的内存引用进行排序。类似地，两种算法都使用
+smp_store_release()来写入线程的索引。这记录了我们正在写入可以并发读取的内容的事实，
+以防止编译器破坏存储，并强制对以前的访问进行排序。
+
+
+延伸阅读
+========
+
+关于Linux的内存屏障设施的描述，请查看Documentation/memory-barriers.txt。
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 94eeef20c042..854b923f3b30 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -45,12 +45,12 @@
    xarray
    rbtree
    idr
+   circular-buffers
 
 Todolist:
 
 
 
-   circular-buffers
    generic-radix-tree
    packing
    bus-virt-phys-mapping
-- 
2.20.1

