Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A694269642D
	for <lists+linux-doc@lfdr.de>; Tue, 14 Feb 2023 14:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbjBNNFb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Feb 2023 08:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjBNNFa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Feb 2023 08:05:30 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7920223874
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 05:05:29 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 339833F5F1
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676379928;
        bh=JxutMUKArkibrm/KgvMOIci9yD/VCE1/gX/WVNDtC4E=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Ny1m9FP9Tai9U229wcJXaMhz9NzhWIp6TnxH4NPBKCBL0I3qS7WGR/ymn/vlxvr5f
         +g3kYKBMcFBOEsixfTz7VNFghJaxObHpsIX3RIfsjVC8ckWA/Ho/NLHfDeLGL350Pc
         DGV3Iw6J4GQnXCL/xCRmWhqqjftlkI7Wy2Ztos1WeUr0nlBTCkNPuVE8Arig2zZs50
         mpzLyYUKTmYRyuZCDCqUvxDyfwoEQ75UD7CKolUWFGXQXo4vH/OAZwuocoQBGaotDD
         M4xQ0xXbU9x5bdS2Apd9o3wTdfck4bVPVPI/+GOnu+f47umA2ynSOYVgKnMq2teRKY
         FNsve1irT0sWg==
Received: by mail-ed1-f72.google.com with SMTP id g25-20020aa7c859000000b004a3fe4cbb0cso9881711edt.17
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 05:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxutMUKArkibrm/KgvMOIci9yD/VCE1/gX/WVNDtC4E=;
        b=eRT7/4aI+KicvSlxrNH4nYJnZILrKxWSLwEcOaxx9M1qF6G3ll/hTaN2FTR828Ywzu
         U+JnaCm8PZxrwEzRbS5poHygpw75OEjETwn6uoYPFUGMpOI49ktnfZ8VX2M5bWuvoVDw
         pNi3vE6LcuyQ+oqCDTfoLbefT2YJPW7HQxijGyvcnZOkZyr5ewq6IGD+wEVJ1v0rCYDy
         Fgqk3ZPIQYy0zyBUJhXq3ditWoe8nKQmS0lm4pLfPAVXi4DDz5W+f1y9d+BPJ13nB9uD
         P64bYoZ253R/wGSSV/EcFk2uFZ5p3S0LK/IoyAbXvOl7XE0+d7ymJY9pg9fNxP81o+Uk
         h+Bg==
X-Gm-Message-State: AO0yUKXbxQPqfMO3suzcXSWKuee4Vgbkl7W+BGepYrk+rzdwxdGAt821
        SCUtLir75/ULt+vNjOPLT0VtLBu1sjFl7BbxbESvWKszIt4MXky9iTBjW4PTlBeWobzZGx0UQ/k
        P2QevYUP4bJoJ3xuv3+6CwZT7Kwk02QX6qPz/zYo6P1o=
X-Received: by 2002:a50:c354:0:b0:4a2:588f:b3c5 with SMTP id q20-20020a50c354000000b004a2588fb3c5mr2436214edb.21.1676379926656;
        Tue, 14 Feb 2023 05:05:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/4akfAeWfahZIEKFwLWmMN+68Ei102e772mpSWnR0I/m+0+/uhccRFxNQyXihzinGSHWgb6Q==
X-Received: by 2002:a50:c354:0:b0:4a2:588f:b3c5 with SMTP id q20-20020a50c354000000b004a2588fb3c5mr2436198edb.21.1676379926453;
        Tue, 14 Feb 2023 05:05:26 -0800 (PST)
Received: from amikhalitsyn.. ([2a02:8109:bd40:1414:c85e:daf1:c7bb:28dc])
        by smtp.gmail.com with ESMTPSA id b9-20020a170906194900b0088478517830sm8209790eje.83.2023.02.14.05.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 05:05:25 -0800 (PST)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     corbet@lwn.net
Cc:     Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v3 2/2] docs: filesystems: vfs: actualize struct super_operations description
Date:   Tue, 14 Feb 2023 14:02:40 +0100
Message-Id: <20230214130240.166885-3-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214130240.166885-1-aleksandr.mikhalitsyn@canonical.com>
References: <20230214130240.166885-1-aleksandr.mikhalitsyn@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Added/updated descriptions for super_operations:
- free_inode method
- evict_inode method
- freeze_super/thaw_super method
- show_{devname,path,stats} procfs-related methods
- get_dquots method

Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 Documentation/filesystems/vfs.rst | 74 ++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index f8905ff070d0..682148679b63 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -245,33 +245,42 @@ struct super_operations
 -----------------------
 
 This describes how the VFS can manipulate the superblock of your
-filesystem.  As of kernel 2.6.22, the following members are defined:
+filesystem.  The following members are defined:
 
 .. code-block:: c
 
 	struct super_operations {
 		struct inode *(*alloc_inode)(struct super_block *sb);
 		void (*destroy_inode)(struct inode *);
+		void (*free_inode)(struct inode *);
 
 		void (*dirty_inode) (struct inode *, int flags);
-		int (*write_inode) (struct inode *, int);
-		void (*drop_inode) (struct inode *);
-		void (*delete_inode) (struct inode *);
+		int (*write_inode) (struct inode *, struct writeback_control *wbc);
+		int (*drop_inode) (struct inode *);
+		void (*evict_inode) (struct inode *);
 		void (*put_super) (struct super_block *);
 		int (*sync_fs)(struct super_block *sb, int wait);
+		int (*freeze_super) (struct super_block *);
 		int (*freeze_fs) (struct super_block *);
+		int (*thaw_super) (struct super_block *);
 		int (*unfreeze_fs) (struct super_block *);
 		int (*statfs) (struct dentry *, struct kstatfs *);
 		int (*remount_fs) (struct super_block *, int *, char *);
-		void (*clear_inode) (struct inode *);
 		void (*umount_begin) (struct super_block *);
 
 		int (*show_options)(struct seq_file *, struct dentry *);
+		int (*show_devname)(struct seq_file *, struct dentry *);
+		int (*show_path)(struct seq_file *, struct dentry *);
+		int (*show_stats)(struct seq_file *, struct dentry *);
 
 		ssize_t (*quota_read)(struct super_block *, int, char *, size_t, loff_t);
 		ssize_t (*quota_write)(struct super_block *, int, const char *, size_t, loff_t);
-		int (*nr_cached_objects)(struct super_block *);
-		void (*free_cached_objects)(struct super_block *, int);
+		struct dquot **(*get_dquots)(struct inode *);
+
+		long (*nr_cached_objects)(struct super_block *,
+					struct shrink_control *);
+		long (*free_cached_objects)(struct super_block *,
+					struct shrink_control *);
 	};
 
 All methods are called without any locks being held, unless otherwise
@@ -292,6 +301,11 @@ or bottom half).
 	->alloc_inode was defined and simply undoes anything done by
 	->alloc_inode.
 
+``free_inode``
+	this method is called from RCU callback. If you use call_rcu()
+	in ->destroy_inode to free 'struct inode' memory, then it's
+	better to release memory in this method.
+
 ``dirty_inode``
 	this method is called by the VFS when an inode is marked dirty.
 	This is specifically for the inode itself being marked dirty,
@@ -319,8 +333,12 @@ or bottom half).
 	practice of using "force_delete" in the put_inode() case, but
 	does not have the races that the "force_delete()" approach had.
 
-``delete_inode``
-	called when the VFS wants to delete an inode
+``evict_inode``
+	called when the VFS wants to evict an inode. Caller does
+	*not* evict the pagecache or inode-associated metadata buffers;
+	the method has to use truncate_inode_pages_final() to get rid
+	of those. Caller makes sure async writeback cannot be running for
+	the inode while (or after) ->evict_inode() is called. Optional.
 
 ``put_super``
 	called when the VFS wishes to free the superblock
@@ -331,14 +349,25 @@ or bottom half).
 	superblock.  The second parameter indicates whether the method
 	should wait until the write out has been completed.  Optional.
 
+``freeze_super``
+	Called instead of ->freeze_fs callback if provided.
+	Main difference is that ->freeze_super is called without taking
+	down_write(&sb->s_umount). If filesystem implements it and wants
+	->freeze_fs to be called too, then it has to call ->freeze_fs
+	explicitly from this callback. Optional.
+
 ``freeze_fs``
 	called when VFS is locking a filesystem and forcing it into a
 	consistent state.  This method is currently used by the Logical
-	Volume Manager (LVM).
+	Volume Manager (LVM) and ioctl(FIFREEZE). Optional.
+
+``thaw_super``
+	called when VFS is unlocking a filesystem and making it writable
+	again after ->freeze_super. Optional.
 
 ``unfreeze_fs``
 	called when VFS is unlocking a filesystem and making it writable
-	again.
+	again after ->freeze_fs. Optional.
 
 ``statfs``
 	called when the VFS needs to get filesystem statistics.
@@ -347,22 +376,37 @@ or bottom half).
 	called when the filesystem is remounted.  This is called with
 	the kernel lock held
 
-``clear_inode``
-	called then the VFS clears the inode.  Optional
-
 ``umount_begin``
 	called when the VFS is unmounting a filesystem.
 
 ``show_options``
-	called by the VFS to show mount options for /proc/<pid>/mounts.
+	called by the VFS to show mount options for /proc/<pid>/mounts
+	and /proc/<pid>/mountinfo.
 	(see "Mount Options" section)
 
+``show_devname``
+	Optional. Called by the VFS to show device name for
+	/proc/<pid>/{mounts,mountinfo,mountstats}. If not provided then
+	'(struct mount).mnt_devname' will be used.
+
+``show_path``
+	Optional. Called by the VFS (for /proc/<pid>/mountinfo) to show
+	the mount root dentry path relative to the filesystem root.
+
+``show_stats``
+	Optional. Called by the VFS (for /proc/<pid>/mountstats) to show
+	filesystem-specific mount statistics.
+
 ``quota_read``
 	called by the VFS to read from filesystem quota file.
 
 ``quota_write``
 	called by the VFS to write to filesystem quota file.
 
+``get_dquots``
+	called by quota to get 'struct dquot' array for a particular inode.
+	Optional.
+
 ``nr_cached_objects``
 	called by the sb cache shrinking function for the filesystem to
 	return the number of freeable cached objects it contains.
-- 
2.34.1

