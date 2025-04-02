Return-Path: <linux-doc+bounces-42057-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 970B8A79536
	for <lists+linux-doc@lfdr.de>; Wed,  2 Apr 2025 20:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CFFB3A5AC9
	for <lists+linux-doc@lfdr.de>; Wed,  2 Apr 2025 18:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67051D7E2F;
	Wed,  2 Apr 2025 18:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="UpeHXMHl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB819E826
	for <linux-doc@vger.kernel.org>; Wed,  2 Apr 2025 18:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619073; cv=none; b=A0+CuCJfQiVUSnOWbbl7nGZrVtZtibdy5jv6mnevFG3Mp4e1aoR1Ec+AtWZa6PAYCCsQMDS7PGKYM+/TiEzEEJiegoJNpCh+/AcNyK0NuF60d0jaChOxtMADSRzy3QvV2rq/Ty9kexn/v4BARgi6F1yMWJDOzKic8R/uGbpvlak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619073; c=relaxed/simple;
	bh=8sGZeCa0sKqwzNT7+OssvY0XCe1f29aCSfnouhi7cVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chKyTxxT4FgcyMJHuoScjPCvA7VMAXj+3fNpCrqqGP3UnV4jzgvbq5Trl4qYVkm4zgAb6g1hukSu1mEUu9CqlHMPvlyudg55DproJ+Y6zLXiMAAsFDu28HD/VtYrE/GF2fJ032cXEPA8gWBHlah4m0AGLLs4AWFzwrkoKplQq/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=UpeHXMHl; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47664364628so1270441cf.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Apr 2025 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1743619071; x=1744223871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sGZeCa0sKqwzNT7+OssvY0XCe1f29aCSfnouhi7cVM=;
        b=UpeHXMHlzqKf09a80PpbFREcBUIZ1dqQ8ZbaBTyd5+mEK78huJs0wY6ewTjVNf34JI
         VitV8Kn+IbDJVYPpr9GDRPkSWUzpvarn9sX/frxInxyzs4SLCrP89PQYpv0Bj6egULPj
         4SdHto9LJGUIDuQXBxsXhtbAgvDkRvqi4kYYiLtv+Zj3fuU305AZrJEO+wPgVYMRmhU+
         MUMk5cP6Vr2aDYTlO3BkMXPW3ayHvgCRQHL1CwWfVDVvm4lbv+uyoGV8oAzTKTtU//4C
         5NBeMdOZijjZI+0vLDB1vRusk6rpeYQGwkuwd47CbOa7FG0JiaXlT3UIs24b/lD+3/9g
         2S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743619071; x=1744223871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sGZeCa0sKqwzNT7+OssvY0XCe1f29aCSfnouhi7cVM=;
        b=A4gje68C2d1fYPMVMGBvxbKU2dPvbjO0QerV/Evy6+Vk/QONmZB3CqzQ8LcjXIID9h
         B0ufiSACYOEpbnBCq2om5BAujxjugWex5/cSZ+huw6+lYgDhndYCRFYAqbX6E1mCZjJn
         A+zM54EpM90RH/OEp8P7IHv3jPnA84PmGwMb9z6IASO5dda5jBeIrbhA3qAUX7/hfkfo
         hsR0cYjaGMZgGf0+1k89RM2IPKW7yT2khaCbvI1ffSCD91ZmWQCmKvE9oPE9NSrkBnaw
         2AIMP6ZFaYMl5rynKF/dV//tYzbHFBA1JmAMrjMvrYuTFcW36Rpa3Pv7MlP5tbgC01rJ
         H4TA==
X-Forwarded-Encrypted: i=1; AJvYcCV/vRaCG/X5vV36llkZ8kdTFPntu8VV8hNI8YTVo9yl4MyKftMPQ5AWkAEqYRjsg5W5VMmZtD22eg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyldmYSXmrPYsnCvjEKidMM+P1XYvWF1RnPqC6oU3bddIa20QeQ
	0kjG6kstnPuiM+DUfPC7eNwB9ZaDwnvEtBSBZSVey3ZcmasT1sEs2b6F0Rgpkip4qaxwMndulq1
	TsbHvmjE9GIHL+bVgeagg7TL0JqNbt30GS1r0WA==
X-Gm-Gg: ASbGnct3+sde1k45ni3iQKe3XTDjMN0HdtqatkxHs68EOXn29kmnKEdKNT8fvgYM9fc
	bsqhyCKuluezYzaFxVLfiLUwszbta4NZ/wYtu4J6QGlHsGJjYVkj8GPmWlO/tGTdTPqA8MxImR1
	y8rWUxSX5ujkmqtgo9F1TmeKM=
X-Google-Smtp-Source: AGHT+IGBm8eRAZTRRIQNHm7hrKsMWsRZO7yaRU5V8qu8Hz4XTnZI9DQTzhglhyasNi+RSLHZS4pwai1XiiNO0rfUKEY=
X-Received: by 2002:a05:622a:255:b0:472:145:3e02 with SMTP id
 d75a77b69052e-4791615e607mr11970971cf.8.1743619070935; Wed, 02 Apr 2025
 11:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <mafs0tt7eqt6f.fsf@amazon.de> <20250402164453.2470750-1-changyuanl@google.com>
 <mafs0ecyaqzmd.fsf_-_@amazon.de>
In-Reply-To: <mafs0ecyaqzmd.fsf_-_@amazon.de>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 2 Apr 2025 14:37:12 -0400
X-Gm-Features: AQ5f1Jr9Neh0jFNvgUt9co1Ay0Junb4b6fkF7RtFZQf-u5XIPaKITjI68-n5adU
Message-ID: <CA+CK2bBnbEtw7jL2fbukJ3aBCjn=-OVT70oEAsZ435vtFe18Vw@mail.gmail.com>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory preservation
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: Changyuan Lyu <changyuanl@google.com>, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgg@nvidia.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, pbonzini@redhat.com, 
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 12:47=E2=80=AFPM Pratyush Yadav <ptyadav@amazon.de> =
wrote:
>
> Hi,
>
> On Wed, Apr 02 2025, Changyuan Lyu wrote:
>
> > Hi Pratyush, Thanks for suggestions!
> >
> > On Thu, Mar 27, 2025 at 17:28:40 +0000, Pratyush Yadav <ptyadav@amazon.=
de> wrote:
> >> On Thu, Mar 27 2025, Jason Gunthorpe wrote:
> >>
> >> > On Thu, Mar 27, 2025 at 10:03:17AM +0000, Pratyush Yadav wrote:
> >> >
> >> >> Of course, with the current linked list structure, this cannot work=
. But
> >> >> I don't see why we need to have it. I think having a page-table lik=
e
> >> >> structure would be better -- only instead of having PTEs at the low=
est
> >> >> levels, you have the bitmap.
> >> >
> >> > Yes, but there is a trade off here of what I could write in 30 mins
> >> > and what is maximally possible :) The xarray is providing a page tab=
le
> >> > implementation in a library form.
> >> >
> >> > I think this whole thing can be optimized, especially the
> >> > memblock_reserve side, but the idea here is to get started and once =
we
> >> > have some data on what the actual preservation workload is then
> >> > someone can optimize this.
> >> >
> >> > Otherwise we are going to be spending months just polishing this one
> >> > patch without any actual data on where the performance issues and ho=
t
> >> > spots actually are.
> >>
> >> The memblock_reserve side we can optimize later, I agree. But the memo=
ry
> >> preservation format is ABI and I think that is worth spending a little
> >> more time on. And I don't think it should be that much more complex th=
an
> >> the current format.
> >>
> >> I want to hack around with it, so I'll give it a try over the next few
> >> days and see what I can come up with.
> >
> > I agree with Jason that "nothing is ABI at this
> > point" and it will take some time for KHO to stabilize.
> >
> > On the other hand if you have already came up with something working an=
d
> > simple, we can include it in the next version.
>
> I already have something that works with zero-order pages. I am
> currently implementing support for other orders. It is almost done, but
> I need to test it and do a performance comparison with the current
> patch. Will post something soon!

Hi Pratyush,

Just to clarify, how soon? We are about to post v6 for KHO, with all
other comments in this thread addressed.

Thanks,
Pasha

>
> --
> Regards,
> Pratyush Yadav

