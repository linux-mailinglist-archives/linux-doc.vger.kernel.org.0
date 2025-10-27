Return-Path: <linux-doc+bounces-64708-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E53BC0DB1D
	for <lists+linux-doc@lfdr.de>; Mon, 27 Oct 2025 13:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94243B06D4
	for <lists+linux-doc@lfdr.de>; Mon, 27 Oct 2025 12:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED2C233136;
	Mon, 27 Oct 2025 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YTS802Je"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F34230BD9
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 12:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569340; cv=none; b=U3+f1XLZkROAI97Qu7eMxEmfa9a3i9e7IDeCdh6SUmcmCPnQDs0ND2TCVwdHolCeuE5ied5Jw6kwd6LVMHfULhEYc6kuIlfsVPaSKn2gSo3zUUHcPwdy/fPGKMKzmZwFdGZa0Jwg0PZ4ASaFHafPLStpRZuHWPXDT54UnlvE31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569340; c=relaxed/simple;
	bh=xIqDNcTwMPF2Nfh7H2HrsYu57Z68rRXirPja4i/3Ah0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=azLgtE/e6D0M/oGtEuvMJ9QXS+gnBCL3FTTyQw37+YJ8GDgd1LVI2D49fa40rQrlNMKEUIArqfcWx98n7B7pdZwaXIRoFEXst6w2UjJn4aycTZl89+XngGa2f3VpSUWkg9+gbazLe6DfaFiwRg6gl142HfJgjTmZ4WH66F1PWhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YTS802Je; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-290c9724deeso40433375ad.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761569338; x=1762174138; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TpsH9gx/luUFZveFm6voMll1yjdVEPjIbyyyxybZ4HQ=;
        b=YTS802JetUCMSbN8b0ql2ACutOsA+EQE7/jK1PeV7DwkUyOmKCiPVNA1QulO179JGF
         nY5Ab48vWwtZ2dz/7nMVpeVj+LzBc+BxEZJillea3xf/mLFJDMFuTIa5pAUMGdKM8cBh
         9A/HLo7dCsUus1TE7HhhVykk9/8hEm45rWsUIKNGvdPem2zLfQ8yks4JmrQ/Ek0vT2q6
         67Pid7oNNI7hUUI7eb9wyItNX6w13LL+otk4aWjEtjaM+an+cBKYAWes7Es+GMAE3+jS
         DgiPdNRbo+6BgBz2QZgmbpXqn0KaBmqOBClU0h7v/rUkBAumXx+MmlLItZRucPkWv12a
         Y7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761569338; x=1762174138;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpsH9gx/luUFZveFm6voMll1yjdVEPjIbyyyxybZ4HQ=;
        b=Aby6VUdGdXffsTFMuQXYTWvtVbWFz/gx3WVf8fT6gm9eCDZcT4lruRnum4vCgZyS0r
         7aFDkbeZvDOge7wvOva0kUrZKHt8jHP0bzGS4vBPCslxrApdsHZihcq/o8TsdvVk3OXv
         vCuOBVF03OkCWi2aPTtkVT6wmCHidFWl1I9m8VWkmlWAUZmTS/0gV5AQSZVGtFXHvYE0
         84P9Mbn8phA2y1vaun08czU7b8KPS7QVXwok2208SgCuhsLca0uYSttW3fBxDpFU5BOl
         TpjqW3SEbU84jqCkmaF1asc2O8WAIWrZuM/VB/ZFqeExOeElbSb9D+2Kl3eVfXdPp0kF
         JhIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtCVX8deEw48eHz1FeOgEAKJvOIoKEDRtMu2NvdWhMQ0q4BxJ33vcDan+8x5qy2mGtvdhdLCXJA2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtOtaetKfu5iq3Ia8LhSid8vEgMXIerBe3gXMpQVm7n+iRO5dV
	291Hx/S/vpguuRysYFaNaYtTO9e2CdRercEwIJ9uUZQz7jSiRT0fkoyhV9vyFxZ5V84jgQfac2D
	ldEYPQ9FZPe1xg7+F1ZOfRC3eQA==
X-Google-Smtp-Source: AGHT+IE8aJKICvS5xOA+BTAY6bjRh41q0VtmGZijtJh7qHPsEmdIFH7jOAvP+FEHmW/GVGRbcG4XOU1+vDg6R+rrXQ==
X-Received: from plbmg14.prod.google.com ([2002:a17:903:348e:b0:268:e12a:2266])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d60d:b0:270:e595:a440 with SMTP id d9443c01a7336-290c9cd4b48mr418021645ad.25.1761569338212;
 Mon, 27 Oct 2025 05:48:58 -0700 (PDT)
Date: Mon, 27 Oct 2025 05:48:56 -0700
In-Reply-To: <aPu7IosMI61NjZY5@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <8ee16fbf254115b0fd72cc2b5c06d2ccef66eca9.1760731772.git.ackerleytng@google.com>
 <2457cb3b-5dde-4ca1-b75d-174b5daee28a@arm.com> <diqz4irqg9qy.fsf@google.com>
 <diqzy0p2eet3.fsf@google.com> <aPlpKbHGea90IebS@google.com>
 <diqzv7k5emza.fsf@google.com> <aPpEPZ4YfrRHIkal@google.com>
 <diqzqzuse58c.fsf@google.com> <aPuXCV0Aof0zihW9@google.com>
 <diqzo6pwdzfy.fsf@google.com> <aPu7IosMI61NjZY5@google.com>
Message-ID: <diqzecqojyrr.fsf@google.com>
Subject: Re: [RFC PATCH v1 07/37] KVM: Introduce KVM_SET_MEMORY_ATTRIBUTES2
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
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
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Oct 24, 2025, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> > @@ -486,6 +488,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, uint32_t nr_runnable_vcpus,
>> >         }
>> >         guest_rng = new_guest_random_state(guest_random_seed);
>> >         sync_global_to_guest(vm, guest_rng);
>> > +       sync_global_to_guest(vm, kvm_has_gmem_attributes);
>> 
>> I ported this [1] except for syncing this value to the guest, because I
>> think the guest shouldn't need to know this information,
>
> KVM selftests are about practically and testing, what information should or
> shouldn't be available to a test from e.g. a safety perspective is completely
> irrelevant.  In fact, one of the biggest advantages of selftests over KUT is
> that the guest side can know _exactly_ what's going on in the host.
>
> See the usage in 1850e3da4b03 ("KVM: selftests: Update private_mem_conversions_test
> to mmap() guest_memfd") from:
>
>   https://github.com/sean-jc/linux.git x86/gmem_inplace
>
>> the host should decide what to do. I think, if the guests really need to know
>> this, the test itself can do the syncing.
>
> Why force tests to do extra work, and potentially introduce subtle bugs due to
> state being stale?

Adding it back. Thanks!

This variable should be sync-able for TDX selftests as well since the
value should be synced before the TD image is loaded.

