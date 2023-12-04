Return-Path: <linux-doc+bounces-3979-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507FA803D89
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 19:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F14EA281141
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 18:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0762F85F;
	Mon,  4 Dec 2023 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lz5PtVN4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F508CA;
	Mon,  4 Dec 2023 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701716048; x=1733252048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MmH/laKEGnp2y/uGerX+E7RxvQ9TncUwvCwOiPDkDoQ=;
  b=lz5PtVN45Y+UhtpsRG2R7/MQd5yaFcdXf6htpKe3pv3nINjzsLauQvzz
   W8owWJbiFf3Ms4jxylMgQ5L/oV1Qlfma58KI46fH1cUsEilwqiE2WSHVa
   r1qE1lm8Hq0rWWzQYxe9p64tTFjEa4js9HhSzih6kGdd5DxNxEZLSw+j8
   sQ3jH435eq9YPb4VjZB4gG8gYVaUCi/TzAnvxBsOA0TFQ/DmD3y05MfPC
   HeEBnADT3Cejqa5Tk1gzldB/ybp/yFK/qur3ZTdt7u1+id0OkzuYK0+6/
   X9TsjWrx8uPB0havJGouqDTUA93rYxeDO0wBuos9bDQGexAWpQxAw8k0n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="838442"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="838442"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 10:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836687184"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="836687184"
Received: from agluck-desk3.sc.intel.com ([172.25.222.74])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 10:54:07 -0800
From: Tony Luck <tony.luck@intel.com>
To: Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Peter Newman <peternewman@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	x86@kernel.org
Cc: Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Babu Moger <babu.moger@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	patches@lists.linux.dev,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH v13 0/8] Add support for Sub-NUMA cluster (SNC) systems
Date: Mon,  4 Dec 2023 10:53:49 -0800
Message-ID: <20231204185357.120501-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231130003418.89964-1-tony.luck@intel.com>
References: <20231130003418.89964-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sub-NUMA cluster feature on some Intel processors partitions the CPUs
that share an L3 cache into two or more sets. This plays havoc with the
Resource Director Technology (RDT) monitoring features.  Prior to this
patch Intel has advised that SNC and RDT are incompatible.

Some of these CPU support an MSR that can partition the RMID counters in
the same way. This allows monitoring features to be used. With the caveat
that users must be aware that Linux may migrate tasks more frequently
between SNC nodes than between "regular" NUMA nodes, so reading counters
from all SNC nodes may be needed to get a complete picture of activity
for tasks.

Cache and memory bandwidth allocation features continue to operate at
the scope of the L3 cache.

Signed-off-by: Tony Luck <tony.luck@intel.com>

Changes since v12:

All:
	Reinette - put commit tags in right order for TIP (Tested-by before
	Reviewed-by)

Patch 7:
	Fam Zheng - Check for -1 return from get_cpu_cacheinfo_id() and
	increase size of bitmap tracking # of L3 instances.
	Reinette - Add extra sanity checks. Note that this patch has
	some additional tweaks beyond the e-mail discussion.
		1) "3" is a valid return in addition to 1, 2, 4
		2) Added a warning if the sanity checks fail that
		prints number of CPU nodes and number of L3 cache
		instances that were found.

Patch 8:
	Babu - Fix grammar with an additional comma.


Tony Luck (8):
  x86/resctrl: Prepare for new domain scope
  x86/resctrl: Prepare to split rdt_domain structure
  x86/resctrl: Prepare for different scope for control/monitor
    operations
  x86/resctrl: Split the rdt_domain and rdt_hw_domain structures
  x86/resctrl: Add node-scope to the options for feature scope
  x86/resctrl: Introduce snc_nodes_per_l3_cache
  x86/resctrl: Sub NUMA Cluster detection and enable
  x86/resctrl: Update documentation with Sub-NUMA cluster changes

 Documentation/arch/x86/resctrl.rst        |  25 +-
 include/linux/resctrl.h                   |  85 +++--
 arch/x86/include/asm/msr-index.h          |   1 +
 arch/x86/kernel/cpu/resctrl/internal.h    |  66 ++--
 arch/x86/kernel/cpu/resctrl/core.c        | 433 +++++++++++++++++-----
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  58 +--
 arch/x86/kernel/cpu/resctrl/monitor.c     |  68 ++--
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c |  26 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 149 ++++----
 9 files changed, 629 insertions(+), 282 deletions(-)


base-commit: 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
-- 
2.41.0


