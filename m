Return-Path: <linux-doc+bounces-62730-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B9CBC5F43
	for <lists+linux-doc@lfdr.de>; Wed, 08 Oct 2025 18:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 984F34E1F99
	for <lists+linux-doc@lfdr.de>; Wed,  8 Oct 2025 16:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A172BD029;
	Wed,  8 Oct 2025 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wWnT6dzH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE3B2857C2
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759939696; cv=none; b=fQ3D8ZRuNHkI/HXj7XbcYNmwkafe5D3K976kcgBqHBAR6lfSmly2+ce3qslVdsc121RPiZhn/1Ry1Dr9hSQI3Vu4FRrM6ucZ3QjPQUum+ZU9S4mDmsa/AJl4E3dz3iWSdccvJ15bXAkBSSv2Mysg2pC4CmDWdJ5KlX+rGfAdQCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759939696; c=relaxed/simple;
	bh=8PYyvMob9nRIUYQDEpTg5EhOuh10b9d2MSW5SJHh3gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4J3hjRSFVAfR/ZaAi3q2CZ080lU/OcS9xWdw2N5iJO61mK63DEAQu/T8mYae3GzGjQzt2Jo2yp9LkAsxK1EvIaTuv6EOpXjrTu3BL/WHOZko9qv44CowcFg+QKynkK2v4sEVHXimTswNdsPLa9GUVQyOJujrInEZtX5vuhmNsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wWnT6dzH; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4df3fabe9c2so424741cf.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759939694; x=1760544494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xx00fhwWNUyltYc8OJeL1zGs0cm20MUZAIdsCByVV9g=;
        b=wWnT6dzH4AvXsApC4qG4Uv30H01smcVHBA2seFu2LVw/I4q+GGlBRRzJVYNYKUxU39
         N6gBc78eCLTfEn7eGUzkeJMe9UNtm6gqINcY9keOKKHWvnWxEhoilLhj2ijQOzqaC2DT
         30SLJZgzae+NUswcPwkSKQ5tRZeeUV90/Z49cYUH/HxF9R0fBUcdUREkB1bpAnBeOSSQ
         q2fSAnMEAbD9948SGsvCDT1/u8JllPHNhPRfbZ47JRJSZeWBaifBFr7J8gxfQhswYqCk
         03xmtLFyaIIi0cRmM+9dVy5GYwe7GpmnlgYjZz1GlMsWzu+XLT0s1yoKFsaJt0xnLcXC
         PXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939694; x=1760544494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xx00fhwWNUyltYc8OJeL1zGs0cm20MUZAIdsCByVV9g=;
        b=qd+z92AkOUwkH2UAhY230GuwvUNy+YUiogtR8PTtMdqqfJumzkJj/MQjUDgn7tHkow
         SA0cE69kKfZSCUkMPtEj/T2f/DYblwnOB4YR1b+UfF6cmWDbJHmdrNn+wAWNmGtWbhKG
         lGqw/VVJHCJC8bIHyapmA8pRxcpjnIMLER+UxybLSe1uVaptNfdFg49kWppBBYFtNNuU
         VLEFTUxG/NXjK2s5u7I4B2lbCCCwIBx/wDtCYTWC8QMNrFnMS1o9FKQD/pd64vLm1gwB
         DnF1SegCKFkW+b/9ORaSq1pyBCG4LDRlnGejI7+X5yJjBJIGs7vWgXK8gkZc3E8TYkg9
         kgjg==
X-Forwarded-Encrypted: i=1; AJvYcCWtUXKnIbfckUbFANTmhw2bhJQiOh2BdcclDi0Gcbv5ALevQUSsuoDd8qDw0XUXXw01fYBeQeVvcdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+TCtPvLtG+fblxHHR46yEsCJVBg0ORQl6LVS7DqOTioR0xRAi
	aq0qRYU/CPkGcjkZcpAiv4KcfOUYcNwIG9WS5nT3dK5Q+3LAYznxv4Zfsm00jmBsrk/MYgeqDTB
	OrtObCYh8UTXTO8YQEqzUoHBu+XjWKet85VuZaZrF
X-Gm-Gg: ASbGnctEbyxb0iBjTANuc2eRQ+rfUbUR6n6FVt7/5OPtNDWGhHwFcEno2ba57lUkGhh
	M3KZIykF6h/051lJJjr9nJwlC2czmByO1yNzzRhSwGSpF7HTB5Jbd5WxZms3CjVXK8YSX3Ybd8P
	92hfxVBCJ1KP0+hRsMCaqCloodMftBrvBuyOhw+yv19vVkQjxSU8axZWBZqplpmUN9yufTOXyRZ
	UqMT6hnRcjkPT/qokYX7/g0vVMC2ljThyVcJes02QGJXg==
X-Google-Smtp-Source: AGHT+IHg4hw5sOQXHJy1YTbt7WUu/bkbgzbRorviULvd8txz03043wLweps3S8qJQwjtuJ4C8ZO9kMTHYzjXrs9B5l4=
X-Received: by 2002:a05:622a:189c:b0:4b3:8ee:521b with SMTP id
 d75a77b69052e-4e6eaa4fb46mr8600011cf.0.1759939693130; Wed, 08 Oct 2025
 09:08:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007214412.3832340-1-gourry@gourry.net> <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZ8PPWMchRN_t5-@tiehlicka>
In-Reply-To: <aOZ8PPWMchRN_t5-@tiehlicka>
From: Frank van der Linden <fvdl@google.com>
Date: Wed, 8 Oct 2025 09:08:01 -0700
X-Gm-Features: AS18NWDU62lmyrqTkj3dR1JTkOvcbXSMpXE1bJ_IYxnVWSgup_hL1VXRf4q9tR0
Message-ID: <CAPTztWaH7mJ3ACfqqYr1CFCDycw6Zm727t7wAa4n9Th22bn-yQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable sysctl"
To: Michal Hocko <mhocko@suse.com>
Cc: David Hildenbrand <david@redhat.com>, Gregory Price <gourry@gourry.net>, linux-mm@kvack.org, 
	corbet@lwn.net, muchun.song@linux.dev, osalvador@suse.de, 
	akpm@linux-foundation.org, hannes@cmpxchg.org, laoar.shao@gmail.com, 
	brauner@kernel.org, mclapinski@google.com, joel.granados@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mel Gorman <mgorman@suse.de>, Alexandru Moise <00moses.alexander00@gmail.com>, 
	Mike Kravetz <mike.kravetz@oracle.com>, David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 7:59=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrote=
:
>
> On Wed 08-10-25 10:58:23, David Hildenbrand wrote:
> > On 07.10.25 23:44, Gregory Price wrote:
> [...]
> > > @@ -926,7 +927,8 @@ static inline gfp_t htlb_alloc_mask(struct hstate=
 *h)
> > >   {
> > >     gfp_t gfp =3D __GFP_COMP | __GFP_NOWARN;
> > > -   gfp |=3D hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : G=
FP_HIGHUSER;
> > > +   gfp |=3D (hugepage_movable_supported(h) || hugepages_treat_as_mov=
able) ?
> > > +          GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> >
> > I mean, this is as ugly as it gets.
> >
> > Can't we just let that old approach RIP where it belongs? :)
> >
> > If something unmovable, it does not belong on ZONE_MOVABLE, as simple a=
s that.
>
> yes, I do agree. This is just muddying the semantic of the zone.
>
> Maybe what we really want is to have a configurable zone rather than a
> very specific consumer of it instead. What do I mean by that? We clearly
> have physically (DMA, DMA32) and usability (NORMAL, MOVABLE) constrained
> zones. So rather than having a MOVABLE zone we can have a single zone
> $FOO_NAME zone with configurable attributes - like allocation
> constrains (kernel, user, movable, etc). Now that we can overlap zones
> this should allow for quite a lot flexibility. Implementation wise this
> would require some tricks as we have 2 zone types for potentially 3
> different major usecases (kernel allocations, userspace reserved ranges
> without movability and movable allocations). I haven't thought this
> through completely and mostly throwing this as an idea (maybe won't
> work). Does that make sense?
> --
> Michal Hocko
> SUSE Labs
>

Right, it's all about what the intended goal is. There are two
different goals here. If the goal is hotremove, then no, you don't
want anything in ZONE_MOVABLE that is not migratable. But if the goal
is to have normal allocations always be migratable so that you can get
'gigantic' hugepages, then it is fine to have those gigantic hugepages
not be migratable. They are the goal, after all, and won't get in the
way of other gigantic hugepage allocations.

Somewhat similar situation with CMA (currently only hugetlb_cma). Is
is never ok to pin something in MIGRATE_CMA pageblocks. But what if
you have allocated a hugetlb page through cma_alloc? There is no point
in disallowing pinning for it. That 1G page is the goal, and pinning
it won't get in the way of other cma_alloc calls for 1G pages.

I agree that having mutiple zone properties is probably the way to go.

At one point, I implemented something like this, a minimum pinnable
page order for ZONE_MOVABLE. E.g. if you set it to 9, then anything >=3D
2M can be pinned, so ZONE_MOVABLE will help get you THPs, but not
necessarily anything else. There is also the use case for CXL memory,
where you don't want any kernel allocations to come from zones on that
node.

- Frank

