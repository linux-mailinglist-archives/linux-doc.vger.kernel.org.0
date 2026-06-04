Return-Path: <linux-doc+bounces-90893-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uae+Gyg0IWo7AwEAu9opvQ
	(envelope-from <linux-doc+bounces-90893-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 10:15:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C10B063DEB2
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 10:15:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=byMoFNFE;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90893-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-90893-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D945308AD62
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 08:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF0C3C141F;
	Thu,  4 Jun 2026 08:12:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16B13AEF33;
	Thu,  4 Jun 2026 08:12:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560746; cv=none; b=HPvwcD9gMMbD3UWtf0eI6HTJ+U3zYhtFe21AUjZxPLVoervUVE18A3N6NDfowMrm7t229YORJKkN44TbLrgGbaA2WKW3tKNNEjy6DhcJdiowdN4xknmdr/iq9HYTzWeGU5sztw0TIepyCx8GJVi2pZVBafMbps4cOC+XXlrXXuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560746; c=relaxed/simple;
	bh=o6Z/uwujb2TAAvvhq1LbmEneR+M+nP9iiczIcTZunvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nt6hatZo0SeVolkdtF8IrBDgiZpxuyQaBFZ4Ptzek1AGQfAWD7vp8GhffeNfCalqVN1LKJfbntbDtIGr2Tk/nn6PS0VC7rNjB0Q5FqAA03sGnZkgSaZY1fFRGHT8iI5CND3Ee6TqpM9QwzYDPazZltnu/ZqNS1etfIl+9fhyICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byMoFNFE; arc=none smtp.client-ip=198.175.65.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780560746; x=1812096746;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o6Z/uwujb2TAAvvhq1LbmEneR+M+nP9iiczIcTZunvU=;
  b=byMoFNFEj5hW+5EX4z0MyIALAztnUfWV+vuOU/R8LuZFq1AFcMP1TkXk
   ncZKa4LzPYk/3iJwMALA9va/bKoIFMAjRVpTM9rIrBWbnPziomJtlNlPW
   ii2FYPqmjUbLIXSheFWGCxvxWZwfuI4q6W7wGUpYlueGVKH57vmX1RBzc
   MfRfD/TTK2JdirJWMrm3EdxBbCrFirkun4lc3PA8R8TiTFBRhLg28uE0M
   TY5qPhuRLH+UUevm7c1BYDLeQoYbIFlzohAa+zWoSg+CBtl58oFtcf10h
   q+49kzRx5xAeSuT3chPFhIrNvvBw9Tiw08oX1LLzBS7SrDkyhUeJsiqDV
   A==;
X-CSE-ConnectionGUID: 1Na639hkR/io7n9HkbaEPg==
X-CSE-MsgGUID: a0YlKyyORJun4apV5QPtSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92490457"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="92490457"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:12:25 -0700
X-CSE-ConnectionGUID: T2+Io0nfR/CodZF0G4Ubaw==
X-CSE-MsgGUID: RMR7ERZlQJ6BrMWst1sKxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="246299610"
Received: from unknown (HELO [10.238.2.24]) ([10.238.2.24])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:12:21 -0700
Message-ID: <86c33021-b419-4c3e-b5d5-af1561a36c08@linux.intel.com>
Date: Thu, 4 Jun 2026 16:12:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: KVM: Synchronize x86 VM types
To: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>
References: <20260603114504.814647-2-clopez@suse.de>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260603114504.814647-2-clopez@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90893-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clopez@suse.de,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:brijesh.singh@amd.com,m:isaku.yamahata@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[binbin.wu@linux.intel.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[binbin.wu@linux.intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email,intel.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C10B063DEB2



On 6/3/2026 7:45 PM, Carlos López wrote:
> KVM has reflected KVM_X86_SNP_VM to userspace since 1dfe571c12cf
> ("KVM: SEV: Add initial SEV-SNP support"), and KVM_X86_TDX_VM since
> 161d34609f9b ("KVM: TDX: Make TDX VM type supported"). Update the
> documentation to reflect this fact.
> 
> Fixes: 1dfe571c12cf ("KVM: SEV: Add initial SEV-SNP support")
> Fixes: 161d34609f9b ("KVM: TDX: Make TDX VM type supported")
> Signed-off-by: Carlos López <clopez@suse.de>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

> ---
>  Documentation/virt/kvm/api.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 52bbbb553ce1..3ec574a41f60 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -9363,6 +9363,8 @@ means the VM type with value @n is supported.  Possible values of @n are::
>    #define KVM_X86_SW_PROTECTED_VM	1
>    #define KVM_X86_SEV_VM	2
>    #define KVM_X86_SEV_ES_VM	3
> +  #define KVM_X86_SNP_VM		4
> +  #define KVM_X86_TDX_VM		5
>  
>  Note, KVM_X86_SW_PROTECTED_VM is currently only for development and testing.
>  Do not use KVM_X86_SW_PROTECTED_VM for "real" VMs, and especially not in


