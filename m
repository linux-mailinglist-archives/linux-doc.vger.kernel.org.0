Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4DE735DFD1
	for <lists+linux-doc@lfdr.de>; Tue, 13 Apr 2021 15:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239534AbhDMNMT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Apr 2021 09:12:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53592 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240027AbhDMNMS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 09:12:18 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxvciUmHVg5YsHAA--.10319S6;
        Tue, 13 Apr 2021 21:11:54 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 04/11] docs/zh_CN: add core-api irq irqflags-tracing.rst translation
Date:   Tue, 13 Apr 2021 21:12:30 +0800
Message-Id: <20210413131237.2253955-5-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413131237.2253955-1-siyanteng@loongson.cn>
References: <20210413131237.2253955-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxvciUmHVg5YsHAA--.10319S6
X-Coremail-Antispam: 1UD129KBjvJXoWxury5Xr43JFy7Ary8Zw1rXrb_yoWrJryfpF
        Wv9a4fWa1fArWUZrWxur18Aw4rGF18WFZ7Aan7J3Z3XF95Jayjyr48KFn0vF1fuFy8A3yU
        tFs3ArWF9Fy5AFUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUHI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
        8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFI
        xGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
        4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F
        4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
        IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUgID7UUU
        UU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/irq/irqflags-tracing.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/core-api/irq/irqflags-tracing.rst   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst

diff --git a/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
new file mode 100644
index 000000000000..2a3f577ac6b5
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/irq/irqflags-tracing.rst
@@ -0,0 +1,45 @@
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../../core-api/irq/irqflags-tracing`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_irqflags-tracing.rst:
+
+
+=================
+IRQ-flags状态追踪
+=================
+
+:Author: 最初由Ingo Molnar <mingo@redhat.com>开始撰写
+
+“irq-flags tracing”（中断标志追踪）功能可以 “追踪” hardirq和softirq的状态，它让
+感兴趣的子系统有机会了解到到内核中发生的每一个
+hardirqs-off/hardirqs-on、softirqs-off/softirqs-on事件。
+
+CONFIG_TRACE_IRQFLAGS_SUPPORT是通用锁调试代码提供的CONFIG_PROVE_SPIN_LOCKING
+和CONFIG_PROVE_RW_LOCKING所需要的。否则将只有CONFIG_PROVE_MUTEX_LOCKING和
+CONFIG_PROVE_RWSEM_LOCKING在一个架构上被提供--这些都是不在IRQ上下文中使用的
+锁API。（rwsems的一个异常是可以解决的）
+
+架构对这一点的支持当然不属于“微不足道”的范畴，因为很多低级的汇编代码都要处理irq-flags
+的状态变化。但是一个架构可以以一种相当直接且无风险的方式启用irq-flags-tracing。
+
+架构如果想支持这个，需要先做一些代码组织上的改变:
+
+- 在他们的arch级Kconfig文件中添加并启用TRACE_IRQFLAGS_SUPPORT。
+
+然后还需要做一些功能上的改变来实现对irq-flags-tracing的支持:
+
+- 在低级入口代码中增加（构建条件）对trace_hardirqs_off()/trace_hardirqs_on()
+  函数的调用。锁验证器会密切关注 “real”的irq-flags是否与 “virtual”的irq-flags
+  状态相匹配，如果两者不匹配，则会发出警告（并关闭自己）。通常维护arch中
+  irq-flags-track的大部分时间都是在这种状态下度过的：看看lockdep的警告，试着
+  找出我们还没有搞定的汇编代码。修复并重复。一旦系统启动，并且在irq-flags跟踪功
+  能中没有出现lockdep警告的情况下，arch支持就完成了。
+
+- 如果该架构有不可屏蔽的中断，那么需要通过lockdep_off()/lockdep_on()将这些中
+  断从irq跟踪[和锁验证]机制中排除。
+
+ 一般来说，在一个架构中，不完整的irq-flags-tracing实现是没有风险的：lockdep
+ 会检测到这一点，并将自己关闭。即锁验证器仍然可靠。应该不会因为irq-tracing的错
+ 误而崩溃。（除非通过修改不该修改的条件来更改汇编或寄存器而破坏其他代码）
-- 
2.27.0

