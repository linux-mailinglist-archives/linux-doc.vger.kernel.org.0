Return-Path: <linux-doc+bounces-94543-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NYb7G58oRmpZKwsAu9opvQ
	(envelope-from <linux-doc+bounces-94543-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 11:00:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F616F507B
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 11:00:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=Bxl1Vgya;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94543-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94543-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 455D330683C4
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 08:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9622F3C3C0E;
	Thu,  2 Jul 2026 08:56:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181D63D8132;
	Thu,  2 Jul 2026 08:56:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982564; cv=none; b=M7P1FhQxU5oIvXljMWQeSHHXvNxoR0B7ojzTiNIyT0le3IN9o+Gj4JShlgb+g6WUsI91+9adR83GbMKNseB9/65ZzgeL5XBGUdzV2Ch8Owg7wxewBNeUfW3cME0mpXIknr9pRlR0lkCEHmlV9Wgrze6hnz/EJ+130WGx7F0SY6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982564; c=relaxed/simple;
	bh=9Ma5KFtkMeDbcnixBHck1T0uu5/NZ47Dlk4RsPkos1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Durx+QvZvd+kNT5rUUekGKxRWZP7WtG04siBNvFfiYgOul54/gMkA6XYnk7VFC0yC/uJ5P6mF7wc4Wg7ojX31/mLiafAovwSguq0d0LV1yyfmeiShdinun9dY576n57uiCAtJWsQ8a3giVODaNoLThm/zcuOIRMEUO8vMXZSQ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bxl1Vgya; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782982564; x=1814518564;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9Ma5KFtkMeDbcnixBHck1T0uu5/NZ47Dlk4RsPkos1Y=;
  b=Bxl1Vgyad2NHsB74tiZyrNKxyTJHfv15RS9FMWOCrsHus7VDpjO2ljdY
   yJaZ364/VbOVetSvMNMZzHXf29LXQfJH1gnYyUYqRKNsRRj6du0zzr08Q
   XwfSQY6FbObsTWBUykAkapu+e4uWxJm1KOgmUnhTvJOiSLfvWoR5FJjCa
   s3D6BYWCW4na7bhI3H1Fh+wYyUk1A0etxmZBf73D3Oz9QWbhghqA2djL8
   9EA5+HQoPBz9f6h7FV5yyO1yuvaM9wT93Vezz12E8LALRKQPT2HeZxTuH
   fZ/7mIu/CMKvY+1LmcYcAkK/jd7iw3g90scLzvbsDzq3D2G0C9WJGl2aA
   g==;
X-CSE-ConnectionGUID: eqD1sYGgTGedQrE+2WQTZA==
X-CSE-MsgGUID: 1cdXLP5wQjGV6trTafzHvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83509416"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83509416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:56:03 -0700
X-CSE-ConnectionGUID: yBaMW+b0RhKWOyLQ+0D8tQ==
X-CSE-MsgGUID: tcei5PLLQ8SlEsiPcuCO/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="277130102"
Received: from unknown (HELO [10.238.2.244]) ([10.238.2.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:55:58 -0700
Message-ID: <a6844562-e973-436f-970b-fa0b68ced1a0@linux.intel.com>
Date: Thu, 2 Jul 2026 16:55:56 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] KVM: TDX: Allocate PAMT memory for TD and vCPU
 control structures
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org,
 vannapurve@google.com, x86@kernel.org, chao.gao@intel.com,
 yan.y.zhao@intel.com, kai.huang@intel.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-8-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260526023515.288829-8-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-94543-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email,vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1F616F507B

On 5/26/2026 10:35 AM, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Use control page helpers for allocating and freeing TD control structures,
> such these operations can work for Dynamic PAMT.
      ^
Nit:
It appears to be missing the word "that". 


> 
> The TDX module tracks some state for each page of physical memory that it
> might use. It calls this state the PAMT. It includes separate state for
> each page size a physical page could be utilized at within the TDX module
> (1GB, 2MB, 4KB). In Dynamic PAMT, only the 4KB page size state is
> allocated dynamically. So the kernel must install PAMT backing for each 4KB
> page before gifting it to the TDX module, and tear it down after the page
> is reclaimed.
> 
> TD-scoped control pages (TDR, TDCS) and vCPU-scoped control pages (TDVPR,
> TDCX) are all handed to the TDX module at 4KB page size and are therefore
> subject to this requirement. Replace the raw alloc_page()/__free_page()
> calls for these pages with tdx_alloc/free_control_page().
> 
> Switching between special Dynamic PAMT operations or normal page
> alloc/free operations is handled internally in
> tdx_alloc/free_control_page(). So don't check for Dynamic PAMT around these
> calls. Just call them unconditionally. Similarly, drop the NULL checks
> before freeing, as tdx_free_control_page() handles NULL internally.
> 
> No functional change intended when Dynamic PAMT is not in use.
> 
> Assisted-by: GitHub Copilot:claude-opus-4-6 Claude:claude-opus-4-7
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [sean: handle alloc+free+reclaim in one patch]
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> [Rick: enhance log]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


