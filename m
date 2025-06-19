Return-Path: <linux-doc+bounces-49722-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C6AE01E8
	for <lists+linux-doc@lfdr.de>; Thu, 19 Jun 2025 11:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79EA73A4EC2
	for <lists+linux-doc@lfdr.de>; Thu, 19 Jun 2025 09:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9084F21D5BF;
	Thu, 19 Jun 2025 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xrE2AniU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65ED1E3DE8
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326195; cv=none; b=Lqw9YREZwPrrJCZGNPVBrJrEkNVXpmTpPjbyc/LWqZQc4xYSg8caRxe1f1ox6g2DVpmRLwKJDvZddheSLP4QVZURXtGqNllEl9mZRVX/HiyyhClN5eXjdQX2rrytGG5zvz7rDEmMHUfTTlXHJe1PkuXWOSRzgYO/I4lCjbGPotY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326195; c=relaxed/simple;
	bh=rUDdpknfWDNkJiSZtzP/zJgRt8UmBkl0mTazM2qX9Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quGDduAQ4fLMjtR359113wwMphc1VsBlAxWQ0cTZfD2nUrduyT6BzCmux+EfPKU4pX8WYysDtN39hCqYkoY+iZPtN1JuaV03fBqiQdwlic01p+ZlWRsLz7ot7jH+7gmUeskINOdaxHHyX+n3nGCEP0OIFQZhc4gLF+irD8v8B+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xrE2AniU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2348ac8e0b4so109975ad.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750326192; x=1750930992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qaC15VNy2W6fdEhbxclQpnkYOQSK9bnjumzMUXgIe2M=;
        b=xrE2AniUpDZFnQJCoiQkusoi/sCdq3m2wKLfeaUBEAaPhrCvh8xIN09dtp+f9reqrF
         kCLtX7CZyzGR4gE++1OOGngxFoBvSOWpRqonb3m+Cap8yfn+UaH3lseJcGQwv6OXL3jR
         uBF32kcMMyOuDwfWBLBRH7o7dGc27x8hDCqdWRhmD42GBUKrAc/wGtBewd2XTfD8qg0Z
         n0bP9prn45O1i3KTfEbsqCh1KAe0TeSD9kq+OAMJawoEuhbHLSsr1AbloWaPYXf8cpB5
         OA2h/j6N2N5w+XKDegnsSs3JKwPeL4ldkzgjP7Tjiia7NdjUSa0qTTfQKumAmfZ2cI4Y
         hS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750326192; x=1750930992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaC15VNy2W6fdEhbxclQpnkYOQSK9bnjumzMUXgIe2M=;
        b=JIkLMy7BtPM/4CP5u8oLFqD5WAHMmwPfAXijC53FLCKSr64Ui/JZ9t46gqTSxfEKMq
         wdECoXGARGUJA8vbfGhG0Rm02pLS2u+LRWYRBAA7pmJ5pwKNYvbglJ24EChXHH3OConD
         YpYZZ60E2Yq1ToF0x5sxgiEcJ4ymz2FNvwQGoQwrzkOfb6ROmRYX9dRDewTCCy3bpUGX
         A3XlQeX5JmHTXgWFztfNtB4JTCH0o458R3mHD+VD/T1E3b+uTP9iX9jm6ylPRszBBVqg
         FIlbNQT9tr/cWc4fHuiLI/QUDrg1f3bGXCj3M8rpnJYLhHMlGjEIK6xMBPdGty+U4ljl
         /0gQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8mZhIl7JCt7H5qWQdjsS3ukmGOghaxAb/DywWOoYD3Ji+3rd1S5KlChUB4zpc1oJH9eHBboEELno=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9dQcDXIUDEwlv1Xl6An3vjvhZhhOKJ3nLS1BU9vTnCmCC9ci
	yzkBDXl6Bn/2NTl1f9eT14AsNdDcCHiZG42vt8fa4a/bDs+Ju5tU4F5aQ8KKD4X9yg==
X-Gm-Gg: ASbGnctP3svONmW7DNV5ESU+VzXrRgAcjoCt0tKpTr7hNQaXTkRYzUPnfBe9Ldz/+6n
	F1LwAvKc6TWw/8/sNhl7GoSV/tn6FLFqzqmQ4o1OL5N2gFbx79SZxYVN0mgw4CNW0xgKIx6qUue
	ZDs+cssRJqg0kiFzaKmS+nIBuH51rtQ6fyqqEaa8deTfhVi1CBFvQbQYbPuWmX5sgv/DtAqYG2Y
	RKf3Xn6N+kv0JlqVHLIHSNdU5nneEzRzm5aDpSMjo9WprAlv32z/lI5Dr3GEjIgack91fRLYXrY
	fAf9x/tu/onahY8QEZ/AUdVs3zzjGt/hGWi118zfpWjd5szHv7wNimZ+6DdB7DEAXAuN/r23GDI
	HYQuwd49EAiLNzoUYjEt3
X-Google-Smtp-Source: AGHT+IF5Xbj3Phk3inMt+DC051gDXuXBtlipiWCKp5tiqrOfx50jggHB3jHa73ldHrX+V4U1FbWR2Q==
X-Received: by 2002:a17:903:1510:b0:235:f298:cbbb with SMTP id d9443c01a7336-237cca9b5a1mr2457355ad.26.1750326191623;
        Thu, 19 Jun 2025 02:43:11 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890082e71sm13198748b3a.107.2025.06.19.02.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:43:10 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:42:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 07/25] iommufd/access: Add internal APIs for HW queue
 to use
Message-ID: <aFPbo6RI-D4T7nXE@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>

On Sat, Jun 14, 2025 at 12:14:32AM -0700, Nicolin Chen wrote:
> Now, access->ops can be NULL, to support an internal use case for the new
> HW queue object. Since an access object in this case will be allocated by
> an inernal iommufd object, the refcount on the ictx should be skipped, so
> as not to deadlock the release of the ictx as it would otherwise wait for
> the release of the access first during the release of the internal object
> that could wait for the release of ictx:
>     ictx --releases--> hw_queue --releases--> access
>       ^                                         |
>       |_________________releases________________v
> 
> Add a set of lightweight internal APIs to unlink access and ictx:
>     ictx --releases--> hw_queue --releases--> access
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  8 ++++
>  drivers/iommu/iommufd/device.c          | 59 +++++++++++++++++++++----
>  2 files changed, 58 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 4a375a8c9216..468717d5e5bc 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -484,6 +484,14 @@ void iopt_remove_access(struct io_pagetable *iopt,
>  			struct iommufd_access *access, u32 iopt_access_list_id);
>  void iommufd_access_destroy_object(struct iommufd_object *obj);
>  
> +/* iommufd_access for internal use */
> +struct iommufd_access *iommufd_access_create_internal(struct iommufd_ctx *ictx);
> +#define iommufd_access_destroy_internal(ictx, access) \
> +	iommufd_object_destroy_user(ictx, &(access)->obj)
> +int iommufd_access_attach_internal(struct iommufd_access *access,
> +				   struct iommufd_ioas *ioas);
> +#define iommufd_access_detach_internal(access) iommufd_access_detach(access)
> +
>  struct iommufd_eventq {
>  	struct iommufd_object obj;
>  	struct iommufd_ctx *ictx;
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index 9293722b9cff..ad33f1e41a24 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -1084,7 +1084,39 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
>  	if (access->ioas)
>  		WARN_ON(iommufd_access_change_ioas(access, NULL));
>  	mutex_unlock(&access->ioas_lock);
> -	iommufd_ctx_put(access->ictx);
> +	if (access->ops)
> +		iommufd_ctx_put(access->ictx);

Purely relying on access->ops being NULL feels a bit hacky to me..

> +}
> +
> +static struct iommufd_access *__iommufd_access_create(struct iommufd_ctx *ictx)
> +{
> +	struct iommufd_access *access;
> +
> +	/*
> +	 * There is no uAPI for the access object, but to keep things symmetric
> +	 * use the object infrastructure anyhow.
> +	 */
> +	access = iommufd_object_alloc(ictx, access, IOMMUFD_OBJ_ACCESS);
> +	if (IS_ERR(access))
> +		return access;
> +
> +	/* The calling driver is a user until iommufd_access_destroy() */
> +	refcount_inc(&access->obj.users);
> +	mutex_init(&access->ioas_lock);
> +	return access;
> +}
> +
> +struct iommufd_access *iommufd_access_create_internal(struct iommufd_ctx *ictx)
> +{
> +	struct iommufd_access *access;
> +
> +	access = __iommufd_access_create(ictx);
> +	if (IS_ERR(access))
> +		return access;
> +	access->iova_alignment = PAGE_SIZE;

Maybe setting acces->ictx = NULL; explicitly here would be a clear
demarcation between the new API for "internal" v/s the original one.
Else, I definitely believe we should have a comment mentioning that
access->ictx is NULL for internal.

> +
> +	iommufd_object_finalize(ictx, &access->obj);
> +	return access;
>  }
>  
>  /**
> @@ -1106,11 +1138,7 @@ iommufd_access_create(struct iommufd_ctx *ictx,
>  {
>  	struct iommufd_access *access;
>  
> -	/*
> -	 * There is no uAPI for the access object, but to keep things symmetric
> -	 * use the object infrastructure anyhow.
> -	 */
> -	access = iommufd_object_alloc(ictx, access, IOMMUFD_OBJ_ACCESS);
> +	access = __iommufd_access_create(ictx);
>  	if (IS_ERR(access))
>  		return access;
>  
> @@ -1122,13 +1150,10 @@ iommufd_access_create(struct iommufd_ctx *ictx,
>  	else
>  		access->iova_alignment = 1;
>  
> -	/* The calling driver is a user until iommufd_access_destroy() */
> -	refcount_inc(&access->obj.users);
>  	access->ictx = ictx;
>  	iommufd_ctx_get(ictx);
>  	iommufd_object_finalize(ictx, &access->obj);
>  	*id = access->obj.id;
> -	mutex_init(&access->ioas_lock);
>  	return access;
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_access_create, "IOMMUFD");
> @@ -1173,6 +1198,22 @@ int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id)
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_access_attach, "IOMMUFD");
>  
> +int iommufd_access_attach_internal(struct iommufd_access *access,
> +				   struct iommufd_ioas *ioas)
> +{
> +	int rc;
> +
> +	mutex_lock(&access->ioas_lock);
> +	if (WARN_ON(access->ioas)) {
> +		mutex_unlock(&access->ioas_lock);
> +		return -EINVAL;
> +	}
> +
> +	rc = iommufd_access_change_ioas(access, ioas);
> +	mutex_unlock(&access->ioas_lock);
> +	return rc;
> +}
> +
>  int iommufd_access_replace(struct iommufd_access *access, u32 ioas_id)
>  {
>  	int rc;
> -- 
> 2.43.0
> 

