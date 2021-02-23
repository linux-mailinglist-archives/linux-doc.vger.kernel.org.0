Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7189B3223E9
	for <lists+linux-doc@lfdr.de>; Tue, 23 Feb 2021 02:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhBWB4O (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Feb 2021 20:56:14 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:57062 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230318AbhBWB4M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Feb 2021 20:56:12 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UPJc3nw_1614045328;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0UPJc3nw_1614045328)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 23 Feb 2021 09:55:29 +0800
From:   Joseph Qi <joseph.qi@linux.alibaba.com>
To:     Paolo Valente <paolo.valente@linaro.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] block/bfq: update comments and default value in docs for fifo_expire
Date:   Tue, 23 Feb 2021 09:55:28 +0800
Message-Id: <1614045328-87234-1-git-send-email-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct the comments since bfq_fifo_expire[0] is for async request,
while bfq_fifo_expire[1] is for sync request.
Also update docs, according the source code, the default
fifo_expire_async is 250ms, and fifo_expire_sync is 125ms.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 Documentation/block/bfq-iosched.rst | 4 ++--
 block/bfq-iosched.c                 | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/block/bfq-iosched.rst b/Documentation/block/bfq-iosched.rst
index 19d4d15..66c5a4e 100644
--- a/Documentation/block/bfq-iosched.rst
+++ b/Documentation/block/bfq-iosched.rst
@@ -430,13 +430,13 @@ fifo_expire_async
 -----------------
 
 This parameter is used to set the timeout of asynchronous requests. Default
-value of this is 248ms.
+value of this is 250ms.
 
 fifo_expire_sync
 ----------------
 
 This parameter is used to set the timeout of synchronous requests. Default
-value of this is 124ms. In case to favor synchronous requests over asynchronous
+value of this is 125ms. In case to favor synchronous requests over asynchronous
 one, this value should be decreased relative to fifo_expire_async.
 
 low_latency
diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index b398dde..2baa10b 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -160,7 +160,7 @@
 BFQ_BFQQ_FNS(softrt_update);
 #undef BFQ_BFQQ_FNS						\
 
-/* Expiration time of sync (0) and async (1) requests, in ns. */
+/* Expiration time of async (0) and sync (1) requests, in ns. */
 static const u64 bfq_fifo_expire[2] = { NSEC_PER_SEC / 4, NSEC_PER_SEC / 8 };
 
 /* Maximum backwards seek (magic number lifted from CFQ), in KiB. */
-- 
1.8.3.1

