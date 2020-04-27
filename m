Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D40C1BB04D
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2020 23:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgD0VSt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Apr 2020 17:18:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:34128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgD0VR0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 Apr 2020 17:17:26 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A449A21D94;
        Mon, 27 Apr 2020 21:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588022244;
        bh=6ICX8cckmy6texUfyApW5SonGeAHMErKiYN+4yOW/oM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gMKuOVOun78m9WOx5LF7/YylCIuSkt73KvvYzowDqZr3TXaf0C9OVS/ypSJ7UFo52
         6HmaK/JZwpEYSSumVQT5lZrB4I7wAoCFW+gHbv4QGYWHPtmfVHq7x4NWYGHw3arEQk
         b6xmxrMMh4uSnfnlhy1/Skldv+ccUk38PlQ85Ays=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jTB7y-000Hks-Su; Mon, 27 Apr 2020 23:17:22 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Jeff Layton <jlayton@kernel.org>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 16/29] docs: filesystems: convert mandatory-locking.txt to ReST
Date:   Mon, 27 Apr 2020 23:17:08 +0200
Message-Id: <aecd6259fe9f99b2c2b3440eab6a2b989125e00d.1588021877.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588021877.git.mchehab+huawei@kernel.org>
References: <cover.1588021877.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Add a SPDX header;
- Adjust document title;
- Some whitespace fixes and new line breaks;
- Use notes markups;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/index.rst           |  1 +
 Documentation/filesystems/locks.rst           |  2 +-
 ...tory-locking.txt => mandatory-locking.rst} | 25 ++++++++++++-------
 fs/locks.c                                    |  2 +-
 4 files changed, 19 insertions(+), 11 deletions(-)
 rename Documentation/filesystems/{mandatory-locking.txt => mandatory-locking.rst} (91%)

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 7e975c9a5fbf..89c712b81778 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -29,6 +29,7 @@ algorithms work.
    fiemap
    files
    locks
+   mandatory-locking
 
    automount-support
 
diff --git a/Documentation/filesystems/locks.rst b/Documentation/filesystems/locks.rst
index 10f67fb9ce07..c5ae858b1aac 100644
--- a/Documentation/filesystems/locks.rst
+++ b/Documentation/filesystems/locks.rst
@@ -58,7 +58,7 @@ fcntl(), with all the problems that implies.
 ---------------------------------------
 
 Mandatory locking, as described in
-'Documentation/filesystems/mandatory-locking.txt' was prior to this release a
+'Documentation/filesystems/mandatory-locking.rst' was prior to this release a
 general configuration option that was valid for all mounted filesystems.  This
 had a number of inherent dangers, not the least of which was the ability to
 freeze an NFS server by asking it to read a file for which a mandatory lock
diff --git a/Documentation/filesystems/mandatory-locking.txt b/Documentation/filesystems/mandatory-locking.rst
similarity index 91%
rename from Documentation/filesystems/mandatory-locking.txt
rename to Documentation/filesystems/mandatory-locking.rst
index a251ca33164a..9ce73544a8f0 100644
--- a/Documentation/filesystems/mandatory-locking.txt
+++ b/Documentation/filesystems/mandatory-locking.rst
@@ -1,8 +1,13 @@
-	Mandatory File Locking For The Linux Operating System
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================================
+Mandatory File Locking For The Linux Operating System
+=====================================================
 
 		Andy Walker <andy@lysaker.kvaerner.no>
 
 			   15 April 1996
+
 		     (Updated September 2007)
 
 0. Why you should avoid mandatory locking
@@ -53,15 +58,17 @@ possible on existing user code. The scheme is based on marking individual files
 as candidates for mandatory locking, and using the existing fcntl()/lockf()
 interface for applying locks just as if they were normal, advisory locks.
 
-Note 1: In saying "file" in the paragraphs above I am actually not telling
-the whole truth. System V locking is based on fcntl(). The granularity of
-fcntl() is such that it allows the locking of byte ranges in files, in addition
-to entire files, so the mandatory locking rules also have byte level
-granularity.
+.. Note::
 
-Note 2: POSIX.1 does not specify any scheme for mandatory locking, despite
-borrowing the fcntl() locking scheme from System V. The mandatory locking
-scheme is defined by the System V Interface Definition (SVID) Version 3.
+   1. In saying "file" in the paragraphs above I am actually not telling
+      the whole truth. System V locking is based on fcntl(). The granularity of
+      fcntl() is such that it allows the locking of byte ranges in files, in
+      addition to entire files, so the mandatory locking rules also have byte
+      level granularity.
+
+   2. POSIX.1 does not specify any scheme for mandatory locking, despite
+      borrowing the fcntl() locking scheme from System V. The mandatory locking
+      scheme is defined by the System V Interface Definition (SVID) Version 3.
 
 2. Marking a file for mandatory locking
 ---------------------------------------
diff --git a/fs/locks.c b/fs/locks.c
index b8a31c1c4fff..1d4f4d5da704 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -61,7 +61,7 @@
  *
  *  Initial implementation of mandatory locks. SunOS turned out to be
  *  a rotten model, so I implemented the "obvious" semantics.
- *  See 'Documentation/filesystems/mandatory-locking.txt' for details.
+ *  See 'Documentation/filesystems/mandatory-locking.rst' for details.
  *  Andy Walker (andy@lysaker.kvaerner.no), April 06, 1996.
  *
  *  Don't allow mandatory locks on mmap()'ed files. Added simple functions to
-- 
2.25.4

