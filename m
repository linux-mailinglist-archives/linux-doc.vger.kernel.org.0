Return-Path: <linux-doc+bounces-611-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C27CF490
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 12:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAB03281F28
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 10:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9460917754;
	Thu, 19 Oct 2023 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1HDPY72"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0DA14F90
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 10:01:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BFBB8;
	Thu, 19 Oct 2023 03:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697709685; x=1729245685;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4tVLPdmGhD/Ev5x1gsJNSKEuLw82S1fRviVzD2Ftcyw=;
  b=D1HDPY72iNb7NauR/lyBdW/6a6MPCJT/XQSpDL7WuBFhAdX2/hk9QU4J
   76h95Jaz1KSWjQ0T5EMCa2u7hbGKIPT0SDyGtRSCNqmOGcW4Nz2JCVwnl
   QWoHOJlS0+zW2BHffKpFZY+BfmafLCpq91GBqTFJA3vyGeuL/LPhAUSjK
   nO7tR9bd/9ucVjVqkz/A/1wSSrUimh6DXrvGooWyeUEY6fxgvAI9zqxKQ
   0CZ7Gd5wsEtoDJDHxSQi5TGAV6Yqmw64AamnZvu8UWQsvJmt0A29Oh3Mz
   aQbPobowsAeVPWvznV/QLAXAXVhb1JhIFR8bGkoml1Qe7+HG4bxqZY7Hz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="371278642"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="371278642"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="733512273"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="733512273"
Received: from yujie-x299.sh.intel.com ([10.239.159.77])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:01:22 -0700
From: Yujie Liu <yujie.liu@intel.com>
To: linux-doc@vger.kernel.org
Cc: Yujie Liu <yujie.liu@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] scripts/kernel-doc: match -Werror flag strictly
Date: Thu, 19 Oct 2023 17:56:37 +0800
Message-Id: <20231019095637.2471840-1-yujie.liu@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In our CI testing, we use some commands as below to only turn a specific
type of warnings into errors, but we notice that kernel-doc warnings
are also turned into errors unexpectedly.

$ make KCFLAGS="-Werror=return-type" W=1 kernel/fork.o

kernel/fork.c:1406: warning: Function parameter or member 'mm' not described in 'set_mm_exe_file'
kernel/fork.c:1406: warning: Function parameter or member 'new_exe_file' not described in 'set_mm_exe_file'
kernel/fork.c:1441: warning: Function parameter or member 'mm' not described in 'replace_mm_exe_file'
kernel/fork.c:1441: warning: Function parameter or member 'new_exe_file' not described in 'replace_mm_exe_file'
kernel/fork.c:1491: warning: Function parameter or member 'mm' not described in 'get_mm_exe_file'
kernel/fork.c:1510: warning: Function parameter or member 'task' not described in 'get_task_exe_file'
kernel/fork.c:1534: warning: Function parameter or member 'task' not described in 'get_task_mm'
kernel/fork.c:2109: warning: bad line:
kernel/fork.c:2130: warning: Function parameter or member 'ret' not described in '__pidfd_prepare'
kernel/fork.c:2130: warning: Excess function parameter 'pidfd' description in '__pidfd_prepare'
kernel/fork.c:2179: warning: Function parameter or member 'ret' not described in 'pidfd_prepare'
kernel/fork.c:2179: warning: Excess function parameter 'pidfd' description in 'pidfd_prepare'
kernel/fork.c:3195: warning: expecting prototype for clone3(). Prototype was for sys_clone3() instead
13 warnings as Errors
make[3]: *** [scripts/Makefile.build:243: kernel/fork.o] Error 13
make[3]: *** Deleting file 'kernel/fork.o'
make[2]: *** [scripts/Makefile.build:480: kernel] Error 2
make[1]: *** [/root/linux/Makefile:1913: .] Error 2
make: *** [Makefile:234: __sub-make] Error 2

From the git history, commit 2c12c8103d8f ("scripts/kernel-doc:
optionally treat warnings as errors") introduces a new command-line
option to make kernel-doc warnings into errors. It can also read the
KCFLAGS environment variable to decide whether to turn this option on,
but the regex used for matching may not be accurate enough. It can match
both "-Werror" and "-Werror=<diagnostic-type>", so the option is turned
on by mistake in the latter case.

Fix this by strictly matching the flag "-Werror": there must be a space
or start of string in the front, and a space or end of string at the
end. This can handle all the following cases correctly:

KCFLAGS="-Werror" make W=1 [MATCH]
KCFLAGS="-Werror=return-type" make W=1 [NO MATCH]
KCFLAGS="-Wcomment -Werror -Wundef" make W=1 [MATCH]
KCFLAGS="-Wcomment -Werror=return-type -Wundef" make W=1 [NO MATCH]

Fixes: 2c12c8103d8f ("scripts/kernel-doc: optionally treat warnings as errors")
Signed-off-by: Yujie Liu <yujie.liu@intel.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 6e199a745ccb..d660e1f4b483 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
 if (defined($ENV{'KCFLAGS'})) {
 	my $kcflags = "$ENV{'KCFLAGS'}";
 
-	if ($kcflags =~ /Werror/) {
+	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
 		$Werror = 1;
 	}
 }
-- 
2.34.1


