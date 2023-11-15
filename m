Return-Path: <linux-doc+bounces-2094-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E57E74F5
	for <lists+linux-doc@lfdr.de>; Fri, 10 Nov 2023 00:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DBC3B21113
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 23:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DE238DC9;
	Thu,  9 Nov 2023 23:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhHcTBex"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE2374E5
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 23:09:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90B24231;
	Thu,  9 Nov 2023 15:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699571372; x=1731107372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hnpIpGXuGDWvAQGbF6yB63hW3Mlj2/cO9Ba/c4OMGKQ=;
  b=GhHcTBexPFxgogUfcPgew1mGaYWeLSPKVvYZwcisSBOayRQpmPwifNq2
   BpK0mLwaPsBRKhVaFFK0OenaIzhKzxOISqoG8SS1qM2ZyOkeFHU2fis+7
   MEdpPYojLbIkRRjuBW4eOFJEqatWkw036pV9okhkSEbQQ2Nl+H0OK0pKZ
   SLYrdHmpkVg9bAx2jRf0lSqxDqYJfbq8qaeu90HDo1iIedBsDZ043pWhi
   IuVzdTFvVVI2qf/03Vv/kBsHaUYWYMdZ6BB8U1dLhhBktktYqretQbyh2
   zxCkZqjzw2o8ooi4UyN2XF857zl6j7B/4oB72papZz7vS5WLpFFpeY7gd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="370298081"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="370298081"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 15:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="833984555"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="833984555"
Received: from agluck-desk3.sc.intel.com ([172.25.222.74])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 15:09:31 -0800
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
Subject: [PATCH v11 0/8] Add support for Sub-NUMA cluster (SNC) systems
Date: Thu,  9 Nov 2023 15:09:07 -0800
Message-ID: <20231109230915.73600-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031211708.37390-1-tony.luck@intel.com>
References: <20231031211708.37390-1-tony.luck@intel.com>
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

Changes since v10 to patches 1, 3, 4, 7. See patches for details.

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

 Documentation/arch/x86/resctrl.rst        |  23 +-
 include/linux/resctrl.h                   |  85 +++--
 arch/x86/include/asm/msr-index.h          |   1 +
 arch/x86/kernel/cpu/resctrl/internal.h    |  66 ++--
 arch/x86/kernel/cpu/resctrl/core.c        | 403 +++++++++++++++++-----
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  58 ++--
 arch/x86/kernel/cpu/resctrl/monitor.c     |  68 ++--
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c |  26 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 149 ++++----
 9 files changed, 598 insertions(+), 281 deletions(-)


base-commit: 5a6a09e97199d6600d31383055f9d43fbbcbe86f
-- 
2.41.0


