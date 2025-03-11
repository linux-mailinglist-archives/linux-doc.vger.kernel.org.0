Return-Path: <linux-doc+bounces-40588-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 149FAA5D251
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 23:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48DEA17C2F4
	for <lists+linux-doc@lfdr.de>; Tue, 11 Mar 2025 22:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04833264FAB;
	Tue, 11 Mar 2025 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZeROWN3j"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10936262819
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731020; cv=none; b=b1FkG+61CWNqAG4F+i409omOFKwAMqsFLQoJWM464dhwZ7y80e7j+dofCYw8YGY53HmpeAS2yxl7KyX9jZ7HKylF+ypuN2D5agkNi9y5FRD7K+yXPEzp54tszaWFaOc2NH8dNDYFgzpWKHVLaHDy6/cV2X3TMx2ZzhtoBf5zjIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731020; c=relaxed/simple;
	bh=s82bErdX4EnYnwudyQnjNihkbyWdccqlmxsD8uaxjzA=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=VJ/er40KsojGhBnEomocdBIiCiDQT4ArVk+7+2zH6BDQQiDH6+3QqKVmW/TOfw3UuAxKWBI9H+amI0jW0AfAOP2K6I1oZYeDIbNPDGS0aQRKUmQvacKVlSjzXEmI9xGkHPs4WfOIDZl+4z8981xpWYhQiPqGSEIdZeRsoCBAUEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZeROWN3j; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476805acddaso30114331cf.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 15:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1741731018; x=1742335818; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZbs1+jjEWPFGCPeM1YxxvgtUsuRoKlEODhhpfoVXGs=;
        b=ZeROWN3jxcSN1N2oDgGI0CHcg5m1zZONDG63Jyfdl4nFb6YC+fQBNckLgn8fvi1ijP
         +Bdl+G2m0ECx2iMRSRLQ+sBwJL81HvvRVyY6ibvryIMi5Q0kFu1zcCG9QlYeX1Hm6tUN
         u8W6ezTN4tx5cPYMgALEIBH9B3VsAvlt1gVTGPwmuE+XzH+i/eg85unVEY5IHyS1W74e
         YSZFA6/RtJbpU5DII/f0azB5iUbEP040NWEqx7RKg7+YWgXkuCEP2Co/0s3APoSJJVrd
         j/Zty6iG60HyJYYjmZdZteFJdA3/xr6jNFCOiug6ppNVvUKVY9Cx5Oc6MTq+Sld0nYNc
         okXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741731018; x=1742335818;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MZbs1+jjEWPFGCPeM1YxxvgtUsuRoKlEODhhpfoVXGs=;
        b=LA3qBPuNQE63qfcWYzBxo1Uhyka9OzFJnGQcWUYYWefjFnOzWfwM7Mlm4JB3jMpx3k
         RqOruhJ/8Kh3L3c3eV4Zh62O9IXfOwORFYgCwNdZPAjbV0+UeT8zNR7bG4sAd4b3xs/7
         5Q3yvdLoA1Qvk4aG8ITd+Nlu2r0oncawB0iAg9bfErsIah7PUZAY4HnXXXE57ViQlw+U
         7Dxl5sGKUXOYfWBSt9JuipvE8ycJh1+j+U6XAhFL+u8GF1KcglNn1Oth58Edh5jM0UfB
         GC91y29Qu+tZr1CTsgJpq9ykbXVmg+hleJi6tFTK91dQfLPQMm4gkF6DuefPx0IyHp1C
         xQdw==
X-Gm-Message-State: AOJu0YzEQqmFQOISFkDy2U4JDnO3+Nu3Ab5EZxF+WiH4QsTDNHoDwV7n
	lQpt6EZB4rAxemeOGwMJt8CsxZR1di0PfRM4HIRvhb423uaUZnKCbhITnV11Dw==
X-Gm-Gg: ASbGncskDnBL53EY8/DDXUCIv+z+41pddzLlowN2PbxlTgtu5AS0OI94x/i4xfdT/PB
	jBenEN3KlfMTT+eQtzb0ThakTj3mg+zyvUlNPoViC94grRig6QRQCfY1VNHkdXYOVPCWxW+P/ag
	gXVXe/EnXXMY0tfUmTGV3kIghDo+1OXrMKg4oVHpcboD5isLZaDnyhOIAs9DVmwy0nt7jV9mgLS
	aj1Upk6mwItDWZ63JlWtz7P9hHKMBdvukQ11LzNvg3OkRApyaAkNPgKvVjozucAgUV64JsnMSLm
	7YpW49V2oAqRgj5g90B49+sJKlNXmMsRZP1O3OmQLtvn15vJfSUGiF4wykbLhFbd2QrrGZaRrDE
	/uhynOnFedGaEiw==
X-Google-Smtp-Source: AGHT+IGFZPAT0kHC3BGKnrQivfKI9s04TeiLH9YTKILncNYseYqOotHyhPpnjK2DmpS6MSuaSilbUw==
X-Received: by 2002:a05:6214:250e:b0:6e8:f3c3:9806 with SMTP id 6a1803df08f44-6e9005bc9camr276668786d6.4.1741731017866;
        Tue, 11 Mar 2025 15:10:17 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8f716ee35sm76607796d6.96.2025.03.11.15.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 15:10:17 -0700 (PDT)
Date: Tue, 11 Mar 2025 18:10:16 -0400
Message-ID: <005f7425114b4e6b82dacdaf4dd37777@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250311_1754/pstg-lib:20250311_1754/pstg-pwork:20250311_1754
From: Paul Moore <paul@paul-moore.com>
To: Jasjiv Singh <jasjivsingh@linux.microsoft.com>, corbet@lwn.net, jmorris@namei.org, serge@hallyn.com, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org, audit@vger.kernel.org, linux-kernel@vger.kernel.org, Jasjiv Singh <jasjivsingh@linux.microsoft.com>
Subject: Re: [PATCH RFC v4 1/1] ipe: add errno field to IPE policy load  auditing
References: <1741385035-22090-2-git-send-email-jasjivsingh@linux.microsoft.com>
In-Reply-To: <1741385035-22090-2-git-send-email-jasjivsingh@linux.microsoft.com>

On Mar  7, 2025 Jasjiv Singh <jasjivsingh@linux.microsoft.com> wrote:
> 
> Users of IPE require a way to identify when and why an operation fails,
> allowing them to both respond to violations of policy and be notified
> of potentially malicious actions on their systems with respect to IPE.
> 
> This patch introduces a new error field to the AUDIT_IPE_POLICY_LOAD event
> to log policy loading failures. Currently, IPE only logs successful policy
> loads, but not failures. Tracking failures is crucial to detect malicious
> attempts and ensure a complete audit trail for security events.
> 
> The new error field will capture the following error codes:
> 
> * -ENOKEY: Key used to sign the IPE policy not found in the keyring
> * -ESTALE: Attempting to update an IPE policy with an older version
> * -EKEYREJECTED: IPE signature verification failed
> * -ENOENT: Policy was deleted while updating
> * -EEXIST: Same name policy already deployed
> * -ERANGE: Policy version number overflow
> * -EINVAL: Policy version parsing error
> * -EPERM: Insufficient permission
> * -ENOMEM: Out of memory (OOM)
> * -EBADMSG: Policy is invalid
> 
> Here are some examples of the updated audit record types:
> 
> AUDIT_IPE_POLICY_LOAD(1422):
> audit:  AUDIT1422 policy_name="Test_Policy" policy_version=0.0.1
> policy_digest=sha256:84EFBA8FA71E62AE0A537FAB962F8A2BD1053964C4299DCA
> 92BFFF4DB82E86D3 auid=1000 ses=3 lsm=ipe res=1 errno=0
> 
> The above record shows a new policy has been successfully loaded into
> the kernel with the policy name, version, and hash with the errno=0.
> 
> AUDIT_IPE_POLICY_LOAD(1422) with error:
> 
> audit: AUDIT1422 policy_name=? policy_version=? policy_digest=?
> auid=1000 ses=3 lsm=ipe res=0 errno=-74
> 
> The above record shows a policy load failure due to an invalid policy
> (-EBADMSG).
> 
> Signed-off-by: Jasjiv Singh <jasjivsingh@linux.microsoft.com>
> ---
>  Documentation/admin-guide/LSM/ipe.rst | 69 +++++++++++++++++++--------
>  security/ipe/audit.c                  | 21 ++++++--
>  security/ipe/fs.c                     | 19 ++++++--
>  security/ipe/policy.c                 | 11 ++++-
>  security/ipe/policy_fs.c              | 29 ++++++++---
>  5 files changed, 111 insertions(+), 38 deletions(-)

...

> diff --git a/security/ipe/audit.c b/security/ipe/audit.c
> index f05f0caa4850..ac9d68b68b8b 100644
> --- a/security/ipe/audit.c
> +++ b/security/ipe/audit.c
> @@ -21,6 +21,8 @@
>  
>  #define AUDIT_POLICY_LOAD_FMT "policy_name=\"%s\" policy_version=%hu.%hu.%hu "\
>  			      "policy_digest=" IPE_AUDIT_HASH_ALG ":"
> +#define AUDIT_POLICY_LOAD_FAIL_FMT "policy_name=? policy_version=? "\
> +				   "policy_digest=?"

This should probably be AUDIT_POLICY_LOAD_NULL_FMT to be consistent with
the other IPE audit format macros, e.g. AUDIT_OLD_ACTIVE_POLICY_NULL_FMT.

> diff --git a/security/ipe/fs.c b/security/ipe/fs.c
> index 5b6d19fb844a..db18636470bf 100644
> --- a/security/ipe/fs.c
> +++ b/security/ipe/fs.c
> @@ -133,6 +133,8 @@ static ssize_t getenforce(struct file *f, char __user *data,
>   * * %-ERANGE			- Policy version number overflow
>   * * %-EINVAL			- Policy version parsing error
>   * * %-EEXIST			- Same name policy already deployed
> + * * %-ENOKEY			- Key used to sign the IPE policy not found in the keyring
> + * * %-EKEYREJECTED		- IPE signature verification failed
>   */
>  static ssize_t new_policy(struct file *f, const char __user *data,
>  			  size_t len, loff_t *offset)
> @@ -141,12 +143,17 @@ static ssize_t new_policy(struct file *f, const char __user *data,
>  	char *copy = NULL;
>  	int rc = 0;
>  
> -	if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN))
> -		return -EPERM;
> +	if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN)) {
> +		rc = -EPERM;
> +		goto out;
> +	}
>  
>  	copy = memdup_user_nul(data, len);
> -	if (IS_ERR(copy))
> -		return PTR_ERR(copy);
> +	if (IS_ERR(copy)) {
> +		rc = PTR_ERR(copy);
> +		copy = NULL;
> +		goto out;
> +	}
>  
>  	p = ipe_new_policy(NULL, 0, copy, len);
>  	if (IS_ERR(p)) {
> @@ -161,8 +168,10 @@ static ssize_t new_policy(struct file *f, const char __user *data,
>  	ipe_audit_policy_load(p);
>  
>  out:
> -	if (rc < 0)
> +	if (rc < 0) {
>  		ipe_free_policy(p);
> +		ipe_audit_policy_load(ERR_PTR(rc));
> +	}
>  	kfree(copy);
>  	return (rc < 0) ? rc : len;
>  }

I'm going to suggest putting the audit calls closer together to help
ease maintainence, e.g.:

  out:
    if (rc) {
	    ipe_audit_policy_load(ERR_PTR(rc));
	    ipe_free_policy(p);
    } else
	    ipe_audit_policy_load(p);

> diff --git a/security/ipe/policy_fs.c b/security/ipe/policy_fs.c
> index 3bcd8cbd09df..b70d2518b182 100644
> --- a/security/ipe/policy_fs.c
> +++ b/security/ipe/policy_fs.c
> @@ -292,21 +299,29 @@ static ssize_t update_policy(struct file *f, const char __user *data,
>  	char *copy = NULL;
>  	int rc = 0;
>  
> -	if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN))
> -		return -EPERM;
> +	if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN)) {
> +		rc = -EPERM;
> +		goto out;
> +	}
>  
>  	copy = memdup_user(data, len);
> -	if (IS_ERR(copy))
> -		return PTR_ERR(copy);
> +	if (IS_ERR(copy)) {
> +		rc = PTR_ERR(copy);
> +		copy = NULL;
> +		goto out;
> +	}
>  
>  	root = d_inode(f->f_path.dentry->d_parent);
>  	inode_lock(root);
>  	rc = ipe_update_policy(root, NULL, 0, copy, len);
>  	inode_unlock(root);
>  
> +out:
>  	kfree(copy);
> -	if (rc)
> +	if (rc) {
> +		ipe_audit_policy_load(ERR_PTR(rc));
>  		return rc;
> +	}
>  
>  	return len;
>  }

I don't really like how your auditing failure in one function and
success in a different function, that looks fragile.  Unfortunately,
I don't see a quick/easy fix for that right now so I guess this is
okay, but something to keep in mind for the future.

--
paul-moore.com

