Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B431BB04B
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2020 23:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgD0VRZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Apr 2020 17:17:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:33786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbgD0VRY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 Apr 2020 17:17:24 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E077F2078C;
        Mon, 27 Apr 2020 21:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588022244;
        bh=tyHMgp6fyma+WWGV4GEzGPbjD3IGph+Zq7yEvRORSvs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kbxJJdZgvaDH50tQWgNe02VSDp+3lkw66TMGpDQROPqV5P2cWHnVjNSyujAtehpy3
         vSWrLMMDq0cJ+AeRM2IBZJV84XO9obB2Z627LlDx5LE26GDAKYK6mRVY/x04E4R5PZ
         UfRZVpSv/OgX3mHzKp1ZLBhpTc7Kd03T8WoL7Ckc=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jTB7y-000Hju-6R; Mon, 27 Apr 2020 23:17:22 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Subject: [PATCH v3 04/29] docs: filesystems: caching/operations.txt: convert it to ReST
Date:   Mon, 27 Apr 2020 23:16:56 +0200
Message-Id: <97e71cc598a4f61df484ebda3ec06b63530ceb62.1588021877.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588021877.git.mchehab+huawei@kernel.org>
References: <cover.1588021877.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Add a SPDX header;
- Adjust document and section titles;
- Comment out text ToC for html/pdf output;
- Mark literal blocks as such;
- Add it to filesystems/caching/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/caching/index.rst   |  1 +
 .../{operations.txt => operations.rst}        | 45 +++++++++----------
 fs/fscache/operation.c                        |  2 +-
 3 files changed, 23 insertions(+), 25 deletions(-)
 rename Documentation/filesystems/caching/{operations.txt => operations.rst} (90%)

diff --git a/Documentation/filesystems/caching/index.rst b/Documentation/filesystems/caching/index.rst
index d0651db450fb..75492b7c8ea0 100644
--- a/Documentation/filesystems/caching/index.rst
+++ b/Documentation/filesystems/caching/index.rst
@@ -9,3 +9,4 @@ Filesystem Caching
    fscache
    object
    netfs-api
+   operations
diff --git a/Documentation/filesystems/caching/operations.txt b/Documentation/filesystems/caching/operations.rst
similarity index 90%
rename from Documentation/filesystems/caching/operations.txt
rename to Documentation/filesystems/caching/operations.rst
index d8976c434718..f7ddcc028939 100644
--- a/Documentation/filesystems/caching/operations.txt
+++ b/Documentation/filesystems/caching/operations.rst
@@ -1,10 +1,12 @@
-		       ================================
-		       ASYNCHRONOUS OPERATIONS HANDLING
-		       ================================
+.. SPDX-License-Identifier: GPL-2.0
+
+================================
+Asynchronous Operations Handling
+================================
 
 By: David Howells <dhowells@redhat.com>
 
-Contents:
+.. Contents:
 
  (*) Overview.
 
@@ -17,8 +19,7 @@ Contents:
  (*) Asynchronous callback.
 
 
-========
-OVERVIEW
+Overview
 ========
 
 FS-Cache has an asynchronous operations handling facility that it uses for its
@@ -33,11 +34,10 @@ backend for completion.
 To make use of this facility, <linux/fscache-cache.h> should be #included.
 
 
-===============================
-OPERATION RECORD INITIALISATION
+Operation Record Initialisation
 ===============================
 
-An operation is recorded in an fscache_operation struct:
+An operation is recorded in an fscache_operation struct::
 
 	struct fscache_operation {
 		union {
@@ -50,7 +50,7 @@ An operation is recorded in an fscache_operation struct:
 	};
 
 Someone wanting to issue an operation should allocate something with this
-struct embedded in it.  They should initialise it by calling:
+struct embedded in it.  They should initialise it by calling::
 
 	void fscache_operation_init(struct fscache_operation *op,
 				    fscache_operation_release_t release);
@@ -67,8 +67,7 @@ FSCACHE_OP_WAITING may be set in op->flags prior to each submission of the
 operation and waited for afterwards.
 
 
-==========
-PARAMETERS
+Parameters
 ==========
 
 There are a number of parameters that can be set in the operation record's flag
@@ -87,7 +86,7 @@ operations:
 
      If this option is to be used, FSCACHE_OP_WAITING must be set in op->flags
      before submitting the operation, and the operating thread must wait for it
-     to be cleared before proceeding:
+     to be cleared before proceeding::
 
 		wait_on_bit(&op->flags, FSCACHE_OP_WAITING,
 			    TASK_UNINTERRUPTIBLE);
@@ -101,7 +100,7 @@ operations:
      page to a netfs page after the backing fs has read the page in.
 
      If this option is used, op->fast_work and op->processor must be
-     initialised before submitting the operation:
+     initialised before submitting the operation::
 
 		INIT_WORK(&op->fast_work, do_some_work);
 
@@ -114,7 +113,7 @@ operations:
      pages that have just been fetched from a remote server.
 
      If this option is used, op->slow_work and op->processor must be
-     initialised before submitting the operation:
+     initialised before submitting the operation::
 
 		fscache_operation_init_slow(op, processor)
 
@@ -132,8 +131,7 @@ Furthermore, operations may be one of two types:
      operations running at the same time.
 
 
-=========
-PROCEDURE
+Procedure
 =========
 
 Operations are used through the following procedure:
@@ -143,7 +141,7 @@ Operations are used through the following procedure:
      generic op embedded within.
 
  (2) The submitting thread must then submit the operation for processing using
-     one of the following two functions:
+     one of the following two functions::
 
 	int fscache_submit_op(struct fscache_object *object,
 			      struct fscache_operation *op);
@@ -164,7 +162,7 @@ Operations are used through the following procedure:
      operation of conflicting exclusivity is in progress on the object.
 
      If the operation is asynchronous, the manager will retain a reference to
-     it, so the caller should put their reference to it by passing it to:
+     it, so the caller should put their reference to it by passing it to::
 
 	void fscache_put_operation(struct fscache_operation *op);
 
@@ -179,12 +177,12 @@ Operations are used through the following procedure:
  (4) The operation holds an effective lock upon the object, preventing other
      exclusive ops conflicting until it is released.  The operation can be
      enqueued for further immediate asynchronous processing by adjusting the
-     CPU time provisioning option if necessary, eg:
+     CPU time provisioning option if necessary, eg::
 
 	op->flags &= ~FSCACHE_OP_TYPE;
 	op->flags |= ~FSCACHE_OP_FAST;
 
-     and calling:
+     and calling::
 
 	void fscache_enqueue_operation(struct fscache_operation *op)
 
@@ -192,13 +190,12 @@ Operations are used through the following procedure:
      pools.
 
 
-=====================
-ASYNCHRONOUS CALLBACK
+Asynchronous Callback
 =====================
 
 When used in asynchronous mode, the worker thread pool will invoke the
 processor method with a pointer to the operation.  This should then get at the
-container struct by using container_of():
+container struct by using container_of()::
 
 	static void fscache_write_op(struct fscache_operation *_op)
 	{
diff --git a/fs/fscache/operation.c b/fs/fscache/operation.c
index 1a22a55f75a0..4a5651d4904e 100644
--- a/fs/fscache/operation.c
+++ b/fs/fscache/operation.c
@@ -4,7 +4,7 @@
  * Copyright (C) 2008 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
  *
- * See Documentation/filesystems/caching/operations.txt
+ * See Documentation/filesystems/caching/operations.rst
  */
 
 #define FSCACHE_DEBUG_LEVEL OPERATION
-- 
2.25.4

