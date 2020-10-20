Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E56D9293793
	for <lists+linux-doc@lfdr.de>; Tue, 20 Oct 2020 11:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392410AbgJTJGg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Oct 2020 05:06:36 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:2889 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390674AbgJTJGg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Oct 2020 05:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1603184794; x=1634720794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=tdNdw6IfHLO/vMz+dCnfV6saHBkcPkuM1L7pDo6BFss=;
  b=vixnYMm3BlrXeaZPw31sjE0m1un5f0cc0iw2F6xgbk259ZjIlb4VhQ5S
   L2ufD3S93Q2nXXuYkr4PCkJJTdy1MhvB2yYHD+3PUZxtCNBu/nVPQ7AaH
   TW+VkQbMfo4gzT3Bkv90c10c9SGM0Uv/1rVjLrpZx8BtGbe8rLHsM0cFr
   U=;
X-IronPort-AV: E=Sophos;i="5.77,396,1596499200"; 
   d="scan'208";a="60708464"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 20 Oct 2020 09:06:30 +0000
Received: from EX13D31EUB001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
        by email-inbound-relay-2c-579b7f5b.us-west-2.amazon.com (Postfix) with ESMTPS id D1604A1EED;
        Tue, 20 Oct 2020 09:03:22 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.237) by
 EX13D31EUB001.ant.amazon.com (10.43.166.210) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 20 Oct 2020 09:03:03 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <elver@google.com>, <fan.du@intel.com>,
        <foersleo@amazon.de>, <gthelen@google.com>, <irogers@google.com>,
        <jolsa@redhat.com>, <kirill@shutemov.name>, <mark.rutland@arm.com>,
        <mgorman@suse.de>, <minchan@kernel.org>, <mingo@redhat.com>,
        <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <rppt@kernel.org>, <sblbir@amazon.com>,
        <shakeelb@google.com>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <snu@amazon.de>, <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <zgf574564920@gmail.com>, <linux-damon@amazon.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v22 07/18] mm/page_idle: Avoid interferences from concurrent users
Date:   Tue, 20 Oct 2020 10:59:29 +0200
Message-ID: <20201020085940.13875-8-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020085940.13875-1-sjpark@amazon.com>
References: <20201020085940.13875-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.237]
X-ClientProxiedBy: EX13D41UWC001.ant.amazon.com (10.43.162.107) To
 EX13D31EUB001.ant.amazon.com (10.43.166.210)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

Concurrent Idle Page Tracking users can interfere each other because the
interface doesn't provide a central rule for synchronization between the
users.  Users could implement their own synchronization rule, but even
in that case, applications developed by different users would not know
how to synchronize with others.  To help this situation, this commit
introduces a centralized synchronization infrastructure of Idle Page
Tracking.

In detail, this commit introduces a mutex lock for Idle Page Tracking,
called 'page_idle_lock'.  It is exposed to user space via a new bool
sysfs file, '/sys/kernel/mm/page_idle/lock'.  By writing to and reading
from the file, users can hold/release and read status of the mutex.
Writes to the Idle Page Tracking 'bitmap' file fails if the lock is not
held, while reads of the file can be done regardless of the lock status.

Note that users could still interfere each other if they abuse this
locking rule.  Nevertheless, this change will let them notice the rule.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 .../admin-guide/mm/idle_page_tracking.rst     | 22 +++++++---
 mm/page_idle.c                                | 40 +++++++++++++++++++
 2 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/mm/idle_page_tracking.rst b/Documentation/admin-guide/mm/idle_page_tracking.rst
index df9394fb39c2..3f5e7a8b5b78 100644
--- a/Documentation/admin-guide/mm/idle_page_tracking.rst
+++ b/Documentation/admin-guide/mm/idle_page_tracking.rst
@@ -21,13 +21,13 @@ User API
 ========
 
 The idle page tracking API is located at ``/sys/kernel/mm/page_idle``.
-Currently, it consists of the only read-write file,
-``/sys/kernel/mm/page_idle/bitmap``.
+Currently, it consists of two read-write file,
+``/sys/kernel/mm/page_idle/bitmap`` and ``/sys/kernel/mm/page_idle/lock``.
 
-The file implements a bitmap where each bit corresponds to a memory page. The
-bitmap is represented by an array of 8-byte integers, and the page at PFN #i is
-mapped to bit #i%64 of array element #i/64, byte order is native. When a bit is
-set, the corresponding page is idle.
+The ``bitmap`` file implements a bitmap where each bit corresponds to a memory
+page. The bitmap is represented by an array of 8-byte integers, and the page at
+PFN #i is mapped to bit #i%64 of array element #i/64, byte order is native.
+When a bit is set, the corresponding page is idle.
 
 A page is considered idle if it has not been accessed since it was marked idle
 (for more details on what "accessed" actually means see the :ref:`Implementation
@@ -74,6 +74,16 @@ See :ref:`Documentation/admin-guide/mm/pagemap.rst <pagemap>` for more
 information about ``/proc/pid/pagemap``, ``/proc/kpageflags``, and
 ``/proc/kpagecgroup``.
 
+The ``lock`` file is for avoidance of interference from concurrent users.  If
+the content of the ``lock`` file is ``1``, it means the ``bitmap`` file is
+currently being used by someone.  While the content of the ``lock`` file is
+``1``, writing ``1`` to the file fails.  Therefore, users should first
+successfully write ``1`` to the ``lock`` file before starting use of ``bitmap``
+file and write ``0`` to the ``lock`` file after they finished use of the
+``bitmap`` file.  If a user writes the ``bitmap`` file while the ``lock`` is
+``0``, the write fails.  Meanwhile, reads of the ``bitmap`` file success
+regardless of the ``lock`` status.
+
 .. _impl_details:
 
 Implementation Details
diff --git a/mm/page_idle.c b/mm/page_idle.c
index 144fb4ed961d..0aa45f848570 100644
--- a/mm/page_idle.c
+++ b/mm/page_idle.c
@@ -16,6 +16,8 @@
 #define BITMAP_CHUNK_SIZE	sizeof(u64)
 #define BITMAP_CHUNK_BITS	(BITMAP_CHUNK_SIZE * BITS_PER_BYTE)
 
+static DEFINE_MUTEX(page_idle_lock);
+
 /*
  * Idle page tracking only considers user memory pages, for other types of
  * pages the idle flag is always unset and an attempt to set it is silently
@@ -169,6 +171,9 @@ static ssize_t page_idle_bitmap_write(struct file *file, struct kobject *kobj,
 	unsigned long pfn, end_pfn;
 	int bit;
 
+	if (!mutex_is_locked(&page_idle_lock))
+		return -EPERM;
+
 	if (pos % BITMAP_CHUNK_SIZE || count % BITMAP_CHUNK_SIZE)
 		return -EINVAL;
 
@@ -197,17 +202,52 @@ static ssize_t page_idle_bitmap_write(struct file *file, struct kobject *kobj,
 	return (char *)in - buf;
 }
 
+static ssize_t page_idle_lock_show(struct kobject *kobj,
+		struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", mutex_is_locked(&page_idle_lock));
+}
+
+static ssize_t page_idle_lock_store(struct kobject *kobj,
+		struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	bool do_lock;
+	int ret;
+
+	ret = kstrtobool(buf, &do_lock);
+	if (ret < 0)
+		return ret;
+
+	if (do_lock) {
+		if (!mutex_trylock(&page_idle_lock))
+			return -EBUSY;
+	} else {
+		mutex_unlock(&page_idle_lock);
+	}
+
+	return count;
+}
+
 static struct bin_attribute page_idle_bitmap_attr =
 		__BIN_ATTR(bitmap, 0600,
 			   page_idle_bitmap_read, page_idle_bitmap_write, 0);
 
+static struct kobj_attribute page_idle_lock_attr =
+		__ATTR(lock, 0600, page_idle_lock_show, page_idle_lock_store);
+
 static struct bin_attribute *page_idle_bin_attrs[] = {
 	&page_idle_bitmap_attr,
 	NULL,
 };
 
+static struct attribute *page_idle_lock_attrs[] = {
+	&page_idle_lock_attr.attr,
+	NULL,
+};
+
 static const struct attribute_group page_idle_attr_group = {
 	.bin_attrs = page_idle_bin_attrs,
+	.attrs = page_idle_lock_attrs,
 	.name = "page_idle",
 };
 
-- 
2.17.1

