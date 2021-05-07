Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987FB376348
	for <lists+linux-doc@lfdr.de>; Fri,  7 May 2021 12:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235606AbhEGKHh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 May 2021 06:07:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41578 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235305AbhEGKHg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 May 2021 06:07:36 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr+4cEZVgvScTAA--.12861S4;
        Fri, 07 May 2021 18:06:28 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
Subject: [PATCH v2 2/3] docs/zh_CN: add parisc debugging.rst translation
Date:   Fri,  7 May 2021 18:07:04 +0800
Message-Id: <cacc2de08ff0fee5f8aedb6ee53abf1637da3189.1620284974.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1620284974.git.siyanteng@loongson.cn>
References: <cover.1620284974.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr+4cEZVgvScTAA--.12861S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGrW3Wr4xGry7tFyUtFy3CFg_yoW5ZF45p3
        ZrKryfGa1xA342y34Skr17GryfGayxJFZ3G3Z2y3W5tr1kJFW5t398t34YkFn7Wr97AFWU
        AF4akrWUCryjyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
        6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
        Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
        Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
        IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU
        =
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This translates Documentation/parisc/debugging.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/parisc/debugging.rst   | 42 +++++++++++++++++++
 .../translations/zh_CN/parisc/index.rst       |  6 ++-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/parisc/debugging.rst

diff --git a/Documentation/translations/zh_CN/parisc/debugging.rst b/Documentation/translations/zh_CN/parisc/debugging.rst
new file mode 100644
index 000000000000..c21beb986e15
--- /dev/null
+++ b/Documentation/translations/zh_CN/parisc/debugging.rst
@@ -0,0 +1,42 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/parisc/debugging.rst
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_parisc_debugging:
+
+=================
+调试PA-RISC
+=================
+
+好吧，这里有一些关于调试linux/parisc的较底层部分的信息。
+
+
+1. 绝对地址
+=====================
+
+很多汇编代码目前运行在实模式下，这意味着会使用绝对地址，而不是像内核其他
+部分那样使用虚拟地址。要将绝对地址转换为虚拟地址，你可以在System.map中查
+找，添加__PAGE_OFFSET（目前是0x10000000）。
+
+
+2. HPMCs
+========
+
+当实模式的代码试图访问不存在的内存时，会出现HPMC（high priority machine
+check）而不是内核oops。若要调试HPMC，请尝试找到系统响应程序/请求程序地址。
+系统请求程序地址应该与（某）处理器的HPA（I/O范围内的高地址）相匹配；系统响应程
+序地址是实模式代码试图访问的地址。
+
+系统响应程序地址的典型值是大于__PAGE_OFFSET （0x10000000）的地址，这意味着
+在实模式试图访问它之前，虚拟地址没有被翻译成物理地址。
+
+
+3. 有趣的Q位
+============
+
+某些非常关键的代码必须清除PSW中的Q位。当Q位被清除时，CPU不会更新中断处理
+程序所读取的寄存器，以找出机器被中断的位置——所以如果你在清除Q位的指令和再
+次设置Q位的RFI之间遇到中断，你不知道它到底发生在哪里。如果你幸运的话，IAOQ
+会指向清除Q位的指令，如果你不幸运的话，它会指向任何地方。通常Q位的问题会
+表现为无法解释的系统挂起或物理内存越界。
diff --git a/Documentation/translations/zh_CN/parisc/index.rst b/Documentation/translations/zh_CN/parisc/index.rst
index ef232d46b1ba..b913d664e735 100644
--- a/Documentation/translations/zh_CN/parisc/index.rst
+++ b/Documentation/translations/zh_CN/parisc/index.rst
@@ -10,9 +10,13 @@
 PA-RISC体系架构
 ====================
 
-Todolist:
+.. toctree::
+   :maxdepth: 2
 
    debugging
+
+Todolist:
+
    registers
    features
 
-- 
2.27.0

