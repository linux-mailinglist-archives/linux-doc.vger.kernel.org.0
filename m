Return-Path: <linux-doc+bounces-34826-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B9AA09B64
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 20:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A54F3A79BE
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jan 2025 19:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241CE24B25C;
	Fri, 10 Jan 2025 18:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/7tOLDx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E835E24B256;
	Fri, 10 Jan 2025 18:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535163; cv=none; b=TWomyx6TqEFnN8P0nMwJNkqxeWHhvvqRSv520iNBTLS32QYpJXD8Sk22wAPH63k2Jo6ACo5h42e2DW3Vvh0z4MwwBWRcffat0qMJ0lVrKYB7Uj54OhKe91NP9nAa6GndB4AU6EwOY12CfT3i9f9J7WL0PuJKXdvYMpEro9X4jXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535163; c=relaxed/simple;
	bh=5Klw8hhvSx8PwTI5/pAo/3RzEAQ8x9KUOdqUhdvSuAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/IIiEhl50d4g+6m/qtvLfLQkpShUtGxgRyFqg424jlsWiiCmHDNHG0XIHPUI49VMg83xmaKrPoXErNrQ3yAcp3pFNoalqOct0LAUs19mTBfCbkHq7SV138/Ca1qFmj2Y8M9vJF+OkvEc77MS0e6h5qafAzemm385uEPtsGDx2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/7tOLDx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC5DC4CED6;
	Fri, 10 Jan 2025 18:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736535162;
	bh=5Klw8hhvSx8PwTI5/pAo/3RzEAQ8x9KUOdqUhdvSuAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/7tOLDxElbvtd88mHf2oqtpr6svMq043nME7utrlnA4j1Ty+czFMhdc3WHsgcoKK
	 SM5CyK6FehUEStF2WgXnmS1rG2T4M93lUwNFcJV6TWD8SayQ2EEvvOrvXBiPcKUP4J
	 SjH9h5wnZoVMNtk7qX6NscgHVmpr49MAYf3bLTkEBEskSmaGudQ9Q+ge6ZbvV1MDOK
	 Y6E6pMJ2ofopymHf0b9nBmCiBAAPHYb7koCCxIUBmMUfoXLAp/tj4AssOZZsZcmRzd
	 fydwnCWh5buqFh0nLiKxK2i9/GVNYwOy2ntM9G9GFURRwlahna8vSd4+R2DWlDD4qz
	 AElWBPz8oeYfg==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/5] Docs/mm/damon: add an example monitoring intervals tuning
Date: Fri, 10 Jan 2025 10:52:29 -0800
Message-Id: <20250110185232.54907-3-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110185232.54907-1-sj@kernel.org>
References: <20250110185232.54907-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DAMON monitoring intervals tuning example that contains output
from a demonstration of the guide on a real server workload system.  The
example with real world numbers will help users better understanding the
guide instructions and what outputs they can expect and verify.  Those
will again help finding the rooms for improvements on the guide.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst             |   9 +
 .../monitoring_intervals_tuning_example.rst   | 247 ++++++++++++++++++
 2 files changed, 256 insertions(+)
 create mode 100644 Documentation/mm/damon/monitoring_intervals_tuning_example.rst

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index dd7e0f63a69a..e28c6a1b40ae 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -266,6 +266,8 @@ tracepoints.  For more details, please refer to the documentations for
 respectively.
 
 
+.. _damon_design_monitoring_params_tuning_guide:
+
 Monitoring Parameters Tuning Guide
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -311,6 +313,13 @@ sufficient for the given purpose, it shouldn't be unnecessarily further
 lowered.  It is recommended to be set proportional to ``aggregation interval``.
 By default, the ratio is set as ``1/20``, and it is still recommended.
 
+Refer to below documents for an example tuning based on the above guide.
+
+.. toctree::
+   :maxdepth: 1
+
+   monitoring_intervals_tuning_example
+
 
 .. _damon_design_damos:
 
diff --git a/Documentation/mm/damon/monitoring_intervals_tuning_example.rst b/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
new file mode 100644
index 000000000000..334a854efb40
--- /dev/null
+++ b/Documentation/mm/damon/monitoring_intervals_tuning_example.rst
@@ -0,0 +1,247 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================================
+DAMON Moniting Interval Parameters Tuning Example
+=================================================
+
+DAMON's monitoring parameters need tuning based on given workload and the
+monitoring purpose.  There is a :ref:`tuning guide
+<damon_design_monitoring_params_tuning_guide>` for that.  This document
+provides an example tuning based on the guide.
+
+Setup
+=====
+
+For below example, DAMON of Linux kernel v6.11 and `damo
+<https://github.com/damonitor/damo>`_ (DAMON user-space tool) v2.5.9 was used to
+monitor and visualize access patterns on the physical address space of a system
+running a real-world server workload.
+
+5ms/100ms intervals: Too Short Interval
+=======================================
+
+Let's start by capturing the access pattern snapshot on the physical address
+space of the system using DAMON, with the default interval parameters (5
+milliseconds and 100 milliseconds for the sampling and the aggregation
+intervals, respectively).  Wait ten minutes between the start of DAMON and
+the capturing of the snapshot, to show a meaningful time-wise access patterns.
+::
+
+    # damo start
+    # sleep 600
+    # damo record --snapshot 0 1
+    # damo stop
+
+Then, list the DAMON-found regions of different access patterns, sorted by the
+"access temperature".  "Access temperature" is a metric representing the
+access-hotness of a region.  It is calculated as a weighted sum of the access
+frequency and the age of the region.  If the access frequency is 0 %, the
+temperature is multipled by minus one.  That is, if a region is not accessed,
+it gets minus temperature and it gets lower as not accessed for longer time.
+The sorting is in temperature-ascendint order, so the region at the top of the
+list is the coldest, and the one at the bottom is the hottest one. ::
+
+    # damo report access --sort_regions_by temperature
+    0   addr 16.052 GiB   size 5.985 GiB   access 0 %   age 5.900 s    # coldest
+    1   addr 22.037 GiB   size 6.029 GiB   access 0 %   age 5.300 s
+    2   addr 28.065 GiB   size 6.045 GiB   access 0 %   age 5.200 s
+    3   addr 10.069 GiB   size 5.983 GiB   access 0 %   age 4.500 s
+    4   addr 4.000 GiB    size 6.069 GiB   access 0 %   age 4.400 s
+    5   addr 62.008 GiB   size 3.992 GiB   access 0 %   age 3.700 s
+    6   addr 56.795 GiB   size 5.213 GiB   access 0 %   age 3.300 s
+    7   addr 39.393 GiB   size 6.096 GiB   access 0 %   age 2.800 s
+    8   addr 50.782 GiB   size 6.012 GiB   access 0 %   age 2.800 s
+    9   addr 34.111 GiB   size 5.282 GiB   access 0 %   age 2.300 s
+    10  addr 45.489 GiB   size 5.293 GiB   access 0 %   age 1.800 s    # hottest
+    total size: 62.000 GiB
+
+The list shows not seemingly hot regions, and only minimum access pattern
+diversity.  Every region has zero access frequency.  The number of region is
+10, which is the default ``min_nr_regions value``.  Size of each region is also
+nearly idential.  We can suspect this is because “adaptive regions adjustment”
+mechanism was not well working.  As the guide suggested, we can get relative
+hotness of regions using ``age`` as the recency information.  That would be
+better than nothing, but given the fact that the longest age is only about 6
+seconds while we waited about ten minuts, it is unclear how useful this will
+be.
+
+The temperature ranges to total size of regions of each range histogram
+visualization of the results also shows no interesting distribution pattern. ::
+
+    # damo report access --style temperature-sz-hist
+    <temperature> <total size>
+    [-,590,000,000, -,549,000,000) 5.985 GiB  |**********          |
+    [-,549,000,000, -,508,000,000) 12.074 GiB |********************|
+    [-,508,000,000, -,467,000,000) 0 B        |                    |
+    [-,467,000,000, -,426,000,000) 12.052 GiB |********************|
+    [-,426,000,000, -,385,000,000) 0 B        |                    |
+    [-,385,000,000, -,344,000,000) 3.992 GiB  |*******             |
+    [-,344,000,000, -,303,000,000) 5.213 GiB  |*********           |
+    [-,303,000,000, -,262,000,000) 12.109 GiB |********************|
+    [-,262,000,000, -,221,000,000) 5.282 GiB  |*********           |
+    [-,221,000,000, -,180,000,000) 0 B        |                    |
+    [-,180,000,000, -,139,000,000) 5.293 GiB  |*********           |
+    total size: 62.000 GiB
+
+In short, the parameters provide poor quality monitoring results for hot
+regions detection. According to the :ref:`guide
+<damon_design_monitoring_params_tuning_guide>`, this is due to the too short
+aggregation interval.
+
+100ms/2s intervals: Starts Showing Small Hot Regions
+====================================================
+
+Following the guide, increase the interval 20 times (100 milliseocnds and 2
+seconds for sampling and aggregation intervals, respectively). ::
+
+    # damo start -s 100ms -a 2s
+    # sleep 600
+    # damo record --snapshot 0 1
+    # damo stop
+    # damo report access --sort_regions_by temperature
+    0   addr 10.180 GiB   size 6.117 GiB   access 0 %   age 7 m 8 s    # coldest
+    1   addr 49.275 GiB   size 6.195 GiB   access 0 %   age 6 m 14 s
+    2   addr 62.421 GiB   size 3.579 GiB   access 0 %   age 6 m 4 s
+    3   addr 40.154 GiB   size 6.127 GiB   access 0 %   age 5 m 40 s
+    4   addr 16.296 GiB   size 6.182 GiB   access 0 %   age 5 m 32 s
+    5   addr 34.254 GiB   size 5.899 GiB   access 0 %   age 5 m 24 s
+    6   addr 46.281 GiB   size 2.995 GiB   access 0 %   age 5 m 20 s
+    7   addr 28.420 GiB   size 5.835 GiB   access 0 %   age 5 m 6 s
+    8   addr 4.000 GiB    size 6.180 GiB   access 0 %   age 4 m 16 s
+    9   addr 22.478 GiB   size 5.942 GiB   access 0 %   age 3 m 58 s
+    10  addr 55.470 GiB   size 915.645 MiB access 0 %   age 3 m 6 s
+    11  addr 56.364 GiB   size 6.056 GiB   access 0 %   age 2 m 8 s
+    12  addr 56.364 GiB   size 4.000 KiB   access 95 %  age 16 s
+    13  addr 49.275 GiB   size 4.000 KiB   access 100 % age 8 m 24 s   # hottest
+    total size: 62.000 GiB
+    # damo report access --style temperature-sz-hist
+    <temperature> <total size>
+    [-42,800,000,000, -33,479,999,000) 22.018 GiB |*****************   |
+    [-33,479,999,000, -24,159,998,000) 27.090 GiB |********************|
+    [-24,159,998,000, -14,839,997,000) 6.836 GiB  |******              |
+    [-14,839,997,000, -5,519,996,000)  6.056 GiB  |*****               |
+    [-5,519,996,000, 3,800,005,000)    4.000 KiB  |*                   |
+    [3,800,005,000, 13,120,006,000)    0 B        |                    |
+    [13,120,006,000, 22,440,007,000)   0 B        |                    |
+    [22,440,007,000, 31,760,008,000)   0 B        |                    |
+    [31,760,008,000, 41,080,009,000)   0 B        |                    |
+    [41,080,009,000, 50,400,010,000)   0 B        |                    |
+    [50,400,010,000, 59,720,011,000)   4.000 KiB  |*                   |
+    total size: 62.000 GiB
+
+DAMON found two distinct 4 KiB regions that pretty hot.  The regions are also
+well aged.  The hottest 4 KiB region was keeping the access frequency for about
+8 minutes, and the coldest region was keeping no access for about 7 minutes.
+The distribution on the histogram also looks like having a pattern.
+
+Especially, the finding of the 4 KiB regions among the 62 GiB total memory
+shows DAMON’s adaptive regions adjustment is working as designed.
+
+Still the number of regions is close to the ``min_nr_regions``, and sizes of
+cold regions are similar, though.  Apparently it is improved, but it still has
+rooms to improve.
+
+400ms/8s intervals: Pretty Improved Results
+===========================================
+
+Increase the intervals four times (400 milliseconds and 8 seconds
+for sampling and aggregation intervals, respectively). ::
+
+    # damo start -s 400ms -a 8s
+    # sleep 600
+    # damo record --snapshot 0 1
+    # damo stop
+    # damo report access --sort_regions_by temperature
+    0   addr 64.492 GiB   size 1.508 GiB   access 0 %   age 6 m 48 s    # coldest
+    1   addr 21.749 GiB   size 5.674 GiB   access 0 %   age 6 m 8 s
+    2   addr 27.422 GiB   size 5.801 GiB   access 0 %   age 6 m
+    3   addr 49.431 GiB   size 8.675 GiB   access 0 %   age 5 m 28 s
+    4   addr 33.223 GiB   size 5.645 GiB   access 0 %   age 5 m 12 s
+    5   addr 58.321 GiB   size 6.170 GiB   access 0 %   age 5 m 4 s
+    [...]
+    25  addr 6.615 GiB    size 297.531 MiB access 15 %  age 0 ns
+    26  addr 9.513 GiB    size 12.000 KiB  access 20 %  age 0 ns
+    27  addr 9.511 GiB    size 108.000 KiB access 25 %  age 0 ns
+    28  addr 9.513 GiB    size 20.000 KiB  access 25 %  age 0 ns
+    29  addr 9.511 GiB    size 12.000 KiB  access 30 %  age 0 ns
+    30  addr 9.520 GiB    size 4.000 KiB   access 40 %  age 0 ns
+    [...]
+    41  addr 9.520 GiB    size 4.000 KiB   access 80 %  age 56 s
+    42  addr 9.511 GiB    size 12.000 KiB  access 100 % age 6 m 16 s
+    43  addr 58.321 GiB   size 4.000 KiB   access 100 % age 6 m 24 s
+    44  addr 9.512 GiB    size 4.000 KiB   access 100 % age 6 m 48 s
+    45  addr 58.106 GiB   size 4.000 KiB   access 100 % age 6 m 48 s    # hottest
+    total size: 62.000 GiB
+    # damo report access --style temperature-sz-hist
+    <temperature> <total size>
+    [-40,800,000,000, -32,639,999,000) 21.657 GiB  |********************|
+    [-32,639,999,000, -24,479,998,000) 17.938 GiB  |*****************   |
+    [-24,479,998,000, -16,319,997,000) 16.885 GiB  |****************    |
+    [-16,319,997,000, -8,159,996,000)  586.879 MiB |*                   |
+    [-8,159,996,000, 5,000)            4.946 GiB   |*****               |
+    [5,000, 8,160,006,000)             260.000 KiB |*                   |
+    [8,160,006,000, 16,320,007,000)    0 B         |                    |
+    [16,320,007,000, 24,480,008,000)   0 B         |                    |
+    [24,480,008,000, 32,640,009,000)   0 B         |                    |
+    [32,640,009,000, 40,800,010,000)   16.000 KiB  |*                   |
+    [40,800,010,000, 48,960,011,000)   8.000 KiB   |*                   |
+    total size: 62.000 GiB
+
+The number of regions having different access patterns has significantly
+increased.  Size of each region is also more varied. Total size of non-zero
+access frequency regions is also significantly increased. Maybe this is already
+good enough to make some meaningful memory management efficieny changes.
+
+800ms/16s intervals: Another bias
+=================================
+
+Further double the intervals (800 milliseconds and 16 seconds for sampling
+and aggregation intervals, respectively).  The results is more improved for the
+hot regions detection, but starts looking degrading cold regions detection. ::
+
+    # damo start -s 800ms -a 16s
+    # sleep 600
+    # damo record --snapshot 0 1
+    # damo stop
+    # damo report access --sort_regions_by temperature
+    0   addr 64.781 GiB   size 1.219 GiB   access 0 %   age 4 m 48 s
+    1   addr 24.505 GiB   size 2.475 GiB   access 0 %   age 4 m 16 s
+    2   addr 26.980 GiB   size 504.273 MiB access 0 %   age 4 m
+    3   addr 29.443 GiB   size 2.462 GiB   access 0 %   age 4 m
+    4   addr 37.264 GiB   size 5.645 GiB   access 0 %   age 4 m
+    5   addr 31.905 GiB   size 5.359 GiB   access 0 %   age 3 m 44 s
+    [...]
+    20  addr 8.711 GiB    size 40.000 KiB  access 5 %   age 2 m 40 s
+    21  addr 27.473 GiB   size 1.970 GiB   access 5 %   age 4 m
+    22  addr 48.185 GiB   size 4.625 GiB   access 5 %   age 4 m
+    23  addr 47.304 GiB   size 902.117 MiB access 10 %  age 4 m
+    24  addr 8.711 GiB    size 4.000 KiB   access 100 % age 4 m
+    25  addr 20.793 GiB   size 3.713 GiB   access 5 %   age 4 m 16 s
+    26  addr 8.773 GiB    size 4.000 KiB   access 100 % age 4 m 16 s
+    total size: 62.000 GiB
+    # damo report access --style temperature-sz-hist
+    <temperature> <total size>
+    [-28,800,000,000, -23,359,999,000) 12.294 GiB  |*****************   |
+    [-23,359,999,000, -17,919,998,000) 9.753 GiB   |*************       |
+    [-17,919,998,000, -12,479,997,000) 15.131 GiB  |********************|
+    [-12,479,997,000, -7,039,996,000)  0 B         |                    |
+    [-7,039,996,000, -1,599,995,000)   7.506 GiB   |**********          |
+    [-1,599,995,000, 3,840,006,000)    6.127 GiB   |*********           |
+    [3,840,006,000, 9,280,007,000)     0 B         |                    |
+    [9,280,007,000, 14,720,008,000)    136.000 KiB |*                   |
+    [14,720,008,000, 20,160,009,000)   40.000 KiB  |*                   |
+    [20,160,009,000, 25,600,010,000)   11.188 GiB  |***************     |
+    [25,600,010,000, 31,040,011,000)   4.000 KiB   |*                   |
+    total size: 62.000 GiB
+
+It found more non-zero access frequency regions. The number of regions is still
+much higher than the ``min_nr_regions``, but it is reduced from that of the
+previous setup. And apparently the distribution seems bit biased to hot
+regions.
+
+Conclusion
+==========
+
+With the above experimental tuning results, we can conclude the theory and the
+guide makes sense to at least this workload, and could be applied to similar
+cases.
-- 
2.39.5

