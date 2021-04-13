Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4593C35DFCD
	for <lists+linux-doc@lfdr.de>; Tue, 13 Apr 2021 15:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239692AbhDMNMP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Apr 2021 09:12:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53502 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231486AbhDMNMP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 09:12:15 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxvciUmHVg5YsHAA--.10319S3;
        Tue, 13 Apr 2021 21:11:50 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 01/11] docs/zh_CN: add core-api irq concepts.rst translation
Date:   Tue, 13 Apr 2021 21:12:27 +0800
Message-Id: <20210413131237.2253955-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413131237.2253955-1-siyanteng@loongson.cn>
References: <20210413131237.2253955-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxvciUmHVg5YsHAA--.10319S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyrur1rurWfArW3Gr48WFg_yoW8Zry7pF
        Z2yas3G3WfZF9xCr97KFy2qryUAay8WanFkws2vF1ftr1ktr4Dtr4jkF98Z3yfGryvyFy0
        vF4SkrWUuryYy3DanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUHj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kK
        e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I
        80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCj
        c4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YV
        CY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
        1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUbSoXUUUUU
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

