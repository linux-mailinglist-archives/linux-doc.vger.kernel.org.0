Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368716378A5
	for <lists+linux-doc@lfdr.de>; Thu, 24 Nov 2022 13:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiKXMLK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Nov 2022 07:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiKXMLH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Nov 2022 07:11:07 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7318E74A92
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 04:11:03 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8Bx1vBWX39jZ5IAAA--.1529S3;
        Thu, 24 Nov 2022 20:11:02 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxJldSX39jkmsZAA--.47690S4;
        Thu, 24 Nov 2022 20:11:02 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     chenhuacai@kernel.org, corbet@lwn.net, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, kernel@xen0n.name,
        wu.xiangcheng@linux.dev, jiaxun.yang@flygoat.com,
        liuyun@loongson.cn, linux-doc@vger.kernel.org,
        loongarch@lists.linux.dev, siyanteng01@gmail.com,
        Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v2 2/2] docs/zh_CN: Add boot-image-header Chinese translation
Date:   Thu, 24 Nov 2022 20:08:28 +0800
Message-Id: <36afc5e40e08c8f753e65f4531955fc173421797.1669291172.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669291172.git.siyanteng@loongson.cn>
References: <cover.1669291172.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxJldSX39jkmsZAA--.47690S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGFykZrWUCFWUZr1xXF4rGrg_yoWrXw4xpr
        9xGryxJF47JryUXr48Kr17JF1UJr1xG3W7WF10g34ktr4rZw15Ar1Utr9YqFy7G340yFyU
        Xry8tr1UGF1UAwUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
        kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5
        JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07jz5lbUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate ../loongarch/boot-image-header.rst into Chinese.

Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/loongarch/boot-image-header.rst     | 77 +++++++++++++++++++
 .../translations/zh_CN/loongarch/index.rst    |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/loongarch/boot-image-header.rst

diff --git a/Documentation/translations/zh_CN/loongarch/boot-image-header.rst b/Documentation/translations/zh_CN/loongarch/boot-image-header.rst
new file mode 100644
index 000000000000..e40889d4cb63
--- /dev/null
+++ b/Documentation/translations/zh_CN/loongarch/boot-image-header.rst
@@ -0,0 +1,77 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/loongarch/boot-image-header.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+=============================
+LoongArch Linux启动镜像文件头
+=============================
+
+:作者: 司延腾 <siyanteng@loongson.cn>
+:日期: 18 Nov 2022
+
+此文档仅描述LoongArch Linux 启动文件头详情。
+
+
+在非压缩的Linux内核镜像中存在以下64字节的文件头::
+
+	u32	MZ_MAGIC		/* "MZ", MS-DOS 头 */
+	u32	res0 = 0		/* 保留 */
+	u64	kernel_entry		/* 内核入口点 */
+	u64	_end - _text		/* 内核镜像有效大小 */
+	u64	0			/* 从RAM开始的加载内核镜像的偏移量 */
+	u64	res1 = 0		/* 保留 */
+	u64	res2 = 0		/* 保留 */
+	u64	res3 = 0		/* 保留 */
+	u32	res4 = 0		/* 保留 */
+	u32	pe_header - _head	/* 到PE头的偏移量 */
+
+
+镜像头注释
+==========
+
+目前LoongArch已经移除“magic”结构体成员。
+
+按照EFI规范的规定，在内核镜像的开始需要PE/COFF镜像文件头。当前LoongArch内核支持
+EFI stub，故内核镜像头最开始两字节为“MZ”魔术字符，且0x3c处应指向PE/COFF文件头的
+其余部分，在此之间，内核的入口点、有效镜像大小、镜像加载偏移布局如下::
+
+          +-----------------------------------------------+
+          |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |
+          +-----------------------------------------------+
+    0x00: |       MZ_MAGIC        |          res0         |
+          +-----------------------------------------------+
+    0x08: |                 kernel_entry                  |
+          +-----------------------------------------------+
+    0x10: |                  _end - _text                 |
+          +-----------------------------------------------+
+    0x18: |                       0                       |
+          +-----------------------------------------------+
+    0x20: |                      res1                     |
+          +-----------------------------------------------+
+    0x28: |                      res2                     |
+          +-----------------------------------------------+
+    0x30: |                      res3                     |
+          +-----------------------------------------------+
+    0x38: |          res4         |       PE header       |
+          +-----------------------------------------------+
+
+
+
+
+所有的位域都是小端序：
+
+    - MZ：有效长度为2字节；
+
+    - 内核入口点： 前留空6个字节，自0x8开始，有效长度为8字节；
+
+    - 内核镜像有效大小： 紧接内核入口点，有效长度为8字节，该成员对于引导器来说是必须的；
+
+    - 内核镜像加载偏移： 紧接内核镜像有效大小，有效长度为8字节；
+
+    - 到PE头的偏移量： 前留空28字节，自0x3c开始,有效长度为4字节。
diff --git a/Documentation/translations/zh_CN/loongarch/index.rst b/Documentation/translations/zh_CN/loongarch/index.rst
index 7d23eb78379d..625597792fd9 100644
--- a/Documentation/translations/zh_CN/loongarch/index.rst
+++ b/Documentation/translations/zh_CN/loongarch/index.rst
@@ -15,6 +15,7 @@ LoongArch体系结构
 
    introduction
    irq-chip-model
+   boot-image-header
 
    features
 
-- 
2.31.1

