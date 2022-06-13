Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362D7547ED3
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jun 2022 07:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiFMFCN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jun 2022 01:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiFMFCN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 01:02:13 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3665613CC4
        for <linux-doc@vger.kernel.org>; Sun, 12 Jun 2022 22:02:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxOeTLxKZiLn49AA--.4099S5;
        Mon, 13 Jun 2022 13:02:07 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, zhoubinbin@loongson.cn
Subject: [PATCH v2 3/3] docs/zh_CN: Update the translation of vm index to 5.19-rc1
Date:   Mon, 13 Jun 2022 13:03:42 +0800
Message-Id: <9f458a7be9ef3b9eea3d7bba4e97fc962f6a061e.1655094814.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1655094814.git.siyanteng@loongson.cn>
References: <cover.1655094814.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxOeTLxKZiLn49AA--.4099S5
X-Coremail-Antispam: 1UD129KBjvJXoW3KFWkZw43Gr1UGF45WF4xtFb_yoWDKr13pa
        4kKrySg3WfJ3sxC34xGw17GF18AF1xua1UGrn2gwnYvFsrtF1FyrsFyryqkas3Wry0yFWU
        XF4rKFWj9r10y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUbh0ePUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

update to commit 481cc97349d6 ("mm,doc: Add new
documentation structure")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/vm/bootmem.rst         | 14 +++++++
 Documentation/translations/zh_CN/vm/index.rst | 37 +++++++++++++++----
 Documentation/translations/zh_CN/vm/oom.rst   | 14 +++++++
 .../translations/zh_CN/vm/page_allocation.rst | 14 +++++++
 .../translations/zh_CN/vm/page_cache.rst      | 14 +++++++
 .../translations/zh_CN/vm/page_reclaim.rst    | 14 +++++++
 .../translations/zh_CN/vm/page_tables.rst     | 14 +++++++
 .../translations/zh_CN/vm/physical_memory.rst | 14 +++++++
 .../translations/zh_CN/vm/process_addrs.rst   | 14 +++++++
 Documentation/translations/zh_CN/vm/shmfs.rst | 14 +++++++
 Documentation/translations/zh_CN/vm/slab.rst  | 14 +++++++
 Documentation/translations/zh_CN/vm/swap.rst  | 14 +++++++
 .../translations/zh_CN/vm/vmalloc.rst         | 14 +++++++
 13 files changed, 198 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
 create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_allocation.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_tables.rst
 create mode 100644 Documentation/translations/zh_CN/vm/physical_memory.rst
 create mode 100644 Documentation/translations/zh_CN/vm/process_addrs.rst
 create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
 create mode 100644 Documentation/translations/zh_CN/vm/slab.rst
 create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
 create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst

diff --git a/Documentation/translations/zh_CN/vm/bootmem.rst b/Documentation/translations/zh_CN/vm/bootmem.rst
new file mode 100644
index 000000000000..8f8fa82281f1
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/bootmem.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/bootmem.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+启动内存
+========
diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index a1c6d529b6ff..a02929bb0d31 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -12,11 +12,36 @@
 Linux内存管理文档
 =================
 
-这是一个关于Linux内存管理（mm）子系统内部的文档集，其中有不同层次的细节，包括注释
-和邮件列表的回复，用于阐述数据结构和算法的基本情况。如果你正在寻找关于简单分配内存的建
-议，请参阅(Documentation/translations/zh_CN/core-api/memory-allocation.rst)。
-对于控制和调整指南，请参阅(Documentation/admin-guide/mm/index)。
-TODO:待引用文档集被翻译完毕后请及时修改此处）
+这是一份关于了解Linux的内存管理子系统的指南。如果你正在寻找关于简单分配内存的
+建议，请参阅内存分配指南
+(Documentation/translations/zh_CN/core-api/memory-allocation.rst)。
+关于控制和调整的指南，请看管理指南
+(Documentation/translations/zh_CN/admin-guide/mm/index.rst)。
+
+
+.. toctree::
+   :maxdepth: 1
+
+   physical_memory
+   page_tables
+   process_addrs
+   bootmem
+   page_allocation
+   vmalloc
+   slab
+   highmem
+   page_reclaim
+   swap
+   page_cache
+   shmfs
+   oom
+
+遗留文档
+========
+
+这是一个关于Linux内存管理（MM）子系统内部的旧文档的集合，其中有不同层次的细节，
+包括注释和邮件列表的回复，用于阐述数据结构和算法的描述。它应该被很好地整合到上述
+结构化的文档中，如果它已经完成了它的使命，可以删除。
 
 .. toctree::
    :maxdepth: 1
@@ -25,7 +50,6 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    balance
    damon/index
    free_page_reporting
-   highmem
    ksm
    frontswap
    hmm
@@ -48,7 +72,6 @@ TODOLIST:
 * free_page_reporting
 * hugetlbfs_reserv
 * page_migration
-* slub
 * transhuge
 * unevictable-lru
 * vmalloced-kernel-stacks
diff --git a/Documentation/translations/zh_CN/vm/oom.rst b/Documentation/translations/zh_CN/vm/oom.rst
new file mode 100644
index 000000000000..633b02d79f24
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/oom.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/oom.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+============
+内存不足处理
+============
diff --git a/Documentation/translations/zh_CN/vm/page_allocation.rst b/Documentation/translations/zh_CN/vm/page_allocation.rst
new file mode 100644
index 000000000000..3d5b2743d96a
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/page_allocation.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/page_allocation.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+页面分配
+========
diff --git a/Documentation/translations/zh_CN/vm/page_cache.rst b/Documentation/translations/zh_CN/vm/page_cache.rst
new file mode 100644
index 000000000000..b0c9c72ccde8
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/page_cache.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/page_cache.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+页面缓存
+========
diff --git a/Documentation/translations/zh_CN/vm/page_reclaim.rst b/Documentation/translations/zh_CN/vm/page_reclaim.rst
new file mode 100644
index 000000000000..83275afc07bf
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/page_reclaim.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/page_reclaim.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+页面回收
+========
diff --git a/Documentation/translations/zh_CN/vm/page_tables.rst b/Documentation/translations/zh_CN/vm/page_tables.rst
new file mode 100644
index 000000000000..b525d8f0438c
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/page_tables.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/page_tables.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+====
+页表
+====
diff --git a/Documentation/translations/zh_CN/vm/physical_memory.rst b/Documentation/translations/zh_CN/vm/physical_memory.rst
new file mode 100644
index 000000000000..129962d496ce
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/physical_memory.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/physical_memory.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+物理内存
+========
diff --git a/Documentation/translations/zh_CN/vm/process_addrs.rst b/Documentation/translations/zh_CN/vm/process_addrs.rst
new file mode 100644
index 000000000000..c1319938101b
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/process_addrs.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/process_addrs.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+进程地址
+========
diff --git a/Documentation/translations/zh_CN/vm/shmfs.rst b/Documentation/translations/zh_CN/vm/shmfs.rst
new file mode 100644
index 000000000000..2987939f5e25
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/shmfs.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/shmfs.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+================
+共享内存文件系统
+================
diff --git a/Documentation/translations/zh_CN/vm/slab.rst b/Documentation/translations/zh_CN/vm/slab.rst
new file mode 100644
index 000000000000..0af77c8612b8
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/slab.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/slab.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+Slab分配
+========
diff --git a/Documentation/translations/zh_CN/vm/swap.rst b/Documentation/translations/zh_CN/vm/swap.rst
new file mode 100644
index 000000000000..1c1a3e61a80c
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/swap.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/swap.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+交换内存
+========
diff --git a/Documentation/translations/zh_CN/vm/vmalloc.rst b/Documentation/translations/zh_CN/vm/vmalloc.rst
new file mode 100644
index 000000000000..d65ed70642c9
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/vmalloc.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/vmalloc.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+================
+连续虚拟内存分配
+================
-- 
2.27.0

