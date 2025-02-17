Return-Path: <linux-doc+bounces-38274-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E369A37A0E
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 04:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C83169435
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 03:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04EC1531E8;
	Mon, 17 Feb 2025 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BXdsJDX5"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0615F282E1
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 03:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739762378; cv=none; b=jgm2H7tE418KQAHnN8kvt4Z+eHo0f2IjPSxOeWnbuXHAmjSdApOetRaPaT83BF1r/ZOQ1pxa3TixtPmtZXxKSP9oWV+Te6QJEWN1sguWilhuUn223KK5X+/m1zAuduq80W8jwMAzBPzIAR+j66c7JW6B8Lk8LcIs/OxLi2xWCDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739762378; c=relaxed/simple;
	bh=pxpAnaDSv/fBMZBZKfFoNkSCH3m0qXu6u93RjU3IikU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNhrS8QfUx4iW5acoXKqxbpiAUynYWeFcOWf+M+NbapK6CFZmeCHW5nRt0SuQqv802aVfzHx0Q2/xOXyiGNoHx0TGLe7z7pv/j6jw/qG8KWIq9RAhlBFWYc1kPOoKdSzBhclf6ZVqnREO8vqOjKGJhNGph7+eeOUP5aZD/DK+K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BXdsJDX5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739762376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EgbKbeBQm7lkao3p6uQLBUr3dfHH6Bslim0jMF3gJaE=;
	b=BXdsJDX5nBJC/5DTJ7zyH8DkWARf86Z93cABQNPiRbStT+niI58zDEC89TW3IC1vbG3NHL
	QIUiK1IyjDaMIwVsrGhfyWtlca8Snik5wy7n4zTcU/GUqxtg3Ov4UTDA1pQMqH7d1ZH8cn
	RxcK9lUXz48xQ5/mEv7vXws+zpO4AwU=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-NTVmnkuqPA6NAhFsf9ilXw-1; Sun, 16 Feb 2025 22:19:32 -0500
X-MC-Unique: NTVmnkuqPA6NAhFsf9ilXw-1
X-Mimecast-MFC-AGG-ID: NTVmnkuqPA6NAhFsf9ilXw_1739762372
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d197e97959so52391645ab.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 19:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739762372; x=1740367172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgbKbeBQm7lkao3p6uQLBUr3dfHH6Bslim0jMF3gJaE=;
        b=Pq6cYWXxintonaRIUdqR5xReqUXtxkZP+Tc/tK0nqx7xtEYGeGzRNmyxhGNT0ywvpf
         hAXmuzBYnsWJlT85AZR/RINIseLSqhVxHB5bfNAQb6c9xp7r7uCjBkVQT12y3cLppatA
         qyj1Lddv5QW0cDqUUWP7FjIWNubQzUDgmNoPZ8xfCzIteJSN0epxEMtMfGY/bzOWQndE
         z+Bi4tCZUeGUz5668e2sk1a2mP6x9XyLPMMkS4eNORmuOiEazxF3T5/Z6x991tdgSnFK
         99lTsOw6gbqaf6zgWQGXK0TIFwU/thnJ36vJ+1O0Yg3hP8nloiC3it+AJ9Xzf6ykSSOR
         cHRg==
X-Forwarded-Encrypted: i=1; AJvYcCUfapWWtaUvw+SfNfNDcMLQTmussLb0ZGngwDaSHwSD9pjOi/dfEhIsGrS+MCh/V9DPH9XagwmUy+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjWUDe4AUKxu7CcCEYe6Kdmd+2EvCWGeS5TWu7PWaeJ4cmb/t
	rnyie2aYx8S1XdCqG5fzaRvmcS21jGQybEvXkeRhVwVHC/gRfB5++iFAWJt/u6yEYrDiyyftLCp
	X8hrlaoKsvlXKwAgRkgwQeTTuEOYF8SYxVPncEQhd2K4bD6On+3bkXy/xqTR2/K+trsJxJuXqhA
	T4XtV2DNT7zxnPbNFUiEu9jyqHim9mvR5u
X-Gm-Gg: ASbGnctl1aUzG0EqSmjIoGN3P49g+sulasPq7f5L1L9J7/HmKrxWxIn0uOTOiCp7IXD
	/OrzRxU/nfJiYE7evM/00m2H5pMMe0j5CULs+9QEr/jXy2BGKZuEatOg+J6xoQ0Q=
X-Received: by 2002:a05:6e02:1b09:b0:3d0:fe8:607e with SMTP id e9e14a558f8ab-3d280940c9bmr64357325ab.14.1739762371855;
        Sun, 16 Feb 2025 19:19:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLJ+sakoWDc92vC5PVdrAPLBDgA51ioqiveqE/kVlhzpNtt+A2nTfHDcNxz2e0uNeHln7kmPyQMRXuDBPUaYI=
X-Received: by 2002:a05:6e02:1b09:b0:3d0:fe8:607e with SMTP id
 e9e14a558f8ab-3d280940c9bmr64357085ab.14.1739762371480; Sun, 16 Feb 2025
 19:19:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org>
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
From: RuiRui Yang <ruyang@redhat.com>
Date: Mon, 17 Feb 2025 11:19:45 +0800
X-Gm-Features: AWEUYZmTtRGOQe_1FWRhP6QKOKg6j7aVMk1lhIeHe6H83IiAgYz-eSDseytmTwE
Message-ID: <CALu+AoRMQyRDFS_4L0KQkmrFT_S+yk=uZ-Mqt86JQYKKnj-5Ug@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, 
	James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 21:34, Mike Rapoport <rppt@kernel.org> wrote:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Hi,
>
> This a next version of Alex's "kexec: Allow preservation of ftrace buffers"
> series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.com),
> just to make things simpler instead of ftrace we decided to preserve
> "reserve_mem" regions.
>
> The patches are also available in git:
> https://git.kernel.org/rppt/h/kho/v4
>
>
> Kexec today considers itself purely a boot loader: When we enter the new
> kernel, any state the previous kernel left behind is irrelevant and the
> new kernel reinitializes the system.
>
> However, there are use cases where this mode of operation is not what we
> actually want. In virtualization hosts for example, we want to use kexec
> to update the host kernel while virtual machine memory stays untouched.
> When we add device assignment to the mix, we also need to ensure that
> IOMMU and VFIO states are untouched. If we add PCIe peer to peer DMA, we
> need to do the same for the PCI subsystem. If we want to kexec while an
> SEV-SNP enabled virtual machine is running, we need to preserve the VM
> context pages and physical memory. See "pkernfs: Persisting guest memory
> and kernel/device state safely across kexec" Linux Plumbers
> Conference 2023 presentation for details:
>
>   https://lpc.events/event/17/contributions/1485/
>
> To start us on the journey to support all the use cases above, this patch
> implements basic infrastructure to allow hand over of kernel state across
> kexec (Kexec HandOver, aka KHO). As a really simple example target, we use
> memblock's reserve_mem.
> With this patch set applied, memory that was reserved using "reserve_mem"
> command line options remains intact after kexec and it is guaranteed to
> reside at the same physical address.
>
> == Alternatives ==
>
> There are alternative approaches to (parts of) the problems above:
>
>   * Memory Pools [1] - preallocated persistent memory region + allocator
>   * PRMEM [2] - resizable persistent memory regions with fixed metadata
>                 pointer on the kernel command line + allocator
>   * Pkernfs [3] - preallocated file system for in-kernel data with fixed
>                   address location on the kernel command line
>   * PKRAM [4] - handover of user space pages using a fixed metadata page
>                 specified via command line
>
> All of the approaches above fundamentally have the same problem: They
> require the administrator to explicitly carve out a physical memory
> location because they have no mechanism outside of the kernel command
> line to pass data (including memory reservations) between kexec'ing
> kernels.
>
> KHO provides that base foundation. We will determine later whether we
> still need any of the approaches above for fast bulk memory handover of for
> example IOMMU page tables. But IMHO they would all be users of KHO, with
> KHO providing the foundational primitive to pass metadata and bulk memory
> reservations as well as provide easy versioning for data.
>
> == Overview ==
>
> We introduce a metadata file that the kernels pass between each other. How
> they pass it is architecture specific. The file's format is a Flattened
> Device Tree (fdt) which has a generator and parser already included in
> Linux. When the root user enables KHO through /sys/kernel/kho/active, the
> kernel invokes callbacks to every driver that supports KHO to serialize
> its state. When the actual kexec happens, the fdt is part of the image
> set that we boot into. In addition, we keep a "scratch regions" available
> for kexec: A physically contiguous memory regions that is guaranteed to
> not have any memory that KHO would preserve.  The new kernel bootstraps
> itself using the scratch regions and sets all handed over memory as in use.
> When drivers initialize that support KHO, they introspect the fdt and
> recover their state from it. This includes memory reservations, where the
> driver can either discard or claim reservations.
>
> == Limitations ==
>
> Currently KHO is only implemented for file based kexec. The kernel
> interfaces in the patch set are already in place to support user space
> kexec as well, but it is still not implemented it yet inside kexec tools.
>

What architecture exactly does this KHO work fine?   Device Tree
should be ok on arm*, x86 and power*, but how about s390?

Thanks
Dae


