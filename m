Return-Path: <linux-doc+bounces-64267-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB3BFE969
	for <lists+linux-doc@lfdr.de>; Thu, 23 Oct 2025 01:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D69D43A71BD
	for <lists+linux-doc@lfdr.de>; Wed, 22 Oct 2025 23:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DC23081BF;
	Wed, 22 Oct 2025 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="StTRIB3i"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302EC306495
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 23:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761175854; cv=none; b=MoA8hbQPPOpthu7zn9BVxXUzKUwNg1BvdKIsOvYRqHl4udeDx0s3i08AfaXP/I7q8LeOCFQ87r73y8QNQJ5s3IjXZsdV/K/CEYk07ZLUV789IDiypj1/UJLY8hp1T5MCOAsK7wmmiJ2xX2sHPYr2PuNCCnxBVCXsjBkp5dcNGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761175854; c=relaxed/simple;
	bh=FJ5dPWeuTDRG2VX7FLyUJF0mD0hnFePTCkWS6C5Q3EA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JdXv3tVDicZ5RL/UqQ0UjZdNEFomY5SlC/cAOkdzVEhbnkV9ZmA5Cr9W8rYMoPfRzpoIeZSsh8laIB04lzhD1cPpnmr9IjcFJOUJyfcBUKNsO6a79wGxFGHSkjWY12WxVBbdeHeaTZ5r2pQDxcfAel2s3Sgn0xIYARghQEuy9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=StTRIB3i; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b630753cc38so277194a12.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 16:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761175851; x=1761780651; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jEiO6iBxzy6fxnsgwrsRYGtWZsrwu6A5X9ZJxUc05s=;
        b=StTRIB3ia4VotH0oNfRldoeYZy7DFSoBOunCAH3g3FV7Z3yvRspTKvfuj7IksqTWM0
         R0IGmqesgalhEVemC6wY0/JcqcHSCrVBcdV27rgotEr/LL5jPQmnubqvILp06jqVzMkP
         P+aBREszcp1bnHDr7+/rtkyO1qHtbSDdJ9O4+d5lvjOF/AoISE8PaTDxYhB+A1t2XLqa
         hsUhjohqIeoIO4W2CenPOOkeusZFMnDYxB/RCpKwCXevQ1om0P+6YrwQBuJFqIwZZ6Ze
         RavicgAg0YBneomDyrLWdIZZFVDGKwPcbwbJ1IzZBqTsOOPFnRTm6e3kui9aNwTZ6Sct
         Sqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175851; x=1761780651;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jEiO6iBxzy6fxnsgwrsRYGtWZsrwu6A5X9ZJxUc05s=;
        b=UJ021LYUKDLDMgXk1xf64CALHiNMwH1KerTzqr9vcgeY67SKqpVMhGMixG85HJsFdV
         f0t1KQNvA8EK2X8+/p65ErBzlA74PEW+Kf+j5/UFFtCxQDLKgzl2Q3eZvU9OKRdM+e14
         gv2z06Kbccv7FVKiwRg93JCZkU6lxR2px8RBEPzaY9HjDcTKyUfnf/SDmMeMkqC9Tg/o
         Ip4TlNBCwFbPVjhtaogPM30ICjsxBcS2YS3E4GsDo6k7GcfWQGaByEZykixf2aQU1EOc
         ImuVLI/lO/7q86DRapDNMnfCGTeRB4gIyD+AEOdZ7iPWNnxBHcW06eJ/3WvV6oPhQyr2
         cs+A==
X-Forwarded-Encrypted: i=1; AJvYcCVnuBmmfHxM/gTGZBoOsabeScBBK1jLGiC3yWteC1hIA+UQbLTSGxvM1SP75+/jgv1s8RE8Xl2VVrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxXoUFgWDfR2x2VivdcvZD3MFS/y1QJBqpYQ9p8+1mspRB9fSn
	3iyJ5Zx/T5H+HBUYkJGvvjU7vEti0Yj+EcAQE2gj60MBwcA22uYGuKHRoIvpMFgg4UV1aKChC5W
	e6y8rkw==
X-Google-Smtp-Source: AGHT+IFg265zLGl2bQmWCvkKPU4u2q3qfh913c9juw3tQPbolW7ChzJ4nSIfXk8wuAQ4jQwhmqRekZFnQlI=
X-Received: from pjnj13.prod.google.com ([2002:a17:90a:840d:b0:329:7261:93b6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d84:b0:2f9:39b0:fd88
 with SMTP id adf61e73a8af0-334a84da4b1mr29081038637.21.1761175851395; Wed, 22
 Oct 2025 16:30:51 -0700 (PDT)
Date: Wed, 22 Oct 2025 16:30:49 -0700
In-Reply-To: <diqzy0p2eet3.fsf@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1760731772.git.ackerleytng@google.com> <8ee16fbf254115b0fd72cc2b5c06d2ccef66eca9.1760731772.git.ackerleytng@google.com>
 <2457cb3b-5dde-4ca1-b75d-174b5daee28a@arm.com> <diqz4irqg9qy.fsf@google.com> <diqzy0p2eet3.fsf@google.com>
Message-ID: <aPlpKbHGea90IebS@google.com>
Subject: Re: [RFC PATCH v1 07/37] KVM: Introduce KVM_SET_MEMORY_ATTRIBUTES2
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Steven Price <steven.price@arm.com>, cgroups@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, x86@kernel.org, 
	akpm@linux-foundation.org, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@intel.com, chenhuacai@kernel.org, 
	corbet@lwn.net, dave.hansen@intel.com, dave.hansen@linux.intel.com, 
	david@redhat.com, dmatlack@google.com, erdemaktas@google.com, 
	fan.du@intel.com, fvdl@google.com, haibo1.xu@intel.com, hannes@cmpxchg.org, 
	hch@infradead.org, hpa@zytor.com, hughd@google.com, ira.weiny@intel.com, 
	isaku.yamahata@intel.com, jack@suse.cz, james.morse@arm.com, 
	jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, jhubbard@nvidia.com, 
	jthoughton@google.com, jun.miao@intel.com, kai.huang@intel.com, 
	keirf@google.com, kent.overstreet@linux.dev, liam.merwick@oracle.com, 
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
	shakeel.butt@linux.dev, shuah@kernel.org, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	vannapurve@google.com, vbabka@suse.cz, viro@zeniv.linux.org.uk, 
	vkuznets@redhat.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Oct 22, 2025, Ackerley Tng wrote:
> Ackerley Tng <ackerleytng@google.com> writes:
> 
> Found another issue with KVM_CAP_MEMORY_ATTRIBUTES2.
> 
> KVM_CAP_MEMORY_ATTRIBUTES2 was defined to do the same thing as
> KVM_CAP_MEMORY_ATTRIBUTES, but that's wrong since
> KVM_CAP_MEMORY_ATTRIBUTES2 should indicate the presence of
> KVM_SET_MEMORY_ATTRIBUTES2 and struct kvm_memory_attributes2.

No?  If no attributes are supported, whether or not KVM_SET_MEMORY_ATTRIBUTES2
exists is largely irrelevant.  We can even provide the same -ENOTTY errno by
checking that _any_ attributes are supported, i.e. so that doing
KVM_SET_MEMORY_ATTRIBUTES2 on KVM without any support whatsoever fails in the
same way that KVM with code support but no attributes fails.

In other words, I don't see why it can't do both.  Even if we can't massage the
right errno, I would much rather KVM_SET_MEMORY_ATTRIBUTES2 enumerate the set of
supported attributes than simply '1'.  E.g. we have no plans to support
KVM_SET_MEMORY_ATTRIBUTES on guest_memfd, and so returning simply '1' creates an
unwanted and unnecessary dependency.

> @@ -1617,4 +1618,15 @@ struct kvm_pre_fault_memory {
>  	__u64 padding[5];
>  };
>  
> +/* Available with KVM_CAP_MEMORY_ATTRIBUTES2 */
> +#define KVM_SET_MEMORY_ATTRIBUTES2              _IOWR(KVMIO,  0xd6, struct kvm_memory_attributes2)

Please use the same literal number, 0xd2, as

  #define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd2, struct kvm_memory_attributes)

The "final" ioctl number that userspace sees incorporates the directionality and
the size of the struct, i.e. KVM_SET_MEMORY_ATTRIBUTES and KVM_SET_MEMORY_ATTRIBUTES2
are guaranteed to be distinct even if they both use 0xd2 as the "minor" number.

> +
> +struct kvm_memory_attributes2 {
> +	__u64 address;
> +	__u64 size;
> +	__u64 attributes;
> +	__u64 flags;
> +	__u64 reserved[4];

Maybe be paranoid and reserve 12 u64s?

