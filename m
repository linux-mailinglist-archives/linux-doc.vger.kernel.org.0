Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFF01B2D93
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2020 18:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgDUQ5Z (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Apr 2020 12:57:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:57242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726245AbgDUQyp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Apr 2020 12:54:45 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F4C82073A;
        Tue, 21 Apr 2020 16:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587488084;
        bh=uKk2xVZ7iuzy3Vn3zXrcx8dp/otKv8pCBqbWa51Dqj0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d522WuBx6JQxLlj38jwiXEqt5yMc25D3cegKjcTEs1D7x7SAhYtm07j6p1zAH/k43
         OTqKQfVFq2BM8D2QYTCBJHsv9l8SdNan8gHpX44dQPYaFWKex3IGMbM9ehvkQTmtAh
         Giu3It7ZwtQBguWREwnynSfl6/67Jlzwv3hcZdAA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jQwAU-00CmE1-9n; Tue, 21 Apr 2020 18:54:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 09/29] docs: filesystems: convert automount-support.txt to ReST
Date:   Tue, 21 Apr 2020 18:54:20 +0200
Message-Id: <46436f998c4a13387d8d6db8d1e7c9a18d02b638.1587487612.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587487612.git.mchehab+huawei@kernel.org>
References: <cover.1587487612.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Add a SPDX header;
- Add a document title;
- Adjust section titles;
- Mark literal blocks as such;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 ...ount-support.txt => automount-support.rst} | 23 +++++++++++--------
 Documentation/filesystems/index.rst           |  2 ++
 2 files changed, 16 insertions(+), 9 deletions(-)
 rename Documentation/filesystems/{automount-support.txt => automount-support.rst} (92%)

diff --git a/Documentation/filesystems/automount-support.txt b/Documentation/filesystems/automount-support.rst
similarity index 92%
rename from Documentation/filesystems/automount-support.txt
rename to Documentation/filesystems/automount-support.rst
index 7d9f82607562..430f0b40796b 100644
--- a/Documentation/filesystems/automount-support.txt
+++ b/Documentation/filesystems/automount-support.rst
@@ -1,3 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+Automount Support
+=================
+
+
 Support is available for filesystems that wish to do automounting
 support (such as kAFS which can be found in fs/afs/ and NFS in
 fs/nfs/). This facility includes allowing in-kernel mounts to be
@@ -5,13 +12,12 @@ performed and mountpoint degradation to be requested. The latter can
 also be requested by userspace.
 
 
-======================
-IN-KERNEL AUTOMOUNTING
+In-Kernel Automounting
 ======================
 
 See section "Mount Traps" of  Documentation/filesystems/autofs.rst
 
-Then from userspace, you can just do something like:
+Then from userspace, you can just do something like::
 
 	[root@andromeda root]# mount -t afs \#root.afs. /afs
 	[root@andromeda root]# ls /afs
@@ -21,7 +27,7 @@ Then from userspace, you can just do something like:
 	[root@andromeda root]# ls /afs/cambridge/afsdoc/
 	ChangeLog  html  LICENSE  pdf  RELNOTES-1.2.2
 
-And then if you look in the mountpoint catalogue, you'll see something like:
+And then if you look in the mountpoint catalogue, you'll see something like::
 
 	[root@andromeda root]# cat /proc/mounts
 	...
@@ -30,8 +36,7 @@ And then if you look in the mountpoint catalogue, you'll see something like:
 	#afsdoc. /afs/cambridge.redhat.com/afsdoc afs rw 0 0
 
 
-===========================
-AUTOMATIC MOUNTPOINT EXPIRY
+Automatic Mountpoint Expiry
 ===========================
 
 Automatic expiration of mountpoints is easy, provided you've mounted the
@@ -43,7 +48,8 @@ To do expiration, you need to follow these steps:
      hung.
 
  (2) When a new mountpoint is created in the ->d_automount method, add
-     the mnt to the list using mnt_set_expiry()
+     the mnt to the list using mnt_set_expiry()::
+
              mnt_set_expiry(newmnt, &afs_vfsmounts);
 
  (3) When you want mountpoints to be expired, call mark_mounts_for_expiry()
@@ -70,8 +76,7 @@ and the copies of those that are on an expiration list will be added to the
 same expiration list.
 
 
-=======================
-USERSPACE DRIVEN EXPIRY
+Userspace Driven Expiry
 =======================
 
 As an alternative, it is possible for userspace to request expiry of any
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 7ed646409030..7fea7c99324e 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -25,6 +25,8 @@ algorithms work.
    locking
    directory-locking
 
+   automount-support
+
    caching/index
 
    porting
-- 
2.25.2

