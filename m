Return-Path: <linux-doc+bounces-64709-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A6C0DBD0
	for <lists+linux-doc@lfdr.de>; Mon, 27 Oct 2025 14:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32E894FBF80
	for <lists+linux-doc@lfdr.de>; Mon, 27 Oct 2025 12:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8331F25522B;
	Mon, 27 Oct 2025 12:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o+X/eNhL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50085251795
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569475; cv=none; b=paUau/BaU8xOo8hmoa2SauS/L+bmGnVr37K3K5gefXCHXtIFCvKwECVZPSeT+E5AHZm66Si5qplL7qyxPudm+qCZpqoOeSnBKiir6ipPAiiq2XZNJe4XuSuXbDF05Wlcrgwej2xb2IZSXC6ks/xfWeOp8Qnl+mmQOD/eotn9nKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569475; c=relaxed/simple;
	bh=IdPC9YfGWevFoR/dZEXyXJZ/l9vGGOMt1FuwCMwOERE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MQetQKXKzwCjz3iCH5KyD3XKNRPKe79qOfkF97aGUGSft+iFdA2TYLkSFtoPRBxRYl1ANinSa526kl+6LVqmJUeAjnxtdAV53leDpjlbe0WAh+/OX6TXbVyhyYVWSNdK1DruQAsi8pCVbzo2ea7LhipaD9Rc3cXs1uiXv5eO0WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o+X/eNhL; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so3714890a91.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761569473; x=1762174273; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AyFD6g3VBvR49cMfgS8niFKClPpT1OiUWbHICnlNzwM=;
        b=o+X/eNhL+8Dze7uoRWYx5BwWklNaYiRtEDdNz8UjGzcESjQ1CWyjuWZmoXakGbGgQu
         yOU2e24UqX011jKq+QwKdstbQDKkCTVW+TNDCVRCbZrwzD+rHRv+3qdNH2DJIjyXUh2H
         VGoG7V26mZ5ji3jaXTA/+noNjeElwK+4sdKJcMYxCV57kM8Z2YwCICfgJ43b7BuWcNuo
         3W4qn6uTm3qWnWOrGMWegQjeEvOUPgntJQt3JT2dT4/JtojgaMoIrt5JvzueFovc6E1G
         bw/jgu8rahvFe51OEjGk+GGF4vPVoAha6QZ2+OZo5h5t+6dqSRpmNUn2STpeirQSbZ+q
         FZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569473; x=1762174273;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AyFD6g3VBvR49cMfgS8niFKClPpT1OiUWbHICnlNzwM=;
        b=nhqk7izKGPLZr003pH6rXxdN3Cd+boO4EBpakV5YbiLfQOLFvzMXAIquPGGWnbYIMf
         GI6b8gIRDwoMqmTkPyw/bIZeSQ6G7eQfk1fAkDW6l5inEivI6X6NjF5VnN++OlhqFFlS
         36+6xD7u6U/t0AIApg+HvJT7eoXERs9pXwm/4pWzrVnS+CApluii2lPmAZo17tN8mVZy
         G91D7cQ0q61a/Nk1XIkTS/eTjaXg7D8k9o1V14L3fuwxY+AZcfC9npVu6Y2o8WoFz47S
         DgCDgoUbkL9X3s05jAAHyLDmI3RlQY1kY82xpu6jDrYC/o1EQHtd071GvGufqFogvn8C
         20kg==
X-Forwarded-Encrypted: i=1; AJvYcCVRDIOAp/1q6xEiakt4cOvR/hfqACEsg1ekjUzYMBdW2oEwA/w/LZfeg+OnfBsbz7zJQrTmVfR3W24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUCEd93lglVBXHSWXNjyo0bDDYv7+udE+fl9GT6Jpx40QVpw8v
	lBD21GhOWcRmXCAKbZ+ZyDXL2LQ/6hA1NJUVvZa3c/qVzmuiixrb8AOAnRHWuecmi3xd55y+ins
	y9MJj0fy+O9XSuY31WTwMtI4vvA==
X-Google-Smtp-Source: AGHT+IHpzLMnxvGPeWk8f7xz/g/ATtWvyisZTfCa5aljb0u8eC/vwPSWrWHsFNePjKreSc0j11QMICkHErRNy2JiYA==
X-Received: from pjbcp12.prod.google.com ([2002:a17:90a:fb8c:b0:339:ee99:5e9b])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d8f:b0:335:2eee:19dc with SMTP id 98e67ed59e1d1-33bcf8f94b6mr44662881a91.28.1761569472526;
 Mon, 27 Oct 2025 05:51:12 -0700 (PDT)
Date: Mon, 27 Oct 2025 05:51:10 -0700
In-Reply-To: <aPvDEl0kGdZfcAD9@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1760731772.git.ackerleytng@google.com> <727482ec42baa50cb1488ad89d02e732defda3db.1760731772.git.ackerleytng@google.com>
 <diqzldl0dz5f.fsf@google.com> <aPvDEl0kGdZfcAD9@google.com>
Message-ID: <diqza51cjyo1.fsf@google.com>
Subject: Re: [RFC PATCH v1 16/37] KVM: selftests: Add support for mmap() on
 guest_memfd in core library
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: cgroups@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, akpm@linux-foundation.org, 
	binbin.wu@linux.intel.com, bp@alien8.de, brauner@kernel.org, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@intel.com, dave.hansen@linux.intel.com, david@redhat.com, 
	dmatlack@google.com, erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, 
	haibo1.xu@intel.com, hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com, 
	hughd@google.com, ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz, 
	james.morse@arm.com, jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, 
	jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com, 
	jun.miao@intel.com, kai.huang@intel.com, keirf@google.com, 
	kent.overstreet@linux.dev, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, 
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com, 
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, qperret@google.com, 
	richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org, 
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Oct 24, 2025, Ackerley Tng wrote:
>> Ackerley Tng <ackerleytng@google.com> writes:
>> 
>> > From: Sean Christopherson <seanjc@google.com>
>> >
>> > Accept gmem_flags in vm_mem_add() to be able to create a guest_memfd within
>> > vm_mem_add().
>> >
>> > When vm_mem_add() is used to set up a guest_memfd for a memslot, set up the
>> > provided (or created) gmem_fd as the fd for the user memory region. This
>> > makes it available to be mmap()-ed from just like fds from other memory
>> > sources. mmap() from guest_memfd using the provided gmem_flags and
>> > gmem_offset.
>> >
>> > Add a kvm_slot_to_fd() helper to provide convenient access to the file
>> > descriptor of a memslot.
>> >
>> > Update existing callers of vm_mem_add() to pass 0 for gmem_flags to
>> > preserve existing behavior.
>> >
>> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>> > [For guest_memfds, mmap() using gmem_offset instead of 0 all the time.]
>> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> > ---
>> >  tools/testing/selftests/kvm/include/kvm_util.h |  7 ++++++-
>> >  tools/testing/selftests/kvm/lib/kvm_util.c     | 18 ++++++++++--------
>> >  .../kvm/x86/private_mem_conversions_test.c     |  2 +-
>> >  3 files changed, 17 insertions(+), 10 deletions(-)
>> >
>> > 
>> > [...snip...]
>> > 
>> > @@ -1050,13 +1049,16 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>> >  	}
>> >  
>> >  	region->fd = -1;
>> > -	if (backing_src_is_shared(src_type))
>> > +	if (flags & KVM_MEM_GUEST_MEMFD && gmem_flags & GUEST_MEMFD_FLAG_MMAP)
>> > +		region->fd = kvm_dup(gmem_fd);
>> > +	else if (backing_src_is_shared(src_type))
>> >  		region->fd = kvm_memfd_alloc(region->mmap_size,
>> >  					     src_type == VM_MEM_SRC_SHARED_HUGETLB);
>> >  
>> 
>> Doing this makes it hard to test the legacy dual-backing case.
>> 
>> It actually broke x86/private_mem_conversions_test for the legacy
>> dual-backing case because there's no way to mmap or provide a
>> userspace_address from the memory provider that is not guest_memfd, as
>> determined by src_type.
>
> Yes there is.  This patch is a giant nop.  The only thing that the core library
> doesn't support is mmap() on guest_memfd *and* the other src_type, and IMO that
> is big "don't care", because KVM doesn't even support that combination:
>
> 	if (kvm_gmem_supports_mmap(inode))
> 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
>

Makes sense.

> I mean, we _could_ test that KVM ignores the hva for mapping, but that's a
> different and unique test entirely.
>
> I did break x86/private_mem_conversions_test (I could have sworn I tested, *sigh*),
> but the bug is in:
>
>   KVM: selftests: Provide function to look up guest_memfd details from gpa
>
> not here.  And it's a trivial /facepalm-style fix:
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index ee5b63f7cb50..23a8676fee6d 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1680,7 +1680,7 @@ int kvm_gpa_to_guest_memfd(struct kvm_vm *vm, vm_paddr_t gpa, off_t *fd_offset,
>         gpa_offset = gpa - region->region.guest_phys_addr;
>         *fd_offset = region->region.guest_memfd_offset + gpa_offset;
>         *nr_bytes = region->region.memory_size - gpa_offset;
> -       return region->fd;
> +       return region->region.guest_memfd;
>  }
>  
>  /* Create an interrupt controller chip for the specified VM. */

This works. Thanks!

