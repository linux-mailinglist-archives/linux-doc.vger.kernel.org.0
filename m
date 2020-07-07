Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02CC21694E
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2020 11:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgGGJl2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Jul 2020 05:41:28 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:62790 "EHLO
        smtp-fw-6002.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgGGJl2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jul 2020 05:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1594114885; x=1625650885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=TrQTc5c/BqEqB8zaEiC0QXCwv9EUPh2+73As+JUzZjI=;
  b=GKPiiqYlhqz0Sx+6wIbH0K3g61RDaTuEIDYZ0vvbILqmchO4AI4/FwQc
   LK1NNHFfuxoUXfkR/F99X0nFrhtLFHU201KwvIHJ0Rk7qytVGkXPdTtwl
   qZC+cL+Xo3X05ZYVJz1Tk18zWuQKtvpOgIod4qdH+3W0kmkACWKeRK0ww
   c=;
IronPort-SDR: EeFqE9B5dZ8tvc2J/6gGeTz0oL20m8/JXDYAHkXm22HCbB4m3TVz6PaDeUQhckuZBPPe6+2OkM
 7M1SxXudEvFw==
X-IronPort-AV: E=Sophos;i="5.75,323,1589241600"; 
   d="scan'208";a="40435683"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 07 Jul 2020 09:41:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS id 72AF8A1E11;
        Tue,  7 Jul 2020 09:41:12 +0000 (UTC)
Received: from EX13D31EUA004.ant.amazon.com (10.43.165.161) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 7 Jul 2020 09:41:11 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.203) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 7 Jul 2020 09:40:54 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <foersleo@amazon.de>, <irogers@google.com>,
        <jolsa@redhat.com>, <kirill@shutemov.name>, <mark.rutland@arm.com>,
        <mgorman@suse.de>, <minchan@kernel.org>, <mingo@redhat.com>,
        <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <rppt@kernel.org>, <sblbir@amazon.com>,
        <shakeelb@google.com>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <snu@amazon.de>, <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <linux-damon@amazon.com>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC v13 7/8] damon/tools: Support more human friendly 'schemes' control
Date:   Tue, 7 Jul 2020 11:38:04 +0200
Message-ID: <20200707093805.4775-8-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707093805.4775-1-sjpark@amazon.com>
References: <20200707093805.4775-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.203]
X-ClientProxiedBy: EX13D36UWA002.ant.amazon.com (10.43.160.24) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit implements 'schemes' subcommand of the damon userspace tool.
It can be used to describe and apply the data access monitoring-based
operation schemes in more human friendly fashion.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 tools/damon/_convert_damos.py | 141 ++++++++++++++++++++++++++++++++++
 tools/damon/_damon.py         |  27 +++++--
 tools/damon/damo              |   7 ++
 tools/damon/schemes.py        | 110 ++++++++++++++++++++++++++
 4 files changed, 280 insertions(+), 5 deletions(-)
 create mode 100755 tools/damon/_convert_damos.py
 create mode 100644 tools/damon/schemes.py

diff --git a/tools/damon/_convert_damos.py b/tools/damon/_convert_damos.py
new file mode 100755
index 000000000000..0fd84b3701c9
--- /dev/null
+++ b/tools/damon/_convert_damos.py
@@ -0,0 +1,141 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Change human readable data access monitoring-based operation schemes to the low
+level input for the '<debugfs>/damon/schemes' file.  Below is an example of the
+schemes written in the human readable format:
+
+    # format is:
+    # <min/max size> <min/max frequency (0-100)> <min/max age> <action>
+    #
+    # B/K/M/G/T for Bytes/KiB/MiB/GiB/TiB
+    # us/ms/s/m/h/d for micro-seconds/milli-seconds/seconds/minutes/hours/days
+    # 'min/max' for possible min/max value.
+
+    # if a region keeps a high access frequency for >=100ms, put the region on
+    # the head of the LRU list (call madvise() with MADV_WILLNEED).
+    min    max      80      max     100ms   max willneed
+
+    # if a region keeps a low access frequency for >=200ms and <=one hour, put
+    # the region on the tail of the LRU list (call madvise() with MADV_COLD).
+    min     max     10      20      200ms   1h  cold
+
+    # if a region keeps a very low access frequency for >=60 seconds, swap out
+    # the region immediately (call madvise() with MADV_PAGEOUT).
+    min     max     0       10      60s     max pageout
+
+    # if a region of a size >=2MiB keeps a very high access frequency for
+    # >=100ms, let the region to use huge pages (call madvise() with
+    # MADV_HUGEPAGE).
+    2M      max     90      100     100ms   max hugepage
+
+    # If a regions of a size >=2MiB keeps small access frequency for >=100ms,
+    # avoid the region using huge pages (call madvise() with MADV_NOHUGEPAGE).
+    2M      max     0       25      100ms   max nohugepage
+"""
+
+import argparse
+import platform
+
+uint_max = 2**32 - 1
+ulong_max = 2**64 - 1
+if platform.architecture()[0] != '64bit':
+    ulong_max = 2**32 - 1
+
+unit_to_bytes = {'B': 1, 'K': 1024, 'M': 1024 * 1024, 'G': 1024 * 1024 * 1024,
+        'T': 1024 * 1024 * 1024 * 1024}
+
+def text_to_bytes(txt):
+    if txt == 'min':
+        return 0
+    if txt == 'max':
+        return ulong_max
+
+    unit = txt[-1]
+    number = float(txt[:-1])
+    return int(number * unit_to_bytes[unit])
+
+unit_to_usecs = {'us': 1, 'ms': 1000, 's': 1000 * 1000, 'm': 60 * 1000 * 1000,
+        'h': 60 * 60 * 1000 * 1000, 'd': 24 * 60 * 60 * 1000 * 1000}
+
+def text_to_aggr_intervals(txt, aggr_interval):
+    if txt == 'min':
+        return 0
+    if txt == 'max':
+        return uint_max
+
+    unit = txt[-2:]
+    if unit in ['us', 'ms']:
+        number = float(txt[:-2])
+    else:
+        unit = txt[-1]
+        number = float(txt[:-1])
+    return int(number * unit_to_usecs[unit]) / aggr_interval
+
+damos_action_to_int = {'DAMOS_WILLNEED': 0, 'DAMOS_COLD': 1,
+        'DAMOS_PAGEOUT': 2, 'DAMOS_HUGEPAGE': 3, 'DAMOS_NOHUGEPAGE': 4,
+        'DAMOS_STAT': 5}
+
+def text_to_damos_action(txt):
+    return damos_action_to_int['DAMOS_' + txt.upper()]
+
+def text_to_nr_accesses(txt, max_nr_accesses):
+    if txt == 'min':
+        return 0
+    if txt == 'max':
+        return max_nr_accesses
+
+    return int(float(txt) * max_nr_accesses / 100)
+
+def debugfs_scheme(line, sample_interval, aggr_interval):
+    fields = line.split()
+    if len(fields) != 7:
+        print('wrong input line: %s' % line)
+        exit(1)
+
+    limit_nr_accesses = aggr_interval / sample_interval
+    try:
+        min_sz = text_to_bytes(fields[0])
+        max_sz = text_to_bytes(fields[1])
+        min_nr_accesses = text_to_nr_accesses(fields[2], limit_nr_accesses)
+        max_nr_accesses = text_to_nr_accesses(fields[3], limit_nr_accesses)
+        min_age = text_to_aggr_intervals(fields[4], aggr_interval)
+        max_age = text_to_aggr_intervals(fields[5], aggr_interval)
+        action = text_to_damos_action(fields[6])
+    except:
+        print('wrong input field')
+        raise
+    return '%d\t%d\t%d\t%d\t%d\t%d\t%d' % (min_sz, max_sz, min_nr_accesses,
+            max_nr_accesses, min_age, max_age, action)
+
+def convert(schemes_file, sample_interval, aggr_interval):
+    lines = []
+    with open(schemes_file, 'r') as f:
+        for line in f:
+            if line.startswith('#'):
+                continue
+            line = line.strip()
+            if line == '':
+                continue
+            lines.append(debugfs_scheme(line, sample_interval, aggr_interval))
+    return '\n'.join(lines)
+
+def main():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('input', metavar='<file>',
+            help='input file describing the schemes')
+    parser.add_argument('-s', '--sample', metavar='<interval>', type=int,
+            default=5000, help='sampling interval (us)')
+    parser.add_argument('-a', '--aggr', metavar='<interval>', type=int,
+            default=100000, help='aggregation interval (us)')
+    args = parser.parse_args()
+
+    schemes_file = args.input
+    sample_interval = args.sample
+    aggr_interval = args.aggr
+
+    print(convert(schemes_file, sample_interval, aggr_interval))
+
+if __name__ == '__main__':
+    main()
diff --git a/tools/damon/_damon.py b/tools/damon/_damon.py
index 2a08468ad27e..3620ef12a5ea 100644
--- a/tools/damon/_damon.py
+++ b/tools/damon/_damon.py
@@ -10,6 +10,7 @@ import subprocess
 
 debugfs_attrs = None
 debugfs_record = None
+debugfs_schemes = None
 debugfs_pids = None
 debugfs_monitor_on = None
 
@@ -33,8 +34,9 @@ class Attrs:
     max_nr_regions = None
     rbuf_len = None
     rfile_path = None
+    schemes = None
 
-    def __init__(self, s, a, r, n, x, l, f):
+    def __init__(self, s, a, r, n, x, l, f, c):
         self.sample_interval = s
         self.aggr_interval = a
         self.regions_update_interval = r
@@ -42,12 +44,13 @@ class Attrs:
         self.max_nr_regions = x
         self.rbuf_len = l
         self.rfile_path = f
+        self.schemes = c
 
     def __str__(self):
-        return "%s %s %s %s %s %s %s" % (self.sample_interval,
+        return "%s %s %s %s %s %s %s\n%s" % (self.sample_interval,
                 self.aggr_interval, self.regions_update_interval,
                 self.min_nr_regions, self.max_nr_regions, self.rbuf_len,
-                self.rfile_path)
+                self.rfile_path, self.schemes)
 
     def attr_str(self):
         return "%s %s %s %s %s " % (self.sample_interval, self.aggr_interval,
@@ -66,6 +69,9 @@ class Attrs:
             debugfs_record), shell=True, executable='/bin/bash')
         if ret:
             return ret
+        return subprocess.call('echo %s > %s' % (
+            self.schemes.replace('\n', ' '), debugfs_schemes), shell=True,
+            executable='/bin/bash')
 
 def current_attrs():
     with open(debugfs_attrs, 'r') as f:
@@ -77,17 +83,26 @@ def current_attrs():
     attrs.append(int(rattrs[0]))
     attrs.append(rattrs[1])
 
+    with open(debugfs_schemes, 'r') as f:
+        schemes = f.read()
+
+    # The last two fields in each line are statistics.  Remove those.
+    schemes = [' '.join(x.split()[:-2]) for x in schemes.strip().split('\n')]
+    attrs.append('\n'.join(schemes))
+
     return Attrs(*attrs)
 
 def chk_update_debugfs(debugfs):
     global debugfs_attrs
     global debugfs_record
+    global debugfs_schemes
     global debugfs_pids
     global debugfs_monitor_on
 
     debugfs_damon = os.path.join(debugfs, 'damon')
     debugfs_attrs = os.path.join(debugfs_damon, 'attrs')
     debugfs_record = os.path.join(debugfs_damon, 'record')
+    debugfs_schemes = os.path.join(debugfs_damon, 'schemes')
     debugfs_pids = os.path.join(debugfs_damon, 'pids')
     debugfs_monitor_on = os.path.join(debugfs_damon, 'monitor_on')
 
@@ -95,7 +110,8 @@ def chk_update_debugfs(debugfs):
         print("damon debugfs dir (%s) not found", debugfs_damon)
         exit(1)
 
-    for f in [debugfs_attrs, debugfs_record, debugfs_pids, debugfs_monitor_on]:
+    for f in [debugfs_attrs, debugfs_record, debugfs_schemes, debugfs_pids,
+            debugfs_monitor_on]:
         if not os.path.isfile(f):
             print("damon debugfs file (%s) not found" % f)
             exit(1)
@@ -111,8 +127,9 @@ def cmd_args_to_attrs(args):
     if not os.path.isabs(args.out):
         args.out = os.path.join(os.getcwd(), args.out)
     rfile_path = args.out
+    schemes = args.schemes
     return Attrs(sample_interval, aggr_interval, regions_update_interval,
-            min_nr_regions, max_nr_regions, rbuf_len, rfile_path)
+            min_nr_regions, max_nr_regions, rbuf_len, rfile_path, schemes)
 
 def set_attrs_argparser(parser):
     parser.add_argument('-d', '--debugfs', metavar='<debugfs>', type=str,
diff --git a/tools/damon/damo b/tools/damon/damo
index 58e1099ae5fc..ce7180069bef 100755
--- a/tools/damon/damo
+++ b/tools/damon/damo
@@ -5,6 +5,7 @@ import argparse
 
 import record
 import report
+import schemes
 
 class SubCmdHelpFormatter(argparse.RawDescriptionHelpFormatter):
     def _format_action(self, action):
@@ -25,6 +26,10 @@ parser_record = subparser.add_parser('record',
         help='record data accesses of the given target processes')
 record.set_argparser(parser_record)
 
+parser_schemes = subparser.add_parser('schemes',
+        help='apply operation schemes to the given target process')
+schemes.set_argparser(parser_schemes)
+
 parser_report = subparser.add_parser('report',
         help='report the recorded data accesses in the specified form')
 report.set_argparser(parser_report)
@@ -33,5 +38,7 @@ args = parser.parse_args()
 
 if args.command == 'record':
     record.main(args)
+elif args.command == 'schemes':
+    schemes.main(args)
 elif args.command == 'report':
     report.main(args)
diff --git a/tools/damon/schemes.py b/tools/damon/schemes.py
new file mode 100644
index 000000000000..9f369db7d12e
--- /dev/null
+++ b/tools/damon/schemes.py
@@ -0,0 +1,110 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Apply given operation schemes to the target process.
+"""
+
+import argparse
+import os
+import signal
+import subprocess
+import time
+
+import _convert_damos
+import _damon
+
+def run_damon(target, is_target_cmd, attrs, old_attrs):
+    if os.path.isfile(attrs.rfile_path):
+        os.rename(attrs.rfile_path, attrs.rfile_path + '.old')
+
+    if attrs.apply():
+        print('attributes (%s) failed to be applied' % attrs)
+        cleanup_exit(old_attrs, -1)
+    print('# damon attrs: %s %s' % (attrs.attr_str(), attrs.record_str()))
+    for line in attrs.schemes.split('\n'):
+        print('# scheme: %s' % line)
+    if is_target_cmd:
+        p = subprocess.Popen(target, shell=True, executable='/bin/bash')
+        target = p.pid
+    if _damon.set_target_pid(target):
+        print('pid setting (%s) failed' % target)
+        cleanup_exit(old_attrs, -2)
+    if _damon.turn_damon('on'):
+        print('could not turn on damon' % target)
+        cleanup_exit(old_attrs, -3)
+    while not _damon.is_damon_running():
+        sleep(1)
+    print('Press Ctrl+C to stop')
+    if is_target_cmd:
+        p.wait()
+    while True:
+        # damon will turn it off by itself if the target tasks are terminated.
+        if not _damon.is_damon_running():
+            break
+        time.sleep(1)
+
+    cleanup_exit(old_attrs, 0)
+
+def cleanup_exit(orig_attrs, exit_code):
+    if _damon.is_damon_running():
+        if _damon.turn_damon('off'):
+            print('failed to turn damon off!')
+        while _damon.is_damon_running():
+            sleep(1)
+    if orig_attrs:
+        if orig_attrs.apply():
+            print('original attributes (%s) restoration failed!' % orig_attrs)
+    exit(exit_code)
+
+def sighandler(signum, frame):
+    print('\nsignal %s received' % signum)
+    cleanup_exit(orig_attrs, signum)
+
+def chk_permission():
+    if os.geteuid() != 0:
+        print("Run as root")
+        exit(1)
+
+def set_argparser(parser):
+    _damon.set_attrs_argparser(parser)
+    parser.add_argument('target', type=str, metavar='<target>',
+            help='the target command or the pid to record')
+    parser.add_argument('-c', '--schemes', metavar='<file>', type=str,
+            default='damon.schemes',
+            help='data access monitoring-based operation schemes')
+
+def main(args=None):
+    global orig_attrs
+    if not args:
+        parser = argparse.ArgumentParser()
+        set_argparser(parser)
+        args = parser.parse_args()
+
+    chk_permission()
+    _damon.chk_update_debugfs(args.debugfs)
+
+    signal.signal(signal.SIGINT, sighandler)
+    signal.signal(signal.SIGTERM, sighandler)
+    orig_attrs = _damon.current_attrs()
+
+    args.rbuf = 0
+    args.out = 'null'
+    args.schemes = _convert_damos.convert(args.schemes, args.sample, args.aggr)
+    new_attrs = _damon.cmd_args_to_attrs(args)
+    target = args.target
+
+    target_fields = target.split()
+    if not subprocess.call('which %s > /dev/null' % target_fields[0],
+            shell=True, executable='/bin/bash'):
+        run_damon(target, True, new_attrs, orig_attrs)
+    else:
+        try:
+            pid = int(target)
+        except:
+            print('target \'%s\' is neither a command, nor a pid' % target)
+            exit(1)
+        run_damon(target, False, new_attrs, orig_attrs)
+
+if __name__ == '__main__':
+    main()
-- 
2.17.1

