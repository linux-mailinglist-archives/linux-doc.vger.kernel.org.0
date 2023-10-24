Return-Path: <linux-doc+bounces-899-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1547D4643
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 05:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31E8928184E
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 03:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC907468;
	Tue, 24 Oct 2023 03:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="NOsjfUsi"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA6079D9
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 03:52:39 +0000 (UTC)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927F610EB
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:36 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d122e0c85so25462186d6.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698119555; x=1698724355; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=55ZRJ15k5rlJjmFui052IxveaRjJKA9VJGl0uzNotB8=;
        b=NOsjfUsiwJ6iZkl1CzbXPwvgzAEyZ3ahiAQdcJtdRzTg1KxCLIflQ32IHGJXELMhe5
         XYZf6o62nBC47jGKfMuZhXz0tFU239x9gsK2mBXcfdav0bjk+8I5c+GYS1hYNieD0Cz+
         zpatyfzG0HJIRkkMc+BJAPtiG0N+2G1oWAnQ33ujxNuvs5QGupUEirFdGtFE7zJA5nwa
         fxgjJsU9y5d9HAAcnGSWHyjdv4A2FAqwC+h5Hz2z7gIG80oeDnprAdkDTZpl1pgEufGj
         cjObeC16eeFfiC6/mXIaWl1BUmjoVswgU5kOFiAANUcwpw2JSTd5cEGjqU1IXitMBtVS
         tNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698119555; x=1698724355;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55ZRJ15k5rlJjmFui052IxveaRjJKA9VJGl0uzNotB8=;
        b=sBzr7PqpA7PbEGoBxzbMiHYat8zO9XxrUkDvxwOwAew5six3kMoMdI5zb5OcyXIaOe
         62VrzE2luNmoRTuEyCnR/2c6/EJclfAbk66DWnpxYjKKx8Y17nENJELCv/9jqsR1zHdf
         ffjqouQOmmkaMR+/tniRRa3EQFl/n8C8cl0t4xM3IqzV7cx2dPcTCraZA3Y+YFuQiUP3
         L1yQlhFcpVHwkruUcVazWb0P2r1OEdj4IiRb3+XjzTGjKy0smL6KAWpHANieGUnqHMtp
         Osy3xdnAs2XLWKLV98V5O6QE5SNJ1VH4lq8IKfPqCbGRsDTg9+2UD2RFll3g/RAj/xXc
         ur9A==
X-Gm-Message-State: AOJu0YxAihDdaOGEUh7T0w1SCHxUi+U9RyjyDCPhtlddHU+/Xd0heYN6
	enaUB2NaQxPEwGENK/EAFVdP
X-Google-Smtp-Source: AGHT+IFhehT5SBIN3u4k21hQKcqd9tt3cVRe5RSL6o1ZuOBt7dfMcEzUGFp3iEoi8dzbbuQJKBLFmg==
X-Received: by 2002:a05:6214:626:b0:66d:5dec:6099 with SMTP id a6-20020a056214062600b0066d5dec6099mr11383093qvx.41.1698119555528;
        Mon, 23 Oct 2023 20:52:35 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id ee3-20020a0562140a4300b0065b260eafd9sm3357598qvb.87.2023.10.23.20.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 20:52:34 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:52:34 -0400
Message-ID: <c2a88a9292a6ce1e301ec2244657f385.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com, linux-kernel@vger.kernel.org, Fan Wu <wufan@linux.microsoft.com>, Deven Bowers <deven.desai@linux.microsoft.com>
Subject: Re: [PATCH RFC v11 16/19] ipe: enable support for fs-verity as a trust  provider
References: <1696457386-3010-17-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-17-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
> 
> Enable IPE policy authors to indicate trust for a singular fsverity
> file, identified by the digest information, through "fsverity_digest"
> and all files using fsverity's builtin signatures via
> "fsverity_signature".
> 
> This enables file-level integrity claims to be expressed in IPE,
> allowing individual files to be authorized, giving some flexibility
> for policy authors. Such file-level claims are important to be expressed
> for enforcing the integrity of packages, as well as address some of the
> scalability issues in a sole dm-verity based solution (# of loop back
> devices, etc).
> 
> This solution cannot be done in userspace as the minimum threat that
> IPE should mitigate is an attacker downloads malicious payload with
> all required dependencies. These dependencies can lack the userspace
> check, bypassing the protection entirely. A similar attack succeeds if
> the userspace component is replaced with a version that does not
> perform the check. As a result, this can only be done in the common
> entry point - the kernel.
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
>   * Undo squash of 08/12, 10/12 - separating drivers/md/ from security/
>   * Use common-audit function for fsverity_signature.
>   + Change fsverity implementation to use fsverity_get_digest
>   + prevent unnecessary copy of fs-verity signature data, instead
>     just check for presence of signature data.
>   + Remove free_inode_security hook, as the digest is now acquired
>     at runtime instead of via LSM blob.
> 
> v9:
>   + Adapt to the new parser
> 
> v10:
>   + Update the fsverity get digest call
> 
> v11:
>   + No changes
> ---
>  security/ipe/Kconfig         |  13 +++++
>  security/ipe/audit.c         |  23 ++++++++
>  security/ipe/eval.c          | 110 +++++++++++++++++++++++++++++++++++
>  security/ipe/eval.h          |  10 ++++
>  security/ipe/hooks.c         |  30 ++++++++++
>  security/ipe/hooks.h         |   7 +++
>  security/ipe/ipe.c           |  13 +++++
>  security/ipe/ipe.h           |   3 +
>  security/ipe/policy.h        |   3 +
>  security/ipe/policy_parser.c |   8 +++
>  10 files changed, 220 insertions(+)

...

> diff --git a/security/ipe/audit.c b/security/ipe/audit.c
> index b5c58655ac74..e3a8552a76a4 100644
> --- a/security/ipe/audit.c
> +++ b/security/ipe/audit.c
> @@ -79,6 +100,8 @@ static void audit_rule(struct audit_buffer *ab, const struct ipe_rule *r)
>  		audit_log_format(ab, "%s", audit_prop_names[ptr->type]);
>  		if (ptr->type == IPE_PROP_DMV_ROOTHASH)
>  			audit_dmv_roothash(ab, ptr->value);
> +		if (ptr->type == IPE_PROP_FSV_DIGEST)
> +			audit_fsv_digest(ab, ptr->value);

My comments on audit_dmv_roothash() also apply here.

>  		audit_log_format(ab, " ");
>  	}
> diff --git a/security/ipe/eval.c b/security/ipe/eval.c
> index 82ad48d7aa3d..f0194b0ca2ff 100644
> --- a/security/ipe/eval.c
> +++ b/security/ipe/eval.c
> @@ -172,6 +191,91 @@ static bool evaluate_dmv_sig_true(const struct ipe_eval_ctx *const ctx,
>  }
>  #endif /* CONFIG_IPE_PROP_DM_VERITY */
>  
> +#ifdef CONFIG_IPE_PROP_FS_VERITY
> +/**
> + * evaluate_fsv_digest - Analyze @ctx against a fsv digest property.
> + * @ctx: Supplies a pointer to the context being evaluated.
> + * @p: Supplies a pointer to the property being evaluated.
> + *
> + * Return:
> + * * true	- The current @ctx match the @p
> + * * false	- The current @ctx doesn't match the @p
> + */
> +static bool evaluate_fsv_digest(const struct ipe_eval_ctx *const ctx,
> +				struct ipe_prop *p)
> +{
> +	enum hash_algo alg;
> +	u8 digest[FS_VERITY_MAX_DIGEST_SIZE];
> +
> +	if (!ctx->ino)
> +		return false;
> +	if (!fsverity_get_digest((struct inode *)ctx->ino,
> +				 digest,
> +				 NULL,
> +				 &alg))
> +		return false;
> +
> +	return ipe_digest_eval(p->value,
> +			       digest,
> +			       hash_digest_size[alg],
> +			       hash_algo_name[alg]);
> +}
> +
> +/**
> + * evaluate_fsv_sig_false - Analyze @ctx against a fsv sig false property.
> + * @ctx: Supplies a pointer to the context being evaluated.
> + * @p: Supplies a pointer to the property being evaluated.
> + *
> + * Return:
> + * * true	- The current @ctx match the @p
> + * * false	- The current @ctx doesn't match the @p
> + */
> +static bool evaluate_fsv_sig_false(const struct ipe_eval_ctx *const ctx,
> +				   struct ipe_prop *p)
> +{
> +	return !ctx->ino ||
> +	       !IS_VERITY(ctx->ino) ||
> +	       !ctx->ipe_inode ||
> +	       !ctx->ipe_inode->fs_verity_signed;
> +}
> +
> +/**
> + * evaluate_fsv_sig_true - Analyze @ctx against a fsv sig true property.
> + * @ctx: Supplies a pointer to the context being evaluated.
> + * @p: Supplies a pointer to the property being evaluated.
> + *
> + * Return:
> + * * true - The current @ctx match the @p
> + * * false - The current @ctx doesn't match the @p
> + */
> +static bool evaluate_fsv_sig_true(const struct ipe_eval_ctx *const ctx,
> +				  struct ipe_prop *p)
> +{
> +	return ctx->ino &&
> +	       IS_VERITY(ctx->ino) &&
> +	       ctx->ipe_inode &&
> +	       ctx->ipe_inode->fs_verity_signed;
> +}

See my previous comments about the false/true functions.

> +#else

--
paul-moore.com

