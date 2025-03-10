Return-Path: <linux-doc+bounces-40338-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F340FA591E1
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 11:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 544523A9DEB
	for <lists+linux-doc@lfdr.de>; Mon, 10 Mar 2025 10:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38AF22D4C5;
	Mon, 10 Mar 2025 10:49:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238D322A7E8;
	Mon, 10 Mar 2025 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603770; cv=none; b=GwUXjAkQFl4pdmzIpnHy6VxolZdQQPilxo3ecBRrpL/agiq2mZtRCvT24VbXie2TXIa9fXCJm/cDAV8PhLrl4fZy64wp+ezSsTC6JaPXsMKxyXeGX3tzw6W+h//JdSfV/BPeWSvzj2MXgR1IRgR6qw69IurkmLRKElB0YAY2Vic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603770; c=relaxed/simple;
	bh=8RNrwxq7B/Gffb0eLWfm7B+w0ts6YwfKDKJLUNLDplg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QnBDeWbXXfYCXFucaY9+4l4f/dAvGW+eZdMZU4T8+/6t9Vr71EZYuUkyXzu5x1ehZ/Sjh8+elsnURE1TfadN8h3SnCMDLqcrgLXRmtL3CC+dwQuW9eyy6CmmxJushoD+tHpD/YeIZkYle0F2kHRw9ghgv02ACMo1MUccnas/Li0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091DB153B;
	Mon, 10 Mar 2025 03:49:40 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BEF8A3F673;
	Mon, 10 Mar 2025 03:49:26 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 0/8] Arm CoreSight: Support AUX pause and resume
Date: Mon, 10 Mar 2025 10:49:11 +0000
Message-Id: <20250310104919.58816-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is to enable AUX pause and resume on Arm CoreSight.

The first patch extracts the trace unit controlling operations to two
functions.  These two functions will be used by AUX pause and resume.

Patches 02 and 03 change the ETMv4 driver to prepare callback functions
for AUX pause and resume.

Patch 04 changes the ETM perf layer to support AUX pause and resume in a
perf session.  The patches 05 and 06 offers an extra feature for
updating buffer on AUX pause occasion, which can mitigate the trace data
lose issue.

Patch 07 documents the AUX pause usages with Arm CoreSight.  The last
patch syncs headers between user space and the kernel.

This patch set has been verified on the Hikey960 board and TC platform.
The previous one uses ETR and the later uses TRBE as sink.

It is suggested to disable CPUIdle (add `nohlt` option in Linux command
line) when verifying this series.  ETM and funnel drivers are found
issues during CPU suspend and resume which will be addressed separately.

Changes from v1:
- Added validation function pointers in pause and resume APIs (Mike).


Leo Yan (8):
  coresight: etm4x: Extract the trace unit controlling
  coresight: Introduce pause and resume APIs for source
  coresight: etm4x: Hook pause and resume callbacks
  coresight: perf: Support AUX trace pause and resume
  coresight: etm: Add an attribute for updating buffer
  coresight: perf: Update buffer on AUX pause
  Documentation: coresight: Document AUX pause and resume
  perf cs-etm: Sync kernel coresight-pmu.h header

 .../trace/coresight/coresight-perf.rst        |  50 ++++++
 drivers/hwtracing/coresight/coresight-core.c  |  20 +++
 .../hwtracing/coresight/coresight-etm-perf.c  |  94 +++++++++-
 .../hwtracing/coresight/coresight-etm-perf.h  |   2 +
 .../coresight/coresight-etm4x-core.c          | 166 ++++++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +
 drivers/hwtracing/coresight/coresight-priv.h  |   2 +
 include/linux/coresight-pmu.h                 |   1 +
 include/linux/coresight.h                     |   4 +
 tools/include/linux/coresight-pmu.h           |   1 +
 10 files changed, 289 insertions(+), 53 deletions(-)

-- 
2.34.1


