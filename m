Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3072C2464FC
	for <lists+linux-doc@lfdr.de>; Mon, 17 Aug 2020 12:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgHQK6C (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Aug 2020 06:58:02 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:64837 "EHLO
        smtp-fw-2101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbgHQK5W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Aug 2020 06:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1597661841; x=1629197841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=1L8j0imCjqj6Ox0Kf+3S46R4RWttBliVjR+yZC3m/8Y=;
  b=ocAKOUiYHhwoEXBC+PcF9OSTDymX4wH8aLEqbCUzeYAQs5y8tdAU0nDf
   RWifU1Mixda+x/Xkj+D8r/a5d8dNzYX/Q02ZUWFyw67bFybFYrD/A3lwP
   Ap3roaqGubR7gi+P4XR3aUtrIv+ocV/NUnD/nK1JDd2gFb3bVzO2AiXcw
   M=;
X-IronPort-AV: E=Sophos;i="5.76,322,1592870400"; 
   d="scan'208";a="48093282"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 17 Aug 2020 10:57:15 +0000
Received: from EX13MTAUEA001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
        by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS id 4C92BA2003;
        Mon, 17 Aug 2020 10:57:13 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 17 Aug 2020 10:57:12 +0000
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.192) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 17 Aug 2020 10:56:56 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <fan.du@intel.com>, <foersleo@amazon.de>,
        <gthelen@google.com>, <irogers@google.com>, <jolsa@redhat.com>,
        <kirill@shutemov.name>, <mark.rutland@arm.com>, <mgorman@suse.de>,
        <minchan@kernel.org>, <mingo@redhat.com>, <namhyung@kernel.org>,
        <peterz@infradead.org>, <rdunlap@infradead.org>,
        <riel@surriel.com>, <rientjes@google.com>, <rostedt@goodmis.org>,
        <rppt@kernel.org>, <sblbir@amazon.com>, <shakeelb@google.com>,
        <shuah@kernel.org>, <sj38.park@gmail.com>, <snu@amazon.de>,
        <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <zgf574564920@gmail.com>, <linux-damon@amazon.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v20 14/15] mm/damon: Add user space selftests
Date:   Mon, 17 Aug 2020 12:51:36 +0200
Message-ID: <20200817105137.19296-15-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817105137.19296-1-sjpark@amazon.com>
References: <20200817105137.19296-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.192]
X-ClientProxiedBy: EX13D02UWC004.ant.amazon.com (10.43.162.236) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit adds a simple user space tests for DAMON.  The tests are
using kselftest framework.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 tools/testing/selftests/damon/Makefile        |   7 +
 .../selftests/damon/_chk_dependency.sh        |  28 +++
 tools/testing/selftests/damon/_chk_record.py  | 109 ++++++++++++
 .../testing/selftests/damon/debugfs_attrs.sh  | 161 ++++++++++++++++++
 .../testing/selftests/damon/debugfs_record.sh |  50 ++++++
 5 files changed, 355 insertions(+)
 create mode 100644 tools/testing/selftests/damon/Makefile
 create mode 100644 tools/testing/selftests/damon/_chk_dependency.sh
 create mode 100644 tools/testing/selftests/damon/_chk_record.py
 create mode 100755 tools/testing/selftests/damon/debugfs_attrs.sh
 create mode 100755 tools/testing/selftests/damon/debugfs_record.sh

diff --git a/tools/testing/selftests/damon/Makefile b/tools/testing/selftests/damon/Makefile
new file mode 100644
index 000000000000..cfd5393a4639
--- /dev/null
+++ b/tools/testing/selftests/damon/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for damon selftests
+
+TEST_FILES = _chk_dependency.sh _chk_record_file.py
+TEST_PROGS = debugfs_attrs.sh debugfs_record.sh
+
+include ../lib.mk
diff --git a/tools/testing/selftests/damon/_chk_dependency.sh b/tools/testing/selftests/damon/_chk_dependency.sh
new file mode 100644
index 000000000000..b304b7779976
--- /dev/null
+++ b/tools/testing/selftests/damon/_chk_dependency.sh
@@ -0,0 +1,28 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+DBGFS=/sys/kernel/debug/damon
+
+if [ $EUID -ne 0 ];
+then
+	echo "Run as root"
+	exit $ksft_skip
+fi
+
+if [ ! -d $DBGFS ]
+then
+	echo "$DBGFS not found"
+	exit $ksft_skip
+fi
+
+for f in attrs record target_ids monitor_on
+do
+	if [ ! -f "$DBGFS/$f" ]
+	then
+		echo "$f not found"
+		exit 1
+	fi
+done
diff --git a/tools/testing/selftests/damon/_chk_record.py b/tools/testing/selftests/damon/_chk_record.py
new file mode 100644
index 000000000000..73e128904319
--- /dev/null
+++ b/tools/testing/selftests/damon/_chk_record.py
@@ -0,0 +1,109 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"Check whether the DAMON record file is valid"
+
+import argparse
+import struct
+import sys
+
+fmt_version = 0
+
+def set_fmt_version(f):
+    global fmt_version
+
+    mark = f.read(16)
+    if mark == b'damon_recfmt_ver':
+        fmt_version = struct.unpack('i', f.read(4))[0]
+    else:
+        fmt_version = 0
+        f.seek(0)
+    return fmt_version
+
+def read_pid(f):
+    if fmt_version == 1:
+        pid = struct.unpack('i', f.read(4))[0]
+    else:
+        pid = struct.unpack('L', f.read(8))[0]
+
+def err_percent(val, expected):
+    return abs(val - expected) / expected * 100
+
+def chk_task_info(f):
+    pid = read_pid(f)
+    nr_regions = struct.unpack('I', f.read(4))[0]
+
+    if nr_regions > max_nr_regions:
+        print('too many regions: %d > %d' % (nr_regions, max_nr_regions))
+        exit(1)
+
+    nr_gaps = 0
+    eaddr = 0
+    for r in range(nr_regions):
+        saddr = struct.unpack('L', f.read(8))[0]
+        if eaddr and saddr != eaddr:
+            nr_gaps += 1
+        eaddr = struct.unpack('L', f.read(8))[0]
+        nr_accesses = struct.unpack('I', f.read(4))[0]
+
+        if saddr >= eaddr:
+            print('wrong region [%d,%d)' % (saddr, eaddr))
+            exit(1)
+
+        max_nr_accesses = aint / sint
+        if nr_accesses > max_nr_accesses:
+            if err_percent(nr_accesses, max_nr_accesses) > 15:
+                print('too high nr_access: expected %d but %d' %
+                        (max_nr_accesses, nr_accesses))
+                exit(1)
+    if nr_gaps != 2:
+        print('number of gaps are not two but %d' % nr_gaps)
+        exit(1)
+
+def parse_time_us(bindat):
+    sec = struct.unpack('l', bindat[0:8])[0]
+    nsec = struct.unpack('l', bindat[8:16])[0]
+    return (sec * 1000000000 + nsec) / 1000
+
+def main():
+    global sint
+    global aint
+    global min_nr
+    global max_nr_regions
+
+    parser = argparse.ArgumentParser()
+    parser.add_argument('file', metavar='<file>',
+            help='path to the record file')
+    parser.add_argument('--attrs', metavar='<attrs>',
+            default='5000 100000 1000000 10 1000',
+            help='content of debugfs attrs file')
+    args = parser.parse_args()
+    file_path = args.file
+    attrs = [int(x) for x in args.attrs.split()]
+    sint, aint, rint, min_nr, max_nr_regions = attrs
+
+    with open(file_path, 'rb') as f:
+        set_fmt_version(f)
+        last_aggr_time = None
+        while True:
+            timebin = f.read(16)
+            if len(timebin) != 16:
+                break
+
+            now = parse_time_us(timebin)
+            if not last_aggr_time:
+                last_aggr_time = now
+            else:
+                error = err_percent(now - last_aggr_time, aint)
+                if error > 15:
+                    print('wrong aggr interval: expected %d, but %d' %
+                            (aint, now - last_aggr_time))
+                    exit(1)
+                last_aggr_time = now
+
+            nr_tasks = struct.unpack('I', f.read(4))[0]
+            for t in range(nr_tasks):
+                chk_task_info(f)
+
+if __name__ == '__main__':
+    main()
diff --git a/tools/testing/selftests/damon/debugfs_attrs.sh b/tools/testing/selftests/damon/debugfs_attrs.sh
new file mode 100755
index 000000000000..c75557e8ba58
--- /dev/null
+++ b/tools/testing/selftests/damon/debugfs_attrs.sh
@@ -0,0 +1,161 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+source ./_chk_dependency.sh
+
+# Test attrs file
+file="$DBGFS/attrs"
+
+ORIG_CONTENT=$(cat $file)
+
+echo 1 2 3 4 5 > $file
+if [ $? -ne 0 ]
+then
+	echo "$file write failed"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo 1 2 3 4 > $file
+if [ $? -eq 0 ]
+then
+	echo "$file write success (should failed)"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+CONTENT=$(cat $file)
+if [ "$CONTENT" != "1 2 3 4 5" ]
+then
+	echo "$file not written"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo $ORIG_CONTENT > $file
+
+# Test record file
+file="$DBGFS/record"
+
+ORIG_CONTENT=$(cat $file)
+
+echo "4242 foo.bar" > $file
+if [ $? -ne 0 ]
+then
+	echo "$file writing sane input failed"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo abc 2 3 > $file
+if [ $? -eq 0 ]
+then
+	echo "$file writing insane input 1 success (should failed)"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo 123 > $file
+if [ $? -eq 0 ]
+then
+	echo "$file writing insane input 2 success (should failed)"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+CONTENT=$(cat $file)
+if [ "$CONTENT" != "4242 foo.bar" ]
+then
+	echo "$file not written"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo "0 null" > $file
+if [ $? -ne 0 ]
+then
+	echo "$file disabling write fail"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+CONTENT=$(cat $file)
+if [ "$CONTENT" != "0 null" ]
+then
+	echo "$file not disabled"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo "4242 foo.bar" > $file
+if [ $? -ne 0 ]
+then
+	echo "$file writing sane data again fail"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo $ORIG_CONTENT > $file
+
+# Test target_ids file
+file="$DBGFS/target_ids"
+
+ORIG_CONTENT=$(cat $file)
+
+echo "1 2 3 4" > $file
+if [ $? -ne 0 ]
+then
+	echo "$file write fail"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo "1 2 abc 4" > $file
+if [ $? -ne 0 ]
+then
+	echo "$file write fail"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+CONTENT=$(cat $file)
+if [ "$CONTENT" != "1 2" ]
+then
+	echo "$file not written"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo abc 2 3 > $file
+if [ $? -ne 0 ]
+then
+	echo "$file wrong value write fail"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+if [ ! -z "$(cat $file)" ]
+then
+	echo "$file not cleared"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo > $file
+if [ $? -ne 0 ]
+then
+	echo "$file init fail"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+if [ ! -z "$(cat $file)" ]
+then
+	echo "$file not initialized"
+	echo $ORIG_CONTENT > $file
+	exit 1
+fi
+
+echo $ORIG_CONTENT > $file
+
+echo "PASS"
diff --git a/tools/testing/selftests/damon/debugfs_record.sh b/tools/testing/selftests/damon/debugfs_record.sh
new file mode 100755
index 000000000000..c0fb8d24dc32
--- /dev/null
+++ b/tools/testing/selftests/damon/debugfs_record.sh
@@ -0,0 +1,50 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+source ./_chk_dependency.sh
+
+restore_attrs()
+{
+	echo $ORIG_ATTRS > $DBGFS/attrs
+	echo $ORIG_TARGET_IDS > $DBGFS/target_ids
+	echo $ORIG_RECORD > $DBGFS/record
+}
+
+ORIG_ATTRS=$(cat $DBGFS/attrs)
+ORIG_TARGET_IDS=$(cat $DBGFS/target_ids)
+ORIG_RECORD=$(cat $DBGFS/record)
+
+rfile=$pwd/damon.data
+
+rm -f $rfile
+ATTRS="5000 100000 1000000 10 1000"
+echo $ATTRS > $DBGFS/attrs
+echo 4096 $rfile > $DBGFS/record
+sleep 5 &
+echo $(pidof sleep) > $DBGFS/target_ids
+echo on > $DBGFS/monitor_on
+sleep 0.5
+killall sleep
+echo off > $DBGFS/monitor_on
+
+sync
+
+if [ ! -f $rfile ]
+then
+	echo "record file not made"
+	restore_attrs
+
+	exit 1
+fi
+
+python3 ./_chk_record.py $rfile --attrs "$ATTRS"
+if [ $? -ne 0 ]
+then
+	echo "record file is wrong"
+	restore_attrs
+	exit 1
+fi
+
+rm -f $rfile
+restore_attrs
+echo "PASS"
-- 
2.17.1

