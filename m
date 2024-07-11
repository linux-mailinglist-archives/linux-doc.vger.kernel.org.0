Return-Path: <linux-doc+bounces-20568-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A2192F2AA
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jul 2024 01:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9901C220BA
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 23:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCC515E5CE;
	Thu, 11 Jul 2024 23:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ey5B82r0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486615A851
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 23:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720741064; cv=none; b=QQixAlBYOjfbv8KFfIeyULEYAxvTVjrDLp22El58Gqg3j43HnU5Ht7sqJBSFSRo/DHk7RgZouq/r8qXxvYN1HzsvgW/TDiMzEnRjRVmSUwlYmDrDRBkvOuTFuZqJ0gcekSusvYfehK4AJkveB9SxakwGCeCghMFsihqnYmPLlCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720741064; c=relaxed/simple;
	bh=dgq8E7YvbNGNJS8c4nZ2r/r1ZEL9B3HdAw4noW885qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIzNuV8ic2+RdHbBIjsPCFnrZhrrkgO67TR3K8jYB8bRoehrp4cNX0p7579lAAdr4Uv7DC32COojvOvx5TsIEW3+p0AFamW2MlYtu5xeji2NaFf49hsQGXrYLMxV24DNfe+5EdBvdW7ojmAc5Z9q479ifv+tjP5CP+OzuUm8hKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ey5B82r0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4272738eb9eso10463145e9.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 16:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720741061; x=1721345861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgq8E7YvbNGNJS8c4nZ2r/r1ZEL9B3HdAw4noW885qg=;
        b=ey5B82r0D74quYWEYwM6a2ob0pf8hMBkPLSKo7tRh/NWBGFwMaYKdI0USqR/oMTkIc
         M3dDo809aTpfOtkdNkFNq/ns/cjz6dmXeSPYAacYUOwGQNdcSd1okrwHY/8+co77Y3rn
         Df/ZZXK7KsaSUUL7rPs7pcgp9KDinzj+ppwLQcxpXDCyT7jT0KPu5VLkKdqXKrLIBb6m
         2qyhSQ8zoej6Bu7/lJp9MdbBlvjLSss+D9qeJnbdpCceGhToY+fNueHQ+jHGO0YYZJka
         2lgYff1C83Z1+8LNBl3FTYGzgdL82F3OTsQkbxoS3tAzwYw8CzeYm7wOy1iv0Xsg1WaV
         Bc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720741061; x=1721345861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgq8E7YvbNGNJS8c4nZ2r/r1ZEL9B3HdAw4noW885qg=;
        b=CMCXgMp1u2yRo5K1iANLWeG7e6WPBeKlDtJqaoIK14DqnaYiYRq1v1unVCGAEtMYQz
         0PqU16nd+Ouh4qnhnljQWy+srQQ8mWmMdQ3xbWu4pBQjr54EoZaR6wj6YHXoJJCVIPhn
         tavc8iIh5TtF9gq8oh8gLmL0jsAa9n+jP5RZhvtXQsfPBJWY6DZdP1WbWUB1LcQ2bITt
         2iOxkUVNg90zewVbWIwTUuwbf4kuFwV1ZhWnXU4lX5sJoYkl4MHmamOzV9iVhm60dbEb
         1HuGN5orAYAeI+4j2rbN2ZqftPFiettINSTqva8jox2t8nG7MWjM4RBoPuLmWb9onNus
         wQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4xNpxNY9p6NZq8tEV/pZ1FYYjtCVbfzpmEJ0+VsDrz9u1nKaDJglVhpny9YR3QqC7bdo4qr5vRcPwF433w26MgfKQBhIBC6/s
X-Gm-Message-State: AOJu0YyhWL9BG4Lii/5YMvZ5ie6PeHTr3wEyaqrANET16VwJjh3GO0dx
	6rkz/0ynJjo4Y/dYCHOXS4fsHCrOW54tG4IA5MJRWzN0PB+Y3/VeqLdL8/uzCXkf+Kg5bl3ZlP4
	yx+CkOcpnKg3/dkuSBSUUiS7cMNI0FkydTPeN
X-Google-Smtp-Source: AGHT+IEj9ZGC5V2+20cQS5OtDDoP2eEqjjPsDXclNG0/fAcvhnVa6UmpiVn1brtJfh3dg3jBIokctcxiU0ucW5/AJo8=
X-Received: by 2002:a5d:6d01:0:b0:367:91cf:e890 with SMTP id
 ffacd0b85a97d-367cea46185mr8420151f8f.6.1720741060650; Thu, 11 Jul 2024
 16:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 11 Jul 2024 16:37:13 -0700
Message-ID: <CALzav=d+eALgV5UKnwHh67XYba53tkWwDNPWrThcmCP++sCiLg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] KVM: Post-copy live migration for guest_memfd
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 4:42=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> --- Preventing access: KVM_MEMORY_ATTRIBUTE_USERFAULT ---
>
> The most straightforward way to inform KVM of userfault-enabled pages is
> to use a new memory attribute, say KVM_MEMORY_ATTRIBUTE_USERFAULT.
>
> There is already infrastructure in place for modifying and checking
> memory attributes. Using this interface is slightly challenging, as there
> is no UAPI for setting/clearing particular attributes; we must set the
> exact attributes we want.

The thing we'll want to optimize specifically is clearing
ATTRIBUTE_USERFAULT. During post-copy migration, there will be
potentially hundreds of vCPUs in a single VM concurrently
demand-fetching memory. Clearing ATTRIBUTE_USERFAULT for each page
fetched is on the critical path of getting the vCPU back into
guest-mode.

Clearing ATTRIBUTE_USERFAULT just needs to clear the attribute. It
doesn't need to modify page tables or update any data structures other
than the attribute itself. But the existing UAPI takes both mmu_lock
and slots_lock IIRC.

I'm also concerned that the existing UAPI could lead to userspace
accidentally clearing ATTRIBUTE_USERFAULT when it goes to set
ATTRIBUTE_PRIVATE (or any other potential future attribute). Sure that
could be solved but that means centrally tracking attributes in
userspace and issuing one ioctl per contiguous region of guest memory
with matching attributes. Imagine a scenario where ~every other page
of guest memory as ATTRIBUTE_USERFAULT and then userspace wants to set
a differient attribute on a large region of memory. That's going to
take a _lot_ of ioctls.

Having a UAPI to set (attributes |=3D delta) and clear (attributes &=3D
~delta) attributes on a range of GFNs would solve both these problems.

>
> The synchronization that is in place for updating memory attributes is
> not suitable for post-copy live migration either, which will require
> updating memory attributes (from userfault to no-userfault) very
> frequently.

There is also the xarray. I imagine that will trigger a lot of dynamic
memory allocations during post-copy which will slow increase the total
time a vCPU is paused due to a USERFAULT page.

Is it feasible to convert attributes to a bitmap?

>
> Another potential interface could be to use something akin to a dirty
> bitmap, where a bitmap describes which pages within a memslot (or VM)
> should trigger userfaults. This way, it is straightforward to make
> updates to the userfault status of a page cheap.

Taking a similar approach to dirty logging is attractive for several reason=
s.

1. The infrastructure to manage per-memslot bitmaps already exists for
dirty logging.
2. It avoids the performance problems with xarrays by using a bitmap.
3. It avoids the performance problems with setting all attributes at once.

However it will require new specific UAPIs to set/clear. And it's
probably possible to optimize attributes to meet our needs, and those
changes will benefit all attributes.

>
> When KVM Userfault is enabled, we need to be careful not to map a
> userfault page in response to a fault on a non-userfault page. In this
> RFC, I've taken the simplest approach: force new PTEs to be PAGE_SIZE.
>
> --- Page fault notifications ---
>
> For page faults generated by vCPUs running in guest mode, if the page
> the vCPU is trying to access is a userfault-enabled page, we use
> KVM_EXIT_MEMORY_FAULT with a new flag: KVM_MEMORY_EXIT_FLAG_USERFAULT.
>
> For arm64, I believe this is actually all we need, provided we handle
> steal_time properly.

There's steal time, and also the GIC pages. Steal time can use
KVM_EXIT_MEMORY_FAULT, but that requires special casing in the ARM
code. Alternatively, both can use the async mechanism and to avoid
special handling in the ARM code.

>
> For x86, where returning from deep within the instruction emulator (or
> other non-trivial execution paths) is infeasible, being able to pause
> execution while userspace fetches the page, just as userfaultfd would
> do, is necessary. Let's call these "asynchronous userfaults."
>
> A new ioctl, KVM_READ_USERFAULT, has been added to read asynchronous
> userfaults, and an eventfd is used to signal that new faults are
> available for reading.
>
> Today, we busy-wait for a gfn to have userfault disabled. This will
> change in the future.
>
> --- Fault resolution ---
>
> Resolving userfaults today is as simple as removing the USERFAULT memory
> attribute on the faulting gfn. This will change if we do not end up
> using memory attributes for KVM Userfault. Having a range-based wake-up
> like userfaultfd (see UFFDIO_WAKE) might also be helpful for
> performance.
>
> Problems with this series
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> - This cannot be named KVM Userfault! Perhaps "KVM missing pages"?
> - Memory attribute modification doesn't scale well.
> - We busy-wait for pages to not be userfault-enabled.

Async faults are a slow path so I think a wait queue would suffice.

> - gfn_to_hva and gfn_to_pfn caches are not invalidated.
> - Page tables are not collapsed when KVM Userfault is disabled.
> - There is no self-test for asynchronous userfaults.
> - Asynchronous page faults can be dropped if KVM_READ_USERFAULT fails.

Userspace would probably treat this as fatal anyway right?

