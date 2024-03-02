Return-Path: <linux-doc+bounces-11214-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5AB86F132
	for <lists+linux-doc@lfdr.de>; Sat,  2 Mar 2024 17:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB1E61F21F8F
	for <lists+linux-doc@lfdr.de>; Sat,  2 Mar 2024 16:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B631B1B5BA;
	Sat,  2 Mar 2024 16:22:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E971B273
	for <linux-doc@vger.kernel.org>; Sat,  2 Mar 2024 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709396576; cv=none; b=oj9NLf0SNaeO2KOXvNs8R4EilYuB5Ku97kT7x7108yxsYB0/PerBqKugic6IE63RI7VrblKnBsENYReP4KYNsT4jy3wYenIt2pD3y0nioiahWbGowvl8mGfuxe5XKp+KyMo5UPac2moYu19XMwF7Yeg/R4eRq86z8Nl2Ieb+M+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709396576; c=relaxed/simple;
	bh=XURcPi80ktqpwDBSxPxq7g3Gl8HnCoFYrRqz0mcbS8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmlpB3cUueBYrxRDS1C2wQM857Xh64KLmOdEIVd7qfTWQ6OTjzXu9J1HavBH5FHrkTnTZk7lUahuSd5Rqc4SoiJ7oEPN/nbbfPcoOB5uhYjJuJApiPm8KQ0YO8acIZCDkwbQu6ULcxFmidnBsJTeFYyT0KMSYexSAyzzdjlfiLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-787b0b1deeaso154064385a.3
        for <linux-doc@vger.kernel.org>; Sat, 02 Mar 2024 08:22:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709396573; x=1710001373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CTJvFhGy1Bzd3KvOdnEpD8D/Edct8dik+Axa8R/H/U=;
        b=WrVtoKtNxPuonJm+lddQjCCv+vc6wVF7EdXU+We3yMI/LgXy4mYasnzhO/w4rQZ6hf
         zmW3OVzm3LybO6XOJVcw1mC2LAZEKY+07l4RdxYm4XZmm8RWfhmmIiB2U6o8q0rhzexf
         zeQtVdpN405tPLJpuD+DMjV5wcntaVNOP/FPHM2tdvad8iWXn1Yjhn3zXlMqbFkqytVr
         GAL0deqTYP2EmJBOhGDF5otFT6mL3krlzmFwEcHM8YNivJ7CY+hjbcUL8Cm09YGLkpwH
         rSkEtPc5V5oLZWHo/kfQT+acn3RSTSXyEQ5nNygbO0y7yKws2ta9y0UIWmS0BtaDSGCu
         nasg==
X-Forwarded-Encrypted: i=1; AJvYcCVr2Zu3M7jVaMMsGRuUR1D3+48Oq5XYHhFSjJQrk8OvmRVuGb654sE3KLc8DrfW0d+kynBEPb7fkWb5d4Qi1VBxaXwg2xd8Y+kI
X-Gm-Message-State: AOJu0YwqADt5Rvn7fY4eJuZlCGpUmHUe2KCw/MBbnvY8rr76Rcf9JZQ7
	NfpNpMkZKoqSbk6NZTUm9FdnDDT9Q1/b8WmNNcBLx3QNwBcFWxQTP7SpYFxeaw==
X-Google-Smtp-Source: AGHT+IH3W/XkrKR76p3+gwmEVhV4Af7xAoXDhhzOgTPCdCMEIBZjGKC5F+gRt7thhAcDDjvRoB1Eow==
X-Received: by 2002:a05:620a:1794:b0:788:20a6:518a with SMTP id ay20-20020a05620a179400b0078820a6518amr910312qkb.66.1709396573481;
        Sat, 02 Mar 2024 08:22:53 -0800 (PST)
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net. [68.160.141.91])
        by smtp.gmail.com with ESMTPSA id c17-20020a05620a0cf100b007881eb5683fsm280597qkj.2.2024.03.02.08.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 08:22:53 -0800 (PST)
Date: Sat, 2 Mar 2024 11:22:50 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org,
	serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org,
	axboe@kernel.dk, agk@redhat.com, eparis@redhat.com,
	paul@paul-moore.com, linux-doc@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@lists.linux.dev, audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deven Bowers <deven.desai@linux.microsoft.com>
Subject: Re: [RFC PATCH v13 14/20] dm verity: consume root hash digest and
 signature data via LSM hook
Message-ID: <ZeNSWgnKMldcb_jp@redhat.com>
References: <1709168102-7677-1-git-send-email-wufan@linux.microsoft.com>
 <1709168102-7677-15-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1709168102-7677-15-git-send-email-wufan@linux.microsoft.com>

On Wed, Feb 28 2024 at  7:54P -0500,
Fan Wu <wufan@linux.microsoft.com> wrote:

> From: Deven Bowers <deven.desai@linux.microsoft.com>
> 
> dm-verity provides a strong guarantee of a block device's integrity. As
> a generic way to check the integrity of a block device, it provides
> those integrity guarantees to its higher layers, including the filesystem
> level.
> 
> An LSM that control access to a resource on the system based on the
> available integrity claims can use this transitive property of
> dm-verity, by querying the underlying block_device of a particular
> file.
> 
> The digest and signature information need to be stored in the block
> device to fulfill the next requirement of authorization via LSM policy.
> This will enable the LSM to perform revocation of devices that are still
> mounted, prohibiting execution of files that are no longer authorized
> by the LSM in question.
> 
> This patch added two security hook calls in dm-verity to save the
> dm-verity roothash and the roothash signature to the block device's
> LSM blobs. The hook calls are depended on CONFIG_IPE_PROP_DM_VERITY,
> which will be introduced in the next commit.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ---
> v2:
>   + No Changes
> 
> v3:
>   + No changes
> 
> v4:
>   + No changes
> 
> v5:
>   + No changes
> 
> v6:
>   + Fix an improper cleanup that can result in
>     a leak
> 
> v7:
>   + Squash patch 08/12, 10/12 to [11/16]
>   + Use part0 for block_device, to retrieve the block_device, when
>     calling security_bdev_setsecurity
> 
> v8:
>   + Undo squash of 08/12, 10/12 - separating drivers/md/ from
>     security/ & block/
>   + Use common-audit function for dmverity_signature.
>   + Change implementation for storing the dm-verity digest to use the
>     newly introduced dm_verity_digest structure introduced in patch
>     14/20.
>   + Create new structure, dm_verity_digest, containing digest algorithm,
>     size, and digest itself to pass to the LSM layer. V7 was missing the
>     algorithm.
>   + Create an associated public header containing this new structure and
>     the key values for the LSM hook, specific to dm-verity.
>   + Additional information added to commit, discussing the layering of
>     the changes and how the information passed will be used.
> 
> v9:
>   + No changes
> 
> v10:
>   + No changes
> 
> v11:
>   + Add an optional field to save signature
>   + Move the security hook call to the new finalize hook
> 
> v12:
>   + No changes
> 
> v13:
>   + No changes
> ---
>  drivers/md/dm-verity-target.c | 71 +++++++++++++++++++++++++++++++++++
>  drivers/md/dm-verity.h        |  6 +++
>  include/linux/dm-verity.h     | 19 ++++++++++
>  3 files changed, 96 insertions(+)
>  create mode 100644 include/linux/dm-verity.h
> 
> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
> index a99ef30e45ca..e7bc6afae708 100644
> --- a/drivers/md/dm-verity-target.c
> +++ b/drivers/md/dm-verity-target.c
> @@ -13,6 +13,7 @@
>   * access behavior.
>   */
>  
> +#include "dm-core.h"
>  #include "dm-verity.h"
>  #include "dm-verity-fec.h"
>  #include "dm-verity-verify-sig.h"
> @@ -22,6 +23,9 @@
>  #include <linux/scatterlist.h>
>  #include <linux/string.h>
>  #include <linux/jump_label.h>
> +#include <linux/security.h>
> +#include <linux/dm-verity.h>
> +#include <crypto/hash_info.h>
>  
>  #define DM_MSG_PREFIX			"verity"
>  
> @@ -990,6 +994,17 @@ static void verity_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  	blk_limits_io_min(limits, limits->logical_block_size);
>  }
>  
> +#ifdef CONFIG_IPE_PROP_DM_VERITY
> +static void verity_free_sig(struct dm_verity *v)
> +{
> +	kfree(v->root_digest_sig);
> +}
> +#else
> +static inline void verity_free_sig(struct dm_verity *v)
> +{
> +}
> +#endif /* CONFIG_IPE_PROP_DM_VERITY */
> +
>  static void verity_dtr(struct dm_target *ti)
>  {
>  	struct dm_verity *v = ti->private;
> @@ -1008,6 +1023,7 @@ static void verity_dtr(struct dm_target *ti)
>  	kfree(v->salt);
>  	kfree(v->root_digest);
>  	kfree(v->zero_digest);
> +	verity_free_sig(v);
>  
>  	if (v->tfm)
>  		crypto_free_ahash(v->tfm);
> @@ -1199,6 +1215,25 @@ static int verity_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
>  	return r;
>  }
>  
> +#ifdef CONFIG_IPE_PROP_DM_VERITY
> +static int verity_init_sig(struct dm_verity *v, const void *sig,
> +			   size_t sig_size)
> +{
> +	v->sig_size = sig_size;
> +	v->root_digest_sig = kmalloc(v->sig_size, GFP_KERNEL);
> +	if (!v->root_digest)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +#else
> +static inline int verity_init_sig(struct dm_verity *v, const void *sig,
> +				  size_t sig_size)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_IPE_PROP_DM_VERITY */
> +

Please move verity_init_sig() to be at beginning of same #ifdef block
as verity_free_sig() above.  Also, please add blank lines between
#ifdef, #else and #endif.

>  /*
>   * Target parameters:
>   *	<version>	The current format is version 1.
> @@ -1407,6 +1442,13 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		ti->error = "Root hash verification failed";
>  		goto bad;
>  	}
> +
> +	r = verity_init_sig(v, verify_args.sig, verify_args.sig_size);
> +	if (r < 0) {
> +		ti->error = "Cannot allocate root digest signature";
> +		goto bad;
> +	}
> +
>  	v->hash_per_block_bits =
>  		__fls((1 << v->hash_dev_block_bits) / v->digest_size);
>  
> @@ -1557,6 +1599,32 @@ int dm_verity_get_root_digest(struct dm_target *ti, u8 **root_digest, unsigned i
>  	return 0;
>  }
>  
> +#ifdef CONFIG_IPE_PROP_DM_VERITY
> +static int verity_finalize(struct dm_target *ti)
> +{
> +	struct block_device *bdev;
> +	struct dm_verity_digest root_digest;
> +	struct dm_verity *v;
> +	int r;
> +
> +	v = ti->private;
> +	bdev = dm_table_get_md(ti->table)->disk->part0;
> +	root_digest.digest = v->root_digest;
> +	root_digest.digest_len = v->digest_size;
> +	root_digest.alg = v->alg_name;
> +
> +	r = security_bdev_setsecurity(bdev, DM_VERITY_ROOTHASH_SEC_NAME, &root_digest,
> +				      sizeof(root_digest));
> +	if (r)
> +		return r;
> +
> +	return security_bdev_setsecurity(bdev,
> +					 DM_VERITY_SIGNATURE_SEC_NAME,
> +					 v->root_digest_sig,
> +					 v->sig_size);
> +}
> +#endif /* CONFIG_IPE_PROP_DM_VERITY */
> +

Again, blank line after #ifdef and before #endif

Thanks,
Mike

