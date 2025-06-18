Return-Path: <linux-doc+bounces-49659-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C4ADF6F9
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 21:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 694AA3BCAAD
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 19:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2533721767C;
	Wed, 18 Jun 2025 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rkr7lOkw"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70DC215F56
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750275663; cv=none; b=qW2UaIcv5dfrohgQEx79+i9qYyea5a1ZuX3nWy5R9gF3+k52Ln/WOyFIur/i1v2u+mWjRJVI2PtXrxTX/ng7hzApODxPORujFmBL4wHRsTCcvuux0pVvapsagaAD1/mVX5s5S1l/q28gDqPDUiVCxwm1St/SboshCU1PByNRlmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750275663; c=relaxed/simple;
	bh=pUjBkPGAeywR5zxlE4sDl27rsxA0kyDlilz2o9WFtRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlGPdadbUCMSh30BethkG2KxDbVeF9xTvtdtwuGN1qRkj3KkRBz4pgLu+sdpWiGy+mSZtY4BGVIfnqrtX3V4myrcfNuZvl7Td5agHVT7kcxSAxoIn03Y5s4GCCkJHYpMGvGkL5VI/7tc69a8BoaKcyTuUhNnnrMEthzXEnyHCXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rkr7lOkw; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 18 Jun 2025 12:40:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750275658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ28BX1PGmEsOK66iRJR9ufuVy9us1fhYiSSQpunOdI=;
	b=rkr7lOkw8dMr4j4t/vQfAQjKcKL1YrnIOUw/TNGMed4UVCLGOe2tByQPKXjqmKmSRGBCKX
	Uo3l7kVm8ztcoaZdGh2Zr542A6B8QeL3//5VJoC6eb4GDCMyaXyop7Bo5wD9xH8emEMYnu
	P2MDpIUYfbIHfUp9bpGvn+TU2rq9YbE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM
 Userfaults
Message-ID: <aFMWQ5_zMXGTCE98@linux.dev>
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618042424.330664-5-jthoughton@google.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 18, 2025 at 04:24:13AM +0000, James Houghton wrote:
> KVM Userfault consists of a bitmap in userspace that describes which
> pages the user wants exits on (when KVM_MEM_USERFAULT is enabled). To
> get those exits, the memslot where KVM_MEM_USERFAULT is being enabled
> must drop (at least) all of the translations that the bitmap says should
> generate faults. Today, simply drop all translations for the memslot. Do
> so with a new arch interface, kvm_arch_userfault_enabled(), which can be
> specialized in the future by any architecture for which optimizations
> make sense.
> 
> Make some changes to kvm_set_memory_region() to support setting
> KVM_MEM_USERFAULT on KVM_MEM_GUEST_MEMFD memslots, including relaxing
> the retrictions on guest_memfd memslots from only deletion to no moving.
> 
> Signed-off-by: James Houghton <jthoughton@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

> +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> +bool kvm_do_userfault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)

The polarity of the return here feels weird. If we want a value of 0 to
indicate success then int is a better return type.

> +{
> +	struct kvm_memory_slot *slot = fault->slot;
> +	unsigned long __user *user_chunk;
> +	unsigned long chunk;
> +	gfn_t offset;
> +
> +	if (!kvm_is_userfault_memslot(slot))
> +		return false;
> +
> +	offset = fault->gfn - slot->base_gfn;
> +	user_chunk = slot->userfault_bitmap + (offset / BITS_PER_LONG);
> +
> +	if (__get_user(chunk, user_chunk))
> +		return true;
> +

I see that the documentation suggests userspace perform a store-release
to update the bitmap. That's the right idea but we need a load-acquire
on the consumer side for that to do something meaningful.

> +	if (!test_bit(offset % BITS_PER_LONG, &chunk))
> +		return false;
> +
> +	kvm_prepare_memory_fault_exit(vcpu, fault);
> +	vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_USERFAULT;
> +	return true;
> +}
> +#endif
> +
>  int __attribute__((weak)) kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  						  struct kvm_enable_cap *cap)
>  {
> -- 
> 2.50.0.rc2.692.g299adb8693-goog
>

Thanks,
Oliver

