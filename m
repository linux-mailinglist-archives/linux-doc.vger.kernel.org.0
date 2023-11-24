Return-Path: <linux-doc+bounces-3009-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E247F717E
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 11:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616FB1C20ECF
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 10:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965801EB50;
	Fri, 24 Nov 2023 10:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5CD33110;
	Fri, 24 Nov 2023 02:31:45 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BED913D5;
	Fri, 24 Nov 2023 02:32:31 -0800 (PST)
Received: from e127643.arm.com (unknown [10.57.5.4])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 47B063F7A6;
	Fri, 24 Nov 2023 02:31:43 -0800 (PST)
From: James Clark <james.clark@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	suzuki.poulose@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	anshuman.khandual@arm.com,
	namhyung@gmail.com
Cc: James Clark <james.clark@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] arm64: perf: Add support for event counting threshold
Date: Fri, 24 Nov 2023 10:28:54 +0000
Message-Id: <20231124102857.1106453-1-james.clark@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v5:
  * Restructure the docs and add some more explanations
  * PMMIR.WIDTH -> PMMIR.THWIDTH in one comment
  * Don't write EVTYPER.TC if TH is 0. Doesn't have any functional
    effect but it might be a bit easier to understand the code.
  * Expand the format field #define names

Changes since v4:

  * Rebase onto v6.7-rc1, it no longer depends on kvmarm/next
  * Remove change that moved ARMV8_PMU_EVTYPE_MASK to the asm files.
    This actually depended on those files being included in a certain
    order with arm_pmuv3.h to avoid circular includes. Now the
    definition is done programmatically in arm_pmuv3.c instead.

Changes since v3:

  * Drop #include changes to KVM source files because since
    commit bc512d6a9b92 ("KVM: arm64: Make PMEVTYPER<n>_EL0.NSH RES0 if
    EL2 isn't advertised"), KVM doesn't use ARMV8_PMU_EVTYPE_MASK
    anymore

Changes since v2:

  * Split threshold_control attribute into two, threshold_compare and
    threshold_count so that it's easier to use
  * Add some notes to the first commit message and the cover letter
    about the behavior in KVM
  * Update the docs commit with regards to the split attribute
 
Changes since v1:

  * Fix build on aarch32 by disabling FEAT_PMUv3_TH and splitting event
    type mask between the platforms
  * Change armv8pmu_write_evtype() to take unsigned long instead of u64
    so it isn't unnecessarily wide on aarch32
  * Add UL suffix to aarch64 event type mask definition

----

FEAT_PMUv3_TH (Armv8.8) is a new feature that allows conditional
counting of PMU events depending on how much the event increments on
a single cycle. Two new config fields for perf_event_open have been
added, and a PMU cap file for reading the max_threshold. See the second
commit message and the docs in the last commit for more details.

The feature is not currently supported on KVM guests, and PMMIR is set
to read as zero, so it's not advertised as available. But it can be
added at a later time. Writes to PMEVTYPER.TC and TH from guests are
already RES0.

The change has been validated on the Arm FVP model:

  # Zero values, works as expected (as before).
  $ perf stat -e dtlb_walk/threshold=0,threshold_compare=0/ -- true

    5962      dtlb_walk/threshold=0,threshold_compare=0/

  # Threshold >= 255 causes count to be 0 because dtlb_walk doesn't
  # increase by more than 1 per cycle.
  $ perf stat -e dtlb_walk/threshold=255,threshold_compare=2/ -- true

    0      dtlb_walk/threshold=255,threshold_compare=2/
  
  # Keeping comparison as >= but lowering the threshold to 1 makes the
  # count return.
  $ perf stat -e dtlb_walk/threshold=1,threshold_compare=2/ -- true

    6329      dtlb_walk/threshold=1,threshold_compare=2/

James Clark (3):
  arm64: perf: Include threshold control fields in PMEVTYPER mask
  arm64: perf: Add support for event counting threshold
  Documentation: arm64: Document the PMU event counting threshold
    feature

 Documentation/arch/arm64/perf.rst | 72 ++++++++++++++++++++++++
 drivers/perf/arm_pmuv3.c          | 93 ++++++++++++++++++++++++++++++-
 include/linux/perf/arm_pmuv3.h    |  4 +-
 3 files changed, 166 insertions(+), 3 deletions(-)

-- 
2.34.1


