Return-Path: <linux-doc+bounces-94731-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xjSzLOFAR2pYUwAAu9opvQ
	(envelope-from <linux-doc+bounces-94731-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 06:56:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5C6FE812
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 06:56:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=m8Rgjjv4;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94731-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94731-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8269830262A5
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 04:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12F133439A;
	Fri,  3 Jul 2026 04:55:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5CE1FC101;
	Fri,  3 Jul 2026 04:55:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054513; cv=none; b=uEabDsIMBpVoXlaP6pT0N47rHU5kcCq7AfLY9kNiBBpDq1OlnQbb4xj9usgU2zYD1iDfdo48I9T1cHMqyLkH+kEugoBNRCAN3QxIHHgQpzu91eGZTHC6BNn15NR4gr73Xq1GYva+LxnTC7FyL4NwfOrMKyH/b7VwI3xqF2gH/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054513; c=relaxed/simple;
	bh=iuOzoj8VYCv9ymqTjCLjQ2N5iWOPzNnBAFButwsM1Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcFlbh0e26mAHfrgHQRLqzfWCwnmvUzzhaaSU5BuROxV4F/KPn1KiC3TCM77xBX98j93oQj8DB+UTlIo84syetFc0mtLGkKprDlM8/0zwJgw0SVSID8FX4i/Ffe+XMNBuM+lHxI8H9t/FCn2zFfFFW8LrakUhDF1jSv7QKtiSgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8Rgjjv4; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783054503; x=1814590503;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iuOzoj8VYCv9ymqTjCLjQ2N5iWOPzNnBAFButwsM1Sk=;
  b=m8Rgjjv4z8GJGXWKcmlch3cMZsnBVG++vNR0rXnjffxBgPVoXoC8Mx8o
   HWlcS/4ux4HBpsNaalub7zxEO/ssPjdvAarvZuWvPQfw2IPx3SOJ59uTe
   gvoRbCsHElRu8JonD3Lzgk/Kf0i/anzwZoM1mdiVhzMOXhOsz18yUddKt
   4BaUx3PFEV/ALe/N1+6/H6c61NBimY/T31OFpD+TwTg9wLYO0Pc5wc88s
   d7PCyuIEixRu6XExEoaLz1SZ2BDnfMyw03msyqk8XXNoOYa29bMTlf3w5
   8EklaAM1w/PA3vzrlExaY9/LV3eszt06qzNawSxsZ45MvRQ6J8xj538iq
   Q==;
X-CSE-ConnectionGUID: ivDdfc6ISeGnxrtZImK/gw==
X-CSE-MsgGUID: U0JzGEWwR4GuvGQbeXd7HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94958086"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94958086"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 21:55:02 -0700
X-CSE-ConnectionGUID: g2dfjOB9T8GyTR6dIAnYcw==
X-CSE-MsgGUID: znwn3ZDcRAmHHiXj+CQS6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277345905"
Received: from unknown (HELO [10.238.2.244]) ([10.238.2.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 21:54:57 -0700
Message-ID: <83a7fda7-e9ad-4420-be93-13937d41dc4b@linux.intel.com>
Date: Fri, 3 Jul 2026 12:54:55 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] Documentation/x86: Add documentation for TDX's
 Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org,
 vannapurve@google.com, x86@kernel.org, chao.gao@intel.com,
 yan.y.zhao@intel.com, kai.huang@intel.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-12-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260526023515.288829-12-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rick.p.edgecombe@intel.com,m:bp@alien8.de,m:dave.hansen@intel.com,m:hpa@zytor.com,m:kas@kernel.org,m:kvm@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mingo@redhat.com,m:nik.borisov@suse.com,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:vannapurve@google.com,m:x86@kernel.org,m:chao.gao@intel.com,m:yan.y.zhao@intel.com,m:kai.huang@intel.com,m:kirill.shutemov@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[binbin.wu@linux.intel.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94731-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[binbin.wu@linux.intel.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93A5C6FE812

On 5/26/2026 10:35 AM, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Expand TDX documentation to include information on the Dynamic PAMT
> feature.
> 
> The new section explains PAMT support in the TDX module and how Dynamic
> PAMT affects the kernel memory use.
> 
> Assisted-by: Sashiko:claude-opus-4-6 GitHub Copilot:claude-opus-4-6 Claude:claude-opus-4-7
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

One nit below.

> ---
> v6:
>  - Add missing word (Binbin)
>  - Use "::" instead of ":"
>  - Make format of dmesg example accurate
> 
> v3:
>  - Trim down docs to be about things that user cares about, instead
>    of development history and other details like this.
> ---
>  Documentation/arch/x86/tdx.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
> index ff6b110291bc6..ce026a88b6f78 100644
> --- a/Documentation/arch/x86/tdx.rst
> +++ b/Documentation/arch/x86/tdx.rst
> @@ -73,6 +73,28 @@ initialize::
>  
>    [..] virt/tdx: TDX-Module initialization failed ...
>  
> +Dynamic PAMT
> +------------
> +
> +PAMT

Nit:
It seems that there is no spelling out of the acronym in the source code or the documentation.
Maybe it's a good place to give the full version. E.g.

Physical Address Metadata Table (PAMT) is ...

> is memory that the TDX module needs to keep data about each page
> +(think like struct page). It needs to be handed to the TDX module for its
> +exclusive use. For normal PAMT, this is installed when the TDX module
> +is first loaded and comes to about 0.4% of system memory.
> +
> +Dynamic PAMT is a TDX feature that allows VMM to allocate part of the
> +PAMT as needed (the parts for tracking 4KB size pages). The other page
> +sizes (1GB and 2MB) are still allocated statically at the time of
> +TDX module initialization. This reduces the amount of memory that TDX
> +uses while TDs are not in use.
> +
> +When Dynamic PAMT is in use, dmesg shows it like::
> +
> +  [..] virt/tdx: Enable Dynamic PAMT
> +  [..] virt/tdx: 10092 KB allocated for PAMT
> +  [..] virt/tdx: TDX-Module initialized
> +
> +Dynamic PAMT is enabled automatically if supported.
> +
>  TDX Interaction to Other Kernel Components
>  ------------------------------------------
>  


