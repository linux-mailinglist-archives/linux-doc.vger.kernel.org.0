Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD5C136D8D
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2020 14:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbgAJNQL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 10 Jan 2020 08:16:11 -0500
Received: from smtp-fw-2101.amazon.com ([72.21.196.25]:58994 "EHLO
        smtp-fw-2101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbgAJNQK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Jan 2020 08:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1578662170; x=1610198170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=dd7hgUMBjiWeB2ID4c80RlACUMmSuALWwx9nnbLEaXU=;
  b=fLoNBZq0d4UUc4+sIydkXAYPWgyxK9FFhnivNtgIwvqPgHA6Hx+7HIb6
   hnMaXG3s8aU4gMm5aRb8zZsMxjNDOldFoc2/tg5Hak2MqIpQppxW6lny9
   bGEnKdiqeVEP8cVEHIgbNyLb1EuF8OQhItIVUVfZz2gbzonPwA/c4R/Nr
   M=;
IronPort-SDR: 7IwacRRJeEQAX2GfTXqN2ID4A3eXwVn1DWJj9qufRe6SICV7xG1/4e6hp58Xz+HjjT68sxUov/
 bMIlFMFSowTQ==
X-IronPort-AV: E=Sophos;i="5.69,417,1571702400"; 
   d="scan'208";a="11883286"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP; 10 Jan 2020 13:16:08 +0000
Received: from EX13MTAUEA001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
        by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS id 93D56A25E8;
        Fri, 10 Jan 2020 13:16:06 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 13:16:05 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.115) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 13:16:01 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <corbet@lwn.net>, <linux-doc@vger.kernel.org>, <mgorman@suse.de>,
        <brendanhiggins@google.com>, <sj38.park@gmail.com>,
        SeongJae Park <sjpark@amazon.de>
Subject: [RFC PATCH 3/5] mm/damon: Add minimal user-space tools
Date:   Fri, 10 Jan 2020 14:15:20 +0100
Message-ID: <20200110131522.29964-4-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131522.29964-1-sjpark@amazon.com>
References: <20200110131522.29964-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.115]
X-ClientProxiedBy: EX13D10UWA001.ant.amazon.com (10.43.160.216) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

This commit adds a shallow wrapper python script, ``/tools/damon/damn``
that provides more convenient interface for the user space.  Note that
it is only aimed to be used for minimal reference of the DAMON's raw
interfaces and for debuggings of DAMON itself.

Quick Tutorial
--------------

To test DAMON on your system,

1. Ensure your kernel is built with CONFIG_DAMON turned on, and debugfs
   is mounted at ``/sys/kernel/debug/``.
2. ``<your kernel source tree>/tools/damon/damn -h``

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 tools/damon/bin2txt.py    |  64 +++++++
 tools/damon/damn          |  36 ++++
 tools/damon/heats.py      | 358 ++++++++++++++++++++++++++++++++++++++
 tools/damon/nr_regions.py | 116 ++++++++++++
 tools/damon/record.py     | 182 +++++++++++++++++++
 tools/damon/report.py     |  45 +++++
 tools/damon/wss.py        | 121 +++++++++++++
 7 files changed, 922 insertions(+)
 create mode 100644 tools/damon/bin2txt.py
 create mode 100644 tools/damon/damn
 create mode 100644 tools/damon/heats.py
 create mode 100644 tools/damon/nr_regions.py
 create mode 100644 tools/damon/record.py
 create mode 100644 tools/damon/report.py
 create mode 100644 tools/damon/wss.py

diff --git a/tools/damon/bin2txt.py b/tools/damon/bin2txt.py
new file mode 100644
index 000000000000..d5ffac60e02c
--- /dev/null
+++ b/tools/damon/bin2txt.py
@@ -0,0 +1,64 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+import argparse
+import os
+import struct
+import sys
+
+def parse_time(bindat):
+    "bindat should be 16 bytes"
+    sec = struct.unpack('l', bindat[0:8])[0]
+    nsec = struct.unpack('l', bindat[8:16])[0]
+    return sec * 1000000000 + nsec;
+
+def pr_region(f):
+    saddr = struct.unpack('L', f.read(8))[0]
+    eaddr = struct.unpack('L', f.read(8))[0]
+    nr_accesses = struct.unpack('I', f.read(4))[0]
+    print("%012x-%012x(%10d):\t%d" %
+            (saddr, eaddr, eaddr - saddr, nr_accesses))
+
+def pr_task_info(f):
+    pid = struct.unpack('L', f.read(8))[0]
+    print("pid: ", pid)
+    nr_regions = struct.unpack('I', f.read(4))[0]
+    print("nr_regions: ", nr_regions)
+    for r in range(nr_regions):
+        pr_region(f)
+
+def set_argparser(parser):
+    parser.add_argument('--input', '-i', type=str, metavar='<file>',
+            default='damon.data', help='input file name')
+
+def main(args=None):
+    if not args:
+        parser = argparse.ArgumentParser()
+        set_argparser(parser)
+        args = parser.parse_args()
+
+    file_path = args.input
+
+    if not os.path.isfile(file_path):
+        print('input file (%s) is not exist' % file_path)
+        exit(1)
+
+    with open(file_path, 'rb') as f:
+        start_time = None
+        while True:
+            timebin = f.read(16)
+            if len(timebin) != 16:
+                break
+            time = parse_time(timebin)
+            if not start_time:
+                start_time = time
+                print("start_time: ", start_time)
+            print("rel time: %16d" % (time - start_time))
+            nr_tasks = struct.unpack('I', f.read(4))[0]
+            print("nr_tasks: ", nr_tasks)
+            for t in range(nr_tasks):
+                pr_task_info(f)
+                print("")
+
+if __name__ == '__main__':
+    main()
diff --git a/tools/damon/damn b/tools/damon/damn
new file mode 100644
index 000000000000..0b8019db7f28
--- /dev/null
+++ b/tools/damon/damn
@@ -0,0 +1,36 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+import argparse
+
+import record
+import report
+
+class SubCmdHelpFormatter(argparse.RawDescriptionHelpFormatter):
+    def _format_action(self, action):
+        parts = super(argparse.RawDescriptionHelpFormatter,
+                self)._format_action(action)
+        # skip sub parsers help
+        if action.nargs == argparse.PARSER:
+            parts = '\n'.join(parts.split('\n')[1:])
+        return parts
+
+parser = argparse.ArgumentParser(formatter_class=SubCmdHelpFormatter)
+
+subparser = parser.add_subparsers(title='command', dest='command',
+        metavar='<command>')
+subparser.required = True
+
+parser_record = subparser.add_parser('record', help='record data accesses')
+record.set_argparser(parser_record)
+
+parser_report = subparser.add_parser('report',
+        help='report the recorded data accesses')
+report.set_argparser(parser_report)
+
+args = parser.parse_args()
+
+if args.command == 'record':
+    record.main(args)
+elif args.command == 'report':
+    report.main(args)
diff --git a/tools/damon/heats.py b/tools/damon/heats.py
new file mode 100644
index 000000000000..48e966c5ca02
--- /dev/null
+++ b/tools/damon/heats.py
@@ -0,0 +1,358 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Transform binary trace data into human readable text that can be used for
+heatmap drawing, or directly plot the data in a heatmap format.
+
+Format of the text is:
+
+    <time> <space> <heat>
+    ...
+
+"""
+
+import argparse
+import os
+import struct
+import subprocess
+import sys
+import tempfile
+
+class HeatSample:
+    space_idx = None
+    sz_time_space = None
+    heat = None
+
+    def __init__(self, space_idx, sz_time_space, heat):
+        if sz_time_space < 0:
+            raise RuntimeError()
+        self.space_idx = space_idx
+        self.sz_time_space = sz_time_space
+        self.heat = heat
+
+    def total_heat(self):
+        return self.heat * self.sz_time_space
+
+    def merge(self, sample):
+        "sample must have a space idx that same to self"
+        heat_sum = self.total_heat() + sample.total_heat()
+        self.heat = heat_sum / (self.sz_time_space + sample.sz_time_space)
+        self.sz_time_space += sample.sz_time_space
+
+def pr_samples(samples, time_idx, time_unit, region_unit):
+    display_time = time_idx * time_unit
+    for idx, sample in enumerate(samples):
+        display_addr = idx * region_unit
+        if not sample:
+            print("%s\t%s\t%s" % (display_time, display_addr, 0.0))
+            continue
+        print("%s\t%s\t%s" % (display_time, display_addr, sample.total_heat() /
+            time_unit / region_unit))
+
+def to_idx(value, min_, unit):
+    return (value - min_) // unit
+
+def read_task_heats(f, pid, aunit, amin, amax):
+    pid_ = struct.unpack('L', f.read(8))[0]
+    nr_regions = struct.unpack('I', f.read(4))[0]
+    if pid_ != pid:
+        f.read(20 * nr_regions)
+        return None
+    samples = []
+    for i in range(nr_regions):
+        saddr = struct.unpack('L', f.read(8))[0]
+        eaddr = struct.unpack('L', f.read(8))[0]
+        eaddr = min(eaddr, amax - 1)
+        heat = struct.unpack('I', f.read(4))[0]
+
+        if eaddr <= amin:
+            continue
+        if saddr >= amax:
+            continue
+        saddr = max(amin, saddr)
+        eaddr = min(amax, eaddr)
+
+        sidx = to_idx(saddr, amin, aunit)
+        eidx = to_idx(eaddr - 1, amin, aunit)
+        for idx in range(sidx, eidx + 1):
+            sa = max(amin + idx * aunit, saddr)
+            ea = min(amin + (idx + 1) * aunit, eaddr)
+            sample = HeatSample(idx, (ea - sa), heat)
+            samples.append(sample)
+    return samples
+
+def parse_time(bindat):
+    sec = struct.unpack('l', bindat[0:8])[0]
+    nsec = struct.unpack('l', bindat[8:16])[0]
+    return sec * 1000000000 + nsec
+
+def apply_samples(target_samples, samples, start_time, end_time, aunit, amin):
+    for s in samples:
+        sample = HeatSample(s.space_idx,
+                s.sz_time_space * (end_time - start_time), s.heat)
+        idx = sample.space_idx
+        if not target_samples[idx]:
+            target_samples[idx] = sample
+        else:
+            target_samples[idx].merge(sample)
+
+def __pr_heats(f, pid, tunit, tmin, tmax, aunit, amin, amax):
+    heat_samples = [None] * ((amax - amin) // aunit)
+
+    start_time = 0
+    end_time = 0
+    last_flushed = -1
+    while True:
+        start_time = end_time
+        timebin = f.read(16)
+        if (len(timebin)) != 16:
+            break
+        end_time = parse_time(timebin)
+        nr_tasks = struct.unpack('I', f.read(4))[0]
+        samples_set = {}
+        for t in range(nr_tasks):
+            samples = read_task_heats(f, pid, aunit, amin, amax)
+            if samples:
+                samples_set[pid] = samples
+        if not pid in samples_set:
+            continue
+        if start_time >= tmax:
+            continue
+        if end_time <= tmin:
+            continue
+        start_time = max(start_time, tmin)
+        end_time = min(end_time, tmax)
+
+        sidx = to_idx(start_time, tmin, tunit)
+        eidx = to_idx(end_time - 1, tmin, tunit)
+        for idx in range(sidx, eidx + 1):
+            if idx != last_flushed:
+                pr_samples(heat_samples, idx, tunit, aunit)
+                heat_samples = [None] * ((amax - amin) // aunit)
+                last_flushed = idx
+            st = max(start_time, tmin + idx * tunit)
+            et = min(end_time, tmin + (idx + 1) * tunit)
+            apply_samples(heat_samples, samples_set[pid], st, et, aunit, amin)
+
+def pr_heats(args):
+    binfile = args.input
+    pid = args.pid
+    tres = args.tres
+    tmin = args.tmin
+    ares = args.ares
+    amin = args.amin
+
+    tunit = (args.tmax - tmin) // tres
+    aunit = (args.amax - amin) // ares
+
+    # Compensate the values so that those fit with the resolution
+    tmax = tmin + tunit * tres
+    amax = amin + aunit * ares
+
+    with open(binfile, 'rb') as f:
+        __pr_heats(f, pid, tunit, tmin, tmax, aunit, amin, amax)
+
+class GuideInfo:
+    pid = None
+    start_time = None
+    end_time = None
+    lowest_addr = None
+    highest_addr = None
+    gaps = None
+
+    def __init__(self, pid, start_time):
+        self.pid = pid
+        self.start_time = start_time
+        self.gaps = []
+
+    def regions(self):
+        regions = []
+        region = [self.lowest_addr]
+        for gap in self.gaps:
+            for idx, point in enumerate(gap):
+                if idx == 0:
+                    region.append(point)
+                    regions.append(region)
+                else:
+                    region = [point]
+        region.append(self.highest_addr)
+        regions.append(region)
+        return regions
+
+    def total_space(self):
+        ret = 0
+        for r in self.regions():
+            ret += r[1] - r[0]
+        return ret
+
+    def __str__(self):
+        lines = ['pid:%d' % self.pid]
+        lines.append('time: %d-%d (%d)' % (self.start_time, self.end_time,
+                    self.end_time - self.start_time))
+        for idx, region in enumerate(self.regions()):
+            lines.append('region\t%2d: %020d-%020d (%d)' %
+                    (idx, region[0], region[1], region[1] - region[0]))
+        return '\n'.join(lines)
+
+def is_overlap(region1, region2):
+    if region1[1] < region2[0]:
+        return False
+    if region2[1] < region1[0]:
+        return False
+    return True
+
+def overlap_region_of(region1, region2):
+    return [max(region1[0], region2[0]), min(region1[1], region2[1])]
+
+def overlapping_regions(regions1, regions2):
+    overlap_regions = []
+    for r1 in regions1:
+        for r2 in regions2:
+            if is_overlap(r1, r2):
+                r1 = overlap_region_of(r1, r2)
+        if r1:
+            overlap_regions.append(r1)
+    return overlap_regions
+
+def get_guide_info(binfile):
+    "Read file, return the set of guide information objects of the data"
+    guides = {}
+    with open(binfile, 'rb') as f:
+        while True:
+            timebin = f.read(16)
+            if len(timebin) != 16:
+                break
+            monitor_time = parse_time(timebin)
+            nr_tasks = struct.unpack('I', f.read(4))[0]
+            for t in range(nr_tasks):
+                pid = struct.unpack('L', f.read(8))[0]
+                nr_regions = struct.unpack('I', f.read(4))[0]
+                if not pid in guides:
+                    guides[pid] = GuideInfo(pid, monitor_time)
+                guide = guides[pid]
+                guide.end_time = monitor_time
+
+                last_addr = None
+                gaps = []
+                for r in range(nr_regions):
+                    saddr = struct.unpack('L', f.read(8))[0]
+                    eaddr = struct.unpack('L', f.read(8))[0]
+                    f.read(4)
+
+                    if not guide.lowest_addr or saddr < guide.lowest_addr:
+                        guide.lowest_addr = saddr
+                    if not guide.highest_addr or eaddr > guide.highest_addr:
+                        guide.highest_addr = eaddr
+
+                    if not last_addr:
+                        last_addr = eaddr
+                        continue
+                    if last_addr != saddr:
+                        gaps.append([last_addr, saddr])
+                    last_addr = eaddr
+
+                if not guide.gaps:
+                    guide.gaps = gaps
+                else:
+                    guide.gaps = overlapping_regions(guide.gaps, gaps)
+    return sorted(list(guides.values()), key=lambda x: x.total_space(),
+                    reverse=True)
+
+def pr_guide(binfile):
+    for guide in get_guide_info(binfile):
+        print(guide)
+
+def region_sort_key(region):
+    return region[1] - region[0]
+
+def set_missed_args(args):
+    if args.pid and args.tmin and args.tmax and args.amin and args.amax:
+        return
+    guides = get_guide_info(args.input)
+    guide = guides[0]
+    if not args.pid:
+        args.pid = guide.pid
+    for g in guides:
+        if g.pid == args.pid:
+            guide = g
+            break
+
+    if not args.tmin:
+        args.tmin = guide.start_time
+    if not args.tmax:
+        args.tmax = guide.end_time
+
+    if not args.amin or not args.amax:
+        region = sorted(guide.regions(), key=lambda x: x[1] - x[0],
+                reverse=True)[0]
+        args.amin = region[0]
+        args.amax = region[1]
+
+def plot_heatmap(data_file, output_file):
+    terminal = output_file.split('.')[-1]
+    if not terminal in ['pdf', 'jpeg', 'png', 'svg']:
+        os.remove(data_file)
+        print("Unsupported plot output type.")
+        exit(-1)
+
+    gnuplot_cmd = """
+    set term %s;
+    set output '%s';
+    set key off;
+    set xrange [0:];
+    set yrange [0:];
+    set xlabel 'Time (ns)';
+    set ylabel 'Virtual Address (bytes)';
+    plot '%s' using 1:2:3 with image;""" % (terminal, output_file, data_file)
+    subprocess.call(['gnuplot', '-e', gnuplot_cmd])
+    os.remove(data_file)
+
+def set_argparser(parser):
+    parser.add_argument('--input', '-i', type=str, metavar='<file>',
+            default='damon.data', help='input file name')
+    parser.add_argument('--pid', metavar='<pid>', type=int,
+            help='pid of target task')
+    parser.add_argument('--tres', metavar='<resolution>', type=int,
+            default=500, help='time resolution of the output')
+    parser.add_argument('--tmin', metavar='<time>', type=lambda x: int(x,0),
+            help='minimal time of the output')
+    parser.add_argument('--tmax', metavar='<time>', type=lambda x: int(x,0),
+            help='maximum time of the output')
+    parser.add_argument('--ares', metavar='<resolution>', type=int, default=500,
+            help='space address resolution of the output')
+    parser.add_argument('--amin', metavar='<address>', type=lambda x: int(x,0),
+            help='minimal space address of the output')
+    parser.add_argument('--amax', metavar='<address>', type=lambda x: int(x,0),
+            help='maximum space address of the output')
+    parser.add_argument('--guide', action='store_true',
+            help='print a guidance for the min/max/resolution settings')
+    parser.add_argument('--heatmap', metavar='<file>', type=str,
+            help='heatmap image file to create')
+
+def main(args=None):
+    if not args:
+        parser = argparse.ArgumentParser()
+        set_argparser(parser)
+        args = parser.parse_args()
+
+    if args.guide:
+        pr_guide(args.input)
+    else:
+        set_missed_args(args)
+        orig_stdout = sys.stdout
+        if args.heatmap:
+            tmp_path = tempfile.mkstemp()[1]
+            tmp_file = open(tmp_path, 'w')
+            sys.stdout = tmp_file
+
+        pr_heats(args)
+
+        if args.heatmap:
+            sys.stdout = orig_stdout
+            tmp_file.flush()
+            tmp_file.close()
+            plot_heatmap(tmp_path, args.heatmap)
+
+if __name__ == '__main__':
+    main()
diff --git a/tools/damon/nr_regions.py b/tools/damon/nr_regions.py
new file mode 100644
index 000000000000..7ed4cdda4eb7
--- /dev/null
+++ b/tools/damon/nr_regions.py
@@ -0,0 +1,116 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"Print out distribution of the number of regions in the given record"
+
+import argparse
+import os
+import struct
+import subprocess
+import sys
+import tempfile
+
+def patterns(f):
+    wss = 0
+    nr_regions = struct.unpack('I', f.read(4))[0]
+
+    patterns = []
+    for r in range(nr_regions):
+        saddr = struct.unpack('L', f.read(8))[0]
+        eaddr = struct.unpack('L', f.read(8))[0]
+        nr_accesses = struct.unpack('I', f.read(4))[0]
+        patterns.append([eaddr - saddr, nr_accesses])
+    return patterns
+
+def plot_dist(data_file, output_file, xlabel):
+    terminal = output_file.split('.')[-1]
+    if not terminal in ['pdf', 'jpeg', 'png', 'svg']:
+        os.remove(data_file)
+        print("Unsupported plot output type.")
+        exit(-1)
+
+    gnuplot_cmd = """
+    set term %s;
+    set output '%s';
+    set key off;
+    set ylabel 'number of sampling regions';
+    set xlabel '%s';
+    plot '%s' with linespoints;""" % (terminal, output_file, xlabel, data_file)
+    subprocess.call(['gnuplot', '-e', gnuplot_cmd])
+    os.remove(data_file)
+
+def set_argparser(parser):
+    parser.add_argument('--input', '-i', type=str, metavar='<file>',
+            default='damon.data', help='input file name')
+    parser.add_argument('--range', '-r', type=int, nargs=3,
+            metavar=('<start>', '<stop>', '<step>'),
+            help='range of wss percentiles to print')
+    parser.add_argument('--sortby', '-s', choices=['time', 'size'],
+            help='the metric to be used for sorting the number of regions')
+    parser.add_argument('--plot', '-p', type=str, metavar='<file>',
+            help='plot the distribution to an image file')
+
+def main(args=None):
+    if not args:
+        parser = argparse.ArgumentParser()
+        set_argparser(parser)
+        args = parser.parse_args()
+
+    percentiles = [0, 25, 50, 75, 100]
+
+    file_path = args.input
+    if args.range:
+        percentiles = range(args.range[0], args.range[1], args.range[2])
+    wss_sort = True
+    if args.sortby == 'time':
+        wss_sort = False
+
+    pid_pattern_map = {}
+    with open(file_path, 'rb') as f:
+        start_time = None
+        while True:
+            timebin = f.read(16)
+            if len(timebin) != 16:
+                break
+            nr_tasks = struct.unpack('I', f.read(4))[0]
+            for t in range(nr_tasks):
+                pid = struct.unpack('L', f.read(8))[0]
+                if not pid_pattern_map:
+                    pid_pattern_map[pid] = []
+                pid_pattern_map[pid].append(patterns(f))
+
+    orig_stdout = sys.stdout
+    if args.plot:
+        tmp_path = tempfile.mkstemp()[1]
+        tmp_file = open(tmp_path, 'w')
+        sys.stdout = tmp_file
+
+    print('# <percentile> <# regions>')
+    for pid in pid_pattern_map.keys():
+        snapshots = pid_pattern_map[pid][20:]
+        nr_regions_dist = []
+        for snapshot in snapshots:
+            nr_regions_dist.append(len(snapshot))
+        if wss_sort:
+            nr_regions_dist.sort(reverse=False)
+
+        print('# pid\t%s' % pid)
+        print('# avr:\t%d' % (sum(nr_regions_dist) / len(nr_regions_dist)))
+        for percentile in percentiles:
+            thres_idx = int(percentile / 100.0 * len(nr_regions_dist))
+            if thres_idx == len(nr_regions_dist):
+                thres_idx -= 1
+            threshold = nr_regions_dist[thres_idx]
+            print('%d\t%d' % (percentile, nr_regions_dist[thres_idx]))
+
+    if args.plot:
+        sys.stdout = orig_stdout
+        tmp_file.flush()
+        tmp_file.close()
+        xlabel = 'runtime (percent)'
+        if wss_sort:
+            xlabel = 'percentile'
+        plot_dist(tmp_path, args.plot, xlabel)
+
+if __name__ == '__main__':
+    main()
diff --git a/tools/damon/record.py b/tools/damon/record.py
new file mode 100644
index 000000000000..93a85722f601
--- /dev/null
+++ b/tools/damon/record.py
@@ -0,0 +1,182 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Record data access patterns of the given processes.
+"""
+
+import argparse
+import copy
+import os
+import signal
+import subprocess
+import time
+
+DBGFS="/sys/kernel/debug/damon/"
+DBGFS_ATTRS = DBGFS + "attrs"
+DBGFS_PIDS = DBGFS + "pids"
+DBGFS_TRACING_ON = DBGFS + "monitor_on"
+
+orig_attrs = None
+
+def set_target_pid(pid):
+    return subprocess.call('echo %s > %s' % (pid, DBGFS_PIDS), shell=True,
+            executable='/bin/bash')
+
+def turn_damon(on_off):
+    return subprocess.call("echo %s > %s" % (on_off, DBGFS_TRACING_ON),
+            shell=True, executable="/bin/bash")
+
+def is_damon_running():
+    with open(DBGFS_TRACING_ON, 'r') as f:
+        return f.read().strip() == 'on'
+
+def do_trace(target, is_target_pid, attrs, old_attrs):
+    if os.path.isfile(attrs.rfile_path):
+        os.rename(attrs.rfile_path, attrs.rfile_path + '.old')
+
+    if attrs.apply():
+        print('attributes (%s) failed to be applied' % attrs)
+        cleanup_exit(old_attrs, -1)
+    print('# damon attrs: %s' % attrs)
+    if not is_target_pid:
+        p = subprocess.Popen(target, shell=True, executable='/bin/bash')
+        target = p.pid
+    if set_target_pid(target):
+        print('pid setting (%s) failed' % target)
+        cleanup_exit(old_attrs, -2)
+    if turn_damon('on'):
+        print('could not turn on damon' % target)
+        cleanup_exit(old_attrs, -3)
+    if not is_target_pid:
+        p.wait()
+    while True:
+        # damon will turn it off by itself if the target tasks are terminated.
+        if not is_damon_running():
+            break
+        time.sleep(1)
+
+    cleanup_exit(old_attrs, 0)
+
+class Attrs:
+    sample_interval = None
+    aggr_interval = None
+    regions_update_interval = None
+    min_nr_regions = None
+    max_nr_regions = None
+    rfile_path = None
+
+    def __init__(self, s, a, r, n, x, f):
+        self.sample_interval = s
+        self.aggr_interval = a
+        self.regions_update_interval = r
+        self.min_nr_regions = n
+        self.max_nr_regions = x
+        self.rfile_path = f
+
+    def __str__(self):
+        return "%s %s %s %s %s %s" % (self.sample_interval, self.aggr_interval,
+                self.regions_update_interval, self.min_nr_regions,
+                self.max_nr_regions, self.rfile_path)
+
+    def apply(self):
+        return subprocess.call('echo %s > %s' % (self, DBGFS_ATTRS),
+                shell=True, executable='/bin/bash')
+
+def current_attrs():
+    with open(DBGFS_ATTRS, 'r') as f:
+        attrs = f.read().split()
+    atnrs = [int(x) for x in attrs[0:5]]
+    attrs = atnrs + [attrs[5]]
+    return Attrs(*attrs)
+
+def cmd_args_to_attrs(args):
+    "Generate attributes based on current attributes and command arguments"
+    a = current_attrs()
+    if args.sample:
+        a.sample_interval = args.sample
+    if args.aggr:
+        a.aggr_interval = args.aggr
+    if args.updr:
+        a.regions_update_interval = args.updr
+    if args.minr:
+        a.min_nr_regions = args.minr
+    if args.maxr:
+        a.max_nr_regions = args.maxr
+    if args.out:
+        if not os.path.isabs(args.out):
+            args.out = os.path.join(os.getcwd(), args.out)
+        a.rfile_path = args.out
+    return a
+
+def cleanup_exit(orig_attrs, exit_code):
+    if is_damon_running():
+        if turn_damon('off'):
+            print('failed to turn damon off!')
+    if orig_attrs:
+        if orig_attrs.apply():
+            print('original attributes (%s) restoration failed!' % orig_attrs)
+    exit(exit_code)
+
+def sighandler(signum, frame):
+    print('\nsignal %s received' % signum)
+    cleanup_exit(orig_attrs, signum)
+
+def chk_prerequisites():
+    if os.geteuid() != 0:
+        print("Run as root")
+        exit(1)
+
+    if not os.path.isdir(DBGFS):
+        print("damon debugfs not exists.")
+        exit(1)
+
+    if not os.path.isfile(DBGFS_PIDS):
+        print("damon pids file (%s) not exists." % DBGFS_PIDS)
+        exit(1)
+
+def set_argparser(parser):
+    parser.add_argument('target', type=str, metavar='<target>',
+            help='the target command or the pid to record')
+    parser.add_argument('-s', '--sample', metavar='<interval>', type=int,
+            help='sampling interval')
+    parser.add_argument('-a', '--aggr', metavar='<interval>', type=int,
+            help='aggregate interval')
+    parser.add_argument('-u', '--updr', metavar='<interval>', type=int,
+            help='regions update interval')
+    parser.add_argument('-n', '--minr', metavar='<# regions>', type=int,
+            help='minimal number of regions')
+    parser.add_argument('-m', '--maxr', metavar='<# regions>', type=int,
+            help='maximum number of regions')
+    parser.add_argument('-o', '--out', metavar='<file path>', type=str,
+            default='damon.data', help='output file path')
+
+def main(args=None):
+    if not args:
+        parser = argparse.ArgumentParser()
+        set_argparser(parser)
+        args = parser.parse_args()
+
+    chk_prerequisites()
+
+    signal.signal(signal.SIGINT, sighandler)
+    signal.signal(signal.SIGTERM, sighandler)
+    orig_attrs = current_attrs()
+
+    new_attrs = cmd_args_to_attrs(args)
+    target = args.target
+
+    target_fields = target.split()
+    if not subprocess.call('which %s > /dev/null' % target_fields[0],
+            shell=True, executable='/bin/bash'):
+        do_trace(target, False, new_attrs, orig_attrs)
+    else:
+        try:
+            pid = int(target)
+        except:
+            print('target \'%s\' is neither a command, nor a pid' % target)
+            exit(1)
+        do_trace(target, True, new_attrs, orig_attrs)
+
+if __name__ == '__main__':
+    main()
diff --git a/tools/damon/report.py b/tools/damon/report.py
new file mode 100644
index 000000000000..c661c7b2f1af
--- /dev/null
+++ b/tools/damon/report.py
@@ -0,0 +1,45 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+import argparse
+
+import bin2txt
+import heats
+import nr_regions
+import wss
+
+def set_argparser(parser):
+    subparsers = parser.add_subparsers(title='report type', dest='report_type',
+            metavar='<report type>', help='the type of the report to generate')
+    subparsers.required = True
+
+    parser_raw = subparsers.add_parser('raw', help='human readable raw data')
+    bin2txt.set_argparser(parser_raw)
+
+    parser_heats = subparsers.add_parser('heats', help='heats of regions')
+    heats.set_argparser(parser_heats)
+
+    parser_wss = subparsers.add_parser('wss', help='working set size')
+    wss.set_argparser(parser_wss)
+
+    parser_nr_regions = subparsers.add_parser('nr_regions',
+            help='number of regions')
+    nr_regions.set_argparser(parser_nr_regions)
+
+def main(args=None):
+    if not args:
+        parser = argparse.ArgumentParser()
+        set_argparser(parser)
+        args = parser.parse_args()
+
+    if args.report_type == 'raw':
+        bin2txt.main(args)
+    elif args.report_type == 'heats':
+        heats.main(args)
+    elif args.report_type == 'wss':
+        wss.main(args)
+    elif args.report_type == 'nr_regions':
+        nr_regions.main(args)
+
+if __name__ == '__main__':
+    main()
diff --git a/tools/damon/wss.py b/tools/damon/wss.py
new file mode 100644
index 000000000000..a6a80ecfca05
--- /dev/null
+++ b/tools/damon/wss.py
@@ -0,0 +1,121 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"Print out the distribution of the working set sizes of the given trace"
+
+import argparse
+import os
+import struct
+import subprocess
+import sys
+import tempfile
+
+def patterns(f):
+    wss = 0
+    nr_regions = struct.unpack('I', f.read(4))[0]
+
+    patterns = []
+    for r in range(nr_regions):
+        saddr = struct.unpack('L', f.read(8))[0]
+        eaddr = struct.unpack('L', f.read(8))[0]
+        nr_accesses = struct.unpack('I', f.read(4))[0]
+        patterns.append([eaddr - saddr, nr_accesses])
+    return patterns
+
+def plot_dist(data_file, output_file, xlabel):
+    terminal = output_file.split('.')[-1]
+    if not terminal in ['pdf', 'jpeg', 'png', 'svg']:
+        os.remove(data_file)
+        print("Unsupported plot output type.")
+        exit(-1)
+
+    gnuplot_cmd = """
+    set term %s;
+    set output '%s';
+    set key off;
+    set ylabel 'working set size (bytes)';
+    set xlabel '%s';
+    plot '%s' with linespoints;""" % (terminal, output_file, xlabel, data_file)
+    subprocess.call(['gnuplot', '-e', gnuplot_cmd])
+    os.remove(data_file)
+
+def set_argparser(parser):
+    parser.add_argument('--input', '-i', type=str, metavar='<file>',
+            default='damon.data', help='input file name')
+    parser.add_argument('--range', '-r', type=int, nargs=3,
+            metavar=('<start>', '<stop>', '<step>'),
+            help='range of wss percentiles to print')
+    parser.add_argument('--sortby', '-s', choices=['time', 'size'],
+            help='the metric to be used for the sort of the working set sizes')
+    parser.add_argument('--plot', '-p', type=str, metavar='<file>',
+            help='plot the distribution to an image file')
+
+def main(args=None):
+    if not args:
+        parser = argparse.ArgumentParser()
+        set_argparser(parser)
+        args = parser.parse_args()
+
+    percentiles = [0, 25, 50, 75, 100]
+
+    file_path = args.input
+    if args.range:
+        percentiles = range(args.range[0], args.range[1], args.range[2])
+    wss_sort = True
+    if args.sortby == 'time':
+        wss_sort = False
+
+    pid_pattern_map = {}
+    with open(file_path, 'rb') as f:
+        start_time = None
+        while True:
+            timebin = f.read(16)
+            if len(timebin) != 16:
+                break
+            nr_tasks = struct.unpack('I', f.read(4))[0]
+            for t in range(nr_tasks):
+                pid = struct.unpack('L', f.read(8))[0]
+                if not pid_pattern_map:
+                    pid_pattern_map[pid] = []
+                pid_pattern_map[pid].append(patterns(f))
+
+    orig_stdout = sys.stdout
+    if args.plot:
+        tmp_path = tempfile.mkstemp()[1]
+        tmp_file = open(tmp_path, 'w')
+        sys.stdout = tmp_file
+
+    print('# <percentile> <wss>')
+    for pid in pid_pattern_map.keys():
+        snapshots = pid_pattern_map[pid][20:]
+        wss_dist = []
+        for snapshot in snapshots:
+            wss = 0
+            for p in snapshot:
+                if p[1] <= 0:
+                    continue
+                wss += p[0]
+            wss_dist.append(wss)
+        if wss_sort:
+            wss_dist.sort(reverse=False)
+
+        print('# pid\t%s' % pid)
+        print('# avr:\t%d' % (sum(wss_dist) / len(wss_dist)))
+        for percentile in percentiles:
+            thres_idx = int(percentile / 100.0 * len(wss_dist))
+            if thres_idx == len(wss_dist):
+                thres_idx -= 1
+            threshold = wss_dist[thres_idx]
+            print('%d\t%d' % (percentile, wss_dist[thres_idx]))
+
+    if args.plot:
+        sys.stdout = orig_stdout
+        tmp_file.flush()
+        tmp_file.close()
+        xlabel = 'runtime (percent)'
+        if wss_sort:
+            xlabel = 'percentile'
+        plot_dist(tmp_path, args.plot, xlabel)
+
+if __name__ == '__main__':
+    main()
-- 
2.17.1

