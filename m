Return-Path: <linux-doc+bounces-92968-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 971zCAiMNWqBzQYAu9opvQ
	(envelope-from <linux-doc+bounces-92968-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 20:35:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 139C66A765D
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 20:35:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=vxqlTXYb;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92968-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92968-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C66E73021E83
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 18:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF583403EF;
	Fri, 19 Jun 2026 18:35:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E3733F580;
	Fri, 19 Jun 2026 18:35:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781894147; cv=none; b=iw3a9TiWpMPoyga0pGxvSjF3Nb9F+u6azsTAJLBg5fylkKYzo5BGYEmlcOID0QNbtE7prQC6z3Rd+7AOwN4xERvn5rKXrrIpidexBFJRMRlvyB0PjGsPogkVsEn4F98PLm2apxiwT1NJleaOgM/UD4CaumOAKaUf/iYFKVYhwhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781894147; c=relaxed/simple;
	bh=F0y1aKuOCzVwW7baVOYmxhK5X3tQzLTAM5ZcwqF9hbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ON0hu5IFJjC18KecvQ9npvzLkAZz5lKi9A5fgB2ByW1oRUSh4+T1+SmOxerdFIsAlYJPW6raHGvsKuCuMUA6nnaFfehDZUT0k/guxkmABCBmM9lhw1OGT1deYfuW8LKhErKeH/HTM2LL340uN883lnu2bljDKphtJ0h/ZZTOQdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vxqlTXYb; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JQMxCGsJgO5z4xKjYc47x9IC9JtLm1aAXZzKHP5+ngY=; b=vxqlTXYb+ohjD3QbIDox/VbpTZ
	hd7Uy+grwldfWVL2kS3Bu5GhxUZywxzL93GgqLNnYWvaH2q2e2RGX/7B2hyM1YHZ+xzhignyfZaUz
	8dTQ/PJOuX3u0zlWiP+cYGe+TzOx7dq3h9c13Q7vFHhb0C3G4isI5awLfBC4k7dlV/q+DnGU/L3uB
	U9T0jcPxT6mZ3RX74b9IIVrPBYgXti2EPXjdUvmgAt0C6iK7uPtykmF+g+/VK9H0duCp7550a/8Wc
	ZLxZr/MvhvXaX35nyYn96fpCGmXeasV4GyzVYOPH8MO87lMjIoVA6WAM+1pigXsIA5mvZyhMH6BUf
	O2Sz6BpA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wae42-00000002snX-3wNA;
	Fri, 19 Jun 2026 18:35:38 +0000
Message-ID: <3e206be0-3ef4-468f-b7e7-7bc03848b0d0@infradead.org>
Date: Fri, 19 Jun 2026 11:35:37 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
To: Shyam Saini <shyamsaini@linux.microsoft.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rppt@kernel.org, akpm@linux-foundation.org,
 tgopinath@linux.microsoft.com, bboscaccy@linux.microsoft.com,
 kees@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com, bp@alien8.de,
 peterz@infradead.org, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org
References: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92968-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shyamsaini@linux.microsoft.com,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rppt@kernel.org,m:akpm@linux-foundation.org,m:tgopinath@linux.microsoft.com,m:bboscaccy@linux.microsoft.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:bp@alien8.de,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,linux.microsoft.com,intel.com,igalia.com,alien8.de,infradead.org,linux.alibaba.com,linux.intel.com,google.com,gmail.com,baidu.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,infradead.org:dkim,infradead.org:mid,infradead.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 139C66A765D

Hi,

On 6/18/26 11:23 PM, Shyam Saini wrote:
> reserve_mem relies on dynamic memory allocation, this limits the
> usecase where memory is required to be preserved across the boots.
> Eg: ramoops memory reservation on ACPI platforms
> 
> So add support to pass a pre-determined static address and reserve
> memory at a specified location. This enables use case like ramoops
> on ACPI platforms to reliably access ramoops region with previous
> boot logs.
> 
> Also skip the parsing of <align> when static address is passed.
> 
> Example syntax for static address
>  reserve_mem=4M@0x1E0000000:oops
> 
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> ---
> v1: https://lore.kernel.org/lkml/0eaf3be2-5121-48b7-aeed-196405c0a480@infradead.org/
> v2: Fix code logic and incorporate Randy's suggestion

OK, you fixed a few typos.
There are some bigger things that you seem to have ignored.

> ---
>  .../admin-guide/kernel-parameters.txt         | 15 ++++++
>  mm/memblock.c                                 | 47 +++++++++++++------
>  2 files changed, 47 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f228..7e0baca564b97 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6563,6 +6563,21 @@ Kernel parameters
>  
>  			reserve_mem=12M:4096:oops ramoops.mem_name=oops
>  
> +	reserve_mem=	[RAM]

[RAM] means "RAM disk support is enabled."
Is that the case here?  Is "reserve_mem=" only for use in case
RAM disk support is enabled?

ISTM that you need a new designator instead of RAM...
or overload the use of RAM by adding more info near the top of
Documentation/admin-guide/kernel-parameters.txt.


> +			Format: nn[KMG]:<@offset>:<label>
> +			Reserve physical memory at predetermined location and label it with
> +			a name that other subsystems can use to access it. This is typically
> +			used for systems that do not wipe the RAM, and this command
> +			line will try to reserve the same physical memory on
> +			soft reboots. Note, it is guaranteed to be the same
> +			location unless some other early allocation, e.g.: crashkernel=256M
> +                        (without static address) is reserved or overlaps this region.
> +
> +			The format is size:offset:label for example, to request
> +			4 megabytes for ramoops at 0x1E0000000:
> +
> +			reserve_mem=4M@0x1E0000000:oops ramoops.mem_name=oops
> +
>  	reservetop=	[X86-32,EARLY]
>  			Format: nn[KMG]
>  			Reserves a hole at the top of the kernel virtual
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 6349c48154f4b..c76cefa0a8a83 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -2721,6 +2721,7 @@ static int __init reserve_mem(char *p)
>  	char *name;
>  	char *oldp;
>  	int len;
> +	bool addr_is_static = false;
>  
>  	if (!p)
>  		goto err_param;
> @@ -2736,19 +2737,27 @@ static int __init reserve_mem(char *p)
>  	if (!size || p == oldp)
>  		goto err_param;
>  
> -	if (*p != ':')
> -		goto err_param;
> +	/* parse the static memory address */
> +	if (*p == '@') {
> +		start = memparse(p+1, &p);
> +		addr_is_static = true;
> +	}
>  
> -	align = memparse(p+1, &p);
>  	if (*p != ':')
>  		goto err_param;
>  
> -	/*
> -	 * memblock_phys_alloc() doesn't like a zero size align,
> -	 * but it is OK for this command to have it.
> -	 */
> -	if (align < SMP_CACHE_BYTES)
> -		align = SMP_CACHE_BYTES;
> +	if (!addr_is_static) {
> +		align = memparse(p+1, &p);
> +		if (*p != ':')
> +			goto err_param;
> +
> +		/*
> +		 * memblock_phys_alloc() doesn't like a zero size align,
> +		 * but it is OK for this command to have it.
> +		 */
> +		if (align < SMP_CACHE_BYTES)
> +			align = SMP_CACHE_BYTES;
> +	}
>  
>  	name = p + 1;
>  	len = strlen(name);
> @@ -2772,14 +2781,22 @@ static int __init reserve_mem(char *p)
>  	}
>  
>  	/* Pick previous allocations up from KHO if available */
> -	if (reserve_mem_kho_revive(name, size, align))
> +	if (!addr_is_static && reserve_mem_kho_revive(name, size, align))
>  		return 1;
>  
> -	/* TODO: Allocation must be outside of scratch region */
> -	start = memblock_phys_alloc(size, align);
> -	if (!start) {
> -		pr_err("reserve_mem: memblock allocation failed\n");
> -		return -ENOMEM;

		return 1;

> +	if (addr_is_static) {
> +		if (memblock_reserve(start, size)) {
> +			pr_err("reserve_mem: memblock reservation failed\n");
> +			return -ENOMEM;

			return 1;

> +		}
> +
> +	} else {
> +		/* TODO: Allocation must be outside of scratch region */
> +		start = memblock_phys_alloc(size, align);
> +		if (!start) {
> +			pr_err("reserve_mem: memblock allocation failed\n");
> +			return -ENOMEM;

			return 1;

> +		}
>  	}
>  
>  	reserved_mem_add(start, size, name);


__setup() functions return 1 for "yes, I recognized this string/option
and attempted to handle it" or 0 for "This string/option is meaningless."
There is no "return -Eerror".
If you need that, you could consider using early_param() [see
<linux/init.h>].

-- 
~Randy


