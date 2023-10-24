Return-Path: <linux-doc+bounces-893-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A02C7D4631
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 05:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E351B20F81
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 03:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470EF79D9;
	Tue, 24 Oct 2023 03:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VH9QwKYR"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7460779EF
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 03:52:32 +0000 (UTC)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC6A10A
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:30 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-66cee0d62fbso29202936d6.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698119549; x=1698724349; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9D20GBuYY3uJJiQrbUxHHBPEASCxtbko8RJ2E48OU8Y=;
        b=VH9QwKYRmk6eU8dQU07efSTkyTcT8b16XU5vSDej7YATeRQE7005fkvcH+hQBmM3W2
         VYVAnHG7gl7n30wKJGlqmf0TbSxqXOOoORozJyoPKIcEFWRF7se0GRFmTsZfedu39br9
         bxez2thEnH3wbmocRlKeOcc8b+8r2NatMwYRVqDOQx/VR+y6KIfQLZejXdebzxdIiw0+
         D4p6oF1+6sbWA6/FuFNkWknYNvauig01Nl6OCSbNzxGhbrBrs+vQlfUJWdTQrVu+HmZF
         fibgjXkSTVNwA3R1/XYwlUYYURwTiKfJL2Akh/98Nw7UEqWsJ+LrvowUSmAUbaJsmU4A
         bUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698119549; x=1698724349;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9D20GBuYY3uJJiQrbUxHHBPEASCxtbko8RJ2E48OU8Y=;
        b=PEIsnpTS/UeN7S0axiuHXnfaJzQ9EbOJvHaS8Oyl3tYRURaIWdIMqr9gI55hCrEU+v
         uS+iNLEzJfbzzz6eBy9nQI3cfVdgYOJarfwi+vOmxIdRkadMcJGSpzil2/xI/MITpb0n
         Sok55xSYQjbpr2ijh6DPxh38gHpN934L3tdBtcUAoZ80cvPYxHgBPGFGacPviRaBktbq
         CuYGJfYguo+1StBP8OCnbE333jsQVLdMc/iSs83P23/Nrn4R8rTs8kDtNFiDb/Nwt5M8
         3Z0Knx3uaGVYlWB+/uzYbbAfxoQuOVDe8Y913eU5unU/d0eZHQzZPn2L7NqBCGFzpuuC
         jo9g==
X-Gm-Message-State: AOJu0Ywgii96QOpSD7IXhCrkS4BBc16bJp2HJRCXP5ya2eAWv+oFV2vI
	38eEYdJuUeXn1yXhE1ZLu481
X-Google-Smtp-Source: AGHT+IFpIqqh1fB4hnxmAOL2NoddL/lzIp7ju14Dk5onQmmR8wOSeU2mbOH9yH4fSAzqdyjSPcWQFA==
X-Received: by 2002:ad4:5bcd:0:b0:65b:896:a5bb with SMTP id t13-20020ad45bcd000000b0065b0896a5bbmr13586438qvt.34.1698119549271;
        Mon, 23 Oct 2023 20:52:29 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id c15-20020a0cd60f000000b00658266be23fsm3330187qvj.41.2023.10.23.20.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 20:52:28 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:52:28 -0400
Message-ID: <1ef52e983dd5b9a7759dc76bfe156804.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com, linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>, Fan Wu <wufan@linux.microsoft.com>
Subject: Re: [PATCH RFC v11 9/19] ipe: add permissive toggle
References: <1696457386-3010-10-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-10-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
> 
> IPE, like SELinux, supports a permissive mode. This mode allows policy
> authors to test and evaluate IPE policy without it effecting their
> programs. When the mode is changed, a 1404 AUDIT_MAC_STATUS
> be reported.
> 
> This patch adds the following audit records:
> 
>     audit: MAC_STATUS enforcing=0 old_enforcing=1 auid=4294967295
>       ses=4294967295 enabled=1 old-enabled=1 lsm=ipe res=1
>     audit: MAC_STATUS enforcing=1 old_enforcing=0 auid=4294967295
>       ses=4294967295 enabled=1 old-enabled=1 lsm=ipe res=1
> 
> The audit record only emit when the value from the user input is
> different from the current enforce value.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ---
> v2:
>   + Split evaluation loop, access control hooks,
>     and evaluation loop from policy parser and userspace
>     interface to pass mailing list character limit
> 
> v3:
>   + Move ipe_load_properties to patch 04.
>   + Remove useless 0-initializations
>   + Prefix extern variables with ipe_
>   + Remove kernel module parameters, as these are
>     exposed through sysctls.
>   + Add more prose to the IPE base config option
>     help text.
>   + Use GFP_KERNEL for audit_log_start.
>   + Remove unnecessary caching system.
>   + Remove comments from headers
>   + Use rcu_access_pointer for rcu-pointer null check
>   + Remove usage of reqprot; use prot only.
>   + Move policy load and activation audit event to 03/12
> 
> v4:
>   + Remove sysctls in favor of securityfs nodes
>   + Re-add kernel module parameters, as these are now
>     exposed through securityfs.
>   + Refactor property audit loop to a separate function.
> 
> v5:
>   + fix minor grammatical errors
>   + do not group rule by curly-brace in audit record,
>     reconstruct the exact rule.
> 
> v6:
>   + No changes
> 
> v7:
>   + Further split lsm creation into a separate commit from the
>     evaluation loop and audit system, for easier review.
>   + Propagating changes to support the new ipe_context structure in the
>     evaluation loop.
>   + Split out permissive functionality into a separate patch for easier
>     review.
>   + Remove permissive switch compile-time configuration option - this
>     is trivial to add later.
> 
> v8:
>   + Remove "IPE" prefix from permissive audit record
>   + align fields to the linux-audit field dictionary. This causes the
>     following fields to change:
>       enforce -> permissive
> 
>   + Remove duplicated information correlated with syscall record, that
>     will always be present in the audit event.
>   + Change audit types:
>     + AUDIT_TRUST_STATUS -> AUDIT_MAC_STATUS
>       + There is no significant difference in meaning between
>         these types.
> 
> v9:
>   + Clean up ipe_context related code
> 
> v10:
>   + Change audit format to comform with the existing format selinux is
>     using
>   + Remove the audit record emission during init to align with selinux,
>     which does not perform this action.
> 
> v11:
>   + Remove redundant code
> ---
>  security/ipe/audit.c | 22 ++++++++++++++
>  security/ipe/audit.h |  1 +
>  security/ipe/eval.c  | 14 +++++++--
>  security/ipe/eval.h  |  1 +
>  security/ipe/fs.c    | 68 ++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 104 insertions(+), 2 deletions(-)

...

> diff --git a/security/ipe/eval.c b/security/ipe/eval.c
> index 499b6b3338f2..78c54ff1fdd3 100644
> --- a/security/ipe/eval.c
> +++ b/security/ipe/eval.c
> @@ -167,9 +172,12 @@ int ipe_evaluate_event(const struct ipe_eval_ctx *const ctx)
>  	ipe_audit_match(ctx, match_type, action, rule);
>  
>  	if (action == IPE_ACTION_DENY)
> -		return -EACCES;
> +		rc = -EACCES;
> +
> +	if (!enforcing)
> +		rc = 0;

Why the local @enforcing variable?  Why not:

  if (!READ_ONCE(enforce))
    rc = 0;

> -	return 0;
> +	return rc;
>  }
>  
>  /**
> @@ -198,3 +206,5 @@ void ipe_invalidate_pinned_sb(const struct super_block *mnt_sb)
>  
>  module_param(success_audit, bool, 0400);
>  MODULE_PARM_DESC(success_audit, "Start IPE with success auditing enabled");
> +module_param(enforce, bool, 0400);
> +MODULE_PARM_DESC(enforce, "Start IPE in enforce or permissive mode");

"enforcing"

--
paul-moore.com

