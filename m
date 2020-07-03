Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586692133EC
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2020 08:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgGCGMJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Jul 2020 02:12:09 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:43748 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725648AbgGCGMJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 3 Jul 2020 02:12:09 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A7AC411ADA15C54CD646;
        Fri,  3 Jul 2020 14:12:05 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Jul 2020
 14:12:04 +0800
From:   Yufen Yu <yuyufen@huawei.com>
To:     <paolo.valente@linaro.org>, <axboe@kernel.dk>,
        <linux-doc@vger.kernel.org>, <linux-block@vger.kernel.org>
Subject: [PATCH] docs: block: update and fix tiny error for bfq
Date:   Fri, 3 Jul 2020 02:13:23 -0400
Message-ID: <20200703061323.959519-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The max value of blkio.bfq.weight is 1000, rather than 10000.
And 'weights' have been remove from /sys/block/XXX/queue/iosched.

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 Documentation/block/bfq-iosched.rst | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/block/bfq-iosched.rst b/Documentation/block/bfq-iosched.rst
index 0d237d402860..19d4d1570cee 100644
--- a/Documentation/block/bfq-iosched.rst
+++ b/Documentation/block/bfq-iosched.rst
@@ -492,13 +492,6 @@ set max_budget to higher values than those to which BFQ would have set
 it with auto-tuning. An alternative way to achieve this goal is to
 just increase the value of timeout_sync, leaving max_budget equal to 0.
 
-weights
--------
-
-Read-only parameter, used to show the weights of the currently active
-BFQ queues.
-
-
 4. Group scheduling with BFQ
 ============================
 
@@ -566,7 +559,7 @@ Parameters to set
 For each group, there is only the following parameter to set.
 
 weight (namely blkio.bfq.weight or io.bfq-weight): the weight of the
-group inside its parent. Available values: 1..10000 (default 100). The
+group inside its parent. Available values: 1..1000 (default 100). The
 linear mapping between ioprio and weights, described at the beginning
 of the tunable section, is still valid, but all weights higher than
 IOPRIO_BE_NR*10 are mapped to ioprio 0.
-- 
2.25.4

