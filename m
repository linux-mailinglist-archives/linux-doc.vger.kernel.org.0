Return-Path: <linux-doc+bounces-90959-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EadeN6yfIWq1KAEAu9opvQ
	(envelope-from <linux-doc+bounces-90959-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 17:54:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B046419B7
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 17:54:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=u5tYSEK0;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90959-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-90959-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C656F3135894
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 15:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C202D350D74;
	Thu,  4 Jun 2026 15:29:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2D533C1B4;
	Thu,  4 Jun 2026 15:29:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586973; cv=none; b=IyUyr7M/098p8/Dkb7MT6Xy6ouoRkpUEXpNFy+DOastyqzrxPUmctU7spjLFvh1YH2b7FKNsqD3yRo7p4/u0+fK9hefWg+hkt9cMuItJsZYG7FsR8sBuSgjHDtroSqIGA3fAF87TrHP09BI1+2Aj0BiDOq69blrLaqcfP7cpWoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586973; c=relaxed/simple;
	bh=bsr5b2gpdP7Z02h1Njek9qwNAkWcpQjmCyE6Te0xtUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfSfb2QN/TQjIYnCGmvvJlZrz5ktf0A7Qj9zps+ug+UG412h5m6a3h6VT0QzXPBz38Ip4uuiGeQ6JTeeeumhImce9pckXbOXBXMTy7oGb1TN3QlBnTvPf+83mg4MoR/ekZYblhwe8z6s4BS2aCr+BRtFgEiR0yxBvk9y16bZqzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=u5tYSEK0; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5F644993;
	Thu,  4 Jun 2026 08:29:26 -0700 (PDT)
Received: from [10.57.95.39] (unknown [10.57.95.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA02C3F86F;
	Thu,  4 Jun 2026 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780586971; bh=bsr5b2gpdP7Z02h1Njek9qwNAkWcpQjmCyE6Te0xtUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u5tYSEK0WD6FzVygVZ2inUsRE7KPNU6aiooHb7WFFytVH7MwdY+o3iH91d3sWJQym
	 G77ajQTrso6CQR5994wgSjTDCEuz6fiiAdnuNQFgcq6pkYJfcMWf+6whcM46UC6c2z
	 1s46Od/7JFr/FBCHQRzYdrTjrodXGQYEF9NX3838=
Message-ID: <9d15479e-e36b-4865-804c-7d93eb339e4e@arm.com>
Date: Thu, 4 Jun 2026 16:29:19 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 20/42] KVM: SEV: Make 'uaddr' parameter optional for
 KVM_SEV_SNP_LAUNCH_UPDATE
Content-Language: en-GB
To: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev,
 binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com,
 david@kernel.org, ira.weiny@intel.com, jmattson@google.com,
 jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org,
 pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com,
 rientjes@google.com, shivankg@amd.com, steven.price@arm.com,
 tabba@google.com, willy@infradead.org, wyihan@google.com,
 yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org,
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
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-20-2f0fae496530@google.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260522-gmem-inplace-conversion-v7-20-2f0fae496530@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90959-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:ira.weiny@intel.com,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.c
 om,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[suzuki.poulose@arm.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[64];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:mid,arm.com:from_mime,arm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4B046419B7

On 23/05/2026 01:18, Ackerley Tng via B4 Relay wrote:
> From: Michael Roth <michael.roth@amd.com>
> 
> For vm_memory_attributes=1, in-place conversion/population is not
> supported, so the initial contents necessarily must need to come
> from a separate src address, which is enforced by the current
> implementation. However, for vm_memory_attributes=0, it is possible for
> guest memory to be initialized directly from userspace by mmap()'ing the
> guest_memfd and writing to it while the corresponding GPA ranges are in
> a 'shared' state before converting them to the 'private' state expected
> by KVM_SEV_SNP_LAUNCH_UPDATE.
> 
> Update the handling/documentation for KVM_SEV_SNP_LAUNCH_UPDATE to allow
> for 'uaddr' to be set to NULL when vm_memory_attributes=0, which
> SNP_LAUNCH_UPDATE will then use to determine when it should/shouldn't
> copy in data from a separate memory location. Continue to enforce
> non-NULL for the original vm_memory_attributes=1 case.
> 
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> [Added src_page check in error handling path when the firmware command fails]
> [Dropped ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES]
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>




> ---
>   Documentation/virt/kvm/x86/amd-memory-encryption.rst | 15 +++++++++++----
>   arch/x86/kvm/svm/sev.c                               | 18 +++++++++++++-----
>   virt/kvm/kvm_main.c                                  |  1 +
>   3 files changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> index b2395dd4769de..43085f65b2d85 100644
> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> @@ -503,7 +503,8 @@ secrets.
>   
>   It is required that the GPA ranges initialized by this command have had the
>   KVM_MEMORY_ATTRIBUTE_PRIVATE attribute set in advance. See the documentation
> -for KVM_SET_MEMORY_ATTRIBUTES for more details on this aspect.
> +for KVM_SET_MEMORY_ATTRIBUTES/KVM_SET_MEMORY_ATTRIBUTES2 for more details on
> +this aspect.
>   
>   Upon success, this command is not guaranteed to have processed the entire
>   range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
> @@ -511,9 +512,15 @@ range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>   remaining range that has yet to be processed. The caller should continue
>   calling this command until those fields indicate the entire range has been
>   processed, e.g. ``len`` is 0, ``gfn_start`` is equal to the last GFN in the
> -range plus 1, and ``uaddr`` is the last byte of the userspace-provided source
> -buffer address plus 1. In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO,
> -``uaddr`` will be ignored completely.
> +range plus 1, and ``uaddr`` (if specified) is the last byte of the
> +userspace-provided source buffer address plus 1.
> +
> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
> +ignored completely. Otherwise, ``uaddr`` is required if
> +kvm.vm_memory_attributes=1 and optional if kvm.vm_memory_attributes=0, since
> +in the latter case guest memory can be initialized directly from userspace
> +prior to converting it to private and passing the GPA range on to this
> +interface.

Just to confirm, so the sev_gmem_prepare doesn't destroy the contents in 
the process of making it "private" ? i.e., the contents of a SNP shared
page are preserved while transitioning to "SNP Private" (via RMP
update).

Suzuki



>   
>   Parameters (in): struct  kvm_sev_snp_launch_update
>   
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 1a361f08c7a3d..e1dbc827c2807 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2343,7 +2343,15 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>   	int level;
>   	int ret;
>   
> -	if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page))
> +	/*
> +	 * For vm_memory_attributes=1, in-place conversion/population is not
> +	 * supported, so the initial contents necessarily need to come from a
> +	 * separate src address. For vm_memory_attributes=0, this isn't
> +	 * necessarily the case, since the pages may have been populated
> +	 * directly from userspace before calling KVM_SEV_SNP_LAUNCH_UPDATE.
> +	 */
> +	if (vm_memory_attributes &&
> +	    sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page)
>   		return -EINVAL;
>   
>   	ret = snp_lookup_rmpentry((u64)pfn, &assigned, &level);
> @@ -2390,7 +2398,7 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>   	 */
>   	if (ret && !snp_page_reclaim(kvm, pfn) &&
>   	    sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_CPUID &&
> -	    sev_populate_args->fw_error == SEV_RET_INVALID_PARAM) {
> +	    sev_populate_args->fw_error == SEV_RET_INVALID_PARAM && src_page) {
>   		void *src_vaddr = kmap_local_page(src_page);
>   		void *dst_vaddr = kmap_local_pfn(pfn);
>   
> @@ -2423,8 +2431,8 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
>   	if (copy_from_user(&params, u64_to_user_ptr(argp->data), sizeof(params)))
>   		return -EFAULT;
>   
> -	pr_debug("%s: GFN start 0x%llx length 0x%llx type %d flags %d\n", __func__,
> -		 params.gfn_start, params.len, params.type, params.flags);
> +	pr_debug("%s: GFN start 0x%llx length 0x%llx type %d flags %d src %llx\n", __func__,
> +		 params.gfn_start, params.len, params.type, params.flags, params.uaddr);
>   
>   	if (!params.len || !PAGE_ALIGNED(params.len) || params.flags ||
>   	    (params.type != KVM_SEV_SNP_PAGE_TYPE_NORMAL &&
> @@ -2481,7 +2489,7 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
>   
>   	params.gfn_start += count;
>   	params.len -= count * PAGE_SIZE;
> -	if (params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)
> +	if (src && params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)
>   		params.uaddr += count * PAGE_SIZE;
>   
>   	if (copy_to_user(u64_to_user_ptr(argp->data), &params, sizeof(params)))
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index ba195bb239aaa..3bf212fd99193 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -105,6 +105,7 @@ module_param(allow_unsafe_mappings, bool, 0444);
>   #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>   bool vm_memory_attributes = true;
>   module_param(vm_memory_attributes, bool, 0444);
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(vm_memory_attributes);
>   #endif
>   DEFINE_STATIC_CALL_RET0(__kvm_get_memory_attributes, kvm_get_memory_attributes_t);
>   EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_KEY(__kvm_get_memory_attributes));
> 


