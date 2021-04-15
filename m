Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F2B35FF90
	for <lists+linux-doc@lfdr.de>; Thu, 15 Apr 2021 03:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbhDOBbF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 14 Apr 2021 21:31:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53196 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229520AbhDOBbE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 14 Apr 2021 21:31:04 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX8s6l3dgXR0IAA--.15458S3;
        Thu, 15 Apr 2021 09:30:37 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 01/11] docs/zh_CN: add core-api irq concepts.rst translation
Date:   Thu, 15 Apr 2021 09:31:14 +0800
Message-Id: <20210415013124.2256416-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210415013124.2256416-1-siyanteng@loongson.cn>
References: <20210415013124.2256416-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX8s6l3dgXR0IAA--.15458S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyrur1rurWfArW3Gr48WFg_yoW8Zry7pF
        Z2yas3G3WfZF9xCr97KFy2qryUAay8WanFkws2vF1ftr1ktr4Dtr4jkF98Z3yfGryvyFy0
        vF4SkrWUuryYy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPF14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWx
        Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
        67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
        IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
        14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
        W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU86wZ
        UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/irq/concepts.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/core-api/irq/concepts.rst           | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/concepts.rst

diff --git a/Documentation/translations/zh_CN/core-api/irq/concepts.rst b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
new file mode 100644
index 000000000000..b8b98a196a5d
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
@@ -0,0 +1,24 @@
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../../core-api/irq/concepts`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_concepts.rst:
+
+
+===========
+什么是IRQ？
+===========
+
+IRQ (Interrupt ReQuest) 指来自设备的中断请求。
+目前，它们可以通过一个引脚或通过一个数据包进入。
+多个设备可以连接到同一个引脚，从而共享一个IRQ。
+
+IRQ编号是用来描述硬件中断源的内核标识符。通常它是一个到全局irq_desc数组的索引，
+但是除了在linux/interrupt.h中实现的之外，其它细节是体系结构特征相关的。
+
+IRQ编号是对机器上可能的中断源的枚举。通常枚举的是系统中所有中断控制器的输入引脚
+编号。在ISA（工业标准体系结构）的情况下所枚举的是两个i8259中断控制器的16个输入引脚。
+
+体系结构可以给IRQ号赋予额外的含义，在涉及到硬件手动配置的情况下，我们鼓励这样做。
+ISA IRQ是赋予这种额外含义的一个典型例子。
-- 
2.27.0

