Return-Path: <linux-doc+bounces-112-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC0A7C667F
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 09:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DEA71C20C94
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 07:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297D5101C2;
	Thu, 12 Oct 2023 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7A8101C1
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 07:36:27 +0000 (UTC)
X-Greylist: delayed 1118 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 12 Oct 2023 00:36:25 PDT
Received: from wxsgout04.xfusion.com (wxsgout03.xfusion.com [36.139.52.80])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD720C6
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 00:36:25 -0700 (PDT)
Received: from wuxshcsitd00600.xfusion.com (unknown [10.32.133.213])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4S5grq462nz9xgXl;
	Thu, 12 Oct 2023 15:15:23 +0800 (CST)
Received: from localhost (10.82.147.3) by wuxshcsitd00600.xfusion.com
 (10.32.133.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 12 Oct
 2023 15:17:38 +0800
Date: Thu, 12 Oct 2023 15:17:38 +0800
From: WangJinchao <wangjinchao@xfusion.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <stone.xulei@xfusion.com>
Subject: [PATCH] workqueue: doc: Fix function and sysfs path errors
Message-ID: <202310121517+0800-wangjinchao@xfusion.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.82.147.3]
X-ClientProxiedBy: wuxshcsitd00600.xfusion.com (10.32.133.213) To
 wuxshcsitd00600.xfusion.com (10.32.133.213)
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_40,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

alloc_ordered_queue -> alloc_ordered_workqueue
/sys/devices/virtual/WQ_NAME/
    -> /sys/devices/virtual/workqueue/WQ_NAME/

Signed-off-by: WangJinchao <wangjinchao@xfusion.com>
---
 Documentation/core-api/workqueue.rst                    | 4 ++--
 Documentation/translations/zh_CN/core-api/workqueue.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index 5d7b01aed1fe..0046af06531a 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -244,7 +244,7 @@ unbound worker-pools and only one work item could be active at any given
 time thus achieving the same ordering property as ST wq.
 
 In the current implementation the above configuration only guarantees
-ST behavior within a given NUMA node. Instead ``alloc_ordered_queue()`` should
+ST behavior within a given NUMA node. Instead ``alloc_ordered_workqueue()`` should
 be used to achieve system-wide ST behavior.
 
 
@@ -390,7 +390,7 @@ The default affinity scope can be changed with the module parameter
 scope can be changed using ``apply_workqueue_attrs()``.
 
 If ``WQ_SYSFS`` is set, the workqueue will have the following affinity scope
-related interface files under its ``/sys/devices/virtual/WQ_NAME/``
+related interface files under its ``/sys/devices/virtual/workqueue/WQ_NAME/``
 directory.
 
 ``affinity_scope``
diff --git a/Documentation/translations/zh_CN/core-api/workqueue.rst b/Documentation/translations/zh_CN/core-api/workqueue.rst
index 6c1b5ec31d75..7fac6f75d078 100644
--- a/Documentation/translations/zh_CN/core-api/workqueue.rst
+++ b/Documentation/translations/zh_CN/core-api/workqueue.rst
@@ -202,7 +202,7 @@ workqueue将自动创建与属性相匹配的后备工作者池。调节并发
 同的排序属性。
 
 在目前的实现中，上述配置只保证了特定NUMA节点内的ST行为。相反，
-``alloc_ordered_queue()`` 应该被用来实现全系统的ST行为。
+``alloc_ordered_workqueue()`` 应该被用来实现全系统的ST行为。
 
 
 执行场景示例
-- 
2.40.0


