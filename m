Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D093B36180
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2019 18:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbfFEQjt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Jun 2019 12:39:49 -0400
Received: from mga12.intel.com ([192.55.52.136]:49845 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728263AbfFEQjs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Jun 2019 12:39:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 09:39:48 -0700
X-ExtLoop1: 1
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 05 Jun 2019 09:39:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DC3062D4; Wed,  5 Jun 2019 19:39:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] docs/core-api: Add string helpers API to the list
Date:   Wed,  5 Jun 2019 19:39:44 +0300
Message-Id: <20190605163944.50803-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some times string helpers are needed, but there is nothing about them
in the generated documentation.

Fill the gap by adding a reference to string_helpers.c exported functions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/core-api/kernel-api.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index a53ec2eb8176..65ae2bf1f86d 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -33,6 +33,9 @@ String Conversions
 .. kernel-doc:: lib/kstrtox.c
    :export:
 
+.. kernel-doc:: lib/string_helpers.c
+   :export:
+
 String Manipulation
 -------------------
 
-- 
2.20.1

