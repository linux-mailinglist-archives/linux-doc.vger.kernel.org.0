Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7B8B5326E7
	for <lists+linux-doc@lfdr.de>; Tue, 24 May 2022 11:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236003AbiEXJwF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 May 2022 05:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbiEXJwD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 May 2022 05:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4522246649
        for <linux-doc@vger.kernel.org>; Tue, 24 May 2022 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653385918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i98HHQq29c7diqP/6D6/B2mSvrv2ZMKfh2bE5VoKKrY=;
        b=FUwupsxf0cutOvMYB01nkX0PZ6RhtsrrjhKUfffr+3CdTNGIN96bjFAbvUxDhU2LjrR1DC
        vlySy/gId0HcJijbKGNtbm5VoaliqywQNtsarGC8X+WeTwed8YP2sXePTBNitgXhzXadVm
        gGXvvzoqOFUJ13n/HdoKI1BOtD1WcsM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-wrsjKcAIO1K5bWsV8b6NNQ-1; Tue, 24 May 2022 05:51:56 -0400
X-MC-Unique: wrsjKcAIO1K5bWsV8b6NNQ-1
Received: by mail-pg1-f198.google.com with SMTP id q13-20020a638c4d000000b003821725ad66so8783857pgn.23
        for <linux-doc@vger.kernel.org>; Tue, 24 May 2022 02:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=i98HHQq29c7diqP/6D6/B2mSvrv2ZMKfh2bE5VoKKrY=;
        b=HjlnLfwD87foqiyFxvENXc3u1GQvI+y0S9Gqa4HjrAeBF/IB0VyBLhgE5k5/foKqYP
         pWR65r5adMqASySPm0TSAYTntf6JaUZuDQmSjdiSrFfU0N7WQ6WOjd4rHCqbnshL1GFX
         wQO6pxarPOMlHchE30ymK7ON0VivoXHiUCzgCJGSrFAIjsmQ9Jw6B7OwQesA4tHzF5Mu
         Y/GPeqteOKMyjGCF9QdpA7pQITeO92/9lyiJ59Q6yBmBzM5uydLOGJY4Cnl7pOZ5FEN5
         decfLshmqQz2V+AmPentPw/wQg/Q25IlvbGD9RxAR/J+49Zgq+LlHuMV5K5l/0+OkK3l
         VaEA==
X-Gm-Message-State: AOAM533I/olYUwxn8wBr9fAuaQsjZ+yv6c22mB4L3Y1E8u3AxCBmXscX
        CHTJM1cMeEM8q+hXA/ORhJNOoGhfSDUiB1oh/fIGkA2/JTkCiWdO0k/UW2D2pKKdCZmuHDHqF3P
        RhEeP/JnStYceehb+ws3M
X-Received: by 2002:a63:4d3:0:b0:3f5:f19a:a492 with SMTP id 202-20020a6304d3000000b003f5f19aa492mr23226085pge.353.1653385913926;
        Tue, 24 May 2022 02:51:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUtxTpu/6sO3fg8d8dGhwfhiaiA/k6/a17zFr6SgQYkUNe/908I/Y7uAyihAff804tFwWWXg==
X-Received: by 2002:a63:4d3:0:b0:3f5:f19a:a492 with SMTP id 202-20020a6304d3000000b003f5f19aa492mr23226049pge.353.1653385913348;
        Tue, 24 May 2022 02:51:53 -0700 (PDT)
Received: from [10.72.12.81] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id q2-20020a655242000000b003f65560a1a7sm5810008pgp.53.2022.05.24.02.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 02:51:52 -0700 (PDT)
Subject: Re: [PATCH v2] netfs: Fix gcc-12 warning by embedding vfs inode in
 netfs_i_context
To:     David Howells <dhowells@redhat.com>, jlayton@kernel.org,
        keescook@chromium.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Christian Schoenebeck <linux_oss@crudebyte.com>,
        Marc Dionne <marc.dionne@auristor.com>,
        Ilya Dryomov <idryomov@gmail.com>,
        Steve French <smfrench@gmail.com>,
        William Kucharski <william.kucharski@oracle.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
        linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <165305805651.4094995.7763502506786714216.stgit@warthog.procyon.org.uk>
From:   Xiubo Li <xiubli@redhat.com>
Message-ID: <8bfbb7be-ea3f-7679-182e-5bdd57d06daa@redhat.com>
Date:   Tue, 24 May 2022 17:51:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <165305805651.4094995.7763502506786714216.stgit@warthog.procyon.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 5/20/22 10:47 PM, David Howells wrote:
> While randstruct was satisfied with using an open-coded "void *" offset
> cast for the netfs_i_context <-> inode casting, __builtin_object_size() as
> used by FORTIFY_SOURCE was not as easily fooled.  This was causing the
> following complaint[1] from gcc v12:
>
> In file included from ./include/linux/string.h:253,
>                   from ./include/linux/ceph/ceph_debug.h:7,
>                   from fs/ceph/inode.c:2:
> In function 'fortify_memset_chk',
>      inlined from 'netfs_i_context_init' at ./include/linux/netfs.h:326:2,
>      inlined from 'ceph_alloc_inode' at fs/ceph/inode.c:463:2:
> ./include/linux/fortify-string.h:242:25: warning: call to '__write_overflow_field' declared with attribute warning:
> detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
>    242 |                         __write_overflow_field(p_size_field, size);
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fix this by embedding a struct inode into struct netfs_i_context (which
> should perhaps be renamed to struct netfs_inode).  The struct inode
> vfs_inode fields are then removed from the 9p, afs, ceph and cifs inode
> structs and vfs_inode is then simply changed to "netfs.inode" in those
> filesystems.
>
> Further, rename netfs_i_context to netfs_inode, get rid of the
> netfs_inode() function that converted a netfs_i_context pointer to an inode
> pointer (that can now be done with &ctx->inode) and rename the
> netfs_i_context() function to netfs_inode() (which is now a wrapper around
> container_of()).
>
> Most of the changes were done with:
>
>    perl -p -i -e 's/vfs_inode/netfs.inode/'g \
> 	`git grep -l 'vfs_inode' -- fs/{9p,afs,ceph,cifs}/*.[ch]`
>
> Kees suggested doing it with a pair structure[2] and a special declarator
> to insert that into the network filesystem's inode wrapper[3], but I think
> it's cleaner to embed it - and then it doesn't matter if struct
> randomisation reorders things.
>
> Changes
> =======
> ver #2)
>   - Fix a couple of missed name changes due to a disabled cifs option.
>   - Rename nfs_i_context to nfs_inode
>   - Use "netfs" instead of "nic" as the member name in per-fs inode wrapper
>     structs.
>
> Fixes: bc899ee1c898 ("netfs: Add a netfs inode context")
> Reported-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> cc: Jonathan Corbet <corbet@lwn.net>
> cc: Eric Van Hensbergen <ericvh@gmail.com>
> cc: Latchesar Ionkov <lucho@ionkov.net>
> cc: Dominique Martinet <asmadeus@codewreck.org>
> cc: Christian Schoenebeck <linux_oss@crudebyte.com>
> cc: Marc Dionne <marc.dionne@auristor.com>
> cc: Xiubo Li <xiubli@redhat.com>
> cc: Ilya Dryomov <idryomov@gmail.com>
> cc: Steve French <smfrench@gmail.com>
> cc: William Kucharski <william.kucharski@oracle.com>
> cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> cc: linux-doc@vger.kernel.org
> cc: v9fs-developer@lists.sourceforge.net
> cc: linux-afs@lists.infradead.org
> cc: ceph-devel@vger.kernel.org
> cc: linux-cifs@vger.kernel.org
> cc: samba-technical@lists.samba.org
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-hardening@vger.kernel.org
> Link: https://lore.kernel.org/r/d2ad3a3d7bdd794c6efb562d2f2b655fb67756b9.camel@kernel.org/ [1]
> Link: https://lore.kernel.org/r/20220517210230.864239-1-keescook@chromium.org/ [2]
> Link: https://lore.kernel.org/r/20220518202212.2322058-1-keescook@chromium.org/ [3]
> Link: https://lore.kernel.org/r/165296786831.3591209.12111293034669289733.stgit@warthog.procyon.org.uk/ # v1
> ---
>
>   Documentation/filesystems/netfs_library.rst |   37 +++++-----
>   fs/9p/cache.c                               |    4 +
>   fs/9p/v9fs.c                                |    2 -
>   fs/9p/v9fs.h                                |   10 +--
>   fs/9p/vfs_addr.c                            |    2 -
>   fs/9p/vfs_inode.c                           |    4 +
>   fs/afs/callback.c                           |    2 -
>   fs/afs/dir.c                                |   32 ++++----
>   fs/afs/dir_edit.c                           |   10 +--
>   fs/afs/dir_silly.c                          |    4 +
>   fs/afs/dynroot.c                            |    2 -
>   fs/afs/file.c                               |    4 +
>   fs/afs/fs_operation.c                       |    6 +-
>   fs/afs/inode.c                              |   38 +++++-----
>   fs/afs/internal.h                           |   23 ++----
>   fs/afs/super.c                              |    6 +-
>   fs/afs/write.c                              |   21 +++--
>   fs/ceph/addr.c                              |    4 +
>   fs/ceph/cache.c                             |    4 +
>   fs/ceph/cache.h                             |    2 -
>   fs/ceph/caps.c                              |  104 ++++++++++++++-------------
>   fs/ceph/file.c                              |    2 -
>   fs/ceph/inode.c                             |   10 +--
>   fs/ceph/mds_client.c                        |    4 +
>   fs/ceph/snap.c                              |    8 +-
>   fs/ceph/super.c                             |    2 -
>   fs/ceph/super.h                             |   10 +--
>   fs/ceph/xattr.c                             |   14 ++--
>   fs/cifs/cifsfs.c                            |    8 +-
>   fs/cifs/cifsglob.h                          |   12 +--
>   fs/cifs/file.c                              |    8 +-
>   fs/cifs/fscache.c                           |    8 +-
>   fs/cifs/fscache.h                           |    8 +-
>   fs/cifs/inode.c                             |    4 +
>   fs/cifs/misc.c                              |    4 +
>   fs/cifs/smb2ops.c                           |    8 +-
>   fs/netfs/buffered_read.c                    |    6 +-
>   fs/netfs/internal.h                         |    2 -
>   fs/netfs/objects.c                          |    2 -
>   include/linux/netfs.h                       |   39 ++++------
>   40 files changed, 226 insertions(+), 254 deletions(-)
>
> diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
> index 69f00179fdfe..0483abcafcb0 100644
> --- a/Documentation/filesystems/netfs_library.rst
> +++ b/Documentation/filesystems/netfs_library.rst
> @@ -37,30 +37,31 @@ The network filesystem helper library needs a place to store a bit of state for
>   its use on each netfs inode it is helping to manage.  To this end, a context
>   structure is defined::
>   
> -	struct netfs_i_context {
> +	struct netfs_inode {
> +		struct inode inode;
>   		const struct netfs_request_ops *ops;
> -		struct fscache_cookie	*cache;
> +		struct fscache_cookie *cache;
>   	};
>   
> -A network filesystem that wants to use netfs lib must place one of these
> -directly after the VFS ``struct inode`` it allocates, usually as part of its
> -own struct.  This can be done in a way similar to the following::
> +A network filesystem that wants to use netfs lib must place one of these in its
> +inode wrapper struct instead of the VFS ``struct inode``.  This can be done in
> +a way similar to the following::
>   
>   	struct my_inode {
> -		struct {
> -			/* These must be contiguous */
> -			struct inode		vfs_inode;
> -			struct netfs_i_context  netfs_ctx;
> -		};
> +		struct netfs_inode netfs; /* Netfslib context and vfs inode */
>   		...
>   	};
>   
> -This allows netfslib to find its state by simple offset from the inode pointer,
> -thereby allowing the netfslib helper functions to be pointed to directly by the
> -VFS/VM operation tables.
> +This allows netfslib to find its state by using ``container_of()`` from the
> +inode pointer, thereby allowing the netfslib helper functions to be pointed to
> +directly by the VFS/VM operation tables.
>   
>   The structure contains the following fields:
>   
> + * ``inode``
> +
> +   The VFS inode structure.
> +
>    * ``ops``
>   
>      The set of operations provided by the network filesystem to netfslib.
> @@ -78,14 +79,12 @@ To help deal with the per-inode context, a number helper functions are
>   provided.  Firstly, a function to perform basic initialisation on a context and
>   set the operations table pointer::
>   
> -	void netfs_i_context_init(struct inode *inode,
> -				  const struct netfs_request_ops *ops);
> +	void netfs_inode_init(struct inode *inode,
> +			      const struct netfs_request_ops *ops);
>   
> -then two functions to cast between the VFS inode structure and the netfs
> -context::
> +then a function to cast from the VFS inode structure to the netfs context::
>   
> -	struct netfs_i_context *netfs_i_context(struct inode *inode);
> -	struct inode *netfs_inode(struct netfs_i_context *ctx);
> +	struct netfs_inode *netfs_node(struct inode *inode);
>   
>   and finally, a function to get the cache cookie pointer from the context
>   attached to an inode (or NULL if fscache is disabled)::
> diff --git a/fs/9p/cache.c b/fs/9p/cache.c
> index 1c8dc696d516..cebba4eaa0b5 100644
> --- a/fs/9p/cache.c
> +++ b/fs/9p/cache.c
> @@ -62,12 +62,12 @@ void v9fs_cache_inode_get_cookie(struct inode *inode)
>   	version = cpu_to_le32(v9inode->qid.version);
>   	path = cpu_to_le64(v9inode->qid.path);
>   	v9ses = v9fs_inode2v9ses(inode);
> -	v9inode->netfs_ctx.cache =
> +	v9inode->netfs.cache =
>   		fscache_acquire_cookie(v9fs_session_cache(v9ses),
>   				       0,
>   				       &path, sizeof(path),
>   				       &version, sizeof(version),
> -				       i_size_read(&v9inode->vfs_inode));
> +				       i_size_read(&v9inode->netfs.inode));
>   
>   	p9_debug(P9_DEBUG_FSC, "inode %p get cookie %p\n",
>   		 inode, v9fs_inode_cookie(v9inode));
> diff --git a/fs/9p/v9fs.c b/fs/9p/v9fs.c
> index e28ddf763b3b..0129de2ea31a 100644
> --- a/fs/9p/v9fs.c
> +++ b/fs/9p/v9fs.c
> @@ -625,7 +625,7 @@ static void v9fs_inode_init_once(void *foo)
>   	struct v9fs_inode *v9inode = (struct v9fs_inode *)foo;
>   
>   	memset(&v9inode->qid, 0, sizeof(v9inode->qid));
> -	inode_init_once(&v9inode->vfs_inode);
> +	inode_init_once(&v9inode->netfs.inode);
>   }
>   
>   /**
> diff --git a/fs/9p/v9fs.h b/fs/9p/v9fs.h
> index ec0e8df3b2eb..1b219c21d15e 100644
> --- a/fs/9p/v9fs.h
> +++ b/fs/9p/v9fs.h
> @@ -109,11 +109,7 @@ struct v9fs_session_info {
>   #define V9FS_INO_INVALID_ATTR 0x01
>   
>   struct v9fs_inode {
> -	struct {
> -		/* These must be contiguous */
> -		struct inode	vfs_inode;	/* the VFS's inode record */
> -		struct netfs_i_context netfs_ctx; /* Netfslib context */
> -	};
> +	struct netfs_inode netfs; /* Netfslib context and vfs inode */
>   	struct p9_qid qid;
>   	unsigned int cache_validity;
>   	struct p9_fid *writeback_fid;
> @@ -122,13 +118,13 @@ struct v9fs_inode {
>   
>   static inline struct v9fs_inode *V9FS_I(const struct inode *inode)
>   {
> -	return container_of(inode, struct v9fs_inode, vfs_inode);
> +	return container_of(inode, struct v9fs_inode, netfs.inode);
>   }
>   
>   static inline struct fscache_cookie *v9fs_inode_cookie(struct v9fs_inode *v9inode)
>   {
>   #ifdef CONFIG_9P_FSCACHE
> -	return netfs_i_cookie(&v9inode->vfs_inode);
> +	return netfs_i_cookie(&v9inode->netfs.inode);
>   #else
>   	return NULL;
>   #endif
> diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
> index 501128188343..595875228672 100644
> --- a/fs/9p/vfs_addr.c
> +++ b/fs/9p/vfs_addr.c
> @@ -141,7 +141,7 @@ static void v9fs_write_to_cache_done(void *priv, ssize_t transferred_or_error,
>   	    transferred_or_error != -ENOBUFS) {
>   		version = cpu_to_le32(v9inode->qid.version);
>   		fscache_invalidate(v9fs_inode_cookie(v9inode), &version,
> -				   i_size_read(&v9inode->vfs_inode), 0);
> +				   i_size_read(&v9inode->netfs.inode), 0);
>   	}
>   }
>   
> diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
> index 55367ecb9442..e660c6348b9d 100644
> --- a/fs/9p/vfs_inode.c
> +++ b/fs/9p/vfs_inode.c
> @@ -234,7 +234,7 @@ struct inode *v9fs_alloc_inode(struct super_block *sb)
>   	v9inode->writeback_fid = NULL;
>   	v9inode->cache_validity = 0;
>   	mutex_init(&v9inode->v_mutex);
> -	return &v9inode->vfs_inode;
> +	return &v9inode->netfs.inode;
>   }
>   
>   /**
> @@ -252,7 +252,7 @@ void v9fs_free_inode(struct inode *inode)
>    */
>   static void v9fs_set_netfs_context(struct inode *inode)
>   {
> -	netfs_i_context_init(inode, &v9fs_req_ops);
> +	netfs_inode_init(inode, &v9fs_req_ops);
>   }
>   
>   int v9fs_init_inode(struct v9fs_session_info *v9ses,
> diff --git a/fs/afs/callback.c b/fs/afs/callback.c
> index 1b4d5809808d..a484fa642808 100644
> --- a/fs/afs/callback.c
> +++ b/fs/afs/callback.c
> @@ -30,7 +30,7 @@ void afs_invalidate_mmap_work(struct work_struct *work)
>   {
>   	struct afs_vnode *vnode = container_of(work, struct afs_vnode, cb_work);
>   
> -	unmap_mapping_pages(vnode->vfs_inode.i_mapping, 0, 0, false);
> +	unmap_mapping_pages(vnode->netfs.inode.i_mapping, 0, 0, false);
>   }
>   
>   void afs_server_init_callback_work(struct work_struct *work)
> diff --git a/fs/afs/dir.c b/fs/afs/dir.c
> index 932e61e28e5d..d82e1d43d96f 100644
> --- a/fs/afs/dir.c
> +++ b/fs/afs/dir.c
> @@ -109,7 +109,7 @@ struct afs_lookup_cookie {
>    */
>   static void afs_dir_read_cleanup(struct afs_read *req)
>   {
> -	struct address_space *mapping = req->vnode->vfs_inode.i_mapping;
> +	struct address_space *mapping = req->vnode->netfs.inode.i_mapping;
>   	struct folio *folio;
>   	pgoff_t last = req->nr_pages - 1;
>   
> @@ -153,7 +153,7 @@ static bool afs_dir_check_folio(struct afs_vnode *dvnode, struct folio *folio,
>   		block = kmap_local_folio(folio, offset);
>   		if (block->hdr.magic != AFS_DIR_MAGIC) {
>   			printk("kAFS: %s(%lx): [%llx] bad magic %zx/%zx is %04hx\n",
> -			       __func__, dvnode->vfs_inode.i_ino,
> +			       __func__, dvnode->netfs.inode.i_ino,
>   			       pos, offset, size, ntohs(block->hdr.magic));
>   			trace_afs_dir_check_failed(dvnode, pos + offset, i_size);
>   			kunmap_local(block);
> @@ -183,7 +183,7 @@ static bool afs_dir_check_folio(struct afs_vnode *dvnode, struct folio *folio,
>   static void afs_dir_dump(struct afs_vnode *dvnode, struct afs_read *req)
>   {
>   	union afs_xdr_dir_block *block;
> -	struct address_space *mapping = dvnode->vfs_inode.i_mapping;
> +	struct address_space *mapping = dvnode->netfs.inode.i_mapping;
>   	struct folio *folio;
>   	pgoff_t last = req->nr_pages - 1;
>   	size_t offset, size;
> @@ -217,7 +217,7 @@ static void afs_dir_dump(struct afs_vnode *dvnode, struct afs_read *req)
>    */
>   static int afs_dir_check(struct afs_vnode *dvnode, struct afs_read *req)
>   {
> -	struct address_space *mapping = dvnode->vfs_inode.i_mapping;
> +	struct address_space *mapping = dvnode->netfs.inode.i_mapping;
>   	struct folio *folio;
>   	pgoff_t last = req->nr_pages - 1;
>   	int ret = 0;
> @@ -269,7 +269,7 @@ static int afs_dir_open(struct inode *inode, struct file *file)
>   static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
>   	__acquires(&dvnode->validate_lock)
>   {
> -	struct address_space *mapping = dvnode->vfs_inode.i_mapping;
> +	struct address_space *mapping = dvnode->netfs.inode.i_mapping;
>   	struct afs_read *req;
>   	loff_t i_size;
>   	int nr_pages, i;
> @@ -287,7 +287,7 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
>   	req->cleanup = afs_dir_read_cleanup;
>   
>   expand:
> -	i_size = i_size_read(&dvnode->vfs_inode);
> +	i_size = i_size_read(&dvnode->netfs.inode);
>   	if (i_size < 2048) {
>   		ret = afs_bad(dvnode, afs_file_error_dir_small);
>   		goto error;
> @@ -305,7 +305,7 @@ static struct afs_read *afs_read_dir(struct afs_vnode *dvnode, struct key *key)
>   	req->actual_len = i_size; /* May change */
>   	req->len = nr_pages * PAGE_SIZE; /* We can ask for more than there is */
>   	req->data_version = dvnode->status.data_version; /* May change */
> -	iov_iter_xarray(&req->def_iter, READ, &dvnode->vfs_inode.i_mapping->i_pages,
> +	iov_iter_xarray(&req->def_iter, READ, &dvnode->netfs.inode.i_mapping->i_pages,
>   			0, i_size);
>   	req->iter = &req->def_iter;
>   
> @@ -894,7 +894,7 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry,
>   
>   out_op:
>   	if (op->error == 0) {
> -		inode = &op->file[1].vnode->vfs_inode;
> +		inode = &op->file[1].vnode->netfs.inode;
>   		op->file[1].vnode = NULL;
>   	}
>   
> @@ -1136,7 +1136,7 @@ static int afs_d_revalidate(struct dentry *dentry, unsigned int flags)
>   	afs_stat_v(dir, n_reval);
>   
>   	/* search the directory for this vnode */
> -	ret = afs_do_lookup_one(&dir->vfs_inode, dentry, &fid, key, &dir_version);
> +	ret = afs_do_lookup_one(&dir->netfs.inode, dentry, &fid, key, &dir_version);
>   	switch (ret) {
>   	case 0:
>   		/* the filename maps to something */
> @@ -1167,7 +1167,7 @@ static int afs_d_revalidate(struct dentry *dentry, unsigned int flags)
>   			_debug("%pd: file deleted (uq %u -> %u I:%u)",
>   			       dentry, fid.unique,
>   			       vnode->fid.unique,
> -			       vnode->vfs_inode.i_generation);
> +			       vnode->netfs.inode.i_generation);
>   			goto not_found;
>   		}
>   		goto out_valid;
> @@ -1365,7 +1365,7 @@ static void afs_dir_remove_subdir(struct dentry *dentry)
>   	if (d_really_is_positive(dentry)) {
>   		struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
>   
> -		clear_nlink(&vnode->vfs_inode);
> +		clear_nlink(&vnode->netfs.inode);
>   		set_bit(AFS_VNODE_DELETED, &vnode->flags);
>   		clear_bit(AFS_VNODE_CB_PROMISED, &vnode->flags);
>   		clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
> @@ -1484,8 +1484,8 @@ static void afs_dir_remove_link(struct afs_operation *op)
>   		/* Already done */
>   	} else if (test_bit(AFS_VNODE_DIR_VALID, &dvnode->flags)) {
>   		write_seqlock(&vnode->cb_lock);
> -		drop_nlink(&vnode->vfs_inode);
> -		if (vnode->vfs_inode.i_nlink == 0) {
> +		drop_nlink(&vnode->netfs.inode);
> +		if (vnode->netfs.inode.i_nlink == 0) {
>   			set_bit(AFS_VNODE_DELETED, &vnode->flags);
>   			__afs_break_callback(vnode, afs_cb_break_for_unlink);
>   		}
> @@ -1501,7 +1501,7 @@ static void afs_dir_remove_link(struct afs_operation *op)
>   			op->error = ret;
>   	}
>   
> -	_debug("nlink %d [val %d]", vnode->vfs_inode.i_nlink, op->error);
> +	_debug("nlink %d [val %d]", vnode->netfs.inode.i_nlink, op->error);
>   }
>   
>   static void afs_unlink_success(struct afs_operation *op)
> @@ -1677,8 +1677,8 @@ static void afs_link_success(struct afs_operation *op)
>   	afs_update_dentry_version(op, dvp, op->dentry);
>   	if (op->dentry_2->d_parent == op->dentry->d_parent)
>   		afs_update_dentry_version(op, dvp, op->dentry_2);
> -	ihold(&vp->vnode->vfs_inode);
> -	d_instantiate(op->dentry, &vp->vnode->vfs_inode);
> +	ihold(&vp->vnode->netfs.inode);
> +	d_instantiate(op->dentry, &vp->vnode->netfs.inode);
>   }
>   
>   static void afs_link_put(struct afs_operation *op)
> diff --git a/fs/afs/dir_edit.c b/fs/afs/dir_edit.c
> index d98e109ecee9..0ab7752d1b75 100644
> --- a/fs/afs/dir_edit.c
> +++ b/fs/afs/dir_edit.c
> @@ -109,7 +109,7 @@ static void afs_clear_contig_bits(union afs_xdr_dir_block *block,
>    */
>   static struct folio *afs_dir_get_folio(struct afs_vnode *vnode, pgoff_t index)
>   {
> -	struct address_space *mapping = vnode->vfs_inode.i_mapping;
> +	struct address_space *mapping = vnode->netfs.inode.i_mapping;
>   	struct folio *folio;
>   
>   	folio = __filemap_get_folio(mapping, index,
> @@ -216,7 +216,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
>   
>   	_enter(",,{%d,%s},", name->len, name->name);
>   
> -	i_size = i_size_read(&vnode->vfs_inode);
> +	i_size = i_size_read(&vnode->netfs.inode);
>   	if (i_size > AFS_DIR_BLOCK_SIZE * AFS_DIR_MAX_BLOCKS ||
>   	    (i_size & (AFS_DIR_BLOCK_SIZE - 1))) {
>   		clear_bit(AFS_VNODE_DIR_VALID, &vnode->flags);
> @@ -336,7 +336,7 @@ void afs_edit_dir_add(struct afs_vnode *vnode,
>   	if (b < AFS_DIR_BLOCKS_WITH_CTR)
>   		meta->meta.alloc_ctrs[b] -= need_slots;
>   
> -	inode_inc_iversion_raw(&vnode->vfs_inode);
> +	inode_inc_iversion_raw(&vnode->netfs.inode);
>   	afs_stat_v(vnode, n_dir_cr);
>   	_debug("Insert %s in %u[%u]", name->name, b, slot);
>   
> @@ -383,7 +383,7 @@ void afs_edit_dir_remove(struct afs_vnode *vnode,
>   
>   	_enter(",,{%d,%s},", name->len, name->name);
>   
> -	i_size = i_size_read(&vnode->vfs_inode);
> +	i_size = i_size_read(&vnode->netfs.inode);
>   	if (i_size < AFS_DIR_BLOCK_SIZE ||
>   	    i_size > AFS_DIR_BLOCK_SIZE * AFS_DIR_MAX_BLOCKS ||
>   	    (i_size & (AFS_DIR_BLOCK_SIZE - 1))) {
> @@ -463,7 +463,7 @@ void afs_edit_dir_remove(struct afs_vnode *vnode,
>   	if (b < AFS_DIR_BLOCKS_WITH_CTR)
>   		meta->meta.alloc_ctrs[b] += need_slots;
>   
> -	inode_set_iversion_raw(&vnode->vfs_inode, vnode->status.data_version);
> +	inode_set_iversion_raw(&vnode->netfs.inode, vnode->status.data_version);
>   	afs_stat_v(vnode, n_dir_rm);
>   	_debug("Remove %s from %u[%u]", name->name, b, slot);
>   
> diff --git a/fs/afs/dir_silly.c b/fs/afs/dir_silly.c
> index 45cfd50a9521..bb5807e87fa4 100644
> --- a/fs/afs/dir_silly.c
> +++ b/fs/afs/dir_silly.c
> @@ -131,7 +131,7 @@ int afs_sillyrename(struct afs_vnode *dvnode, struct afs_vnode *vnode,
>   			goto out;
>   	} while (!d_is_negative(sdentry));
>   
> -	ihold(&vnode->vfs_inode);
> +	ihold(&vnode->netfs.inode);
>   
>   	ret = afs_do_silly_rename(dvnode, vnode, dentry, sdentry, key);
>   	switch (ret) {
> @@ -148,7 +148,7 @@ int afs_sillyrename(struct afs_vnode *dvnode, struct afs_vnode *vnode,
>   		d_drop(sdentry);
>   	}
>   
> -	iput(&vnode->vfs_inode);
> +	iput(&vnode->netfs.inode);
>   	dput(sdentry);
>   out:
>   	_leave(" = %d", ret);
> diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
> index f120bcb8bf73..3a5bbffdf053 100644
> --- a/fs/afs/dynroot.c
> +++ b/fs/afs/dynroot.c
> @@ -76,7 +76,7 @@ struct inode *afs_iget_pseudo_dir(struct super_block *sb, bool root)
>   	/* there shouldn't be an existing inode */
>   	BUG_ON(!(inode->i_state & I_NEW));
>   
> -	netfs_i_context_init(inode, NULL);
> +	netfs_inode_init(inode, NULL);
>   	inode->i_size		= 0;
>   	inode->i_mode		= S_IFDIR | S_IRUGO | S_IXUGO;
>   	if (root) {
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index 26292a110a8f..fab8324833ba 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -194,7 +194,7 @@ int afs_release(struct inode *inode, struct file *file)
>   		afs_put_wb_key(af->wb);
>   
>   	if ((file->f_mode & FMODE_WRITE)) {
> -		i_size = i_size_read(&vnode->vfs_inode);
> +		i_size = i_size_read(&vnode->netfs.inode);
>   		afs_set_cache_aux(vnode, &aux);
>   		fscache_unuse_cookie(afs_vnode_cache(vnode), &aux, &i_size);
>   	} else {
> @@ -325,7 +325,7 @@ static void afs_issue_read(struct netfs_io_subrequest *subreq)
>   	fsreq->iter	= &fsreq->def_iter;
>   
>   	iov_iter_xarray(&fsreq->def_iter, READ,
> -			&fsreq->vnode->vfs_inode.i_mapping->i_pages,
> +			&fsreq->vnode->netfs.inode.i_mapping->i_pages,
>   			fsreq->pos, fsreq->len);
>   
>   	afs_fetch_data(fsreq->vnode, fsreq);
> diff --git a/fs/afs/fs_operation.c b/fs/afs/fs_operation.c
> index d222dfbe976b..7a3803ce3a22 100644
> --- a/fs/afs/fs_operation.c
> +++ b/fs/afs/fs_operation.c
> @@ -232,14 +232,14 @@ int afs_put_operation(struct afs_operation *op)
>   	if (op->file[1].modification && op->file[1].vnode != op->file[0].vnode)
>   		clear_bit(AFS_VNODE_MODIFYING, &op->file[1].vnode->flags);
>   	if (op->file[0].put_vnode)
> -		iput(&op->file[0].vnode->vfs_inode);
> +		iput(&op->file[0].vnode->netfs.inode);
>   	if (op->file[1].put_vnode)
> -		iput(&op->file[1].vnode->vfs_inode);
> +		iput(&op->file[1].vnode->netfs.inode);
>   
>   	if (op->more_files) {
>   		for (i = 0; i < op->nr_files - 2; i++)
>   			if (op->more_files[i].put_vnode)
> -				iput(&op->more_files[i].vnode->vfs_inode);
> +				iput(&op->more_files[i].vnode->netfs.inode);
>   		kfree(op->more_files);
>   	}
>   
> diff --git a/fs/afs/inode.c b/fs/afs/inode.c
> index 2fe402483ad5..f9c5dc974b44 100644
> --- a/fs/afs/inode.c
> +++ b/fs/afs/inode.c
> @@ -58,7 +58,7 @@ static noinline void dump_vnode(struct afs_vnode *vnode, struct afs_vnode *paren
>    */
>   static void afs_set_netfs_context(struct afs_vnode *vnode)
>   {
> -	netfs_i_context_init(&vnode->vfs_inode, &afs_req_ops);
> +	netfs_inode_init(&vnode->netfs.inode, &afs_req_ops);
>   }
>   
>   /*
> @@ -96,7 +96,7 @@ static int afs_inode_init_from_status(struct afs_operation *op,
>   	inode->i_flags |= S_NOATIME;
>   	inode->i_uid = make_kuid(&init_user_ns, status->owner);
>   	inode->i_gid = make_kgid(&init_user_ns, status->group);
> -	set_nlink(&vnode->vfs_inode, status->nlink);
> +	set_nlink(&vnode->netfs.inode, status->nlink);
>   
>   	switch (status->type) {
>   	case AFS_FTYPE_FILE:
> @@ -139,7 +139,7 @@ static int afs_inode_init_from_status(struct afs_operation *op,
>   	afs_set_netfs_context(vnode);
>   
>   	vnode->invalid_before	= status->data_version;
> -	inode_set_iversion_raw(&vnode->vfs_inode, status->data_version);
> +	inode_set_iversion_raw(&vnode->netfs.inode, status->data_version);
>   
>   	if (!vp->scb.have_cb) {
>   		/* it's a symlink we just created (the fileserver
> @@ -163,7 +163,7 @@ static void afs_apply_status(struct afs_operation *op,
>   {
>   	struct afs_file_status *status = &vp->scb.status;
>   	struct afs_vnode *vnode = vp->vnode;
> -	struct inode *inode = &vnode->vfs_inode;
> +	struct inode *inode = &vnode->netfs.inode;
>   	struct timespec64 t;
>   	umode_t mode;
>   	bool data_changed = false;
> @@ -246,7 +246,7 @@ static void afs_apply_status(struct afs_operation *op,
>   		 * idea of what the size should be that's not the same as
>   		 * what's on the server.
>   		 */
> -		vnode->netfs_ctx.remote_i_size = status->size;
> +		vnode->netfs.remote_i_size = status->size;
>   		if (change_size) {
>   			afs_set_i_size(vnode, status->size);
>   			inode->i_ctime = t;
> @@ -289,7 +289,7 @@ void afs_vnode_commit_status(struct afs_operation *op, struct afs_vnode_param *v
>   		 */
>   		if (vp->scb.status.abort_code == VNOVNODE) {
>   			set_bit(AFS_VNODE_DELETED, &vnode->flags);
> -			clear_nlink(&vnode->vfs_inode);
> +			clear_nlink(&vnode->netfs.inode);
>   			__afs_break_callback(vnode, afs_cb_break_for_deleted);
>   			op->flags &= ~AFS_OPERATION_DIR_CONFLICT;
>   		}
> @@ -306,8 +306,8 @@ void afs_vnode_commit_status(struct afs_operation *op, struct afs_vnode_param *v
>   		if (vp->scb.have_cb)
>   			afs_apply_callback(op, vp);
>   	} else if (vp->op_unlinked && !(op->flags & AFS_OPERATION_DIR_CONFLICT)) {
> -		drop_nlink(&vnode->vfs_inode);
> -		if (vnode->vfs_inode.i_nlink == 0) {
> +		drop_nlink(&vnode->netfs.inode);
> +		if (vnode->netfs.inode.i_nlink == 0) {
>   			set_bit(AFS_VNODE_DELETED, &vnode->flags);
>   			__afs_break_callback(vnode, afs_cb_break_for_deleted);
>   		}
> @@ -326,7 +326,7 @@ static void afs_fetch_status_success(struct afs_operation *op)
>   	struct afs_vnode *vnode = vp->vnode;
>   	int ret;
>   
> -	if (vnode->vfs_inode.i_state & I_NEW) {
> +	if (vnode->netfs.inode.i_state & I_NEW) {
>   		ret = afs_inode_init_from_status(op, vp, vnode);
>   		op->error = ret;
>   		if (ret == 0)
> @@ -430,7 +430,7 @@ static void afs_get_inode_cache(struct afs_vnode *vnode)
>   	struct afs_vnode_cache_aux aux;
>   
>   	if (vnode->status.type != AFS_FTYPE_FILE) {
> -		vnode->netfs_ctx.cache = NULL;
> +		vnode->netfs.cache = NULL;
>   		return;
>   	}
>   
> @@ -457,7 +457,7 @@ static void afs_get_inode_cache(struct afs_vnode *vnode)
>   struct inode *afs_iget(struct afs_operation *op, struct afs_vnode_param *vp)
>   {
>   	struct afs_vnode_param *dvp = &op->file[0];
> -	struct super_block *sb = dvp->vnode->vfs_inode.i_sb;
> +	struct super_block *sb = dvp->vnode->netfs.inode.i_sb;
>   	struct afs_vnode *vnode;
>   	struct inode *inode;
>   	int ret;
> @@ -582,10 +582,10 @@ static void afs_zap_data(struct afs_vnode *vnode)
>   	/* nuke all the non-dirty pages that aren't locked, mapped or being
>   	 * written back in a regular file and completely discard the pages in a
>   	 * directory or symlink */
> -	if (S_ISREG(vnode->vfs_inode.i_mode))
> -		invalidate_remote_inode(&vnode->vfs_inode);
> +	if (S_ISREG(vnode->netfs.inode.i_mode))
> +		invalidate_remote_inode(&vnode->netfs.inode);
>   	else
> -		invalidate_inode_pages2(vnode->vfs_inode.i_mapping);
> +		invalidate_inode_pages2(vnode->netfs.inode.i_mapping);
>   }
>   
>   /*
> @@ -683,8 +683,8 @@ int afs_validate(struct afs_vnode *vnode, struct key *key)
>   	       key_serial(key));
>   
>   	if (unlikely(test_bit(AFS_VNODE_DELETED, &vnode->flags))) {
> -		if (vnode->vfs_inode.i_nlink)
> -			clear_nlink(&vnode->vfs_inode);
> +		if (vnode->netfs.inode.i_nlink)
> +			clear_nlink(&vnode->netfs.inode);
>   		goto valid;
>   	}
>   
> @@ -814,7 +814,7 @@ void afs_evict_inode(struct inode *inode)
>   static void afs_setattr_success(struct afs_operation *op)
>   {
>   	struct afs_vnode_param *vp = &op->file[0];
> -	struct inode *inode = &vp->vnode->vfs_inode;
> +	struct inode *inode = &vp->vnode->netfs.inode;
>   	loff_t old_i_size = i_size_read(inode);
>   
>   	op->setattr.old_i_size = old_i_size;
> @@ -831,7 +831,7 @@ static void afs_setattr_success(struct afs_operation *op)
>   static void afs_setattr_edit_file(struct afs_operation *op)
>   {
>   	struct afs_vnode_param *vp = &op->file[0];
> -	struct inode *inode = &vp->vnode->vfs_inode;
> +	struct inode *inode = &vp->vnode->netfs.inode;
>   
>   	if (op->setattr.attr->ia_valid & ATTR_SIZE) {
>   		loff_t size = op->setattr.attr->ia_size;
> @@ -863,7 +863,7 @@ int afs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
>   		ATTR_MTIME | ATTR_MTIME_SET | ATTR_TIMES_SET | ATTR_TOUCH;
>   	struct afs_operation *op;
>   	struct afs_vnode *vnode = AFS_FS_I(d_inode(dentry));
> -	struct inode *inode = &vnode->vfs_inode;
> +	struct inode *inode = &vnode->netfs.inode;
>   	loff_t i_size;
>   	int ret;
>   
> diff --git a/fs/afs/internal.h b/fs/afs/internal.h
> index 7b7ef945dc78..40518b585760 100644
> --- a/fs/afs/internal.h
> +++ b/fs/afs/internal.h
> @@ -619,12 +619,7 @@ enum afs_lock_state {
>    * leak from one inode to another.
>    */
>   struct afs_vnode {
> -	struct {
> -		/* These must be contiguous */
> -		struct inode	vfs_inode;	/* the VFS's inode record */
> -		struct netfs_i_context netfs_ctx; /* Netfslib context */
> -	};
> -
> +	struct netfs_inode	netfs;		/* Netfslib context and vfs inode */
>   	struct afs_volume	*volume;	/* volume on which vnode resides */
>   	struct afs_fid		fid;		/* the file identifier for this inode */
>   	struct afs_file_status	status;		/* AFS status info for this file */
> @@ -675,7 +670,7 @@ struct afs_vnode {
>   static inline struct fscache_cookie *afs_vnode_cache(struct afs_vnode *vnode)
>   {
>   #ifdef CONFIG_AFS_FSCACHE
> -	return netfs_i_cookie(&vnode->vfs_inode);
> +	return netfs_i_cookie(&vnode->netfs.inode);
>   #else
>   	return NULL;
>   #endif
> @@ -685,7 +680,7 @@ static inline void afs_vnode_set_cache(struct afs_vnode *vnode,
>   				       struct fscache_cookie *cookie)
>   {
>   #ifdef CONFIG_AFS_FSCACHE
> -	vnode->netfs_ctx.cache = cookie;
> +	vnode->netfs.cache = cookie;
>   #endif
>   }
>   
> @@ -892,7 +887,7 @@ static inline void afs_invalidate_cache(struct afs_vnode *vnode, unsigned int fl
>   
>   	afs_set_cache_aux(vnode, &aux);
>   	fscache_invalidate(afs_vnode_cache(vnode), &aux,
> -			   i_size_read(&vnode->vfs_inode), flags);
> +			   i_size_read(&vnode->netfs.inode), flags);
>   }
>   
>   /*
> @@ -1217,7 +1212,7 @@ static inline struct afs_net *afs_i2net(struct inode *inode)
>   
>   static inline struct afs_net *afs_v2net(struct afs_vnode *vnode)
>   {
> -	return afs_i2net(&vnode->vfs_inode);
> +	return afs_i2net(&vnode->netfs.inode);
>   }
>   
>   static inline struct afs_net *afs_sock2net(struct sock *sk)
> @@ -1593,12 +1588,12 @@ extern void yfs_fs_store_opaque_acl2(struct afs_operation *);
>    */
>   static inline struct afs_vnode *AFS_FS_I(struct inode *inode)
>   {
> -	return container_of(inode, struct afs_vnode, vfs_inode);
> +	return container_of(inode, struct afs_vnode, netfs.inode);
>   }
>   
>   static inline struct inode *AFS_VNODE_TO_I(struct afs_vnode *vnode)
>   {
> -	return &vnode->vfs_inode;
> +	return &vnode->netfs.inode;
>   }
>   
>   /*
> @@ -1621,8 +1616,8 @@ static inline void afs_update_dentry_version(struct afs_operation *op,
>    */
>   static inline void afs_set_i_size(struct afs_vnode *vnode, u64 size)
>   {
> -	i_size_write(&vnode->vfs_inode, size);
> -	vnode->vfs_inode.i_blocks = ((size + 1023) >> 10) << 1;
> +	i_size_write(&vnode->netfs.inode, size);
> +	vnode->netfs.inode.i_blocks = ((size + 1023) >> 10) << 1;
>   }
>   
>   /*
> diff --git a/fs/afs/super.c b/fs/afs/super.c
> index 1fea195b0b27..95d713074dc8 100644
> --- a/fs/afs/super.c
> +++ b/fs/afs/super.c
> @@ -659,7 +659,7 @@ static void afs_i_init_once(void *_vnode)
>   	struct afs_vnode *vnode = _vnode;
>   
>   	memset(vnode, 0, sizeof(*vnode));
> -	inode_init_once(&vnode->vfs_inode);
> +	inode_init_once(&vnode->netfs.inode);
>   	mutex_init(&vnode->io_lock);
>   	init_rwsem(&vnode->validate_lock);
>   	spin_lock_init(&vnode->wb_lock);
> @@ -700,8 +700,8 @@ static struct inode *afs_alloc_inode(struct super_block *sb)
>   	init_rwsem(&vnode->rmdir_lock);
>   	INIT_WORK(&vnode->cb_work, afs_invalidate_mmap_work);
>   
> -	_leave(" = %p", &vnode->vfs_inode);
> -	return &vnode->vfs_inode;
> +	_leave(" = %p", &vnode->netfs.inode);
> +	return &vnode->netfs.inode;
>   }
>   
>   static void afs_free_inode(struct inode *inode)
> diff --git a/fs/afs/write.c b/fs/afs/write.c
> index 4763132ca57e..718c1e936a6f 100644
> --- a/fs/afs/write.c
> +++ b/fs/afs/write.c
> @@ -146,10 +146,10 @@ int afs_write_end(struct file *file, struct address_space *mapping,
>   
>   	write_end_pos = pos + copied;
>   
> -	i_size = i_size_read(&vnode->vfs_inode);
> +	i_size = i_size_read(&vnode->netfs.inode);
>   	if (write_end_pos > i_size) {
>   		write_seqlock(&vnode->cb_lock);
> -		i_size = i_size_read(&vnode->vfs_inode);
> +		i_size = i_size_read(&vnode->netfs.inode);
>   		if (write_end_pos > i_size)
>   			afs_set_i_size(vnode, write_end_pos);
>   		write_sequnlock(&vnode->cb_lock);
> @@ -257,7 +257,7 @@ static void afs_redirty_pages(struct writeback_control *wbc,
>    */
>   static void afs_pages_written_back(struct afs_vnode *vnode, loff_t start, unsigned int len)
>   {
> -	struct address_space *mapping = vnode->vfs_inode.i_mapping;
> +	struct address_space *mapping = vnode->netfs.inode.i_mapping;
>   	struct folio *folio;
>   	pgoff_t end;
>   
> @@ -354,7 +354,6 @@ static const struct afs_operation_ops afs_store_data_operation = {
>   static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t pos,
>   			  bool laundering)
>   {
> -	struct netfs_i_context *ictx = &vnode->netfs_ctx;
>   	struct afs_operation *op;
>   	struct afs_wb_key *wbk = NULL;
>   	loff_t size = iov_iter_count(iter);
> @@ -385,9 +384,9 @@ static int afs_store_data(struct afs_vnode *vnode, struct iov_iter *iter, loff_t
>   	op->store.write_iter = iter;
>   	op->store.pos = pos;
>   	op->store.size = size;
> -	op->store.i_size = max(pos + size, ictx->remote_i_size);
> +	op->store.i_size = max(pos + size, vnode->netfs.remote_i_size);
>   	op->store.laundering = laundering;
> -	op->mtime = vnode->vfs_inode.i_mtime;
> +	op->mtime = vnode->netfs.inode.i_mtime;
>   	op->flags |= AFS_OPERATION_UNINTR;
>   	op->ops = &afs_store_data_operation;
>   
> @@ -554,7 +553,7 @@ static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
>   	struct iov_iter iter;
>   	unsigned long priv;
>   	unsigned int offset, to, len, max_len;
> -	loff_t i_size = i_size_read(&vnode->vfs_inode);
> +	loff_t i_size = i_size_read(&vnode->netfs.inode);
>   	bool new_content = test_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags);
>   	bool caching = fscache_cookie_enabled(afs_vnode_cache(vnode));
>   	long count = wbc->nr_to_write;
> @@ -844,7 +843,7 @@ ssize_t afs_file_write(struct kiocb *iocb, struct iov_iter *from)
>   	_enter("{%llx:%llu},{%zu},",
>   	       vnode->fid.vid, vnode->fid.vnode, count);
>   
> -	if (IS_SWAPFILE(&vnode->vfs_inode)) {
> +	if (IS_SWAPFILE(&vnode->netfs.inode)) {
>   		printk(KERN_INFO
>   		       "AFS: Attempt to write to active swap file!\n");
>   		return -EBUSY;
> @@ -957,8 +956,8 @@ void afs_prune_wb_keys(struct afs_vnode *vnode)
>   	/* Discard unused keys */
>   	spin_lock(&vnode->wb_lock);
>   
> -	if (!mapping_tagged(&vnode->vfs_inode.i_data, PAGECACHE_TAG_WRITEBACK) &&
> -	    !mapping_tagged(&vnode->vfs_inode.i_data, PAGECACHE_TAG_DIRTY)) {
> +	if (!mapping_tagged(&vnode->netfs.inode.i_data, PAGECACHE_TAG_WRITEBACK) &&
> +	    !mapping_tagged(&vnode->netfs.inode.i_data, PAGECACHE_TAG_DIRTY)) {
>   		list_for_each_entry_safe(wbk, tmp, &vnode->wb_keys, vnode_link) {
>   			if (refcount_read(&wbk->usage) == 1)
>   				list_move(&wbk->vnode_link, &graveyard);
> @@ -1033,6 +1032,6 @@ static void afs_write_to_cache(struct afs_vnode *vnode,
>   			       bool caching)
>   {
>   	fscache_write_to_cache(afs_vnode_cache(vnode),
> -			       vnode->vfs_inode.i_mapping, start, len, i_size,
> +			       vnode->netfs.inode.i_mapping, start, len, i_size,
>   			       afs_write_to_cache_done, vnode, caching);
>   }
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index b6edcf89a429..d49979f7d29a 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1790,7 +1790,7 @@ enum {
>   static int __ceph_pool_perm_get(struct ceph_inode_info *ci,
>   				s64 pool, struct ceph_string *pool_ns)
>   {
> -	struct ceph_fs_client *fsc = ceph_inode_to_client(&ci->vfs_inode);
> +	struct ceph_fs_client *fsc = ceph_inode_to_client(&ci->netfs.inode);
>   	struct ceph_mds_client *mdsc = fsc->mdsc;
>   	struct ceph_osd_request *rd_req = NULL, *wr_req = NULL;
>   	struct rb_node **p, *parent;
> @@ -1905,7 +1905,7 @@ static int __ceph_pool_perm_get(struct ceph_inode_info *ci,
>   				     0, false, true);
>   	err = ceph_osdc_start_request(&fsc->client->osdc, rd_req, false);
>   
> -	wr_req->r_mtime = ci->vfs_inode.i_mtime;
> +	wr_req->r_mtime = ci->netfs.inode.i_mtime;
>   	err2 = ceph_osdc_start_request(&fsc->client->osdc, wr_req, false);
>   
>   	if (!err)
> diff --git a/fs/ceph/cache.c b/fs/ceph/cache.c
> index ddea99922073..177d8e8d73fe 100644
> --- a/fs/ceph/cache.c
> +++ b/fs/ceph/cache.c
> @@ -29,9 +29,9 @@ void ceph_fscache_register_inode_cookie(struct inode *inode)
>   	if (!(inode->i_state & I_NEW))
>   		return;
>   
> -	WARN_ON_ONCE(ci->netfs_ctx.cache);
> +	WARN_ON_ONCE(ci->netfs.cache);
>   
> -	ci->netfs_ctx.cache =
> +	ci->netfs.cache =
>   		fscache_acquire_cookie(fsc->fscache, 0,
>   				       &ci->i_vino, sizeof(ci->i_vino),
>   				       &ci->i_version, sizeof(ci->i_version),
> diff --git a/fs/ceph/cache.h b/fs/ceph/cache.h
> index 7255b790a4c1..26c6ae06e2f4 100644
> --- a/fs/ceph/cache.h
> +++ b/fs/ceph/cache.h
> @@ -28,7 +28,7 @@ void ceph_fscache_invalidate(struct inode *inode, bool dio_write);
>   
>   static inline struct fscache_cookie *ceph_fscache_cookie(struct ceph_inode_info *ci)
>   {
> -	return netfs_i_cookie(&ci->vfs_inode);
> +	return netfs_i_cookie(&ci->netfs.inode);
>   }
>   
>   static inline void ceph_fscache_resize(struct inode *inode, loff_t to)
> diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
> index 5c14ef04e474..a0467bca39fa 100644
> --- a/fs/ceph/caps.c
> +++ b/fs/ceph/caps.c
> @@ -492,7 +492,7 @@ static void __cap_set_timeouts(struct ceph_mds_client *mdsc,
>   	struct ceph_mount_options *opt = mdsc->fsc->mount_options;
>   	ci->i_hold_caps_max = round_jiffies(jiffies +
>   					    opt->caps_wanted_delay_max * HZ);
> -	dout("__cap_set_timeouts %p %lu\n", &ci->vfs_inode,
> +	dout("__cap_set_timeouts %p %lu\n", &ci->netfs.inode,
>   	     ci->i_hold_caps_max - jiffies);
>   }
>   
> @@ -507,7 +507,7 @@ static void __cap_set_timeouts(struct ceph_mds_client *mdsc,
>   static void __cap_delay_requeue(struct ceph_mds_client *mdsc,
>   				struct ceph_inode_info *ci)
>   {
> -	dout("__cap_delay_requeue %p flags 0x%lx at %lu\n", &ci->vfs_inode,
> +	dout("__cap_delay_requeue %p flags 0x%lx at %lu\n", &ci->netfs.inode,
>   	     ci->i_ceph_flags, ci->i_hold_caps_max);
>   	if (!mdsc->stopping) {
>   		spin_lock(&mdsc->cap_delay_lock);
> @@ -531,7 +531,7 @@ static void __cap_delay_requeue(struct ceph_mds_client *mdsc,
>   static void __cap_delay_requeue_front(struct ceph_mds_client *mdsc,
>   				      struct ceph_inode_info *ci)
>   {
> -	dout("__cap_delay_requeue_front %p\n", &ci->vfs_inode);
> +	dout("__cap_delay_requeue_front %p\n", &ci->netfs.inode);
>   	spin_lock(&mdsc->cap_delay_lock);
>   	ci->i_ceph_flags |= CEPH_I_FLUSH;
>   	if (!list_empty(&ci->i_cap_delay_list))
> @@ -548,7 +548,7 @@ static void __cap_delay_requeue_front(struct ceph_mds_client *mdsc,
>   static void __cap_delay_cancel(struct ceph_mds_client *mdsc,
>   			       struct ceph_inode_info *ci)
>   {
> -	dout("__cap_delay_cancel %p\n", &ci->vfs_inode);
> +	dout("__cap_delay_cancel %p\n", &ci->netfs.inode);
>   	if (list_empty(&ci->i_cap_delay_list))
>   		return;
>   	spin_lock(&mdsc->cap_delay_lock);
> @@ -568,7 +568,7 @@ static void __check_cap_issue(struct ceph_inode_info *ci, struct ceph_cap *cap,
>   	 * Each time we receive FILE_CACHE anew, we increment
>   	 * i_rdcache_gen.
>   	 */
> -	if (S_ISREG(ci->vfs_inode.i_mode) &&
> +	if (S_ISREG(ci->netfs.inode.i_mode) &&
>   	    (issued & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) &&
>   	    (had & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) == 0) {
>   		ci->i_rdcache_gen++;
> @@ -583,14 +583,14 @@ static void __check_cap_issue(struct ceph_inode_info *ci, struct ceph_cap *cap,
>   	if ((issued & CEPH_CAP_FILE_SHARED) != (had & CEPH_CAP_FILE_SHARED)) {
>   		if (issued & CEPH_CAP_FILE_SHARED)
>   			atomic_inc(&ci->i_shared_gen);
> -		if (S_ISDIR(ci->vfs_inode.i_mode)) {
> -			dout(" marking %p NOT complete\n", &ci->vfs_inode);
> +		if (S_ISDIR(ci->netfs.inode.i_mode)) {
> +			dout(" marking %p NOT complete\n", &ci->netfs.inode);
>   			__ceph_dir_clear_complete(ci);
>   		}
>   	}
>   
>   	/* Wipe saved layout if we're losing DIR_CREATE caps */
> -	if (S_ISDIR(ci->vfs_inode.i_mode) && (had & CEPH_CAP_DIR_CREATE) &&
> +	if (S_ISDIR(ci->netfs.inode.i_mode) && (had & CEPH_CAP_DIR_CREATE) &&
>   		!(issued & CEPH_CAP_DIR_CREATE)) {
>   	     ceph_put_string(rcu_dereference_raw(ci->i_cached_layout.pool_ns));
>   	     memset(&ci->i_cached_layout, 0, sizeof(ci->i_cached_layout));
> @@ -771,7 +771,7 @@ static int __cap_is_valid(struct ceph_cap *cap)
>   
>   	if (cap->cap_gen < gen || time_after_eq(jiffies, ttl)) {
>   		dout("__cap_is_valid %p cap %p issued %s "
> -		     "but STALE (gen %u vs %u)\n", &cap->ci->vfs_inode,
> +		     "but STALE (gen %u vs %u)\n", &cap->ci->netfs.inode,
>   		     cap, ceph_cap_string(cap->issued), cap->cap_gen, gen);
>   		return 0;
>   	}
> @@ -797,7 +797,7 @@ int __ceph_caps_issued(struct ceph_inode_info *ci, int *implemented)
>   		if (!__cap_is_valid(cap))
>   			continue;
>   		dout("__ceph_caps_issued %p cap %p issued %s\n",
> -		     &ci->vfs_inode, cap, ceph_cap_string(cap->issued));
> +		     &ci->netfs.inode, cap, ceph_cap_string(cap->issued));
>   		have |= cap->issued;
>   		if (implemented)
>   			*implemented |= cap->implemented;
> @@ -844,12 +844,12 @@ static void __touch_cap(struct ceph_cap *cap)
>   
>   	spin_lock(&s->s_cap_lock);
>   	if (!s->s_cap_iterator) {
> -		dout("__touch_cap %p cap %p mds%d\n", &cap->ci->vfs_inode, cap,
> +		dout("__touch_cap %p cap %p mds%d\n", &cap->ci->netfs.inode, cap,
>   		     s->s_mds);
>   		list_move_tail(&cap->session_caps, &s->s_caps);
>   	} else {
>   		dout("__touch_cap %p cap %p mds%d NOP, iterating over caps\n",
> -		     &cap->ci->vfs_inode, cap, s->s_mds);
> +		     &cap->ci->netfs.inode, cap, s->s_mds);
>   	}
>   	spin_unlock(&s->s_cap_lock);
>   }
> @@ -867,7 +867,7 @@ int __ceph_caps_issued_mask(struct ceph_inode_info *ci, int mask, int touch)
>   
>   	if ((have & mask) == mask) {
>   		dout("__ceph_caps_issued_mask ino 0x%llx snap issued %s"
> -		     " (mask %s)\n", ceph_ino(&ci->vfs_inode),
> +		     " (mask %s)\n", ceph_ino(&ci->netfs.inode),
>   		     ceph_cap_string(have),
>   		     ceph_cap_string(mask));
>   		return 1;
> @@ -879,7 +879,7 @@ int __ceph_caps_issued_mask(struct ceph_inode_info *ci, int mask, int touch)
>   			continue;
>   		if ((cap->issued & mask) == mask) {
>   			dout("__ceph_caps_issued_mask ino 0x%llx cap %p issued %s"
> -			     " (mask %s)\n", ceph_ino(&ci->vfs_inode), cap,
> +			     " (mask %s)\n", ceph_ino(&ci->netfs.inode), cap,
>   			     ceph_cap_string(cap->issued),
>   			     ceph_cap_string(mask));
>   			if (touch)
> @@ -891,7 +891,7 @@ int __ceph_caps_issued_mask(struct ceph_inode_info *ci, int mask, int touch)
>   		have |= cap->issued;
>   		if ((have & mask) == mask) {
>   			dout("__ceph_caps_issued_mask ino 0x%llx combo issued %s"
> -			     " (mask %s)\n", ceph_ino(&ci->vfs_inode),
> +			     " (mask %s)\n", ceph_ino(&ci->netfs.inode),
>   			     ceph_cap_string(cap->issued),
>   			     ceph_cap_string(mask));
>   			if (touch) {
> @@ -919,7 +919,7 @@ int __ceph_caps_issued_mask(struct ceph_inode_info *ci, int mask, int touch)
>   int __ceph_caps_issued_mask_metric(struct ceph_inode_info *ci, int mask,
>   				   int touch)
>   {
> -	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
> +	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
>   	int r;
>   
>   	r = __ceph_caps_issued_mask(ci, mask, touch);
> @@ -950,7 +950,7 @@ int __ceph_caps_revoking_other(struct ceph_inode_info *ci,
>   
>   int ceph_caps_revoking(struct ceph_inode_info *ci, int mask)
>   {
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	int ret;
>   
>   	spin_lock(&ci->i_ceph_lock);
> @@ -969,8 +969,8 @@ int __ceph_caps_used(struct ceph_inode_info *ci)
>   	if (ci->i_rd_ref)
>   		used |= CEPH_CAP_FILE_RD;
>   	if (ci->i_rdcache_ref ||
> -	    (S_ISREG(ci->vfs_inode.i_mode) &&
> -	     ci->vfs_inode.i_data.nrpages))
> +	    (S_ISREG(ci->netfs.inode.i_mode) &&
> +	     ci->netfs.inode.i_data.nrpages))
>   		used |= CEPH_CAP_FILE_CACHE;
>   	if (ci->i_wr_ref)
>   		used |= CEPH_CAP_FILE_WR;
> @@ -993,11 +993,11 @@ int __ceph_caps_file_wanted(struct ceph_inode_info *ci)
>   	const int WR_SHIFT = ffs(CEPH_FILE_MODE_WR);
>   	const int LAZY_SHIFT = ffs(CEPH_FILE_MODE_LAZY);
>   	struct ceph_mount_options *opt =
> -		ceph_inode_to_client(&ci->vfs_inode)->mount_options;
> +		ceph_inode_to_client(&ci->netfs.inode)->mount_options;
>   	unsigned long used_cutoff = jiffies - opt->caps_wanted_delay_max * HZ;
>   	unsigned long idle_cutoff = jiffies - opt->caps_wanted_delay_min * HZ;
>   
> -	if (S_ISDIR(ci->vfs_inode.i_mode)) {
> +	if (S_ISDIR(ci->netfs.inode.i_mode)) {
>   		int want = 0;
>   
>   		/* use used_cutoff here, to keep dir's wanted caps longer */
> @@ -1050,7 +1050,7 @@ int __ceph_caps_file_wanted(struct ceph_inode_info *ci)
>   int __ceph_caps_wanted(struct ceph_inode_info *ci)
>   {
>   	int w = __ceph_caps_file_wanted(ci) | __ceph_caps_used(ci);
> -	if (S_ISDIR(ci->vfs_inode.i_mode)) {
> +	if (S_ISDIR(ci->netfs.inode.i_mode)) {
>   		/* we want EXCL if holding caps of dir ops */
>   		if (w & CEPH_CAP_ANY_DIR_OPS)
>   			w |= CEPH_CAP_FILE_EXCL;
> @@ -1116,9 +1116,9 @@ void __ceph_remove_cap(struct ceph_cap *cap, bool queue_release)
>   
>   	lockdep_assert_held(&ci->i_ceph_lock);
>   
> -	dout("__ceph_remove_cap %p from %p\n", cap, &ci->vfs_inode);
> +	dout("__ceph_remove_cap %p from %p\n", cap, &ci->netfs.inode);
>   
> -	mdsc = ceph_inode_to_client(&ci->vfs_inode)->mdsc;
> +	mdsc = ceph_inode_to_client(&ci->netfs.inode)->mdsc;
>   
>   	/* remove from inode's cap rbtree, and clear auth cap */
>   	rb_erase(&cap->ci_node, &ci->i_caps);
> @@ -1169,7 +1169,7 @@ void __ceph_remove_cap(struct ceph_cap *cap, bool queue_release)
>   		 * keep i_snap_realm.
>   		 */
>   		if (ci->i_wr_ref == 0 && ci->i_snap_realm)
> -			ceph_change_snap_realm(&ci->vfs_inode, NULL);
> +			ceph_change_snap_realm(&ci->netfs.inode, NULL);
>   
>   		__cap_delay_cancel(mdsc, ci);
>   	}
> @@ -1188,11 +1188,11 @@ void ceph_remove_cap(struct ceph_cap *cap, bool queue_release)
>   
>   	lockdep_assert_held(&ci->i_ceph_lock);
>   
> -	fsc = ceph_inode_to_client(&ci->vfs_inode);
> +	fsc = ceph_inode_to_client(&ci->netfs.inode);
>   	WARN_ON_ONCE(ci->i_auth_cap == cap &&
>   		     !list_empty(&ci->i_dirty_item) &&
>   		     !fsc->blocklisted &&
> -		     !ceph_inode_is_shutdown(&ci->vfs_inode));
> +		     !ceph_inode_is_shutdown(&ci->netfs.inode));
>   
>   	__ceph_remove_cap(cap, queue_release);
>   }
> @@ -1343,7 +1343,7 @@ static void __prep_cap(struct cap_msg_args *arg, struct ceph_cap *cap,
>   		       int flushing, u64 flush_tid, u64 oldest_flush_tid)
>   {
>   	struct ceph_inode_info *ci = cap->ci;
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	int held, revoking;
>   
>   	lockdep_assert_held(&ci->i_ceph_lock);
> @@ -1440,7 +1440,7 @@ static void __prep_cap(struct cap_msg_args *arg, struct ceph_cap *cap,
>   static void __send_cap(struct cap_msg_args *arg, struct ceph_inode_info *ci)
>   {
>   	struct ceph_msg *msg;
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   
>   	msg = ceph_msg_new(CEPH_MSG_CLIENT_CAPS, CAP_MSG_SIZE, GFP_NOFS, false);
>   	if (!msg) {
> @@ -1528,7 +1528,7 @@ static void __ceph_flush_snaps(struct ceph_inode_info *ci,
>   		__releases(ci->i_ceph_lock)
>   		__acquires(ci->i_ceph_lock)
>   {
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	struct ceph_mds_client *mdsc = session->s_mdsc;
>   	struct ceph_cap_snap *capsnap;
>   	u64 oldest_flush_tid = 0;
> @@ -1621,7 +1621,7 @@ static void __ceph_flush_snaps(struct ceph_inode_info *ci,
>   void ceph_flush_snaps(struct ceph_inode_info *ci,
>   		      struct ceph_mds_session **psession)
>   {
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	struct ceph_mds_client *mdsc = ceph_inode_to_client(inode)->mdsc;
>   	struct ceph_mds_session *session = NULL;
>   	int mds;
> @@ -1681,8 +1681,8 @@ int __ceph_mark_dirty_caps(struct ceph_inode_info *ci, int mask,
>   			   struct ceph_cap_flush **pcf)
>   {
>   	struct ceph_mds_client *mdsc =
> -		ceph_sb_to_client(ci->vfs_inode.i_sb)->mdsc;
> -	struct inode *inode = &ci->vfs_inode;
> +		ceph_sb_to_client(ci->netfs.inode.i_sb)->mdsc;
> +	struct inode *inode = &ci->netfs.inode;
>   	int was = ci->i_dirty_caps;
>   	int dirty = 0;
>   
> @@ -1695,7 +1695,7 @@ int __ceph_mark_dirty_caps(struct ceph_inode_info *ci, int mask,
>   		return 0;
>   	}
>   
> -	dout("__mark_dirty_caps %p %s dirty %s -> %s\n", &ci->vfs_inode,
> +	dout("__mark_dirty_caps %p %s dirty %s -> %s\n", &ci->netfs.inode,
>   	     ceph_cap_string(mask), ceph_cap_string(was),
>   	     ceph_cap_string(was | mask));
>   	ci->i_dirty_caps |= mask;
> @@ -1711,7 +1711,7 @@ int __ceph_mark_dirty_caps(struct ceph_inode_info *ci, int mask,
>   				ci->i_snap_realm->cached_context);
>   		}
>   		dout(" inode %p now dirty snapc %p auth cap %p\n",
> -		     &ci->vfs_inode, ci->i_head_snapc, ci->i_auth_cap);
> +		     &ci->netfs.inode, ci->i_head_snapc, ci->i_auth_cap);
>   		BUG_ON(!list_empty(&ci->i_dirty_item));
>   		spin_lock(&mdsc->cap_dirty_lock);
>   		list_add(&ci->i_dirty_item, &session->s_cap_dirty);
> @@ -1874,7 +1874,7 @@ static int try_nonblocking_invalidate(struct inode *inode)
>   
>   bool __ceph_should_report_size(struct ceph_inode_info *ci)
>   {
> -	loff_t size = i_size_read(&ci->vfs_inode);
> +	loff_t size = i_size_read(&ci->netfs.inode);
>   	/* mds will adjust max size according to the reported size */
>   	if (ci->i_flushing_caps & CEPH_CAP_FILE_WR)
>   		return false;
> @@ -1899,7 +1899,7 @@ bool __ceph_should_report_size(struct ceph_inode_info *ci)
>   void ceph_check_caps(struct ceph_inode_info *ci, int flags,
>   		     struct ceph_mds_session *session)
>   {
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(inode->i_sb);
>   	struct ceph_cap *cap;
>   	u64 flush_tid, oldest_flush_tid;
> @@ -2446,7 +2446,7 @@ static void __kick_flushing_caps(struct ceph_mds_client *mdsc,
>   	__releases(ci->i_ceph_lock)
>   	__acquires(ci->i_ceph_lock)
>   {
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	struct ceph_cap *cap;
>   	struct ceph_cap_flush *cf;
>   	int ret;
> @@ -2539,7 +2539,7 @@ void ceph_early_kick_flushing_caps(struct ceph_mds_client *mdsc,
>   		cap = ci->i_auth_cap;
>   		if (!(cap && cap->session == session)) {
>   			pr_err("%p auth cap %p not mds%d ???\n",
> -				&ci->vfs_inode, cap, session->s_mds);
> +				&ci->netfs.inode, cap, session->s_mds);
>   			spin_unlock(&ci->i_ceph_lock);
>   			continue;
>   		}
> @@ -2589,7 +2589,7 @@ void ceph_kick_flushing_caps(struct ceph_mds_client *mdsc,
>   		cap = ci->i_auth_cap;
>   		if (!(cap && cap->session == session)) {
>   			pr_err("%p auth cap %p not mds%d ???\n",
> -				&ci->vfs_inode, cap, session->s_mds);
> +				&ci->netfs.inode, cap, session->s_mds);
>   			spin_unlock(&ci->i_ceph_lock);
>   			continue;
>   		}
> @@ -2609,7 +2609,7 @@ void ceph_kick_flushing_inode_caps(struct ceph_mds_session *session,
>   
>   	lockdep_assert_held(&ci->i_ceph_lock);
>   
> -	dout("%s %p flushing %s\n", __func__, &ci->vfs_inode,
> +	dout("%s %p flushing %s\n", __func__, &ci->netfs.inode,
>   	     ceph_cap_string(ci->i_flushing_caps));
>   
>   	if (!list_empty(&ci->i_cap_flush_list)) {
> @@ -2652,10 +2652,10 @@ void ceph_take_cap_refs(struct ceph_inode_info *ci, int got,
>   	}
>   	if (got & CEPH_CAP_FILE_BUFFER) {
>   		if (ci->i_wb_ref == 0)
> -			ihold(&ci->vfs_inode);
> +			ihold(&ci->netfs.inode);
>   		ci->i_wb_ref++;
>   		dout("%s %p wb %d -> %d (?)\n", __func__,
> -		     &ci->vfs_inode, ci->i_wb_ref-1, ci->i_wb_ref);
> +		     &ci->netfs.inode, ci->i_wb_ref-1, ci->i_wb_ref);
>   	}
>   }
>   
> @@ -2983,7 +2983,7 @@ int ceph_get_caps(struct file *filp, int need, int want, loff_t endoff, int *got
>   			return ret;
>   		}
>   
> -		if (S_ISREG(ci->vfs_inode.i_mode) &&
> +		if (S_ISREG(ci->netfs.inode.i_mode) &&
>   		    ci->i_inline_version != CEPH_INLINE_NONE &&
>   		    (_got & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) &&
>   		    i_size_read(inode) > 0) {
> @@ -3073,7 +3073,7 @@ enum put_cap_refs_mode {
>   static void __ceph_put_cap_refs(struct ceph_inode_info *ci, int had,
>   				enum put_cap_refs_mode mode)
>   {
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	int last = 0, put = 0, flushsnaps = 0, wake = 0;
>   	bool check_flushsnaps = false;
>   
> @@ -3181,7 +3181,7 @@ void ceph_put_cap_refs_no_check_caps(struct ceph_inode_info *ci, int had)
>   void ceph_put_wrbuffer_cap_refs(struct ceph_inode_info *ci, int nr,
>   				struct ceph_snap_context *snapc)
>   {
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	struct ceph_cap_snap *capsnap = NULL;
>   	int put = 0;
>   	bool last = false;
> @@ -3678,7 +3678,7 @@ static void handle_cap_flush_ack(struct inode *inode, u64 flush_tid,
>   				     session->s_mds,
>   				     &list_first_entry(&session->s_cap_flushing,
>   						struct ceph_inode_info,
> -						i_flushing_item)->vfs_inode);
> +						i_flushing_item)->netfs.inode);
>   			}
>   		}
>   		mdsc->num_cap_flushing--;
> @@ -4326,7 +4326,7 @@ unsigned long ceph_check_delayed_caps(struct ceph_mds_client *mdsc)
>   			break;
>   		list_del_init(&ci->i_cap_delay_list);
>   
> -		inode = igrab(&ci->vfs_inode);
> +		inode = igrab(&ci->netfs.inode);
>   		if (inode) {
>   			spin_unlock(&mdsc->cap_delay_lock);
>   			dout("check_delayed_caps on %p\n", inode);
> @@ -4354,7 +4354,7 @@ static void flush_dirty_session_caps(struct ceph_mds_session *s)
>   	while (!list_empty(&s->s_cap_dirty)) {
>   		ci = list_first_entry(&s->s_cap_dirty, struct ceph_inode_info,
>   				      i_dirty_item);
> -		inode = &ci->vfs_inode;
> +		inode = &ci->netfs.inode;
>   		ihold(inode);
>   		dout("flush_dirty_caps %llx.%llx\n", ceph_vinop(inode));
>   		spin_unlock(&mdsc->cap_dirty_lock);
> @@ -4388,7 +4388,7 @@ void __ceph_touch_fmode(struct ceph_inode_info *ci,
>   
>   void ceph_get_fmode(struct ceph_inode_info *ci, int fmode, int count)
>   {
> -	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(ci->vfs_inode.i_sb);
> +	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(ci->netfs.inode.i_sb);
>   	int bits = (fmode << 1) | 1;
>   	bool already_opened = false;
>   	int i;
> @@ -4422,7 +4422,7 @@ void ceph_get_fmode(struct ceph_inode_info *ci, int fmode, int count)
>    */
>   void ceph_put_fmode(struct ceph_inode_info *ci, int fmode, int count)
>   {
> -	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(ci->vfs_inode.i_sb);
> +	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(ci->netfs.inode.i_sb);
>   	int bits = (fmode << 1) | 1;
>   	bool is_closed = true;
>   	int i;
> @@ -4637,7 +4637,7 @@ int ceph_purge_inode_cap(struct inode *inode, struct ceph_cap *cap, bool *invali
>   	lockdep_assert_held(&ci->i_ceph_lock);
>   
>   	dout("removing cap %p, ci is %p, inode is %p\n",
> -	     cap, ci, &ci->vfs_inode);
> +	     cap, ci, &ci->netfs.inode);
>   
>   	is_auth = (cap == ci->i_auth_cap);
>   	__ceph_remove_cap(cap, false);
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index 8c8226c0feac..da59e836a06e 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -205,7 +205,7 @@ static int ceph_init_file_info(struct inode *inode, struct file *file,
>   {
>   	struct ceph_inode_info *ci = ceph_inode(inode);
>   	struct ceph_mount_options *opt =
> -		ceph_inode_to_client(&ci->vfs_inode)->mount_options;
> +		ceph_inode_to_client(&ci->netfs.inode)->mount_options;
>   	struct ceph_file_info *fi;
>   	int ret;
>   
> diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
> index 63113e2a4890..f7a99a7e53c2 100644
> --- a/fs/ceph/inode.c
> +++ b/fs/ceph/inode.c
> @@ -176,7 +176,7 @@ static struct ceph_inode_frag *__get_or_create_frag(struct ceph_inode_info *ci,
>   	rb_insert_color(&frag->node, &ci->i_fragtree);
>   
>   	dout("get_or_create_frag added %llx.%llx frag %x\n",
> -	     ceph_vinop(&ci->vfs_inode), f);
> +	     ceph_vinop(&ci->netfs.inode), f);
>   	return frag;
>   }
>   
> @@ -457,10 +457,10 @@ struct inode *ceph_alloc_inode(struct super_block *sb)
>   	if (!ci)
>   		return NULL;
>   
> -	dout("alloc_inode %p\n", &ci->vfs_inode);
> +	dout("alloc_inode %p\n", &ci->netfs.inode);
>   
>   	/* Set parameters for the netfs library */
> -	netfs_i_context_init(&ci->vfs_inode, &ceph_netfs_ops);
> +	netfs_inode_init(&ci->netfs.inode, &ceph_netfs_ops);
>   
>   	spin_lock_init(&ci->i_ceph_lock);
>   
> @@ -547,7 +547,7 @@ struct inode *ceph_alloc_inode(struct super_block *sb)
>   	INIT_WORK(&ci->i_work, ceph_inode_work);
>   	ci->i_work_mask = 0;
>   	memset(&ci->i_btime, '\0', sizeof(ci->i_btime));
> -	return &ci->vfs_inode;
> +	return &ci->netfs.inode;
>   }
>   
>   void ceph_free_inode(struct inode *inode)
> @@ -1977,7 +1977,7 @@ static void ceph_inode_work(struct work_struct *work)
>   {
>   	struct ceph_inode_info *ci = container_of(work, struct ceph_inode_info,
>   						 i_work);
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   
>   	if (test_and_clear_bit(CEPH_I_WORK_WRITEBACK, &ci->i_work_mask)) {
>   		dout("writeback %p\n", inode);
> diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
> index 00c3de177dd6..cc2b49a8e9b6 100644
> --- a/fs/ceph/mds_client.c
> +++ b/fs/ceph/mds_client.c
> @@ -1564,7 +1564,7 @@ int ceph_iterate_session_caps(struct ceph_mds_session *session,
>   	p = session->s_caps.next;
>   	while (p != &session->s_caps) {
>   		cap = list_entry(p, struct ceph_cap, session_caps);
> -		inode = igrab(&cap->ci->vfs_inode);
> +		inode = igrab(&cap->ci->netfs.inode);
>   		if (!inode) {
>   			p = p->next;
>   			continue;
> @@ -1622,7 +1622,7 @@ static int remove_session_caps_cb(struct inode *inode, struct ceph_cap *cap,
>   	int iputs;
>   
>   	dout("removing cap %p, ci is %p, inode is %p\n",
> -	     cap, ci, &ci->vfs_inode);
> +	     cap, ci, &ci->netfs.inode);
>   	spin_lock(&ci->i_ceph_lock);
>   	iputs = ceph_purge_inode_cap(inode, cap, &invalidate);
>   	spin_unlock(&ci->i_ceph_lock);
> diff --git a/fs/ceph/snap.c b/fs/ceph/snap.c
> index 322ee5add942..864cdaa0d2bd 100644
> --- a/fs/ceph/snap.c
> +++ b/fs/ceph/snap.c
> @@ -521,7 +521,7 @@ static bool has_new_snaps(struct ceph_snap_context *o,
>   static void ceph_queue_cap_snap(struct ceph_inode_info *ci,
>   				struct ceph_cap_snap **pcapsnap)
>   {
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	struct ceph_snap_context *old_snapc, *new_snapc;
>   	struct ceph_cap_snap *capsnap = *pcapsnap;
>   	struct ceph_buffer *old_blob = NULL;
> @@ -652,7 +652,7 @@ static void ceph_queue_cap_snap(struct ceph_inode_info *ci,
>   int __ceph_finish_cap_snap(struct ceph_inode_info *ci,
>   			    struct ceph_cap_snap *capsnap)
>   {
> -	struct inode *inode = &ci->vfs_inode;
> +	struct inode *inode = &ci->netfs.inode;
>   	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(inode->i_sb);
>   
>   	BUG_ON(capsnap->writing);
> @@ -712,7 +712,7 @@ static void queue_realm_cap_snaps(struct ceph_snap_realm *realm)
>   
>   	spin_lock(&realm->inodes_with_caps_lock);
>   	list_for_each_entry(ci, &realm->inodes_with_caps, i_snap_realm_item) {
> -		struct inode *inode = igrab(&ci->vfs_inode);
> +		struct inode *inode = igrab(&ci->netfs.inode);
>   		if (!inode)
>   			continue;
>   		spin_unlock(&realm->inodes_with_caps_lock);
> @@ -904,7 +904,7 @@ static void flush_snaps(struct ceph_mds_client *mdsc)
>   	while (!list_empty(&mdsc->snap_flush_list)) {
>   		ci = list_first_entry(&mdsc->snap_flush_list,
>   				struct ceph_inode_info, i_snap_flush_item);
> -		inode = &ci->vfs_inode;
> +		inode = &ci->netfs.inode;
>   		ihold(inode);
>   		spin_unlock(&mdsc->snap_flush_lock);
>   		ceph_flush_snaps(ci, &session);
> diff --git a/fs/ceph/super.c b/fs/ceph/super.c
> index e6987d295079..612d8bc73ea9 100644
> --- a/fs/ceph/super.c
> +++ b/fs/ceph/super.c
> @@ -876,7 +876,7 @@ mempool_t *ceph_wb_pagevec_pool;
>   static void ceph_inode_init_once(void *foo)
>   {
>   	struct ceph_inode_info *ci = foo;
> -	inode_init_once(&ci->vfs_inode);
> +	inode_init_once(&ci->netfs.inode);
>   }
>   
>   static int __init init_caches(void)
> diff --git a/fs/ceph/super.h b/fs/ceph/super.h
> index 20ceab74e871..755a1ad26016 100644
> --- a/fs/ceph/super.h
> +++ b/fs/ceph/super.h
> @@ -316,11 +316,7 @@ struct ceph_inode_xattrs_info {
>    * Ceph inode.
>    */
>   struct ceph_inode_info {
> -	struct {
> -		/* These must be contiguous */
> -		struct inode vfs_inode;
> -		struct netfs_i_context netfs_ctx; /* Netfslib context */
> -	};
> +	struct netfs_inode netfs; /* Netfslib context and vfs inode */
>   	struct ceph_vino i_vino;   /* ceph ino + snap */
>   
>   	spinlock_t i_ceph_lock;
> @@ -436,7 +432,7 @@ struct ceph_inode_info {
>   static inline struct ceph_inode_info *
>   ceph_inode(const struct inode *inode)
>   {
> -	return container_of(inode, struct ceph_inode_info, vfs_inode);
> +	return container_of(inode, struct ceph_inode_info, netfs.inode);
>   }
>   
>   static inline struct ceph_fs_client *
> @@ -1295,7 +1291,7 @@ static inline void __ceph_update_quota(struct ceph_inode_info *ci,
>   	has_quota = __ceph_has_any_quota(ci);
>   
>   	if (had_quota != has_quota)
> -		ceph_adjust_quota_realms_count(&ci->vfs_inode, has_quota);
> +		ceph_adjust_quota_realms_count(&ci->netfs.inode, has_quota);
>   }
>   
>   extern void ceph_handle_quota(struct ceph_mds_client *mdsc,
> diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
> index afec84088471..5e435d63d2a1 100644
> --- a/fs/ceph/xattr.c
> +++ b/fs/ceph/xattr.c
> @@ -57,7 +57,7 @@ static bool ceph_vxattrcb_layout_exists(struct ceph_inode_info *ci)
>   static ssize_t ceph_vxattrcb_layout(struct ceph_inode_info *ci, char *val,
>   				    size_t size)
>   {
> -	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
> +	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
>   	struct ceph_osd_client *osdc = &fsc->client->osdc;
>   	struct ceph_string *pool_ns;
>   	s64 pool = ci->i_layout.pool_id;
> @@ -69,7 +69,7 @@ static ssize_t ceph_vxattrcb_layout(struct ceph_inode_info *ci, char *val,
>   
>   	pool_ns = ceph_try_get_string(ci->i_layout.pool_ns);
>   
> -	dout("ceph_vxattrcb_layout %p\n", &ci->vfs_inode);
> +	dout("ceph_vxattrcb_layout %p\n", &ci->netfs.inode);
>   	down_read(&osdc->lock);
>   	pool_name = ceph_pg_pool_name_by_id(osdc->osdmap, pool);
>   	if (pool_name) {
> @@ -161,7 +161,7 @@ static ssize_t ceph_vxattrcb_layout_pool(struct ceph_inode_info *ci,
>   					 char *val, size_t size)
>   {
>   	ssize_t ret;
> -	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
> +	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
>   	struct ceph_osd_client *osdc = &fsc->client->osdc;
>   	s64 pool = ci->i_layout.pool_id;
>   	const char *pool_name;
> @@ -313,7 +313,7 @@ static ssize_t ceph_vxattrcb_snap_btime(struct ceph_inode_info *ci, char *val,
>   static ssize_t ceph_vxattrcb_cluster_fsid(struct ceph_inode_info *ci,
>   					  char *val, size_t size)
>   {
> -	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
> +	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
>   
>   	return ceph_fmt_xattr(val, size, "%pU", &fsc->client->fsid);
>   }
> @@ -321,7 +321,7 @@ static ssize_t ceph_vxattrcb_cluster_fsid(struct ceph_inode_info *ci,
>   static ssize_t ceph_vxattrcb_client_id(struct ceph_inode_info *ci,
>   				       char *val, size_t size)
>   {
> -	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->vfs_inode.i_sb);
> +	struct ceph_fs_client *fsc = ceph_sb_to_client(ci->netfs.inode.i_sb);
>   
>   	return ceph_fmt_xattr(val, size, "client%lld",
>   			      ceph_client_gid(fsc->client));
> @@ -621,7 +621,7 @@ static int __set_xattr(struct ceph_inode_info *ci,
>   	}
>   
>   	dout("__set_xattr_val added %llx.%llx xattr %p %.*s=%.*s\n",
> -	     ceph_vinop(&ci->vfs_inode), xattr, name_len, name, val_len, val);
> +	     ceph_vinop(&ci->netfs.inode), xattr, name_len, name, val_len, val);
>   
>   	return 0;
>   }
> @@ -863,7 +863,7 @@ struct ceph_buffer *__ceph_build_xattrs_blob(struct ceph_inode_info *ci)
>   	struct ceph_buffer *old_blob = NULL;
>   	void *dest;
>   
> -	dout("__build_xattrs_blob %p\n", &ci->vfs_inode);
> +	dout("__build_xattrs_blob %p\n", &ci->netfs.inode);
>   	if (ci->i_xattrs.dirty) {
>   		int need = __get_required_blob_size(ci, 0, 0);
>   
> diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> index 2b1a1c029c75..87beedb2cdea 100644
> --- a/fs/cifs/cifsfs.c
> +++ b/fs/cifs/cifsfs.c
> @@ -377,7 +377,7 @@ cifs_alloc_inode(struct super_block *sb)
>   	cifs_inode->flags = 0;
>   	spin_lock_init(&cifs_inode->writers_lock);
>   	cifs_inode->writers = 0;
> -	cifs_inode->vfs_inode.i_blkbits = 14;  /* 2**14 = CIFS_MAX_MSGSIZE */
> +	cifs_inode->netfs.inode.i_blkbits = 14;  /* 2**14 = CIFS_MAX_MSGSIZE */
>   	cifs_inode->server_eof = 0;
>   	cifs_inode->uniqueid = 0;
>   	cifs_inode->createtime = 0;
> @@ -389,12 +389,12 @@ cifs_alloc_inode(struct super_block *sb)
>   	 * Can not set i_flags here - they get immediately overwritten to zero
>   	 * by the VFS.
>   	 */
> -	/* cifs_inode->vfs_inode.i_flags = S_NOATIME | S_NOCMTIME; */
> +	/* cifs_inode->netfs.inode.i_flags = S_NOATIME | S_NOCMTIME; */
>   	INIT_LIST_HEAD(&cifs_inode->openFileList);
>   	INIT_LIST_HEAD(&cifs_inode->llist);
>   	INIT_LIST_HEAD(&cifs_inode->deferred_closes);
>   	spin_lock_init(&cifs_inode->deferred_lock);
> -	return &cifs_inode->vfs_inode;
> +	return &cifs_inode->netfs.inode;
>   }
>   
>   static void
> @@ -1414,7 +1414,7 @@ cifs_init_once(void *inode)
>   {
>   	struct cifsInodeInfo *cifsi = inode;
>   
> -	inode_init_once(&cifsi->vfs_inode);
> +	inode_init_once(&cifsi->netfs.inode);
>   	init_rwsem(&cifsi->lock_sem);
>   }
>   
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
> index 8de977c359b1..bb200ff0360b 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -1396,20 +1396,16 @@ void cifsFileInfo_put(struct cifsFileInfo *cifs_file);
>   #define CIFS_CACHE_RW_FLG	(CIFS_CACHE_READ_FLG | CIFS_CACHE_WRITE_FLG)
>   #define CIFS_CACHE_RHW_FLG	(CIFS_CACHE_RW_FLG | CIFS_CACHE_HANDLE_FLG)
>   
> -#define CIFS_CACHE_READ(cinode) ((cinode->oplock & CIFS_CACHE_READ_FLG) || (CIFS_SB(cinode->vfs_inode.i_sb)->mnt_cifs_flags & CIFS_MOUNT_RO_CACHE))
> +#define CIFS_CACHE_READ(cinode) ((cinode->oplock & CIFS_CACHE_READ_FLG) || (CIFS_SB(cinode->netfs.inode.i_sb)->mnt_cifs_flags & CIFS_MOUNT_RO_CACHE))
>   #define CIFS_CACHE_HANDLE(cinode) (cinode->oplock & CIFS_CACHE_HANDLE_FLG)
> -#define CIFS_CACHE_WRITE(cinode) ((cinode->oplock & CIFS_CACHE_WRITE_FLG) || (CIFS_SB(cinode->vfs_inode.i_sb)->mnt_cifs_flags & CIFS_MOUNT_RW_CACHE))
> +#define CIFS_CACHE_WRITE(cinode) ((cinode->oplock & CIFS_CACHE_WRITE_FLG) || (CIFS_SB(cinode->netfs.inode.i_sb)->mnt_cifs_flags & CIFS_MOUNT_RW_CACHE))
>   
>   /*
>    * One of these for each file inode
>    */
>   
>   struct cifsInodeInfo {
> -	struct {
> -		/* These must be contiguous */
> -		struct inode	vfs_inode;	/* the VFS's inode record */
> -		struct netfs_i_context netfs_ctx; /* Netfslib context */
> -	};
> +	struct netfs_inode netfs; /* Netfslib context and vfs inode */
>   	bool can_cache_brlcks;
>   	struct list_head llist;	/* locks helb by this inode */
>   	/*
> @@ -1448,7 +1444,7 @@ struct cifsInodeInfo {
>   static inline struct cifsInodeInfo *
>   CIFS_I(struct inode *inode)
>   {
> -	return container_of(inode, struct cifsInodeInfo, vfs_inode);
> +	return container_of(inode, struct cifsInodeInfo, netfs.inode);
>   }
>   
>   static inline struct cifs_sb_info *
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index d511a78383c3..58dce567ceaf 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -2004,7 +2004,7 @@ struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *cifs_inode,
>   					bool fsuid_only)
>   {
>   	struct cifsFileInfo *open_file = NULL;
> -	struct cifs_sb_info *cifs_sb = CIFS_SB(cifs_inode->vfs_inode.i_sb);
> +	struct cifs_sb_info *cifs_sb = CIFS_SB(cifs_inode->netfs.inode.i_sb);
>   
>   	/* only filter by fsuid on multiuser mounts */
>   	if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_MULTIUSER))
> @@ -2060,7 +2060,7 @@ cifs_get_writable_file(struct cifsInodeInfo *cifs_inode, int flags,
>   		return rc;
>   	}
>   
> -	cifs_sb = CIFS_SB(cifs_inode->vfs_inode.i_sb);
> +	cifs_sb = CIFS_SB(cifs_inode->netfs.inode.i_sb);
>   
>   	/* only filter by fsuid on multiuser mounts */
>   	if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_MULTIUSER))
> @@ -4665,14 +4665,14 @@ bool is_size_safe_to_change(struct cifsInodeInfo *cifsInode, __u64 end_of_file)
>   		/* This inode is open for write at least once */
>   		struct cifs_sb_info *cifs_sb;
>   
> -		cifs_sb = CIFS_SB(cifsInode->vfs_inode.i_sb);
> +		cifs_sb = CIFS_SB(cifsInode->netfs.inode.i_sb);
>   		if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_DIRECT_IO) {
>   			/* since no page cache to corrupt on directio
>   			we can change size safely */
>   			return true;
>   		}
>   
> -		if (i_size_read(&cifsInode->vfs_inode) < end_of_file)
> +		if (i_size_read(&cifsInode->netfs.inode) < end_of_file)
>   			return true;
>   
>   		return false;
> diff --git a/fs/cifs/fscache.c b/fs/cifs/fscache.c
> index a638b29e9062..23ef56f55ce5 100644
> --- a/fs/cifs/fscache.c
> +++ b/fs/cifs/fscache.c
> @@ -101,13 +101,13 @@ void cifs_fscache_get_inode_cookie(struct inode *inode)
>   	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
>   	struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
>   
> -	cifs_fscache_fill_coherency(&cifsi->vfs_inode, &cd);
> +	cifs_fscache_fill_coherency(&cifsi->netfs.inode, &cd);
>   
> -	cifsi->netfs_ctx.cache =
> +	cifsi->netfs.cache =
>   		fscache_acquire_cookie(tcon->fscache, 0,
>   				       &cifsi->uniqueid, sizeof(cifsi->uniqueid),
>   				       &cd, sizeof(cd),
> -				       i_size_read(&cifsi->vfs_inode));
> +				       i_size_read(&cifsi->netfs.inode));
>   }
>   
>   void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool update)
> @@ -131,7 +131,7 @@ void cifs_fscache_release_inode_cookie(struct inode *inode)
>   	if (cookie) {
>   		cifs_dbg(FYI, "%s: (0x%p)\n", __func__, cookie);
>   		fscache_relinquish_cookie(cookie, false);
> -		cifsi->netfs_ctx.cache = NULL;
> +		cifsi->netfs.cache = NULL;
>   	}
>   }
>   
> diff --git a/fs/cifs/fscache.h b/fs/cifs/fscache.h
> index 52355c0912ae..ab9a51d0125c 100644
> --- a/fs/cifs/fscache.h
> +++ b/fs/cifs/fscache.h
> @@ -52,10 +52,10 @@ void cifs_fscache_fill_coherency(struct inode *inode,
>   	struct cifsInodeInfo *cifsi = CIFS_I(inode);
>   
>   	memset(cd, 0, sizeof(*cd));
> -	cd->last_write_time_sec   = cpu_to_le64(cifsi->vfs_inode.i_mtime.tv_sec);
> -	cd->last_write_time_nsec  = cpu_to_le32(cifsi->vfs_inode.i_mtime.tv_nsec);
> -	cd->last_change_time_sec  = cpu_to_le64(cifsi->vfs_inode.i_ctime.tv_sec);
> -	cd->last_change_time_nsec = cpu_to_le32(cifsi->vfs_inode.i_ctime.tv_nsec);
> +	cd->last_write_time_sec   = cpu_to_le64(cifsi->netfs.inode.i_mtime.tv_sec);
> +	cd->last_write_time_nsec  = cpu_to_le32(cifsi->netfs.inode.i_mtime.tv_nsec);
> +	cd->last_change_time_sec  = cpu_to_le64(cifsi->netfs.inode.i_ctime.tv_sec);
> +	cd->last_change_time_nsec = cpu_to_le32(cifsi->netfs.inode.i_ctime.tv_nsec);
>   }
>   
>   
> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> index 2f9e7d2f81b6..81da81e18553 100644
> --- a/fs/cifs/inode.c
> +++ b/fs/cifs/inode.c
> @@ -115,7 +115,7 @@ cifs_revalidate_cache(struct inode *inode, struct cifs_fattr *fattr)
>   		 __func__, cifs_i->uniqueid);
>   	set_bit(CIFS_INO_INVALID_MAPPING, &cifs_i->flags);
>   	/* Invalidate fscache cookie */
> -	cifs_fscache_fill_coherency(&cifs_i->vfs_inode, &cd);
> +	cifs_fscache_fill_coherency(&cifs_i->netfs.inode, &cd);
>   	fscache_invalidate(cifs_inode_cookie(inode), &cd, i_size_read(inode), 0);
>   }
>   
> @@ -2499,7 +2499,7 @@ int cifs_fiemap(struct inode *inode, struct fiemap_extent_info *fei, u64 start,
>   		u64 len)
>   {
>   	struct cifsInodeInfo *cifs_i = CIFS_I(inode);
> -	struct cifs_sb_info *cifs_sb = CIFS_SB(cifs_i->vfs_inode.i_sb);
> +	struct cifs_sb_info *cifs_sb = CIFS_SB(cifs_i->netfs.inode.i_sb);
>   	struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
>   	struct TCP_Server_Info *server = tcon->ses->server;
>   	struct cifsFileInfo *cfile;
> diff --git a/fs/cifs/misc.c b/fs/cifs/misc.c
> index afaf59c22193..c8ddd02fa1e6 100644
> --- a/fs/cifs/misc.c
> +++ b/fs/cifs/misc.c
> @@ -536,11 +536,11 @@ void cifs_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock)
>   	if (oplock == OPLOCK_EXCLUSIVE) {
>   		cinode->oplock = CIFS_CACHE_WRITE_FLG | CIFS_CACHE_READ_FLG;
>   		cifs_dbg(FYI, "Exclusive Oplock granted on inode %p\n",
> -			 &cinode->vfs_inode);
> +			 &cinode->netfs.inode);
>   	} else if (oplock == OPLOCK_READ) {
>   		cinode->oplock = CIFS_CACHE_READ_FLG;
>   		cifs_dbg(FYI, "Level II Oplock granted on inode %p\n",
> -			 &cinode->vfs_inode);
> +			 &cinode->netfs.inode);
>   	} else
>   		cinode->oplock = 0;
>   }
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index d6aaeff4a30a..aaa06bb4b128 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -4238,15 +4238,15 @@ smb2_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock,
>   	if (oplock == SMB2_OPLOCK_LEVEL_BATCH) {
>   		cinode->oplock = CIFS_CACHE_RHW_FLG;
>   		cifs_dbg(FYI, "Batch Oplock granted on inode %p\n",
> -			 &cinode->vfs_inode);
> +			 &cinode->netfs.inode);
>   	} else if (oplock == SMB2_OPLOCK_LEVEL_EXCLUSIVE) {
>   		cinode->oplock = CIFS_CACHE_RW_FLG;
>   		cifs_dbg(FYI, "Exclusive Oplock granted on inode %p\n",
> -			 &cinode->vfs_inode);
> +			 &cinode->netfs.inode);
>   	} else if (oplock == SMB2_OPLOCK_LEVEL_II) {
>   		cinode->oplock = CIFS_CACHE_READ_FLG;
>   		cifs_dbg(FYI, "Level II Oplock granted on inode %p\n",
> -			 &cinode->vfs_inode);
> +			 &cinode->netfs.inode);
>   	} else
>   		cinode->oplock = 0;
>   }
> @@ -4285,7 +4285,7 @@ smb21_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock,
>   
>   	cinode->oplock = new_oplock;
>   	cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
> -		 &cinode->vfs_inode);
> +		 &cinode->netfs.inode);
>   }
>   
>   static void
> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
> index 281a88a5b8dc..e8e3359a4c54 100644
> --- a/fs/netfs/buffered_read.c
> +++ b/fs/netfs/buffered_read.c
> @@ -155,7 +155,7 @@ static void netfs_rreq_expand(struct netfs_io_request *rreq,
>   void netfs_readahead(struct readahead_control *ractl)
>   {
>   	struct netfs_io_request *rreq;
> -	struct netfs_i_context *ctx = netfs_i_context(ractl->mapping->host);
> +	struct netfs_inode *ctx = netfs_inode(ractl->mapping->host);
>   	int ret;
>   
>   	_enter("%lx,%x", readahead_index(ractl), readahead_count(ractl));
> @@ -216,7 +216,7 @@ int netfs_readpage(struct file *file, struct page *subpage)
>   	struct folio *folio = page_folio(subpage);
>   	struct address_space *mapping = folio_file_mapping(folio);
>   	struct netfs_io_request *rreq;
> -	struct netfs_i_context *ctx = netfs_i_context(mapping->host);
> +	struct netfs_inode *ctx = netfs_inode(mapping->host);
>   	int ret;
>   
>   	_enter("%lx", folio_index(folio));
> @@ -333,7 +333,7 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>   		      struct folio **_folio, void **_fsdata)
>   {
>   	struct netfs_io_request *rreq;
> -	struct netfs_i_context *ctx = netfs_i_context(file_inode(file ));
> +	struct netfs_inode *ctx = netfs_inode(file_inode(file ));
>   	struct folio *folio;
>   	unsigned int fgp_flags;
>   	pgoff_t index = pos >> PAGE_SHIFT;
> diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
> index b7b0e3d18d9e..43fac1b14e40 100644
> --- a/fs/netfs/internal.h
> +++ b/fs/netfs/internal.h
> @@ -91,7 +91,7 @@ static inline void netfs_stat_d(atomic_t *stat)
>   /*
>    * Miscellaneous functions.
>    */
> -static inline bool netfs_is_cache_enabled(struct netfs_i_context *ctx)
> +static inline bool netfs_is_cache_enabled(struct netfs_inode *ctx)
>   {
>   #if IS_ENABLED(CONFIG_FSCACHE)
>   	struct fscache_cookie *cookie = ctx->cache;
> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
> index e86107b30ba4..c6afa605b63b 100644
> --- a/fs/netfs/objects.c
> +++ b/fs/netfs/objects.c
> @@ -18,7 +18,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
>   {
>   	static atomic_t debug_ids;
>   	struct inode *inode = file ? file_inode(file) : mapping->host;
> -	struct netfs_i_context *ctx = netfs_i_context(inode);
> +	struct netfs_inode *ctx = netfs_inode(inode);
>   	struct netfs_io_request *rreq;
>   	int ret;
>   
> diff --git a/include/linux/netfs.h b/include/linux/netfs.h
> index c7bf1eaf51d5..6711868b6e14 100644
> --- a/include/linux/netfs.h
> +++ b/include/linux/netfs.h
> @@ -119,9 +119,10 @@ typedef void (*netfs_io_terminated_t)(void *priv, ssize_t transferred_or_error,
>   				      bool was_async);
>   
>   /*
> - * Per-inode description.  This must be directly after the inode struct.
> + * Per-inode context.  This wraps the VFS inode.
>    */
> -struct netfs_i_context {
> +struct netfs_inode {
> +	struct inode		inode;		/* The VFS inode */
>   	const struct netfs_request_ops *ops;
>   #if IS_ENABLED(CONFIG_FSCACHE)
>   	struct fscache_cookie	*cache;
> @@ -255,7 +256,7 @@ struct netfs_cache_ops {
>   	 * boundary as appropriate.
>   	 */
>   	enum netfs_io_source (*prepare_read)(struct netfs_io_subrequest *subreq,
> -					       loff_t i_size);
> +					     loff_t i_size);
>   
>   	/* Prepare a write operation, working out what part of the write we can
>   	 * actually do.
> @@ -287,45 +288,35 @@ extern void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
>   extern void netfs_stats_show(struct seq_file *);
>   
>   /**
> - * netfs_i_context - Get the netfs inode context from the inode
> + * netfs_inode - Get the netfs inode context from the inode
>    * @inode: The inode to query
>    *
>    * Get the netfs lib inode context from the network filesystem's inode.  The
>    * context struct is expected to directly follow on from the VFS inode struct.
>    */
> -static inline struct netfs_i_context *netfs_i_context(struct inode *inode)
> +static inline struct netfs_inode *netfs_inode(struct inode *inode)
>   {
> -	return (struct netfs_i_context *)(inode + 1);
> +	return container_of(inode, struct netfs_inode, inode);
>   }
>   
>   /**
> - * netfs_inode - Get the netfs inode from the inode context
> - * @ctx: The context to query
> - *
> - * Get the netfs inode from the netfs library's inode context.  The VFS inode
> - * is expected to directly precede the context struct.
> - */
> -static inline struct inode *netfs_inode(struct netfs_i_context *ctx)
> -{
> -	return ((struct inode *)ctx) - 1;
> -}
> -
> -/**
> - * netfs_i_context_init - Initialise a netfs lib context
> + * netfs_inode_init - Initialise a netfslib inode context
>    * @inode: The inode with which the context is associated
>    * @ops: The netfs's operations list
>    *
>    * Initialise the netfs library context struct.  This is expected to follow on
>    * directly from the VFS inode struct.
>    */
> -static inline void netfs_i_context_init(struct inode *inode,
> +static inline void netfs_inode_init(struct inode *inode,
>   					const struct netfs_request_ops *ops)
>   {
> -	struct netfs_i_context *ctx = netfs_i_context(inode);
> +	struct netfs_inode *ctx = netfs_inode(inode);
>   
> -	memset(ctx, 0, sizeof(*ctx));
>   	ctx->ops = ops;
>   	ctx->remote_i_size = i_size_read(inode);
> +#if IS_ENABLED(CONFIG_FSCACHE)
> +	ctx->cache = NULL;
> +#endif
>   }
>   
>   /**
> @@ -337,7 +328,7 @@ static inline void netfs_i_context_init(struct inode *inode,
>    */
>   static inline void netfs_resize_file(struct inode *inode, loff_t new_i_size)
>   {
> -	struct netfs_i_context *ctx = netfs_i_context(inode);
> +	struct netfs_inode *ctx = netfs_inode(inode);
>   
>   	ctx->remote_i_size = new_i_size;
>   }
> @@ -351,7 +342,7 @@ static inline void netfs_resize_file(struct inode *inode, loff_t new_i_size)
>   static inline struct fscache_cookie *netfs_i_cookie(struct inode *inode)
>   {
>   #if IS_ENABLED(CONFIG_FSCACHE)
> -	struct netfs_i_context *ctx = netfs_i_context(inode);
> +	struct netfs_inode *ctx = netfs_inode(inode);
>   	return ctx->cache;
>   #else
>   	return NULL;
>
>
Reviewed-by: Xiubo Li <xiubli@redhat.com>


