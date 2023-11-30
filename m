Return-Path: <linux-doc+bounces-3576-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4347FE6F0
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 03:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52A8528235D
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 02:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD16134B0;
	Thu, 30 Nov 2023 02:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1SVwMeW"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F92134A3;
	Thu, 30 Nov 2023 02:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FE1C433AB;
	Thu, 30 Nov 2023 02:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701311824;
	bh=qpI3K6y2bl+C+kintuKgeKanPx5i37W/Tszsh9HeKhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V1SVwMeWHdgYs4jpDF4orbpSyyG9vn4bRy/aHf+eo+IYlxietj5xvUrwU3gyuZ5+z
	 xnnF2z93D6mPI/Lt4SlB61ZQiwhKBCaZlB7hU7KRqBb99I3x+7LkkAmPf0Kjl0tCoV
	 /vfxe11hgxWaDQyYVe0dbo7OI+UcvT+lMZnvRYriRdlVhcxNl5bUpy/PkR5jF+T1Da
	 8JP1CDG7KORBs+HtA1lqd9Pn3PpEFPsF2RxmLGVxYCJRYLFegvQuOG1wHynnOyL8rC
	 z+KA0A+0ceyaDTHwqCUEu6ndT7H5VQ1Zqo/uRUI18+GIGDlbgChie1A30qmUbewyAG
	 edOnU4tXWPoxg==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] Docs/ABI/damon: document DAMOS quota goals
Date: Thu, 30 Nov 2023 02:36:51 +0000
Message-Id: <20231130023652.50284-9-sj@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130023652.50284-1-sj@kernel.org>
References: <20231130023652.50284-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update DAMON ABI document for the newly added DAMON sysfs files and
inputs for DAMOS quota goals.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 .../ABI/testing/sysfs-kernel-mm-damon         | 33 +++++++++++++++----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-damon b/Documentation/ABI/testing/sysfs-kernel-mm-damon
index b35649a46a2f..bfa5b8288d8d 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-damon
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-damon
@@ -25,12 +25,14 @@ Description:	Writing 'on' or 'off' to this file makes the kdamond starts or
 		stops, respectively.  Reading the file returns the keywords
 		based on the current status.  Writing 'commit' to this file
 		makes the kdamond reads the user inputs in the sysfs files
-		except 'state' again.  Writing 'update_schemes_stats' to the
-		file updates contents of schemes stats files of the kdamond.
-		Writing 'update_schemes_tried_regions' to the file updates
-		contents of 'tried_regions' directory of every scheme directory
-		of this kdamond.  Writing 'update_schemes_tried_bytes' to the
-		file updates only '.../tried_regions/total_bytes' files of this
+		except 'state' again.  Writing 'commit_schemes_quota_goals' to
+		this file makes the kdamond reads the quota goal files again.
+		Writing 'update_schemes_stats' to the file updates contents of
+		schemes stats files of the kdamond.  Writing
+		'update_schemes_tried_regions' to the file updates contents of
+		'tried_regions' directory of every scheme directory of this
+		kdamond.  Writing 'update_schemes_tried_bytes' to the file
+		updates only '.../tried_regions/total_bytes' files of this
 		kdamond.  Writing 'clear_schemes_tried_regions' to the file
 		removes contents of the 'tried_regions' directory.
 
@@ -212,6 +214,25 @@ Contact:	SeongJae Park <sj@kernel.org>
 Description:	Writing to and reading from this file sets and gets the quotas
 		charge reset interval of the scheme in milliseconds.
 
+What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/nr_goals
+Date:		Nov 2023
+Contact:	SeongJae Park <sj@kernel.org>
+Description:	Writing a number 'N' to this file creates the number of
+		directories for setting automatic tuning of the scheme's
+		aggressiveness named '0' to 'N-1' under the goals/ directory.
+
+What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/<G>/target_value
+Date:		Nov 2023
+Contact:	SeongJae Park <sj@kernel.org>
+Description:	Writing to and reading from this file sets and gets the target
+		value of the goal metric.
+
+What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/goals/<G>/current_value
+Date:		Nov 2023
+Contact:	SeongJae Park <sj@kernel.org>
+Description:	Writing to and reading from this file sets and gets the current
+		value of the goal metric.
+
 What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/contexts/<C>/schemes/<S>/quotas/weights/sz_permil
 Date:		Mar 2022
 Contact:	SeongJae Park <sj@kernel.org>
-- 
2.34.1


