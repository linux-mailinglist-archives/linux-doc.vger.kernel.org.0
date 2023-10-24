Return-Path: <linux-doc+bounces-901-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2317D4648
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 05:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A089E28194D
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 03:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10489C8F1;
	Tue, 24 Oct 2023 03:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KbMUBQMS"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499F8472
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 03:52:38 +0000 (UTC)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2A51704
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:35 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-778af1b5b1eso242508285a.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698119554; x=1698724354; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SJeWgPJnFP9SHHxUPbKsetSyEOFGY5VrSBabMhJS80Q=;
        b=KbMUBQMSOcaTYRAPp57HT97WBcJpv085FPhzTuONCktGCFLEeNrp1Oj5EH4t1FUOg9
         2JLJSgP1Elq9HtEUyIzCkrxZEQP9oanHoI9Exl5JGeQaIUqujCSkqujvtOc9XE0s5BDn
         soI+khKShmTYAk7PwvQqtrAVvCoDquHrSD/El9o5n6dnp/CcSHM8f+RLfDheSMeKCxxY
         V4ZdZqYjT0oSW63WGkXVOwQjBGwNrzPoKtrMk7m98c3JwGFrjh3lDjoOmLFx2Gq5tUQ+
         Z2MAKPPRyoAjBGikCTttGdsKoCydwH9mfo49z7AM8By/xsh+XhyTVOmPJrpWL7d076s5
         H3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698119554; x=1698724354;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJeWgPJnFP9SHHxUPbKsetSyEOFGY5VrSBabMhJS80Q=;
        b=jDLGVYSZqP9PlvhtktI0ojd4fOHsQlhdF9I0zn5TGtunYXTWO5/YAgB5q82Cu0OrXb
         DcVaYsw9BS4vBeKDL+bj6kxGIck47MdUN7IYc8V/J7ukiKzKqUnbk5j9y/ISnObVuX65
         6WpukEhHKOBgQxI6iMesgHxGYAIjMpMdGdEfdhtnRHNVDOJjgMjFeDErRffZXgBv2pgK
         Tbr+EhvPkedS9nx5WBXYi5a2Natl35aqO+Ly0F1mP/Nus3BMa/kHxsA+4RVnpOJ4JiX5
         x49dOO8iu6PaS+BKZEq/3gHlf0SE2bXIIxTK83Qov90v0/lBBgHQeHJFPa//iL/Qr25E
         Mz8A==
X-Gm-Message-State: AOJu0YyTKcTrwkbB3RBTPAW7cBSoZcDgGqgDy7MpRUTKqpYaeZwDmyC6
	YrwP8VOo5wPG+x/1bmUMJBoK
X-Google-Smtp-Source: AGHT+IH2nCw7lcCJOC1jGaMBVsqfLXNVaAdsff3fbIwOETvTCI7/MGjJFVZyviKRDzofuJU8klNdDQ==
X-Received: by 2002:a05:620a:2907:b0:778:b78b:3338 with SMTP id m7-20020a05620a290700b00778b78b3338mr7760648qkp.10.1698119554427;
        Mon, 23 Oct 2023 20:52:34 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id i6-20020a05620a404600b007742c6823a3sm3143889qko.108.2023.10.23.20.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 20:52:33 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:52:33 -0400
Message-ID: <6efb7a80ba0eb3e02b3ae7a5c0a210f3.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com, linux-kernel@vger.kernel.org, Fan Wu <wufan@linux.microsoft.com>, Deven Bowers <deven.desai@linux.microsoft.com>
Subject: Re: [PATCH RFC v11 15/19] fsverity: consume builtin signature via LSM  hook
References: <1696457386-3010-16-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-16-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
> 
> fsverity represents a mechanism to support both integrity and
> authenticity protection of a file, supporting both signed and unsigned
> digests.
> 
> An LSM which controls access to a resource based on authenticity and
> integrity of said resource, can then use this data to make an informed
> decision on the authorization (provided by the LSM's policy) of said
> claim.
> 
> This effectively allows the extension of a policy enforcement layer in
> LSM for fsverity, allowing for more granular control of how a
> particular authenticity claim can be used. For example, "all (built-in)
> signed fsverity files should be allowed to execute, but only these
> hashes are allowed to be loaded as kernel modules".
> 
> This enforcement must be done in kernel space, as a userspace only
> solution would fail a simple litmus test: Download a self-contained
> malicious binary that never touches the userspace stack. This
> binary would still be able to execute.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ---
> v1-v6:
>   + Not present
> 
> v7:
>   Introduced
> 
> v8:
>   + Split fs/verity/ changes and security/ changes into separate patches
>   + Change signature of fsverity_create_info to accept non-const inode
>   + Change signature of fsverity_verify_signature to accept non-const inode
>   + Don't cast-away const from inode.
>   + Digest functionality dropped in favor of:
>     ("fs-verity: define a function to return the integrity protected
>       file digest")
>   + Reworded commit description and title to match changes.
>   + Fix a bug wherein no LSM implements the particular fsverity @name
>     (or LSM is disabled), and returns -EOPNOTSUPP, causing errors.
> 
> v9:
>   + No changes
> 
> v10:
>   + Rename the signature blob key
>   + Cleanup redundant code
>   + Make the hook call depends on CONFIG_FS_VERITY_BUILTIN_SIGNATURES
> 
> v11:
>   + No changes
> ---
>  fs/verity/fsverity_private.h |  2 +-
>  fs/verity/open.c             | 26 +++++++++++++++++++++++++-
>  include/linux/fsverity.h     |  2 ++
>  3 files changed, 28 insertions(+), 2 deletions(-)

We need an ACK from some VFS folks on this.

> diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
> index d071a6e32581..4a82716e852f 100644
> --- a/fs/verity/fsverity_private.h
> +++ b/fs/verity/fsverity_private.h
> @@ -108,7 +108,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
>  				     unsigned int log_blocksize,
>  				     const u8 *salt, size_t salt_size);
>  
> -struct fsverity_info *fsverity_create_info(const struct inode *inode,
> +struct fsverity_info *fsverity_create_info(struct inode *inode,
>  					   struct fsverity_descriptor *desc);
>  
>  void fsverity_set_info(struct inode *inode, struct fsverity_info *vi);
> diff --git a/fs/verity/open.c b/fs/verity/open.c
> index 6c31a871b84b..5b48e2c39086 100644
> --- a/fs/verity/open.c
> +++ b/fs/verity/open.c
> @@ -8,6 +8,7 @@
>  #include "fsverity_private.h"
>  
>  #include <linux/mm.h>
> +#include <linux/security.h>
>  #include <linux/slab.h>
>  
>  static struct kmem_cache *fsverity_info_cachep;
> @@ -172,12 +173,28 @@ static int compute_file_digest(const struct fsverity_hash_alg *hash_alg,
>  	return err;
>  }
>  
> +#ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
> +static int fsverity_inode_setsecurity(struct inode *inode,
> +				      struct fsverity_descriptor *desc)
> +{
> +	return security_inode_setsecurity(inode, FS_VERITY_INODE_SEC_NAME,
> +					  desc->signature,
> +					  le32_to_cpu(desc->sig_size), 0);
> +}
> +#else
> +static inline int fsverity_inode_setsecurity(struct inode *inode,
> +					     struct fsverity_descriptor *desc)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_IPE_PROP_FS_VERITY*/
> +
>  /*
>   * Create a new fsverity_info from the given fsverity_descriptor (with optional
>   * appended builtin signature), and check the signature if present.  The
>   * fsverity_descriptor must have already undergone basic validation.
>   */
> -struct fsverity_info *fsverity_create_info(const struct inode *inode,
> +struct fsverity_info *fsverity_create_info(struct inode *inode,
>  					   struct fsverity_descriptor *desc)
>  {
>  	struct fsverity_info *vi;
> @@ -242,6 +259,13 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
>  		spin_lock_init(&vi->hash_page_init_lock);
>  	}
>  
> +	err = fsverity_inode_setsecurity(inode, desc);
> +	if (err == -EOPNOTSUPP)
> +		err = 0;
> +
> +	if (err)
> +		goto fail;
> +
>  	return vi;
>  
>  fail:
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index 1eb7eae580be..9666721baf15 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -319,4 +319,6 @@ static inline int fsverity_prepare_setattr(struct dentry *dentry,
>  	return 0;
>  }
>  
> +#define FS_VERITY_INODE_SEC_NAME "fsverity.builtin-sig"
> +
>  #endif	/* _LINUX_FSVERITY_H */
> -- 
> 2.25.1

--
paul-moore.com

