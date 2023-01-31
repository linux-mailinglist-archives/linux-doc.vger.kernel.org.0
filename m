Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C158B68384E
	for <lists+linux-doc@lfdr.de>; Tue, 31 Jan 2023 22:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjAaVHP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Jan 2023 16:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbjAaVHM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 16:07:12 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5DB6A57
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 13:07:11 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D3A16442FD
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 21:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1675199229;
        bh=MFn8bFpqbuyFI5dWrYZUOJJmaMpPQso5Tw3JzLNN9oE=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=S1iK219Itkc2ALC6LCCf+ucL8QuCVE5ZpElmuhGSGO7Kg+F0ZhnrpPoB9j3nxoSiq
         mfc4qkSAFTWPE2dw/W4nifzNk1lcBde1hpeO6EeorBymwcdmtwObh6bVXlhyzM76f2
         8sYHo1f2OvqmSlcmQitH+z7p/gFLEG5HEfKlL5SxjK5WCZzii8bmJTPZVY7nr28/QW
         hGq4krcDet1fkAHvkol1yEGdMFA/YO+r8zy7oj5XGg8yTUhkuAe5LxT/Ru6ednE1ud
         AL1QtUfttFuc03laQvaJVmXnTDpOJ9fYJb2Q3aMQt3m31xSCt8zE9MM5ZbLkAoKC7z
         O1XkRIzlbCm9g==
Received: by mail-ed1-f71.google.com with SMTP id a29-20020a50c31d000000b004a248bc5b6dso4920757edb.5
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 13:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFn8bFpqbuyFI5dWrYZUOJJmaMpPQso5Tw3JzLNN9oE=;
        b=wBxG+AacYN3bWNArO/vGVJqRMztSYzG3qiU8FOLOOZs9Va/56qAdY3sd//kt7OZkF+
         DMXunZO69slqLl51C/uSI9dsV8FfavHpFintBdW3ilV0FblA0DJiK/u06IIrmcm3HGrz
         y5knQqAYeO8b7gYKutGMxRxoYW8kCdNcdbhbMwu6+aIJxcOc4ZntMV4+mRkuCY5/iD0i
         fbBifiM3vYqQaf8NZ+MyuXrJ34G/zEKWUxgoycMfllykSArfmGfena4ixY3Lwb8/Z52i
         2B7obvmwk+Ij4mMOPmgguXg4MqFLDosn9X1Gt6iQ6ZOXaI0Ef/2QJkKACMEJypVKplCf
         rppg==
X-Gm-Message-State: AO0yUKXn3rMyy1R2ZBvSFN5/W1c622dTC9iK0oLNaXEFmD5uciQiFwR6
        fGM4snPDZ+iAzVFNnfttZlNlIp3MWuHc8r4T63v4yUXL0OMaXQtjCBvKTMLXsgoefqHXmlGgSCf
        WHEIqPueS5aDTRwkasgH2k1xbvvX6N605LtcCXQ==
X-Received: by 2002:a17:907:a408:b0:878:51a6:ff51 with SMTP id sg8-20020a170907a40800b0087851a6ff51mr30159197ejc.67.1675199229612;
        Tue, 31 Jan 2023 13:07:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/HDFs1OxXG5EoDqnbi9fgwPVrJHBcyWIRjar7lopDqhG9xTAbrL9ij6tNhmx+qMm+fXt/miQ==
X-Received: by 2002:a17:907:a408:b0:878:51a6:ff51 with SMTP id sg8-20020a170907a40800b0087851a6ff51mr30159184ejc.67.1675199229433;
        Tue, 31 Jan 2023 13:07:09 -0800 (PST)
Received: from amikhalitsyn.. (ip5f5bf399.dynamic.kabel-deutschland.de. [95.91.243.153])
        by smtp.gmail.com with ESMTPSA id ja3-20020a170907988300b008818d9e0bfesm6231172ejc.117.2023.01.31.13.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 13:07:09 -0800 (PST)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     corbet@lwn.net
Cc:     Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 2/2] docs: filesystems: vfs: actualize struct super_operations description
Date:   Tue, 31 Jan 2023 22:06:51 +0100
Message-Id: <20230131210651.715327-3-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131210651.715327-1-aleksandr.mikhalitsyn@canonical.com>
References: <20230131210651.715327-1-aleksandr.mikhalitsyn@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 Documentation/filesystems/vfs.rst | 74 ++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 113d70186324..e906867e3e83 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -245,33 +245,42 @@ struct super_operations
 -----------------------
 
 This describes how the VFS can manipulate the superblock of your
-filesystem.  As of kernel 2.6.22, the following members are defined:
+filesystem.  As of kernel 6.1, the following members are defined:
 
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

