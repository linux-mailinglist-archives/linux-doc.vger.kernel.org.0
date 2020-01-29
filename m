Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4C814C579
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2020 06:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgA2FGc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Jan 2020 00:06:32 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46544 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgA2FGc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jan 2020 00:06:32 -0500
Received: by mail-qk1-f193.google.com with SMTP id g195so15800389qke.13;
        Tue, 28 Jan 2020 21:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AtzneeS3WFdsZ04VFG/VnSd06aJSbR0VmjJ6lIgHuZA=;
        b=oaDfpNJzQTRIj46JxOtOX9A1tLs90Odu+OpFMIR0du3ofuPuKJVu0GpO6P20DhDrrC
         84FVIYggVEJwyT4KjtnxJ9kpicYi/dXeuuA13XQ+RRA28gPyGkJ9QCLWS5G9g8lBHOA0
         eCi6zmng644HhMWw5+pxQLVonhtqfPAN9bSHW1eNZ85cVFL7Mt/FlqFLmPOodY+8FNHY
         0/p7MvNvmU6yf++gwbv+0w5F3BwA09Odpmscrb9tZe1J/kWi6VrtaAVeoQa1/VtL0YnR
         U2MrXqaVCXf/CPr2pkLGExTNfS3YlqFZnRgVzKlfVCnF7MfXDQ0RVvfvuyZz4qoix6io
         2IPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AtzneeS3WFdsZ04VFG/VnSd06aJSbR0VmjJ6lIgHuZA=;
        b=BnPvE0Wpjbom0BJspVJ1o+7sDbxzBfEkKo/UgQjhxx0HtIE2Db0fMlm/wMCcdg1w3E
         vRwnnoJg6cZo0sUMqGdUGBh8FttWR0HFXu/ugvqYmA1Cpgnjb0wcxGGv+eDZQQ+32f/p
         46s8+VyzgujnJ+KSP5K4o9mADM2nML4F5Bce1F4HZKPjSQiM1fRlpHZ6dzkazcd7vWzB
         qrX96EP546wzo0kXyy66q/EuIun8M7hhjf9HgkFQmJtcAcNNzgX4JJRMuvJms6zntcNn
         wb2xh6XFewMtiHE2tXoFZhyDc3D1Cflu67RE3kjWhGCiVUuSoldgVQi2S9JNycJCp+Lz
         By5w==
X-Gm-Message-State: APjAAAWRBN1pSoiPWRwsDoo9r0YLJNuoNOfKgjGLVKJzWEJfsbYqqYdt
        k0qNOXcH194snwMigPA/Sbc=
X-Google-Smtp-Source: APXvYqyPtCYLdqBlUdefAGHDhYcL/j0STp70AiKpGXWsjoRZh2w7oxNmOsFK6+tI5HjPsg5gfeNe+g==
X-Received: by 2002:a05:620a:12c4:: with SMTP id e4mr26636411qkl.359.1580274390596;
        Tue, 28 Jan 2020 21:06:30 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id w26sm434462qkj.46.2020.01.28.21.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 21:06:30 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     corbet@lwn.net, mchehab+samsung@kernel.org, miklos@szeredi.hu,
        markus.heiser@darmarit.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v5] Documentation: filesystems: convert fuse to RST
Date:   Wed, 29 Jan 2020 02:06:21 -0300
Message-Id: <20200129050621.700256-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Converts fuse.txt to reStructuredText format, improving the presentation
without changing much of the underlying content.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
----------------------------------------------------------
Changes in v5:
Remove unnecessary literal text from definition lists

Changes in v4:
Use definition list in a section I had forgotten.
Change **term** to ``term`` in the definition lists
No more standalone "::"
Remove "#." notation

Changes in v3:
Removed unnecessary markup.
Moved document back to Documentation/filesystems as per request from the
maintainer.

Changes in v2:
-Copied FUSE maintainer (Miklos Szeredi)
-Fixed the reference in the MAINTAINERS file
-Removed some of the excessive markup in fuse.rst
-Moved fuse.rst into admin-guide
-Updated index.rst

 .../filesystems/{fuse.txt => fuse.rst}        | 162 ++++++++----------
 Documentation/filesystems/index.rst           |   1 +
 MAINTAINERS                                   |   2 +-
 3 files changed, 74 insertions(+), 91 deletions(-)
 rename Documentation/filesystems/{fuse.txt => fuse.rst} (81%)

diff --git a/Documentation/filesystems/fuse.txt b/Documentation/filesystems/fuse.rst
similarity index 81%
rename from Documentation/filesystems/fuse.txt
rename to Documentation/filesystems/fuse.rst
index 13af4a49e7db..2d321f117119 100644
--- a/Documentation/filesystems/fuse.txt
+++ b/Documentation/filesystems/fuse.rst
@@ -1,41 +1,39 @@
+==============
+FUSE
+==============
+
 Definitions
-~~~~~~~~~~~
+===========
 
 Userspace filesystem:
-
   A filesystem in which data and metadata are provided by an ordinary
   userspace process.  The filesystem can be accessed normally through
   the kernel interface.
 
 Filesystem daemon:
-
   The process(es) providing the data and metadata of the filesystem.
 
 Non-privileged mount (or user mount):
-
   A userspace filesystem mounted by a non-privileged (non-root) user.
   The filesystem daemon is running with the privileges of the mounting
   user.  NOTE: this is not the same as mounts allowed with the "user"
   option in /etc/fstab, which is not discussed here.
 
 Filesystem connection:
-
   A connection between the filesystem daemon and the kernel.  The
   connection exists until either the daemon dies, or the filesystem is
   umounted.  Note that detaching (or lazy umounting) the filesystem
-  does _not_ break the connection, in this case it will exist until
+  does *not* break the connection, in this case it will exist until
   the last reference to the filesystem is released.
 
 Mount owner:
-
   The user who does the mounting.
 
 User:
-
   The user who is performing filesystem operations.
 
 What is FUSE?
-~~~~~~~~~~~~~
+=============
 
 FUSE is a userspace filesystem framework.  It consists of a kernel
 module (fuse.ko), a userspace library (libfuse.*) and a mount utility
@@ -46,50 +44,41 @@ non-privileged mounts.  This opens up new possibilities for the use of
 filesystems.  A good example is sshfs: a secure network filesystem
 using the sftp protocol.
 
-The userspace library and utilities are available from the FUSE
-homepage:
-
-  http://fuse.sourceforge.net/
+The userspace library and utilities are available from the
+`FUSE homepage: <http://fuse.sourceforge.net/>`_
 
 Filesystem type
-~~~~~~~~~~~~~~~
+===============
 
 The filesystem type given to mount(2) can be one of the following:
 
-'fuse'
-
-  This is the usual way to mount a FUSE filesystem.  The first
-  argument of the mount system call may contain an arbitrary string,
-  which is not interpreted by the kernel.
+    fuse
+      This is the usual way to mount a FUSE filesystem.  The first
+      argument of the mount system call may contain an arbitrary string,
+      which is not interpreted by the kernel.
 
-'fuseblk'
-
-  The filesystem is block device based.  The first argument of the
-  mount system call is interpreted as the name of the device.
+    fuseblk
+      The filesystem is block device based.  The first argument of the
+      mount system call is interpreted as the name of the device.
 
 Mount options
-~~~~~~~~~~~~~
-
-'fd=N'
+=============
 
+fd=N
   The file descriptor to use for communication between the userspace
   filesystem and the kernel.  The file descriptor must have been
   obtained by opening the FUSE device ('/dev/fuse').
 
-'rootmode=M'
-
+rootmode=M
   The file mode of the filesystem's root in octal representation.
 
-'user_id=N'
-
+user_id=N
   The numeric user id of the mount owner.
 
-'group_id=N'
-
+group_id=N
   The numeric group id of the mount owner.
 
-'default_permissions'
-
+default_permissions
   By default FUSE doesn't check file access permissions, the
   filesystem is free to implement its access policy or leave it to
   the underlying file access mechanism (e.g. in case of network
@@ -97,28 +86,25 @@ Mount options
   access based on file mode.  It is usually useful together with the
   'allow_other' mount option.
 
-'allow_other'
-
+allow_other
   This option overrides the security measure restricting file access
   to the user mounting the filesystem.  This option is by default only
   allowed to root, but this restriction can be removed with a
   (userspace) configuration option.
 
-'max_read=N'
-
+max_read=N
   With this option the maximum size of read operations can be set.
   The default is infinite.  Note that the size of read requests is
   limited anyway to 32 pages (which is 128kbyte on i386).
 
-'blksize=N'
-
+blksize=N
   Set the block size for the filesystem.  The default is 512.  This
   option is only valid for 'fuseblk' type mounts.
 
 Control filesystem
-~~~~~~~~~~~~~~~~~~
+==================
 
-There's a control filesystem for FUSE, which can be mounted by:
+There's a control filesystem for FUSE, which can be mounted by::
 
   mount -t fusectl none /sys/fs/fuse/connections
 
@@ -130,53 +116,51 @@ named by a unique number.
 
 For each connection the following files exist within this directory:
 
- 'waiting'
-
-  The number of requests which are waiting to be transferred to
-  userspace or being processed by the filesystem daemon.  If there is
-  no filesystem activity and 'waiting' is non-zero, then the
-  filesystem is hung or deadlocked.
-
- 'abort'
+	waiting
+	  The number of requests which are waiting to be transferred to
+	  userspace or being processed by the filesystem daemon.  If there is
+	  no filesystem activity and 'waiting' is non-zero, then the
+	  filesystem is hung or deadlocked.
 
-  Writing anything into this file will abort the filesystem
-  connection.  This means that all waiting requests will be aborted an
-  error returned for all aborted and new requests.
+	abort
+	  Writing anything into this file will abort the filesystem
+	  connection.  This means that all waiting requests will be aborted an
+	  error returned for all aborted and new requests.
 
 Only the owner of the mount may read or write these files.
 
 Interrupting filesystem operations
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+##################################
 
 If a process issuing a FUSE filesystem request is interrupted, the
 following will happen:
 
-  1) If the request is not yet sent to userspace AND the signal is
+  -  If the request is not yet sent to userspace AND the signal is
      fatal (SIGKILL or unhandled fatal signal), then the request is
      dequeued and returns immediately.
 
-  2) If the request is not yet sent to userspace AND the signal is not
-     fatal, then an 'interrupted' flag is set for the request.  When
+  -  If the request is not yet sent to userspace AND the signal is not
+     fatal, then an interrupted flag is set for the request.  When
      the request has been successfully transferred to userspace and
      this flag is set, an INTERRUPT request is queued.
 
-  3) If the request is already sent to userspace, then an INTERRUPT
+  -  If the request is already sent to userspace, then an INTERRUPT
      request is queued.
 
 INTERRUPT requests take precedence over other requests, so the
 userspace filesystem will receive queued INTERRUPTs before any others.
 
 The userspace filesystem may ignore the INTERRUPT requests entirely,
-or may honor them by sending a reply to the _original_ request, with
+or may honor them by sending a reply to the *original* request, with
 the error set to EINTR.
 
 It is also possible that there's a race between processing the
 original request and its INTERRUPT request.  There are two possibilities:
 
-  1) The INTERRUPT request is processed before the original request is
+  1. The INTERRUPT request is processed before the original request is
      processed
 
-  2) The INTERRUPT request is processed after the original request has
+  2. The INTERRUPT request is processed after the original request has
      been answered
 
 If the filesystem cannot find the original request, it should wait for
@@ -186,7 +170,7 @@ should reply to the INTERRUPT request with an EAGAIN error.  In case
 reply will be ignored.
 
 Aborting a filesystem connection
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+================================
 
 It is possible to get into certain situations where the filesystem is
 not responding.  Reasons for this may be:
@@ -216,7 +200,7 @@ the filesystem.  There are several ways to do this:
     powerful method, always works.
 
 How do non-privileged mounts work?
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+==================================
 
 Since the mount() system call is a privileged operation, a helper
 program (fusermount) is needed, which is installed setuid root.
@@ -235,15 +219,13 @@ system.  Obvious requirements arising from this are:
     other users' or the super user's processes
 
 How are requirements fulfilled?
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+===============================
 
  A) The mount owner could gain elevated privileges by either:
 
-     1) creating a filesystem containing a device file, then opening
-	this device
+    1. creating a filesystem containing a device file, then opening this device
 
-     2) creating a filesystem containing a suid or sgid application,
-	then executing this application
+    2. creating a filesystem containing a suid or sgid application, then executing this application
 
     The solution is not to allow opening device files and ignore
     setuid and setgid bits when executing programs.  To ensure this
@@ -275,16 +257,16 @@ How are requirements fulfilled?
         of other users' processes.
 
          i) It can slow down or indefinitely delay the execution of a
-           filesystem operation creating a DoS against the user or the
-           whole system.  For example a suid application locking a
-           system file, and then accessing a file on the mount owner's
-           filesystem could be stopped, and thus causing the system
-           file to be locked forever.
+            filesystem operation creating a DoS against the user or the
+            whole system.  For example a suid application locking a
+            system file, and then accessing a file on the mount owner's
+            filesystem could be stopped, and thus causing the system
+            file to be locked forever.
 
          ii) It can present files or directories of unlimited length, or
-           directory structures of unlimited depth, possibly causing a
-           system process to eat up diskspace, memory or other
-           resources, again causing DoS.
+             directory structures of unlimited depth, possibly causing a
+             system process to eat up diskspace, memory or other
+             resources, again causing *DoS*.
 
 	The solution to this as well as B) is not to allow processes
 	to access the filesystem, which could otherwise not be
@@ -294,28 +276,27 @@ How are requirements fulfilled?
 	ptrace can be used to check if a process is allowed to access
 	the filesystem or not.
 
-	Note that the ptrace check is not strictly necessary to
+	Note that the *ptrace* check is not strictly necessary to
 	prevent B/2/i, it is enough to check if mount owner has enough
 	privilege to send signal to the process accessing the
-	filesystem, since SIGSTOP can be used to get a similar effect.
+	filesystem, since *SIGSTOP* can be used to get a similar effect.
 
 I think these limitations are unacceptable?
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+===========================================
 
 If a sysadmin trusts the users enough, or can ensure through other
 measures, that system processes will never enter non-privileged
-mounts, it can relax the last limitation with a "user_allow_other"
+mounts, it can relax the last limitation with a 'user_allow_other'
 config option.  If this config option is set, the mounting user can
-add the "allow_other" mount option which disables the check for other
+add the 'allow_other' mount option which disables the check for other
 users' processes.
 
 Kernel - userspace interface
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+============================
 
 The following diagram shows how a filesystem operation (in this
-example unlink) is performed in FUSE.
+example unlink) is performed in FUSE. ::
 
-NOTE: everything in this description is greatly simplified
 
  |  "rm /mnt/fuse/file"               |  FUSE filesystem daemon
  |                                    |
@@ -357,12 +338,13 @@ NOTE: everything in this description is greatly simplified
  |    <fuse_unlink()                  |
  |  <sys_unlink()                     |
 
+.. note:: Everything in the description above is greatly simplified
+
 There are a couple of ways in which to deadlock a FUSE filesystem.
 Since we are talking about unprivileged userspace programs,
 something must be done about these.
 
-Scenario 1 -  Simple deadlock
------------------------------
+**Scenario 1 -  Simple deadlock**::
 
  |  "rm /mnt/fuse/file"               |  FUSE filesystem daemon
  |                                    |
@@ -379,12 +361,12 @@ Scenario 1 -  Simple deadlock
 
 The solution for this is to allow the filesystem to be aborted.
 
-Scenario 2 - Tricky deadlock
-----------------------------
+**Scenario 2 - Tricky deadlock**
+
 
 This one needs a carefully crafted filesystem.  It's a variation on
 the above, only the call back to the filesystem is not explicit,
-but is caused by a pagefault.
+but is caused by a pagefault. ::
 
  |  Kamikaze filesystem thread 1      |  Kamikaze filesystem thread 2
  |                                    |
@@ -410,7 +392,7 @@ but is caused by a pagefault.
  |                                    |           [lock page]
  |                                    |           * DEADLOCK *
 
-Solution is basically the same as above.
+The solution is basically the same as above.
 
 An additional problem is that while the write buffer is being copied
 to the request, the request must not be interrupted/aborted.  This is
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index ad6315a48d14..e0c665cbcec2 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -47,4 +47,5 @@ Documentation for filesystem implementations.
    :maxdepth: 2
 
    autofs
+   fuse
    virtiofs
diff --git a/MAINTAINERS b/MAINTAINERS
index d51ce1a0a817..3d55b5d49f70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6847,7 +6847,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
 S:	Maintained
 F:	fs/fuse/
 F:	include/uapi/linux/fuse.h
-F:	Documentation/filesystems/fuse.txt
+F:	Documentation/filesystems/fuse.rst
 
 FUTEX SUBSYSTEM
 M:	Thomas Gleixner <tglx@linutronix.de>
-- 
2.25.0

