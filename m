Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F87354F452
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jun 2022 11:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381124AbiFQJcO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Jun 2022 05:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380381AbiFQJcM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jun 2022 05:32:12 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1A9166AFA
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 02:32:10 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxD+YQSqxiAz1IAA--.12781S2;
        Fri, 17 Jun 2022 17:32:01 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     chenhuacai@kernel.org, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        kernel@xen0n.name, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        loongarch@lists.linux.dev
Subject: [PATCH v2 0/2] docs: Improve loongarch documents
Date:   Fri, 17 Jun 2022 17:33:09 +0800
Message-Id: <cover.1655456950.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxD+YQSqxiAz1IAA--.12781S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr4DCF1UtF4UGFy3uF4DArb_yoW3Wrg_uF
        Z7Gay5Cw42ga4rXayxCr13AF98JF4j93W5AF1ktFsrKFyftwnxAr4DW390vr1IqFsrZFZ8
        GrWkXryrAr12qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
        VjvjDU0xZFpf9x0JU4BT5UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
Fix ``inline literals``.
Delete "注：" of zh_CN patch.
Add fix tag.

v1:
Rewrite all the notes in the loongarch document.
Note is an admonition, let's use the directives
implemented in the reference reStructuredText parser.
About reStructuredText Directives,
see <https://docutils.sourceforge.io/docs/ref/rst/directives.html>

Yanteng Si (2):
  docs: Rewrite all the notes
  docs/zh_CN: Rewrite all the notes

 Documentation/loongarch/introduction.rst      | 15 ++++++++-----
 Documentation/loongarch/irq-chip-model.rst    | 22 +++++++++++--------
 .../zh_CN/loongarch/introduction.rst          | 14 +++++++-----
 .../zh_CN/loongarch/irq-chip-model.rst        | 14 +++++++-----
 4 files changed, 38 insertions(+), 27 deletions(-)

-- 
2.27.0

