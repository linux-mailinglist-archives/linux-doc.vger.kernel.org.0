Return-Path: <linux-doc+bounces-30284-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 140629C15DB
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 06:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 651DEB22551
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 05:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BED1CC152;
	Fri,  8 Nov 2024 05:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ejAqgG+S"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA816322E
	for <linux-doc@vger.kernel.org>; Fri,  8 Nov 2024 05:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731042229; cv=none; b=MF2ZGDkPZlYr5DlnACnIa8Haq6YOlx/MqCe6LxvXjj5VRybqx0NyxBULVFQ6IML6BX7LmqFO2F+A82AVRq6nV0nocDuGddDAppTqi5+Ny82SJnD2VkX7fkJe1cM1woCv1u2JUg3LAAQGhA/I7wa+a+oeT1NFRBUpKoWBi9chz4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731042229; c=relaxed/simple;
	bh=uf+L32/DgNO20OcfZBNfGBo/WqndrTtsLpsVzys+KCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zv8/5tpn55QYLuUVG9EPttZ73p9QLA+b7Ervky4BffLi7Bod9w1Pa1tQ3xebBH6GmTLEqQLg+4fS0mWrwtVh9dOobKss2WZ7GCIGjtxHPQut/AEI5YkLCyleHrN8R7VJdktqItVUqq+KAuykM5ePl/FLc7wSfSf7K+WeUrIpPiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ejAqgG+S; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e290222fdd0so1829470276.2
        for <linux-doc@vger.kernel.org>; Thu, 07 Nov 2024 21:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1731042226; x=1731647026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNGdr8+SBlIbzBqb5yEvyPo04wuD7xhCU+afHPhO0gw=;
        b=ejAqgG+SXERsk7UNaA++paZ25Y2xK3zQaqxsoV2Q6Zj/8Dp90EdlJifDnr8qZHaL7b
         b4Y2hPHvSkXAHeKmCX2ZsYSHR/QQA/Xttt1Z4ANGTWBOCRB/Y5MP48Xmg/ju3Yg3JiIy
         uG6WvqyTlEJzxCDpycnNJPL5I6/F+e8HqC0L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731042226; x=1731647026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNGdr8+SBlIbzBqb5yEvyPo04wuD7xhCU+afHPhO0gw=;
        b=A2jESp8vlABhUNoAvpAwQtMB4lG3YiOY5qoolbEWu12uzqPqa2GgvE4oFDqHG7OSfB
         CXpPtmMYpZ0sJnzUURhtO5XAONAgqtiQgBmHWec8lOAT6Yu2iMx85gU0YtErkvsI9iZl
         MKi+880VItl9n1jTHNimJBY2qnaV/NnSwjnSU+FXr2ZBbEFDy0qIl25GF+TlGXj5uuqo
         4NYCu7+Do8sIGCgOjybzbJlgIuImCuaOg+1tO1rHMtCb074SRT4wCxgYY6EfPW+kgBGr
         B6Vddu9/JJyWULcgzaXhUYEE1nRQG8ocCVkRkOy71zPcDo8OZXDos5aoWq07Dg8ARDAk
         Arbw==
X-Forwarded-Encrypted: i=1; AJvYcCX1VJTvF922ZTyXCqN1HbO8fRUbw8ZUJAj6//4ZTOdhkTbRoJWiZXsAlA555xHWaF2s8NHOVi6y/OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd/l8O8egD+/e4Wye/kOWz7Y7C+5nnBvWwZUEuts3tUM3BltDT
	jKjtdGoWbYsRjBD5TgYAS0iOY2W5PJ/3oZhvm9P/1yIdjEFq+wMr8B+yJOuiZ97jtIai5rFpegk
	85kTMVq3VkTacO54LiTGA4FKddPnIlUgKGMjG
X-Google-Smtp-Source: AGHT+IGoDwbKayxL5xzE6wZajGslwRdrnVXJFWNNltqAroKkGgy5sDfUc56OmQSlt11eQdDI1FCAj0JxG5Xs8SCXiV8=
X-Received: by 2002:a05:6902:2891:b0:e26:1422:400b with SMTP id
 3f1490d57ef6-e337f8dbf9fmr1496961276.53.1731042225686; Thu, 07 Nov 2024
 21:03:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030033514.1728937-1-zack.rusin@broadcom.com>
 <20241030033514.1728937-3-zack.rusin@broadcom.com> <CABgObfaRP6zKNhrO8_atGDLcHs=uvE0aT8cPKnt_vNHHM+8Nxg@mail.gmail.com>
 <CABQX2QMR=Nsn23zojFdhemR7tvGUz6_UM8Rgf6WLsxwDqoFtxg@mail.gmail.com> <Zy0__5YB9F5d0eZn@google.com>
In-Reply-To: <Zy0__5YB9F5d0eZn@google.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 8 Nov 2024 00:03:34 -0500
Message-ID: <CABQX2QNxFDhH1frsGpSQjSs3AWSdTibkxPrjq1QC7FGZC8Go-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: x86: Add support for VMware guest specific hypercalls
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Doug Covelli <doug.covelli@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Joel Stanley <joel@jms.id.au>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 5:32=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, Nov 04, 2024, Zack Rusin wrote:
> > On Mon, Nov 4, 2024 at 5:13=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.c=
om> wrote:
> > >
> > > On Wed, Oct 30, 2024 at 4:35=E2=80=AFAM Zack Rusin <zack.rusin@broadc=
om.com> wrote:
> > > >
> > > > VMware products handle hypercalls in userspace. Give KVM the abilit=
y
> > > > to run VMware guests unmodified by fowarding all hypercalls to the
> > > > userspace.
> > > >
> > > > Enabling of the KVM_CAP_X86_VMWARE_HYPERCALL_ENABLE capability turn=
s
> > > > the feature on - it's off by default. This allows vmx's built on to=
p
> > > > of KVM to support VMware specific hypercalls.
> > >
> > > Hi Zack,
> >
> > Hi, Paolo.
> >
> > Thank you for looking at this.
> >
> > > is there a spec of the hypercalls that are supported by userspace? I
> > > would like to understand if there's anything that's best handled in
> > > the kernel.
> >
> > There's no spec but we have open headers listing the hypercalls.
> > There's about a 100 of them (a few were deprecated), the full
> > list starts here:
> > https://github.com/vmware/open-vm-tools/blob/739c5a2f4bfd4cdda491e6a6f6=
869d88c0bd6972/open-vm-tools/lib/include/backdoor_def.h#L97
> > They're not well documented, but the names are pretty self-explenatory.
>
> At a quick glance, this one needs to be handled in KVM:
>
>   BDOOR_CMD_VCPU_MMIO_HONORS_PAT
>
> and these probably should be in KVM:
>
>   BDOOR_CMD_GETTIME
>   BDOOR_CMD_SIDT
>   BDOOR_CMD_SGDT
>   BDOOR_CMD_SLDT_STR
>   BDOOR_CMD_GETTIMEFULL
>   BDOOR_CMD_VCPU_LEGACY_X2APIC_OK
>   BDOOR_CMD_STEALCLOCK
>
> and these maybe? (it's not clear what they do, from the name alone)
>
>   BDOOR_CMD_GET_VCPU_INFO
>   BDOOR_CMD_VCPU_RESERVED

I'm not sure if there's any value in implementing a few of them. iirc
there's 101 of them (as I mentioned a lot have been deprecated but
that's for userspace, on the host we still have to do something for
old guests using them) and, if out of those 101 we implement 100 in
the kernel then, as far as this patch is concerned, it's no different
than if we had 0 out of 101 because we're still going to have to exit
to userspace to handle that 1 remaining.

Unless you're saying that those would be useful to you. In which case
I'd be glad to implement them for you, but I'd put them behind some
kind of a cap or a kernel config because we wouldn't be using them -
besides what Doug mentioned - we already maintain the shared code for
them that's used on Windows, MacOS, ESX and Linux so even if we had
them in the Linux kernel it would still make more sense to use the
code that's shared with the other OSes to lessen the maintenance
burden (so that changing anything within that code consistently
changes across all the OSes).

> > > If we allow forwarding _all_ hypercalls to userspace, then people wil=
l
> > > use it for things other than VMware and there goes all hope of
> > > accelerating stuff in the kernel in the future.
>
> To some extent, that ship has sailed, no?  E.g. do KVM_XEN_HVM_CONFIG wit=
h
> KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL set, and userspace can intercept prett=
y much
> all hypercalls with very few side effects.
>
> > > So even having _some_ checks in the kernel before going out to
> > > userspace would keep that door open, or at least try.
> >
> > Doug just looked at this and I think I might have an idea on how to
> > limit the scope at least a bit: if you think it would help we could
> > limit forwarding of hypercalls to userspace only to those that that
> > come with a BDOOR_MAGIC (which is 0x564D5868) in eax. Would that help?
>
> I don't think it addresses Paolo's concern (if I understood Paolo's conce=
rn
> correctly), but it would help from the perspective of allowing KVM to sup=
port
> VMware hypercalls and Xen/Hyper-V/KVM hypercalls in the same VM.

Yea, I just don't think there's any realistic way we could handle all
of those hypercalls in the kernel so I'm trying to offer some ideas on
how to lessen the scope to make it as painless as possible. Unless you
think we could somehow parlay my piercing blue eyes into getting those
patches in as is, in which case let's do that ;)

> I also think we should add CONFIG_KVM_VMWARE from the get-go, and if we'r=
e feeling
> lucky, maybe even retroactively bury KVM_CAP_X86_VMWARE_BACKDOOR behind t=
hat
> Kconfig.  That would allow limiting the exposure to VMware specific code,=
 e.g. if
> KVM does end up handling hypercalls in-kernel.  And it might deter abuse =
to some
> extent.

I thought about that too. I was worried that even if we make it on by
default it will require quite a bit of handholding to make sure all
the distros include it, or otherwise on desktops Workstation still
wouldn't work with KVM by default, I also felt a little silly trying
to add a kernel config for those few lines that would be on pretty
much everywhere and since we didn't implement the vmware backdoor
functionality I didn't want to presume and try to shield a feature
that might be in production by others with a new kernel config.

z

