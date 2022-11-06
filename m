Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB57661E092
	for <lists+linux-doc@lfdr.de>; Sun,  6 Nov 2022 08:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiKFHAB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 6 Nov 2022 02:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiKFHAA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Nov 2022 02:00:00 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8368E95B4
        for <linux-doc@vger.kernel.org>; Sat,  5 Nov 2022 23:59:58 -0700 (PDT)
Received: from loongson.cn (unknown [223.106.24.7])
        by gateway (Coremail) with SMTP id _____8CxPLZsW2djCMAEAA--.4019S3;
        Sun, 06 Nov 2022 14:59:56 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.24.7])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx9VZpW2djQfANAA--.20658S5;
        Sun, 06 Nov 2022 14:59:55 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V3 3/3] docs/zh_CN: core-api: Add errseq Chinese translation
Date:   Sun,  6 Nov 2022 14:57:50 +0800
Message-Id: <c37e966605f333690bfc998aec310d659812cdd9.1666689138.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666689138.git.zhoubinbin@loongson.cn>
References: <cover.1666689138.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx9VZpW2djQfANAA--.20658S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxtryrur1DtrW3Gr4xJw1fWFg_yoW3KFWkpr
        nIy34fKF48XryDZrsrKr1DAr1kJa48Wrs8GayxGFySqF1kArW5trs8Aw48Ja4fCryIya4a
        vr4FgrySyry2yw7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b3xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2kK
        e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E
        5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAV
        WUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY
        1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
        0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
        U8EeHDUUUUU==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate core-api/errseq.rst into Chinese.

Last English version used:

commit 14ebc28e07e6 ("errseq: Add to documentation tree").

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/core-api/errseq.rst    | 145 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   5 -
 2 files changed, 145 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst

diff --git a/Documentation/translations/zh_CN/core-api/errseq.rst b/Documentation/translations/zh_CN/core-api/errseq.rst
new file mode 100644
index 000000000000..8fdc8eab46c0
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/errseq.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/errseq.rst
+
+:翻译:
+
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
+
+:校译:
+
+ 吴想成 Wu Xiangcheng <bobwxc@email.cn>
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+================
+errseq_t数据类型
+================
+
+``errseq_t`` 是一种在一个地方记录错误的方法，并允许任意数量的 ``订阅者`` 判断自上
+次采样点以来是否发生了变化。
+
+最初的用例是跟踪文件同步系统调用（ ``fsync``, ``fdatasync``, ``msync`` 和
+``sync_file_range`` ）的错误，但它也可以用于其他情况。
+
+它被实现为一个无符号的32位值。低位被指定保存错误代码（在1和MAX_ERRNO之间）。高位
+用作计数器。这里是用原子操作而不是锁来完成的，因此可以从任何上下文中调用这些函数。
+
+请注意，如果频繁记录新错误，则存在冲突风险，因为我们用作计数器的位很少。
+
+为了缓解这种情况，错误值和计数器之间的位被用作一个标志，以判断自记录新值以来是否
+对该值进行了采样。这使我们能够避免在上次记录错误后没有人取样的情况下碰撞计数器。
+
+因此，我们得到了一个类似这样的值：
+
++--------------------------------------+------+------------------------+
+| 31..13                               |  12  | 11..0                  |
++--------------------------------------+------+------------------------+
+| 计数器                               | 标志 | 错误值                 |
++--------------------------------------+------+------------------------+
+
+总体思路是让 ``观察者`` 对errseq_t值进行采样，并将其保留为运行游标。该值稍后可用
+于判断自采样完成后是否发生了任何新错误，并原子地记录检查时的状态。这使得我们能在
+一个地方记录错误，然后有许多 ``观察者`` 可以判断自上次检查以来该值是否发生了变化。
+
+新的errseq_t应始终清零。全零的errseq_t值是从未出现错误的特殊（但常见）情况。因此，
+如果您希望知道自首次初始化以来是否曾经有过错误集，则全零值被用作 ``新纪元`` 。
+
+API的使用方法
+=============
+
+让我给你们讲一个关于员工drone的故事。现在，他总体上是个好员工，但公司有点...管理
+繁重。他今天必须向77名主管汇报，明天 ``大老板`` 要从外地赶来，他肯定也会考验这个
+可怜的家伙。
+
+他们都把工作交给他去做---多到他都记不住谁交给他什么了，但这并不是什么大问题。主管
+们只想知道他什么时候完成他们迄今为止交给他的所有工作，以及自从他们上次询问以来他
+是否犯了任何错误。
+
+他可能在他们实际上并没有交给他的工作上犯了错误，但他无法在那么详细的层面上记录事
+情，他所能记得的只是他最近犯的错误。
+
+下面是我们 ``worker_drone`` 的表达式::
+
+        struct worker_drone {
+                errseq_t        wd_err; /* 用来记录错误 */
+        };
+
+每天， ``worker_drone`` 都是以一张白纸开始的::
+
+        struct worker_drone wd;
+
+        wd.wd_err = (errseq_t)0;
+
+主管们进来后对当天的工作进行初步了解。他们并不关心在他们观察开始之前发生的任何事
+情::
+
+        struct supervisor {
+                errseq_t        s_wd_err; /* wd_err的私有“游标” */
+                spinlock_t      s_wd_err_lock; /* 保护s_wd_err */
+        }
+
+        struct supervisor       su;
+
+        su.s_wd_err = errseq_sample(&wd.wd_err);
+        spin_lock_init(&su.s_wd_err_lock);
+
+现在他们开始给他布置任务。每隔几分钟，他们就要求他完成迄今为止交给他的所有工作。
+然后问他是否有犯任何错误::
+
+        spin_lock(&su.su_wd_err_lock);
+        err = errseq_check_and_advance(&wd.wd_err, &su.s_wd_err);
+        spin_unlock(&su.su_wd_err_lock);
+
+到目前为止，它只是不断返回0。
+
+现在，这家公司的老板非常吝啬，给了他不合格的设备来完成他的工作。偶尔设备会出现故
+障，导致他犯错。他重重地叹了一口气，并把它记录下来::
+
+        errseq_set(&wd.wd_err, -EIO);
+
+...然后继续工作。主管们最终会再次检查，他们在下次检查时都会发现这个错误。后续的调
+用将返回0，直到记录下另一个错误，此时将向每个调用报告一次。
+
+请注意，主管们无法知道他们犯了多少错误，只能知道自上次检查以来是否犯了一个错误，
+以及记录的最新值。
+
+偶尔，大老板会来抽查，要求员工为他做一次性的工作。他并不像主管们那样全职观察员工，
+但他确实需要知道在他的工作处理过程中是否发生了错误。
+
+他只需对员工当前的errseq_t进行采样，然后用它来判断后来是否发生了错误::
+
+        errseq_t since = errseq_sample(&wd.wd_err);
+        /* 提交一些工作，等待完成 */
+        err = errseq_check(&wd.wd_err, since);
+
+由于他只是在采样点后丢弃 ``since`` 变量（since即是采样点），所以不需要在这里保存
+更新它。同时他也不需要任何锁，因为它不能被其他人使用。
+
+序列化更新errseq_t游标
+======================
+
+请注意，errseq_t API在check_and_advance_operation期间不保护errseq_t游标。只有典型
+的错误代码是被原子化处理的。在多任务同时使用同一个errseq_t游标的情况下，对该游标
+的更新进行序列化是很重要的。
+
+如果不这样做，那么游标就有可能向后移动。在这种情况下，同一个错误可能被报告多次。
+
+因此，通常先执行errseq_check检查是否有任何变化，然后在获取锁后才执行
+errseq_check_and_advance。例如::
+
+        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err)) {
+                /* su.s_wd_err被s_wd_err_lock保护 */
+                spin_lock(&su.s_wd_err_lock);
+                err = errseq_check_and_advance(&wd.wd_err, &su.s_wd_err);
+                spin_unlock(&su.s_wd_err_lock);
+        }
+
+这就避免了自上次检查以来没有任何变化的常见情况下的自旋锁。
+
+函数
+====
+
+该API在以下内核代码中:
+
+lib/errseq.c
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index d08091036066..8b19c6ae9704 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -50,11 +50,6 @@
    packing
    this_cpu_ops
    timekeeping
-
-Todolist:
-
-
-
    errseq
 
 并发原语
-- 
2.31.1

