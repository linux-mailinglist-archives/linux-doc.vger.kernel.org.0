Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2925519F0
	for <lists+linux-doc@lfdr.de>; Mon, 20 Jun 2022 15:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244724AbiFTNFw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jun 2022 09:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243870AbiFTNEV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jun 2022 09:04:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A03118B06;
        Mon, 20 Jun 2022 05:59:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 862EFB811B1;
        Mon, 20 Jun 2022 12:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1F8C3411B;
        Mon, 20 Jun 2022 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655729972;
        bh=sNR0QRlY5EWZHYV0VihLUTAWZOOnXns5wmYoCycRnyM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MjCGvkcZLOUMvK7THfQ8fd3Yj8Kp9ruHB7GgQ8od2G5u3NbvdBWYF0vYI1Wdsasnu
         toPHZsZO/XOlXHoaFB9wZIxTpP6qROvxnT0SOJRNCPS7t+sDO+X7cV2tJMBG+ijbeC
         W5OzTVaCa2oJ7WF59KNZ8yp4hlVedCYMvQZV7a74=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Xiubo Li <xiubli@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Christian Schoenebeck <linux_oss@crudebyte.com>,
        Marc Dionne <marc.dionne@auristor.com>,
        Ilya Dryomov <idryomov@gmail.com>,
        Steve French <smfrench@gmail.com>,
        William Kucharski <william.kucharski@oracle.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Dave Chinner <david@fromorbit.com>, linux-doc@vger.kernel.org,
        v9fs-developer@lists.sourceforge.net,
        linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 5.18 134/141] netfs: Fix gcc-12 warning by embedding vfs inode in netfs_i_context
Date:   Mon, 20 Jun 2022 14:51:12 +0200
Message-Id: <20220620124733.518737098@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220620124729.509745706@linuxfoundation.org>
References: <20220620124729.509745706@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: David Howells <dhowells@redhat.com>

commit 874c8ca1e60b2c564a48f7e7acc40d328d5c8733 upstream.

While randstruct was satisfied with using an open-coded "void *" offset
cast for the netfs_i_context <-> inode casting, __builtin_object_size() as
used by FORTIFY_SOURCE was not as easily fooled.  This was causing the
following complaint[1] from gcc v12:

  In file included from include/linux/string.h:253,
                   from include/linux/ceph/ceph_debug.h:7,
                   from fs/ceph/inode.c:2:
  In function 'fortify_memset_chk',
      inlined from 'netfs_i_context_init' at include/linux/netfs.h:326:2,
      inlined from 'ceph_alloc_inode' at fs/ceph/inode.c:463:2:
  include/linux/fortify-string.h:242:25: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
    242 |                         __write_overflow_field(p_size_field, size);
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by embedding a struct inode into struct netfs_i_context (which
should perhaps be renamed to struct netfs_inode).  The struct inode
vfs_inode fields are then removed from the 9p, afs, ceph and cifs inode
structs and vfs_inode is then simply changed to "netfs.inode" in those
filesystems.

Further, rename netfs_i_context to netfs_inode, get rid of the
netfs_inode() function that converted a netfs_i_context pointer to an
inode pointer (that can now be done with &ctx->inode) and rename the
netfs_i_context() function to netfs_inode() (which is now a wrapper
around container_of()).

Most of the changes were done with:

  perl -p -i -e 's/vfs_inode/netfs.inode/'g \
        `git grep -l 'vfs_inode' -- fs/{9p,afs,ceph,cifs}/*.[ch]`

Kees suggested doing it with a pair structure[2] and a special
declarator to insert that into the network filesystem's inode
wrapper[3], but I think it's cleaner to embed it - and then it doesn't
matter if struct randomisation reorders things.

Dave Chinner suggested using a filesystem-specific VFS_I() function in
each filesystem to convert that filesystem's own inode wrapper struct
into the VFS inode struct[4].

Version #2:
 - Fix a couple of missed name changes due to a disabled cifs option.
 - Rename nfs_i_context to nfs_inode
 - Use "netfs" instead of "nic" as the member name in per-fs inode wrapper
   structs.

[ This also undoes commit 507160f46c55 ("netfs: gcc-12: temporarily
  disable '-Wattribute-warning' for now") that is no longer needed ]

Fixes: bc899ee1c898 ("netfs: Add a netfs inode context")
Reported-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Xiubo Li <xiubli@redhat.com>
cc: Jonathan Corbet <corbet@lwn.net>
cc: Eric Van Hensbergen <ericvh@gmail.com>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Ilya Dryomov <idryomov@gmail.com>
cc: Steve French <smfrench@gmail.com>
cc: William Kucharski <william.kucharski@oracle.com>
cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
cc: Dave Chinner <david@fromorbit.com>
cc: linux-doc@vger.kernel.org
cc: v9fs-developer@lists.sourceforge.net
cc: linux-afs@lists.infradead.org
cc: ceph-devel@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: samba-technical@lists.samba.org
cc: linux-fsdevel@vger.kernel.org
cc: linux-hardening@vger.kernel.org
Link: https://lore.kernel.org/r/d2ad3a3d7bdd794c6efb562d2f2b655fb67756b9.camel@kernel.org/ [1]
Link: https://lore.kernel.org/r/20220517210230.864239-1-keescook@chromium.org/ [2]
Link: https://lore.kernel.org/r/20220518202212.2322058-1-keescook@chromium.org/ [3]
Link: https://lore.kernel.org/r/20220524101205.GI2306852@dread.disaster.area/ [4]
Link: https://lore.kernel.org/r/165296786831.3591209.12111293034669289733.stgit@warthog.procyon.org.uk/ # v1
Link: https://lore.kernel.org/r/165305805651.4094995.7763502506786714216.stgit@warthog.procyon.org.uk # v2
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/filesystems/netfs_library.rst |   37 ++++-----
 fs/9p/cache.c                               |    4 -
 fs/9p/v9fs.c                                |    2 
 fs/9p/v9fs.h                                |   10 --
 fs/9p/vfs_addr.c                            |    2 
 fs/9p/vfs_inode.c                           |    4 -
 fs/afs/callback.c                           |    2 
 fs/afs/dir.c                                |   32 ++++----
 fs/afs/dir_edit.c                           |   10 +-
 fs/afs/dir_silly.c                          |    4 -
 fs/afs/dynroot.c                            |    2 
 fs/afs/file.c                               |    4 -
 fs/afs/fs_operation.c                       |    6 -
 fs/afs/inode.c                              |   41 +++++------
 fs/afs/internal.h                           |   23 ++----
 fs/afs/super.c                              |    6 -
 fs/afs/write.c                              |   21 ++---
 fs/ceph/addr.c                              |    4 -
 fs/ceph/cache.c                             |    4 -
 fs/ceph/cache.h                             |    2 
 fs/ceph/caps.c                              |  104 ++++++++++++++--------------
 fs/ceph/file.c                              |    2 
 fs/ceph/inode.c                             |   13 +--
 fs/ceph/mds_client.c                        |    4 -
 fs/ceph/snap.c                              |    8 +-
 fs/ceph/super.c                             |    2 
 fs/ceph/super.h                             |   10 --
 fs/ceph/xattr.c                             |   14 +--
 fs/cifs/cifsfs.c                            |    8 +-
 fs/cifs/cifsglob.h                          |   12 +--
 fs/cifs/file.c                              |    8 +-
 fs/cifs/fscache.c                           |    8 +-
 fs/cifs/fscache.h                           |    8 +-
 fs/cifs/inode.c                             |    4 -
 fs/cifs/misc.c                              |    4 -
 fs/cifs/smb2ops.c                           |    8 +-
 fs/netfs/buffered_read.c                    |    6 -
 fs/netfs/internal.h                         |    2 
 fs/netfs/objects.c                          |    2 
 include/linux/netfs.h                       |   41 ++++-------
 40 files changed, 227 insertions(+), 261 deletions(-)

--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -37,30 +37,31 @@ The network filesystem helper library ne
 its use on each netfs inode it is helping to manage.  To this end, a context
 structure is defined::
 
-	struct netfs_i_context {
+	struct netfs_inode {
+		struct inode inode;
 		const struct netfs_request_ops *ops;
-		struct fscache_cookie	*cache;
+		struct fscache_cookie *cache;
 	};
 
-A network filesystem that wants to use netfs lib must place one of these
-directly after the VFS ``struct inode`` it allocates, usually as part of its
-own struct.  This can be done in a way similar to the following::
+A network filesystem that wants to use netfs lib must place one of these in its
+inode wrapper struct instead of the VFS ``struct inode``.  This can be done in
+a way similar to the following::
 
 	struct my_inode {
-		struct {
-			/* These must be contiguous */
-			struct inode		vfs_inode;
-			struct netfs_i_context  netfs_ctx;
-		};
+		struct netfs_inode netfs; /* Netfslib context and vfs inode */
 		...
 	};
 
-This allows netfslib to find its state by simple offset from the inode pointer,
-thereby allowing the netfslib helper functions to be pointed to directly by the
-VFS/VM operation tables.
+This allows netfslib to find its state by using ``container_of()`` from the
+inode pointer, thereby allowing the netfslib helper functions to be pointed to
+directly by the VFS/VM operation tables.
 
 The structure contains the following fields:
 
+ * ``inode``
+
+   The VFS inode structure.
+
  * ``ops``
 
    The set of operations provided by the network filesystem to netfslib.
@@ -78,14 +79,12 @@ To help deal with the per-inode context,
 provided.  Firstly, a function to perform basic initialisation on a context and
 set the operations table pointer::
 
-	void netfs_i_context_init(struct inode *inode,
-				  const struct netfs_request_ops *ops);
+	void netfs_inode_init(struct inode *inode,
+			      const struct netfs_request_ops *ops);
 
-then two functions to cast between the VFS inode structure and the netfs
-context::
+then a function to cast from the VFS inode structure to the netfs context::
 
-	struct netfs_i_context *netfs_i_context(struct inode *inode);
-	struct inode *netfs_inode(struct netfs_i_context *ctx);
+	struct netfs_inode *netfs_node(struct inode *inode);
 
 and finally, a function to get the cache cookie pointer from the context
 attached to an inode (or NULL if fscache is disabled)::
--- a/fs/9p/cache.c
+++ b/fs/9p/cache.c
@@ -62,12 +62,12 @@ void v9fs_cache_inode_get_cookie(struct
 	version = cpu_to_le32(v9inode->qid.version);
 	path = cpu_to_le64(v9inode->qid.path);
 	v9ses = v9fs_inode2v9ses(inode);
-	v9inode->netfs_ctx.cache =
+	v9inode->netfs.cache =
 		fscache_acquire_cookie(v9fs_session_cache(v9ses),
 				       0,
 				       &path, sizeof(path),
 				       &version, sizeof(version),
-				       i_size_read(&v9inode->vfs_inode));
+				       i_size_read(&v9inode->netfs.inode));
 
 	p9_debug(P9_DEBUG_FSC, "inode %p get cookie %p\n",
 		 inode, v9fs_inode_cookie(v9inode));
--- a/fs/9p/v9fs.c
+++ b/fs/9p/v9fs.c
@@ -625,7 +625,7 @@ static void v9fs_inode_init_once(void *f
 	struct v9fs_inode *v9inode = (struct v9fs_inode *)foo;
 
 	memset(&v9inode->qid, 0, sizeof(v9inode->qid));
-	inode_init_once(&v9inode->vfs_inode);
+	inode_init_once(&v9inode->netfs.inode);
 }
 
 /**
--- a/fs/9p/v9fs.h
+++ b/fs/9p/v9fs.h
@@ -109,11 +109,7 @@ struct v9fs_session_info {
 #define V9FS_INO_INVALID_ATTR 0x01
 
 struct v9fs_inode {
-	struct {
-		/* These must be contiguous */
-		struct inode	vfs_inode;	/* the VFS's inode record */
-		struct netfs_i_context netfs_ctx; /* Netfslib context */
-	};
+	struct netfs_inode netfs; /* Netfslib context and vfs inode */
 	struct p9_qid qid;
 	unsigned int cache_validity;
 	struct p9_fid *writeback_fid;
@@ -122,13 +118,13 @@ struct v9fs_inode {
 
 static inline struct v9fs_inode *V9FS_I(const struct inode *inode)
 {
-	return container_of(inode, struct v9fs_inode, vfs_inode);
+	return container_of(inode, struct v9fs_inode, netfs.inode);
 }
 
 static inline struct fscache_cookie *v9fs_inode_cookie(struct v9fs_inode *v9inode)
 {
 #ifdef CONFIG_9P_FSCACHE
-	return netfs_i_cookie(&v9inode->vfs_inode);
+	return netfs_i_cookie(&v9inode->netfs.inode);
 #else
 	return NULL;
 #endif
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -141,7 +141,7 @@ static void v9fs_write_to_cache_done(voi
 	    transferred_or_error != -ENOBUFS) {
 		version = cpu_to_le32(v9inode->qid.version);
 		fscache_invalidate(v9fs_inode_cookie(v9inode), &version,
-				   i_size_read(&v9inode->vfs_inode), 0);
+				   i_size_read(&v9inode->netfs.inode), 0);
 	}
 }
 
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -234,7 +234,7 @@ struct inode *v9fs_alloc_inode(struct su
 	v9inode->writeback_fid = NULL;
 	v9inode->cache_validity = 0;
 	mutex_init(&v9inode->v_mutex);
-	return &v9inode->vfs_inode;
+	return &v9inode->netfs.inode;
 }
 
 /**
@@ -252,7 +252,7 @@ void v9fs_free_inode(struct inode *inode
  */
 static void v9fs_set_netfs_context(struct inode *inode)
 {
-	netfs_i_context_init(inode, &v9fs_req_ops);
+	netfs_inode_init(inode, &v9fs_req_ops);
 }
 
 int v9fs_init_inode(struct v9fs_session_info *v9ses,
--- a/fs/afs/callback.c
+++ b/fs/afs/callback.c
@@ -30,7 +30,7 @@ void afs_invalidate_mmap_work(struct wor
 {
 	struct afs_vnode *vnode = container_of(work, struct afs_vnode, cb_work);
 
-	unmap_mapping_pages(vnode->vfs_inode.i_mapping, 0, 0, false);
+	unmap_mapping_pages(vnode->netfs.inode.i_mapping, 0, 0, false);
 }
 
 void afs_server_init_callback_work(struct work_struct *work)
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -109,7 +109,7 @@ struct afs_lookup_cookie {
  */
 static void afs_dir_read_cleanup(struct afs_read *req)
 {
-	struct address_space *mapping = req->vnode->vfs_inode.i_mapping;
+	struct address_space *mapping = req->vnode->netfs.inode.i_mapping;
 	struct folio *folio;
 	pgoff_t last = req->nr_pages - 1;
 
@@ -153,7 +153,7 @@ static bool afs_dir_check_folio(struct a
 		block = kmap_local_folio(folio, offset);
 		if (block->hdr.magic != AFS_DIR_MAGIC) {
 			printk("kAFS: %s(%lx): [%llx] bad magic %zx/%zx is %04hx\n",
-			       __func__, dvnode->vfs_inode.i_ino,
+			       __func__, dvnode->netfs.inode.i_ino,
 			       pos, offset, size, ntohs(block->hdr.magic));
 			trace_afs_dir_check_failed(dvnode, pos + offset, i_size);
 			kunmap_local(block);
@@ -183,7 +183,7 @@ error:
 static void afs_dir_dump(struct afs_vnode *dvnode, struct afs_read *req)
 {
 	union afs_xdr_dir_block *block;
-	struct address_space *mapping = dvnode->vfs_inode.i_mapping;
+	struct address_space *mapping = dvnode->netfs.inode.i_mapping;
 	struct folio *folio;
 	pgoff_t last = req->nr_pages - 1;
 	size_t offset, size;
@@ -217,7 +217,7 @@ static void afs_dir_dump(struct afs_vnod
  */
 static int afs_dir_check(struct afs_vnode *dvnode, struct afs_read *req)
 {
-	struct address_space *mapping = dvnode->vfs_inode.i_mapping;
+	struct address_space *mapping = dvnode->netfs.inode.i_mapping;
 	struct folio *folio;
 	pgoff_t last = req->nr_pages - 1;
 	int ret = 0;
@@ -269,7 +269,7 @@ static int afs_dir_open(struct inode *in
 static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
 	__acquires(&dvnode->validate_lock)
 {
-	struct address_space *mapping = dvnode->vfs_inode.i_mapping;
+	struct address_space *mapping = dvnode->netfs.inode.i_mapping;
 	struct afs_read *req;
 	loff_t i_size;
 	int nr_pages, i;
@@ -287,7 +287,7 @@ static struct afs_read *afs_read_dir(str
 	req->cleanup = afs_dir_read_cleanup;
 
 expand:
-	i_size = i_size_read(&dvnode->vfs_inode);
+	i_size = i_size_read(&dvnode->netfs.inode);
 	if (i_size < 2048) {
 		ret = afs_bad(dvnode, afs_file_error_dir_small);
 		goto error;
@@ -305,7 +305,7 @@ expand:
 	req->actual_len = i_size; /* May change */
 	req->len = nr_pages * PAGE_SIZE; /* We can ask for more than there is */
 	req->data_version = dvnode->status.data_version; /* May change */
-	iov_iter_xarray(&req->def_iter, READ, &dvnode->vfs_inode.i_mapping->i_pages,
+	iov_iter_xarray(&req->def_iter, READ, &dvnode->netfs.inode.i_mapping->i_pages,
 			0, i_size);
 	req->iter = &req->def_iter;
 
@@ -897,7 +897,7 @@ static struct inode *afs_do_lookup(struc
 
 out_op:
 	if (op->error == 0) {
-		inode = &op->file[1].vnode->vfs_inode;
+		inode = &op->file[1].vnode->netfs.inode;
 		op->file[1].vnode = NULL;
 	}
 
@@ -1139,7 +1139,7 @@ static int afs_d_revalidate(struct dentr
 	afs_stat_v(dir, n_reval);
 
 	/* search the directory for this vnode */
-	ret = afs_do_lookup_one(&dir->vfs_inode, dentry, &fid, key, &dir_version);
+	ret = afs_do_lookup_one(&dir->netfs.inode, dentry, &fid, key, &dir_version);
 	switch (ret) {
 	case 0:
 		/* the filename maps to something */
@@ -1170,7 +1170,7 @@ static int afs_d_revalidate(struct dentr
 			_debug("%pd: file deleted (uq %u -> %u I:%u)",
 			       dentry, fid.unique,
 			       vnode->fid.unique,
-			       vnode->vfs_inode.i_generation);
+			       vnode->netfs.inode.i_generation);
 			goto not_found;
 		}
 		goto out_valid;
@@ -1368,7 +1368,7 @@ static void afs_dir_remove_subdir(struct
 	if (d_really_is_positive(dentry)) {
 		struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
 
-		clear_nlink(&vnode->vfs_inode);
+		clear_nlink(&vnode->netfs.inode);
 		set_bit(AFS_VNODE_DELETED, &vnode->flags);
 		clear_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
 		clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
@@ -1487,8 +1487,8 @@ static void afs_dir_remove_link(struct a
 		/* Already done */
 	} else if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags)) {
 		write_seqlock(&vnode->cb_lock);
-		drop_nlink(&vnode->vfs_inode);
-		if (vnode->vfs_inode.i_nlink == 0) {
+		drop_nlink(&vnode->netfs.inode);
+		if (vnode->netfs.inode.i_nlink == 0) {
 			set_bit(AFS_VNODE_DELETED, &vnode->flags);
 			__afs_break_callback(vnode, afs_cb_break_for_unlink);
 		}
@@ -1504,7 +1504,7 @@ static void afs_dir_remove_link(struct a
 			op->error = ret;
 	}
 
-	_debug("nlink %d [val %d]", vnode->vfs_inode.i_nlink, op->error);
+	_debug("nlink %d [val %d]", vnode->netfs.inode.i_nlink, op->error);
 }
 
 static void afs_unlink_success(struct afs_operation *op)
@@ -1680,8 +1680,8 @@ static void afs_link_success(struct afs_
 	afs_update_dentry_version(op, dvp, op->dentry);
 	if (op->dentry_2->d_parent == op->dentry->d_parent)
 		afs_update_dentry_version(op, dvp, op->dentry_2);
-	ihold(&vp->vnode->vfs_inode);
-	d_instantiate(op->dentry, &vp->vnode->vfs_inode);
+	ihold(&vp->vnode->netfs.inode);
+	d_instantiate(op->dentry, &vp->vnode->netfs.inode);
 }
 
 static void afs_link_put(struct afs_operation *op)
--- a/fs/afs/dir_edit.c
+++ b/fs/afs/dir_edit.c
@@ -109,7 +109,7 @@ static void afs_clear_contig_bits(union
  */
 static struct folio *afs_dir_get_folio(struct afs_vnode *vnode, pgoff_t index)
 {
-	struct address_space *mapping = vnode->vfs_inode.i_mapping;
+	struct address_space *mapping = vnode->netfs.inode.i_mapping;
 	struct folio *folio;
 
 	folio = __filemap_get_folio(mapping, index,
@@ -216,7 +216,7 @@ void afs_edit_dir_add(struct afs_vnode *
 
 	_enter(",,{%d,%s},", name->len, name->name);
 
-	i_size = i_size_read(&vnode->vfs_inode);
+	i_size = i_size_read(&vnode->netfs.inode);
 	if (i_size > AFS_DIR_BLOCK_SIZE * AFS_DIR_MAX_BLOCKS ||
 	    (i_size & (AFS_DIR_BLOCK_SIZE - 1))) {
 		clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
@@ -336,7 +336,7 @@ found_space:
 	if (b < AFS_DIR_BLOCKS_WITH_CTR)
 		meta->meta.alloc_ctrs[b] -= need_slots;
 
-	inode_inc_iversion_raw(&vnode->vfs_inode);
+	inode_inc_iversion_raw(&vnode->netfs.inode);
 	afs_stat_v(vnode, n_dir_cr);
 	_debug("Insert %s in %u[%u]", name->name, b, slot);
 
@@ -383,7 +383,7 @@ void afs_edit_dir_remove(struct afs_vnod
 
 	_enter(",,{%d,%s},", name->len, name->name);
 
-	i_size = i_size_read(&vnode->vfs_inode);
+	i_size = i_size_read(&vnode->netfs.inode);
 	if (i_size < AFS_DIR_BLOCK_SIZE ||
 	    i_size > AFS_DIR_BLOCK_SIZE * AFS_DIR_MAX_BLOCKS ||
 	    (i_size & (AFS_DIR_BLOCK_SIZE - 1))) {
@@ -463,7 +463,7 @@ found_dirent:
 	if (b < AFS_DIR_BLOCKS_WITH_CTR)
 		meta->meta.alloc_ctrs[b] += need_slots;
 
-	inode_set_iversion_raw(&vnode->vfs_inode, vnode->status.data_version);
+	inode_set_iversion_raw(&vnode->netfs.inode, vnode->status.data_version);
 	afs_stat_v(vnode, n_dir_rm);
 	_debug("Remove %s from %u[%u]", name->name, b, slot);
 
--- a/fs/afs/dir_silly.c
+++ b/fs/afs/dir_silly.c
@@ -131,7 +131,7 @@ int afs_sillyrename(struct afs_vnode *dv
 			goto out;
 	} while (!d_is_negative(sdentry));
 
-	ihold(&vnode->vfs_inode);
+	ihold(&vnode->netfs.inode);
 
 	ret = afs_do_silly_rename(dvnode, vnode, dentry, sdentry, key);
 	switch (ret) {
@@ -148,7 +148,7 @@ int afs_sillyrename(struct afs_vnode *dv
 		d_drop(sdentry);
 	}
 
-	iput(&vnode->vfs_inode);
+	iput(&vnode->netfs.inode);
 	dput(sdentry);
 out:
 	_leave(" = %d", ret);
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -76,7 +76,7 @@ struct inode *afs_iget_pseudo_dir(struct
 	/* there shouldn't be an existing inode */
 	BUG_ON(!(inode->i_state & I_NEW));
 
-	netfs_i_context_init(inode, NULL);
+	netfs_inode_init(inode, NULL);
 	inode->i_size		= 0;
 	inode->i_mode		= S_IFDIR | S_IRUGO | S_IXUGO;
 	if (root) {
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -194,7 +194,7 @@ int afs_release(struct inode *inode, str
 		afs_put_wb_key(af->wb);
 
 	if ((file->f_mode & FMODE_WRITE)) {
-		i_size = i_size_read(&vnode->vfs_inode);
+		i_size = i_size_read(&vnode->netfs.inode);
 		afs_set_cache_aux(vnode, &aux);
 		fscache_unuse_cookie(afs_vnode_cache(vnode), &aux, &i_size);
 	} else {
@@ -325,7 +325,7 @@ static void afs_issue_read(struct netfs_
 	fsreq->iter	= &fsreq->def_iter;
 
 	iov_iter_xarray(&fsreq->def_iter, READ,
-			&fsreq->vnode->vfs_inode.i_mapping->i_pages,
+			&fsreq->vnode->netfs.inode.i_mapping->i_pages,
 			fsreq->pos, fsreq->len);
 
 	afs_fetch_data(fsreq->vnode, fsreq);
--- a/fs/afs/fs_operation.c
+++ b/fs/afs/fs_operation.c
@@ -232,14 +232,14 @@ int afs_put_operation(struct afs_operati
 	if (op->file[1].modification && op->file[1].vnode != op->file[0].vnode)
 		clear_bit(AFS_VNODE_MODIFYING, &op->file[1].vnode->flags);
 	if (op->file[0].put_vnode)
-		iput(&op->file[0].vnode->vfs_inode);
+		iput(&op->file[0].vnode->netfs.inode);
 	if (op->file[1].put_vnode)
-		iput(&op->file[1].vnode->vfs_inode);
+		iput(&op->file[1].vnode->netfs.inode);
 
 	if (op->more_files) {
 		for (i = 0; i < op->nr_files - 2; i++)
 			if (op->more_files[i].put_vnode)
-				iput(&op->more_files[i].vnode->vfs_inode);
+				iput(&op->more_files[i].vnode->netfs.inode);
 		kfree(op->more_files);
 	}
 
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -25,9 +25,6 @@
 #include "internal.h"
 #include "afs_fs.h"
 
-// Temporary: netfs does disgusting things with inode pointers
-#pragma GCC diagnostic ignored "-Wattribute-warning"
-
 static const struct inode_operations afs_symlink_inode_operations = {
 	.get_link	= page_get_link,
 };
@@ -61,7 +58,7 @@ static noinline void dump_vnode(struct a
  */
 static void afs_set_netfs_context(struct afs_vnode *vnode)
 {
-	netfs_i_context_init(&vnode->vfs_inode, &afs_req_ops);
+	netfs_inode_init(&vnode->netfs.inode, &afs_req_ops);
 }
 
 /*
@@ -99,7 +96,7 @@ static int afs_inode_init_from_status(st
 	inode->i_flags |= S_NOATIME;
 	inode->i_uid = make_kuid(&init_user_ns, status->owner);
 	inode->i_gid = make_kgid(&init_user_ns, status->group);
-	set_nlink(&vnode->vfs_inode, status->nlink);
+	set_nlink(&vnode->netfs.inode, status->nlink);
 
 	switch (status->type) {
 	case AFS_FTYPE_FILE:
@@ -142,7 +139,7 @@ static int afs_inode_init_from_status(st
 	afs_set_netfs_context(vnode);
 
 	vnode->invalid_before	= status->data_version;
-	inode_set_iversion_raw(&vnode->vfs_inode, status->data_version);
+	inode_set_iversion_raw(&vnode->netfs.inode, status->data_version);
 
 	if (!vp->scb.have_cb) {
 		/* it's a symlink we just created (the fileserver
@@ -166,7 +163,7 @@ static void afs_apply_status(struct afs_
 {
 	struct afs_file_status *status = &vp->scb.status;
 	struct afs_vnode *vnode = vp->vnode;
-	struct inode *inode = &vnode->vfs_inode;
+	struct inode *inode = &vnode->netfs.inode;
 	struct timespec64 t;
 	umode_t mode;
 	bool data_changed = false;
@@ -249,7 +246,7 @@ static void afs_apply_status(struct afs_
 		 * idea of what the size should be that's not the same as
 		 * what's on the server.
 		 */
-		vnode->netfs_ctx.remote_i_size = status->size;
+		vnode->netfs.remote_i_size = status->size;
 		if (change_size) {
 			afs_set_i_size(vnode, status->size);
 			inode->i_ctime = t;
@@ -292,7 +289,7 @@ void afs_vnode_commit_status(struct afs_
 		 */
 		if (vp->scb.status.abort_code == VNOVNODE) {
 			set_bit(AFS_VNODE_DELETED, &vnode->flags);
-			clear_nlink(&vnode->vfs_inode);
+			clear_nlink(&vnode->netfs.inode);
 			__afs_break_callback(vnode, afs_cb_break_for_deleted);
 			op->flags &= ~AFS_OPERATION_DIR_CONFLICT;
 		}
@@ -309,8 +306,8 @@ void afs_vnode_commit_status(struct afs_
 		if (vp->scb.have_cb)
 			afs_apply_callback(op, vp);
 	} else if (vp->op_unlinked && !(op->flags & AFS_OPERATION_DIR_CONFLICT)) {
-		drop_nlink(&vnode->vfs_inode);
-		if (vnode->vfs_inode.i_nlink == 0) {
+		drop_nlink(&vnode->netfs.inode);
+		if (vnode->netfs.inode.i_nlink == 0) {
 			set_bit(AFS_VNODE_DELETED, &vnode->flags);
 			__afs_break_callback(vnode, afs_cb_break_for_deleted);
 		}
@@ -329,7 +326,7 @@ static void afs_fetch_status_success(str
 	struct afs_vnode *vnode = vp->vnode;
 	int ret;
 
-	if (vnode->vfs_inode.i_state & I_NEW) {
+	if (vnode->netfs.inode.i_state & I_NEW) {
 		ret = afs_inode_init_from_status(op, vp, vnode);
 		op->error = ret;
 		if (ret == 0)
@@ -433,7 +430,7 @@ static void afs_get_inode_cache(struct a
 	struct afs_vnode_cache_aux aux;
 
 	if (vnode->status.type != AFS_FTYPE_FILE) {
-		vnode->netfs_ctx.cache = NULL;
+		vnode->netfs.cache = NULL;
 		return;
 	}
 
@@ -460,7 +457,7 @@ static void afs_get_inode_cache(struct a
 struct inode *afs_iget(struct afs_operation *op, struct afs_vnode_param *vp)
 {
 	struct afs_vnode_param *dvp = &op->file[0];
-	struct super_block *sb = dvp->vnode->vfs_inode.i_sb;
+	struct super_block *sb = dvp->vnode->netfs.inode.i_sb;
 	struct afs_vnode *vnode;
 	struct inode *inode;
 	int ret;
@@ -585,10 +582,10 @@ static void afs_zap_data(struct afs_vnod
 	/* nuke all the non-dirty pages that aren't locked, mapped or being
 	 * written back in a regular file and completely discard the pages in a
 	 * directory or symlink */
-	if (S_ISREG(vnode->vfs_inode.i_mode))
-		invalidate_remote_inode(&vnode->vfs_inode);
+	if (S_ISREG(vnode->netfs.inode.i_mode))
+		invalidate_remote_inode(&vnode->netfs.inode);
 	else
-		invalidate_inode_pages2(vnode->vfs_inode.i_mapping);
+		invalidate_inode_pages2(vnode->netfs.inode.i_mapping);
 }
 
 /*
@@ -686,8 +683,8 @@ int afs_validate(struct afs_vnode *vnode
 	       key_serial(key));
 
 	if (unlikely(test_bit(AFS_VNODE_DELETED, &vnode->flags))) {
-		if (vnode->vfs_inode.i_nlink)
-			clear_nlink(&vnode->vfs_inode);
+		if (vnode->netfs.inode.i_nlink)
+			clear_nlink(&vnode->netfs.inode);
 		goto valid;
 	}
 
@@ -829,7 +826,7 @@ void afs_evict_inode(struct inode *inode
 static void afs_setattr_success(struct afs_operation *op)
 {
 	struct afs_vnode_param *vp = &op->file[0];
-	struct inode *inode = &vp->vnode->vfs_inode;
+	struct inode *inode = &vp->vnode->netfs.inode;
 	loff_t old_i_size = i_size_read(inode);
 
 	op->setattr.old_i_size = old_i_size;
@@ -846,7 +843,7 @@ static void afs_setattr_success(struct a
 static void afs_setattr_edit_file(struct afs_operation *op)
 {
 	struct afs_vnode_param *vp = &op->file[0];
-	struct inode *inode = &vp->vnode->vfs_inode;
+	struct inode *inode = &vp->vnode->netfs.inode;
 
 	if (op->setattr.attr->ia_valid & ATTR_SIZE) {
 		loff_t size = op->setattr.attr->ia_size;
@@ -878,7 +875,7 @@ int afs_setattr(struct user_namespace *m
 		ATTR_MTIME | ATTR_MTIME_SET | ATTR_TIMES_SET | ATTR_TOUCH;
 	struct afs_operation *op;
 	struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
-	struct inode *inode = &vnode->vfs_inode;
+	struct inode *inode = &vnode->netfs.inode;
 	loff_t i_size;
 	int ret;
 
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -619,12 +619,7 @@ enum afs_lock_state {
  * leak from one inode to another.
  */
 struct afs_vnode {
-	struct {
-		/* These must be contiguous */
-		struct inode	vfs_inode;	/* the VFS's inode record */
-		struct netfs_i_context netfs_ctx; /* Netfslib context */
-	};
-
+	struct netfs_inode	netfs;		/* Netfslib context and vfs inode */
 	struct afs_volume	*volume;	/* volume on which vnode resides */
 	struct afs_fid		fid;		/* the file identifier for this inode */
 	struct afs_file_status	status;		/* AFS status info for this file */
@@ -675,7 +670,7 @@ struct afs_vnode {
 static inline struct fscache_cookie *afs_vnode_cache(struct afs_vnode *vnode)
 {
 #ifdef CONFIG_AFS_FSCACHE
-	return netfs_i_cookie(&vnode->vfs_inode);
+	return netfs_i_cookie(&vnode->netfs.inode);
 #else
 	return NULL;
 #endif
@@ -685,7 +680,7 @@ static inline void afs_vnode_set_cache(s
 				       struct fscache_cookie *cookie)
 {
 #ifdef CONFIG_AFS_FSCACHE
-	vnode->netfs_ctx.cache = cookie;
+	vnode->netfs.cache = cookie;
 #endif
 }
 
@@ -892,7 +887,7 @@ static inline void afs_invalidate_cache(
 
 	afs_set_cache_aux(vnode, &aux);
 	fscache_invalidate(afs_vnode_cache(vnode), &aux,
-			   i_size_read(&vnode->vfs_inode), flags);
+			   i_size_read(&vnode->netfs.inode), flags);
 }
 
 /*
@@ -1217,7 +1212,7 @@ static inline struct afs_net *afs_i2net(
 
 static inline struct afs_net *afs_v2net(struct afs_vnode *vnode)
 {
-	return afs_i2net(&vnode->vfs_inode);
+	return afs_i2net(&vnode->netfs.inode);
 }
 
 static inline struct afs_net *afs_sock2net(struct sock *sk)
@@ -1593,12 +1588,12 @@ extern void yfs_fs_store_opaque_acl2(str
  */
 static inline struct afs_vnode *AFS_FS_I(struct inode *inode)
 {
-	return container_of(inode, struct afs_vnode, vfs_inode);
+	return container_of(inode, struct afs_vnode, netfs.inode);
 }
 
 static inline struct inode *AFS_VNODE_TO_I(struct afs_vnode *vnode)
 {
-	return &vnode->vfs_inode;
+	return &vnode->netfs.inode;
 }
 
 /*
@@ -1621,8 +1616,8 @@ static inline void afs_update_dentry_ver
  */
 static inline void afs_set_i_size(struct afs_vnode *vnode, u64 size)
 {
-	i_size_write(&vnode->vfs_inode, size);
-	vnode->vfs_inode.i_blocks = ((size + 1023) >> 10) << 1;
+	i_size_write(&vnode->netfs.inode, size);
+	vnode->netfs.inode.i_blocks = ((size + 1023) >> 10) << 1;
 }
 
 /*
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -659,7 +659,7 @@ static void afs_i_init_once(void *_vnode
 	struct afs_vnode *vnode = _vnode;
 
 	memset(vnode, 0, sizeof(*vnode));
-	inode_init_once(&vnode->vfs_inode);
+	inode_init_once(&vnode->netfs.inode);
 	mutex_init(&vnode->io_lock);
 	init_rwsem(&vnode->validate_lock);
 	spin_lock_init(&vnode->wb_lock);
@@ -700,8 +700,8 @@ static struct inode *afs_alloc_inode(str
 	init_rwsem(&vnode->rmdir_lock);
 	INIT_WORK(&vnode->cb_work, afs_invalidate_mmap_work);
 
-	_leave(" = %p", &vnode->vfs_inode);
-	return &vnode->vfs_inode;
+	_leave(" = %p", &vnode->netfs.inode);
+	return &vnode->netfs.inode;
 }
 
 static void afs_free_inode(struct inode *inode)
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -146,10 +146,10 @@ int afs_write_end(struct file *file, str
 
 	write_end_pos = pos + copied;
 
-	i_size = i_size_read(&vnode->vfs_inode);
+	i_size = i_size_read(&vnode->netfs.inode);
 	if (write_end_pos > i_size) {
 		write_seqlock(&vnode->cb_lock);
-		i_size = i_size_read(&vnode->vfs_inode);
+		i_size = i_size_read(&vnode->netfs.inode);
 		if (write_end_pos > i_size)
 			afs_set_i_size(vnode, write_end_pos);
 		write_sequnlock(&vnode->cb_lock);
@@ -257,7 +257,7 @@ static void afs_redirty_pages(struct wri
  */
 static void afs_pages_written_back(struct afs_vnode *vnode, loff_t start, unsigned int len)
 {
-	struct address_space *mapping = vnode->vfs_inode.i_mapping;
+	struct address_space *mapping = vnode->netfs.inode.i_mapping;
 	struct folio *folio;
 	pgoff_t end;
 
@@ -354,7 +354,6 @@ static const struct afs_operation_ops af
 static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t pos,
 			  bool laundering)
 {
-	struct netfs_i_context *ictx = &vnode->netfs_ctx;
 	struct afs_operation *op;
 	struct afs_wb_key *wbk = NULL;
 	loff_t size = iov_iter_count(iter);
@@ -385,9 +384,9 @@ static int afs_store_data(struct afs_vno
 	op->store.write_iter = iter;
 	op->store.pos = pos;
 	op->store.size = size;
-	op->store.i_size = max(pos + size, ictx->remote_i_size);
+	op->store.i_size = max(pos + size, vnode->netfs.remote_i_size);
 	op->store.laundering = laundering;
-	op->mtime = vnode->vfs_inode.i_mtime;
+	op->mtime = vnode->netfs.inode.i_mtime;
 	op->flags |= AFS_OPERATION_UNINTR;
 	op->ops = &afs_store_data_operation;
 
@@ -554,7 +553,7 @@ static ssize_t afs_write_back_from_locke
 	struct iov_iter iter;
 	unsigned long priv;
 	unsigned int offset, to, len, max_len;
-	loff_t i_size = i_size_read(&vnode->vfs_inode);
+	loff_t i_size = i_size_read(&vnode->netfs.inode);
 	bool new_content = test_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags);
 	bool caching = fscache_cookie_enabled(afs_vnode_cache(vnode));
 	long count = wbc->nr_to_write;
@@ -845,7 +844,7 @@ ssize_t afs_file_write(struct kiocb *ioc
 	_enter("{%llx:%llu},{%zu},",
 	       vnode->fid.vid, vnode->fid.vnode, count);
 
-	if (IS_SWAPFILE(&vnode->vfs_inode)) {
+	if (IS_SWAPFILE(&vnode->netfs.inode)) {
 		printk(KERN_INFO
 		       "AFS: Attempt to write to active swap file!\n");
 		return -EBUSY;
@@ -958,8 +957,8 @@ void afs_prune_wb_keys(struct afs_vnode
 	/* Discard unused keys */
 	spin_lock(&vnode->wb_lock);
 
-	if (!mapping_tagged(&vnode->vfs_inode.i_data, PAGECACHE_TAG_WRITEBACK) &&
-	    !mapping_tagged(&vnode->vfs_inode.i_data, PAGECACHE_TAG_DIRTY)) {
+	if (!mapping_tagged(&vnode->netfs.inode.i_data, PAGECACHE_TAG_WRITEBACK) &&
+	    !mapping_tagged(&vnode->netfs.inode.i_data, PAGECACHE_TAG_DIRTY)) {
 		list_for_each_entry_safe(wbk, tmp, &vnode->wb_keys, vnode_link) {
 			if (refcount_read(&wbk->usage) == 1)
 				list_move(&wbk->vnode_link, &graveyard);
@@ -1034,6 +1033,6 @@ static void afs_write_to_cache(struct af
 			       bool caching)
 {
 	fscache_write_to_cache(afs_vnode_cache(vnode),
-			       vnode->vfs_inode.i_mapping, start, len, i_size,
+			       vnode->netfs.inode.i_mapping, start, len, i_size,
 			       afs_write_to_cache_done, vnode, caching);
 }
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1795,7 +1795,7 @@ enum {
 static int __ceph_pool_perm_get(struct ceph_inode_info *ci,
 				s64 pool, struct ceph_string *pool_ns)
 {
-	struct ceph_fs_client *fsc = ceph_inode_to_client(&ci->vfs_inode);
+	struct ceph_fs_client *fsc = ceph_inode_to_client(&ci->netfs.inode);
 	struct ceph_mds_client *mdsc = fsc->mdsc;
 	struct ceph_osd_request *rd_req = NULL, *wr_req = NULL;
 	struct rb_node **p, *parent;
@@ -1910,7 +1910,7 @@ static int __ceph_pool_perm_get(struct c
 				     0, false, true);
 	err = ceph_osdc_start_request(&fsc->client->osdc, rd_req, false);
 
-	wr_req->r_mtime = ci->vfs_inode.i_mtime;
+	wr_req->r_mtime = ci->netfs.inode.i_mtime;
 	err2 = ceph_osdc_start_request(&fsc->client->osdc, wr_req, false);
 
 	if (!err)
--- a/fs/ceph/cache.c
+++ b/fs/ceph/cache.c
@@ -29,9 +29,9 @@ void ceph_fscache_register_inode_cookie(
 	if (!(inode->i_state & I_NEW))
 		return;
 
-	WARN_ON_ONCE(ci->netfs_ctx.cache);
+	WARN_ON_ONCE(ci->netfs.cache);
 
-	ci->netfs_ctx.cache =
+	ci->netfs.cache =
 		fscache_acquire_cookie(fsc->fscache, 0,
 				       &ci->i_vino, sizeof(ci->i_vino),
 				       &ci->i_version, sizeof(ci->i_version),
--- a/fs/ceph/cache.h
+++ b/fs/ceph/cache.h
@@ -28,7 +28,7 @@ void ceph_fscache_invalidate(struct inod
 
 static inline struct fscache_cookie *ceph_fscache_cookie(struct ceph_inode_info *ci)
 {
-	return netfs_i_cookie(&ci->vfs_inode);
+	return netfs_i_cookie(&ci->netfs.inode);
 }
 
 static inline void ceph_fscache_resize(struct inode *inode, loff_t to)
--- a/fs/ceph/caps.c
+++ b/fs/ceph/caps.c
@@ -492,7 +492,7 @@ static void __cap_set_timeouts(struct ce
 	struct ceph_mount_options *opt = mdsc->fsc->mount_options;
 	ci->i_hold_caps_max = round_jiffies(jiffies +
 					    opt->caps_wanted_delay_max * HZ);
-	dout("__cap_set_timeouts %p %lu\n", &ci->vfs_inode,
+	dout("__cap_set_timeouts %p %lu\n", &ci->netfs.inode,
 	     ci->i_hold_caps_max - jiffies);
 }
 
@@ -507,7 +507,7 @@ static void __cap_set_timeouts(struct ce
 static void __cap_delay_requeue(struct ceph_mds_client *mdsc,
 				struct ceph_inode_info *ci)
 {
-	dout("__cap_delay_requeue %p flags 0x%lx at %lu\n", &ci->vfs_inode,
+	dout("__cap_delay_requeue %p flags 0x%lx at %lu\n", &ci->netfs.inode,
 	     ci->i_ceph_flags, ci->i_hold_caps_max);
 	if (!mdsc->stopping) {
 		spin_lock(&mdsc->cap_delay_lock);
@@ -531,7 +531,7 @@ no_change:
 static void __cap_delay_requeue_front(struct ceph_mds_client *mdsc,
 				      struct ceph_inode_info *ci)
 {
-	dout("__cap_delay_requeue_front %p\n", &ci->vfs_inode);
+	dout("__cap_delay_requeue_front %p\n", &ci->netfs.inode);
 	spin_lock(&mdsc->cap_delay_lock);
 	ci->i_ceph_flags |= CEPH_I_FLUSH;
 	if (!list_empty(&ci->i_cap_delay_list))
@@ -548,7 +548,7 @@ static void __cap_delay_requeue_front(st
 static void __cap_delay_cancel(struct ceph_mds_client *mdsc,
 			       struct ceph_inode_info *ci)
 {
-	dout("__cap_delay_cancel %p\n", &ci->vfs_inode);
+	dout("__cap_delay_cancel %p\n", &ci->netfs.inode);
 	if (list_empty(&ci->i_cap_delay_list))
 		return;
 	spin_lock(&mdsc->cap_delay_lock);
@@ -568,7 +568,7 @@ static void __check_cap_issue(struct cep
 	 * Each time we receive FILE_CACHE anew, we increment
 	 * i_rdcache_gen.
 	 */
-	if (S_ISREG(ci->vfs_inode.i_mode) &&
+	if (S_ISREG(ci->netfs.inode.i_mode) &&
 	    (issued & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) &&
 	    (had & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) == 0) {
 		ci->i_rdcache_gen++;
@@ -583,14 +583,14 @@ static void __check_cap_issue(struct cep
 	if ((issued & CEPH_CAP_FILE_SHARED) != (had & CEPH_CAP_FILE_SHARED)) {
 		if (issued & CEPH_CAP_FILE_SHARED)
 			atomic_inc(&ci->i_shared_gen);
-		if (S_ISDIR(ci->vfs_inode.i_mode)) {
-			dout(" marking %p NOT complete\n", &ci->vfs_inode);
+		if (S_ISDIR(ci->netfs.inode.i_mode)) {
+			dout(" marking %p NOT complete\n", &ci->netfs.inode);
 			__ceph_dir_clear_complete(ci);
 		}
 	}
 
 	/* Wipe saved layout if we're losing DIR_CREATE caps */
-	if (S_ISDIR(ci->vfs_inode.i_mode) && (had & CEPH_CAP_DIR_CREATE) &&
+	if (S_ISDIR(ci->netfs.inode.i_mode) && (had & CEPH_CAP_DIR_CREATE) &&
 		!(issued & CEPH_CAP_DIR_CREATE)) {
 	     ceph_put_string(rcu_dereference_raw(ci->i_cached_layout.pool_ns));
 	     memset(&ci->i_cached_layout, 0, sizeof(ci->i_cached_layout));
@@ -771,7 +771,7 @@ static int __cap_is_valid(struct ceph_ca
 
 	if (cap->cap_gen < gen || time_after_eq(jiffies, ttl)) {
 		dout("__cap_is_valid %p cap %p issued %s "
-		     "but STALE (gen %u vs %u)\n", &cap->ci->vfs_inode,
+		     "but STALE (gen %u vs %u)\n", &cap->ci->netfs.inode,
 		     cap, ceph_cap_string(cap->issued), cap->cap_gen, gen);
 		return 0;
 	}
@@ -797,7 +797,7 @@ int __ceph_caps_issued(struct ceph_inode
 		if (!__cap_is_valid(cap))
 			continue;
 		dout("__ceph_caps_issued %p cap %p issued %s\n",
-		     &ci->vfs_inode, cap, ceph_cap_string(cap->issued));
+		     &ci->netfs.inode, cap, ceph_cap_string(cap->issued));
 		have |= cap->issued;
 		if (implemented)
 			*implemented |= cap->implemented;
@@ -844,12 +844,12 @@ static void __touch_cap(struct ceph_cap
 
 	spin_lock(&s->s_cap_lock);
 	if (!s->s_cap_iterator) {
-		dout("__touch_cap %p cap %p mds%d\n", &cap->ci->vfs_inode, cap,
+		dout("__touch_cap %p cap %p mds%d\n", &cap->ci->netfs.inode, cap,
 		     s->s_mds);
 		list_move_tail(&cap->session_caps, &s->s_caps);
 	} else {
 		dout("__touch_cap %p cap %p mds%d NOP, iterating over caps\n",
-		     &cap->ci->vfs_inode, cap, s->s_mds);
+		     &cap->ci->netfs.inode, cap, s->s_mds);
 	}
 	spin_unlock(&s->s_cap_lock);
 }
@@ -867,7 +867,7 @@ int __ceph_caps_issued_mask(struct ceph_
 
 	if ((have & mask) == mask) {
 		dout("__ceph_caps_issued_mask ino 0x%llx snap issued %s"
-		     " (mask %s)\n", ceph_ino(&ci->vfs_inode),
+		     " (mask %s)\n", ceph_ino(&ci->netfs.inode),
 		     ceph_cap_string(have),
 		     ceph_cap_string(mask));
 		return 1;
@@ -879,7 +879,7 @@ int __ceph_caps_issued_mask(struct ceph_
 			continue;
 		if ((cap->issued & mask) == mask) {
 			dout("__ceph_caps_issued_mask ino 0x%llx cap %p issued %s"
-			     " (mask %s)\n", ceph_ino(&ci->vfs_inode), cap,
+			     " (mask %s)\n", ceph_ino(&ci->netfs.inode), cap,
 			     ceph_cap_string(cap->issued),
 			     ceph_cap_string(mask));
 			if (touch)
@@ -891,7 +891,7 @@ int __ceph_caps_issued_mask(struct ceph_
 		have |= cap->issued;
 		if ((have & mask) == mask) {
 			dout("__ceph_caps_issued_mask ino 0x%llx combo issued %s"
-			     " (mask %s)\n", ceph_ino(&ci->vfs_inode),
+			     " (mask %s)\n", ceph_ino(&ci->netfs.inode),
 			     ceph_cap_string(cap->issued),
 			     ceph_cap_string(mask));
 			if (touch) {
@@ -919,7 +919,7 @@ int __ceph_caps_issued_mask(struct ceph_
 int __ceph_caps_issued_mask_metric(struct ceph_inode_info *ci, int mask,
 				   int touch)
 {
-	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
+	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
 	int r;
 
 	r = __ceph_caps_issued_mask(ci, mask, touch);
@@ -950,7 +950,7 @@ int __ceph_caps_revoking_other(struct ce
 
 int ceph_caps_revoking(struct ceph_inode_info *ci, int mask)
 {
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	int ret;
 
 	spin_lock(&ci->i_ceph_lock);
@@ -969,8 +969,8 @@ int __ceph_caps_used(struct ceph_inode_i
 	if (ci->i_rd_ref)
 		used |= CEPH_CAP_FILE_RD;
 	if (ci->i_rdcache_ref ||
-	    (S_ISREG(ci->vfs_inode.i_mode) &&
-	     ci->vfs_inode.i_data.nrpages))
+	    (S_ISREG(ci->netfs.inode.i_mode) &&
+	     ci->netfs.inode.i_data.nrpages))
 		used |= CEPH_CAP_FILE_CACHE;
 	if (ci->i_wr_ref)
 		used |= CEPH_CAP_FILE_WR;
@@ -993,11 +993,11 @@ int __ceph_caps_file_wanted(struct ceph_
 	const int WR_SHIFT = ffs(CEPH_FILE_MODE_WR);
 	const int LAZY_SHIFT = ffs(CEPH_FILE_MODE_LAZY);
 	struct ceph_mount_options *opt =
-		ceph_inode_to_client(&ci->vfs_inode)->mount_options;
+		ceph_inode_to_client(&ci->netfs.inode)->mount_options;
 	unsigned long used_cutoff = jiffies - opt->caps_wanted_delay_max * HZ;
 	unsigned long idle_cutoff = jiffies - opt->caps_wanted_delay_min * HZ;
 
-	if (S_ISDIR(ci->vfs_inode.i_mode)) {
+	if (S_ISDIR(ci->netfs.inode.i_mode)) {
 		int want = 0;
 
 		/* use used_cutoff here, to keep dir's wanted caps longer */
@@ -1050,7 +1050,7 @@ int __ceph_caps_file_wanted(struct ceph_
 int __ceph_caps_wanted(struct ceph_inode_info *ci)
 {
 	int w = __ceph_caps_file_wanted(ci) | __ceph_caps_used(ci);
-	if (S_ISDIR(ci->vfs_inode.i_mode)) {
+	if (S_ISDIR(ci->netfs.inode.i_mode)) {
 		/* we want EXCL if holding caps of dir ops */
 		if (w & CEPH_CAP_ANY_DIR_OPS)
 			w |= CEPH_CAP_FILE_EXCL;
@@ -1116,9 +1116,9 @@ void __ceph_remove_cap(struct ceph_cap *
 
 	lockdep_assert_held(&ci->i_ceph_lock);
 
-	dout("__ceph_remove_cap %p from %p\n", cap, &ci->vfs_inode);
+	dout("__ceph_remove_cap %p from %p\n", cap, &ci->netfs.inode);
 
-	mdsc = ceph_inode_to_client(&ci->vfs_inode)->mdsc;
+	mdsc = ceph_inode_to_client(&ci->netfs.inode)->mdsc;
 
 	/* remove from inode's cap rbtree, and clear auth cap */
 	rb_erase(&cap->ci_node, &ci->i_caps);
@@ -1169,7 +1169,7 @@ void __ceph_remove_cap(struct ceph_cap *
 		 * keep i_snap_realm.
 		 */
 		if (ci->i_wr_ref == 0 && ci->i_snap_realm)
-			ceph_change_snap_realm(&ci->vfs_inode, NULL);
+			ceph_change_snap_realm(&ci->netfs.inode, NULL);
 
 		__cap_delay_cancel(mdsc, ci);
 	}
@@ -1188,11 +1188,11 @@ void ceph_remove_cap(struct ceph_cap *ca
 
 	lockdep_assert_held(&ci->i_ceph_lock);
 
-	fsc = ceph_inode_to_client(&ci->vfs_inode);
+	fsc = ceph_inode_to_client(&ci->netfs.inode);
 	WARN_ON_ONCE(ci->i_auth_cap == cap &&
 		     !list_empty(&ci->i_dirty_item) &&
 		     !fsc->blocklisted &&
-		     !ceph_inode_is_shutdown(&ci->vfs_inode));
+		     !ceph_inode_is_shutdown(&ci->netfs.inode));
 
 	__ceph_remove_cap(cap, queue_release);
 }
@@ -1343,7 +1343,7 @@ static void __prep_cap(struct cap_msg_ar
 		       int flushing, u64 flush_tid, u64 oldest_flush_tid)
 {
 	struct ceph_inode_info *ci = cap->ci;
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	int held, revoking;
 
 	lockdep_assert_held(&ci->i_ceph_lock);
@@ -1440,7 +1440,7 @@ static void __prep_cap(struct cap_msg_ar
 static void __send_cap(struct cap_msg_args *arg, struct ceph_inode_info *ci)
 {
 	struct ceph_msg *msg;
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 
 	msg = ceph_msg_new(CEPH_MSG_CLIENT_CAPS, CAP_MSG_SIZE, GFP_NOFS, false);
 	if (!msg) {
@@ -1528,7 +1528,7 @@ static void __ceph_flush_snaps(struct ce
 		__releases(ci->i_ceph_lock)
 		__acquires(ci->i_ceph_lock)
 {
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	struct ceph_mds_client *mdsc = session->s_mdsc;
 	struct ceph_cap_snap *capsnap;
 	u64 oldest_flush_tid = 0;
@@ -1621,7 +1621,7 @@ static void __ceph_flush_snaps(struct ce
 void ceph_flush_snaps(struct ceph_inode_info *ci,
 		      struct ceph_mds_session **psession)
 {
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	struct ceph_mds_client *mdsc = ceph_inode_to_client(inode)->mdsc;
 	struct ceph_mds_session *session = NULL;
 	int mds;
@@ -1681,8 +1681,8 @@ int __ceph_mark_dirty_caps(struct ceph_i
 			   struct ceph_cap_flush **pcf)
 {
 	struct ceph_mds_client *mdsc =
-		ceph_sb_to_client(ci->vfs_inode.i_sb)->mdsc;
-	struct inode *inode = &ci->vfs_inode;
+		ceph_sb_to_client(ci->netfs.inode.i_sb)->mdsc;
+	struct inode *inode = &ci->netfs.inode;
 	int was = ci->i_dirty_caps;
 	int dirty = 0;
 
@@ -1695,7 +1695,7 @@ int __ceph_mark_dirty_caps(struct ceph_i
 		return 0;
 	}
 
-	dout("__mark_dirty_caps %p %s dirty %s -> %s\n", &ci->vfs_inode,
+	dout("__mark_dirty_caps %p %s dirty %s -> %s\n", &ci->netfs.inode,
 	     ceph_cap_string(mask), ceph_cap_string(was),
 	     ceph_cap_string(was | mask));
 	ci->i_dirty_caps |= mask;
@@ -1711,7 +1711,7 @@ int __ceph_mark_dirty_caps(struct ceph_i
 				ci->i_snap_realm->cached_context);
 		}
 		dout(" inode %p now dirty snapc %p auth cap %p\n",
-		     &ci->vfs_inode, ci->i_head_snapc, ci->i_auth_cap);
+		     &ci->netfs.inode, ci->i_head_snapc, ci->i_auth_cap);
 		BUG_ON(!list_empty(&ci->i_dirty_item));
 		spin_lock(&mdsc->cap_dirty_lock);
 		list_add(&ci->i_dirty_item, &session->s_cap_dirty);
@@ -1874,7 +1874,7 @@ static int try_nonblocking_invalidate(st
 
 bool __ceph_should_report_size(struct ceph_inode_info *ci)
 {
-	loff_t size = i_size_read(&ci->vfs_inode);
+	loff_t size = i_size_read(&ci->netfs.inode);
 	/* mds will adjust max size according to the reported size */
 	if (ci->i_flushing_caps & CEPH_CAP_FILE_WR)
 		return false;
@@ -1899,7 +1899,7 @@ bool __ceph_should_report_size(struct ce
 void ceph_check_caps(struct ceph_inode_info *ci, int flags,
 		     struct ceph_mds_session *session)
 {
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(inode->i_sb);
 	struct ceph_cap *cap;
 	u64 flush_tid, oldest_flush_tid;
@@ -2446,7 +2446,7 @@ static void __kick_flushing_caps(struct
 	__releases(ci->i_ceph_lock)
 	__acquires(ci->i_ceph_lock)
 {
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	struct ceph_cap *cap;
 	struct ceph_cap_flush *cf;
 	int ret;
@@ -2539,7 +2539,7 @@ void ceph_early_kick_flushing_caps(struc
 		cap = ci->i_auth_cap;
 		if (!(cap && cap->session == session)) {
 			pr_err("%p auth cap %p not mds%d ???\n",
-				&ci->vfs_inode, cap, session->s_mds);
+				&ci->netfs.inode, cap, session->s_mds);
 			spin_unlock(&ci->i_ceph_lock);
 			continue;
 		}
@@ -2589,7 +2589,7 @@ void ceph_kick_flushing_caps(struct ceph
 		cap = ci->i_auth_cap;
 		if (!(cap && cap->session == session)) {
 			pr_err("%p auth cap %p not mds%d ???\n",
-				&ci->vfs_inode, cap, session->s_mds);
+				&ci->netfs.inode, cap, session->s_mds);
 			spin_unlock(&ci->i_ceph_lock);
 			continue;
 		}
@@ -2609,7 +2609,7 @@ void ceph_kick_flushing_inode_caps(struc
 
 	lockdep_assert_held(&ci->i_ceph_lock);
 
-	dout("%s %p flushing %s\n", __func__, &ci->vfs_inode,
+	dout("%s %p flushing %s\n", __func__, &ci->netfs.inode,
 	     ceph_cap_string(ci->i_flushing_caps));
 
 	if (!list_empty(&ci->i_cap_flush_list)) {
@@ -2652,10 +2652,10 @@ void ceph_take_cap_refs(struct ceph_inod
 	}
 	if (got & CEPH_CAP_FILE_BUFFER) {
 		if (ci->i_wb_ref == 0)
-			ihold(&ci->vfs_inode);
+			ihold(&ci->netfs.inode);
 		ci->i_wb_ref++;
 		dout("%s %p wb %d -> %d (?)\n", __func__,
-		     &ci->vfs_inode, ci->i_wb_ref-1, ci->i_wb_ref);
+		     &ci->netfs.inode, ci->i_wb_ref-1, ci->i_wb_ref);
 	}
 }
 
@@ -2983,7 +2983,7 @@ int ceph_get_caps(struct file *filp, int
 			return ret;
 		}
 
-		if (S_ISREG(ci->vfs_inode.i_mode) &&
+		if (S_ISREG(ci->netfs.inode.i_mode) &&
 		    ci->i_inline_version != CEPH_INLINE_NONE &&
 		    (_got & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) &&
 		    i_size_read(inode) > 0) {
@@ -3073,7 +3073,7 @@ enum put_cap_refs_mode {
 static void __ceph_put_cap_refs(struct ceph_inode_info *ci, int had,
 				enum put_cap_refs_mode mode)
 {
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	int last = 0, put = 0, flushsnaps = 0, wake = 0;
 	bool check_flushsnaps = false;
 
@@ -3181,7 +3181,7 @@ void ceph_put_cap_refs_no_check_caps(str
 void ceph_put_wrbuffer_cap_refs(struct ceph_inode_info *ci, int nr,
 				struct ceph_snap_context *snapc)
 {
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	struct ceph_cap_snap *capsnap = NULL;
 	int put = 0;
 	bool last = false;
@@ -3678,7 +3678,7 @@ static void handle_cap_flush_ack(struct
 				     session->s_mds,
 				     &list_first_entry(&session->s_cap_flushing,
 						struct ceph_inode_info,
-						i_flushing_item)->vfs_inode);
+						i_flushing_item)->netfs.inode);
 			}
 		}
 		mdsc->num_cap_flushing--;
@@ -4326,7 +4326,7 @@ unsigned long ceph_check_delayed_caps(st
 			break;
 		list_del_init(&ci->i_cap_delay_list);
 
-		inode = igrab(&ci->vfs_inode);
+		inode = igrab(&ci->netfs.inode);
 		if (inode) {
 			spin_unlock(&mdsc->cap_delay_lock);
 			dout("check_delayed_caps on %p\n", inode);
@@ -4354,7 +4354,7 @@ static void flush_dirty_session_caps(str
 	while (!list_empty(&s->s_cap_dirty)) {
 		ci = list_first_entry(&s->s_cap_dirty, struct ceph_inode_info,
 				      i_dirty_item);
-		inode = &ci->vfs_inode;
+		inode = &ci->netfs.inode;
 		ihold(inode);
 		dout("flush_dirty_caps %llx.%llx\n", ceph_vinop(inode));
 		spin_unlock(&mdsc->cap_dirty_lock);
@@ -4388,7 +4388,7 @@ void __ceph_touch_fmode(struct ceph_inod
 
 void ceph_get_fmode(struct ceph_inode_info *ci, int fmode, int count)
 {
-	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(ci->vfs_inode.i_sb);
+	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(ci->netfs.inode.i_sb);
 	int bits = (fmode << 1) | 1;
 	bool already_opened = false;
 	int i;
@@ -4422,7 +4422,7 @@ void ceph_get_fmode(struct ceph_inode_in
  */
 void ceph_put_fmode(struct ceph_inode_info *ci, int fmode, int count)
 {
-	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(ci->vfs_inode.i_sb);
+	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(ci->netfs.inode.i_sb);
 	int bits = (fmode << 1) | 1;
 	bool is_closed = true;
 	int i;
@@ -4637,7 +4637,7 @@ int ceph_purge_inode_cap(struct inode *i
 	lockdep_assert_held(&ci->i_ceph_lock);
 
 	dout("removing cap %p, ci is %p, inode is %p\n",
-	     cap, ci, &ci->vfs_inode);
+	     cap, ci, &ci->netfs.inode);
 
 	is_auth = (cap == ci->i_auth_cap);
 	__ceph_remove_cap(cap, false);
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -205,7 +205,7 @@ static int ceph_init_file_info(struct in
 {
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_mount_options *opt =
-		ceph_inode_to_client(&ci->vfs_inode)->mount_options;
+		ceph_inode_to_client(&ci->netfs.inode)->mount_options;
 	struct ceph_file_info *fi;
 	int ret;
 
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -20,9 +20,6 @@
 #include "cache.h"
 #include <linux/ceph/decode.h>
 
-// Temporary: netfs does disgusting things with inode pointers
-#pragma GCC diagnostic ignored "-Wattribute-warning"
-
 /*
  * Ceph inode operations
  *
@@ -179,7 +176,7 @@ static struct ceph_inode_frag *__get_or_
 	rb_insert_color(&frag->node, &ci->i_fragtree);
 
 	dout("get_or_create_frag added %llx.%llx frag %x\n",
-	     ceph_vinop(&ci->vfs_inode), f);
+	     ceph_vinop(&ci->netfs.inode), f);
 	return frag;
 }
 
@@ -460,10 +457,10 @@ struct inode *ceph_alloc_inode(struct su
 	if (!ci)
 		return NULL;
 
-	dout("alloc_inode %p\n", &ci->vfs_inode);
+	dout("alloc_inode %p\n", &ci->netfs.inode);
 
 	/* Set parameters for the netfs library */
-	netfs_i_context_init(&ci->vfs_inode, &ceph_netfs_ops);
+	netfs_inode_init(&ci->netfs.inode, &ceph_netfs_ops);
 
 	spin_lock_init(&ci->i_ceph_lock);
 
@@ -550,7 +547,7 @@ struct inode *ceph_alloc_inode(struct su
 	INIT_WORK(&ci->i_work, ceph_inode_work);
 	ci->i_work_mask = 0;
 	memset(&ci->i_btime, '\0', sizeof(ci->i_btime));
-	return &ci->vfs_inode;
+	return &ci->netfs.inode;
 }
 
 void ceph_free_inode(struct inode *inode)
@@ -1980,7 +1977,7 @@ static void ceph_inode_work(struct work_
 {
 	struct ceph_inode_info *ci = container_of(work, struct ceph_inode_info,
 						 i_work);
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 
 	if (test_and_clear_bit(CEPH_I_WORK_WRITEBACK, &ci->i_work_mask)) {
 		dout("writeback %p\n", inode);
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -1564,7 +1564,7 @@ int ceph_iterate_session_caps(struct cep
 	p = session->s_caps.next;
 	while (p != &session->s_caps) {
 		cap = list_entry(p, struct ceph_cap, session_caps);
-		inode = igrab(&cap->ci->vfs_inode);
+		inode = igrab(&cap->ci->netfs.inode);
 		if (!inode) {
 			p = p->next;
 			continue;
@@ -1622,7 +1622,7 @@ static int remove_session_caps_cb(struct
 	int iputs;
 
 	dout("removing cap %p, ci is %p, inode is %p\n",
-	     cap, ci, &ci->vfs_inode);
+	     cap, ci, &ci->netfs.inode);
 	spin_lock(&ci->i_ceph_lock);
 	iputs = ceph_purge_inode_cap(inode, cap, &invalidate);
 	spin_unlock(&ci->i_ceph_lock);
--- a/fs/ceph/snap.c
+++ b/fs/ceph/snap.c
@@ -521,7 +521,7 @@ static bool has_new_snaps(struct ceph_sn
 static void ceph_queue_cap_snap(struct ceph_inode_info *ci,
 				struct ceph_cap_snap **pcapsnap)
 {
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	struct ceph_snap_context *old_snapc, *new_snapc;
 	struct ceph_cap_snap *capsnap = *pcapsnap;
 	struct ceph_buffer *old_blob = NULL;
@@ -652,7 +652,7 @@ update_snapc:
 int __ceph_finish_cap_snap(struct ceph_inode_info *ci,
 			    struct ceph_cap_snap *capsnap)
 {
-	struct inode *inode = &ci->vfs_inode;
+	struct inode *inode = &ci->netfs.inode;
 	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(inode->i_sb);
 
 	BUG_ON(capsnap->writing);
@@ -712,7 +712,7 @@ static void queue_realm_cap_snaps(struct
 
 	spin_lock(&realm->inodes_with_caps_lock);
 	list_for_each_entry(ci, &realm->inodes_with_caps, i_snap_realm_item) {
-		struct inode *inode = igrab(&ci->vfs_inode);
+		struct inode *inode = igrab(&ci->netfs.inode);
 		if (!inode)
 			continue;
 		spin_unlock(&realm->inodes_with_caps_lock);
@@ -904,7 +904,7 @@ static void flush_snaps(struct ceph_mds_
 	while (!list_empty(&mdsc->snap_flush_list)) {
 		ci = list_first_entry(&mdsc->snap_flush_list,
 				struct ceph_inode_info, i_snap_flush_item);
-		inode = &ci->vfs_inode;
+		inode = &ci->netfs.inode;
 		ihold(inode);
 		spin_unlock(&mdsc->snap_flush_lock);
 		ceph_flush_snaps(ci, &session);
--- a/fs/ceph/super.c
+++ b/fs/ceph/super.c
@@ -876,7 +876,7 @@ mempool_t *ceph_wb_pagevec_pool;
 static void ceph_inode_init_once(void *foo)
 {
 	struct ceph_inode_info *ci = foo;
-	inode_init_once(&ci->vfs_inode);
+	inode_init_once(&ci->netfs.inode);
 }
 
 static int __init init_caches(void)
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -316,11 +316,7 @@ struct ceph_inode_xattrs_info {
  * Ceph inode.
  */
 struct ceph_inode_info {
-	struct {
-		/* These must be contiguous */
-		struct inode vfs_inode;
-		struct netfs_i_context netfs_ctx; /* Netfslib context */
-	};
+	struct netfs_inode netfs; /* Netfslib context and vfs inode */
 	struct ceph_vino i_vino;   /* ceph ino + snap */
 
 	spinlock_t i_ceph_lock;
@@ -436,7 +432,7 @@ struct ceph_inode_info {
 static inline struct ceph_inode_info *
 ceph_inode(const struct inode *inode)
 {
-	return container_of(inode, struct ceph_inode_info, vfs_inode);
+	return container_of(inode, struct ceph_inode_info, netfs.inode);
 }
 
 static inline struct ceph_fs_client *
@@ -1295,7 +1291,7 @@ static inline void __ceph_update_quota(s
 	has_quota = __ceph_has_any_quota(ci);
 
 	if (had_quota != has_quota)
-		ceph_adjust_quota_realms_count(&ci->vfs_inode, has_quota);
+		ceph_adjust_quota_realms_count(&ci->netfs.inode, has_quota);
 }
 
 extern void ceph_handle_quota(struct ceph_mds_client *mdsc,
--- a/fs/ceph/xattr.c
+++ b/fs/ceph/xattr.c
@@ -57,7 +57,7 @@ static bool ceph_vxattrcb_layout_exists(
 static ssize_t ceph_vxattrcb_layout(struct ceph_inode_info *ci, char *val,
 				    size_t size)
 {
-	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
+	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
 	struct ceph_osd_client *osdc = &fsc->client->osdc;
 	struct ceph_string *pool_ns;
 	s64 pool = ci->i_layout.pool_id;
@@ -69,7 +69,7 @@ static ssize_t ceph_vxattrcb_layout(stru
 
 	pool_ns = ceph_try_get_string(ci->i_layout.pool_ns);
 
-	dout("ceph_vxattrcb_layout %p\n", &ci->vfs_inode);
+	dout("ceph_vxattrcb_layout %p\n", &ci->netfs.inode);
 	down_read(&osdc->lock);
 	pool_name = ceph_pg_pool_name_by_id(osdc->osdmap, pool);
 	if (pool_name) {
@@ -161,7 +161,7 @@ static ssize_t ceph_vxattrcb_layout_pool
 					 char *val, size_t size)
 {
 	ssize_t ret;
-	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
+	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
 	struct ceph_osd_client *osdc = &fsc->client->osdc;
 	s64 pool = ci->i_layout.pool_id;
 	const char *pool_name;
@@ -313,7 +313,7 @@ static ssize_t ceph_vxattrcb_snap_btime(
 static ssize_t ceph_vxattrcb_cluster_fsid(struct ceph_inode_info *ci,
 					  char *val, size_t size)
 {
-	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
+	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
 
 	return ceph_fmt_xattr(val, size, "%pU", &fsc->client->fsid);
 }
@@ -321,7 +321,7 @@ static ssize_t ceph_vxattrcb_cluster_fsi
 static ssize_t ceph_vxattrcb_client_id(struct ceph_inode_info *ci,
 				       char *val, size_t size)
 {
-	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
+	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
 
 	return ceph_fmt_xattr(val, size, "client%lld",
 			      ceph_client_gid(fsc->client));
@@ -629,7 +629,7 @@ static int __set_xattr(struct ceph_inode
 	}
 
 	dout("__set_xattr_val added %llx.%llx xattr %p %.*s=%.*s\n",
-	     ceph_vinop(&ci->vfs_inode), xattr, name_len, name, val_len, val);
+	     ceph_vinop(&ci->netfs.inode), xattr, name_len, name, val_len, val);
 
 	return 0;
 }
@@ -871,7 +871,7 @@ struct ceph_buffer *__ceph_build_xattrs_
 	struct ceph_buffer *old_blob = NULL;
 	void *dest;
 
-	dout("__build_xattrs_blob %p\n", &ci->vfs_inode);
+	dout("__build_xattrs_blob %p\n", &ci->netfs.inode);
 	if (ci->i_xattrs.dirty) {
 		int need = __get_required_blob_size(ci, 0, 0);
 
--- a/fs/cifs/cifsfs.c
+++ b/fs/cifs/cifsfs.c
@@ -377,7 +377,7 @@ cifs_alloc_inode(struct super_block *sb)
 	cifs_inode->flags = 0;
 	spin_lock_init(&cifs_inode->writers_lock);
 	cifs_inode->writers = 0;
-	cifs_inode->vfs_inode.i_blkbits = 14;  /* 2**14 = CIFS_MAX_MSGSIZE */
+	cifs_inode->netfs.inode.i_blkbits = 14;  /* 2**14 = CIFS_MAX_MSGSIZE */
 	cifs_inode->server_eof = 0;
 	cifs_inode->uniqueid = 0;
 	cifs_inode->createtime = 0;
@@ -389,12 +389,12 @@ cifs_alloc_inode(struct super_block *sb)
 	 * Can not set i_flags here - they get immediately overwritten to zero
 	 * by the VFS.
 	 */
-	/* cifs_inode->vfs_inode.i_flags = S_NOATIME | S_NOCMTIME; */
+	/* cifs_inode->netfs.inode.i_flags = S_NOATIME | S_NOCMTIME; */
 	INIT_LIST_HEAD(&cifs_inode->openFileList);
 	INIT_LIST_HEAD(&cifs_inode->llist);
 	INIT_LIST_HEAD(&cifs_inode->deferred_closes);
 	spin_lock_init(&cifs_inode->deferred_lock);
-	return &cifs_inode->vfs_inode;
+	return &cifs_inode->netfs.inode;
 }
 
 static void
@@ -1416,7 +1416,7 @@ cifs_init_once(void *inode)
 {
 	struct cifsInodeInfo *cifsi = inode;
 
-	inode_init_once(&cifsi->vfs_inode);
+	inode_init_once(&cifsi->netfs.inode);
 	init_rwsem(&cifsi->lock_sem);
 }
 
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -1414,20 +1414,16 @@ void cifsFileInfo_put(struct cifsFileInf
 #define CIFS_CACHE_RW_FLG	(CIFS_CACHE_READ_FLG | CIFS_CACHE_WRITE_FLG)
 #define CIFS_CACHE_RHW_FLG	(CIFS_CACHE_RW_FLG | CIFS_CACHE_HANDLE_FLG)
 
-#define CIFS_CACHE_READ(cinode) ((cinode->oplock & CIFS_CACHE_READ_FLG) || (CIFS_SB(cinode->vfs_inode.i_sb)->mnt_cifs_flags & CIFS_MOUNT_RO_CACHE))
+#define CIFS_CACHE_READ(cinode) ((cinode->oplock & CIFS_CACHE_READ_FLG) || (CIFS_SB(cinode->netfs.inode.i_sb)->mnt_cifs_flags & CIFS_MOUNT_RO_CACHE))
 #define CIFS_CACHE_HANDLE(cinode) (cinode->oplock & CIFS_CACHE_HANDLE_FLG)
-#define CIFS_CACHE_WRITE(cinode) ((cinode->oplock & CIFS_CACHE_WRITE_FLG) || (CIFS_SB(cinode->vfs_inode.i_sb)->mnt_cifs_flags & CIFS_MOUNT_RW_CACHE))
+#define CIFS_CACHE_WRITE(cinode) ((cinode->oplock & CIFS_CACHE_WRITE_FLG) || (CIFS_SB(cinode->netfs.inode.i_sb)->mnt_cifs_flags & CIFS_MOUNT_RW_CACHE))
 
 /*
  * One of these for each file inode
  */
 
 struct cifsInodeInfo {
-	struct {
-		/* These must be contiguous */
-		struct inode	vfs_inode;	/* the VFS's inode record */
-		struct netfs_i_context netfs_ctx; /* Netfslib context */
-	};
+	struct netfs_inode netfs; /* Netfslib context and vfs inode */
 	bool can_cache_brlcks;
 	struct list_head llist;	/* locks helb by this inode */
 	/*
@@ -1466,7 +1462,7 @@ struct cifsInodeInfo {
 static inline struct cifsInodeInfo *
 CIFS_I(struct inode *inode)
 {
-	return container_of(inode, struct cifsInodeInfo, vfs_inode);
+	return container_of(inode, struct cifsInodeInfo, netfs.inode);
 }
 
 static inline struct cifs_sb_info *
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -2004,7 +2004,7 @@ struct cifsFileInfo *find_readable_file(
 					bool fsuid_only)
 {
 	struct cifsFileInfo *open_file = NULL;
-	struct cifs_sb_info *cifs_sb = CIFS_SB(cifs_inode->vfs_inode.i_sb);
+	struct cifs_sb_info *cifs_sb = CIFS_SB(cifs_inode->netfs.inode.i_sb);
 
 	/* only filter by fsuid on multiuser mounts */
 	if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_MULTIUSER))
@@ -2060,7 +2060,7 @@ cifs_get_writable_file(struct cifsInodeI
 		return rc;
 	}
 
-	cifs_sb = CIFS_SB(cifs_inode->vfs_inode.i_sb);
+	cifs_sb = CIFS_SB(cifs_inode->netfs.inode.i_sb);
 
 	/* only filter by fsuid on multiuser mounts */
 	if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_MULTIUSER))
@@ -4665,14 +4665,14 @@ bool is_size_safe_to_change(struct cifsI
 		/* This inode is open for write at least once */
 		struct cifs_sb_info *cifs_sb;
 
-		cifs_sb = CIFS_SB(cifsInode->vfs_inode.i_sb);
+		cifs_sb = CIFS_SB(cifsInode->netfs.inode.i_sb);
 		if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_DIRECT_IO) {
 			/* since no page cache to corrupt on directio
 			we can change size safely */
 			return true;
 		}
 
-		if (i_size_read(&cifsInode->vfs_inode) < end_of_file)
+		if (i_size_read(&cifsInode->netfs.inode) < end_of_file)
 			return true;
 
 		return false;
--- a/fs/cifs/fscache.c
+++ b/fs/cifs/fscache.c
@@ -101,13 +101,13 @@ void cifs_fscache_get_inode_cookie(struc
 	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
 	struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
 
-	cifs_fscache_fill_coherency(&cifsi->vfs_inode, &cd);
+	cifs_fscache_fill_coherency(&cifsi->netfs.inode, &cd);
 
-	cifsi->netfs_ctx.cache =
+	cifsi->netfs.cache =
 		fscache_acquire_cookie(tcon->fscache, 0,
 				       &cifsi->uniqueid, sizeof(cifsi->uniqueid),
 				       &cd, sizeof(cd),
-				       i_size_read(&cifsi->vfs_inode));
+				       i_size_read(&cifsi->netfs.inode));
 }
 
 void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool update)
@@ -131,7 +131,7 @@ void cifs_fscache_release_inode_cookie(s
 	if (cookie) {
 		cifs_dbg(FYI, "%s: (0x%p)\n", __func__, cookie);
 		fscache_relinquish_cookie(cookie, false);
-		cifsi->netfs_ctx.cache = NULL;
+		cifsi->netfs.cache = NULL;
 	}
 }
 
--- a/fs/cifs/fscache.h
+++ b/fs/cifs/fscache.h
@@ -52,10 +52,10 @@ void cifs_fscache_fill_coherency(struct
 	struct cifsInodeInfo *cifsi = CIFS_I(inode);
 
 	memset(cd, 0, sizeof(*cd));
-	cd->last_write_time_sec   = cpu_to_le64(cifsi->vfs_inode.i_mtime.tv_sec);
-	cd->last_write_time_nsec  = cpu_to_le32(cifsi->vfs_inode.i_mtime.tv_nsec);
-	cd->last_change_time_sec  = cpu_to_le64(cifsi->vfs_inode.i_ctime.tv_sec);
-	cd->last_change_time_nsec = cpu_to_le32(cifsi->vfs_inode.i_ctime.tv_nsec);
+	cd->last_write_time_sec   = cpu_to_le64(cifsi->netfs.inode.i_mtime.tv_sec);
+	cd->last_write_time_nsec  = cpu_to_le32(cifsi->netfs.inode.i_mtime.tv_nsec);
+	cd->last_change_time_sec  = cpu_to_le64(cifsi->netfs.inode.i_ctime.tv_sec);
+	cd->last_change_time_nsec = cpu_to_le32(cifsi->netfs.inode.i_ctime.tv_nsec);
 }
 
 
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -115,7 +115,7 @@ cifs_revalidate_cache(struct inode *inod
 		 __func__, cifs_i->uniqueid);
 	set_bit(CIFS_INO_INVALID_MAPPING, &cifs_i->flags);
 	/* Invalidate fscache cookie */
-	cifs_fscache_fill_coherency(&cifs_i->vfs_inode, &cd);
+	cifs_fscache_fill_coherency(&cifs_i->netfs.inode, &cd);
 	fscache_invalidate(cifs_inode_cookie(inode), &cd, i_size_read(inode), 0);
 }
 
@@ -2499,7 +2499,7 @@ int cifs_fiemap(struct inode *inode, str
 		u64 len)
 {
 	struct cifsInodeInfo *cifs_i = CIFS_I(inode);
-	struct cifs_sb_info *cifs_sb = CIFS_SB(cifs_i->vfs_inode.i_sb);
+	struct cifs_sb_info *cifs_sb = CIFS_SB(cifs_i->netfs.inode.i_sb);
 	struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
 	struct TCP_Server_Info *server = tcon->ses->server;
 	struct cifsFileInfo *cfile;
--- a/fs/cifs/misc.c
+++ b/fs/cifs/misc.c
@@ -535,11 +535,11 @@ void cifs_set_oplock_level(struct cifsIn
 	if (oplock == OPLOCK_EXCLUSIVE) {
 		cinode->oplock = CIFS_CACHE_WRITE_FLG | CIFS_CACHE_READ_FLG;
 		cifs_dbg(FYI, "Exclusive Oplock granted on inode %p\n",
-			 &cinode->vfs_inode);
+			 &cinode->netfs.inode);
 	} else if (oplock == OPLOCK_READ) {
 		cinode->oplock = CIFS_CACHE_READ_FLG;
 		cifs_dbg(FYI, "Level II Oplock granted on inode %p\n",
-			 &cinode->vfs_inode);
+			 &cinode->netfs.inode);
 	} else
 		cinode->oplock = 0;
 }
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -4241,15 +4241,15 @@ smb2_set_oplock_level(struct cifsInodeIn
 	if (oplock == SMB2_OPLOCK_LEVEL_BATCH) {
 		cinode->oplock = CIFS_CACHE_RHW_FLG;
 		cifs_dbg(FYI, "Batch Oplock granted on inode %p\n",
-			 &cinode->vfs_inode);
+			 &cinode->netfs.inode);
 	} else if (oplock == SMB2_OPLOCK_LEVEL_EXCLUSIVE) {
 		cinode->oplock = CIFS_CACHE_RW_FLG;
 		cifs_dbg(FYI, "Exclusive Oplock granted on inode %p\n",
-			 &cinode->vfs_inode);
+			 &cinode->netfs.inode);
 	} else if (oplock == SMB2_OPLOCK_LEVEL_II) {
 		cinode->oplock = CIFS_CACHE_READ_FLG;
 		cifs_dbg(FYI, "Level II Oplock granted on inode %p\n",
-			 &cinode->vfs_inode);
+			 &cinode->netfs.inode);
 	} else
 		cinode->oplock = 0;
 }
@@ -4288,7 +4288,7 @@ smb21_set_oplock_level(struct cifsInodeI
 
 	cinode->oplock = new_oplock;
 	cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
-		 &cinode->vfs_inode);
+		 &cinode->netfs.inode);
 }
 
 static void
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -155,7 +155,7 @@ static void netfs_rreq_expand(struct net
 void netfs_readahead(struct readahead_control *ractl)
 {
 	struct netfs_io_request *rreq;
-	struct netfs_i_context *ctx = netfs_i_context(ractl->mapping->host);
+	struct netfs_inode *ctx = netfs_inode(ractl->mapping->host);
 	int ret;
 
 	_enter("%lx,%x", readahead_index(ractl), readahead_count(ractl));
@@ -216,7 +216,7 @@ int netfs_readpage(struct file *file, st
 	struct folio *folio = page_folio(subpage);
 	struct address_space *mapping = folio_file_mapping(folio);
 	struct netfs_io_request *rreq;
-	struct netfs_i_context *ctx = netfs_i_context(mapping->host);
+	struct netfs_inode *ctx = netfs_inode(mapping->host);
 	int ret;
 
 	_enter("%lx", folio_index(folio));
@@ -333,7 +333,7 @@ int netfs_write_begin(struct file *file,
 		      struct folio **_folio, void **_fsdata)
 {
 	struct netfs_io_request *rreq;
-	struct netfs_i_context *ctx = netfs_i_context(file_inode(file ));
+	struct netfs_inode *ctx = netfs_inode(file_inode(file ));
 	struct folio *folio;
 	unsigned int fgp_flags;
 	pgoff_t index = pos >> PAGE_SHIFT;
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -91,7 +91,7 @@ static inline void netfs_stat_d(atomic_t
 /*
  * Miscellaneous functions.
  */
-static inline bool netfs_is_cache_enabled(struct netfs_i_context *ctx)
+static inline bool netfs_is_cache_enabled(struct netfs_inode *ctx)
 {
 #if IS_ENABLED(CONFIG_FSCACHE)
 	struct fscache_cookie *cookie = ctx->cache;
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -18,7 +18,7 @@ struct netfs_io_request *netfs_alloc_req
 {
 	static atomic_t debug_ids;
 	struct inode *inode = file ? file_inode(file) : mapping->host;
-	struct netfs_i_context *ctx = netfs_i_context(inode);
+	struct netfs_inode *ctx = netfs_inode(inode);
 	struct netfs_io_request *rreq;
 	int ret;
 
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -119,9 +119,10 @@ typedef void (*netfs_io_terminated_t)(vo
 				      bool was_async);
 
 /*
- * Per-inode description.  This must be directly after the inode struct.
+ * Per-inode context.  This wraps the VFS inode.
  */
-struct netfs_i_context {
+struct netfs_inode {
+	struct inode		inode;		/* The VFS inode */
 	const struct netfs_request_ops *ops;
 #if IS_ENABLED(CONFIG_FSCACHE)
 	struct fscache_cookie	*cache;
@@ -255,7 +256,7 @@ struct netfs_cache_ops {
 	 * boundary as appropriate.
 	 */
 	enum netfs_io_source (*prepare_read)(struct netfs_io_subrequest *subreq,
-					       loff_t i_size);
+					     loff_t i_size);
 
 	/* Prepare a write operation, working out what part of the write we can
 	 * actually do.
@@ -287,45 +288,35 @@ extern void netfs_put_subrequest(struct
 extern void netfs_stats_show(struct seq_file *);
 
 /**
- * netfs_i_context - Get the netfs inode context from the inode
+ * netfs_inode - Get the netfs inode context from the inode
  * @inode: The inode to query
  *
  * Get the netfs lib inode context from the network filesystem's inode.  The
  * context struct is expected to directly follow on from the VFS inode struct.
  */
-static inline struct netfs_i_context *netfs_i_context(struct inode *inode)
+static inline struct netfs_inode *netfs_inode(struct inode *inode)
 {
-	return (struct netfs_i_context *)(inode + 1);
+	return container_of(inode, struct netfs_inode, inode);
 }
 
 /**
- * netfs_inode - Get the netfs inode from the inode context
- * @ctx: The context to query
- *
- * Get the netfs inode from the netfs library's inode context.  The VFS inode
- * is expected to directly precede the context struct.
- */
-static inline struct inode *netfs_inode(struct netfs_i_context *ctx)
-{
-	return ((struct inode *)ctx) - 1;
-}
-
-/**
- * netfs_i_context_init - Initialise a netfs lib context
+ * netfs_inode_init - Initialise a netfslib inode context
  * @inode: The inode with which the context is associated
  * @ops: The netfs's operations list
  *
  * Initialise the netfs library context struct.  This is expected to follow on
  * directly from the VFS inode struct.
  */
-static inline void netfs_i_context_init(struct inode *inode,
-					const struct netfs_request_ops *ops)
+static inline void netfs_inode_init(struct inode *inode,
+				    const struct netfs_request_ops *ops)
 {
-	struct netfs_i_context *ctx = netfs_i_context(inode);
+	struct netfs_inode *ctx = netfs_inode(inode);
 
-	memset(ctx, 0, sizeof(*ctx));
 	ctx->ops = ops;
 	ctx->remote_i_size = i_size_read(inode);
+#if IS_ENABLED(CONFIG_FSCACHE)
+	ctx->cache = NULL;
+#endif
 }
 
 /**
@@ -337,7 +328,7 @@ static inline void netfs_i_context_init(
  */
 static inline void netfs_resize_file(struct inode *inode, loff_t new_i_size)
 {
-	struct netfs_i_context *ctx = netfs_i_context(inode);
+	struct netfs_inode *ctx = netfs_inode(inode);
 
 	ctx->remote_i_size = new_i_size;
 }
@@ -351,7 +342,7 @@ static inline void netfs_resize_file(str
 static inline struct fscache_cookie *netfs_i_cookie(struct inode *inode)
 {
 #if IS_ENABLED(CONFIG_FSCACHE)
-	struct netfs_i_context *ctx = netfs_i_context(inode);
+	struct netfs_inode *ctx = netfs_inode(inode);
 	return ctx->cache;
 #else
 	return NULL;


