Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4B956BEE1
	for <lists+linux-doc@lfdr.de>; Fri,  8 Jul 2022 20:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238498AbiGHRZI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 Jul 2022 13:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238683AbiGHRZF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Jul 2022 13:25:05 -0400
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D850B3057B
        for <linux-doc@vger.kernel.org>; Fri,  8 Jul 2022 10:25:02 -0700 (PDT)
X-QQ-mid: bizesmtp73t1657301078tehk736s
Received: from wuhui-virtual-machine.localdoma ( [116.7.245.180])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Sat, 09 Jul 2022 01:23:53 +0800 (CST)
X-QQ-SSF: 00400000002000E0T000B00A0000000
X-QQ-FEAT: DQ0OCu3gog1ErMbpil4nCJvXr11KftXJLuwEV1CE6oeg8nIcWd2Rbi3e7V12v
        eGIsZiORJ8v8l1/FwZR6P1I98bhh09nNBzNZqtbfzVhEIBZ0hrUCU5CcnOH0mU9tTqgmI3g
        0dLTebtvEuckl2BipRHUVyvImvlUq4xZEIqL/R1D4LjanreJwpsblwbv1oruD0QZAnqbiOV
        Hyy+ilbd+soKHz7AegMTlGNYgwWyhha81rXzXP/uNdjSV3013neiUbeXM7KNYEqsDiUPPpn
        kv+MGsqY19kfl6vRUjT2u8pLX55ns+snhlGCTsbVqKYRl+okJNAmItdzrZF8wfhq2SG8f0A
        yiMDOMBcDlNx0QsOY1x3wZxSKcI4vH4wbWqDMBLjB7f4/mUODg=
X-QQ-GoodBg: 2
From:   Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
To:     siyanteng@loongson.cn
Cc:     alexs@kernel.org, corbet@lwn.net, rppt@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
Subject: [PATCH] Documentation/translations/zh_CN/mm/page_owner.rst: adjust some words
Date:   Sat,  9 Jul 2022 01:23:51 +0800
Message-Id: <20220708172351.20928-1-caoyixuan2019@email.szu.edu.cn>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:email.szu.edu.cn:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I noticed that there are some Chinese words that can be more accurate.
So I fix them as follows.

首先，英文原文中的"release" 在这个语境下
是物理页面“释放”的意思，而不是“发布”。
其次，标准表的第一列和第二列，
表达的是“长短键”的意思，第一列是“短键”，
而第二列是“长键”。这样翻译或会更清晰一些。

Signed-off-by: Yixuan Cao <caoyixuan2019@email.szu.edu.cn>
---
 Documentation/translations/zh_CN/mm/page_owner.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/mm/page_owner.rst b/Documentation/translations/zh_CN/mm/page_owner.rst
index 6514cb9e03da..b7f81d7a6589 100644
--- a/Documentation/translations/zh_CN/mm/page_owner.rst
+++ b/Documentation/translations/zh_CN/mm/page_owner.rst
@@ -156,22 +156,22 @@ page owner在默认情况下是禁用的。所以，如果你想使用它，你
 
   --sort的选项:
 
-	键		键长		描述
+	短键		长键		描述
 	p		pid		进程ID
 	tg		tgid		线程组ID
 	n		name		任务命令名称
 	st		stacktrace	页面分配的堆栈跟踪
 	T		txt		块的全文
-	ft		free_ts		页面发布时的时间戳
+	ft		free_ts		页面释放时的时间戳
 	at		alloc_ts	页面被分配时的时间戳
 	ator		allocator	页面的内存分配器
 
   --curl的选项:
 
-	键		键长		描述
+	短键		长键		描述
 	p		pid		进程ID
 	tg		tgid		线程组ID
 	n		name		任务命令名称
-	f		free		该页是否已经发布
+	f		free		该页是否已经释放
 	st		stacktrace	页面分配的堆栈跟踪
 	ator		allocator	页面的内存分配器
-- 
2.17.1



