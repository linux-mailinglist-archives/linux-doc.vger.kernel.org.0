Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0FD058E7F6
	for <lists+linux-doc@lfdr.de>; Wed, 10 Aug 2022 09:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiHJHlY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Aug 2022 03:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiHJHlX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Aug 2022 03:41:23 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C5795C352
        for <linux-doc@vger.kernel.org>; Wed, 10 Aug 2022 00:41:20 -0700 (PDT)
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxryMbYfNi4A8MAA--.6843S3;
        Wed, 10 Aug 2022 15:41:16 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     loongarch@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [PATCH v3 1/2] docs/LoongArch: Add I14 description
Date:   Wed, 10 Aug 2022 15:41:14 +0800
Message-Id: <1660117275-576-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1660117275-576-1-git-send-email-yangtiezhu@loongson.cn>
References: <1660117275-576-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9DxryMbYfNi4A8MAA--.6843S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKw4xJw1DCr45Cr4xJr1xAFb_yoWDWwcE9w
        1aqFs8Ww1aqr409w4jgF18uFyUJF4FkF1xAr4DJr1fGa43K39rAF4qgrnxZr18GrZrurn8
        GFyUXryUAF92kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbh8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
        0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUesqWUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I14 is also immediate operand, like I8/I12/I16/I21/I26,
add it in the English documentation.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Documentation/loongarch/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/loongarch/introduction.rst b/Documentation/loongarch/introduction.rst
index 216b3f3..6c9160c 100644
--- a/Documentation/loongarch/introduction.rst
+++ b/Documentation/loongarch/introduction.rst
@@ -221,7 +221,7 @@ I26         Opcode + I26L + I26H
 =========== ==========================
 
 Rd is the destination register operand, while Rj, Rk and Ra ("a" stands for
-"additional") are the source register operands. I8/I12/I16/I21/I26 are
+"additional") are the source register operands. I8/I12/I14/I16/I21/I26 are
 immediate operands of respective width. The longer I21 and I26 are stored
 in separate higher and lower parts in the instruction word, denoted by the "L"
 and "H" suffixes.
-- 
2.1.0

