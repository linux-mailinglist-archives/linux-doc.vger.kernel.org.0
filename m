Return-Path: <linux-doc+bounces-4440-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33EC8091F6
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 20:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 208AA1C209A6
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 19:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFA350250;
	Thu,  7 Dec 2023 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzfyP099"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951F0170E;
	Thu,  7 Dec 2023 11:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701978985; x=1733514985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t5VxIPCjhEqavPh7wbXuE5TbTXLyEI0R+msiZrynqtw=;
  b=SzfyP099vvvRJFc4KfKN3wteZH8Dx0gSBg2NorFoiB9GNl2g375YxCB7
   5GDm+FS48EEbZxRqWOff/P1mBT5StSViJkKSHw24bzayciA/FWx2MX/fE
   4ZHK6YMeC0+l7CqQN93FVSbb0CibahsRR8hwS6t78Y725NWnV1jQfWMtl
   HFtf3wR10ltukZIWEHIY/2Lm4dWUuiIOMVkzRD+DXkn3T2QFGKy+qZf7+
   IZuhlKXQuuTv/JKHaSlUuQjb1n0jPM+t91Z+zVu9F2ZZP1bEEKyl1e6lJ
   n47/WrPa/O/ySW0R/mHoc5qK74ctWB/Z0ZoNmmrH8RT+cDQnJnpKeBj9X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15848966"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="15848966"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 11:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889858593"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="889858593"
Received: from agluck-desk3.sc.intel.com ([172.25.222.74])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 11:56:23 -0800
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
Subject: [PATCH v6 2/3] x86/resctrl: Use total bandwidth for mba_MBps option when local isn't present
Date: Thu,  7 Dec 2023 11:56:12 -0800
Message-ID: <20231207195613.153980-3-tony.luck@intel.com>
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

On Intel systems the memory bandwidth monitoring events are
independently enumerated. It is possible for a system to support
total memory bandwidth monitoring, but not support local bandwidth
monitoring. On such a system a user could not enable mba_sc mode.
Users will see this highly unhelpful error message from mount:

 # mount -t resctrl -o mba_MBps resctrl /sys/fs/resctrl
 mount: /sys/fs/resctrl: wrong fs type, bad option, bad superblock on
 resctrl, missing codepage or helper program, or other error.
 dmesg(1) may have more information after failed mount system call.

dmesg(1) does not provide any additional information.

Modify the existing "mba_MBps" mount option to switch to total bandwidth
monitoring if local monitoring is not available.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5f64a0b2597c..7410513db45a 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2725,6 +2725,8 @@ static int rdt_parse_param(struct fs_context *fc, struct fs_parameter *param)
 			return -EINVAL;
 		if (is_mbm_local_enabled())
 			ctx->enable_mba_mbps_local = true;
+		else if (is_mbm_total_enabled())
+			ctx->enable_mba_mbps_total = true;
 		else
 			return -EINVAL;
 		return 0;
-- 
2.41.0


