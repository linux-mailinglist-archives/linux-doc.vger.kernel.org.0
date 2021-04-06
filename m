Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEDD355478
	for <lists+linux-doc@lfdr.de>; Tue,  6 Apr 2021 15:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243468AbhDFNBm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Apr 2021 09:01:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49430 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243477AbhDFNBj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 09:01:39 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax_cifW2xg9tQEAA--.6047S8;
        Tue, 06 Apr 2021 21:01:26 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 06/11] docs/zh_CN: add core-api/index.rst translation
Date:   Tue,  6 Apr 2021 21:02:05 +0800
Message-Id: <20210406130210.2725075-7-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210406130210.2725075-1-siyanteng@loongson.cn>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax_cifW2xg9tQEAA--.6047S8
X-Coremail-Antispam: 1UD129KBjvJXoWxZFW8Xw15Xr1UZw1DGw18uFg_yoW5AFWkpF
        nrXryfKa1UJry7Ar1xGr1UWr18Ga4kuF4DGw4xXrn0qF1DXFWUAr4Utry7tryxGr4vyFyr
        AF4fKrWjyry2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUP214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
        WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZ
        X7UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/index.rst into Chinese.
add Documentation/translations/zh_CN/core-api/irq/* to zh_CN/core-api/index.rst.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/index.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
new file mode 100644
index 000000000000..1d0e73b03858
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -0,0 +1,126 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../core-api/irq/index`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_core-api_index.rst:
+
+
+======================
+核心API文档
+======================
+
+这是核心内核API手册的开端。 非常感谢为本手册转换(和编写!)的文档!
+
+核心公用程序
+==============
+
+本节有通用文件和 "核心中的核心" 文件。 第一部分是 docbook 时期遗留下
+来的大量 kerneldoc 信息；有朝一日，当有人找到精力去做的时候，真的
+应该把它拆分出来。
+
+Todolist:
+
+   kernel-api
+   workqueue
+   printk-basics
+   printk-formats
+   symbol-namespaces
+
+数据结构和低级公用程序
+=======================================
+
+在整个内核中使用的函数库。
+
+Todolist:
+
+   kobject
+   kref
+   assoc_array
+   xarray
+   idr
+   circular-buffers
+   rbtree
+   generic-radix-tree
+   packing
+   bus-virt-phys-mapping
+   this_cpu_ops
+   timekeeping
+   errseq
+
+并发原语
+======================
+
+Linux如何让一切同时发生。 详情请参阅
+:doc:`/locking/index`
+
+.. toctree::
+   :maxdepth: 1
+
+   irq/index
+
+Todolist:
+
+   refcount-vs-atomic
+   local_ops
+   padata
+   ../RCU/index
+
+低级硬件管理
+=============================
+
+缓存管理，CPU热插拔管理等。
+
+Todolist:
+
+   cachetlb
+   cpu_hotplug
+   memory-hotplug
+   genericirq
+   protection-keys
+
+
+内存管理
+=================
+
+如何在内核中分配和使用内存。请注意，在
+:doc:`/vm/index` 中有更多的内存管理文档。
+
+Todolist:
+
+   memory-allocation
+   unaligned-memory-access
+   dma-api
+   dma-api-howto
+   dma-attributes
+   dma-isa-lpc
+   mm-api
+   genalloc
+   pin_user_pages
+   boot-time-mm
+   gfp_mask-from-fs-io
+
+内核调试的接口
+===============================
+
+Todolist:
+
+   debug-objects
+   tracepoint
+   debugging-via-ohci1394
+
+其它一切文档
+===============
+
+不适合放在其它地方或尚未归类的文件；
+
+Todolist:
+
+   librs
+
+.. only:: subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.27.0

