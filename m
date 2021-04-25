Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EECC36A468
	for <lists+linux-doc@lfdr.de>; Sun, 25 Apr 2021 05:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhDYDfy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 24 Apr 2021 23:35:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38584 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230449AbhDYDfx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 24 Apr 2021 23:35:53 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxHchf44Rg1ZMNAA--.595S3;
        Sun, 25 Apr 2021 11:35:00 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com,
        willy@infradead.org
Subject: [PATCH v2 1/3] docs/zh_CN: add core-api kernel-api.rst translation
Date:   Sun, 25 Apr 2021 11:35:39 +0800
Message-Id: <098e3a6e56166cbea613c82df318652cb751cc93.1619317151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1619317151.git.siyanteng@loongson.cn>
References: <cover.1619317151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxHchf44Rg1ZMNAA--.595S3
X-Coremail-Antispam: 1UD129KBjvJXoWfJrWxCry5XF1DXF43urW5GFg_yoWDXFy7pF
        nrurWxGrZ8Ary8Zw47ur48C3yUZa1rCw1Ykas7X34Fy342yF15ZwsrZFn3Xa4jg34qkr1U
        JFnrJFyF93y5Zw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUP014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
        IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjeWlDUU
        UUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/kernel-api.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   5 +-
 .../zh_CN/core-api/kernel-api.rst             | 385 ++++++++++++++++++
 2 files changed, 389 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/kernel-api.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index f1fa71e45c77..60e1566d57eb 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -19,9 +19,12 @@
 来的大量 kerneldoc 信息；有朝一日，若有人有动力的话，应当把它们拆分
 出来。
 
-Todolist:
+.. toctree::
+   :maxdepth: 1
 
    kernel-api
+
+Todolist:
    workqueue
    printk-basics
    printk-formats
diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
new file mode 100644
index 000000000000..666d81f6548a
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
@@ -0,0 +1,385 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/kernel-api
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_kernel-api.rst:
+
+
+============
+Linux内核API
+============
+
+
+列表管理函数
+============
+
+.. kernel-doc:: include/linux/list.h
+   :internal:
+
+基本的C库函数
+=============
+
+在编写驱动程序时，一般不能使用C库中的普通程序。部分函数通常很有用，它
+们在下面被列出。这些函数的行为可能会与ANSI定义的略有不同，这些偏差会
+在文中注明。
+
+字符串转换
+----------
+
+.. kernel-doc:: lib/vsprintf.c
+   :export:
+
+.. kernel-doc:: include/linux/kernel.h
+   :functions: kstrtol
+
+.. kernel-doc:: include/linux/kernel.h
+   :functions: kstrtoul
+
+.. kernel-doc:: lib/kstrtox.c
+   :export:
+
+.. kernel-doc:: lib/string_helpers.c
+   :export:
+
+字符串处理
+----------
+
+.. kernel-doc:: lib/string.c
+   :export:
+
+.. kernel-doc:: include/linux/string.h
+   :internal:
+
+.. kernel-doc:: mm/util.c
+   :functions: kstrdup kstrdup_const kstrndup kmemdup kmemdup_nul memdup_user
+               vmemdup_user strndup_user memdup_user_nul
+
+基本的内核库函数
+================
+
+Linux内核提供了很多基本的实用函数。
+
+位运算
+------
+
+.. kernel-doc:: include/asm-generic/bitops/instrumented-atomic.h
+   :internal:
+
+.. kernel-doc:: include/asm-generic/bitops/instrumented-non-atomic.h
+   :internal:
+
+.. kernel-doc:: include/asm-generic/bitops/instrumented-lock.h
+   :internal:
+
+位图运算
+--------
+
+.. kernel-doc:: lib/bitmap.c
+   :doc: bitmap introduction
+
+.. kernel-doc:: include/linux/bitmap.h
+   :doc: declare bitmap
+
+.. kernel-doc:: include/linux/bitmap.h
+   :doc: bitmap overview
+
+.. kernel-doc:: include/linux/bitmap.h
+   :doc: bitmap bitops
+
+.. kernel-doc:: lib/bitmap.c
+   :export:
+
+.. kernel-doc:: lib/bitmap.c
+   :internal:
+
+.. kernel-doc:: include/linux/bitmap.h
+   :internal:
+
+命令行解析
+----------
+
+.. kernel-doc:: lib/cmdline.c
+   :export:
+
+排序
+----
+
+.. kernel-doc:: lib/sort.c
+   :export:
+
+.. kernel-doc:: lib/list_sort.c
+   :export:
+
+文本检索
+--------
+
+.. kernel-doc:: lib/textsearch.c
+   :doc: ts_intro
+
+.. kernel-doc:: lib/textsearch.c
+   :export:
+
+.. kernel-doc:: include/linux/textsearch.h
+   :functions: textsearch_find textsearch_next \
+               textsearch_get_pattern textsearch_get_pattern_len
+
+Linux中的CRC和数学函数
+======================
+
+
+CRC函数
+-------
+
+*译注：CRC，Cyclic Redundancy Check，循环冗余校验*
+
+.. kernel-doc:: lib/crc4.c
+   :export:
+
+.. kernel-doc:: lib/crc7.c
+   :export:
+
+.. kernel-doc:: lib/crc8.c
+   :export:
+
+.. kernel-doc:: lib/crc16.c
+   :export:
+
+.. kernel-doc:: lib/crc32.c
+
+.. kernel-doc:: lib/crc-ccitt.c
+   :export:
+
+.. kernel-doc:: lib/crc-itu-t.c
+   :export:
+
+基数为2的对数和幂函数
+---------------------
+
+.. kernel-doc:: include/linux/log2.h
+   :internal:
+
+整数幂函数
+----------
+
+.. kernel-doc:: lib/math/int_pow.c
+   :export:
+
+.. kernel-doc:: lib/math/int_sqrt.c
+   :export:
+
+除法函数
+--------
+
+.. kernel-doc:: include/asm-generic/div64.h
+   :functions: do_div
+
+.. kernel-doc:: include/linux/math64.h
+   :internal:
+
+.. kernel-doc:: lib/math/div64.c
+   :functions: div_s64_rem div64_u64_rem div64_u64 div64_s64
+
+.. kernel-doc:: lib/math/gcd.c
+   :export:
+
+UUID/GUID
+---------
+
+.. kernel-doc:: lib/uuid.c
+   :export:
+
+内核IPC设备
+===========
+
+IPC实用程序
+-----------
+
+.. kernel-doc:: ipc/util.c
+   :internal:
+
+FIFO 缓冲区
+===========
+
+kfifo接口
+---------
+
+.. kernel-doc:: include/linux/kfifo.h
+   :internal:
+
+转发接口支持
+============
+
+转发接口支持旨在为工具和设备提供一种有效的机制，将大量数据从内核空间
+转发到用户空间。
+
+转发接口
+--------
+
+.. kernel-doc:: kernel/relay.c
+   :export:
+
+.. kernel-doc:: kernel/relay.c
+   :internal:
+
+模块支持
+========
+
+模块加载
+--------
+
+.. kernel-doc:: kernel/kmod.c
+   :export:
+
+模块接口支持
+------------
+
+更多信息请参考文件kernel/module.c。
+
+硬件接口
+========
+
+
+.. kernel-doc:: kernel/dma.c
+   :export:
+
+资源管理
+--------
+
+.. kernel-doc:: kernel/resource.c
+   :internal:
+
+.. kernel-doc:: kernel/resource.c
+   :export:
+
+MTRR处理
+--------
+
+.. kernel-doc:: arch/x86/kernel/cpu/mtrr/mtrr.c
+   :export:
+
+安全框架
+========
+
+.. kernel-doc:: security/security.c
+   :internal:
+
+.. kernel-doc:: security/inode.c
+   :export:
+
+审计接口
+========
+
+.. kernel-doc:: kernel/audit.c
+   :export:
+
+.. kernel-doc:: kernel/auditsc.c
+   :internal:
+
+.. kernel-doc:: kernel/auditfilter.c
+   :internal:
+
+核算框架
+========
+
+.. kernel-doc:: kernel/acct.c
+   :internal:
+
+块设备
+======
+
+.. kernel-doc:: block/blk-core.c
+   :export:
+
+.. kernel-doc:: block/blk-core.c
+   :internal:
+
+.. kernel-doc:: block/blk-map.c
+   :export:
+
+.. kernel-doc:: block/blk-sysfs.c
+   :internal:
+
+.. kernel-doc:: block/blk-settings.c
+   :export:
+
+.. kernel-doc:: block/blk-exec.c
+   :export:
+
+.. kernel-doc:: block/blk-flush.c
+   :export:
+
+.. kernel-doc:: block/blk-lib.c
+   :export:
+
+.. kernel-doc:: block/blk-integrity.c
+   :export:
+
+.. kernel-doc:: kernel/trace/blktrace.c
+   :internal:
+
+.. kernel-doc:: block/genhd.c
+   :internal:
+
+.. kernel-doc:: block/genhd.c
+   :export:
+
+字符设备
+========
+
+.. kernel-doc:: fs/char_dev.c
+   :export:
+
+时钟框架
+========
+
+时钟框架定义了编程接口，以支持系统时钟树的软件管理。该框架广泛用于系统级芯片（SOC）平
+台，以支持电源管理和各种可能需要自定义时钟速率的设备。请注意，这些 “时钟”与计时或实
+时时钟(RTC)无关，它们都有单独的框架。这些:c:type: `struct clk <clk>` 实例可用于管
+理例如96 MHz信号，该信号用于将位移入和移出外设或总线，或以其他方式触发系统硬件中的同
+步状态机转换。
+
+通过明确的软件时钟门控来支持电源管理：未使用的时钟被禁用，因此系统不会因为改变不在使用
+中的晶体管的状态而浪费电源。在某些系统中，这可能是由硬件时钟门控支持的，其中时钟被门控
+而不在软件中被禁用。芯片的部分，在供电但没有时钟的情况下，可能会保留其最后的状态。这种
+低功耗状态通常被称为*保留模式*。这种模式仍然会产生漏电流，特别是在电路几何结构较细的情
+况下，但对于CMOS电路来说，电源主要是通过时钟状态变化来使用的。
+
+电源感知驱动程序只有在其管理的设备处于活动使用状态时才会启用时钟。此外，系统睡眠状态通
+常根据哪些时钟域处于活动状态而有所不同：“待机”状态可能允许从多个活动域中唤醒，而
+"mem"（暂停到RAM）状态可能需要更全面地关闭来自高速PLL和振荡器的时钟，从而限制了可能
+的唤醒事件源的数量。驱动器的暂停方法可能需要注意目标睡眠状态的系统特定时钟约束。
+
+一些平台支持可编程时钟发生器。这些可以被各种外部芯片使用，如其他CPU、多媒体编解码器以
+及对接口时钟有严格要求的设备。
+
+.. kernel-doc:: include/linux/clk.h
+   :internal:
+
+同步原语
+========
+
+读-复制-更新（RCU）
+-------------------
+
+.. kernel-doc:: include/linux/rcupdate.h
+
+.. kernel-doc:: kernel/rcu/tree.c
+
+.. kernel-doc:: kernel/rcu/tree_exp.h
+
+.. kernel-doc:: kernel/rcu/update.c
+
+.. kernel-doc:: include/linux/srcu.h
+
+.. kernel-doc:: kernel/rcu/srcutree.c
+
+.. kernel-doc:: include/linux/rculist_bl.h
+
+.. kernel-doc:: include/linux/rculist.h
+
+.. kernel-doc:: include/linux/rculist_nulls.h
+
+.. kernel-doc:: include/linux/rcu_sync.h
+
+.. kernel-doc:: kernel/rcu/sync.c
-- 
2.27.0

