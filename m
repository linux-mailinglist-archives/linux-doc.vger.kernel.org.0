Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2BE28592C
	for <lists+linux-doc@lfdr.de>; Wed,  7 Oct 2020 09:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbgJGHPj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Oct 2020 03:15:39 -0400
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:17050 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727624AbgJGHPj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Oct 2020 03:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1602054938; x=1633590938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=eFQ5FjEXjCcRqP315OtcZTEl8DRR0ETd5Jfrqerv8aI=;
  b=QfvDMQeJkfjjTbw3o/0qGiDqcac86yVeecaZJiVDWask6qqU716BUE7B
   gH+HCUQlbYHMXKeVX5t3PeYWplihno4y5sm5Nv7yWLml0G6LHfxVSKh4a
   rtRTxaA9Z7zf0WijpfbbgIeDVTrbFh7QQojNfrDP5Jr2RwILQeiBrcAiO
   I=;
X-IronPort-AV: E=Sophos;i="5.77,345,1596499200"; 
   d="scan'208";a="74032911"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 07 Oct 2020 07:15:35 +0000
Received: from EX13D31EUA004.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS id 42A03A1D5B;
        Wed,  7 Oct 2020 07:15:21 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.73) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 7 Oct 2020 07:15:05 +0000
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
Subject: [RFC v9 02/10] tools/damon: Support init target regions specification
Date:   Wed, 7 Oct 2020 09:14:01 +0200
Message-ID: <20201007071409.12174-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201007071409.12174-1-sjpark@amazon.com>
References: <20201007071409.12174-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.73]
X-ClientProxiedBy: EX13D31UWA003.ant.amazon.com (10.43.160.130) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit updates the damon user space tool to support the initial
monitoring target regions specification.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 tools/damon/_damon.py  | 39 +++++++++++++++++++++++++++++++++++++++
 tools/damon/record.py  | 12 +++++++-----
 tools/damon/schemes.py | 12 +++++++-----
 3 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/tools/damon/_damon.py b/tools/damon/_damon.py
index a4f6c03c23e4..a22ec3777c16 100644
--- a/tools/damon/_damon.py
+++ b/tools/damon/_damon.py
@@ -12,12 +12,25 @@ debugfs_attrs = None
 debugfs_record = None
 debugfs_schemes = None
 debugfs_target_ids = None
+debugfs_init_regions = None
 debugfs_monitor_on = None
 
 def set_target_id(tid):
     with open(debugfs_target_ids, 'w') as f:
         f.write('%s\n' % tid)
 
+def set_target(tid, init_regions=[]):
+    rc = set_target_id(tid)
+    if rc:
+        return rc
+
+    if not os.path.exists(debugfs_init_regions):
+        return 0
+
+    string = ' '.join(['%s %d %d' % (tid, r[0], r[1]) for r in init_regions])
+    return subprocess.call('echo "%s" > %s' % (string, debugfs_init_regions),
+            shell=True, executable='/bin/bash')
+
 def turn_damon(on_off):
     return subprocess.call("echo %s > %s" % (on_off, debugfs_monitor_on),
             shell=True, executable="/bin/bash")
@@ -97,6 +110,7 @@ def chk_update_debugfs(debugfs):
     global debugfs_record
     global debugfs_schemes
     global debugfs_target_ids
+    global debugfs_init_regions
     global debugfs_monitor_on
 
     debugfs_damon = os.path.join(debugfs, 'damon')
@@ -104,6 +118,7 @@ def chk_update_debugfs(debugfs):
     debugfs_record = os.path.join(debugfs_damon, 'record')
     debugfs_schemes = os.path.join(debugfs_damon, 'schemes')
     debugfs_target_ids = os.path.join(debugfs_damon, 'target_ids')
+    debugfs_init_regions = os.path.join(debugfs_damon, 'init_regions')
     debugfs_monitor_on = os.path.join(debugfs_damon, 'monitor_on')
 
     if not os.path.isdir(debugfs_damon):
@@ -131,6 +146,26 @@ def cmd_args_to_attrs(args):
     return Attrs(sample_interval, aggr_interval, regions_update_interval,
             min_nr_regions, max_nr_regions, rbuf_len, rfile_path, schemes)
 
+def cmd_args_to_init_regions(args):
+    regions = []
+    for arg in args.regions.split():
+        addrs = arg.split('-')
+        try:
+            if len(addrs) != 2:
+                raise Exception('two addresses not given')
+            start = int(addrs[0])
+            end = int(addrs[1])
+            if start >= end:
+                raise Exception('start >= end')
+            if regions and regions[-1][1] > start:
+                raise Exception('regions overlap')
+        except Exception as e:
+            print('Wrong \'--regions\' argument (%s)' % e)
+            exit(1)
+
+        regions.append([start, end])
+    return regions
+
 def set_attrs_argparser(parser):
     parser.add_argument('-d', '--debugfs', metavar='<debugfs>', type=str,
             default='/sys/kernel/debug', help='debugfs mounted path')
@@ -144,3 +179,7 @@ def set_attrs_argparser(parser):
             default=10, help='minimal number of regions')
     parser.add_argument('-m', '--maxr', metavar='<# regions>', type=int,
             default=1000, help='maximum number of regions')
+
+def set_init_regions_argparser(parser):
+    parser.add_argument('-r', '--regions', metavar='"<start>-<end> ..."',
+            type=str, default='', help='monitoring target address regions')
diff --git a/tools/damon/record.py b/tools/damon/record.py
index 6d1cbe593b94..11fd54001472 100644
--- a/tools/damon/record.py
+++ b/tools/damon/record.py
@@ -24,7 +24,7 @@ def pidfd_open(pid):
 
     return syscall(NR_pidfd_open, pid, 0)
 
-def do_record(target, is_target_cmd, attrs, old_attrs, pidfd):
+def do_record(target, is_target_cmd, init_regions, attrs, old_attrs, pidfd):
     if os.path.isfile(attrs.rfile_path):
         os.rename(attrs.rfile_path, attrs.rfile_path + '.old')
 
@@ -48,8 +48,8 @@ def do_record(target, is_target_cmd, attrs, old_attrs, pidfd):
         # only for reference of the pidfd usage.
         target = 'pidfd %s' % fd
 
-    if _damon.set_target_id(target):
-        print('target id setting (%s) failed' % target)
+    if _damon.set_target(target, init_regions):
+        print('target setting (%s, %s) failed' % (target, init_regions))
         cleanup_exit(old_attrs, -2)
     if _damon.turn_damon('on'):
         print('could not turn on damon' % target)
@@ -91,6 +91,7 @@ def chk_permission():
 
 def set_argparser(parser):
     _damon.set_attrs_argparser(parser)
+    _damon.set_init_regions_argparser(parser)
     parser.add_argument('target', type=str, metavar='<target>',
             help='the target command or the pid to record')
     parser.add_argument('--pidfd', action='store_true',
@@ -117,19 +118,20 @@ def main(args=None):
     args.schemes = ''
     pidfd = args.pidfd
     new_attrs = _damon.cmd_args_to_attrs(args)
+    init_regions = _damon.cmd_args_to_init_regions(args)
     target = args.target
 
     target_fields = target.split()
     if not subprocess.call('which %s &> /dev/null' % target_fields[0],
             shell=True, executable='/bin/bash'):
-        do_record(target, True, new_attrs, orig_attrs, pidfd)
+        do_record(target, True, init_regions, new_attrs, orig_attrs, pidfd)
     else:
         try:
             pid = int(target)
         except:
             print('target \'%s\' is neither a command, nor a pid' % target)
             exit(1)
-        do_record(target, False, new_attrs, orig_attrs, pidfd)
+        do_record(target, False, init_regions, new_attrs, orig_attrs, pidfd)
 
 if __name__ == '__main__':
     main()
diff --git a/tools/damon/schemes.py b/tools/damon/schemes.py
index 9095835f6133..cfec89854a08 100644
--- a/tools/damon/schemes.py
+++ b/tools/damon/schemes.py
@@ -14,7 +14,7 @@ import time
 import _convert_damos
 import _damon
 
-def run_damon(target, is_target_cmd, attrs, old_attrs):
+def run_damon(target, is_target_cmd, init_regions, attrs, old_attrs):
     if os.path.isfile(attrs.rfile_path):
         os.rename(attrs.rfile_path, attrs.rfile_path + '.old')
 
@@ -27,8 +27,8 @@ def run_damon(target, is_target_cmd, attrs, old_attrs):
     if is_target_cmd:
         p = subprocess.Popen(target, shell=True, executable='/bin/bash')
         target = p.pid
-    if _damon.set_target_pid(target):
-        print('pid setting (%s) failed' % target)
+    if _damon.set_target(target, init_regions):
+        print('target setting (%s, %s) failed' % (target, init_regions))
         cleanup_exit(old_attrs, -2)
     if _damon.turn_damon('on'):
         print('could not turn on damon' % target)
@@ -68,6 +68,7 @@ def chk_permission():
 
 def set_argparser(parser):
     _damon.set_attrs_argparser(parser)
+    _damon.set_init_regions_argparser(parser)
     parser.add_argument('target', type=str, metavar='<target>',
             help='the target command or the pid to record')
     parser.add_argument('-c', '--schemes', metavar='<file>', type=str,
@@ -92,19 +93,20 @@ def main(args=None):
     args.out = 'null'
     args.schemes = _convert_damos.convert(args.schemes, args.sample, args.aggr)
     new_attrs = _damon.cmd_args_to_attrs(args)
+    init_regions = _damon.cmd_args_to_init_regions(args)
     target = args.target
 
     target_fields = target.split()
     if not subprocess.call('which %s &> /dev/null' % target_fields[0],
             shell=True, executable='/bin/bash'):
-        run_damon(target, True, new_attrs, orig_attrs)
+        run_damon(target, True, init_regions, new_attrs, orig_attrs)
     else:
         try:
             pid = int(target)
         except:
             print('target \'%s\' is neither a command, nor a pid' % target)
             exit(1)
-        run_damon(target, False, new_attrs, orig_attrs)
+        run_damon(target, False, init_regions, new_attrs, orig_attrs)
 
 if __name__ == '__main__':
     main()
-- 
2.17.1

