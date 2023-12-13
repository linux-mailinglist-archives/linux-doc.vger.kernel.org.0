Return-Path: <linux-doc+bounces-4441-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 438EF8091F8
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 20:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5DE9281B4F
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 19:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1224F890;
	Thu,  7 Dec 2023 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJRUJPTP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68ECF170F;
	Thu,  7 Dec 2023 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701978986; x=1733514986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7Y+W1l2QvxVLq3YI3AbXljtPrGo+7Qw1R28SArBOmbk=;
  b=KJRUJPTPm4Vl80uWPmSXEmxulAoj3j/TGEKecYavYOpMoYirsraIZ2rG
   i2wkKa0uPioAOcYtwEHZNqVZdXV3bpYmK1tF707UOSptVJTGoWnsZzIbe
   V3THq/Kfp/i779XtWiPBiIT4VWLNzqUs/hTFciGp/CiNyYZIE+7a4GZBH
   k/zWafEgTbjrr7SPAr71Mct+I2MDmAIk4tlNdk/FUL02wpK124g0Nbzmu
   kUetYjmi0KIVJ6oCeQ6OvMrx8ao1v0EEu5x9WeZbFwixKBk4x/RGimNzW
   OAtwVjmKIQQWtU5KypD857yQYFFQ7eXHh5fGo3hjbiKUJtc74RO9np6ER
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15848980"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="15848980"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 11:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889858596"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="889858596"
Received: from agluck-desk3.sc.intel.com ([172.25.222.74])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 11:56:24 -0800
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
Subject: [PATCH v6 3/3] x86/resctrl: Add new "mba_MBps_event" mount option to documentation
Date: Thu,  7 Dec 2023 11:56:13 -0800
Message-ID: <20231207195613.153980-4-tony.luck@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231207195613.153980-1-tony.luck@intel.com>
References: <20231201214737.104444-1-tony.luck@intel.com>
 <20231207195613.153980-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New mount option may be used to choose a specific memory bandwidth
monitoring event to feed the MBA Software Controller(mba_sc) feedback
loop.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 Documentation/arch/x86/resctrl.rst | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index a6279df64a9d..a0c521db6786 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -35,7 +35,8 @@ about the feature from resctrl's info directory.
 
 To use the feature mount the file system::
 
- # mount -t resctrl resctrl [-o cdp[,cdpl2][,mba_MBps][,debug]] /sys/fs/resctrl
+ # mount -t resctrl resctrl [-o cdp[,cdpl2][,mba_MBps] \
+ [,mba_MBps_event=[mbm_local_bytes|mbm_total_bytes]][,debug]] /sys/fs/resctrl
 
 mount options are:
 
@@ -45,7 +46,12 @@ mount options are:
 	Enable code/data prioritization in L2 cache allocations.
 "mba_MBps":
 	Enable the MBA Software Controller(mba_sc) to specify MBA
-	bandwidth in MBps
+	bandwidth in MBps. Defaults to using MBM local bandwidth,
+	but will use total bandwidth on systems that do not support
+	local bandwidth monitoring.
+"mba_MBps_event=[mbm_local_bytes|mbm_total_bytes]":
+	Enable the MBA Software Controller(mba_sc) with a specific
+	MBM event as input to the feedback loop.
 "debug":
 	Make debug files accessible. Available debug files are annotated with
 	"Available only with debug option".
@@ -538,6 +544,12 @@ where as user can switch to the "MBA software controller" mode using
 a mount option 'mba_MBps'. The schemata format is specified in the below
 sections.
 
+By default the software feedback mechanism uses measurement of local
+memory bandwidth to make adjustments to throttling levels. If a system
+is running applications with poor NUMA locality users may want to use
+the "mba_MBps_event=mbm_total_bytes" mount option which will use total
+memory bandwidth measurements instead of local.
+
 L3 schemata file details (code and data prioritization disabled)
 ----------------------------------------------------------------
 With CDP disabled the L3 schemata format is::
-- 
2.41.0


