Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99AD5512FF6
	for <lists+linux-doc@lfdr.de>; Thu, 28 Apr 2022 11:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbiD1Jtj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 28 Apr 2022 05:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344880AbiD1JXD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Apr 2022 05:23:03 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 65DC76D963
        for <linux-doc@vger.kernel.org>; Thu, 28 Apr 2022 02:19:48 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.130])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9ssXGpiNWkBAA--.7498S3;
        Thu, 28 Apr 2022 17:19:42 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 1/2] docs/zh_CN: add vm page_migration translation
Date:   Thu, 28 Apr 2022 17:20:20 +0800
Message-Id: <de1db608f6c831818548a2e0bba8f523404d0156.1651137289.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1651137289.git.siyanteng@loongson.cn>
References: <cover.1651137289.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP9ssXGpiNWkBAA--.7498S3
X-Coremail-Antispam: 1UD129KBjvAXoW3tF4DWw1ktrWkZryxtFy3XFb_yoW8Wr1fto
        WSka1fCa1kAF13Ka4xt3y7JFy8Wr15Cry8uws8Kr43ZFy29w1fGa1kJwsFyry3Zr98ta13
        tF18Jws2yayjg3Wxn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYu7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M28IrcIa0x
        kI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
        jcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4fMxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjuOJ5UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_05,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/page_migration.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 .../translations/zh_CN/vm/page_migration.rst  | 229 ++++++++++++++++++
 2 files changed, 230 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/page_migration.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 61cd39cefdcf..467ac3666fc0 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -34,6 +34,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    mmu_notifier
    overcommit-accounting
    page_frags
+   page_migration
    page_owner
    page_table_check
    remap_file_pages
@@ -47,7 +48,6 @@ TODOLIST:
 * hmm
 * hugetlbfs_reserv
 * numa
-* page_migration
 * slub
 * transhuge
 * unevictable-lru
diff --git a/Documentation/translations/zh_CN/vm/page_migration.rst b/Documentation/translations/zh_CN/vm/page_migration.rst
new file mode 100644
index 000000000000..a0cfafd92a6d
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/page_migration.rst
@@ -0,0 +1,229 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+页面迁移
+========
+
+页面迁移允许在进程运行时在NUMA系统的节点之间移动页面的物理位置。这意味着进程所看到的虚拟地
+址并没有改变。然而，系统会重新安排这些页面的物理位置。
+
+也可以参见 :ref: `<异构内存管理 (HMM)>`用于将页面迁移到设备私有内存或从设备私有内存中迁移` 。
+
+页面迁移的主要目的是通过将页面移到访问该内存的进程所运行的处理器附近来减少内存访问的延迟。
+
+页面迁移允许进程通过MF_MOVE和MF_MOVE_ALL选项手动重新定位其页面所在的节点，同时通过
+mbind()设置一个新的内存策略。一个进程的页面也可以通过sys_migrate_pages()函数调用从另
+一个进程重新定位。migrate_pages()函数调用接收两组节点，并将一个进程位于从节点上的页面移
+动到目标节点上。页面迁移功能由Andi Kleen的numactl包提供(需要0.9.3以上的版本，其仓库
+地址https://github.com/numactl/numactl.git)。numactl提供了libnuma，它为页面迁移
+提供了与其他NUMA功能类似的接口。 ``/proc/<pid>/numa_maps``  允许轻松查看进程的页面位
+置。参见proc(5)手册中的numa_maps文档。
+
+如果调度程序将一个进程重新安置到一个遥远的节点上的处理器，手动迁移是很有用的。批量调度程序
+或管理员可以检测到这种情况，并将进程的页面移到新处理器附近。内核本身只提供手动的页迁移支持。
+自动的页面迁移可以通过用户空间的进程移动页面来实现。一个特殊的函数调用 "move_pages" 允许
+在一个进程中移动单个页面。例如，NUMA分析器可以获得一个显示频繁的节点外访问的日志，并可以使
+用这个结果将页面移动到更有利的位置。
+
+较大型的设备通常使用cpusets将系统分割成若干个节点。Paul Jackson为cpusets配备了当任务被
+转移到另一个cpuset时移动页面的能力(见:ref:`CPUSETS <cpusets>`)。Cpusets允许进程定
+位的自动化。如果一个任务被移到一个新的cpuset上，那么它的所有页面也会随之移动，这样进程的
+性能就不会急剧下降。如果cpuset允许的内存节点发生变化，cpuset中的进程页也会被移动。
+
+页面迁移允许为所有迁移技术保留一组节点中页面的相对位置，这将保留迁移一个进程后生成的特定
+内存分配模式。为了保留内存延迟，这一点是必要的。迁移后的进程将以类似的性能运行。
+
+页面迁移分几个步骤进行。首先为那些试图从内核中使用migrate_pages()的进程做一个高水平的
+描述（对于用户空间的使用，可以参考上面提到的Andi Kleen的numactl包），然后对低水平的细
+节工作做一个低水平描述。
+
+在内核中使用 migrate_pages()
+============================
+
+1. 从LRU中移除页面。
+
+   要迁移的页面列表是通过扫描页面并把它们移到列表中来生成的。这是通过调用 isolate_lru_page()
+   来完成的。调用isolate_lru_page()增加了对该页的引用，这样在页面迁移发生时它就不会
+   消失。它还可以防止交换器或其他扫描器遇到该页。
+
+
+2. 我们需要有一个new_page_t类型的函数，可以传递给migrate_pages()。这个函数应该计算
+   出如何在给定的旧页面中分配正确的新页面。
+
+3. migrate_pages()函数被调用，它试图进行迁移。它将调用该函数为每个被考虑迁移的页面分
+   配新的页面。
+
+migrate_pages()如何工作
+=======================
+
+migrate_pages()对它的页面列表进行了多次处理。如果当时对一个页面的所有引用都可以被移除，
+那么这个页面就会被移动。该页已经通过isolate_lru_page()从LRU中移除，并且refcount被
+增加，以便在页面迁移发生时不释放该页。
+
+步骤:
+
+1. 锁定要迁移的页面。
+
+2. 确保回写已经完成。
+
+3. 锁定我们要迁移到的新页面。锁定它是为了在迁移过程中立即阻止对这个（尚未更新的）页面的
+   访问。
+
+4. 所有对该页的页表引用都被转换为迁移条目。这就减少了一个页面的mapcount。如果产生的
+   mapcount不是零，那么我们就不迁移该页。所有试图访问该页的用户空间进程现在将等待页
+   面锁或者等待迁移页表项被移除。
+
+5. i_pages的锁被拿走了。这将导致所有试图通过映射访问该页的进程在自旋锁上阻塞。
+
+6. 检查该页的Refcount，如果还有引用，我们就退出。否则，我们知道我们是唯一引用这个页
+   面的人。
+
+7. 检查基数树，如果它不包含指向这个页面的指针，那么我们就退出，因为其他人修改了基数树。
+
+8. 新的页面要用旧的页面的一些设置进行预处理，这样访问新的页面就会发现一个具有正确设置
+   的页面。
+
+9. 基数树被改变以指向新的页面。
+
+10. 旧页的引用计数被删除，因为地址空间的引用已经消失。对新页的引用被建立，因为新页被
+    地址空间引用。
+
+11. i_pages锁被放弃。这样一来，在映射中的查找又变得可能了。进程将从在锁上旋转转到在
+    被锁的新页上睡眠。
+
+12. 页面内容被复制到新的页面上。
+
+13. 剩余的页面标志被复制到新的页面上。
+
+14. 旧的页面标志被清除，以表明该页面不再提供任何信息。
+
+15. 新页面上的回写队列被触发了。
+
+16. 如果迁移条目被插入到页表中，那么就用真正的ptes替换它们。这样做将使那些尚未等待页
+    锁的用户空间进程能够访问。
+
+17. 页面锁从新旧页面上被撤销。等待页锁的进程将重做他们的缺页异常，并将到达新的页面。
+
+18. 新的页面被移到LRU中，可以被交换器等再次扫描。
+
+非LRU页面迁移
+=============
+
+尽管迁移最初的目的是为了减少NUMA的内存访问延迟，但压缩也使用迁移来创建高阶页面。
+
+目前实现的问题是，它被设计为只迁移*LRU*页。然而，有一些潜在的非LRU页面可以在驱动中
+被迁移，例如，zsmalloc，virtio-balloon页面。
+
+对于virtio-balloon页面，迁移代码路径的某些部分已经被钩住，并添加了virtio-balloon
+的特定函数来拦截迁移逻辑。这对一个驱动来说太特殊了，所以其他想让自己的页面可移动的驱
+动就必须在迁移路径中添加自己的特定钩子。
+
+为了克服这个问题，VM支持非LRU页面迁移，它为非LRU可移动页面提供了通用函数，而在迁移
+路径中没有特定的驱动程序挂钩。
+
+如果一个驱动程序想让它的页面可移动，它应该定义三个函数，这些函数是
+struct address_space_operations的函数指针。
+
+1. ``bool (*isolate_page) (struct page *page, isolate_mode_t mode);``
+
+   VM对驱动的isolate_page()函数的期望是，如果驱动成功隔离了该页，则返回true。
+   返回true后，VM会将该页标记为PG_isolated，这样多个CPU的并发隔离就会跳过该
+   页进行隔离。如果驱动程序不能隔离该页，它应该返回*false*。
+
+   一旦页面被成功隔离，VM就会使用page.lru字段，因此驱动程序不应期望保留这些字段的值。
+
+2. ``int (*migratepage) (struct address_space *mapping,``
+|	``struct page *newpage, struct page *oldpage, enum migrate_mode);``
+
+   隔离后，虚拟机用隔离的页面调用驱动的migratepage()。migratepage()的功能是将旧页
+   的内容移动到新页，并设置struct page newpage的字段。请记住，如果你成功迁移了旧页
+   并返回MIGRATEPAGE_SUCCESS，你应该通过page_lock下的__ClearPageMovable()向虚
+   拟机表明旧页不再可移动。如果驱动暂时不能迁移该页，驱动可以返回-EAGAIN。在-EAGAIN
+   时，VM会在短时间内重试页面迁移，因为VM将-EAGAIN理解为 "临时迁移失败"。在返回除
+   -EAGAIN以外的任何错误时，VM将放弃页面迁移而不重试。
+
+   在migratepage()函数中，驱动程序不应该接触page.lru字段。
+
+3. ``void (*putback_page)(struct page *);``
+
+   如果在隔离页上迁移失败，VM应该将隔离页返回给驱动，因此VM用隔离页调用驱动的
+   putback_page()。在这个函数中，驱动应该把隔离页放回自己的数据结构中。
+
+非LRU可移动页标志
+
+   有两个页面标志用于支持非LRU可移动页面。
+
+   * PG_movable
+
+     驱动应该使用下面的函数来使页面在page_lock下可移动。::
+
+	void __SetPageMovable(struct page *page, struct address_space *mapping)
+
+     它需要address_space的参数来注册将被VM调用的migration family函数。确切地说，
+     PG_movable不是struct page的一个真正的标志。相反，VM复用了page->mapping的低
+     位来表示i::
+
+	#define PAGE_MAPPING_MOVABLE 0x2
+	page->mapping = page->mapping | PAGE_MAPPING_MOVABLE;
+
+     所以驱动不应该直接访问page->mapping。相反，驱动应该使用page_mapping()，它可
+     以在页面锁下屏蔽掉page->mapping的低2位，从而获得正确的struct address_space。
+
+     对于非LRU可移动页面的测试，VM支持__PageMovable()函数。然而，它并不能保证识别
+     非LRU可移动页面，因为page->mapping字段与struct page中的其他变量是统一的。如
+     果驱动程序在被虚拟机隔离后释放了页面，尽管page->mapping设置了PAGE_MAPPING_MOVABLE，
+     但它并没有一个稳定的值（看看__ClearPageMovable）。但是__PageMovable()在页
+     面被隔离后，无论页面是LRU还是非LRU可移动的，调用它开销都很低，因为LRU页面在
+     page->mapping中不可能有PAGE_MAPPING_MOVABLE设置。在用pfn扫描中的lock_page()
+     进行更大开销的检查来选择受害者之前，它也很适合只是偷看来测试非LRU可移动的页面。
+
+     为了保证非LRU的可移动页面，VM提供了PageMovable()函数。与__PageMovable()不
+     同，PageMovable()在lock_page()下验证page->mapping和
+     mapping->a_ops->isolate_page。lock_page()可以防止突然破坏page->mapping。
+
+     使用__SetPageMovable()的驱动应该在释放页面之前通过page_lock()下的
+     __ClearMovablePage()清除该标志。
+
+   * PG_isolated
+
+     为了防止几个CPU之间同时进行隔离，VM在lock_page()下将隔离的页面标记为PG_isolated。
+     因此，如果一个CPU遇到PG_isolated非LRU可移动页面，它可以跳过它。驱动程序不需要
+     操作这个标志，因为VM会自动设置/清除它。请记住，如果驱动程序看到PG_isolated页，
+     这意味着该页已经被虚拟机隔离，所以它不应该碰page.lru字段。PG_isolated标志与
+     PG_reclaim标志是同义的，所以驱动程序不应该为自己的目的使用PG_isolated。
+
+监测迁移
+========
+
+以下事件（计数器）可用于监控页面迁移。
+
+1. pgmigrate_success: 正常的页面迁移成功。每个计数器意味着一个页面被迁移了。如果该
+   页是一个非THP和非hugetlb页，那么这个计数器会增加1。如果该页面是一个THP或hugetlb
+   页面，那么这个计数器会随着THP或hugetlb子页面的数量而增加。例如，迁移一个有4KB大小
+   的基础页（子页）的2MB THP，将导致这个计数器增加512。
+
+2. PGMIGRATE_FAIL: 正常的页面迁移失败。与上面PGMIGRATE_SUCCESS的计数规则相同：如
+   果是THP或hugetlb，这个计数将被子页的数量增加。
+
+3. THP_MIGRATION_SUCCESS: 一个THP被迁移而没有被分割。
+
+4. THP_MIGRATION_FAIL: 一个THP不能被迁移，也不能被分割。
+
+5. THP_MIGRATION_SPLIT: 一个THP被迁移了，但不是这样的：首先，这个THP必须被分割。
+   在拆分之后，对它的子页面进行了迁移重试。
+
+THP_MIGRATION_* THP_MIGRATION_*事件也会更新相应的PGMIGRATE_SUCCESS或
+PGMIGRATE_FAIL事件。例如，一个THP迁移失败将导致THP_MIGRATION_FAIL和PGMIGRATE_FAIL
+增加。
+
+Christoph Lameter，2006年5月8日。
+
+Minchan Kim，2016年3月28日。
-- 
2.27.0

