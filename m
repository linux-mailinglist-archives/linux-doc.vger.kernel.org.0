Return-Path: <linux-doc+bounces-42002-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C922A78052
	for <lists+linux-doc@lfdr.de>; Tue,  1 Apr 2025 18:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D2873AFBE7
	for <lists+linux-doc@lfdr.de>; Tue,  1 Apr 2025 16:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC5B20D519;
	Tue,  1 Apr 2025 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wu7VTEU4"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C308C20D502
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524050; cv=none; b=Y8IUm6mvkSQNci1pQ2NJX5EKtBqQ6j3621k9yXCeQ2CP9QAOTbqxVFWQWvaD+QdsOQEVF8H3HPtxIYvj5MkUu38770VHn0clKkIqiYjYHkl1ENMkK13Iy/ULoIuZxPIYb0QEs84vzwCj0EbCNVn42JCFdvQD4r0FC35gUd2uEM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524050; c=relaxed/simple;
	bh=1meiduzWUZTdexyub6lEI3SN1VFkEEz20dHThPB2e0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gv30bbHs32qUMCACjP/KHjfMUNWyp9dAZxLnEqpOvSoDM9vDo9/UyJVYUV1G8m4gFdGtYY208w8cUSKu1idLbxJUQVgH2msvqip0e+8kzd3SpIB7iq4nXkLf+g8YNwESD1r3mJhLfzePRmj2F3SXtS4PAKUpj4CwN/qOWchKn+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wu7VTEU4; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 1 Apr 2025 09:13:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743524035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uY+nwOwz9t1SKnSkwJ4vrIlcfWn/0vv+GTXW2UOhRoc=;
	b=Wu7VTEU4JOgAUzleJPyVD0sDPlBmk7FuNuSVR8JUItg3UPgPiyiHBXbWAwJIwMgqHqbaMG
	bIApukatadPcn31vKMAfrcjliApZErlPuNPmjBoC+uN+leG3EwssYdemP9TVXA8QHjTO46
	Hm1fIY7dUGWigQp0DOkZ/TUOQdC01fM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	yangyicong@hisilicon.com, tangchengchang@huawei.com
Subject: Re: [PATCH v2 6/6] KVM: arm64: Handle DABT caused by LS64*
 instructions on unsupported memory
Message-ID: <Z-wQuJAefT3xNipl@linux.dev>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-7-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331094320.35226-7-yangyicong@huawei.com>
X-Migadu-Flow: FLOW_OUT

Hi Yicong,

On Mon, Mar 31, 2025 at 05:43:20PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> If FEAT_LS64WB not supported, FEAT_LS64* instructions only support
> to access Device/Uncacheable memory, otherwise a data abort for
> unsupported Exclusive or atomic access (0x35) is generated per spec.
> It's implementation defined whether the target exception level is
> routed and is possible to implemented as route to EL2 on a VHE VM.
> Per DDI0487K.a Section C3.2.12.2 Single-copy atomic 64-byte load/store:
> 
>   The check is performed against the resulting memory type after all
>   enabled stages of translation. In this case the fault is reported
>   at the final enabled stage of translation.

Just use section citations, this quote isn't very useful since it
doesn't adequately describe the different IMPLEMENTATION DEFINED
behavior.

> If it's implemented as generate the DABT to the final enabled stage
> (stage-2), inject a DABT to the guest to handle it.

This should be ordered _before_ the patch that exposes FEAT_LS64* to the
VM.

> @@ -1658,6 +1658,25 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	if (exec_fault && device)
>  		return -ENOEXEC;
>  
> +	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(vcpu))) {
> +		/*
> +		 * Target address is normal memory on the Host. We come here
> +		 * because:
> +		 * 1) Guest map it as device memory and perform LS64 operations
> +		 * 2) VMM report it as device memory mistakenly
> +		 * Warn the VMM and inject the DABT back to the guest.
> +		 */
> +		if (!device)
> +			kvm_err("memory attributes maybe incorrect for hva 0x%lx\n", hva);

No, kvm_err() doesn't warn the VMM at all. KVM should never log anything
for a situation that can be caused by the guest, e.g. option #1 in your
comment.

Keep in mind that data aborts with DFSC == 0x35 can happen for a lot
more than LS64 instructions, e.g. an atomic on a Device-* mapping.

> @@ -1919,6 +1939,21 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  			goto out_unlock;
>  		}
>  
> +		/*
> +		 * If instructions of FEAT_{LS64, LS64_V} operated on
> +		 * unsupported memory regions, a DABT for unsupported
> +		 * Exclusive or atomic access is generated. It's
> +		 * implementation defined whether the exception will
> +		 * be taken to, a stage-1 DABT or the final enabled
> +		 * stage of translation (stage-2 in this case as we
> +		 * hit here). Inject a DABT to the guest to handle it
> +		 * if it's implemented as a stage-2 DABT.
> +		 */
> +		if (esr_fsc_is_excl_atomic_fault(esr)) {
> +			kvm_inject_dabt_excl_atomic(vcpu, kvm_vcpu_get_hfar(vcpu));
> +			return 1;
> +		}
> +

A precondition of taking such a data abort is having a valid mapping at
stage-2. If KVM can't resolve the HVA of the fault then there couldn't
have been a stage-2 mapping.

Thanks,
Oliver

