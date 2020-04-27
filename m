Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06F51BB0B5
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2020 23:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgD0VoC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Apr 2020 17:44:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:43844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbgD0VoC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 Apr 2020 17:44:02 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5757A2070B;
        Mon, 27 Apr 2020 21:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588023840;
        bh=yEZR47UgJyhSSJO4ozelLdV+zJf+BKuMoYnPphHSyNk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YMLU3X2hFJEfyaalFFCweryUgO4Iz80lcpAhkklEhp500sievGaHw9wC/2TBIj/S3
         5ulSjpAWi/ySHQRYLCtQZgp3tcXsWLIQSfzoGCmjl45Y0gXbUL4hZbUJ/CM0R0IDLj
         8K7WSix9dnzgVRjETLOOH5u53rIhe/gaD3UXS4j4=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jTBXi-000IYD-JP; Mon, 27 Apr 2020 23:43:58 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v3.1] docs: filesystems: convert configfs.txt to ReST
Date:   Mon, 27 Apr 2020 23:43:56 +0200
Message-Id: <5f005c5a846b3fd4382a24166a1ba736ff697b86.1588022310.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <c2424ec2ad4d735751434ff7f52144c44aa02d5a.1588021877.git.mchehab+huawei@kernel.org>
References: <c2424ec2ad4d735751434ff7f52144c44aa02d5a.1588021877.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Add a SPDX header;
- Adjust document and section titles;
- Use copyright symbol;
- Some whitespace fixes and new line breaks;
- Mark literal blocks as such;
- Add it to filesystems/index.rst.

Also, as this file is alone on its own dir, and it doesn't
seem too likely that other documents will follow it, let's
move it to the filesystems/ root documentation dir.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

v3.1: Fixed the case at the document title

 .../{configfs/configfs.txt => configfs.rst}   | 131 +++++++++++-------
 Documentation/filesystems/index.rst           |   1 +
 Documentation/iio/iio_configfs.rst            |   2 +-
 Documentation/usb/gadget_configfs.rst         |   4 +-
 fs/configfs/inode.c                           |   2 +-
 fs/configfs/item.c                            |   2 +-
 include/linux/configfs.h                      |   2 +-
 7 files changed, 86 insertions(+), 58 deletions(-)
 rename Documentation/filesystems/{configfs/configfs.txt => configfs.rst} (87%)

diff --git a/Documentation/filesystems/configfs/configfs.txt b/Documentation/filesystems/configfs.rst
similarity index 87%
rename from Documentation/filesystems/configfs/configfs.txt
rename to Documentation/filesystems/configfs.rst
index 16e606c11f40..f8941954c667 100644
--- a/Documentation/filesystems/configfs/configfs.txt
+++ b/Documentation/filesystems/configfs.rst
@@ -1,5 +1,6 @@
-
-configfs - Userspace-driven kernel object configuration.
+=======================================================
+Configfs - Userspace-driven Kernel Object Configuration
+=======================================================
 
 Joel Becker <joel.becker@oracle.com>
 
@@ -9,7 +10,8 @@ Copyright (c) 2005 Oracle Corporation,
 	Joel Becker <joel.becker@oracle.com>
 
 
-[What is configfs?]
+What is configfs?
+=================
 
 configfs is a ram-based filesystem that provides the converse of
 sysfs's functionality.  Where sysfs is a filesystem-based view of
@@ -35,10 +37,11 @@ kernel modules backing the items must respond to this.
 Both sysfs and configfs can and should exist together on the same
 system.  One is not a replacement for the other.
 
-[Using configfs]
+Using configfs
+==============
 
 configfs can be compiled as a module or into the kernel.  You can access
-it by doing
+it by doing::
 
 	mount -t configfs none /config
 
@@ -56,28 +59,29 @@ values.  Don't mix more than one attribute in one attribute file.
 There are two types of configfs attributes:
 
 * Normal attributes, which similar to sysfs attributes, are small ASCII text
-files, with a maximum size of one page (PAGE_SIZE, 4096 on i386).  Preferably
-only one value per file should be used, and the same caveats from sysfs apply.
-Configfs expects write(2) to store the entire buffer at once.  When writing to
-normal configfs attributes, userspace processes should first read the entire
-file, modify the portions they wish to change, and then write the entire
-buffer back.
+  files, with a maximum size of one page (PAGE_SIZE, 4096 on i386).  Preferably
+  only one value per file should be used, and the same caveats from sysfs apply.
+  Configfs expects write(2) to store the entire buffer at once.  When writing to
+  normal configfs attributes, userspace processes should first read the entire
+  file, modify the portions they wish to change, and then write the entire
+  buffer back.
 
 * Binary attributes, which are somewhat similar to sysfs binary attributes,
-but with a few slight changes to semantics.  The PAGE_SIZE limitation does not
-apply, but the whole binary item must fit in single kernel vmalloc'ed buffer.
-The write(2) calls from user space are buffered, and the attributes'
-write_bin_attribute method will be invoked on the final close, therefore it is
-imperative for user-space to check the return code of close(2) in order to
-verify that the operation finished successfully.
-To avoid a malicious user OOMing the kernel, there's a per-binary attribute
-maximum buffer value.
+  but with a few slight changes to semantics.  The PAGE_SIZE limitation does not
+  apply, but the whole binary item must fit in single kernel vmalloc'ed buffer.
+  The write(2) calls from user space are buffered, and the attributes'
+  write_bin_attribute method will be invoked on the final close, therefore it is
+  imperative for user-space to check the return code of close(2) in order to
+  verify that the operation finished successfully.
+  To avoid a malicious user OOMing the kernel, there's a per-binary attribute
+  maximum buffer value.
 
 When an item needs to be destroyed, remove it with rmdir(2).  An
 item cannot be destroyed if any other item has a link to it (via
 symlink(2)).  Links can be removed via unlink(2).
 
-[Configuring FakeNBD: an Example]
+Configuring FakeNBD: an Example
+===============================
 
 Imagine there's a Network Block Device (NBD) driver that allows you to
 access remote block devices.  Call it FakeNBD.  FakeNBD uses configfs
@@ -86,14 +90,14 @@ sysadmins use to configure FakeNBD, but somehow that program has to tell
 the driver about it.  Here's where configfs comes in.
 
 When the FakeNBD driver is loaded, it registers itself with configfs.
-readdir(3) sees this just fine:
+readdir(3) sees this just fine::
 
 	# ls /config
 	fakenbd
 
 A fakenbd connection can be created with mkdir(2).  The name is
 arbitrary, but likely the tool will make some use of the name.  Perhaps
-it is a uuid or a disk name:
+it is a uuid or a disk name::
 
 	# mkdir /config/fakenbd/disk1
 	# ls /config/fakenbd/disk1
@@ -102,7 +106,7 @@ it is a uuid or a disk name:
 The target attribute contains the IP address of the server FakeNBD will
 connect to.  The device attribute is the device on the server.
 Predictably, the rw attribute determines whether the connection is
-read-only or read-write.
+read-only or read-write::
 
 	# echo 10.0.0.1 > /config/fakenbd/disk1/target
 	# echo /dev/sda1 > /config/fakenbd/disk1/device
@@ -111,7 +115,8 @@ read-only or read-write.
 That's it.  That's all there is.  Now the device is configured, via the
 shell no less.
 
-[Coding With configfs]
+Coding With configfs
+====================
 
 Every object in configfs is a config_item.  A config_item reflects an
 object in the subsystem.  It has attributes that match values on that
@@ -130,7 +135,10 @@ appears as a directory at the top of the configfs filesystem.  A
 subsystem is also a config_group, and can do everything a config_group
 can.
 
-[struct config_item]
+struct config_item
+==================
+
+::
 
 	struct config_item {
 		char                    *ci_name;
@@ -168,7 +176,10 @@ By itself, a config_item cannot do much more than appear in configfs.
 Usually a subsystem wants the item to display and/or store attributes,
 among other things.  For that, it needs a type.
 
-[struct config_item_type]
+struct config_item_type
+=======================
+
+::
 
 	struct configfs_item_operations {
 		void (*release)(struct config_item *);
@@ -192,7 +203,10 @@ allocated dynamically will need to provide the ct_item_ops->release()
 method.  This method is called when the config_item's reference count
 reaches zero.
 
-[struct configfs_attribute]
+struct configfs_attribute
+=========================
+
+::
 
 	struct configfs_attribute {
 		char                    *ca_name;
@@ -214,7 +228,10 @@ be called whenever userspace asks for a read(2) on the attribute.  If an
 attribute is writable and provides a ->store  method, that method will be
 be called whenever userspace asks for a write(2) on the attribute.
 
-[struct configfs_bin_attribute]
+struct configfs_bin_attribute
+=============================
+
+::
 
 	struct configfs_bin_attribute {
 		struct configfs_attribute	cb_attr;
@@ -240,11 +257,12 @@ will happen for write(2). The reads/writes are bufferred so only a
 single read/write will occur; the attributes' need not concern itself
 with it.
 
-[struct config_group]
+struct config_group
+===================
 
 A config_item cannot live in a vacuum.  The only way one can be created
 is via mkdir(2) on a config_group.  This will trigger creation of a
-child item.
+child item::
 
 	struct config_group {
 		struct config_item		cg_item;
@@ -264,7 +282,7 @@ The config_group structure contains a config_item.  Properly configuring
 that item means that a group can behave as an item in its own right.
 However, it can do more: it can create child items or groups.  This is
 accomplished via the group operations specified on the group's
-config_item_type.
+config_item_type::
 
 	struct configfs_group_operations {
 		struct config_item *(*make_item)(struct config_group *group,
@@ -279,7 +297,8 @@ config_item_type.
 	};
 
 A group creates child items by providing the
-ct_group_ops->make_item() method.  If provided, this method is called from mkdir(2) in the group's directory.  The subsystem allocates a new
+ct_group_ops->make_item() method.  If provided, this method is called from
+mkdir(2) in the group's directory.  The subsystem allocates a new
 config_item (or more likely, its container structure), initializes it,
 and returns it to configfs.  Configfs will then populate the filesystem
 tree to reflect the new item.
@@ -296,13 +315,14 @@ upon item allocation.  If a subsystem has no work to do, it may omit
 the ct_group_ops->drop_item() method, and configfs will call
 config_item_put() on the item on behalf of the subsystem.
 
-IMPORTANT: drop_item() is void, and as such cannot fail.  When rmdir(2)
-is called, configfs WILL remove the item from the filesystem tree
-(assuming that it has no children to keep it busy).  The subsystem is
-responsible for responding to this.  If the subsystem has references to
-the item in other threads, the memory is safe.  It may take some time
-for the item to actually disappear from the subsystem's usage.  But it
-is gone from configfs.
+Important:
+   drop_item() is void, and as such cannot fail.  When rmdir(2)
+   is called, configfs WILL remove the item from the filesystem tree
+   (assuming that it has no children to keep it busy).  The subsystem is
+   responsible for responding to this.  If the subsystem has references to
+   the item in other threads, the memory is safe.  It may take some time
+   for the item to actually disappear from the subsystem's usage.  But it
+   is gone from configfs.
 
 When drop_item() is called, the item's linkage has already been torn
 down.  It no longer has a reference on its parent and has no place in
@@ -319,10 +339,11 @@ is implemented in the configfs rmdir(2) code.  ->drop_item() will not be
 called, as the item has not been dropped.  rmdir(2) will fail, as the
 directory is not empty.
 
-[struct configfs_subsystem]
+struct configfs_subsystem
+=========================
 
 A subsystem must register itself, usually at module_init time.  This
-tells configfs to make the subsystem appear in the file tree.
+tells configfs to make the subsystem appear in the file tree::
 
 	struct configfs_subsystem {
 		struct config_group	su_group;
@@ -332,17 +353,19 @@ tells configfs to make the subsystem appear in the file tree.
 	int configfs_register_subsystem(struct configfs_subsystem *subsys);
 	void configfs_unregister_subsystem(struct configfs_subsystem *subsys);
 
-	A subsystem consists of a toplevel config_group and a mutex.
+A subsystem consists of a toplevel config_group and a mutex.
 The group is where child config_items are created.  For a subsystem,
 this group is usually defined statically.  Before calling
 configfs_register_subsystem(), the subsystem must have initialized the
 group via the usual group _init() functions, and it must also have
 initialized the mutex.
-	When the register call returns, the subsystem is live, and it
+
+When the register call returns, the subsystem is live, and it
 will be visible via configfs.  At that point, mkdir(2) can be called and
 the subsystem must be ready for it.
 
-[An Example]
+An Example
+==========
 
 The best example of these basic concepts is the simple_children
 subsystem/group and the simple_child item in
@@ -350,7 +373,8 @@ samples/configfs/configfs_sample.c. It shows a trivial object displaying
 and storing an attribute, and a simple group creating and destroying
 these children.
 
-[Hierarchy Navigation and the Subsystem Mutex]
+Hierarchy Navigation and the Subsystem Mutex
+============================================
 
 There is an extra bonus that configfs provides.  The config_groups and
 config_items are arranged in a hierarchy due to the fact that they
@@ -375,7 +399,8 @@ be in its parent's cg_children list for the same duration.  This allows
 a subsystem to trust ci_parent and cg_children while they hold the
 mutex.
 
-[Item Aggregation Via symlink(2)]
+Item Aggregation Via symlink(2)
+===============================
 
 configfs provides a simple group via the group->item parent/child
 relationship.  Often, however, a larger environment requires aggregation
@@ -403,7 +428,8 @@ A config_item cannot be removed while it links to any other item, nor
 can it be removed while an item links to it.  Dangling symlinks are not
 allowed in configfs.
 
-[Automatically Created Subgroups]
+Automatically Created Subgroups
+===============================
 
 A new config_group may want to have two types of child config_items.
 While this could be codified by magic names in ->make_item(), it is much
@@ -433,7 +459,8 @@ As a consequence of this, default groups cannot be removed directly via
 rmdir(2).  They also are not considered when rmdir(2) on the parent
 group is checking for children.
 
-[Dependent Subsystems]
+Dependent Subsystems
+====================
 
 Sometimes other drivers depend on particular configfs items.  For
 example, ocfs2 mounts depend on a heartbeat region item.  If that
@@ -460,9 +487,11 @@ succeeds, then heartbeat knows the region is safe to give to ocfs2.
 If it fails, it was being torn down anyway, and heartbeat can gracefully
 pass up an error.
 
-[Committable Items]
+Committable Items
+=================
 
-NOTE: Committable items are currently unimplemented.
+Note:
+     Committable items are currently unimplemented.
 
 Some config_items cannot have a valid initial state.  That is, no
 default values can be specified for the item's attributes such that the
@@ -504,5 +533,3 @@ As rmdir(2) does not work in the "live" directory, an item must be
 shutdown, or "uncommitted".  Again, this is done via rename(2), this
 time from the "live" directory back to the "pending" one.  The subsystem
 is notified by the ct_group_ops->uncommit_object() method.
-
-
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index a4fefb62c931..4c536e66dc4c 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -76,6 +76,7 @@ Documentation for filesystem implementations.
    cifs/cifsroot
    ceph
    coda
+   configfs
    cramfs
    debugfs
    dlmfs
diff --git a/Documentation/iio/iio_configfs.rst b/Documentation/iio/iio_configfs.rst
index ecbfdb3afef7..6e38cbbd2981 100644
--- a/Documentation/iio/iio_configfs.rst
+++ b/Documentation/iio/iio_configfs.rst
@@ -9,7 +9,7 @@ Configfs is a filesystem-based manager of kernel objects. IIO uses some
 objects that could be easily configured using configfs (e.g.: devices,
 triggers).
 
-See Documentation/filesystems/configfs/configfs.txt for more information
+See Documentation/filesystems/configfs.rst for more information
 about how configfs works.
 
 2. Usage
diff --git a/Documentation/usb/gadget_configfs.rst b/Documentation/usb/gadget_configfs.rst
index 54fb08baae22..158e48dab586 100644
--- a/Documentation/usb/gadget_configfs.rst
+++ b/Documentation/usb/gadget_configfs.rst
@@ -24,7 +24,7 @@ Linux provides a number of functions for gadgets to use.
 Creating a gadget means deciding what configurations there will be
 and which functions each configuration will provide.
 
-Configfs (please see `Documentation/filesystems/configfs/*`) lends itself nicely
+Configfs (please see `Documentation/filesystems/configfs.rst`) lends itself nicely
 for the purpose of telling the kernel about the above mentioned decision.
 This document is about how to do it.
 
@@ -354,7 +354,7 @@ the directories in general can be named at will. A group can have
 a number of its default sub-groups created automatically.
 
 For more information on configfs please see
-`Documentation/filesystems/configfs/*`.
+`Documentation/filesystems/configfs.rst`.
 
 The concepts described above translate to USB gadgets like this:
 
diff --git a/fs/configfs/inode.c b/fs/configfs/inode.c
index fd0b5dd68f9e..8bd6a883c94c 100644
--- a/fs/configfs/inode.c
+++ b/fs/configfs/inode.c
@@ -9,7 +9,7 @@
  *
  * configfs Copyright (C) 2005 Oracle.  All rights reserved.
  *
- * Please see Documentation/filesystems/configfs/configfs.txt for more
+ * Please see Documentation/filesystems/configfs.rst for more
  * information.
  */
 
diff --git a/fs/configfs/item.c b/fs/configfs/item.c
index 6e0f1fcb8a5b..704a4356f137 100644
--- a/fs/configfs/item.c
+++ b/fs/configfs/item.c
@@ -9,7 +9,7 @@
  *
  * configfs Copyright (C) 2005 Oracle.  All rights reserved.
  *
- * Please see the file Documentation/filesystems/configfs/configfs.txt for
+ * Please see the file Documentation/filesystems/configfs.rst for
  * critical information about using the config_item interface.
  */
 
diff --git a/include/linux/configfs.h b/include/linux/configfs.h
index fa9490a8874c..2e8c69b43c64 100644
--- a/include/linux/configfs.h
+++ b/include/linux/configfs.h
@@ -13,7 +13,7 @@
  *
  * configfs Copyright (C) 2005 Oracle.  All rights reserved.
  *
- * Please read Documentation/filesystems/configfs/configfs.txt before using
+ * Please read Documentation/filesystems/configfs.rst before using
  * the configfs interface, ESPECIALLY the parts about reference counts and
  * item destructors.
  */
-- 
2.25.4


