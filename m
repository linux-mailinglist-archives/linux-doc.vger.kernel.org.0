Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D9D3235EF
	for <lists+linux-doc@lfdr.de>; Wed, 24 Feb 2021 04:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbhBXDMn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Feb 2021 22:12:43 -0500
Received: from mail.loongson.cn ([114.242.206.163]:46992 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229952AbhBXDMl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Feb 2021 22:12:41 -0500
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.111.70])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr_L3wzVgo00OAA--.18095S3;
        Wed, 24 Feb 2021 11:11:52 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/5] docs/zh_CN:add riscv boot-image-header.rst translation
Date:   Wed, 24 Feb 2021 11:11:45 +0800
Message-Id: <20210224031149.15179-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210224031149.15179-1-siyanteng@loongson.cn>
References: <20210224031149.15179-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr_L3wzVgo00OAA--.18095S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGF17CrWDZw1UGrWrCFWDXFb_yoW5tr1Upw
        1DKrWxG3W7Jry7Ar1Ikr17XF43JF4rW3W7C3W8W342yr4Yqr98Kw1rtr9xK347GFyIyF9x
        XrsYkw13Cr1Yvw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8GwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUzWl9UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/riscv/boot-image-header.rst intoChinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/riscv/boot-image-header.rst         | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/riscv/boot-image-header.rst

diff --git a/Documentation/translations/zh_CN/riscv/boot-image-header.rst b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
new file mode 100644
index 000000000000..3e9a9abb5d6f
--- /dev/null
+++ b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
@@ -0,0 +1,67 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../riscv/boot-image-header`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_boot-image-header.rst:
+
+
+==========================
+RISC-V Linux启动镜像文件头
+==========================
+
+:Author: Atish Patra <atish.patra@wdc.com>
+:Date:   20 May 2019
+
+此文档仅描述RISC-V Linux 启动文件头的详情。
+
+TODO:
+  写一个完整的启动指南。
+
+在解压后的Linux内核镜像中存在以下64字节的文件头::
+
+	u32 code0;		  /* Executable code */
+	u32 code1;		  /* Executable code */
+	u64 text_offset;	  /* Image load offset, little endian */
+	u64 image_size;		  /* Effective Image size, little endian */
+	u64 flags;		  /* kernel flags, little endian */
+	u32 version;		  /* Version of this header */
+	u32 res1 = 0;		  /* Reserved */
+	u64 res2 = 0;		  /* Reserved */
+	u64 magic = 0x5643534952; /* Magic number, little endian, "RISCV" */
+	u32 magic2 = 0x05435352;  /* Magic number 2, little endian, "RSC\x05" */
+	u32 res3;		  /* Reserved for PE COFF offset */
+
+这种头格式与PE/COFF文件头兼容，并在很大程度上受到ARM64文件头的启发。因此，ARM64
+和RISC-V文件头可以在未来合并为一个共同的头。
+
+注意
+====
+
+- 将来也可以复用这个文件头，用来对RISC-V的EFI桩提供支持。为了使内核镜像如同一个
+  EFI应用程序一样加载，EFI规范中规定在内核镜像的开始需要PE/COFF镜像文件头。为了
+  支持EFI桩，应该用“MZ”魔术字符替换掉code0，并且res3（偏移量未0x3c）应指向PE/COFF
+  文件头的其余部分.
+
+- 表示文件头的版本号的bit位域
+
+	==========  ==========
+	Bits 0:15   次要  版本
+	Bits 16:31  主要  版本
+	==========  ==========
+
+  这保持了新旧版本之间的兼容性。
+  当前版本被定义为0.2。
+
+- 从版本0.2开始，结构体成员“magic”就已经被弃用，在之后的版本中，可能会移除掉它。
+  最初，该成员应该与ARM64头的“magic”成员匹配，但遗憾的是并没有。
+  “magic2”成员代替“magic”成员与ARM64头相匹配。
+
+- 在当前的文件头，标志位域只剩下了一个。
+
+	=====  ==============================
+	Bit 0  内核字节序。1 if BE, 0 if LE.
+	=====  ==============================
+
+- 对于引导加载程序加载内核映像来说，image_size成员是强制性要写进文件头的，否则将引
+  导失败。
-- 
2.25.1

