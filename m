Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C6146FDE2
	for <lists+linux-doc@lfdr.de>; Fri, 10 Dec 2021 10:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237977AbhLJJjT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 10 Dec 2021 04:39:19 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:29173 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhLJJjT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 04:39:19 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4J9Qgz2mdGz8vmy;
        Fri, 10 Dec 2021 17:33:35 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:35:43 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 10 Dec
 2021 17:35:42 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v2 2/2] docs/zh-CN: Update sched-capacity in scheduler/index.rst
Date:   Fri, 10 Dec 2021 18:03:22 +0800
Message-ID: <20211210100322.1490-3-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211210100322.1490-1-tangyizhou@huawei.com>
References: <20211210100322.1490-1-tangyizhou@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

sched-capacity.rst has been added in the previous patch,
so update here.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 Documentation/translations/zh_CN/scheduler/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
index 4c4deca4302a..e97ad7781088 100644
--- a/Documentation/translations/zh_CN/scheduler/index.rst
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -20,6 +20,7 @@ Linux调度器
     completion
     sched-arch
     sched-bwc
+    sched-capacity
 
 
 TODOList:
@@ -28,7 +29,6 @@ TODOList:
     sched-deadline
     sched-design-CFS
     sched-domains
-    sched-capacity
     sched-energy
     sched-nice-design
     sched-rt-group
-- 
2.17.1

