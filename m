Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2C01B2D92
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2020 18:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbgDUQyp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Apr 2020 12:54:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:56944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725990AbgDUQyo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Apr 2020 12:54:44 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EFC8920735;
        Tue, 21 Apr 2020 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587488084;
        bh=1kWPdkZlddjo2q8OT55/S/qBNHNKq4K06TlfPFwAU7o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zbzEmAD0tmuMF7hOffBapQE8lLQNX2Q/RpSNxsZMnvI3guRp9QzyliutZPRN9DR8p
         bKeOOOf88ob419T5EkjDUmdyODUjPQjMAhnAIg9QF1RDo19MkbO+xVpDgsBHX/OmE2
         nNZ8hzo73JbtfOEbsSdR20YTbyFTxvHzltMu6o/I=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jQwAU-00CmDq-7T; Tue, 21 Apr 2020 18:54:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 07/29] docs: filesystems: convert cifs/cifsroot.txt to ReST
Date:   Tue, 21 Apr 2020 18:54:18 +0200
Message-Id: <9e2f27e899f69bd49fb1c94482b039bda11f7bdf.1587487612.git.mchehab+huawei@kernel.org>
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
- Adjust document title;
- Some whitespace fixes and new line breaks;
- Mark literal blocks as such;
- Add it to filesystems/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../cifs/{cifsroot.txt => cifsroot.rst}       | 56 +++++++++++--------
 Documentation/filesystems/index.rst           |  1 +
 2 files changed, 33 insertions(+), 24 deletions(-)
 rename Documentation/filesystems/cifs/{cifsroot.txt => cifsroot.rst} (72%)

diff --git a/Documentation/filesystems/cifs/cifsroot.txt b/Documentation/filesystems/cifs/cifsroot.rst
similarity index 72%
rename from Documentation/filesystems/cifs/cifsroot.txt
rename to Documentation/filesystems/cifs/cifsroot.rst
index 947b7ec6ce9e..4930bb443134 100644
--- a/Documentation/filesystems/cifs/cifsroot.txt
+++ b/Documentation/filesystems/cifs/cifsroot.rst
@@ -1,7 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================
 Mounting root file system via SMB (cifs.ko)
 ===========================================
 
 Written 2019 by Paulo Alcantara <palcantara@suse.de>
+
 Written 2019 by Aurelien Aptel <aaptel@suse.com>
 
 The CONFIG_CIFS_ROOT option enables experimental root file system
@@ -32,7 +36,7 @@ Server configuration
 ====================
 
 To enable SMB1+UNIX extensions you will need to set these global
-settings in Samba smb.conf:
+settings in Samba smb.conf::
 
     [global]
     server min protocol = NT1
@@ -41,12 +45,16 @@ settings in Samba smb.conf:
 Kernel command line
 ===================
 
-root=/dev/cifs
+::
+
+    root=/dev/cifs
 
 This is just a virtual device that basically tells the kernel to mount
 the root file system via SMB protocol.
 
-cifsroot=//<server-ip>/<share>[,options]
+::
+
+    cifsroot=//<server-ip>/<share>[,options]
 
 Enables the kernel to mount the root file system via SMB that are
 located in the <server-ip> and <share> specified in this option.
@@ -65,33 +73,33 @@ options
 Examples
 ========
 
-Export root file system as a Samba share in smb.conf file.
+Export root file system as a Samba share in smb.conf file::
 
-...
-[linux]
-	path = /path/to/rootfs
-	read only = no
-	guest ok = yes
-	force user = root
-	force group = root
-	browseable = yes
-	writeable = yes
-	admin users = root
-	public = yes
-	create mask = 0777
-	directory mask = 0777
-...
+    ...
+    [linux]
+	    path = /path/to/rootfs
+	    read only = no
+	    guest ok = yes
+	    force user = root
+	    force group = root
+	    browseable = yes
+	    writeable = yes
+	    admin users = root
+	    public = yes
+	    create mask = 0777
+	    directory mask = 0777
+    ...
 
-Restart smb service.
+Restart smb service::
 
-# systemctl restart smb
+    # systemctl restart smb
 
 Test it under QEMU on a kernel built with CONFIG_CIFS_ROOT and
-CONFIG_IP_PNP options enabled.
+CONFIG_IP_PNP options enabled::
 
-# qemu-system-x86_64 -enable-kvm -cpu host -m 1024 \
-  -kernel /path/to/linux/arch/x86/boot/bzImage -nographic \
-  -append "root=/dev/cifs rw ip=dhcp cifsroot=//10.0.2.2/linux,username=foo,password=bar console=ttyS0 3"
+    # qemu-system-x86_64 -enable-kvm -cpu host -m 1024 \
+    -kernel /path/to/linux/arch/x86/boot/bzImage -nographic \
+    -append "root=/dev/cifs rw ip=dhcp cifsroot=//10.0.2.2/linux,username=foo,password=bar console=ttyS0 3"
 
 
 1: https://wiki.samba.org/index.php/UNIX_Extensions
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index f8781c13aee3..2ad8a207523e 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -59,6 +59,7 @@ Documentation for filesystem implementations.
    befs
    bfs
    btrfs
+   cifs/cifsroot
    ceph
    cramfs
    debugfs
-- 
2.25.2

