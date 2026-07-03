Return-Path: <linux-doc+bounces-94730-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /G8XNdQ8R2rFUgAAu9opvQ
	(envelope-from <linux-doc+bounces-94730-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 06:38:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 408A96FE755
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 06:38:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=DSe8FR1H;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94730-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94730-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 919D93031022
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 04:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3CB30FF31;
	Fri,  3 Jul 2026 04:35:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0E31355D;
	Fri,  3 Jul 2026 04:35:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783053328; cv=none; b=KZq5pOtS6YFVaOhwimMkQ8ICwpzhFtFEBTIG7L/Dvj4OFamqoI4wjvSwivkAxtARhLlrHq1qPe4W20C9zQgtOGjm+ZexWGjNy5XuTTnQmLUnWLyJzDJasInPVR76YNV48rEZWZTbqNgVHHXnBF46x75SQGuFXKOh10YDvhAMUSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783053328; c=relaxed/simple;
	bh=QBC++khxS0F4L3bCCsPjlFJdDH+4s0OrtGBVyH+dyoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpOZUU4UvOke9uiMAxL+ACkfj8ly31i2Ie7Oi1OVNuAIYlbQ2e05tYjZVXu72Gf5GXq1v/V2wlaZIC8SRfMi+PWjXV/+igBzzXasDRMD1hFwCkqcEd1RGxyStLlKZJn5vYX2sf5a87b87Yfyx5iTWOhue28Bm0HIJH2r9xhZrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSe8FR1H; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783053317; x=1814589317;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QBC++khxS0F4L3bCCsPjlFJdDH+4s0OrtGBVyH+dyoc=;
  b=DSe8FR1HxpV/kexuOtsUsgbIlkAET46uZdg6U1WtB+SeaYNljJ7dvAyF
   GtZLbnbcrQ7b7Ey7zOq/SUaDSRebw/efuP6OxfFDxxKgBK+fEkTroWDbX
   /v6N9WCRdyQYCmxP7AHJ7rENODQOSNiwzK+glkrvjDqurrdxh9hwe1pLN
   qzbizL+PtTgLbgM/AOasoTWcJD47Jvm3jfefiaGWFFXv8vQFgplkrNylx
   sbnW6ilGzK6qb8krTjjLCFM36DbLqwpr4Iw/4rHM1Zl37LB1HGBz/dcEl
   oKeAPeo/WSgXeoAbro137stxwOiJjm97PWBJ6/Im/Nu+j+8Zzx5rkiUvg
   A==;
X-CSE-ConnectionGUID: A8JbyFxCTrC/NjEaJ7YBdQ==
X-CSE-MsgGUID: zOFV/pCRSemvKJ5U4XVVQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82912096"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82912096"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 21:35:15 -0700
X-CSE-ConnectionGUID: CsbBhky6RwK2wPRW3nkvZA==
X-CSE-MsgGUID: zMBR9hLDShqMjjcYmocl6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257355714"
Received: from unknown (HELO [10.238.2.244]) ([10.238.2.244])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 21:35:11 -0700
Message-ID: <0a704b8e-a132-4cd2-a696-578407d11888@linux.intel.com>
Date: Fri, 3 Jul 2026 12:35:08 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/11] x86/virt/tdx: Enable Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org,
 vannapurve@google.com, x86@kernel.org, chao.gao@intel.com,
 yan.y.zhao@intel.com, kai.huang@intel.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-11-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260526023515.288829-11-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-94730-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 408A96FE755

On 5/26/2026 10:35 AM, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> The Physical Address Metadata Table (PAMT) holds TDX metadata for
> physical memory and must be allocated by the kernel during TDX module
> initialization. Dynamic PAMT is a TDX module feature that can reduce this
> memory use by allocating part of the PAMT dynamically.
> 
> All pieces are in place to Enable Dynamic PAMT if it is supported.
> Determine if the TDX module supports it by checking the 'features0' bit
> exposed by the TDX module.
> 
> The TDX module also exposes information about whether the *system* (and
> not the module) supports Dynamic PAMT.
> 
> The TDX module documentation describes how PAMT works internally. To allow
> the last level to be dynamically allocated, it uses a 3 level tree
> structure, not unlike page tables. Like page tables, it has a maximum
> address space that it can cover. This address space can be covered in 48
> bits. If the host physical address space is higher than this, than the
                                                                  ^
                                                                then


> TDX module can't guarantee the tree will be able to cover the TDX memory.
> 
> The TDX module exposes this system support via metadata stating the
> minimum number of HKIDs that need to be available in order for Dynamic
> PAMT to be usable. The reasoning appears to be that more HKIDs can shrink
> the "real" addressable physical address bits enough to make the 48 bit
> Dynamic PAMT limit workable on high physical address width HW. However,
> the docs also clearly explain the 48 bit limit and how this fits into the
> Dymamic PAMT tree constraints.
    ^
  Dynamic


> 
> The handy x86_phys_bits value is already read and adjusted for keyid bits.
> So just compare that against 48 instead of reading more metadata and
> burdening the code with the more tenuous connection to minimum HKID bits.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
It looks like whether to check 48 bit physical address width limitation is
still open.

The rest LGTM.




