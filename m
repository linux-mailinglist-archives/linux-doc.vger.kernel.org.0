Return-Path: <linux-doc+bounces-3255-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8473F7FB2EF
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 08:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17366B20DC8
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 07:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532FF13AEF;
	Tue, 28 Nov 2023 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dsJMezrR"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3431A5
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701157194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLrNRkdD5Hr4y2mW5Po+XDD+kga+nzWJCxtSKJ7NmZ4=;
	b=dsJMezrRMQeLbPQx3sg1YKRBxEGwrNOJAVh1xZzKec/LDUEijP1DUJKygc/GrgUrox/+z+
	ucyrNu/ERu5kCHTUwN35R0vbV/vsrOYPckiid0wU4mnRg2tmvLtymMOSqVLkTuEitDrhCo
	19TT5jj9qy0LEcv0OmB3U19VYh1gVfQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-z_OxQ8zxMsCS9A5IbmM-og-1; Tue, 28 Nov 2023 02:39:53 -0500
X-MC-Unique: z_OxQ8zxMsCS9A5IbmM-og-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3330881541eso823290f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701157192; x=1701761992;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLrNRkdD5Hr4y2mW5Po+XDD+kga+nzWJCxtSKJ7NmZ4=;
        b=Mgb/PpZizPTXviJ+LeA4EmJ746mj0hlpoZ6tqNRhRLKr84aSkIpIHlvp0qpjsCrzDN
         YvSj6VM5QUiXCsCfpykYxK31pEC+M1HYRfY0VMZFa2P3qdEOnsoEzerxvaOktDnjWcAW
         0pw5/Nji/ppsTzcJoVlgL2K3OFDwNNcETS61YOFEJt+tQCXvJlDBAFOS7ChtlTCMWkwn
         cjraLmISuGEZFKE5OQJLEnOmP8N0CSB5aeM3td+yL10tMg9RflZRSiAMgtnLyk/KsL6J
         SYtdMEitGcHKw+voNEt2i0En9arvde1RYUc3G8k358jG7hVQcK8zwS+QBrvgZNFD2m6g
         jJiw==
X-Gm-Message-State: AOJu0YxukhziG914pP6Wn8yP8pULrXEQYssWuRZC9T60chLMBSFJ5M1c
	WdLjibN/g1g3aJFN6781w6pTdqY4ygte1M3Qktbho/jTeroe9eLXlo/HZ6+gOH8ftbFHaqQodon
	xLSvmM6i4Wa5pKrkHGuRp
X-Received: by 2002:adf:da45:0:b0:333:d38:9cf8 with SMTP id r5-20020adfda45000000b003330d389cf8mr703327wrl.23.1701157192442;
        Mon, 27 Nov 2023 23:39:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERlzB4vdViVC/ZzK0126j8AEfeNbvrpu7qTpdFP9K+CAsLwSGT0XYxI2khjFZG7X1sLqDpUg==
X-Received: by 2002:adf:da45:0:b0:333:d38:9cf8 with SMTP id r5-20020adfda45000000b003330d389cf8mr703318wrl.23.1701157192138;
        Mon, 27 Nov 2023 23:39:52 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d4a8e000000b00332e073f12bsm14064219wrq.19.2023.11.27.23.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 23:39:51 -0800 (PST)
Message-ID: <31cd6a37f565e07f3890027b3b3305a225f84956.camel@redhat.com>
Subject: Re: [RFC 17/33] KVM: x86/mmu: Allow setting memory attributes if
 VSM enabled
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com,
 corbert@lwn.net,  kys@microsoft.com, haiyangz@microsoft.com,
 decui@microsoft.com, x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 09:39:49 +0200
In-Reply-To: <20231108111806.92604-18-nsaenz@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-18-nsaenz@amazon.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-11-08 at 11:17 +0000, Nicolas Saenz Julienne wrote:
> VSM is also a user of memory attributes, so let it use
> kvm_set_mem_attributes().
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index feca077c0210..a1fbb905258b 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -7265,7 +7265,8 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>  	 * Zapping SPTEs in this case ensures KVM will reassess whether or not
>  	 * a hugepage can be used for affected ranges.
>  	 */
> -	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
> +	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm) &&
> +			 !kvm_hv_vsm_enabled(kvm)))
>  		return false;

IMHO on the long term, memory attributes should either be always enabled,
or the above check should became more generic.

But otherwise this patch looks reasonable.

>  
>  	return kvm_unmap_gfn_range(kvm, range);
> @@ -7322,7 +7323,8 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>  	 * a range that has PRIVATE GFNs, and conversely converting a range to
>  	 * SHARED may now allow hugepages.
>  	 */
> -	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
> +	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm) &&
> +			 !kvm_hv_vsm_enabled(kvm)))
>  		return false;
>  
>  	/*

Best regards,
	Maxim Levitsky


