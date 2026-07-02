Return-Path: <linux-doc+bounces-94527-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6+sYN70WRmp1JgsAu9opvQ
	(envelope-from <linux-doc+bounces-94527-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:43:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B9C6F44E8
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:43:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Lq4UvmLv;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94527-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94527-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EFD73034748
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 07:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7860E3939DE;
	Thu,  2 Jul 2026 07:39:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73373A48E3;
	Thu,  2 Jul 2026 07:39:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977974; cv=none; b=myAb5MDlVuZNQY+z7h6sZWRY/nOPfPl1+9rVZAKco5+ZO7heqbzZWjXsjyZivOGmZVmSPS+FZarNp+xC6uMhcnrgIeTibyNH1Krm4TXIRE0PIqZl8K/SoAq0yTf/JHEXBVE4FMYqg2B21zpJMijZeXt1UESxod95UqlVLLHSpxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977974; c=relaxed/simple;
	bh=j/OPuv0d6VRbXBYGR78O8nPZKRJDyebLraDM8i2fvTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsM010xGuH7D56AcUWA0UWe7XA8fJf5FJEPhpMykmgpEOeZJs83sZ++nL/CzfUpHJ+b/1twx+knUtXhSSgrgYnEDj8fZwu3PI5K4B1bgeyTN5Lq2ySVy9rMHuiC2/IUuuro2AWOF8rx/mtz2yryf+A9pCeCl8ZOobSJU6kJn2e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lq4UvmLv; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782977972; x=1814513972;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=j/OPuv0d6VRbXBYGR78O8nPZKRJDyebLraDM8i2fvTE=;
  b=Lq4UvmLvQWgPlB50tgfjCSbe2NR3cj7Mticubv7pO40txUrxnWO1JBIP
   z1mkPqCmngc64kh1HTSAVjme3YyUI2eH/R+Tb8Kzo3v8+LllZesF2ihEJ
   dIxFiKGRVigQqjqKYhCheilLOHHEVVDA0kwlk1hSirf8SqjrOI1ORuSHW
   o+YIlW2JUwidkw88ckUtkYK/THuYfC3w27grA7LCVYzHRMt0hZAEHtsTp
   zgKOQ/d2aF4bsIXoU0TdUgsY4U8RrSNFKn3qIYW8+WlMNakafFnSA54ur
   Dsv2Dd/Ay20VtXQVatZE0B29s0g5zKABf92eEmtjQZvDak1VMxp2QdMfC
   Q==;
X-CSE-ConnectionGUID: u/f6JUksTJyd0ShFMIAZ+w==
X-CSE-MsgGUID: hO/F1XgTRuOStwtNOxqtPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83589652"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83589652"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:39:32 -0700
X-CSE-ConnectionGUID: +MM1UJEXSsedtjolvHVGnA==
X-CSE-MsgGUID: kwjLY7vRQCuaPEqAhvuSyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="290910560"
Received: from unknown (HELO [10.238.2.244]) ([10.238.2.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:39:27 -0700
Message-ID: <1694d6c2-2aaa-4277-ba83-97c4a3007417@linux.intel.com>
Date: Thu, 2 Jul 2026 15:39:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/11] x86/virt/tdx: Handle concurrent callers in
 tdx_pamt_get/put()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org,
 vannapurve@google.com, x86@kernel.org, chao.gao@intel.com,
 yan.y.zhao@intel.com, kai.huang@intel.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-6-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260526023515.288829-6-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-94527-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51B9C6F44E8

On 5/26/2026 10:35 AM, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> tdx_pamt_get()/tdx_pamt_put() unconditionally add or remove Dynamic PAMT
> backing for the 2MB region covering the passed pfn. However, multiple
> callers can concurrently operate on 4KB pages that fall within the same
> 2MB region. When this happens only one Dynamic PAMT page pair needs to be
> installed to cover the 2MB range. And when one page is freed, the Dynamic
> PAMT backing cannot be freed until all pages in the range are no longer in
> use. Make the helpers handle these races internally.
> 
> Use the per-2MB refcounts from previous changes to track how many 4KB
> pages are in use within each region. Gate the actual Dynamic PAMT add and
> remove on refcount transitions (0->1 and 1->0). Serialize the refcount
> check and SEAMCALL with a global spinlock so the read-decide-act sequence
> is atomic. This also avoids TDX module BUSY errors, as Dynamic PAMT add
> and remove SEAMCALLs take an internal TDX module locks at 2MB granularity,
> so simultaneous attempts on the same region would conflict.
> 
> The lock is global and heavyweight. Use simple conditional logic to keep
> correctness obvious. This will be optimized in a later change.
> 
> Assisted-by: GitHub Copilot:claude-opus-4-6 Claude:claude-opus-4-7
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

One nit below.

[...]

>  
> @@ -2057,10 +2061,26 @@ static int tdx_pamt_get(kvm_pfn_t pfn)
>  	if (ret)
>  		return ret;
>  
> -	tdx_status = tdh_phymem_pamt_add(pfn, pamt_pages);
> -	if (tdx_status != TDX_SUCCESS) {
> -		ret = -EIO;
> -		goto out_free;
> +	pamt_refcount = tdx_find_pamt_refcount(pfn);

tdx_find_pamt_refcount() is tagged as __maybe_unused in the previous patch.
I think the tag should be removed.

[...]

