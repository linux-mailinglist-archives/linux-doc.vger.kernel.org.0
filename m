Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C54506600
	for <lists+linux-doc@lfdr.de>; Tue, 19 Apr 2022 09:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233072AbiDSHgv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Apr 2022 03:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbiDSHgu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 03:36:50 -0400
Received: from mail.meizu.com (unknown [14.29.68.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C13140DF;
        Tue, 19 Apr 2022 00:34:07 -0700 (PDT)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 19 Apr
 2022 15:34:08 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 19 Apr
 2022 15:34:04 +0800
From:   Haowen Bai <baihaowen@meizu.com>
To:     <baihaowen@meizu.com>
CC:     <alexs@kernel.org>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <seakeel@gmail.com>,
        <siyanteng01@gmail.com>, <siyanteng@loongson.cn>
Subject: [PATCH V8] docs/zh_CN: sync with original text Documentation/vm/page_owner.rst
Date:   Tue, 19 Apr 2022 15:34:03 +0800
Message-ID: <1650353643-24722-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650347368-17858-1-git-send-email-baihaowen@meizu.com>
References: <1650347368-17858-1-git-send-email-baihaowen@meizu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As the tools/vm/page_owner_sort added some feature and original text
updated, sync the translation of zh_CN as below.

BTW, the original text table which is made of tab will display all
by one line. so we make a  standard table for STANDARD FORMAT SPECIFIERS
description.

Commit 8bd16bc0a081 ("tools/vm/page_owner_sort.c: support sorting blocks
by multiple keys") add sorting blocks by multiple keys usage
description.

Commit 78a0b94f3829 ("tools/vm/page_owner_sort.c: support for multi-value
selection in single argument") add multi-value selection in single
argument usage description.

Commit c89b3ad2dea2 ("doc/vm/page_owner.rst: remove content related to -c
option") remove  -c option usage description.

Commit 9c8a0a8e599f ("tools/vm/page_owner_sort.c: support for user-defined
culling rules") add user-defined culling rules usage description.

Commit 8ea8613a616a ("tools/vm/page_owner_sort.c: support for selecting by
PID, TGID or task command name") add selecting by PID, TGID or task
command name usage description.

Commit 194d52d771b8 ("tools/vm/page_owner_sort: support for sorting by
task command name") add sorting by task command name usage description.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
V1->V2: fix whitespace warning.
V2->V3: fix some tab Alignment issue.
V3->V4: fix sphinx warning
V4->V5: fix whitespace warning; add fix tags.
V5->V6: fix refer tags format.
V6->V7: combine these 2 patches as a patchset.
V7->V8: fix git am whitespace error.

 Documentation/translations/zh_CN/vm/page_owner.rst | 61 +++++++++++++++++++++-
 Documentation/vm/page_owner.rst                    | 34 +++++++-----
 2 files changed, 80 insertions(+), 15 deletions(-)

diff --git a/Documentation/translations/zh_CN/vm/page_owner.rst b/Documentation/translations/zh_CN/vm/page_owner.rst
index 9e951fabba9d..c692e81c724e 100644
--- a/Documentation/translations/zh_CN/vm/page_owner.rst
+++ b/Documentation/translations/zh_CN/vm/page_owner.rst
@@ -103,14 +103,73 @@ page owner在默认情况下是禁用的。所以，如果你想使用它，你
 		-m		按总内存排序
 		-p		按pid排序。
 		-P		按tgid排序。
+		-n		按任务名称排序。
 		-r		按内存释放时间排序。
 		-s		按堆栈跟踪排序。
 		-t		按时间排序（默认）。
+		--sort <order>	指定排序顺序。排序语法是 [+|-]key[,[+|-]key[,...]]. 从
+						**标准格式说明符** 部分选择一个键。"+" 是可选的，因为默认方向是增加数字或字典顺序。
+						允许混合使用缩写键和全称键。
+
+		Examples:
+				./page_owner_sort <input> <output> --sort=n,+pid,-tgid
+				./page_owner_sort <input> <output> --sort=at
 
    其它函数:
 
 	Cull:
-		-c		通过比较堆栈跟踪而不是总块来进行剔除。
+		--cull <rules>
+				指定筛选规则。筛选语法是 key[,key[,...]]。在**标准格式说明符**部分选择一个多字母键
+
+		<rules> 是逗号分隔列表形式的单个参数，它提供了一种指定单个筛选规则的方法。下面的**标准格式说明
+				符**部分描述了可识别的关键字。<rules> 可以由键 k1,k2, ... 顺序指定，如下面的
+				STANDARD SORT KEYS 部分所述。允许混合使用缩写形式和完整形式的键。
 
+		Examples:
+				./page_owner_sort <input> <output> --cull=stacktrace
+				./page_owner_sort <input> <output> --cull=st,pid,name
+				./page_owner_sort <input> <output> --cull=n,f
 	Filter:
 		-f		过滤掉内存已被释放的块的信息。
+
+	Select:
+		--pid <pidlist>		通过 pid 进行选择。这将选择进程 ID 号出现在 <pidlist> 中的块。
+		--tgid <tgidlist>	通过 tgid 进行选择。这将选择线程组 ID 号出现在 <tgidlist> 中的块。
+		--name <cmdlist>	按任务名称选择。这将选择任务名称出现在 <cmdlist> 中的块。
+
+		<pidlist>、<tgidlist>、<cmdlist>是逗号分隔列表形式的单参数，它提供了一种指定单个选择规则的方法。
+
+
+		Examples:
+				./page_owner_sort <input> <output> --pid=1
+				./page_owner_sort <input> <output> --tgid=1,2,3
+				./page_owner_sort <input> <output> --name name1,name2
+
+标准格式说明符
+==============
+
+--sort 选项:
+
+        ======          ==========      ===================
+        缩写键          全称键          描述
+        ======          ==========      ===================
+        p               pid             进程 ID
+        tg              tgid            线程组 ID
+        n               name            任务名称
+        st              stacktrace      页面分配的调用栈
+        T               txt             块的全文
+        ft              free_ts         页面被释放的时间戳
+        at              alloc_ts        页面分配的时间戳
+        ======          ==========      ===================
+
+--curl 选项:
+
+        ======          ==========      ==================
+        缩写键          全称键          描述
+        ======          ==========      ==================
+        p               pid             进程 ID
+        tg              tgid            线程组 ID
+        n               name            任务名称
+        f               free            该页面是否已被释放
+        st              stacktrace      页面分配的调用栈
+        ======          ==========      ==================
diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
index 422d5fa99e84..a8505e3a3044 100644
--- a/Documentation/vm/page_owner.rst
+++ b/Documentation/vm/page_owner.rst
@@ -174,22 +174,28 @@ STANDARD FORMAT SPECIFIERS
 
 For --sort option:
 
-	KEY		LONG		DESCRIPTION
-	p		pid		process ID
-	tg		tgid		thread group ID
-	n		name		task command name
-	st		stacktrace	stack trace of the page allocation
-	T		txt		full text of block
-	ft		free_ts		timestamp of the page when it was released
-	at		alloc_ts	timestamp of the page when it was allocated
+        ====            ==========      ============================================
+        KEY             LONG            DESCRIPTION
+        ====            ==========      ============================================
+        p               pid             process ID
+        tg              tgid            thread group ID
+        n               name            task command name
+        st              stacktrace      stack trace of the page allocation
+        T               txt             full text of block
+        ft              free_ts         timestamp of the page when it was released
+        at              alloc_ts        timestamp of the page when it was allocated
         ator            allocator       memory allocator for pages
+        ====            ==========      ============================================
 
 For --curl option:
 
-	KEY		LONG		DESCRIPTION
-	p		pid		process ID
-	tg		tgid		thread group ID
-	n		name		task command name
-	f		free		whether the page has been released or not
-	st		stacktrace	stack trace of the page allocation
+        ====            ===========     ============================================
+        KEY             LONG            DESCRIPTION
+        ====            ===========     ============================================
+        p               pid             process ID
+        tg              tgid            thread group ID
+        n               name            task command name
+        f               free            whether the page has been released or not
+        st              stacktrace      stack trace of the page allocation
         ator            allocator       memory allocator for pages
+        ====            ===========     ============================================
-- 
2.7.4

