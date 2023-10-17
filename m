Return-Path: <linux-doc+bounces-395-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC47CBA13
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 07:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDB2A2817BC
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 05:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091BDC123;
	Tue, 17 Oct 2023 05:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nbm82nea"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8365CC122
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 05:25:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8171D1B5;
	Mon, 16 Oct 2023 22:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697520323; x=1729056323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ui1Hqm41JSxotFlyE4G0v69tZLA9xc0/FYrcSUnN77Y=;
  b=Nbm82neaf8pjai/Dy54azXizfXgtaURLoYmzxufKk6uy9d3WxcIzQOTT
   L+hlwlb7fnxLpcxqUavMUwmTi5g8z/HHGIaQro14o2U6/XEaPAkwR/f4L
   DNmlby21/WU0ohkl7jd4LMBEs8zIMAet8ohI+wkFYaCfSyO8+I51EZ8YF
   3rIULRvrdQhEBSJEvdoixFkrefb8CRXkWWFTMtdyi3ZkzT/wOXVI24ITi
   rEVJnZ7BmQgxHVKI52SpQ+2j67FgTb6aeFut32VlE74vIp6W0csMesqXF
   PGxaM3ONt3Yh8jPjxu1vfEJk/hn312MjYemNmq7CyZ6gaYe/5FUdQAH9H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="388561779"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="388561779"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 22:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087358019"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="1087358019"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2023 22:25:18 -0700
From: lakshmi.sowjanya.d@intel.com
To: tglx@linutronix.de,
	jstultz@google.com,
	giometti@enneenne.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	pandith.n@intel.com,
	mallikarjunappa.sangannavar@intel.com,
	thejesh.reddy.t.r@intel.com,
	lakshmi.sowjanya.d@intel.com
Subject: [PATCH v1 5/6] Documentation: driver-api: pps: Add Intel Timed I/O PPS generator
Date: Tue, 17 Oct 2023 10:54:56 +0530
Message-Id: <20231017052457.25287-6-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231017052457.25287-1-lakshmi.sowjanya.d@intel.com>
References: <20231017052457.25287-1-lakshmi.sowjanya.d@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

Add Intel Timed I/O PPS usage instructions.

Co-developed-by: Pandith N <pandith.n@intel.com>
Signed-off-by: Pandith N <pandith.n@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/driver-api/pps.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/driver-api/pps.rst b/Documentation/driver-api/pps.rst
index 2d6b99766ee8..35bba2bf98a8 100644
--- a/Documentation/driver-api/pps.rst
+++ b/Documentation/driver-api/pps.rst
@@ -240,3 +240,25 @@ delay between assert and clear edge as small as possible to reduce system
 latencies. But if it is too small slave won't be able to capture clear edge
 transition. The default of 30us should be good enough in most situations.
 The delay can be selected using 'delay' pps_gen_parport module parameter.
+
+
+Intel Timed I/O PPS signal generator
+------------------------------------
+
+Intel Timed I/O is a high precision device, present on 2019 and newer Intel
+CPUs, that can generate PPS signal.
+
+Timed I/O and system time are both driven by same hardware clock, The signal
+generated with a precision of ~20 nanoseconds. The generated PPS signal
+is used to synchronize an external device with system clock. For example,
+Share your clock with a device that receives PPS signal, generated by
+Timed I/O device. There are dedicated Timed I/O pins to deliver PPS signal
+to an external device.
+
+Usage of Intel Timed I/O as PPS generator:
+
+Start generating PPS signal::
+        $echo 1 > /sys/devices/platform/INTCxxxx\:00/enable
+
+Stop generating PPS signal::
+        $echo 0 > /sys/devices/platform/INTCxxxx\:00/enable
-- 
2.17.1


