Return-Path: <linux-doc+bounces-94293-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gy5WObjARGo80QoAu9opvQ
	(envelope-from <linux-doc+bounces-94293-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 09:24:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D36EA9B6
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 09:24:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=XQmGOI1f;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94293-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94293-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1879E3044726
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 07:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61CD3B5826;
	Wed,  1 Jul 2026 07:22:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B25E1F0E25;
	Wed,  1 Jul 2026 07:22:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890570; cv=none; b=O4nWUDe9PFE4unk8NSpvZQ8fLDW24F9Mj05kU7PUpupdaQIxVzj+LPNRaSRtcdkZLjvAMWwM+vVGFwlZT4GhIehJzxugQlsSD2Q+H9ynKnQnBqp2Xc72ywJMSGt0Si3TKy5vcy+MHk+ZUSTEMeDEQXtA2vuZqgsv8FQhvHmOnm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890570; c=relaxed/simple;
	bh=O95arKx9T5MkaZlIQszzS6sq+z6RycCRVDU6C6dp8F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yr25LtyF628Aa5zMjfOH+Bt+vOSF5tKP4QewZsoy/MMnBVkueSU6n4n+8IMBciP59gQ0Rehj9U+aw75IKH5bhvIMx9n2XiM9J6Bxakm1NApEGaUgsXR9nRAsuPZ8brnP+wRR5ROj/UFzM7brtuiFj4BLNN2fR7sfMBuP2ds86rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQmGOI1f; arc=none smtp.client-ip=192.198.163.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782890567; x=1814426567;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=O95arKx9T5MkaZlIQszzS6sq+z6RycCRVDU6C6dp8F8=;
  b=XQmGOI1fJisTrg7QqbBAO/xiwGnKkd1huBRxe1AKF615REyyy1lZYgn5
   9ECRIcrn/+vXKoNax2f5TBSz6GllKCbXP9mRd6LqUs0hkz5WFNCYypylo
   fP3gtFtBa1ZbF0hUOp2KKLcy+jyI6q0OK/Yr3jH6UhlGtEBS6hpag5mQT
   b0utK7oDUy1cRC9KOgfIoRml+t6ontylDeqstUWXIpkO1MOsMQnqaMMze
   7qdLsZZ/1Dlphn1YWZkKj+QlH3ndCd+aee45inRzj8WSXKTqph49CiaUA
   ujun+HAEp57zcZrTIoKyYNX508ngEWRqUasF8aRN37SNoeWOsGpeH4JZO
   g==;
X-CSE-ConnectionGUID: GrWMUMXgRCeihJM3gMGeww==
X-CSE-MsgGUID: QNDaZU24SEiAlOB9gOE5jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94212705"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="94212705"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 00:22:46 -0700
X-CSE-ConnectionGUID: OCgLTDNcQc+i2MkkRhnhSQ==
X-CSE-MsgGUID: ze+nbZzkTA6u9tCtlTgwPQ==
X-ExtLoop1: 1
Received: from unknown (HELO [10.239.158.49]) ([10.239.158.49])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 00:22:29 -0700
Message-ID: <8494b247-64b5-4a04-b964-1f778c17acc3@intel.com>
Date: Wed, 1 Jul 2026 15:22:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/46] KVM: Provide generic interface for checking
 memory private/shared status
To: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev,
 binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com,
 david@kernel.org, jmattson@google.com, jthoughton@google.com,
 michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com,
 qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com,
 shivankg@amd.com, steven.price@arm.com, tabba@google.com,
 willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com,
 forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com,
 aneesh.kumar@kernel.org, liam@infradead.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94293-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca];
	FORGED_SENDER(0.00)[xiaoyao.li@intel.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencen
 t.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaoyao.li@intel.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C0D36EA9B6

On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Introduce a generic kvm_mem_is_private() interface using a static call to
> determine if a GFN is private. This allows the implementation for checking
> a GFN's private/shared status to be set at runtime.
> 
> In preparation for choosing implementations between a guest_memfd lookup
> and the existing VM attribute lookup, rename the existing
> VM-attribute-based check to kvm_vm_mem_is_private to emphasize that it
> looks up VM attributes.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

One nit below.

> ---
>   include/linux/kvm_host.h | 12 +++++++++++-
>   virt/kvm/kvm_main.c      | 15 +++++++++++++++
>   2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index eb26d4ea8945a..3915da2a61778 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2546,7 +2546,7 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>   bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>   					 struct kvm_gfn_range *range);
>   
> -static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> +static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>   {
>   	return kvm_get_vm_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>   }
> @@ -2557,6 +2557,16 @@ static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>   						  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>   						  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>   }
> +#endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */

Since it stops the original #define scope of 
CONFIG_KVM_VM_MEMORY_ATTRIBUTES here, ...

> +#ifdef kvm_arch_has_private_mem
> +typedef bool (kvm_mem_is_private_t)(struct kvm *kvm, gfn_t gfn);
> +DECLARE_STATIC_CALL(__kvm_mem_is_private, kvm_mem_is_private_t);
> +
> +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> +{
> +	return static_call(__kvm_mem_is_private)(kvm, gfn);
> +}
>   #else
>   static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>   {

... we need to update the comment of #endif to match with the new scope 
kvm_arch_has_private_mem as below. Or just delete the comment.

--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2572,7 +2572,7 @@ static inline bool kvm_mem_is_private(struct kvm 
*kvm, gfn_t gfn)
  {
         return false;
  }
-#endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
+#endif /* kvm_arch_has_private_mem */

  #ifdef CONFIG_KVM_GUEST_MEMFD
  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,

