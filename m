Return-Path: <linux-doc+bounces-37443-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2872EA2D9F1
	for <lists+linux-doc@lfdr.de>; Sun,  9 Feb 2025 01:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 979967A2D86
	for <lists+linux-doc@lfdr.de>; Sun,  9 Feb 2025 00:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF5A20EB;
	Sun,  9 Feb 2025 00:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ECAJJttt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068EECF
	for <linux-doc@vger.kernel.org>; Sun,  9 Feb 2025 00:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739060061; cv=none; b=oWDADGd9vXU1RoUXESlyZMVzQnIKHtNvyNFJs9YLpS2bn+mRoxadSc/QriPUQfBb6QVxDUs5hfcctQse5oOywD8HVkQDldU6RPoeR1I0KhGhSJQwqWP9B5JC5GlwIt+WmeLBgTQMXAPlSohPmUUn3EXnCm4qHsuvQ7kFUwo0UjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739060061; c=relaxed/simple;
	bh=ib1K4Km+h+BeZ78R9k20FnpaiVh+aw5wr2g7Y132/1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtuU0a8L1c6ixUbyN/0SvkPtGSY0jTEqv820EHw9gJAPdAPbsb7JlDsFI6k9ez+3kXW39n9pDlvc/pupKWkMWx88JD4NLFxSjhdRwdvO5Pfw6HaJ64klmKoECGARvqtkH/cWpBQYIWDxmjCzgKUXJhzc6jp8cAUi5ogbUBd7nXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ECAJJttt; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4678afeb133so41570261cf.0
        for <linux-doc@vger.kernel.org>; Sat, 08 Feb 2025 16:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1739060058; x=1739664858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHcRKHoHeO3yYwQrJ0rL+RTEHK8K10d3+YiRJ46SQRc=;
        b=ECAJJtttxxQ3aDZHnBtAB+dXIptSd3Z/+/pIGSuDhg6E4oADrGP4xKvyE7hD7KXiDX
         iLEwdduedEXBEU5Ke3pKWc9I1PD3LRvVirbwr3v1rKoBFcfgK6dbWeDDHZRFkihVlHEV
         zELHmqSygNDT2uHIXJkmJGXx176dgIN1vdZxkMfPYVQY9s3NM60pKooxBoWDSp7VXMqr
         vLQrIKl1oZJz4F6/R783TGjT3FuKaCRet2odsPge6IeSMP1P5Jc9GS/RtR5Q9JXIYStW
         rkE70EOrcK82q6IE3GiwtiPYwktNgEiBYbadPRjD4eQhVj5o7PNFG7Wd+jsas4Ym67rg
         KKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739060058; x=1739664858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHcRKHoHeO3yYwQrJ0rL+RTEHK8K10d3+YiRJ46SQRc=;
        b=f7pYRXQwY2myMa8U/S90oy2QCypGcyx3gXHl6fpekNm6LWOJiGs7BnkVMBQtHfEf8V
         De9clPKVpHN6Ku0gmhcmMN6W42i8GQ+T1L3o7cUMzcfuwtAKJdr+WfTSpGEJrhfCYSNz
         ECE9/S/hRRIBzXYx92dFMNYhX3Vd0ogJbirsvDpOuAj7nLaE3KsEn4fKs0cKLVRmxgZg
         EbFz47TwvpRBVthyRY0NDiGJLatWUSicznRrNdAsruyLS5ZX8mrdNKXE0aZ5R6DMLMed
         z2zLH31O6d3T7PCFycQWbmZF8Sxw9Cso2y4X8YIvqc+w4P4SNIbcXdm9/u8YJpGM8NBT
         5Gxw==
X-Forwarded-Encrypted: i=1; AJvYcCWnWtWaGj/hD7d3nVC1xw71qxkwVir5DoK6pRTfIXK44dDonjYjfdYgB3yUq01kxr7vhvg7d+dmDFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kZQ8skPoPMABRi+J9kYPhPlba2vL1i6JnqgzustKhR1OY5JP
	/68yJKaSwQe30oSgY6vG6EHNwyUO3YxaRjHuXpjI+zvYp6hP5zFhquddkaqm+cdzkqBaelpOKVm
	qg6mpihNQQ/nobcMgjVIMrF0UdAAznBH+TrZ/lQ==
X-Gm-Gg: ASbGnctOeG1P+H2NU5Zg2Df0wiyWpexg0GtBHdSuqYisym20Mk54pr23jvPJ5BUWL8o
	ftrwikRq8dfELbvjjbSbh66JCTHaYX9x6g+9Sy2PoQCUaCCEYdccDUbDeQjuAcDdb2JeTqw==
X-Google-Smtp-Source: AGHT+IEZxHNt3mZP0AuiY+W9AaSnauAT6AJRQRznlE6PgIrsIXbAga4WSCyQOQlcL+3VJDDj9abWUIyU1/BOi9O7OEA=
X-Received: by 2002:a05:622a:1186:b0:471:8a10:63c0 with SMTP id
 d75a77b69052e-4718a1066demr10288491cf.10.1739060057757; Sat, 08 Feb 2025
 16:14:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <CAM_iQpU9DDg2Oi33_dfPqVpd9j_2O+WD7ovo__f48BA9DztwXQ@mail.gmail.com>
In-Reply-To: <CAM_iQpU9DDg2Oi33_dfPqVpd9j_2O+WD7ovo__f48BA9DztwXQ@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 8 Feb 2025 19:13:40 -0500
X-Gm-Features: AWEUYZm7hjYyWx8OgJnvEXBjFKJR8cD76rObTCepJOM4ok5LDKRuBdQi0XQitL0
Message-ID: <CA+CK2bBrO+khpX+U3F+d8wCb3GutVD=3HtU-94gHQJSoenQcKw@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Woodhouse <dwmw2@infradead.org>, Eric Biederman <ebiederm@xmission.com>, 
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 6:39=E2=80=AFPM Cong Wang <xiyou.wangcong@gmail.com>=
 wrote:
>
> Hi Mike,
>
> On Thu, Feb 6, 2025 at 5:28=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
> >
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Hi,
> >
> > This a next version of Alex's "kexec: Allow preservation of ftrace buff=
ers"
> > series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.co=
m),
> > just to make things simpler instead of ftrace we decided to preserve
> > "reserve_mem" regions.
> >
> > The patches are also available in git:
> > https://git.kernel.org/rppt/h/kho/v4
> >
> >
> > Kexec today considers itself purely a boot loader: When we enter the ne=
w
> > kernel, any state the previous kernel left behind is irrelevant and the
> > new kernel reinitializes the system.
> >
> > However, there are use cases where this mode of operation is not what w=
e
> > actually want. In virtualization hosts for example, we want to use kexe=
c
> > to update the host kernel while virtual machine memory stays untouched.
> > When we add device assignment to the mix, we also need to ensure that
> > IOMMU and VFIO states are untouched. If we add PCIe peer to peer DMA, w=
e
> > need to do the same for the PCI subsystem. If we want to kexec while an
> > SEV-SNP enabled virtual machine is running, we need to preserve the VM
> > context pages and physical memory. See "pkernfs: Persisting guest memor=
y
> > and kernel/device state safely across kexec" Linux Plumbers
> > Conference 2023 presentation for details:
> >
> >   https://lpc.events/event/17/contributions/1485/
> >
> > To start us on the journey to support all the use cases above, this pat=
ch
> > implements basic infrastructure to allow hand over of kernel state acro=
ss
> > kexec (Kexec HandOver, aka KHO). As a really simple example target, we =
use
> > memblock's reserve_mem.
> > With this patch set applied, memory that was reserved using "reserve_me=
m"
> > command line options remains intact after kexec and it is guaranteed to
> > reside at the same physical address.
>
> Nice work!
>
> One concern there is that using memblock to reserve memory as crashkernel=
=3D
> is not flexible. I worked on kdump years ago and one of the biggest pains
> of kdump is how much memory should be reserved with crashkernel=3D. And
> it is still a pain today.
>
> If we reserve more, that would mean more waste for the 1st kernel. If we
> reserve less, that would induce more OOM for the 2nd kernel.
>
> I'd suggest considering using CMA, where the "reserved" memory can be
> still reusable for other purposes, just that pages can be migrated out of=
 this
> reserved region on demand, that is, when loading a kexec kernel. Of cours=
e,
> we need to make sure they are not reused by what you want to preserve her=
e,
> e.g., IOMMU. So you might need additional work to make it work, but still=
 I
> believe this is the right direction.

This is exactly what scratch memory is used for. Unlike crashkernel=3D,
the entire scratch area is available to user applications as CMA, as
we know that no kernel-reserved memory will come from that area. This
doesn't work for crashkernel=3D, because in some cases, the user pages
might also need to be preserved in the crash dump. However, if user
pages are going to be discarded from the crash dump (as is done 99% of
the time), then it is better to also make it use CMA or ZONE_MOVABLE
and use only the memory occupied by the crash kernel and do not waste
any memory at all. We have an internal patch at Google that does this,
and I think it would be a good improvement for the upstream kernel to
carry as well.

Pasha

>
> Just my two cents.
>
> Thanks!

