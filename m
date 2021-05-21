Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E94C838C214
	for <lists+linux-doc@lfdr.de>; Fri, 21 May 2021 10:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbhEUIj6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 May 2021 04:39:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39636 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233022AbhEUIj6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 04:39:58 -0400
Received: from localhost.localdomain (unknown [112.20.113.102])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX0OCcadglScCAA--.1073S2;
        Fri, 21 May 2021 16:38:27 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs: zh_CN: update Chinese translations
Date:   Fri, 21 May 2021 16:39:08 +0800
Message-Id: <20210521083908.3783492-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX0OCcadglScCAA--.1073S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw48Cry8Wr1UKw45Gr4xXrb_yoW5JFWrpa
        1akrnxKanrZrnrZFn7KryUWry5CFZ5ua4UC3s7Xrn5ZF1kZr9YyF4xKr95uF92gFyUXa4r
        tFs7tryDXayjywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhdbbUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Two new commits were added to the original document:

commit ddba35031db2ea89facc91c745e5ad55ba2e0e7f
commit 20bc8c1e972f29afcac85e524e430c11a6df5f58

translate them into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/printk-formats.rst           | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst b/Documentation/translations/zh_CN/core-api/printk-formats.rst
index 624a090e6ee5..a680c8f164c3 100644
--- a/Documentation/translations/zh_CN/core-api/printk-formats.rst
+++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
@@ -122,6 +122,17 @@ seq_printf()，而不是printk()）由用户空间进程读取，使用下面描
 ``B`` 占位符的结果是带有偏移量的符号名，在打印堆栈回溯时应该使用。占位符将考虑编译器优化
 的影响，当使用尾部调用并使用noreturn GCC属性标记时，可能会发生这种优化。
 
+如果指针在一个模块内，模块名称和可选的构建ID将被打印在符号名称之后，并在说明符的末尾添加
+一个额外的 ``b`` 。
+
+::
+
+	%pS	versatile_init+0x0/0x110 [module_name]
+	%pSb	versatile_init+0x0/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
+	%pSRb	versatile_init+0x9/0x110 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
+		(with __builtin_extract_return_addr() translation)
+	%pBb	prev_fn_of_versatile_init+0x88/0x88 [module_name ed5019fdf5e53be37cb1ba7899292d7e143b259e]
+
 来自BPF / tracing追踪的探查指针
 ----------------------------------
 
@@ -483,9 +494,10 @@ Fwnode handles
 ::
 
 	%pt[RT]			YYYY-mm-ddTHH:MM:SS
+	%pt[RT]s		YYYY-mm-dd HH:MM:SS
 	%pt[RT]d		YYYY-mm-dd
 	%pt[RT]t		HH:MM:SS
-	%pt[RT][dt][r]
+	%pt[RT][dt][r][s]
 
 用于打印日期和时间::
 
@@ -497,6 +509,9 @@ Fwnode handles
 默认情况下，年将以1900为单位递增，月将以1为单位递增。 使用%pt[RT]r (raw)
 来抑制这种行为。
 
+%pt[RT]s（空格）将覆盖ISO 8601的分隔符，在日期和时间之间使用''（空格）而
+不是'T'（大写T）。当日期或时间被省略时，它不会有任何影响。
+
 通过引用传递。
 
 clk结构体
-- 
2.27.0

