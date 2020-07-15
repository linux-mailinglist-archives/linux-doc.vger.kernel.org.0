Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617B022137A
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2020 19:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgGORaX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Jul 2020 13:30:23 -0400
Received: from ipmail04.adl3.internode.on.net ([150.101.137.10]:51320 "EHLO
        ipmail04.adl3.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725861AbgGORaX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jul 2020 13:30:23 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jul 2020 13:30:21 EDT
X-SMTP-MATCH: 0
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BLBACVOw9f/5UxyQ5gHgE8DAILHIF?=
 =?us-ascii?q?Dg21fjTSGAJ4ZCwE8AQIEAQGERgQCggwlNwYOAhABAQYBAQEBAQYEhlSGKAE?=
 =?us-ascii?q?jI08BgQGDJoJ8qT+CKIVRg1SBQIE4iAOFCYIAhF+FCoUpBJsemhGCZ4ELmEE?=
 =?us-ascii?q?wgQueLgGzAYF7MxoIKAg7gmlQGQ2cdTQwNwIGCAEBAwlXAY9RAQE?=
Received: from 14-201-49-149.tpgi.com.au (HELO silver.lan) ([14.201.49.149])
  by ipmail04.adl3.internode.on.net with ESMTP; 16 Jul 2020 02:55:17 +0930
From:   Paul Schulz <paul@mawsonlakes.org>
To:     linux-doc@vger.kernel.org
Cc:     Paul Schulz <paul@mawsonlakes.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] coding-style: Adds examples for alternatives to 'blacklist'
Date:   Thu, 16 Jul 2020 02:55:10 +0930
Message-Id: <20200715172510.126542-1-paul@mawsonlakes.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Replacing the term 'blacklist' with a term that better describes
a lists functionality or it's use makes its usage more understandable,
rather than a generic 'denylist' or 'blocklist'

eg. 'quirklist' for hardware cards what behave differently
    'invalidlist' for a list of invalid hardware strings

Signed-off-by: Paul Schulz <paul@mawsonlakes.org>
---
 Documentation/process/coding-style.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 1bee6f8affdb..3e5ca93a4443 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -334,6 +334,10 @@ Recommended replacements for 'blacklist/whitelist' are:
     'denylist / allowlist'
     'blocklist / passlist'
 
+Specific reasons for a lists functionality should also be considered. eg
+    'quirklist'
+    'invalidlist'
+
 Exceptions for introducing new usage is to maintain a userspace ABI/API,
 or when updating code for an existing (as of 2020) hardware or protocol
 specification that mandates those terms. For new specifications
-- 
2.25.1

