Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB7B37B7BC
	for <lists+linux-doc@lfdr.de>; Wed, 12 May 2021 10:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhELIVe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 May 2021 04:21:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50688 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230184AbhELIVd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 04:21:33 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP+7Aj5tgJWQVAA--.17234S3;
        Wed, 12 May 2021 16:20:20 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH v4 1/3] docs/zh_CN: add parisc index translation
Date:   Wed, 12 May 2021 16:20:57 +0800
Message-Id: <c13ce34b11a65e1f18c4e37566509ead82f2c15f.1620805100.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1620805100.git.siyanteng@loongson.cn>
References: <cover.1620805100.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP+7Aj5tgJWQVAA--.17234S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4kGw47urWrJry3ur1xKrg_yoW8WFW5pF
        9rK34fK3W8X347CrWfGF17Gr17G3WxCayDJa1IqwnYqrn8Jr4Fyrs8tryYgF97WrWFvFWU
        XF4fKFW5Gryjkw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
        6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
        Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
        Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
        IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5UUUUU
        =
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/parisc/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/parisc/index.rst       | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/parisc/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index d56d6b7092e6..420c0a809357 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -153,6 +153,7 @@ TODOList:
    arm64/index
    riscv/index
    openrisc/index
+   parisc/index
 
 TODOList:
 
@@ -160,7 +161,6 @@ TODOList:
 * ia64/index
 * m68k/index
 * nios2/index
-* parisc/index
 * powerpc/index
 * s390/index
 * sh/index
diff --git a/Documentation/translations/zh_CN/parisc/index.rst b/Documentation/translations/zh_CN/parisc/index.rst
new file mode 100644
index 000000000000..ef232d46b1ba
--- /dev/null
+++ b/Documentation/translations/zh_CN/parisc/index.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/parisc/index.rst
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_parisc_index:
+
+====================
+PA-RISC体系架构
+====================
+
+Todolist:
+
+   debugging
+   registers
+   features
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.27.0

