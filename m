Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8389058E7F8
	for <lists+linux-doc@lfdr.de>; Wed, 10 Aug 2022 09:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiHJHlY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Aug 2022 03:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiHJHlX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Aug 2022 03:41:23 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 49E385C373
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 00:41:22 -0700 (PDT)
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxryMbYfNi4A8MAA--.6843S4;
        Wed, 10 Aug 2022 15:41:16 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     loongarch@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [PATCH v3 2/2] docs/zh_CN/LoongArch: Add I14 description
Date:   Wed, 10 Aug 2022 15:41:15 +0800
Message-Id: <1660117275-576-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1660117275-576-1-git-send-email-yangtiezhu@loongson.cn>
References: <1660117275-576-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxryMbYfNi4A8MAA--.6843S4
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO67AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14
        v26r15M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CEw4AK
        67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I
        0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF
        7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21le4C262xC7I0v67AEwI8IwI
        1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
        67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjI
        I2zVCS5cI20VAGYxC7M4kE6I8I3I0E14AKx2xKxVC2ax8xMxkIecxEwVAFwVW8CwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r1j6r18MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUOqXLUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_40,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I14 is also immediate operand, like I8/I12/I16/I21/I26,
add it in the Chinese documentation.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Documentation/translations/zh_CN/loongarch/introduction.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/loongarch/introduction.rst b/Documentation/translations/zh_CN/loongarch/introduction.rst
index 11686ee..128878f 100644
--- a/Documentation/translations/zh_CN/loongarch/introduction.rst
+++ b/Documentation/translations/zh_CN/loongarch/introduction.rst
@@ -190,8 +190,8 @@ I26         Opcode + I26L + I26H
 =========== ==========================
 
 Opcode是指令操作码，Rj和Rk是源操作数（寄存器），Rd是目标操作数（寄存器），Ra是
-4R-type格式特有的附加操作数（寄存器）。I8/I12/I16/I21/I26分别是8位/12位/16位/
-21位/26位的立即数。其中较长的21位和26位立即数在指令字中被分割为高位部分与低位
+4R-type格式特有的附加操作数（寄存器）。I8/I12/I14/I16/I21/I26分别是8位/12位/14位/
+16位/21位/26位的立即数。其中较长的21位和26位立即数在指令字中被分割为高位部分与低位
 部分，所以你们在这里的格式描述中能够看到I21L/I21H和I26L/I26H这样带后缀的表述。
 
 指令列表
-- 
2.1.0

