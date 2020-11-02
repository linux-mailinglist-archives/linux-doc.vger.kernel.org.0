Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014C82A30D7
	for <lists+linux-doc@lfdr.de>; Mon,  2 Nov 2020 18:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgKBRGl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 2 Nov 2020 12:06:41 -0500
Received: from mga03.intel.com ([134.134.136.65]:56747 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727150AbgKBRGl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Nov 2020 12:06:41 -0500
IronPort-SDR: ZZOziYJ0mgVcN133gyqqI5BrEtXxtsM4cqKghrZTYi4cCBMJv7xArrjzEpFG/dfzDMnmXFIXrr
 13WU51X75TiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="169019816"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="169019816"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 09:06:40 -0800
IronPort-SDR: nbjzaUvGt+g+YRujosLqvdtMzPOYNw2K/+dFvUhqBkui/sbZOcZmdbBkbzhAWGN69cc8fxm/2J
 GCgqJG9L4BOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="336229963"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 02 Nov 2020 09:06:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1DC1C1F5; Mon,  2 Nov 2020 19:06:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel test robot <lkp@intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v1] scripts: kernel-doc: Restore anonymous enum parsing
Date:   Mon,  2 Nov 2020 19:06:37 +0200
Message-Id: <20201102170637.36138-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The commit d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
broke anonymous enum parsing. Restore it by relying on members rather than
its name.

Fixes: d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index f699cf05d409..9b6ddeb097e9 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1390,7 +1390,7 @@ sub dump_enum($$) {
 	$members = $2;
     }
 
-    if ($declaration_name) {
+    if ($members) {
 	my %_members;
 
 	$members =~ s/\s+$//;
-- 
2.28.0

