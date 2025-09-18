Return-Path: <linux-doc+bounces-60328-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF456B55AB3
	for <lists+linux-doc@lfdr.de>; Sat, 13 Sep 2025 02:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A8F91C20CC4
	for <lists+linux-doc@lfdr.de>; Sat, 13 Sep 2025 00:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ADC1BC58;
	Sat, 13 Sep 2025 00:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FhVDKQve"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044B529D05
	for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 00:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757723366; cv=none; b=oh4EH2K2weKew1w9d2GnBEcW3G9j9k9ma6uRbKvB9os733USDrNUCT3VeOZ0r0PFt51sikV5hSRxu1XqqOjy7rxTsFeY/JXLKGiALfJ/Ho0d7+4RIACkSRSoQN4VLi+SV19B/nUDZf5Fjg99R8RE9hK6L/8jaFkMFMoqeveI3NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757723366; c=relaxed/simple;
	bh=s1fdhbuUsD9MQP0PGb9Ytw8aU7X4xbIFZ9UR7PMXzJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhpFY/tvDElmgmgUEJjJ9/iHYWhSUgxU+tXxX/x0M//79KpFLzRouIMoP/V0oDR53yxMBa3a3j8W512r+ani21lS45PBX8yPFN+QLLiQP6nRuNWlHyuDbJfB98ZkATH83mkDcqh3ZUI2DwSdCZk/ptoXhQZjbybh6UQaea3t/ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FhVDKQve; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757723364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1fdhbuUsD9MQP0PGb9Ytw8aU7X4xbIFZ9UR7PMXzJY=;
	b=FhVDKQveo8BNBS8jEvjL5YHwtU/D9GWJqMmLcmpzsIPC9OFvV90FxpI3F7mzF955tGIqHr
	i/+MBLoPMIz3liEfiET0LGMrkyJUziAmLp9/eW1lg2nUr+BKS8M7x/AaxHmpdTiqQqJxpL
	4ImahQ/8tZkyOcYy6ZhFgvdMSjyZ0Kk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483--4Hk-xfuOXiXR_4mVuE71g-1; Fri, 12 Sep 2025 20:29:22 -0400
X-MC-Unique: -4Hk-xfuOXiXR_4mVuE71g-1
X-Mimecast-MFC-AGG-ID: -4Hk-xfuOXiXR_4mVuE71g_1757723362
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-731572565c3so10110437b3.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 17:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757723362; x=1758328162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1fdhbuUsD9MQP0PGb9Ytw8aU7X4xbIFZ9UR7PMXzJY=;
        b=AhEoxcSq2qCAYAJTCDV9auvH8Hk2dySmkWTqCTNtbvH1cvqVkLcKCccqT0XnMipiil
         MkdLb1jlb45Kis+Fzah6A8ia8t0PRwel0JefCFDVLggJrbmgKppBJexu1lxdWxfzWPn5
         rLbcJ2rkyfif2VpCWe2Z+LzSZ/wnS7f/C94O1gehBBIM1G1euDN5stK8gxpzHAsxQy4I
         gSdKojG2FjSrB98rdKB9xWIlMiQnPylB78TcYXw6uzhiMxH2xofdkud4AOyebqBVKWOq
         GnxrsimIhIx/co/nrFD228zBcczgbBpT/Z6vNrTma9lokWkeov3ARLbmqD0GBdFnAxVV
         kFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKwFjfvzHYxZt82a9n2IQrCWzKfCQOCQ5xrnbjhN0Z2nB4bmngy5HPqwjXKjcspMLhkG8OZEenRA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5my452E3tzAIFKPvXJZdM/e6xBoYZI7Q2dnqbYAQQT6oAJyqK
	tNmV0vL3c0CWMUNAQXd4PBxXVLAq5HeqjwYLMMeFxCc2aummCgv/4qeRhcBNcPdSEjGm69tA9XE
	DI/c/R0eLwNyAaBQy82RY7G6NR2B/v1IZxtVo60Qy+sxRX/fw3s3J6JxCGJj9HHfsjsS3fbVXNf
	/rvyLl4fQGWfGbRZ8Qtc9MfIjNQS5+DlWDsbKi
X-Gm-Gg: ASbGncvlpT0F/06hNJafSMDaIJAV5Sr4A1CaVKSvzdoGiHdU5YFpOc1rWnpOkREpRLx
	Q23fsbhTMKxxa1trxcgzsmvl54LHD43beBw+HqfBIxCmBropEOfz/43DgLq6UNEV+bK+OAY2UgA
	XBRu7C7Vx76PN2xPVo2e+5g6lp/ycVXqosE34=
X-Received: by 2002:a05:690c:260a:b0:723:b6c4:3f1c with SMTP id 00721157ae682-730623e2925mr43229007b3.5.1757723361824;
        Fri, 12 Sep 2025 17:29:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGP1ODcsVeOBTo/o3/Af/Xr6qV4tedAzQFkTLbisgc33kkPWRX3CWYPLhnD2DHm/8atuDvj5iDMrMVSvY62shE=
X-Received: by 2002:a05:690c:260a:b0:723:b6c4:3f1c with SMTP id
 00721157ae682-730623e2925mr43228427b3.5.1757723361261; Fri, 12 Sep 2025
 17:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912032810.197475-1-npache@redhat.com> <ppzgohmkll7dbf2aiwhw7f4spf6kxjtwwe3djkx26pwy4ekrnd@mgeantq5sn2z>
 <43f42d9d-f814-4b54-91a6-3073f7c7cedf@redhat.com> <ab8c2e03-53fb-402c-a674-c2c6ab11f54e@redhat.com>
 <rapl4xr55zv2nq3jh5ulk4wvfyxa2kmbnnb4uram6q43y4cbwn@dv5m52ocyqne>
 <80c50bf4-27b1-483c-9977-2519369c2630@redhat.com> <7ri4u7uxsv6elyohqiq2w5oxv4yhk2tyniwglfxtiueiyofb3n@l4exlmlf5ty4>
 <59641180-a0d9-400c-aaeb-0c9e93954bf5@redhat.com> <c5bcecb8-13e7-4db5-849e-2120c69b2af5@lucifer.local>
 <ed784d6c-6c2a-4e0b-ad2f-e953bf310ce8@redhat.com> <dcfc7e27-d3c8-4fd0-8b7b-ce8f5051d597@lucifer.local>
In-Reply-To: <dcfc7e27-d3c8-4fd0-8b7b-ce8f5051d597@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Fri, 12 Sep 2025 18:28:55 -0600
X-Gm-Features: Ac12FXwNur65Nm5OvErIVCDdmRDdfURv-x3te_kyR-KK-IxwM19Wyqk2iaWoTIE
Message-ID: <CAA1CXcDyTR64jdhZPae2HPYOwsUxU1R1tj1hMeE=vV_ey9GXsg@mail.gmail.com>
Subject: Re: [PATCH v11 00/15] khugepaged: mTHP support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com, 
	catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org, 
	dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, jglisse@google.com, 
	surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com, 
	richard.weiyang@gmail.com, lance.yang@linux.dev, vbabka@suse.cz, 
	rppt@kernel.org, jannh@google.com, pfalcato@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 12:22=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Sep 12, 2025 at 07:53:22PM +0200, David Hildenbrand wrote:
> > On 12.09.25 17:51, Lorenzo Stoakes wrote:
> > > With all this stuff said, do we have an actual plan for what we inten=
d to do
> > > _now_?
> >
> > Oh no, no I have to use my brain and it's Friday evening.
>
> I apologise :)
>
> >
> > >
> > > As Nico has implemented a basic solution here that we all seem to agr=
ee is not
> > > what we want.
> > >
> > > Without needing special new hardware or major reworks, what would thi=
s parameter
> > > look like?
> > >
> > > What would the heuristics be? What about the eagerness scales?
> > >
> > > I'm but a simple kernel developer,
> >
> > :)
> >
> > and interested in simple pragmatic stuff :)
> > > do you have a plan right now David?
> >
> > Ehm, if you ask me that way ...
> >
> > >
> > > Maybe we can start with something simple like a rough percentage per =
eagerness
> > > entry that then gets scaled based on utilisation?
> >
> > ... I think we should probably:
> >
> > 1) Start with something very simple for mTHP that doesn't lock us into =
any particular direction.
>
> Yes.
>
> >
> > 2) Add an "eagerness" parameter with fixed scale and use that for mTHP =
as well
>
> Yes I think we're all pretty onboard with that it seems!
>
> >
> > 3) Improve that "eagerness" algorithm using a dynamic scale or #whateve=
r
>
> Right, I feel like we could start with some very simple linear thing here=
 and
> later maybe refine it?

I agree, something like 0,32,64,128,255,511 seem to map well, and is
not too different from what im doing with the scaling by
(HPAGE_PMD_ORDER - order).

>
> >
> > 4) Solve world peace and world hunger
>
> Yes! That would be pretty great ;)
This should probably be a larger priority
>
> >
> > 5) Connect it all to memory pressure / reclaim / shrinker / heuristics =
/ hw hotness / #whatever
>
> I think these are TODOs :)
>
> >
> >
> > I maintain my initial position that just using
> >
> > max_ptes_none =3D=3D 511 -> collapse mTHP always
> > max_ptes_none !=3D 511 -> collapse mTHP only if we all PTEs are non-non=
e/zero
> >
> > As a starting point is probably simple and best, and likely leaves room=
 for any
> > changes later.
>
> Yes.
>
> >
> >
> > Of course, we could do what Nico is proposing here, as 1) and change it=
 all later.
>
> Right.
>
> But that does mean for mTHP we're limited to 256 (or 255 was it?) but I g=
uess
> given the 'creep' issue that's sensible.

I dont think thats much different to what david is trying to propose,
given eagerness=3D9 would be 50%.
at 10 or 511, no matter what, you will only ever collapse to the
largest enabled order.
The difference in my approach is that technically, with PMD disabled,
and 511, you would still need 50% utilization to collapse, which is
not ideal if you always want to collapse to some mTHP size even with 1
page occupied. With davids solution this is solved by never allowing
anything in between 255-511.

>
> >
> > It's just when it comes to documenting all that stuff in patch #15 that=
 I feel like
> > "alright, we shouldn't be doing it longterm like that, so let's not mak=
e anybody
> > depend on any weird behavior here by over-domenting it".
> >
> > I mean
> >
> > "
> > +To prevent "creeping" behavior where collapses continuously promote to=
 larger
> > +orders, if max_ptes_none >=3D HPAGE_PMD_NR/2 (255 on 4K page size), it=
 is
> > +capped to HPAGE_PMD_NR/2 - 1 for mTHP collapses. This is due to the fa=
ct
> > +that introducing more than half of the pages to be non-zero it will al=
ways
> > +satisfy the eligibility check on the next scan and the region will be =
collapse.
> > "
> >
> > Is just way, way to detailed.
> >
> > I would just say "The kernel might decide to use a more conservative ap=
proach
> > when collapsing smaller THPs" etc.
> >
> >
> > Thoughts?
>
> Well I've sort of reviewed oppositely there :) well at least that it need=
s to be
> a hell of a lot clearer (I find that comment really compressed and I just=
 don't
> really understand it).

I think your review is still valid to improve the internal code
comment. I think David is suggesting to not be so specific in the
actual admin-guide docs as we move towards a more opaque tunable.

>
> I guess I didn't think about people reading that and relying on it, so ma=
ybe we
> could alternatively make that succinct.
>
> But I think it'd be better to say something like "mTHP collapse cannot cu=
rrently
> correctly function with half or more of the PTE entries empty, so we cap =
at just
> below this level" in this case.

Some middle ground might be the best answer, not too specific, but
also allude to the interworking a little.

Cheers,
-- Nico
>
> >
> > --
> > Cheers
> >
> > David / dhildenb
> >
>
> Cheers, Lorenzo
>


