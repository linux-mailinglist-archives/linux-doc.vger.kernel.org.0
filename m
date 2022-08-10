Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A14B958E61A
	for <lists+linux-doc@lfdr.de>; Wed, 10 Aug 2022 06:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbiHJEQe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Aug 2022 00:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbiHJEQ3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Aug 2022 00:16:29 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 39B8A79EFC
        for <linux-doc@vger.kernel.org>; Tue,  9 Aug 2022 21:16:28 -0700 (PDT)
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxIM8WMfNiI+kLAA--.36402S2;
        Wed, 10 Aug 2022 12:16:23 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     loongarch@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [PATCH] LoongArch: Add I14 description in documentation
Date:   Wed, 10 Aug 2022 12:16:22 +0800
Message-Id: <1660104982-15578-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxIM8WMfNiI+kLAA--.36402S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr4DAFyxXFWrtr17CrWruFg_yoWDJwbE9w
        4aqFs8Ww1aqr409w4jgF1ruFyUJF4FkF1xAr4DJr1fGa43K39rAF4vgrnxZr18GrW7uFn8
        GFyUXry7AF92kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2kYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8XwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0S4iUUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I14 is also immediate operand, like I8/I12/I16/I21/I26.

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

