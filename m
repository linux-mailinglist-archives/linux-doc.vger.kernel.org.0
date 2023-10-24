Return-Path: <linux-doc+bounces-900-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A88A7D464C
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 05:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FADEB20EC5
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 03:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7512879D6;
	Tue, 24 Oct 2023 03:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bwsnazR6"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46140748D
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 03:52:40 +0000 (UTC)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F351718
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:37 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7781b176131so210352785a.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698119556; x=1698724356; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rmddIeGleB+CvcksXIlwUEw0FkwTQo8xqUcvDqbnLkY=;
        b=bwsnazR6ZZuMwadnjERsh/NRnerpmP1Ec6vOkf/ySCmP5i8DEO0UptP0I/LLzU5T3+
         x1kPSjZGsXyNwA061wBem1iZiloGh3A8niXMkTnRbfjozpezswvP5/PqxyBSHRj4o2WC
         36MqS1SlWG/XlkdbT7I4GThRkxp9q44TEO9myX3Vcl1NfejNWTlDVL/K0IMjqNrLM3X6
         8KWlcW5IN1C91m2ah5qji5G8Gca1EfRArip/Zey6w9gFGLm6ngIc+B+WKPZsRPLh2WWR
         c6bWEGq5AD2Xi/fRDYvM/HKx4CBFFk1wFEtfQkXy9p2z7Lm58jUklbQGDz8vjtJEYpEi
         j0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698119556; x=1698724356;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmddIeGleB+CvcksXIlwUEw0FkwTQo8xqUcvDqbnLkY=;
        b=Wy3MYclYHVH0Nnj7evVMuM+ouZpL7AFKSB8KtbLyKx02Py2UyFmKJBV25AwZPkn2Oe
         VwVqY7rVlIXyI+UDrRK/YHY4nJX0GmCXSYuo/e1ib6gmktKL8X5Wb07ucNBPZXbCEb9l
         LR7EUjpa2b1/+f7VeZGzrTnxYVuBCTRE+jG16QLuUCBsVgoU0QasYr9eSqI8Bl8bXkfa
         tS4nmVhiEsD+lnBdJy2wbGA5ETbmMrY5TFXbtqrjiIoRYUVeXzwXvysb+7EhJtv29fKB
         L2PWypB0GKP83SYjF5ee0Lo9/Q/Sl6AFlMJqyEqMEsfRym5rY/2GTXFrJoUcTx9ihS5Z
         qNSA==
X-Gm-Message-State: AOJu0YzgolGCm9HiL9aPpjhNI0Qlq5PvDmMfT6FoMrtJWYZWRkU3AYoB
	i4A1oDG4mPUaO/0AklnIyF9b
X-Google-Smtp-Source: AGHT+IFa4kcq1x8534opliGWAomlb7YsXdOWGv2jKnIrbHP0ah0tMcnkxxPdDx5NrEcrjlcEEcKHZw==
X-Received: by 2002:a05:620a:172a:b0:775:9c22:e901 with SMTP id az42-20020a05620a172a00b007759c22e901mr12880926qkb.15.1698119556628;
        Mon, 23 Oct 2023 20:52:36 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id t14-20020a05620a0b0e00b007757fefea79sm3144655qkg.130.2023.10.23.20.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 20:52:36 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:52:35 -0400
Message-ID: <0c3ac562e5b8ea82d962478459bc7047.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com, linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>, Fan Wu <wufan@linux.microsoft.com>
Subject: Re: [PATCH RFC v11 17/19] scripts: add boot policy generation program
References: <1696457386-3010-18-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-18-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
> 
> Enables an IPE policy to be enforced from kernel start, enabling access
> control based on trust from kernel startup. This is accomplished by
> transforming an IPE policy indicated by CONFIG_IPE_BOOT_POLICY into a
> c-string literal that is parsed at kernel startup as an unsigned policy.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ---
> v2:
>   + No Changes
> 
> v3:
>   + No Changes
> 
> v4:
>   + No Changes
> 
> v5:
>   + No Changes
> 
> v6:
>   + No Changes
> 
> v7:
>   + Move from 01/11 to 14/16
>   + Don't return errno directly.
>   + Make output of script more user-friendly
>   + Add escaping for tab and '?'
>   + Mark argv pointer const
>   + Invert return code check in the boot policy parsing code path.
> 
> v8:
>   + No significant changes.
> 
> v9:
>   + No changes
> 
> v10:
>   + Update the init part code for rcu changes in the eval loop patch
> 
> v11:
>   + Fix code style issues
> ---
>  MAINTAINERS                   |   1 +
>  scripts/Makefile              |   1 +
>  scripts/ipe/Makefile          |   2 +
>  scripts/ipe/polgen/.gitignore |   1 +
>  scripts/ipe/polgen/Makefile   |   6 ++
>  scripts/ipe/polgen/polgen.c   | 145 ++++++++++++++++++++++++++++++++++
>  security/ipe/.gitignore       |   1 +
>  security/ipe/Kconfig          |  10 +++
>  security/ipe/Makefile         |  11 +++
>  security/ipe/fs.c             |   8 ++
>  security/ipe/ipe.c            |  12 +++
>  11 files changed, 198 insertions(+)
>  create mode 100644 scripts/ipe/Makefile
>  create mode 100644 scripts/ipe/polgen/.gitignore
>  create mode 100644 scripts/ipe/polgen/Makefile
>  create mode 100644 scripts/ipe/polgen/polgen.c
>  create mode 100644 security/ipe/.gitignore

...

> diff --git a/scripts/ipe/polgen/polgen.c b/scripts/ipe/polgen/polgen.c
> new file mode 100644
> index 000000000000..40b6fe07f47b
> --- /dev/null
> +++ b/scripts/ipe/polgen/polgen.c
> @@ -0,0 +1,145 @@

...

> +static int write_boot_policy(const char *pathname, const char *buf, size_t size)
> +{
> +	int rc = 0;
> +	FILE *fd;
> +	size_t i;
> +
> +	fd = fopen(pathname, "w");
> +	if (!fd) {
> +		rc = errno;
> +		goto err;
> +	}
> +
> +	fprintf(fd, "/* This file is automatically generated.");
> +	fprintf(fd, " Do not edit. */\n");
> +	fprintf(fd, "#include <linux/stddef.h>\n");
> +	fprintf(fd, "\nextern const char *const ipe_boot_policy;\n\n");
> +	fprintf(fd, "const char *const ipe_boot_policy =\n");
> +
> +	if (!buf || size == 0) {
> +		fprintf(fd, "\tNULL;\n");
> +		fclose(fd);
> +		return 0;
> +	}
> +
> +	fprintf(fd, "\t\"");
> +
> +	for (i = 0; i < size; ++i) {
> +		switch (buf[i]) {
> +		case '"':
> +			fprintf(fd, "\\\"");
> +			break;
> +		case '\'':
> +			fprintf(fd, "'");
> +			break;

The revision of IPE proposed in this patchset doesn't support parsing
single or double quotes, yes?

> +		case '\n':
> +			fprintf(fd, "\\n\"\n\t\"");
> +			break;
> +		case '\\':
> +			fprintf(fd, "\\\\");
> +			break;
> +		case '\t':
> +			fprintf(fd, "\\t");
> +			break;
> +		case '\?':
> +			fprintf(fd, "\\?");
> +			break;

Similar, are question marks supported by the parser?

> +		default:
> +			fprintf(fd, "%c", buf[i]);
> +		}
> +	}
> +	fprintf(fd, "\";\n");
> +	fclose(fd);
> +
> +	return 0;
> +
> +err:
> +	if (fd)
> +		fclose(fd);
> +	return rc;
> +}

...

> diff --git a/security/ipe/.gitignore b/security/ipe/.gitignore
> new file mode 100644
> index 000000000000..eca22ad5ed22
> --- /dev/null
> +++ b/security/ipe/.gitignore
> @@ -0,0 +1 @@
> +boot-policy.c
> \ No newline at end of file

Add a newline please.

--
paul-moore.com

