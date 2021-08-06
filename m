Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0173B3E21F7
	for <lists+linux-doc@lfdr.de>; Fri,  6 Aug 2021 04:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbhHFC7P (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Aug 2021 22:59:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44424 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235748AbhHFC7O (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 22:59:14 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxwOJfpQxh198rAA--.1497S8;
        Fri, 06 Aug 2021 10:58:52 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com,
        chenweiguang82@126.com
Subject: [PATCH v4 6/8] docs/zh_CN: add infiniband tag_matching translation
Date:   Fri,  6 Aug 2021 10:58:53 +0800
Message-Id: <eaed122a0e5d0e3312cf5a495022a9d0be42a831.1628218477.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1628218477.git.siyanteng@loongson.cn>
References: <cover.1628218477.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxwOJfpQxh198rAA--.1497S8
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw1rXr4xWr18WF1DuFy8Zrb_yoW7ArWDpF
        9rWa4fKw1UAasFk3ya9342qF17Gr1xJF17Ga4vg34rJF95twsF9FsFy347WF1fWrW8CFyj
        qrsYyF9Y9ryj9rDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
        z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
        AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
        IxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
        4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
        daVFxhVjvjDU0xZFpf9x0JUQFxUUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/infiniband/tag_matching.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Puyu Wang <realpuyuwang@gmail.com>
---
 .../translations/zh_CN/infiniband/index.rst   |  2 +-
 .../zh_CN/infiniband/tag_matching.rst         | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/tag_matching.rst

diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
index 1d208d50b0c2..c273088b8686 100644
--- a/Documentation/translations/zh_CN/infiniband/index.rst
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -26,10 +26,10 @@ infiniband
    ipoib
    opa_vnic
    sysfs
+   tag_matching
 
 TODOLIST:
 
-   tag_matching
    user_mad
    user_verbs
 
diff --git a/Documentation/translations/zh_CN/infiniband/tag_matching.rst b/Documentation/translations/zh_CN/infiniband/tag_matching.rst
new file mode 100644
index 000000000000..19b99587b862
--- /dev/null
+++ b/Documentation/translations/zh_CN/infiniband/tag_matching.rst
@@ -0,0 +1,63 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/infiniband/tag_matching.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 王普宇 Puyu Wang <realpuyuwang@gmail.com>
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_infiniband_tag_matching:
+
+============
+标签匹配逻辑
+============
+
+MPI标准定义了一套规则，称为标签匹配，用于将源发送操作与目的接收匹配。以下参数必
+须与以下源和目的参数相匹配:
+
+*	沟通者
+*	用户标签--通配符(wild card)可由接收方指定
+*	来源等级--通配符可由接收方指定
+*	目的地等级 – wild
+
+排序规则要求，当一对以上的发送和接收消息信封可能匹配时，包括最早发布-发送和最早
+发布-接收的一对是必须用来满足匹配操作的一对。然而，这并不意味着标签是按照它们被
+创建的顺序消耗的，例如，如果早期的标签不能用来满足匹配规则，那么后来生成的标签
+可能被消耗。
+
+当消息从发送方发送到接收方时，通信库可能试图在相应的匹配接收被发布之后或之前处
+理该操作。如果匹配的接收被发布，这就是一个预期的消息，否则就被称为一个意外的消
+息。实现时经常为这两种不同的匹配实例使用不同的匹配方案。
+
+为了减少MPI库的内存占用，MPI实现通常使用两种不同的协议来实现这一目的:
+
+1.	Eager协议--当发送方处理完发送时，完整的信息就会被发送。在send_cq中会收到
+一个完成发送的通知，通知缓冲区可以被重新使用。
+
+2.	Rendezvous协议--发送方在第一次通知接收方时发送标签匹配头，也许还有一部分
+数据。当相应的缓冲区被发布时，响应者将使用头中的信息，直接向匹配的缓冲区发起
+RDMA读取操作。为了使缓冲区得到重用，需要收到一个fin消息。
+
+标签匹配的实现
+==============
+
+使用的匹配对象有两种类型，即发布的接收列表和意外消息列表。应用程序通过调用发布
+的接收列表中的MPI接收例程发布接收缓冲区，并使用MPI发送例程发布发送消息。发布的
+接收列表的头部可以由硬件来维护，而软件则要对这个列表进行跟踪。
+
+当发送开始并到达接收端时，如果没有为这个到达的消息预先发布接收，它将被传递给软
+件并被放在意外（unexpect）消息列表中。否则，将对该匹配进行处理，包括交会处理，
+如果合适的话，将数据传送到指定的接收缓冲区。这允许接收方MPI标签匹配与计算重叠。
+
+当一个接收信息被发布时，通信库将首先检查软件的意外信息列表，以寻找一个匹配的接
+收信息。如果找到一个匹配的，数据就会被送到用户缓冲区，使用一个软件控制的协议。
+UCX的实现根据数据大小，使用急切或交会协议。如果没有找到匹配，整个预置的接收列
+表由硬件维护，并且有空间在这个列表中增加一个预置的接收，这个接收被传递给硬件。
+软件要对这个列表进行跟踪，以帮助处理MPI取消操作。此外，由于硬件和软件在标签匹
+配操作方面预计不会紧密同步，这个影子列表被用来检测预先发布的接收被传递到硬件的
+情况，因为匹配的意外消息正在从硬件传递到软件。
-- 
2.27.0

