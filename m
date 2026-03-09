Return-Path: <linux-doc+bounces-78511-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B8vA+4Or2kYNQIAu9opvQ
	(envelope-from <linux-doc+bounces-78511-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 19:18:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DDD23E7DA
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 19:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 792EA305F316
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2026 18:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C7A3385AC;
	Mon,  9 Mar 2026 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5aliJoO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6CB311950;
	Mon,  9 Mar 2026 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079964; cv=none; b=WvDgY657CD0/4n8BNbKhkx6qjWxc/aUS5wfws7/gcygoqSBB+iFOyH8iednwgS38UEAjPFZewoUtk3RvXBcfWC1BuhhlluDVrp559aHTsubJBUUl3oi7Oivskb+dzn+8p/YphNtXWk2x0ORupwI9OuvyO0WyyxwZAs1/BYMmDPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079964; c=relaxed/simple;
	bh=WaltZvFYX7Rj0hNcyUoNBRNQ8wFZNOgcYwUjIIwEWjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7aXcDElPFvlmDLLadUlkc/L/UUprMbbWoVst7V/sDstw1YTgFNX7FgxIZgrY9YxM3cWeFuSYawjUzORVmGSAWChsWo2tEWP3R4tHbNnLeeWDqoj1dhPoBReizrE5q2mHCfZQWIgAH+L7CQCvm85+H9W2tOxPNRxDU0fiJOhmtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5aliJoO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773079963; x=1804615963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WaltZvFYX7Rj0hNcyUoNBRNQ8wFZNOgcYwUjIIwEWjk=;
  b=V5aliJoO+BoVRZdyqd0vw8PKjZ5Mhfbu9HgRctEa62hzDpWY/EacHOYs
   l85KFGqyLPRJ1MOibzb1WYr50MNTe87W90ALBvIxWBKP5b6ZhrVTR0lR1
   Yle2yUW1Cg7X8Lbm0/l9GP9OqhDeJ7pM592mWubHbwJlXPvIfYT296kQC
   hB4r9CND00zzcffspUj2Fb6Md0uTHg1Spn1RqmP5csTDiZnhS79qhZMXG
   fAtLflthoYEvZ9PYFgV9R4RMlSq4FPXNZkU3np0ODOIzhBqedCR4ilXOq
   rqWcVMR4kIibRuWyvRDnSimnK9M79UmI12Fvrqy8yw5ltIP8cpaWNK7u6
   Q==;
X-CSE-ConnectionGUID: EltfuFdVRVGEaYZ9663wwA==
X-CSE-MsgGUID: cXavrYMrT8+ZXgjH7uIDGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73992075"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73992075"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 11:12:43 -0700
X-CSE-ConnectionGUID: KAt9/CRcTMavTlaXT6u6gw==
X-CSE-MsgGUID: FhoAWZWTRKGfNAbEa4MVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224774476"
Received: from sohilmeh.sc.intel.com ([172.25.103.65])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2026 11:12:42 -0700
From: Sohil Mehta <sohil.mehta@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Nam Cao <namcao@linutronix.de>,
	Cedric Xing <cedric.xing@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tony Luck <tony.luck@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] x86/vsyscall: Disable LASS if vsyscall mode is set to EMULATE
Date: Mon,  9 Mar 2026 11:10:28 -0700
Message-ID: <20260309181029.398498-5-sohil.mehta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309181029.398498-1-sohil.mehta@intel.com>
References: <20260309181029.398498-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 78DDD23E7DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78511-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sohil.mehta@intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

The EMULATE mode of vsyscall maps the vsyscall page with a high kernel
address directly into user address space. Reading the vsyscall page in
EMULATE mode would cause LASS to trigger a #GP.

Fixing the LASS violation in EMULATE mode would require complex
instruction decoding because the resulting #GP does include the
necessary error information, and the vsyscall address is not
readily available in the RIP.

The EMULATE mode has been deprecated since 2022 and can only be enabled
using the command line parameter vsyscall=emulate. See commit
bf00745e7791 ("x86/vsyscall: Remove CONFIG_LEGACY_VSYSCALL_EMULATE") for
details. At this point, no one is expected to be using this insecure
mode. The rare usages that need it obviously do not care about security.

Disable LASS when EMULATE mode is requested to avoid breaking legacy
user software. Also, update the vsyscall documentation to reflect this.
LASS will only be supported if vsyscall mode is set to XONLY (default)
or NONE.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Tested-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Eventually, the plan is to get rid of the EMULATE mode altogether. Linus
and AndyL seem to be okay with such a change. However, those changes are
beyond the scope of this series.

v3:
 - Pick up review and tested-by tags.

v2:
 - Picked up Dave's review tag
 - Removed unnecessary CR4 clearing during vsyscall_setup().
   CR4.LASS is enabled much later via a late_initcall().
---
 Documentation/admin-guide/kernel-parameters.txt | 4 +++-
 arch/x86/entry/vsyscall/vsyscall_64.c           | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb850e5290c2..64df2c52b2e5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8376,7 +8376,9 @@ Kernel parameters
 
 			emulate     Vsyscalls turn into traps and are emulated
 			            reasonably safely.  The vsyscall page is
-				    readable.
+				    readable.  This disables the Linear
+				    Address Space Separation (LASS) security
+				    feature and makes the system less secure.
 
 			xonly       [default] Vsyscalls turn into traps and are
 			            emulated reasonably safely.  The vsyscall
diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index e740f3b42278..ea36de9fa864 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -62,6 +62,11 @@ static int __init vsyscall_setup(char *str)
 		else
 			return -EINVAL;
 
+		if (cpu_feature_enabled(X86_FEATURE_LASS) && vsyscall_mode == EMULATE) {
+			setup_clear_cpu_cap(X86_FEATURE_LASS);
+			pr_warn_once("x86/cpu: Disabling LASS due to vsyscall=emulate\n");
+		}
+
 		return 0;
 	}
 
-- 
2.43.0


