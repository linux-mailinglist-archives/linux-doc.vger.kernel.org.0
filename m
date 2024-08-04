Return-Path: <linux-doc+bounces-22132-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D103946D65
	for <lists+linux-doc@lfdr.de>; Sun,  4 Aug 2024 10:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E77F1C21154
	for <lists+linux-doc@lfdr.de>; Sun,  4 Aug 2024 08:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606121CD13;
	Sun,  4 Aug 2024 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ara32mym"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006A11B94F
	for <linux-doc@vger.kernel.org>; Sun,  4 Aug 2024 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722759490; cv=none; b=mfMpxNFpdZi8X5vhp4OfYjQX2sQ2eL/xmV0j+817Z/MK4XiEt1g3iDoz7o/hCKlw3jB0Nrxt5l0Di+rOwjhbEkvw4gHGRWnYVyoTEjDns3me7PIOQ7qXFfq4ydl/YzkuKINhBxAhafoByGuDc0sPIQSiNBDKE7/EbPX3LLOWkYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722759490; c=relaxed/simple;
	bh=ZYRZnef0yxaS5bV9saKBDKO14pgVNfmF9j2Bk9jzlJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFTB3ZSDEu1YrDNJp6Zx5qFY8gQ0rLXsU1+rQfhLZkGiF2xfWqsKCtJS+AArmuJJVjK7gd3sbfwGMxZRuwSzXw2cn5wsQQpz6tp5devM/npD1F0sIXmLl2YDKRytZqwTXwBsibHR05cfvJeHWTwYkB5v46OtCgaTkejsBBjmBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ara32mym; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <401bebca-9637-4626-901f-e46b2d058768@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722759484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BR8nESmyux7KPrlPtWm/y86ziQt1dIfCuk1340ZZ33o=;
	b=ara32mymUPXn1tDy4bLqkZuYghp73ABnXKvkf214k9mbGPs4NlINmZEHazKOB+P84dAFc7
	luVgeGbq8L7ea+dNC0SpntN3dVFowg3obE63kXZvD+oCKpN2lmqh2cwtEnOGvKKkYCyhrp
	kwRXT5GHI+wbOmfqrTETGUTO+1NIvio=
Date: Sun, 4 Aug 2024 16:17:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] docs: KVM: Fix register ID of SPSR_FIQ
To: Takahiro Itazuri <itazur@amazon.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Dave Martin <Dave.Martin@arm.com>, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zulinx86@gmail.com,
 kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, glider@google.com
References: <20230606154628.95498-1-itazur@amazon.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20230606154628.95498-1-itazur@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

+Cc kvmarm people and the list ...

On 2023/6/6 23:46, Takahiro Itazuri wrote:
> Fixes the register ID of SPSR_FIQ.
> 
> SPSR_FIQ is a 64-bit register and the 64-bit register size mask is
> 0x0030000000000000ULL.
> 
> Fixes: fd3bc912d3d1 ("KVM: Documentation: Document arm64 core registers in detail")
> Signed-off-by: Takahiro Itazuri <itazur@amazon.com>

... since you're fixing the encoding of an *arm64* core register and the
mentioned commit fd3bc912d3d1 was merged via the kvmarm tree. I guess
this is the main reason why this patch has been blocked on the list for
over a year, as pointed out recently by Alexander [*].

> 
> ---
> Changes from v1
> - Add a description about the 64-bit register size mask in the commit
>   message.
> - Link: https://lore.kernel.org/all/20230410121927.26953-1-itazur@amazon.com/
> 
> ---
>  Documentation/virt/kvm/api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index a5c803f39832..65dad2581751 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -2535,7 +2535,7 @@ Specifically:
>    0x6030 0000 0010 004a SPSR_ABT    64  spsr[KVM_SPSR_ABT]
>    0x6030 0000 0010 004c SPSR_UND    64  spsr[KVM_SPSR_UND]
>    0x6030 0000 0010 004e SPSR_IRQ    64  spsr[KVM_SPSR_IRQ]
> -  0x6060 0000 0010 0050 SPSR_FIQ    64  spsr[KVM_SPSR_FIQ]
> +  0x6030 0000 0010 0050 SPSR_FIQ    64  spsr[KVM_SPSR_FIQ]
>    0x6040 0000 0010 0054 V0         128  fp_regs.vregs[0]    [1]_
>    0x6040 0000 0010 0058 V1         128  fp_regs.vregs[1]    [1]_
>    ...

The change itself looks reasonable.

Thanks,
Zenghui

[*] https://lore.kernel.org/all/20240802132036.914457-1-glider@google.com

