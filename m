Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C05347BB3
	for <lists+linux-doc@lfdr.de>; Wed, 24 Mar 2021 16:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236445AbhCXPHz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 24 Mar 2021 11:07:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47146 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236475AbhCXPHq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Mar 2021 11:07:46 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [153.37.224.188])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxU+C1VVtgilQAAA--.1175S6;
        Wed, 24 Mar 2021 23:07:37 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 4/8] docs/zh_CN: add cpu-freq index.rst translation
Date:   Wed, 24 Mar 2021 23:07:27 +0800
Message-Id: <20210324150731.4512-5-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324150731.4512-1-siyanteng@loongson.cn>
References: <20210324150731.4512-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxU+C1VVtgilQAAA--.1175S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15WF4xZF48CrW7GFWktFb_yoW8Zry5pr
        n0grWfGF4UJFyxArZ3GF1UGF15X3Z7Cw47GF97Gw1FvFy8JF15tF1DtFW09a47Gr97ZFW8
        JFn7JrWv9ry8A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5WwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5eOJUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documention/cpu-freq/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/cpu-freq/index.rst     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/cpu-freq/index.rst

diff --git a/Documentation/translations/zh_CN/cpu-freq/index.rst b/Documentation/translations/zh_CN/cpu-freq/index.rst
new file mode 100644
index 000000000000..39d4b058fd7f
--- /dev/null
+++ b/Documentation/translations/zh_CN/cpu-freq/index.rst
@@ -0,0 +1,45 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../cpu-freq/index`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_index.rst:
+
+
+=======================================================
+Linux CPUFreq - Linux(TM)内核中的CPU频率和电压升降代码
+=======================================================
+
+Author: Dominik Brodowski  <linux@brodo.de>
+
+      时钟升降允许你在运行中改变CPU的时钟速度。这是一个很好的节省电池电量的方法，因为时
+      钟速度越低，CPU消耗的电量越少。
+
+
+.. toctree::
+   :maxdepth: 1
+
+   core
+   cpu-drivers
+   cpufreq-stats
+
+邮件列表
+------------
+这里有一个 CPU 频率变化的 CVS 提交和通用列表，您可以在这里报告bug、问题或提交补丁。要发
+布消息，请发送电子邮件到 linux-pm@vger.kernel.org。
+
+链接
+-----
+FTP档案:
+* ftp://ftp.linux.org.uk/pub/linux/cpufreq/
+
+如何访问CVS仓库:
+* http://cvs.arm.linux.org.uk/
+
+CPUFreq邮件列表:
+* http://vger.kernel.org/vger-lists.html#linux-pm
+
+SA-1100的时钟和电压标度:
+* http://www.lartmaker.nl/projects/scaling
-- 
2.25.1

