Return-Path: <linux-doc+bounces-91056-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w1e0I5uSImqHaQEAu9opvQ
	(envelope-from <linux-doc+bounces-91056-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 11:10:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B0646B92
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 11:10:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=gjxPbq2p;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91056-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91056-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F2A7303035B
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 09:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B0347AF4D;
	Fri,  5 Jun 2026 09:07:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237843D45E7;
	Fri,  5 Jun 2026 09:07:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650434; cv=none; b=cDVQbmGva75fRzD2S8xKwH+CRRz1mNorCDT1f9jVmFv61O6NZIsmIMZtsoc5uW8SPiXbeZlyxYGwJ10wqITCie63ZSUUx8Astl44J69fAQ3qFZAcyBggBHHp3V++13U7AJemL6BiopLiAPMajEh5KWatVbq7nsi9djqANwWeCVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650434; c=relaxed/simple;
	bh=UXE7DC5dr6M+k24qAaywn7yvVqkTrb7vSLr7g8HR+1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjegiXMqQtZyRn1aGi/ACynk7eeB0NmQ78JnxyzmS+F1Hw8GLJZlDFEab6mlAcU2shBgIGtBCK7PI0rSEOfSwUDazr8zkw4XQw90zO89QuCUqYcJh/ZCOn53ASlRu1HOWKbqG068AWVykHLEx0tdFMS+L9b9b3aKJEFFCl4Bybc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gjxPbq2p; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 975364CDF;
	Fri,  5 Jun 2026 02:07:06 -0700 (PDT)
Received: from [10.57.92.75] (unknown [10.57.92.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 891843F86F;
	Fri,  5 Jun 2026 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780650431; bh=UXE7DC5dr6M+k24qAaywn7yvVqkTrb7vSLr7g8HR+1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gjxPbq2pHkOfACoMFtOdYFETh8vR9siYUcniNUVttHwVYajSgtBX2fT7r8/6nEQVU
	 3U+mruFBjhkJwoh7yfUyp4HzYXblvxOs58WoMrl+NRHN430tFwRzHI5G6iytvzgqmP
	 jhilsf5wSLNEWJnWJVKRp1qhWyGeYwpuFX4LwbOQ=
Message-ID: <85b8c177-b566-4e26-884c-9122e2455316@arm.com>
Date: Fri, 5 Jun 2026 10:06:58 +0100
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
To: Michael Roth <michael.roth@amd.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev,
 binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com,
 david@kernel.org, ira.weiny@intel.com, jmattson@google.com,
 jthoughton@google.com, oupton@kernel.org, pankaj.gupta@amd.com,
 qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com,
 shivankg@amd.com, steven.price@arm.com, tabba@google.com,
 willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com,
 forkloop@google.com, pratyush@kernel.org, aneesh.kumar@kernel.org,
 liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-20-2f0fae496530@google.com>
 <9d15479e-e36b-4865-804c-7d93eb339e4e@arm.com>
 <4muegrza5iyyhqx6wevdlssnb6wvlc4m4wmuz5hmd3xikkftc4@3e2lpuq6tjgr>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <4muegrza5iyyhqx6wevdlssnb6wvlc4m4wmuz5hmd3xikkftc4@3e2lpuq6tjgr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[suzuki.poulose@arm.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-91056-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michael.roth@amd.com,m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:ira.weiny@intel.com,m:jmattson@google.com,m:jthoughton@google.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.c
 om,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[64];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:mid,arm.com:from_mime,arm.com:dkim,vger.kernel.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 313B0646B92

On 04/06/2026 21:11, Michael Roth wrote:
> On Thu, Jun 04, 2026 at 04:29:19PM +0100, Suzuki K Poulose wrote:
>> On 23/05/2026 01:18, Ackerley Tng via B4 Relay wrote:
>>> From: Michael Roth <michael.roth@amd.com>
>>>
>>> For vm_memory_attributes=1, in-place conversion/population is not
>>> supported, so the initial contents necessarily must need to come
>>> from a separate src address, which is enforced by the current
>>> implementation. However, for vm_memory_attributes=0, it is possible for
>>> guest memory to be initialized directly from userspace by mmap()'ing the
>>> guest_memfd and writing to it while the corresponding GPA ranges are in
>>> a 'shared' state before converting them to the 'private' state expected
>>> by KVM_SEV_SNP_LAUNCH_UPDATE.
>>>
>>> Update the handling/documentation for KVM_SEV_SNP_LAUNCH_UPDATE to allow
>>> for 'uaddr' to be set to NULL when vm_memory_attributes=0, which
>>> SNP_LAUNCH_UPDATE will then use to determine when it should/shouldn't
>>> copy in data from a separate memory location. Continue to enforce
>>> non-NULL for the original vm_memory_attributes=1 case.
>>>
>>> Signed-off-by: Michael Roth <michael.roth@amd.com>
>>> [Added src_page check in error handling path when the firmware command fails]
>>> [Dropped ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES]
>>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>>
>>
>>
>>
>>> ---
>>>    Documentation/virt/kvm/x86/amd-memory-encryption.rst | 15 +++++++++++----
>>>    arch/x86/kvm/svm/sev.c                               | 18 +++++++++++++-----
>>>    virt/kvm/kvm_main.c                                  |  1 +
>>>    3 files changed, 25 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>>> index b2395dd4769de..43085f65b2d85 100644
>>> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>>> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>>> @@ -503,7 +503,8 @@ secrets.
>>>    It is required that the GPA ranges initialized by this command have had the
>>>    KVM_MEMORY_ATTRIBUTE_PRIVATE attribute set in advance. See the documentation
>>> -for KVM_SET_MEMORY_ATTRIBUTES for more details on this aspect.
>>> +for KVM_SET_MEMORY_ATTRIBUTES/KVM_SET_MEMORY_ATTRIBUTES2 for more details on
>>> +this aspect.
>>>    Upon success, this command is not guaranteed to have processed the entire
>>>    range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>>> @@ -511,9 +512,15 @@ range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>>>    remaining range that has yet to be processed. The caller should continue
>>>    calling this command until those fields indicate the entire range has been
>>>    processed, e.g. ``len`` is 0, ``gfn_start`` is equal to the last GFN in the
>>> -range plus 1, and ``uaddr`` is the last byte of the userspace-provided source
>>> -buffer address plus 1. In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO,
>>> -``uaddr`` will be ignored completely.
>>> +range plus 1, and ``uaddr`` (if specified) is the last byte of the
>>> +userspace-provided source buffer address plus 1.
>>> +
>>> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
>>> +ignored completely. Otherwise, ``uaddr`` is required if
>>> +kvm.vm_memory_attributes=1 and optional if kvm.vm_memory_attributes=0, since
>>> +in the latter case guest memory can be initialized directly from userspace
>>> +prior to converting it to private and passing the GPA range on to this
>>> +interface.
>>
>> Just to confirm, so the sev_gmem_prepare doesn't destroy the contents in the
>> process of making it "private" ? i.e., the contents of a SNP shared
>> page are preserved while transitioning to "SNP Private" (via RMP
>> update).
> 
> sev_gmem_prepare() does sort of destroy contents since it finalizes the
> shared->private conversion which puts the page in an unusable state
> until the guest 'accepts' it as private memory and re-initializes the
> contents.
> 
> But that's run-time, when the guest is doing conversions. The
> documentation here is relating to initialization time when we are
> setting up the initial pre-encrypted/pre-measured guest memory image,
> via SNP_LAUNCH_UPDATE. That path calls into kvm_gmem_populate(), and it
> is then sev_gmem_post_populate() callback that actually finalizes the
> shared->private conversion. The sev_gmem_prepare() hook doesn't get used
> in this flow (kvm_gmem_populate() calls __kvm_gmem_get_pfn() which skips
> preparation).

Thanks, thats the bit I was missing. Skipping the prepare path, with 
__kvm_gmem_get_pfn(). I was under the assumption that 
kvm_arch_gmem_prepare() was called for all PFNs allocated from gmem
and how SNP was handling this populate case.


Thanks
Suzuki


> 
> -Mike
> 
>>
>> Suzuki
>>
>>

