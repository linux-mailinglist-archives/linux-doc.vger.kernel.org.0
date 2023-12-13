Return-Path: <linux-doc+bounces-4439-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C18091F3
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 20:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98B601F20FF3
	for <lists+linux-doc@lfdr.de>; Thu,  7 Dec 2023 19:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F58C4F899;
	Thu,  7 Dec 2023 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DD7KdeP5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5D110EF;
	Thu,  7 Dec 2023 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701978984; x=1733514984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J23aFV6iwILzuNztzQ1fpjCoJLBjXYWEnIF8zssZEKU=;
  b=DD7KdeP5xGzOlZNHQ9ksJWmfPVDbVPLARXS5uWPQB81qeFispzyzqz4g
   1KLH2yCsXQ7MihmV92lZz4dRsTk74WzDZvzuYS/hcSO7A/ogKW3+wy/4h
   08bbxACe9rCFvsT+xFAyVDL51KmV/3upxhi8xkO1jfamb/Tdoj2OsuuVW
   0fJu4kCLqKefW00v75bsX1ZFxsndXnBgJM5Adh6ppRMASBY25XOYp3Uws
   Js4CsL34OGmhd/qeigVcDWhPh+LAou1S9D4rMHp7OFTkY0SV9/N9qxXWZ
   0hU4EKF8Z58t4PVO/2FurQiA987oTBIFlWfZavk9e3IdNXX0aKtt47L2b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15848938"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="15848938"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 11:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889858586"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="889858586"
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
Subject: [PATCH v6 0/3] x86/resctrl: mba_MBps enhancements
Date: Thu,  7 Dec 2023 11:56:10 -0800
Message-ID: <20231207195613.153980-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231201214737.104444-1-tony.luck@intel.com>
References: <20231201214737.104444-1-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two changes relating to the MBA Software Controller(mba_sc):

1) Add a new mount option so the user can choose which memory
bandwidth monitoring event to use as the input to the feedback
loop.

2) Update the "mba_MBps" mount option to make use of total memory
bandwidth event on systems that do not support local bandwidth
event.

Signed-off-by: Tony Luck <tony.luck@intel.com>

---
Changes since v5:

Babu: Split into separate patches for the new mount option and the
update to the exising mount option. Since this is now a series, I
also moved the Documentation change to its own patch.

Reinette: Use "mbm_local_bytes", "mbm_total_bytes" as the strings for
the new "mba_MBps_event" option. This sets a precedent that new events
should follow the naming convention for the monitor files for the event.

Reinette: Update rdtgroup_show_options(). I'd completely missed this in
the earlier versions. Note that when the legacy "mba_MBps" mount option
is used, this will show in /proc as if the new option was used:

	# mount -t resctrl -o mba_MBps resctrl /sys/fs/resctrl/
	# grep resctrl /proc/mounts
	resctrl /sys/fs/resctrl resctrl rw,relatime,mba_MBps_event=mbm_local_bytes 0 0

Changing this to exacly match what the user typed would lose the detail
of which event is being used.

Reinette: More documentation needed. I added some text on why using
total instead of local might be useful to some users.

Tony Luck (3):
  x86/resctrl: Add mount option "mba_MBps_event"
  x86/resctrl: Use total bandwidth for mba_MBps option when local isn't
    present
  x86/resctrl: Add new "mba_MBps_event" mount option to documentation

 Documentation/arch/x86/resctrl.rst     | 16 ++++++-
 include/linux/resctrl.h                |  2 +
 arch/x86/kernel/cpu/resctrl/internal.h |  3 +-
 arch/x86/kernel/cpu/resctrl/monitor.c  | 21 ++++-----
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 63 +++++++++++++++++++++-----
 5 files changed, 79 insertions(+), 26 deletions(-)


base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
-- 
2.41.0


