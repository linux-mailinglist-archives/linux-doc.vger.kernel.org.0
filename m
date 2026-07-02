Return-Path: <linux-doc+bounces-94520-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uEQeMlURRmreIwsAu9opvQ
	(envelope-from <linux-doc+bounces-94520-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:20:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4E6F4198
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:20:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lOzoS2Vn;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94520-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94520-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F26C8300E25E
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 07:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B387338B7A5;
	Thu,  2 Jul 2026 07:20:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A33770B;
	Thu,  2 Jul 2026 07:20:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976847; cv=none; b=NqpKj7f4U0yIpLBbAknEkeLGx4C+kFbVhLGDCgQX5tcDdtkZ8peWKGxQhl5yIIxTFaAHpz/MBWKIXX2+yHw7mHqn5EvBPcczzSHJ7b27LRwfbP88Cd02dHE7ZnLC163RqBWfONrXJqD0LVzwqYTgwmjiPYRYVxKOFPmzxfMWL9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976847; c=relaxed/simple;
	bh=Rik/cteAmaVB5MZ1qJF+opeiZVcZYXeAGO8XUC+b5DI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeUSlyleGtP0XiUdvQVC0pPRK6vZNaR76JLKJsIHEo4mI5HmCC20wwvtuuL4uuqrr1J7bnmWbEJvSFhPGdiPbWgQF676PnwYK8lVTy3XowEKQc0HQCdvlz04Z4a9cJmwv6Nibe4EXN/id5SrKTD35Eo4ay2MkChijTm/M2Gsihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOzoS2Vn; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782976846; x=1814512846;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Rik/cteAmaVB5MZ1qJF+opeiZVcZYXeAGO8XUC+b5DI=;
  b=lOzoS2Vng44II5wGz432YlBGHMcIOFuDNK8WYAIYZzOihvenE0KLUKtB
   QoQWNbBxut5vojy5f123lXpuffRJyI4wWgO90z/lCuMTyjWkO6DflBbI2
   AabkDzERttggC4CeQtlVQgCppGxpbPYNmmlqzrFdiPbmsyYWpHrh0CrgY
   ntm94f5oCT4AXPABWDBNGMMtlHR5j0pl0hk8lzyZxgBQ/gU4fD/11ip7S
   nk3E5G6wYwvpXQI9UUTnFRSj8CTt4DhmRNANe2efYDOVY4OfKUJHAg0UC
   QcUIVNtnjCB3Ge3Odt1mK3ESCByXA7U6OAyu2dEEl5l6kGSzymwWne6v1
   g==;
X-CSE-ConnectionGUID: GS/JVXD9SLSCV7xGBBQVAg==
X-CSE-MsgGUID: 91lpwrGHR36L6tYeaLiDrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83498367"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83498367"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:20:45 -0700
X-CSE-ConnectionGUID: l5lPfuMoRBCG2CIhXD+8dA==
X-CSE-MsgGUID: Q6Jb8h7mTsmU8u4vRhb9tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257674244"
Received: from unknown (HELO [10.238.2.244]) ([10.238.2.244])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:20:39 -0700
Message-ID: <ca22e5c5-9742-44fa-9c47-e4134e832d49@linux.intel.com>
Date: Thu, 2 Jul 2026 15:20:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] x86/virt/tdx: Allocate ref counts for Dynamic
 PAMT memory
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org,
 vannapurve@google.com, x86@kernel.org, chao.gao@intel.com,
 yan.y.zhao@intel.com, kai.huang@intel.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-5-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260526023515.288829-5-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-94520-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51D4E6F4198

On 5/26/2026 10:35 AM, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> The PAMT memory holds metadata for all possible TDX protected memory. Each
> physical address range is covered by PAMT entries at three levels (1GB,
> 2MB, 4KB). With Dynamic PAMT, the 4KB range of PAMT is allocated on
> demand. The kernel supplies the TDX module with page pairs to store the
> 4KB entries, which cover 2MB of host physical memory. The kernel must
> provide this page pair before using pages from the range for TDX. If this
> is not done, SEAMCALLs that give the pages to be protected by the TDX module
> will fail.
> 
> Allocate reference counters for every 2MB range to track TDX memory usage.
> This can be used to handle concurrent get/put callers, in order to
> accurately determine when the dynamic 4KB level of Dynamic PAMT needs to
> be allocated and when it can be freed.
> 
> This allocation will currently consume 2 MB for every 1 TB of address
> space from 0 to max_pfn. The allocation size will depend on how the RAM is
> physically laid out. In a worst case scenario where the entire 52-bit
> address space is covered this would be 8GB. Then the DPAMT refcount
> allocations could hypothetically cause the savings from Dynamic PAMT to go
> negative on exotic platforms with sparse, small amounts of memory.

Nit:
Do you think it make sense to print the memory size allocated for
DPAMT refcounts in the kernel log?

> 
> Future changes could reduce this refcount overhead to be only allocating
> refcounts for physical ranges that contain memory that TDX can use.
> However, this is left for future work.
> 
> Assisted-by: Sashiko:claude-opus-4-6 GitHub Copilot:claude-opus-4-6 Sashiko:claude-opus-4-6
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>


