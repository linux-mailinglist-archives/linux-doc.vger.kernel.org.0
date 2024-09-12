Return-Path: <linux-doc+bounces-25081-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34F976EAA
	for <lists+linux-doc@lfdr.de>; Thu, 12 Sep 2024 18:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B792628679B
	for <lists+linux-doc@lfdr.de>; Thu, 12 Sep 2024 16:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42317149C69;
	Thu, 12 Sep 2024 16:28:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2273813F012;
	Thu, 12 Sep 2024 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726158495; cv=none; b=WzJk0enC9LznbRJKDqcesoBNAsXbxk49hgoc0/kKRAXgRnEEc9fH0XjzPl+xWxEUSghW0G5C9MjGWfsXwfDetZn0Gv/ZY7t699dUFRHfNTKH/wvLxbrxs3KGfoSqQFS6BMIXZNgEeZUvTYncTVuDlgH6Cx335KX9Cegwl2konUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726158495; c=relaxed/simple;
	bh=2YFXpCZAIRY/rDziLrdBOLPJ0aD2RQUVA/kubNfHmRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFm7LzXoG31yOTHZ106bV+FhCnY9wlCPW/vgpKZSO0y9lbDJbr+IgIYGSS+Uy9AHBHEnhC4VWnbh6PV7Eq/WIbZLjt3mauEOYYvP2W1ETOS4+LIWj/HTG8KqxaY44JVFqPUulHQnqaG9SR9G8ar5dYx1wRZi+8akp6PY4TKbQ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AAEC4CEC4;
	Thu, 12 Sep 2024 16:28:11 +0000 (UTC)
Date: Thu, 12 Sep 2024 17:28:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] binfmt_elf: Wire up AT_HWCAP3 at AT_HWCAP4
Message-ID: <ZuMWmfiwuVQrK64a@arm.com>
References: <20240906-arm64-elf-hwcap3-v1-0-8df1a5e63508@kernel.org>
 <20240906-arm64-elf-hwcap3-v1-1-8df1a5e63508@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906-arm64-elf-hwcap3-v1-1-8df1a5e63508@kernel.org>

On Fri, Sep 06, 2024 at 12:05:24AM +0100, Mark Brown wrote:
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 19fa49cd9907..32e45e65de8f 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -257,6 +257,12 @@ create_elf_tables(struct linux_binprm *bprm, const struct elfhdr *exec,
>  	NEW_AUX_ENT(AT_RANDOM, (elf_addr_t)(unsigned long)u_rand_bytes);
>  #ifdef ELF_HWCAP2
>  	NEW_AUX_ENT(AT_HWCAP2, ELF_HWCAP2);
> +#endif
> +#ifdef ELF_HWCAP3
> +	NEW_AUX_ENT(AT_HWCAP3, ELF_HWCAP3);
> +#endif
> +#ifdef ELF_HWCAP4
> +	NEW_AUX_ENT(AT_HWCAP3, ELF_HWCAP4);

s/HWCAP3/HWCAP4/ for the last line.

>  #endif
>  	NEW_AUX_ENT(AT_EXECFN, bprm->exec);
>  	if (k_platform) {
> diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
> index 28a3439f163a..9365f48598a1 100644
> --- a/fs/binfmt_elf_fdpic.c
> +++ b/fs/binfmt_elf_fdpic.c
> @@ -620,6 +620,12 @@ static int create_elf_fdpic_tables(struct linux_binprm *bprm,
>  	NEW_AUX_ENT(AT_HWCAP,	ELF_HWCAP);
>  #ifdef ELF_HWCAP2
>  	NEW_AUX_ENT(AT_HWCAP2,	ELF_HWCAP2);
> +#endif
> +#ifdef ELF_HWCAP3
> +	NEW_AUX_ENT(AT_HWCAP3,	ELF_HWCAP3);
> +#endif
> +#ifdef ELF_HWCAP3
> +	NEW_AUX_ENT(AT_HWCAP4,	ELF_HWCAP4);

Same here with the ifdef.

>  #endif
>  	NEW_AUX_ENT(AT_PAGESZ,	PAGE_SIZE);
>  	NEW_AUX_ENT(AT_CLKTCK,	CLOCKS_PER_SEC);
> diff --git a/fs/compat_binfmt_elf.c b/fs/compat_binfmt_elf.c
> index 8f0af4f62631..0a219e26692a 100644
> --- a/fs/compat_binfmt_elf.c
> +++ b/fs/compat_binfmt_elf.c
> @@ -80,6 +80,21 @@
>  #define	ELF_HWCAP2		COMPAT_ELF_HWCAP2
>  #endif
>  
> +#ifdef	COMPAT_ELF_HWCAP3
> +#undef	ELF_HWCAP3
> +#define	ELF_HWCAP3		COMPAT_ELF_HWCAP3
> +#endif
> +
> +#ifdef	COMPAT_ELF_HWCAP3
> +#undef	ELF_HWCAP3
> +#define	ELF_HWCAP3		COMPAT_ELF_HWCAP3
> +#endif

Duplicate hunk.

-- 
Catalin

