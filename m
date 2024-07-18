Return-Path: <linux-doc+bounces-20982-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADFD9345F3
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 03:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CF3C1F226E5
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 01:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3631DDB8;
	Thu, 18 Jul 2024 01:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="shdf9e8O"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B581B86FA
	for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 01:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721267982; cv=none; b=f2DT6XtpvFZEMeCxfBWNKVxSD6z4tY45H3nWGu30RjH3Y07muRxBwKzmwi3sEUYHSmnkBxFtOPafRrI1bJueWkOZ2Im1FzHTGA+MM/rTlqJ5axUPqPn6gq5QnuILjXMB6TA+hBYmJhSD5pSjo0YBWRL6uUYshrMDhXoXqhLYZ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721267982; c=relaxed/simple;
	bh=fwy7tFrFnUI3LzbR2916EQ2Ng8NP4m5zIbrt2rE9Xrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M29FHVPzJTAS2BkXITwAYzappHo5xcknJPbpEgpqCL/TFrxMDr8zXy06nEXXDyjZssXu49Lw+Q5n83JfHN36HCaCEwRZKb+gbZshH1sPM5mrR4J8UUAmdJJ+64E0C1pUl/Lyn0WKNzBT9w1AELWWLUB7+ZTUUv+Mcx05hdcrkOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=shdf9e8O; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-44e534a1fbeso91361cf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 18:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721267980; x=1721872780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwy7tFrFnUI3LzbR2916EQ2Ng8NP4m5zIbrt2rE9Xrc=;
        b=shdf9e8OCwOmIcW2lHIJjQcCRTS4U5f/60IHR3QWp8aCkvtNM0ylSi0hUcnwDqwiPS
         Ka85X8xukgEBl2XZEnx10nMkEc+hPfYjBusVRPnOqlHBdJP+3YPIcMi9aUIotXhw4rOv
         6nas0c307f299cgeR8x/0LQNO18BMZK5vDuRSE6lMIQXqX/hB0EuoVpjQg84OFeBoV17
         JcDWJwrYD+Blw3jAFuA5UJdoLG64o4dENzIVTjNH9gU9+GGrncSS8uY+JufKgVKEgNuO
         KgTpeDStK4Ps8l373mVITs71kAPmxrF1hvozw7UYn4iXXgWW+OSBNTSwEOSHNLpsQr+u
         OK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721267980; x=1721872780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwy7tFrFnUI3LzbR2916EQ2Ng8NP4m5zIbrt2rE9Xrc=;
        b=pHsqHcOTTxUT9mLH3IWts0/yADpNoSogZS/SUWKWfl3FqwQFeS7kgys+i4esb99g5k
         hyW1ka6CiT8a+16TUMqNXo13Il8ZbBGnvTVFtZ/RD+EXaY8OCSVwsPQtuGNSNNDka3ao
         adtk39BFd/VzEYiLavwFEO3Ho0MfMp1fNr+tvyXTjCssQ3MvUIjzmIERz7SUl/zzALE4
         dEnmZ78uye/5pwdD7B/kU57mwcAVH0LjyGB4gFn+prRHeIZpcaNEi3y6J+6oDHDMWsTP
         gJSONRvZh05BuS/nR3n7QRjWUe7U9hTadZajOFgtQVUQtFDCrhJz9NQhOtCTgFueQ/39
         Xbzw==
X-Forwarded-Encrypted: i=1; AJvYcCW583aaqblBulf16SqgYA8ZjyscY5RlGbcvbHd6/K953PGUjIAITzlfJi+KiLCKUdTvDiNA/9Go4BpOG75nWbP6i0SKwCK0BYmE
X-Gm-Message-State: AOJu0Yx1xWpyXruFYfPDJPjk/OC4WYXhaA5dPGK7B8JsgwS5OCz6dpZ9
	r6sllGK0MyrmDCKMv0aGAzI6w6augU8LVYIq6Q/6jjQfbEytbruAw/HgohkjY5d65uBEWpEgXxQ
	9Stagv+mcjoMF23mceOeKtaoMt+EB52QhzGmu
X-Google-Smtp-Source: AGHT+IE58y37covXCZXpnSJtGTosaOLDYejn3iVUtH4Ayy+oebIBQjA8FkdBSlTvRYoeDLEBTBvkMRc0DIX3l5grc1I=
X-Received: by 2002:a05:622a:4d06:b0:447:e4cb:bf50 with SMTP id
 d75a77b69052e-44f91ae2480mr892591cf.8.1721267979720; Wed, 17 Jul 2024
 18:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com> <CALzav=d+eALgV5UKnwHh67XYba53tkWwDNPWrThcmCP++sCiLg@mail.gmail.com>
In-Reply-To: <CALzav=d+eALgV5UKnwHh67XYba53tkWwDNPWrThcmCP++sCiLg@mail.gmail.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 17 Jul 2024 18:59:02 -0700
Message-ID: <CADrL8HUi2x2z+Jow_rb+iiuySWMCRq8Ti6SwzBoHUNSH1mcYhw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] KVM: Post-copy live migration for guest_memfd
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 4:37=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Wed, Jul 10, 2024 at 4:42=E2=80=AFPM James Houghton <jthoughton@google=
.com> wrote:
> >
> > --- Preventing access: KVM_MEMORY_ATTRIBUTE_USERFAULT ---
> >
> > The most straightforward way to inform KVM of userfault-enabled pages i=
s
> > to use a new memory attribute, say KVM_MEMORY_ATTRIBUTE_USERFAULT.
> >
> > There is already infrastructure in place for modifying and checking
> > memory attributes. Using this interface is slightly challenging, as the=
re
> > is no UAPI for setting/clearing particular attributes; we must set the
> > exact attributes we want.
>
> The thing we'll want to optimize specifically is clearing
> ATTRIBUTE_USERFAULT. During post-copy migration, there will be
> potentially hundreds of vCPUs in a single VM concurrently
> demand-fetching memory. Clearing ATTRIBUTE_USERFAULT for each page
> fetched is on the critical path of getting the vCPU back into
> guest-mode.
>
> Clearing ATTRIBUTE_USERFAULT just needs to clear the attribute. It
> doesn't need to modify page tables or update any data structures other
> than the attribute itself. But the existing UAPI takes both mmu_lock
> and slots_lock IIRC.
>
> I'm also concerned that the existing UAPI could lead to userspace
> accidentally clearing ATTRIBUTE_USERFAULT when it goes to set
> ATTRIBUTE_PRIVATE (or any other potential future attribute). Sure that
> could be solved but that means centrally tracking attributes in
> userspace and issuing one ioctl per contiguous region of guest memory
> with matching attributes. Imagine a scenario where ~every other page
> of guest memory as ATTRIBUTE_USERFAULT and then userspace wants to set
> a differient attribute on a large region of memory. That's going to
> take a _lot_ of ioctls.
>
> Having a UAPI to set (attributes |=3D delta) and clear (attributes &=3D
> ~delta) attributes on a range of GFNs would solve both these problems.

Hi David, sorry for the delay getting back to you.

I agree with all of these points.

>
> >
> > The synchronization that is in place for updating memory attributes is
> > not suitable for post-copy live migration either, which will require
> > updating memory attributes (from userfault to no-userfault) very
> > frequently.
>
> There is also the xarray. I imagine that will trigger a lot of dynamic
> memory allocations during post-copy which will slow increase the total
> time a vCPU is paused due to a USERFAULT page.
>
> Is it feasible to convert attributes to a bitmap?

I don't see any reason why we couldn't convert attributes to be a
bitmap (or to have some attributes be stored in bitmaps and others be
stored in the xarray).

>
> >
> > Another potential interface could be to use something akin to a dirty
> > bitmap, where a bitmap describes which pages within a memslot (or VM)
> > should trigger userfaults. This way, it is straightforward to make
> > updates to the userfault status of a page cheap.
>
> Taking a similar approach to dirty logging is attractive for several reas=
ons.
>
> 1. The infrastructure to manage per-memslot bitmaps already exists for
> dirty logging.
> 2. It avoids the performance problems with xarrays by using a bitmap.
> 3. It avoids the performance problems with setting all attributes at once=
.
>
> However it will require new specific UAPIs to set/clear. And it's
> probably possible to optimize attributes to meet our needs, and those
> changes will benefit all attributes.

Ok so the three options in my head are:
1. Add an attribute diff UAPI and track the USERFAULT attribute in the xarr=
ay.
2. Add an attribute diff UAPI and track the USERFAULT attribute with a bitm=
ap.
3. Add a new UAPI to enable KVM userfaults on gfns according to a
particular bitmap, similar to dirty logging.

(1) is problematic because it is valid to have every page (or, say,
every other page) have ATTRIBUTE_USERFAULT.

(2) seems ok to me.

(3) would be great, but maybe the much more complicated UAPI is not
worth it. (We get the ability to mark many different regions as
USERFAULT in one syscall, and KVM has a lot of code for handling
bitmap arguments.)

I'm hoping others will weigh in here.

> >
> > When KVM Userfault is enabled, we need to be careful not to map a
> > userfault page in response to a fault on a non-userfault page. In this
> > RFC, I've taken the simplest approach: force new PTEs to be PAGE_SIZE.
> >
> > --- Page fault notifications ---
> >
> > For page faults generated by vCPUs running in guest mode, if the page
> > the vCPU is trying to access is a userfault-enabled page, we use
> > KVM_EXIT_MEMORY_FAULT with a new flag: KVM_MEMORY_EXIT_FLAG_USERFAULT.
> >
> > For arm64, I believe this is actually all we need, provided we handle
> > steal_time properly.
>
> There's steal time, and also the GIC pages. Steal time can use
> KVM_EXIT_MEMORY_FAULT, but that requires special casing in the ARM
> code. Alternatively, both can use the async mechanism and to avoid
> special handling in the ARM code.

Oh, of course, I forgot about the GIC. Thanks. And yes, if the async
userfault mechanism is acceptable, using that would be better than
adding the special cases.

>
> >
> > For x86, where returning from deep within the instruction emulator (or
> > other non-trivial execution paths) is infeasible, being able to pause
> > execution while userspace fetches the page, just as userfaultfd would
> > do, is necessary. Let's call these "asynchronous userfaults."
> >
> > A new ioctl, KVM_READ_USERFAULT, has been added to read asynchronous
> > userfaults, and an eventfd is used to signal that new faults are
> > available for reading.
> >
> > Today, we busy-wait for a gfn to have userfault disabled. This will
> > change in the future.
> >
> > --- Fault resolution ---
> >
> > Resolving userfaults today is as simple as removing the USERFAULT memor=
y
> > attribute on the faulting gfn. This will change if we do not end up
> > using memory attributes for KVM Userfault. Having a range-based wake-up
> > like userfaultfd (see UFFDIO_WAKE) might also be helpful for
> > performance.
> >
> > Problems with this series
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > - This cannot be named KVM Userfault! Perhaps "KVM missing pages"?
> > - Memory attribute modification doesn't scale well.
> > - We busy-wait for pages to not be userfault-enabled.
>
> Async faults are a slow path so I think a wait queue would suffice.

I think a wait queue seems like a good fit too. (It's what userfaultfd uses=
.)

>
> > - gfn_to_hva and gfn_to_pfn caches are not invalidated.
> > - Page tables are not collapsed when KVM Userfault is disabled.
> > - There is no self-test for asynchronous userfaults.
> > - Asynchronous page faults can be dropped if KVM_READ_USERFAULT fails.
>
> Userspace would probably treat this as fatal anyway right?

Yes, but I still think dropping the gfn isn't great. I'll fix this
when I change from using the hacky list-based thing to something more
sophisticated (like a wait_queue).

