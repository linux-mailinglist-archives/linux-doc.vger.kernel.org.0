Return-Path: <linux-doc+bounces-25009-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E25975AFB
	for <lists+linux-doc@lfdr.de>; Wed, 11 Sep 2024 21:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9506DB21862
	for <lists+linux-doc@lfdr.de>; Wed, 11 Sep 2024 19:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6E31B5808;
	Wed, 11 Sep 2024 19:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CtZZS776"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C891BBBFE
	for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 19:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726083813; cv=none; b=QXXsAXqEIbs2HxPgcmgeCnRu8BRhKXmg26UZw8EFDpkvvfLDODw2xi37pgEZXng5/vYJQtkePnmFWVBzyK+2djHY2kGf5v+QnUDTrP9PzLTgmFVNFge17HkLG7f0NZYMEVVlYHlLz6bcAFmfn3Cc8TLTbeWjoj481UuPK6aF6jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726083813; c=relaxed/simple;
	bh=ePfUocyP7grZ5CDYVXoBDNFKwP41bxMPDU//9kt//Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMxtBRWOn5xxrGPRCyGQTsSR9fmN/dk9lryD06vP8musOcexZutdKpl5c7304cTNjKtKTPswdnTcdoi+cn62o4WCT/UlAJ9yJXykaKEFdgMe40zagHtEx4bYbCnjkvnfNYVLzNTw/e7NZ4jtYtJUrD4mEkoenh7aVZ92Ylm/9bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CtZZS776; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726083811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/RZ3edwXcia6MZkZjPsBRO16l+GEAsyaTjIaabh2Mx0=;
	b=CtZZS776xyivJoPsQx3/PfP6cHjRoSxDcMjWQrw/NnHEZpIU66GL7EDvmXwhmHd8Z2SLas
	GDGIwZaxFnMnAQeSYW4gfa5dfg0RrI0x8aowLXKkBVpQIuqTzIqAWryyCsJyxqPQyiCDB6
	w8/Wtn65sp8JRklWROAHvgac1iEtUUw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-Vl4PSZm0M46c4jBtI8fjnw-1; Wed,
 11 Sep 2024 15:43:29 -0400
X-MC-Unique: Vl4PSZm0M46c4jBtI8fjnw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 861721956089;
	Wed, 11 Sep 2024 19:43:26 +0000 (UTC)
Received: from bcodding.csb.redhat.com (unknown [10.22.48.7])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 16B8B1956086;
	Wed, 11 Sep 2024 19:43:21 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Neil Brown <neilb@suse.de>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andreas Gruenbacher <agruenba@redhat.com>,
	Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Ahring Oder Aring <aahringo@redhat.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gfs2@lists.linux.dev,
	ocfs2-devel@lists.linux.dev
Subject: [PATCH v1 4/4] exportfs: Remove EXPORT_OP_ASYNC_LOCK
Date: Wed, 11 Sep 2024 15:43:00 -0400
Message-ID: <0a114db814fec3086f937ae3d44a086f13b8de26.1726083391.git.bcodding@redhat.com>
In-Reply-To: <cover.1726083391.git.bcodding@redhat.com>
References: <cover.1726083391.git.bcodding@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Now that GFS2 and OCFS2 are signalling async ->lock() support with
FOP_ASYNC_LOCK and checks for support are converted, we can remove
EXPORT_OP_ASYNC_LOCK.

Signed-off-by: Benjamin Coddington <bcodding@redhat.com>
---
 Documentation/filesystems/nfs/exporting.rst |  7 -------
 fs/gfs2/export.c                            |  1 -
 fs/ocfs2/export.c                           |  1 -
 include/linux/exportfs.h                    | 13 -------------
 4 files changed, 22 deletions(-)

diff --git a/Documentation/filesystems/nfs/exporting.rst b/Documentation/filesystems/nfs/exporting.rst
index f04ce1215a03..de64d2d002a2 100644
--- a/Documentation/filesystems/nfs/exporting.rst
+++ b/Documentation/filesystems/nfs/exporting.rst
@@ -238,10 +238,3 @@ following flags are defined:
     all of an inode's dirty data on last close. Exports that behave this
     way should set EXPORT_OP_FLUSH_ON_CLOSE so that NFSD knows to skip
     waiting for writeback when closing such files.
-
-  EXPORT_OP_ASYNC_LOCK - Indicates a capable filesystem to do async lock
-    requests from lockd. Only set EXPORT_OP_ASYNC_LOCK if the filesystem has
-    it's own ->lock() functionality as core posix_lock_file() implementation
-    has no async lock request handling yet. For more information about how to
-    indicate an async lock request from a ->lock() file_operations struct, see
-    fs/locks.c and comment for the function vfs_lock_file().
diff --git a/fs/gfs2/export.c b/fs/gfs2/export.c
index d418d8b5367f..3334c394ce9c 100644
--- a/fs/gfs2/export.c
+++ b/fs/gfs2/export.c
@@ -190,6 +190,5 @@ const struct export_operations gfs2_export_ops = {
 	.fh_to_parent = gfs2_fh_to_parent,
 	.get_name = gfs2_get_name,
 	.get_parent = gfs2_get_parent,
-	.flags = EXPORT_OP_ASYNC_LOCK,
 };
 
diff --git a/fs/ocfs2/export.c b/fs/ocfs2/export.c
index 96b684763b39..b95724b767e1 100644
--- a/fs/ocfs2/export.c
+++ b/fs/ocfs2/export.c
@@ -280,5 +280,4 @@ const struct export_operations ocfs2_export_ops = {
 	.fh_to_dentry	= ocfs2_fh_to_dentry,
 	.fh_to_parent	= ocfs2_fh_to_parent,
 	.get_parent	= ocfs2_get_parent,
-	.flags		= EXPORT_OP_ASYNC_LOCK,
 };
diff --git a/include/linux/exportfs.h b/include/linux/exportfs.h
index 893a1d21dc1c..1ab165c2939f 100644
--- a/include/linux/exportfs.h
+++ b/include/linux/exportfs.h
@@ -250,19 +250,6 @@ struct export_operations {
 	unsigned long	flags;
 };
 
-/**
- * exportfs_lock_op_is_async() - export op supports async lock operation
- * @export_ops:	the nfs export operations to check
- *
- * Returns true if the nfs export_operations structure has
- * EXPORT_OP_ASYNC_LOCK in their flags set
- */
-static inline bool
-exportfs_lock_op_is_async(const struct export_operations *export_ops)
-{
-	return export_ops->flags & EXPORT_OP_ASYNC_LOCK;
-}
-
 extern int exportfs_encode_inode_fh(struct inode *inode, struct fid *fid,
 				    int *max_len, struct inode *parent,
 				    int flags);
-- 
2.44.0


