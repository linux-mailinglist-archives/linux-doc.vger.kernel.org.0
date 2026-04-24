Return-Path: <linux-doc+bounces-84551-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7jxyJtTj62mOSgAAu9opvQ
	(envelope-from <linux-doc+bounces-84551-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 23:42:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF1D4638CF
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 23:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC1A6300CC33
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2026 21:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049A3368975;
	Fri, 24 Apr 2026 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsuEPuBG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008A71DA62E;
	Fri, 24 Apr 2026 21:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777066961; cv=none; b=CWEjTWKvs4OYZD9MJ/OxjCUy4PX7JrWFPW+VU/i65UwpoAARtlMjQt32N6u58O9oPutziv/s87t4suvlCt8GhhW7I2u092EnfQUpSXA+vRH0/QBQvrgtO4d2qEuFRgWgBaeoxMs/I8LwC5yVZD3GeGOl9o2I62B+Hi9Ab29gQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777066961; c=relaxed/simple;
	bh=J05J3Wn5TYFabkSWc2/o463TQ8jERm4fczlxjTzBr38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dXlDX3Hb38orzDRZX6xjVGWR9ZEUS46LId2g0oywEiytNpQVzh1ERkuvmYC5gZab+KIA6E0CkMtkEANTnHHejxp6wlpVox8cq/F6I+eF/82oCHm+DRo/s9sH22lpPzqva0UsZlh0e+8CsFGoODAX8KjvdaEUx0v3tYOVoHrRfrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsuEPuBG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777066960; x=1808602960;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=J05J3Wn5TYFabkSWc2/o463TQ8jERm4fczlxjTzBr38=;
  b=dsuEPuBGlo7yLnOoUCHGsNFz7EE/9W8nF68L0GJYluO2mRvRPcByqIvQ
   bXypnfux9Y85Bo4iY4QnwQokjc+1k/w+BcZUQEBz43MmcVUZhuxazl+qX
   OY95Y5UbLmFhuLtBaYmrc+loSePkoI+ufW/C9UHzt3VzpB8XgoSKC4sCm
   d1LD9lmS7OMy9rNB7NXxoazWQLxEziDoIKpd6qhslcQmrU2WHtPmh1vkA
   cs6YyllcsYAnev/jno4wmQmgKL1xp048+L0LPeNsCTNQt5B1+cmDP6kZI
   xKGUH9CwPFUxHLiz4zHKzpiC66vw7OF3bATcJWvDh1//FxfKLA0rhdjKY
   w==;
X-CSE-ConnectionGUID: fwzRH5axT9Sewvv9bc/eMQ==
X-CSE-MsgGUID: ULVCYR0aSw25GGkN2Q0gYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="78072914"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="78072914"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 14:42:40 -0700
X-CSE-ConnectionGUID: XVCL0VGdQLOE9XIrGR1rfg==
X-CSE-MsgGUID: upIIAJh4Tnmh2raBcUbeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="232952502"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 14:42:39 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Fri, 24 Apr 2026 14:41:13 -0700
Subject: [PATCH] Documentation: intel_pstate: Fix description of asymmetric
 packing with SMT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-rneri-fix-intel-pstate-doc-smt-asym-packing-v1-1-317bf7d5c362@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAHjj62kC/x2NMQrDMAwAvxI0V2CLJkO/UjoYW01EG8VYpqSE/
 L2i4w13d4BxEza4DQc0/ojJpg7xMkBeks6MUpyBAk3hSoRNXcCn7Cja+Y3VeuqMZctoa8dk3xV
 ryi/RGSOHQDGNXCYCL9bGLv5v98d5/gASFT80fQAAAA==
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Ricardo Neri <ricardo.neri@intel.com>, linux-pm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777066890; l=2733;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=J05J3Wn5TYFabkSWc2/o463TQ8jERm4fczlxjTzBr38=;
 b=F4JUMwWjByHlhXX/kj0knAOz6o+FRWdwTK7qPn/J7OPM9urhRcOcVYFiS3CMRXhxcoQA+2Dvl
 F92h2HmF1LJBcfdjQcp3VWLRYd6nC+YqtLwn5AHwt7YUQnmB8d6Xd+e
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=
X-Rspamd-Queue-Id: EEF1D4638CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84551-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ricardo.neri-calderon@linux.intel.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The patchset [1], of which commits 046a5a95c3b0 ("x86/sched/itmt: Give all
SMT siblings of a core the same priority") and 995998ebdebd ("x86/sched:
Remove SD_ASYM_PACKING from the SMT domain flags") are part, overhauled how
the scheduler handles asym_packing on x86 hybrid processors with SMT. It
removed SD_ASYM_PACKING from the x86 SMT scheduling domain and made all SMT
siblings of a core share the same priority. As a result, asym_packing
operates only across physical cores, spreading tasks among them and only
using idle SMT siblings once all physical cores are busy.

Fix the documentation to reflect this behavior.

Fixes: f20af84c29b2 ("cpufreq: intel_pstate: Document hybrid processor support")
Link: https://lore.kernel.org/r/20230406203148.19182-1-ricardo.neri-calderon@linux.intel.com [1]
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 Documentation/admin-guide/pm/intel_pstate.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/pm/intel_pstate.rst b/Documentation/admin-guide/pm/intel_pstate.rst
index fde967b0c2e0..25fe5d88fea6 100644
--- a/Documentation/admin-guide/pm/intel_pstate.rst
+++ b/Documentation/admin-guide/pm/intel_pstate.rst
@@ -355,11 +355,12 @@ HyperThreading (HT) in the context of Intel processors, is enabled on at least
 one core, ``intel_pstate`` assigns performance-based priorities to CPUs.  Namely,
 the priority of a given CPU reflects its highest HWP performance level which
 causes the CPU scheduler to generally prefer more performant CPUs, so the less
-performant CPUs are used when the other ones are fully loaded.  However, SMT
-siblings (that is, logical CPUs sharing one physical core) are treated in a
-special way such that if one of them is in use, the effective priority of the
-other ones is lowered below the priorities of the CPUs located in the other
-physical cores.
+performant CPUs are used when the other ones are fully loaded.  SMT siblings
+(that is, logical CPUs sharing one physical core) are given the same priority.
+The scheduler can pull tasks from lower-priority cores and place them on any
+sibling.  Since the scheduler spreads tasks among physical cores, tasks will be
+placed on the SMT siblings of physical cores only after all physical cores are
+busy.
 
 This approach maximizes performance in the majority of cases, but unfortunately
 it also leads to excessive energy usage in some important scenarios, like video

---
base-commit: fbfb6bd927c9ac6ea155471cc7ced8e16b37c2cb
change-id: 20260422-rneri-fix-intel-pstate-doc-smt-asym-packing-1e0021a5ed62

Best regards,
-- 
Ricardo Neri <ricardo.neri-calderon@linux.intel.com>


