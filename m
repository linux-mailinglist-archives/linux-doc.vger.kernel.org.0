Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A5E3DCB99
	for <lists+linux-doc@lfdr.de>; Sun,  1 Aug 2021 14:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhHAMZi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 1 Aug 2021 08:25:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53398 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231577AbhHAMZg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Aug 2021 08:25:36 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL+OrkgZhQeonAA--.4804S5;
        Sun, 01 Aug 2021 20:25:19 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenweiguang82@126.com,
        siyanteng01@gmail.com
Subject: [PATCH v2 3/8] docs/zh_CN: add infiniband ipoib translation
Date:   Sun,  1 Aug 2021 20:25:33 +0800
Message-Id: <32ce0e1ab5e4ef37330ac255445ef43c092acde5.1627820210.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1627820210.git.siyanteng@loongson.cn>
References: <cover.1627820210.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL+OrkgZhQeonAA--.4804S5
X-Coremail-Antispam: 1UD129KBjvJXoW3WFyUurWUtw4UJF4xKw1kuFg_yoW7KFWUpr
        n7uF97Kw17GFyay397Cr4UX347Jas7Cw15Cr1vgas8JFn5JayfJrn0k345CFs2gFy8urWU
        XF4fuF17Cw4SkwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
        JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
        14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
        kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
        wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
        4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5U
        UUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/infiniband/ipoib.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/infiniband/index.rst   |   2 +-
 .../translations/zh_CN/infiniband/ipoib.rst   | 111 ++++++++++++++++++
 2 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/ipoib.rst

diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
index cc00f31c77d0..da5e2821f767 100644
--- a/Documentation/translations/zh_CN/infiniband/index.rst
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -23,10 +23,10 @@ infiniband
    :maxdepth: 1
 
    core_locking
+   ipoib
 
 TODOLIST:
 
-   ipoib
    opa_vnic
    sysfs
    tag_matching
diff --git a/Documentation/translations/zh_CN/infiniband/ipoib.rst b/Documentation/translations/zh_CN/infiniband/ipoib.rst
new file mode 100644
index 000000000000..56517ea5fe9d
--- /dev/null
+++ b/Documentation/translations/zh_CN/infiniband/ipoib.rst
@@ -0,0 +1,111 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/infiniband/ipoib.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 王普宇 Puyu Wang <realpuyuwang@gmail.com>
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_infiniband_ipoib:
+
+=========================
+infiniband上的IP（IPoIB）
+=========================
+
+  ib_ipoib驱动是IETF ipoib工作组发布的RFC 4391和4392所规定的
+  infiniband上IP协议的一个实现。它是一个“本地”实现，即把接口类型设置为
+  ARPHRD_INFINIBAND，硬件地址长度为20（早期的专有实现向内核伪装为以太网
+  接口）。
+
+分区和P_Keys
+============
+
+  当IPoIB驱动被加载时，它会使用索引为0的P_Key给每个端口创建一个接口。要用
+  不同的P_Key创建一个接口，将所需的P_Key写入主接口的
+  /sys/class/net/<intf name>/create_child文件里面。比如说::
+
+    echo 0x8001 > /sys/class/net/ib0/create_child
+
+  这将用P_Key 0x8001创建一个名为ib0.8001的接口。要删除一个子接口，使用
+  ``delete_child`` 文件::
+
+    echo 0x8001 > /sys/class/net/ib0/delete_child
+
+  任何接口的P_Key都由“pkey”文件给出，而子接口的主接口在“parent”中。
+
+  子接口的创建/删除也可以使用IPoIB的rtnl_link_ops来完成，使用两种
+  方式创建的子接口的行为是一样的。
+
+数据报与连接模式
+================
+
+  IPoIB驱动支持两种操作模式：数据报和连接。模式是通过接口的
+  /sys/class/net/<intf name>/mode文件设置和读取的。
+
+  在数据报模式下，使用IB UD（不可靠数据报）传输，因此接口MTU等于IB L2 MTU
+  减去IPoIB封装头（4字节）。例如，在一个典型的具有2K MTU的IB结构中，IPoIB
+  MTU将是2048 - 4 = 2044字节。
+
+  在连接模式下，使用IB RC（可靠的连接）传输。连接模式利用IB传输的连接特性，
+  允许MTU达到最大的IP包大小64K，这减少了处理大型UDP数据包、TCP段等所需的
+  IP包数量，提高了大型信息的性能。
+
+  在连接模式下，接口的UD QP仍被用于组播和与不支持连接模式的对等体的通信。
+  在这种情况下，ICMP PMTU数据包的RX仿真被用来使网络堆栈对这些邻居使用较
+  小的UD MTU。
+
+无状态卸载
+==========
+
+  如果IB HW支持IPoIB无状态卸载，IPoIB会向网络堆栈广播TCP/IP校验和/或大量
+  传送（LSO）负载转移能力。
+
+  大量传送（LSO）负载转移也已实现，可以使用ethtool调用打开/关闭。目前，LRO
+  只支持具有校验和卸载能力的设备。
+
+  无状态卸载只在数据报模式下支持。
+
+中断管理
+========
+
+  如果底层IB设备支持CQ事件管理，可以使用ethtool来设置中断缓解参数，从而减少
+  处理中断产生的开销。IPoIB的主要代码路径不使用TX完成信号的事件，所以只支持
+  RX管理。
+
+调试信息
+========
+
+  通过将CONFIG_INFINIBAND_IPOIB_DEBUG设置为“y”来编译IPoIB驱动，跟踪信
+  息被编译到驱动中。通过将模块参数debug_level和mcast_debug_level设置为1来
+  打开它们。这些参数可以在运行时通过/sys/module/ib_ipoib/的文件来控制。
+
+  CONFIG_INFINIBAND_IPOIB_DEBUG也启用debugfs虚拟文件系统中的文件。通过挂
+  载这个文件系统，例如用::
+
+    mount -t debugfs none /sys/kernel/debug
+
+  可以从/sys/kernel/debug/ipoib/ib0_mcg等文件中获得关于多播组的统计数据。
+
+  这个选项对性能的影响可以忽略不计，所以在正常运行时，在debug_level设置为
+  0的情况下启用这个选项是安全的。
+
+  CONFIG_INFINIBAND_IPOIB_DEBUG_DATA当data_debug_level设置为1时，可以
+  在数据路径中启用更多的调试输出。 然而，即使禁用输出，启用这个配置选项也
+  会影响性能，因为它在快速路径中增加了测试。
+
+引用
+====
+
+  在InfiniBand上传输IP（IPoIB）（RFC 4391）。
+    http://ietf.org/rfc/rfc4391.txt
+
+  infiniband上的IP:上的IP架构（RFC 4392）。
+    http://ietf.org/rfc/rfc4392.txt
+
+  infiniband上的IP: 连接模式 (RFC 4755)
+    http://ietf.org/rfc/rfc4755.txt
-- 
2.27.0

