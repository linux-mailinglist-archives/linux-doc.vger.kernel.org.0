Return-Path: <linux-doc+bounces-1718-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C47E199D
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 06:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79803B20CC8
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 05:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE4E8F79;
	Mon,  6 Nov 2023 05:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LROM2r5h"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208FF8F65
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 05:23:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DACF5;
	Sun,  5 Nov 2023 21:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699248236; x=1730784236;
  h=from:to:cc:subject:date:message-id;
  bh=fdAGOdpA2R6+OC+nPs2Nw5XTCnL/xZ9metm1cqBG68U=;
  b=LROM2r5hg0zRVCKLQVgOopDWATD+X4r37hAM+M19ei0Nou65qmuXvGVa
   fjAOVw1s38pqcybjDGYjXZsv9lLYGn9mFeRXsHXGAlWSzTJYbt85v27pn
   7OVzR1SUrGMUx2IAl/XVWExXOjh2qz2EVaascZFsN3LABlzbszjAEteBI
   gD1uU1PPi54tW0nvK3ebcZEWqKGh8/rsV0Lb9BJV/e4nbOEMtVQQD+0Ns
   8Vkp1RO8l2k80okyLjlmX3xD7phHITpn5qzbgCQ/K56Q5/t6/eG8OGtGh
   /yJJgk6mH6BmnkuXsO7dK7q0t/Ij1+oGSa+orrbP51X+ylkwCa/mhRVFx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455692972"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="455692972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 21:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="10340714"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 21:23:53 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	x86@kernel.org
Cc: dave.hansen@linux.intel.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	corbet@lwn.net,
	mcgrof@suse.com,
	andriy.shevchenko@intel.com,
	kai.huang@intel.com,
	Yan Zhao <yan.y.zhao@intel.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH] Documentation: x86: Correct effective memory type for MTRR=WC and PAT=UC-
Date: Mon,  6 Nov 2023 12:53:56 +0800
Message-Id: <20231106045356.5856-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Correct effective memory type for a WC MTRR on a region with a PAT entry
UC- from UC to WC.

As per Intel SDM section "Selecting Memory Types for Pentium III and More
Recent Processor Families", table "Effective Page-Level Memory Types for
Pentium III and More Recent Processor Families",

================  ===============  =====================
MTRR Memory Type  PAT Entry Value  Effective Memory Type
================  ===============  =====================
      WC               UC-                  WC

the effect of a WC MTRR on a region with a PAT entry UC- will be WC.

There's a previous attempt to fix this issue at [1], but not sure why the
patch got lost.

Fixes: 2f9e897353fc ("x86/mm/mtrr, pat: Document Write Combining MTRR type effects on PAT / non-PAT pages").
Link: https://lore.kernel.org/all/1457131501-14855-1-git-send-email-mcgrof@kernel.org [1]
Cc: Sean Christopherson <seanjc@google.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 Documentation/arch/x86/pat.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/pat.rst b/Documentation/arch/x86/pat.rst
index 5d901771016d..414129efa316 100644
--- a/Documentation/arch/x86/pat.rst
+++ b/Documentation/arch/x86/pat.rst
@@ -138,19 +138,19 @@ otherwise not be effective.
   ====  =======  ===  =========================  =====================
   MTRR  Non-PAT  PAT  Linux ioremap value        Effective memory type
   ====  =======  ===  =========================  =====================
         PAT                                        Non-PAT |  PAT
         |PCD                                               |
         ||PWT                                              |
         |||                                                |
   WC    000      WB   _PAGE_CACHE_MODE_WB             WC   |   WC
   WC    001      WC   _PAGE_CACHE_MODE_WC             WC*  |   WC
-  WC    010      UC-  _PAGE_CACHE_MODE_UC_MINUS       WC*  |   UC
+  WC    010      UC-  _PAGE_CACHE_MODE_UC_MINUS       WC*  |   WC
   WC    011      UC   _PAGE_CACHE_MODE_UC             UC   |   UC
   ====  =======  ===  =========================  =====================
 
   (*) denotes implementation defined and is discouraged
 
 .. note:: -- in the above table mean "Not suggested usage for the API". Some
   of the --'s are strictly enforced by the kernel. Some others are not really
   enforced today, but may be enforced in future.
 

base-commit: 1aabbc532413ced293952f8e149ad0a607d6e470
-- 
2.17.1


