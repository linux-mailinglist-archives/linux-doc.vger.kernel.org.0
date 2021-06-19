Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D74E3AD838
	for <lists+linux-doc@lfdr.de>; Sat, 19 Jun 2021 08:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbhFSGpd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 19 Jun 2021 02:45:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47888 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232835AbhFSGpc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 19 Jun 2021 02:45:32 -0400
Received: from localhost.localdomain (unknown [223.106.58.132])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0AEks1gCRkUAA--.1472S2;
        Sat, 19 Jun 2021 14:43:16 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/zh_CN: add core api genericirq translation
Date:   Sat, 19 Jun 2021 14:43:43 +0800
Message-Id: <20210619064343.1645370-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0AEks1gCRkUAA--.1472S2
X-Coremail-Antispam: 1UD129KBjvAXoWfJw15JFWkZF1kuF4rArWDurg_yoW8Gw4kZo
        WYyr4Ykr48CF4rJ34IqFsrWr15Ar4fCr4kG3Z3Kr12k345ua15Xw1DXr45ZrW3Za15Za43
        Jw13X3yfuF1UZF4Dn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYg7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
        JVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
        xVA2Y2ka0xkIwI1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
        AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
        17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
        IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
        Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
        sGvfC2KfnxnUUI43ZEXa7VUb2Nt3UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

translate Documentation/core-api/genericirq.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/genericirq.rst             | 409 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 2 files changed, 410 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/genericirq.rst

diff --git a/Documentation/translations/zh_CN/core-api/genericirq.rst b/Documentation/translations/zh_CN/core-api/genericirq.rst
new file mode 100644
index 000000000000..63b721bb931d
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/genericirq.rst
@@ -0,0 +1,409 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/genericirq.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. include:: <isonum.txt>
+
+.. _cn_core-api_genericirq:
+
+================
+Linux通用IRQ处理
+================
+
+:版权: |copy| 2005-2010: Thomas Gleixner
+:版权: |copy| 2005-2006:  Ingo Molnar
+
+简介
+====
+
+通用中断处理层是为了给设备驱动程序提供一个完整的中断处理抽象（层）。它能够处
+理所有不同类型的中断控制器硬件。设备驱动程序使用通用API函数来请求、启用、禁
+用和释放中断。驱动程序不需要知道任何关于硬件处理中断的细节，所以它们可以在不同的
+平台上使用而不需要修改代码。
+
+本文档提供给那些希望在通用IRQ处理层的帮助下实现基于其架构的中断子系统的开发
+者。
+
+理论依据
+========
+
+Linux中中断处理的原始实现使用__do_IRQ()超级处理程序，它能够处理每种类型的
+中断逻辑。
+
+最初，Russell King确定了不同类型的处理程序，以便为Linux 2.5/2.6中的ARM中
+断处理程序实现建立一个相当通用的集合。他区分了以下几种类型:
+
+-  电平触发型
+
+-  边缘触发型
+
+-  简单型
+
+在实现过程中，我们发现了另一种类型:
+
+-  需回应（end of interrupt）型
+
+在__do_IRQ()超级处理程序的SMP世界中，另一种类型被确定为:
+
+-  每cpu型（针对smp）
+
+这种高层IRQ处理程序的拆分实现使我们能够为每个特定的中断类型优化中断处理的流
+程。这减少了该特定代码路径的复杂性，并允许对特定类型进行优化处理。
+
+最初的通用IRQ实现使用hw_interrupt_type结构及其 ``->ack`` ``->end`` 等回
+调来区分超级处理程序中的流控制。这导致了流逻辑和低级硬件逻辑的混合，也导致了
+不必要的代码重复：例如在i386中，有一个 ``ioapic_level_irq`` 和一个
+``ioapic_edge_irq`` 的IRQ类型，它们共享许多低级的细节，但有不同的流处理。
+
+一个更自然的抽象是“irq流”和“芯片细节”的干净分离。
+
+分析一些架构的IRQ子系统的实现可以发现，他们中的大多数可以使用一套通用的“irq
+流”方法，只需要添加芯片级的特定代码。这种分离对于那些需要IRQ流本身而不需要芯
+片细节的特定（子）架构也很有价值——因此提供了一个更透明的IRQ子系统设计。
+
+每个中断描述符都被分配给它自己的高层流程处理程序，这通常是一个通用的实现。(这
+种高层次的流程处理程序的实现也使得提供解复用处理程序变得简单，这可以在各种架
+构的嵌入式平台上找到。)
+
+这种分离使得通用中断处理层更加灵活和可扩展。例如，一个（子）架构可以使用通用
+的IRQ-flow实现“电平触发型”中断，并添加一个（子）架构特定的“边缘型”实现。
+
+为了使向新模型的过渡更容易，并防止现有实现的中断，__do_IRQ()超级处理程序仍然
+可用。这导致了一种暂时的双重性。随着时间的推移，新的模型应该在越来越多的架构中
+被使用，因为它能使IRQ子系统更小更干净。它已经被废弃三年了，即将被删除。
+
+已知的缺陷和假设
+================
+
+没有（敲木鱼）。
+
+抽象层
+======
+
+中断代码中主要有三个抽象层次:
+
+1. 高级别的驱动API
+
+2. 高级别的IRQ流处理器
+
+3. 芯片级的硬件封装
+
+中断控制流
+----------
+
+每个中断都由一个中断描述符结构irq_desc来描述。中断是由一个“无符号int”的数值来
+引用的，它在描述符结构体数组中选择相应的中断描述符结构体。描述符结构体包含状态
+信息和指向中断流方法和中断芯片结构的指针，这些都是分配给这个中断的。
+
+每当中断触发时，低级架构代码通过调用desc->handle_irq()调用到通用中断代码中。
+这个高层IRQ处理函数只使用由分配的芯片描述符结构体引用的desc->irq_data.chip
+基元。
+
+高级驱动程序API
+---------------
+
+高层驱动API由以下函数组成:
+
+-  request_irq()
+
+-  request_threaded_irq()
+
+-  free_irq()
+
+-  disable_irq()
+
+-  enable_irq()
+
+-  disable_irq_nosync() (SMP only)
+
+-  synchronize_irq() (SMP only)
+
+-  irq_set_irq_type()
+
+-  irq_set_irq_wake()
+
+-  irq_set_handler_data()
+
+-  irq_set_chip()
+
+-  irq_set_chip_data()
+
+详见自动生成的函数文档.
+
+.. note::
+
+    由于某些特殊原因，中文文档中并没有引入自动生成的函数文档，所以请读者直接阅读源
+    码注释。
+
+电平触发型IRQ流处理程序
+-----------------------
+
+通用层提供了一套预定义的irq-flow方法:
+
+-  handle_level_irq()
+
+-  handle_edge_irq()
+
+-  handle_fasteoi_irq()
+
+-  handle_simple_irq()
+
+-  handle_percpu_irq()
+
+-  handle_edge_eoi_irq()
+
+-  handle_bad_irq()
+
+中断流处理程序（无论是预定义的还是架构特定的）由架构在启动期间或设备初始化期间分配给
+特定中断。
+
+默认流实现
+~~~~~~~~~~
+
+辅助函数
+^^^^^^^^
+
+辅助函数调用芯片基元，并被默认流实现所使用。以下是实现的辅助函数（简化摘录）::
+
+    default_enable(struct irq_data *data)
+    {
+        desc->irq_data.chip->irq_unmask(data);
+    }
+
+    default_disable(struct irq_data *data)
+    {
+        if (!delay_disable(data))
+            desc->irq_data.chip->irq_mask(data);
+    }
+
+    default_ack(struct irq_data *data)
+    {
+        chip->irq_ack(data);
+    }
+
+    default_mask_ack(struct irq_data *data)
+    {
+        if (chip->irq_mask_ack) {
+            chip->irq_mask_ack(data);
+        } else {
+            chip->irq_mask(data);
+            chip->irq_ack(data);
+        }
+    }
+
+    noop(struct irq_data *data))
+    {
+    }
+
+
+
+默认流处理程序的实现
+~~~~~~~~~~~~~~~~~~~~
+
+默认触发型IRQ流处理器
+^^^^^^^^^^^^^^^^^^^^^
+
+handle_level_irq为电平触发型的中断提供了一个通用实现。
+
+实现的控制流如下（简化摘录）::
+
+    desc->irq_data.chip->irq_mask_ack();
+    handle_irq_event(desc->action);
+    desc->irq_data.chip->irq_unmask();
+
+
+默认的需回应IRQ流处理器
+^^^^^^^^^^^^^^^^^^^^^^^
+
+handle_fasteoi_irq为中断提供了一个通用的实现，它只需要在处理程序的末端有一个EOI。
+
+实现的控制流如下（简化摘录）::
+
+    handle_irq_event(desc->action);
+    desc->irq_data.chip->irq_eoi();
+
+
+默认的边缘触发型IRQ流处理器
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+handle_edge_irq为边缘触发型的中断提供了一个通用的实现。
+
+实现的控制流如下（简化摘录）::
+
+    if (desc->status & running) {
+        desc->irq_data.chip->irq_mask_ack();
+        desc->status |= pending | masked;
+        return;
+    }
+    desc->irq_data.chip->irq_ack();
+    desc->status |= running;
+    do {
+        if (desc->status & masked)
+            desc->irq_data.chip->irq_unmask();
+        desc->status &= ~pending;
+        handle_irq_event(desc->action);
+    } while (status & pending);
+    desc->status &= ~running;
+
+
+默认的简单型IRQ流处理器
+^^^^^^^^^^^^^^^^^^^^^^^
+
+handle_simple_irq提供了一个简单型中断的通用实现。
+
+.. note::
+
+   简单型的流处理程序不调用任何处理程序/芯片基元。
+
+实现的控制流程如下（简化摘录）::
+
+    handle_irq_event(desc->action);
+
+
+每CPU型默认流处理程序
+^^^^^^^^^^^^^^^^^^^^^
+
+handle_percpu_irq为每CPU型中断提供一个通用的实现。
+
+每个CPU中断只在SMP上可用，该处理程序提供了一个没有锁的简化版本。
+
+以下是控制流的实现（简化摘录）::
+
+    if (desc->irq_data.chip->irq_ack)
+        desc->irq_data.chip->irq_ack();
+    handle_irq_event(desc->action);
+    if (desc->irq_data.chip->irq_eoi)
+        desc->irq_data.chip->irq_eoi();
+
+
+EOI边缘型IRQ流处理器
+^^^^^^^^^^^^^^^^^^^^
+
+handle_edge_eoi_irq提供了一个异常的边缘触发型处理程序，它只用于拯救powerpc/cell
+上的一个严重失控的irq控制器。
+
+坏的IRQ流处理器
+^^^^^^^^^^^^^^^
+
+handle_bad_irq用于处理没有真正分配处理程序的假中断。
+
+特殊性和优化
+~~~~~~~~~~~~
+
+通用函数是为“干净”的架构和芯片设计的，它们没有平台特定的IRQ处理特殊性。如果一
+个架构需要在“流”的层面上实现特殊性，那么它可以通过覆盖高层的IRQ-流处理程序来实
+现。
+
+延迟中断禁用
+~~~~~~~~~~~~
+
+每个中断可选择的功能是由Russell King在ARM中断实现中引入的，当调用disable_irq()
+时，不会在硬件层面上屏蔽中断。中断保持启用状态，而在中断事件发生时在流处理器中被
+屏蔽。这可以防止在硬件上丢失边缘中断，因为硬件上不存储边缘中断事件，而中断在硬件
+级被禁用。当一个中断在IRQ_DISABLED标志被设置时到达，那么该中断在硬件层面被屏蔽，
+IRQ_PENDING位被设置。当中断被enable_irq()重新启用时，将检查挂起位，如果它被设置，
+中断将通过硬件或软件重发机制重新发送。(当你想使用延迟中断禁用功能，而你的硬件又不
+能重新触发中断时，有必要启用CONFIG_HARDIRQS_SW_RESEND。) 延迟中断禁止功能是不可
+配置的。
+
+芯片级硬件封装
+--------------
+
+芯片级硬件描述符结构体 :c:type:`irq_chip` 包含了所有与芯片直接相关的功能，这些功
+能可以被irq流实现所利用。
+
+-  ``irq_ack``
+
+-  ``irq_mask_ack`` - 可选的，建议使用的性能
+
+-  ``irq_mask``
+
+-  ``irq_unmask``
+
+-  ``irq_eoi`` - 可选的，EOI流处理程序需要
+
+-  ``irq_retrigger`` - 可选的
+
+-  ``irq_set_type`` - 可选的
+
+-  ``irq_set_wake`` - 可选的
+
+这些基元的意思是严格意义上的：ack是指ACK，masking是指对IRQ线的屏蔽，等等。这取决
+于流处理器如何使用这些基本的低级功能单元。
+
+__do_IRQ入口点
+==============
+
+最初的实现__do_IRQ()是所有类型中断的替代入口点。它已经不存在了。
+
+这个处理程序被证明不适合所有的中断硬件，因此被重新实现了边缘/级别/简单/超高速中断
+的拆分功能。这不仅是一个功能优化。它也缩短了中断的代码路径。
+
+在SMP上锁定
+===========
+
+芯片寄存器的锁定是由定义芯片基元的架构决定的。每个寄存器的结构通过desc->lock，由
+通用层保护。
+
+通用中断芯片
+============
+
+为了避免复制相同的IRQ芯片实现，核心提供了一个可配置的通用中断芯片实现。开发者在自
+己实现相同的功能之前，应该仔细检查通用芯片是否符合他们的需求，并以稍微不同的方式实
+现相同的功能。
+
+该API在以下内核代码中:
+
+kernel/irq/generic-chip.c
+
+结构体
+======
+
+本章包含自动生成的结构体文档，这些结构体在通用IRQ层中使用。
+
+该API在以下内核代码中:
+
+include/linux/irq.h
+
+include/linux/interrupt.h
+
+提供的通用函数
+==============
+
+这一章包含了自动生成的内核API函数的文档，这些函数被导出。
+
+该API在以下内核代码中:
+
+kernel/irq/manage.c
+
+kernel/irq/chip.c
+
+提供的内部函数
+==============
+
+本章包含自动生成的内部函数的文档。
+
+该API在以下内核代码中:
+
+kernel/irq/irqdesc.c
+
+kernel/irq/handle.c
+
+kernel/irq/chip.c
+
+鸣谢
+====
+
+感谢以下人士对本文件作出的贡献：
+
+1. Thomas Gleixner tglx@linutronix.de
+
+2. Ingo Molnar mingo@elte.hu
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index b4bde9396339..71a212a2a9db 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -80,13 +80,13 @@ Todolist:
    :maxdepth: 1
 
    cachetlb
+   genericirq
 
 Todolist:
 
 
    cpu_hotplug
    memory-hotplug
-   genericirq
    protection-keys
 
 
-- 
2.27.0

