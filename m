Return-Path: <linux-doc+bounces-8350-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957D848949
	for <lists+linux-doc@lfdr.de>; Sat,  3 Feb 2024 23:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50CC6284A33
	for <lists+linux-doc@lfdr.de>; Sat,  3 Feb 2024 22:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B0B5F47B;
	Sat,  3 Feb 2024 22:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Tpy16NWI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F117748
	for <linux-doc@vger.kernel.org>; Sat,  3 Feb 2024 22:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706999120; cv=none; b=cFEFTc4wM5G5MR7SAP78xWUKaj1IHUx2eG/i8AuaFkEOtSRLyikRwbS3uK/xiw6RRN1f8wReoSw7C8zr5j6JNO0BEtteTGwG4o4wVWDVXZpk5wbVOM555gJ0ryGQEElCb4SProLkMGGgZdCQ5nUfQqfhiolycEY9/UbENEyt3Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706999120; c=relaxed/simple;
	bh=Mgd0u5tkUKnC3XiMM2wsuztMqfdG+aVuxVigaiQxwoA=;
	h=Date:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 From:To:Cc:Subject:References:In-Reply-To; b=rjOZAclqZ4UzorPxc3juDxQfWXtIfUWYeUS/zLcVwCBjw8Jjx6jLwSq+UFYdKec4NYZ08oTJQbwGADgUu/hmwu1t0Gwev7AYsbRjUQBLG/zh2BkKkA7KrVsAl36JZFmum/2Wd9XSQo4d+ZQYilqEjm6L4Xr1z3+0AEJbeYmBAH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Tpy16NWI; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-59a45d8ec91so1295227eaf.3
        for <linux-doc@vger.kernel.org>; Sat, 03 Feb 2024 14:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1706999114; x=1707603914; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qFFaUGbOsQ16jf+HNvToc8VuaSYvDv+YsUz/HxsHr8o=;
        b=Tpy16NWIFmxBPpSxw9tb4RQvNl6Sw9mtbhIwJ9kKcPxYguuvfVpM8Wm3USiWv+bo0P
         giC6u9cZsNoVL5I/SB/QQ7qTXN+OfUiyVFf1E5sBwEE1pNJakKl+Wa0H+6o6pyQasJK/
         86rQ3nZqLI9gyp+HliFmtGLpZp494Bw9SSjcAwWQvan5VIAbMuALPYMK4RffFXPQUWCy
         TTPagesUK2Vzk8iNRT42awJpsOiMCkpRLRLcrU5vQa90KKrI5kfVPwAqdGKj7gLw027k
         RVT4/ZvZnZtk6YnaUaZAdY4qG+QTRzhB5B3iIxgTZF68uhXJzNSdcdkycPBK9LF1mqJX
         aWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706999114; x=1707603914;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-disposition:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFFaUGbOsQ16jf+HNvToc8VuaSYvDv+YsUz/HxsHr8o=;
        b=MNCSHn0pZG4i9A52ZheNiPlilbDixTWKOKIlJ7Kl3IfZ7UJcBNoanpYyqe5lzZaBXd
         mx6FH0X+0nbvEFL+nztDOLgYxu+I/Hs8U3DlqpsIFMq9QJ+cUyvsmm3FGEDufND0GkGT
         ATJxl2yZTxOZF2CwRAjVWc1hT/N8PeDwqV6bfsg/mFP+bp7SWY5u+SuqesZrcy3ajLaD
         IIwPLWLDePflV0j9ooZeUd1WipMl5YesL2mPGF5BfTKsQTC7zwqUyllj9uOiTkdDKCA5
         6Z1huM8nThqkD0w2Nb/EwUF8PForVl4JpHgoorPCwK8TiV/nJAJ1WODync6U1BNbZmas
         7mPw==
X-Gm-Message-State: AOJu0YxaC5WlqRCGcNWcC1Wiv+FM0MqGUeMQAEvGKjGGHUm4IgukqQDO
	wqgwebg9YnNdV79FRtslA+i3oe0HBuzyPxhimGQSqgDpO5kOo4czPdGgthVn8w==
X-Google-Smtp-Source: AGHT+IGibUxIAlfdTw0D137+/Rjp2BMWHq+IIdkOBDUg96gKU55ljncPPbo5+Pfo7zHqH7ErAWGh9Q==
X-Received: by 2002:a05:6358:27a6:b0:176:8263:9a71 with SMTP id l38-20020a05635827a600b0017682639a71mr14634327rwb.13.1706999114397;
        Sat, 03 Feb 2024 14:25:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVlGEsKMF3Jc8mYvIXVcUJhYiq8OC51LGduNT/nJdwuRMr+6T3ph4HayYERVnLHHB+8lImr/GAtqkSA7qlUM43GJqNC4o7zd/Hb/YG0KuDoYyUZu4iRkl0z3eQ1MM9lefCAtIGXlG2P5WSLMWRWr5K7hMUMDvNJmg+TRf2sKLxQeuIdWxJgRY7DIAeJylRuEiSYYmzpO5NG5EgH0MMAVg0Z3eYuhjCvwVDTsGMHtwK+/vEbE9E2Zody29XwAxl3lz6+BkagLPx7K6etm7pqzpnCbhiJhGopgqp7c3+/ylFUf0agoao/Nf/xAIUTNdvjxOJDNNFdIOtFw+o/y2rZxOgyyIfswKBclu+fjAiIAkFfDwwA33qOZFwdtBwDQqf15BptGQFpFAdYDGhg1Z/BgvghmRGSA53G2TtU9Pibjm/5xEFyWm3JeHxfj1Elrq5/8cEqq4xA5zSgjZnK8GL0CaoCxMTx1naa0eZtdmBnWp4N/a1iRTgINECVBHJeZ21MsHUEKK61khOwUDE4NmT/5Awqqm2uO3wF9fU6iIqwmi4bIsHF/dPlouD41zOG2I2ioBq/nVsIPBPvUjIMK1qKS5pkjQB2wVGYNlrOv3hpvgsQo/3T1Bqsm/zD
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id lb24-20020a056214319800b0068c926dd11asm947381qvb.43.2024.02.03.14.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 14:25:13 -0800 (PST)
Date: Sat, 03 Feb 2024 17:25:13 -0500
Message-ID: <6ac3cca9d1d3505f3ed9c7196512f2db@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=utf-8 
Content-Disposition: inline 
Content-Transfer-Encoding: 8bit
From: Paul Moore <paul@paul-moore.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@lists.linux.dev, audit@vger.kernel.org, linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>, Fan Wu <wufan@linux.microsoft.com>
Subject: Re: [PATCH RFC v12 15/20] ipe: add support for dm-verity as a trust  provider
References: <1706654228-17180-16-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1706654228-17180-16-git-send-email-wufan@linux.microsoft.com>

On Jan 30, 2024 Fan Wu <wufan@linux.microsoft.com> wrote:
> 
> Allows author of IPE policy to indicate trust for a singular dm-verity
> volume, identified by roothash, through "dmverity_roothash" and all
> signed dm-verity volumes, through "dmverity_signature".
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
> 
> v8:
>   + Undo squash of 08/12, 10/12 - separating drivers/md/ from security/
>     & block/
>   + Use common-audit function for dmverity_signature.
>   + Change implementation for storing the dm-verity digest to use the
>     newly introduced dm_verity_digest structure introduced in patch
>     14/20.
> 
> v9:
>   + Adapt to the new parser
> 
> v10:
>   + Select the Kconfig when all dependencies are enabled
> 
> v11:
>   + No changes
> 
> v12:
>   + Refactor to use struct digest_info* instead of void*
>   + Correct audit format
> ---
>  security/ipe/Kconfig         |  18 ++++++
>  security/ipe/Makefile        |   1 +
>  security/ipe/audit.c         |  37 ++++++++++-
>  security/ipe/digest.c        | 120 +++++++++++++++++++++++++++++++++++
>  security/ipe/digest.h        |  26 ++++++++
>  security/ipe/eval.c          |  90 +++++++++++++++++++++++++-
>  security/ipe/eval.h          |  10 +++
>  security/ipe/hooks.c         |  67 +++++++++++++++++++
>  security/ipe/hooks.h         |   8 +++
>  security/ipe/ipe.c           |  15 +++++
>  security/ipe/ipe.h           |   4 ++
>  security/ipe/policy.h        |   3 +
>  security/ipe/policy_parser.c |  26 +++++++-
>  13 files changed, 421 insertions(+), 4 deletions(-)
>  create mode 100644 security/ipe/digest.c
>  create mode 100644 security/ipe/digest.h
> 
> diff --git a/security/ipe/Kconfig b/security/ipe/Kconfig
> index ac4d558e69d5..7afb1ce0cb99 100644
> --- a/security/ipe/Kconfig
> +++ b/security/ipe/Kconfig
> @@ -8,6 +8,7 @@ menuconfig SECURITY_IPE
>  	depends on SECURITY && SECURITYFS && AUDIT && AUDITSYSCALL
>  	select PKCS7_MESSAGE_PARSER
>  	select SYSTEM_DATA_VERIFICATION
> +	select IPE_PROP_DM_VERITY if DM_VERITY && DM_VERITY_VERIFY_ROOTHASH_SIG
>  	help
>  	  This option enables the Integrity Policy Enforcement LSM
>  	  allowing users to define a policy to enforce a trust-based access
> @@ -15,3 +16,20 @@ menuconfig SECURITY_IPE
>  	  admins to reconfigure trust requirements on the fly.
>  
>  	  If unsure, answer N.
> +
> +if SECURITY_IPE
> +menu "IPE Trust Providers"
> +
> +config IPE_PROP_DM_VERITY
> +	bool "Enable support for dm-verity volumes"
> +	depends on DM_VERITY && DM_VERITY_VERIFY_ROOTHASH_SIG
> +	help
> +	  This option enables the properties 'dmverity_signature' and
> +	  'dmverity_roothash' in IPE policy. These properties evaluates
> +	  to TRUE when a file is evaluated against a dm-verity volume
> +	  that was mounted with a signed root-hash or the volume's
> +	  root hash matches the supplied value in the policy.
> +
> +endmenu
> +
> +endif
> diff --git a/security/ipe/Makefile b/security/ipe/Makefile
> index 2279eaa3cea3..66de53687d11 100644
> --- a/security/ipe/Makefile
> +++ b/security/ipe/Makefile
> @@ -6,6 +6,7 @@
>  #
>  
>  obj-$(CONFIG_SECURITY_IPE) += \
> +	digest.o \
>  	eval.o \
>  	hooks.o \
>  	fs.o \
> diff --git a/security/ipe/audit.c b/security/ipe/audit.c
> index ed390d32c641..a4ad8e888df0 100644
> --- a/security/ipe/audit.c
> +++ b/security/ipe/audit.c
> @@ -13,6 +13,7 @@
>  #include "hooks.h"
>  #include "policy.h"
>  #include "audit.h"
> +#include "digest.h"
>  
>  #define ACTSTR(x) ((x) == IPE_ACTION_ALLOW ? "ALLOW" : "DENY")
>  
> @@ -54,8 +55,30 @@ static const char *const audit_prop_names[__IPE_PROP_MAX] = {
>  	"boot_verified=FALSE",
>  	"boot_verified=TRUE",
>  #endif /* CONFIG_BLK_DEV_INITRD */
> +#ifdef CONFIG_IPE_PROP_DM_VERITY
> +	"dmverity_roothash=",
> +	"dmverity_signature=FALSE",
> +	"dmverity_signature=TRUE",
> +#endif /* CONFIG_IPE_PROP_DM_VERITY */
>  };
>  
> +#ifdef CONFIG_IPE_PROP_DM_VERITY
> +/**
> + * audit_dmv_roothash - audit a roothash of a dmverity volume.
> + * @ab: Supplies a pointer to the audit_buffer to append to.
> + * @rh: Supplies a pointer to the digest structure.
> + */
> +static void audit_dmv_roothash(struct audit_buffer *ab, const void *rh)
> +{
> +	audit_log_format(ab, "%s", audit_prop_names[IPE_PROP_DMV_ROOTHASH]);
> +	ipe_digest_audit(ab, rh);
> +}
> +#else
> +static void audit_dmv_roothash(struct audit_buffer *ab, const void *rh)
> +{
> +}
> +#endif /* CONFIG_IPE_PROP_DM_VERITY */

I talked about this back in my review of the v11 patchset and I'm
guessing you may have missed it ... the problem with the above code is
that the fields in an audit record should remain constant, even if
there is no data for that particular field.  In cases where there is no
data to record for a given field, a "?" should be used as the field's
value, for example:

  dmverify_roothash=?

My guess is that you would want to do something like this:

  #else  /* !CONFIG_IPE_PROP_DM_VERITY */
  static void audit_dmv_roothash(...)
  {
    audit_log_format(ab, "%s=?", audit_prop_names[...]);
  }
  #endif /* CONFIG_IPE_PROP_DM_VERITY */

--
paul-moore.com

