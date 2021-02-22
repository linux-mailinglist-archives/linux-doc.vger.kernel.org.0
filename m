Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A75D320F6C
	for <lists+linux-doc@lfdr.de>; Mon, 22 Feb 2021 03:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbhBVCaN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 21 Feb 2021 21:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbhBVCaM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 21 Feb 2021 21:30:12 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673E5C06178A
        for <linux-doc@vger.kernel.org>; Sun, 21 Feb 2021 18:29:26 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id x14so11369460qkm.2
        for <linux-doc@vger.kernel.org>; Sun, 21 Feb 2021 18:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NTi+3CpDYqKWtig4vqNBTdtWuB2xlEfIIptkvnBCICA=;
        b=GTbIQ6vqXFAKO7XGl39442D+Kx7nKjEKVbkYo9QSF9xHbXIl4il+ocohqB9AcoX29S
         3mrKCjl2HXTrGRssuxdlD8J4rpAjSQA1+OuP9noyBlNzpUr7EEy2uvRdwXWDrpOfjwxI
         GbUSfK0qJ05fmISdhMj57xp2R4UaOAVkeWJyrz/dkAX97sbi+gYDFrtfSQsENUd8jLo2
         6jvEB7w2HEpGONtrN/D5qTVu9s8VXJCsjSTN/yWk8awlY7tAPYeG2SJRZm9QTBcJNQxz
         te05GBmxG9kkbvo8DXn7fk0IxJDglnP3XZrAtSYg6aDmzeMZA40IcDiq8mPg6k98bZWB
         P3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NTi+3CpDYqKWtig4vqNBTdtWuB2xlEfIIptkvnBCICA=;
        b=LOptlO58XxtFv5YKU1Mv73V9/Du6ZSatzLK8wISqJCtzcb7z8nviqr0/B4wG6pSoJC
         58h+A3ERGsYD1LpfMtHCwnoPF6NuN+cMyqs324w2nD5UqxY6Lix6Pr2Fa9BuX7xMCL/T
         rYfqkb2pyvELioHm2ulv/sBaxAQyZcn3OamPO7fOXOzJCAj/b+P4VJXbCTHrKoKtQHsU
         PA2LG/EUSmfBNUutA/cx7yEidcSeFRbEmYAwRZOW7x3bY7/v/K/MiaOcgjjpCv6xURwy
         DSPdcLy+NMVGzutuuy2WLnQwS/fzuWg0JwyIzf7FdBzSi/+LppuPqJt2lp3oTKzQ+61a
         AbVA==
X-Gm-Message-State: AOAM530PrUVAYWoxtL4Y4AYqVGSG7XgjdW/mSgokyIU1kW9Gi+zusjHU
        GBLo2SnN3unsNF29PipAoRc/JpmmDhikmQ==
X-Google-Smtp-Source: ABdhPJxR3+vGujJgqgVlAN+PMoUY7vhLItHF6N7fNnxbT6qPoAoX2YEJYTP5DqYr5DnCYPOsHk+ZWQ==
X-Received: by 2002:a05:620a:400e:: with SMTP id h14mr19225027qko.244.1613960964893;
        Sun, 21 Feb 2021 18:29:24 -0800 (PST)
Received: from localhost.localdomain ([189.120.76.30])
        by smtp.googlemail.com with ESMTPSA id i75sm5874757qke.47.2021.02.21.18.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 18:29:24 -0800 (PST)
From:   Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] docs: convert dax.txt to rst
Date:   Sun, 21 Feb 2021 23:29:10 -0300
Message-Id: <20210222022910.32613-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Change the file extension and add the rst constructs to integrate this
doc to the documentation infrastructure and take advantage of rst
features.

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 Documentation/filesystems/dax.rst   | 291 ++++++++++++++++++++++++++++
 Documentation/filesystems/dax.txt   | 257 ------------------------
 Documentation/filesystems/index.rst |   1 +
 3 files changed, 292 insertions(+), 257 deletions(-)
 create mode 100644 Documentation/filesystems/dax.rst
 delete mode 100644 Documentation/filesystems/dax.txt

diff --git a/Documentation/filesystems/dax.rst b/Documentation/filesystems/dax.rst
new file mode 100644
index 000000000000..9a1b8fd9e82b
--- /dev/null
+++ b/Documentation/filesystems/dax.rst
@@ -0,0 +1,291 @@
+=======================
+Direct Access for files
+=======================
+
+Motivation
+----------
+
+The page cache is usually used to buffer reads and writes to files.
+It is also used to provide the pages which are mapped into userspace
+by a call to mmap.
+
+For block devices that are memory-like, the page cache pages would be
+unnecessary copies of the original storage.  The `DAX` code removes the
+extra copy by performing reads and writes directly to the storage device.
+For file mappings, the storage device is mapped directly into userspace.
+
+
+Usage
+-----
+
+If you have a block device which supports `DAX`, you can make a filesystem
+on it as usual.  The `DAX` code currently only supports files with a block
+size equal to your kernel's `PAGE_SIZE`, so you may need to specify a block
+size when creating the filesystem.
+
+Currently 3 filesystems support `DAX`: ext2, ext4 and xfs.  Enabling `DAX` on them
+is different.
+
+Enabling DAX on ext2
+--------------------
+
+When mounting the filesystem, use the ``-o dax`` option on the command line or
+add 'dax' to the options in ``/etc/fstab``.  This works to enable `DAX` on all files
+within the filesystem.  It is equivalent to the ``-o dax=always`` behavior below.
+
+
+Enabling DAX on xfs and ext4
+----------------------------
+
+Summary
+-------
+
+ 1. There exists an in-kernel file access mode flag `S_DAX` that corresponds to
+    the statx flag `STATX_ATTR_DAX`.  See the manpage for statx(2) for details
+    about this access mode.
+
+ 2. There exists a persistent flag `FS_XFLAG_DAX` that can be applied to regular
+    files and directories. This advisory flag can be set or cleared at any
+    time, but doing so does not immediately affect the `S_DAX` state.
+
+ 3. If the persistent `FS_XFLAG_DAX` flag is set on a directory, this flag will
+    be inherited by all regular files and subdirectories that are subsequently
+    created in this directory. Files and subdirectories that exist at the time
+    this flag is set or cleared on the parent directory are not modified by
+    this modification of the parent directory.
+
+ 4. There exist dax mount options which can override `FS_XFLAG_DAX` in the
+    setting of the `S_DAX` flag.  Given underlying storage which supports `DAX` the
+    following hold:
+
+    ``-o dax=inode``  means "follow `FS_XFLAG_DAX`" and is the default.
+
+    ``-o dax=never``  means "never set `S_DAX`, ignore `FS_XFLAG_DAX`."
+
+    ``-o dax=always`` means "always set `S_DAX` ignore `FS_XFLAG_DAX`."
+
+    ``-o dax``      is a legacy option which is an alias for ``dax=always``.
+
+    .. warning::
+
+      The option ``-o dax`` may be removed in the future so ``-o dax=always`` is
+      the preferred method for specifying this behavior.
+
+    .. note::
+
+      Modifications to and the inheritance behavior of `FS_XFLAG_DAX` remain
+      the same even when the filesystem is mounted with a dax option.  However,
+      in-core inode state (`S_DAX`) will be overridden until the filesystem is
+      remounted with dax=inode and the inode is evicted from kernel memory.
+
+ 5. The `S_DAX` policy can be changed via:
+
+    a) Setting the parent directory `FS_XFLAG_DAX` as needed before files are
+       created
+
+    b) Setting the appropriate dax="foo" mount option
+
+    c) Changing the `FS_XFLAG_DAX` flag on existing regular files and
+       directories.  This has runtime constraints and limitations that are
+       described in 6) below.
+
+ 6. When changing the `S_DAX` policy via toggling the persistent `FS_XFLAG_DAX`
+    flag, the change to existing regular files won't take effect until the
+    files are closed by all processes.
+
+
+Details
+-------
+
+There are 2 per-file dax flags.  One is a persistent inode setting (`FS_XFLAG_DAX`)
+and the other is a volatile flag indicating the active state of the feature
+(`S_DAX`).
+
+`FS_XFLAG_DAX` is preserved within the filesystem.  This persistent config
+setting can be set, cleared and/or queried using the `FS_IOC_FS`[`GS`]`ETXATTR` ioctl
+(see ioctl_xfs_fsgetxattr(2)) or an utility such as 'xfs_io'.
+
+New files and directories automatically inherit `FS_XFLAG_DAX` from
+their parent directory **when created**.  Therefore, setting `FS_XFLAG_DAX` at
+directory creation time can be used to set a default behavior for an entire
+sub-tree.
+
+To clarify inheritance, here are 3 examples:
+
+Example A:
+
+.. code-block:: shell
+
+  mkdir -p a/b/c
+  xfs_io -c 'chattr +x' a
+  mkdir a/b/c/d
+  mkdir a/e
+
+  ------[outcome]------
+
+  dax: a,e
+  no dax: b,c,d
+
+Example B:
+
+.. code-block:: shell
+
+  mkdir a
+  xfs_io -c 'chattr +x' a
+  mkdir -p a/b/c/d
+
+  ------[outcome]------
+
+  dax: a,b,c,d
+  no dax:
+
+Example C:
+
+.. code-block:: shell
+
+  mkdir -p a/b/c
+  xfs_io -c 'chattr +x' c
+  mkdir a/b/c/d
+
+  ------[outcome]------
+
+  dax: c,d
+  no dax: a,b
+
+The current enabled state (`S_DAX`) is set when a file inode is instantiated in
+memory by the kernel.  It is set based on the underlying media support, the
+value of `FS_XFLAG_DAX` and the filesystem's dax mount option.
+
+statx can be used to query `S_DAX`.
+
+.. note::
+
+  That only regular files will ever have `S_DAX` set and therefore statx
+  will never indicate that `S_DAX` is set on directories.
+
+Setting the `FS_XFLAG_DAX` flag (specifically or through inheritance) occurs even
+if the underlying media does not support dax and/or the filesystem is
+overridden with a mount option.
+
+
+Implementation Tips for Block Driver Writers
+--------------------------------------------
+
+To support `DAX` in your block driver, implement the 'direct_access'
+block device operation.  It is used to translate the sector number
+(expressed in units of 512-byte sectors) to a page frame number (pfn)
+that identifies the physical page for the memory.  It also returns a
+kernel virtual address that can be used to access the memory.
+
+The direct_access method takes a 'size' parameter that indicates the
+number of bytes being requested.  The function should return the number
+of bytes that can be contiguously accessed at that offset.  It may also
+return a negative errno if an error occurs.
+
+In order to support this method, the storage must be byte-accessible by
+the CPU at all times.  If your device uses paging techniques to expose
+a large amount of memory through a smaller window, then you cannot
+implement direct_access.  Equally, if your device can occasionally
+stall the CPU for an extended period, you should also not attempt to
+implement direct_access.
+
+These block devices may be used for inspiration:
+- brd: RAM backed block device driver
+- dcssblk: s390 dcss block device driver
+- pmem: NVDIMM persistent memory driver
+
+
+Implementation Tips for Filesystem Writers
+------------------------------------------
+
+Filesystem support consists of:
+
+* Adding support to mark inodes as being `DAX` by setting the `S_DAX` flag in
+  i_flags
+* Implementing ->read_iter and ->write_iter operations which use
+  :c:func:`dax_iomap_rw()` when inode has `S_DAX` flag set
+* Implementing an mmap file operation for `DAX` files which sets the
+  `VM_MIXEDMAP` and `VM_HUGEPAGE` flags on the `VMA`, and setting the vm_ops to
+  include handlers for fault, pmd_fault, page_mkwrite, pfn_mkwrite. These
+  handlers should probably call :c:func:`dax_iomap_fault()` passing the
+  appropriate fault size and iomap operations.
+* Calling :c:func:`iomap_zero_range()` passing appropriate iomap operations
+  instead of :c:func:`block_truncate_page()` for `DAX` files
+* Ensuring that there is sufficient locking between reads, writes,
+  truncates and page faults
+
+The iomap handlers for allocating blocks must make sure that allocated blocks
+are zeroed out and converted to written extents before being returned to avoid
+exposure of uninitialized data through mmap.
+
+These filesystems may be used for inspiration:
+
+.. seealso::
+
+  ext2: see Documentation/filesystems/ext2.rst
+
+.. seealso::
+
+  xfs:  see Documentation/admin-guide/xfs.rst
+
+.. seealso::
+
+  ext4: see Documentation/filesystems/ext4/
+
+
+Handling Media Errors
+---------------------
+
+The libnvdimm subsystem stores a record of known media error locations for
+each pmem block device (in gendisk->badblocks). If we fault at such location,
+or one with a latent error not yet discovered, the application can expect
+to receive a `SIGBUS`. Libnvdimm also allows clearing of these errors by simply
+writing the affected sectors (through the pmem driver, and if the underlying
+NVDIMM supports the clear_poison DSM defined by ACPI).
+
+Since `DAX` IO normally doesn't go through the ``driver/bio`` path, applications or
+sysadmins have an option to restore the lost data from a prior ``backup/inbuilt``
+redundancy in the following ways:
+
+1. Delete the affected file, and restore from a backup (sysadmin route):
+   This will free the filesystem blocks that were being used by the file,
+   and the next time they're allocated, they will be zeroed first, which
+   happens through the driver, and will clear bad sectors.
+
+2. Truncate or hole-punch the part of the file that has a bad-block (at least
+   an entire aligned sector has to be hole-punched, but not necessarily an
+   entire filesystem block).
+
+These are the two basic paths that allow `DAX` filesystems to continue operating
+in the presence of media errors. More robust error recovery mechanisms can be
+built on top of this in the future, for example, involving redundancy/mirroring
+provided at the block layer through DM, or additionally, at the filesystem
+level. These would have to rely on the above two tenets, that error clearing
+can happen either by sending an IO through the driver, or zeroing (also through
+the driver).
+
+
+Shortcomings
+------------
+
+Even if the kernel or its modules are stored on a filesystem that supports
+`DAX` on a block device that supports `DAX`, they will still be copied into RAM.
+
+The DAX code does not work correctly on architectures which have virtually
+mapped caches such as ARM, MIPS and SPARC.
+
+Calling :c:func:`get_user_pages()` on a range of user memory that has been
+mmaped from a `DAX` file will fail when there are no 'struct page' to describe
+those pages.  This problem has been addressed in some device drivers
+by adding optional struct page support for pages under the control of
+the driver (see `CONFIG_NVDIMM_PFN` in ``drivers/nvdimm`` for an example of
+how to do this). In the non struct page cases `O_DIRECT` reads/writes to
+those memory ranges from a non-`DAX` file will fail 
+
+
+.. note::
+
+  `O_DIRECT` reads/writes _of a `DAX` file do work, it is the memory that
+  is being accessed that is key here).  Other things that will not work in
+  the non struct page case include RDMA, :c:func:`sendfile()` and
+  :c:func:`splice()`.
diff --git a/Documentation/filesystems/dax.txt b/Documentation/filesystems/dax.txt
deleted file mode 100644
index e03c20564f3a..000000000000
--- a/Documentation/filesystems/dax.txt
+++ /dev/null
@@ -1,257 +0,0 @@
-Direct Access for files
------------------------
-
-Motivation
-----------
-
-The page cache is usually used to buffer reads and writes to files.
-It is also used to provide the pages which are mapped into userspace
-by a call to mmap.
-
-For block devices that are memory-like, the page cache pages would be
-unnecessary copies of the original storage.  The DAX code removes the
-extra copy by performing reads and writes directly to the storage device.
-For file mappings, the storage device is mapped directly into userspace.
-
-
-Usage
------
-
-If you have a block device which supports DAX, you can make a filesystem
-on it as usual.  The DAX code currently only supports files with a block
-size equal to your kernel's PAGE_SIZE, so you may need to specify a block
-size when creating the filesystem.
-
-Currently 3 filesystems support DAX: ext2, ext4 and xfs.  Enabling DAX on them
-is different.
-
-Enabling DAX on ext2
------------------------------
-
-When mounting the filesystem, use the "-o dax" option on the command line or
-add 'dax' to the options in /etc/fstab.  This works to enable DAX on all files
-within the filesystem.  It is equivalent to the '-o dax=always' behavior below.
-
-
-Enabling DAX on xfs and ext4
-----------------------------
-
-Summary
--------
-
- 1. There exists an in-kernel file access mode flag S_DAX that corresponds to
-    the statx flag STATX_ATTR_DAX.  See the manpage for statx(2) for details
-    about this access mode.
-
- 2. There exists a persistent flag FS_XFLAG_DAX that can be applied to regular
-    files and directories. This advisory flag can be set or cleared at any
-    time, but doing so does not immediately affect the S_DAX state.
-
- 3. If the persistent FS_XFLAG_DAX flag is set on a directory, this flag will
-    be inherited by all regular files and subdirectories that are subsequently
-    created in this directory. Files and subdirectories that exist at the time
-    this flag is set or cleared on the parent directory are not modified by
-    this modification of the parent directory.
-
- 4. There exist dax mount options which can override FS_XFLAG_DAX in the
-    setting of the S_DAX flag.  Given underlying storage which supports DAX the
-    following hold:
-
-    "-o dax=inode"  means "follow FS_XFLAG_DAX" and is the default.
-
-    "-o dax=never"  means "never set S_DAX, ignore FS_XFLAG_DAX."
-
-    "-o dax=always" means "always set S_DAX ignore FS_XFLAG_DAX."
-
-    "-o dax"        is a legacy option which is an alias for "dax=always".
-		    This may be removed in the future so "-o dax=always" is
-		    the preferred method for specifying this behavior.
-
-    NOTE: Modifications to and the inheritance behavior of FS_XFLAG_DAX remain
-    the same even when the filesystem is mounted with a dax option.  However,
-    in-core inode state (S_DAX) will be overridden until the filesystem is
-    remounted with dax=inode and the inode is evicted from kernel memory.
-
- 5. The S_DAX policy can be changed via:
-
-    a) Setting the parent directory FS_XFLAG_DAX as needed before files are
-       created
-
-    b) Setting the appropriate dax="foo" mount option
-
-    c) Changing the FS_XFLAG_DAX flag on existing regular files and
-       directories.  This has runtime constraints and limitations that are
-       described in 6) below.
-
- 6. When changing the S_DAX policy via toggling the persistent FS_XFLAG_DAX
-    flag, the change to existing regular files won't take effect until the
-    files are closed by all processes.
-
-
-Details
--------
-
-There are 2 per-file dax flags.  One is a persistent inode setting (FS_XFLAG_DAX)
-and the other is a volatile flag indicating the active state of the feature
-(S_DAX).
-
-FS_XFLAG_DAX is preserved within the filesystem.  This persistent config
-setting can be set, cleared and/or queried using the FS_IOC_FS[GS]ETXATTR ioctl
-(see ioctl_xfs_fsgetxattr(2)) or an utility such as 'xfs_io'.
-
-New files and directories automatically inherit FS_XFLAG_DAX from
-their parent directory _when_ _created_.  Therefore, setting FS_XFLAG_DAX at
-directory creation time can be used to set a default behavior for an entire
-sub-tree.
-
-To clarify inheritance, here are 3 examples:
-
-Example A:
-
-mkdir -p a/b/c
-xfs_io -c 'chattr +x' a
-mkdir a/b/c/d
-mkdir a/e
-
-	dax: a,e
-	no dax: b,c,d
-
-Example B:
-
-mkdir a
-xfs_io -c 'chattr +x' a
-mkdir -p a/b/c/d
-
-	dax: a,b,c,d
-	no dax:
-
-Example C:
-
-mkdir -p a/b/c
-xfs_io -c 'chattr +x' c
-mkdir a/b/c/d
-
-	dax: c,d
-	no dax: a,b
-
-
-The current enabled state (S_DAX) is set when a file inode is instantiated in
-memory by the kernel.  It is set based on the underlying media support, the
-value of FS_XFLAG_DAX and the filesystem's dax mount option.
-
-statx can be used to query S_DAX.  NOTE that only regular files will ever have
-S_DAX set and therefore statx will never indicate that S_DAX is set on
-directories.
-
-Setting the FS_XFLAG_DAX flag (specifically or through inheritance) occurs even
-if the underlying media does not support dax and/or the filesystem is
-overridden with a mount option.
-
-
-
-Implementation Tips for Block Driver Writers
---------------------------------------------
-
-To support DAX in your block driver, implement the 'direct_access'
-block device operation.  It is used to translate the sector number
-(expressed in units of 512-byte sectors) to a page frame number (pfn)
-that identifies the physical page for the memory.  It also returns a
-kernel virtual address that can be used to access the memory.
-
-The direct_access method takes a 'size' parameter that indicates the
-number of bytes being requested.  The function should return the number
-of bytes that can be contiguously accessed at that offset.  It may also
-return a negative errno if an error occurs.
-
-In order to support this method, the storage must be byte-accessible by
-the CPU at all times.  If your device uses paging techniques to expose
-a large amount of memory through a smaller window, then you cannot
-implement direct_access.  Equally, if your device can occasionally
-stall the CPU for an extended period, you should also not attempt to
-implement direct_access.
-
-These block devices may be used for inspiration:
-- brd: RAM backed block device driver
-- dcssblk: s390 dcss block device driver
-- pmem: NVDIMM persistent memory driver
-
-
-Implementation Tips for Filesystem Writers
-------------------------------------------
-
-Filesystem support consists of
-- adding support to mark inodes as being DAX by setting the S_DAX flag in
-  i_flags
-- implementing ->read_iter and ->write_iter operations which use dax_iomap_rw()
-  when inode has S_DAX flag set
-- implementing an mmap file operation for DAX files which sets the
-  VM_MIXEDMAP and VM_HUGEPAGE flags on the VMA, and setting the vm_ops to
-  include handlers for fault, pmd_fault, page_mkwrite, pfn_mkwrite. These
-  handlers should probably call dax_iomap_fault() passing the appropriate
-  fault size and iomap operations.
-- calling iomap_zero_range() passing appropriate iomap operations instead of
-  block_truncate_page() for DAX files
-- ensuring that there is sufficient locking between reads, writes,
-  truncates and page faults
-
-The iomap handlers for allocating blocks must make sure that allocated blocks
-are zeroed out and converted to written extents before being returned to avoid
-exposure of uninitialized data through mmap.
-
-These filesystems may be used for inspiration:
-- ext2: see Documentation/filesystems/ext2.rst
-- ext4: see Documentation/filesystems/ext4/
-- xfs:  see Documentation/admin-guide/xfs.rst
-
-
-Handling Media Errors
----------------------
-
-The libnvdimm subsystem stores a record of known media error locations for
-each pmem block device (in gendisk->badblocks). If we fault at such location,
-or one with a latent error not yet discovered, the application can expect
-to receive a SIGBUS. Libnvdimm also allows clearing of these errors by simply
-writing the affected sectors (through the pmem driver, and if the underlying
-NVDIMM supports the clear_poison DSM defined by ACPI).
-
-Since DAX IO normally doesn't go through the driver/bio path, applications or
-sysadmins have an option to restore the lost data from a prior backup/inbuilt
-redundancy in the following ways:
-
-1. Delete the affected file, and restore from a backup (sysadmin route):
-   This will free the filesystem blocks that were being used by the file,
-   and the next time they're allocated, they will be zeroed first, which
-   happens through the driver, and will clear bad sectors.
-
-2. Truncate or hole-punch the part of the file that has a bad-block (at least
-   an entire aligned sector has to be hole-punched, but not necessarily an
-   entire filesystem block).
-
-These are the two basic paths that allow DAX filesystems to continue operating
-in the presence of media errors. More robust error recovery mechanisms can be
-built on top of this in the future, for example, involving redundancy/mirroring
-provided at the block layer through DM, or additionally, at the filesystem
-level. These would have to rely on the above two tenets, that error clearing
-can happen either by sending an IO through the driver, or zeroing (also through
-the driver).
-
-
-Shortcomings
-------------
-
-Even if the kernel or its modules are stored on a filesystem that supports
-DAX on a block device that supports DAX, they will still be copied into RAM.
-
-The DAX code does not work correctly on architectures which have virtually
-mapped caches such as ARM, MIPS and SPARC.
-
-Calling get_user_pages() on a range of user memory that has been mmaped
-from a DAX file will fail when there are no 'struct page' to describe
-those pages.  This problem has been addressed in some device drivers
-by adding optional struct page support for pages under the control of
-the driver (see CONFIG_NVDIMM_PFN in drivers/nvdimm for an example of
-how to do this). In the non struct page cases O_DIRECT reads/writes to
-those memory ranges from a non-DAX file will fail (note that O_DIRECT
-reads/writes _of a DAX file_ do work, it is the memory that is being
-accessed that is key here).  Other things that will not work in the
-non struct page case include RDMA, sendfile() and splice().
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 1f76b1cb3348..6235326f6421 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -76,6 +76,7 @@ Documentation for filesystem implementations.
    coda
    configfs
    cramfs
+   dax
    debugfs
    dlmfs
    ecryptfs
-- 
2.28.0

