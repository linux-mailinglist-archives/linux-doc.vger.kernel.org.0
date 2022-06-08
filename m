Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E97542278
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jun 2022 08:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233985AbiFHFho (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jun 2022 01:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234021AbiFHFhh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 01:37:37 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 489FD2FC0F8
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 20:04:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.64.16.213])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxf+awEaBiWKIoAA--.40690S3;
        Wed, 08 Jun 2022 11:04:17 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/3] docs/zh_CN: riscv: Update the translation of features.rst to 5.19-rc1
Date:   Wed,  8 Jun 2022 11:04:13 +0800
Message-Id: <23cf47b9dc7282d9cae7b121464108ff430956e1.1654652729.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654652729.git.zhoubinbin@loongson.cn>
References: <cover.1654652729.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxf+awEaBiWKIoAA--.40690S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw18WFWruF1Utr4UJr17Awb_yoW8GFyUp3
        W0gr1xC3Z3Jr17C3yfKF17Jr1UCF1xua98GFyjywnaqFs8JrsYyrs8tr98KFZ3Xry8ZFWU
        WFsYkry5CF1Yy3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48MxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I
        3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
        WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8I
        cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
        AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
        Xa7VUjwFxUUUUUU==
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Synchronous translation from upstream commit ed13a92d0fde
("docs: archis: add a per-architecture features list")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/translations/zh_CN/riscv/features.rst | 8 ++++++++
 Documentation/translations/zh_CN/riscv/index.rst    | 1 +
 2 files changed, 9 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/riscv/features.rst

diff --git a/Documentation/translations/zh_CN/riscv/features.rst b/Documentation/translations/zh_CN/riscv/features.rst
new file mode 100644
index 000000000000..193a07a3e163
--- /dev/null
+++ b/Documentation/translations/zh_CN/riscv/features.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/riscv/features.rst
+:Translator: Binbin Zhou <zhoubinbin@loongson.cn>
+
+.. kernel-feat:: $srctree/Documentation/features riscv
diff --git a/Documentation/translations/zh_CN/riscv/index.rst b/Documentation/translations/zh_CN/riscv/index.rst
index 614cde0c0997..5bb35dfd58aa 100644
--- a/Documentation/translations/zh_CN/riscv/index.rst
+++ b/Documentation/translations/zh_CN/riscv/index.rst
@@ -22,6 +22,7 @@ RISC-V 体系结构
     pmu
     patch-acceptance
 
+    features
 
 .. only::  subproject and html
 
-- 
2.20.1

