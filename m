Return-Path: <linux-doc+bounces-60321-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4646FB55A59
	for <lists+linux-doc@lfdr.de>; Sat, 13 Sep 2025 01:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6C5189AD50
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 23:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6798C29D26E;
	Fri, 12 Sep 2025 23:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UAvHGdvz"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F4D25F7A9
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 23:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757719942; cv=none; b=qTv53WP08kf8bFJDS2nn9kwtWR51jXaVGNGeToe49zbWLdANa2eK/6T/f57SA73CWE53rXLu8MB6SSm710XeOZACkmpAD0e7nnSqihYcOiRWUYFMkyUbvMZ3ZXAtDGQ75ynUP+3YW+bArlxGmmTXeagH33GT7U8YV5vcNyLrYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757719942; c=relaxed/simple;
	bh=qeJiLUczh+jDUEzC4NUWxpIlCOTOGxO/IeLpeysMhqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dm0V22yVuOv4fMrMAWovZoiqxeQytNjbmPbTUuugXMzbezCY/+Br+oEYgBr8K8jnBk6Gwp/1BDmx2rvxzsoQ73uHPz22NPtqTqXyyefzC89znbv2pJED0KurVnietqTi12X4aC9J/S+hjeRKYqeVv/Ee6mTEYTeiTpENCRAcTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UAvHGdvz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757719939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qeJiLUczh+jDUEzC4NUWxpIlCOTOGxO/IeLpeysMhqw=;
	b=UAvHGdvzGEY1ZxZitzkMoIwwFXg8Ix1vIBNRuNAe2HJ6/ahZLE9EiqM6aOzdXm00yDcYgs
	mPzN4A/y/Y1GyhVuPoJW25YOxd4mmVdhTRMNrehWcxAREAf2sn0LLeUNJwXb57AyXWFe4h
	97MeXKPAfykbdafbMIhKGAW/EpQUjq0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-PAI7NQh1McWTETeDgLsNGw-1; Fri, 12 Sep 2025 19:32:18 -0400
X-MC-Unique: PAI7NQh1McWTETeDgLsNGw-1
X-Mimecast-MFC-AGG-ID: PAI7NQh1McWTETeDgLsNGw_1757719937
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-71d60163d68so36140137b3.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 16:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757719937; x=1758324737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeJiLUczh+jDUEzC4NUWxpIlCOTOGxO/IeLpeysMhqw=;
        b=bh4Sext6dwr4tYj8XZ+966AJJYSzgS0hfRgC53pGmF8ePDQBzyN66FD0HVSQGA1JT4
         o6jOW6BxwIgypyzHNLmH77vARC1XQf8WQKVk9LRf00T1qJhHYxUpo+bQsLq1wjY5ToZx
         MObEwUddo+20fkRSPduUuyv9fdJkLH+gmhdTKWsT1ISgPalo+s9u20Lu6gX+NX8uhl02
         hO9MJM02HsvStxumhUMvhMRoB6+u5fiP9j5uMOZJzdKX5k0tfOAHPGNgBT7hAvf9uNN9
         Bo4v9gRUz90bhpc3K3RakJMFif/zYh6218GwpW2IebGbiYXzc+A+/DGzCNj1VkTzhQUo
         swYw==
X-Forwarded-Encrypted: i=1; AJvYcCXTWsMp37ILmz2OaqAMNk53inQP2bc4QBg+dbFHBgrafV5o63aaqYHUl/BAKcO64+I/6zAsI5AcQSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqJaHkGXNpSlfRtbanWQYthepYFdiv2X7Ai0OsG+BXw8pa01NB
	mysTYlM+FGkPfECZIqj8WLncK7jOhxi9MTRU+8w9PLM8pVrnolkl1L94nR6CqaLRvVJQlrNoI+Z
	g6g/0nFqt+Iytbi18VpqIQ4haf/EFtOr9+4ncYx0en3D7VXXSgoLE+fytbQNr8uG94MrWQEtEKc
	08CodZb0sQ0lWq5zhtUMWTWWvOInainj6PW0Gi
X-Gm-Gg: ASbGncsT1PDSUq3Ox+sBaKsNev+4vivtR9ipKfeiTbecWy47YIpSzTXNwGHS6kiaw6m
	c2j/BG8V/Qp72/rdgoPad6zzl4DSX44f+K5TRl5ley+Q5ntaw4Snp+X2bmEc3qfn5kynUo6sg3A
	Dggy/fyusB8NPuoRBCqfv58VTcv5QWPfbEF5g=
X-Received: by 2002:a05:690c:6d01:b0:71f:b624:323a with SMTP id 00721157ae682-730631915bcmr48747467b3.22.1757719937517;
        Fri, 12 Sep 2025 16:32:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK1z++fo1VlAXjdvZLZjfG0xFXeJ93pQE2PD3RXY0X2Ke9QcK3xuGmHvpnFUlHapj1cPtD8bnkIBPCoxV0I88=
X-Received: by 2002:a05:690c:6d01:b0:71f:b624:323a with SMTP id
 00721157ae682-730631915bcmr48747047b3.22.1757719937032; Fri, 12 Sep 2025
 16:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912032810.197475-1-npache@redhat.com> <ppzgohmkll7dbf2aiwhw7f4spf6kxjtwwe3djkx26pwy4ekrnd@mgeantq5sn2z>
 <d0e81c75-ad63-4e37-9948-3ae89bc94334@redhat.com>
In-Reply-To: <d0e81c75-ad63-4e37-9948-3ae89bc94334@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Fri, 12 Sep 2025 17:31:51 -0600
X-Gm-Features: Ac12FXw_TS5TScQ8j1sWTJVRrVUFEA5RkwbW-1v00F8cU_6m8fECtZnnxeVB4sc
Message-ID: <CAA1CXcA+pb5KvEnJJqdf1eSjaFiBZ82MRB+KDmyhj3DbiQqOxg@mail.gmail.com>
Subject: Re: [PATCH v11 00/15] khugepaged: mTHP support
To: David Hildenbrand <david@redhat.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
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

On Fri, Sep 12, 2025 at 6:25=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 12.09.25 14:19, Kiryl Shutsemau wrote:
> > On Thu, Sep 11, 2025 at 09:27:55PM -0600, Nico Pache wrote:
> >> The following series provides khugepaged with the capability to collap=
se
> >> anonymous memory regions to mTHPs.
> >>
> >> To achieve this we generalize the khugepaged functions to no longer de=
pend
> >> on PMD_ORDER. Then during the PMD scan, we use a bitmap to track indiv=
idual
> >> pages that are occupied (!none/zero). After the PMD scan is done, we d=
o
> >> binary recursion on the bitmap to find the optimal mTHP sizes for the =
PMD
> >> range. The restriction on max_ptes_none is removed during the scan, to=
 make
> >> sure we account for the whole PMD range. When no mTHP size is enabled,=
 the
> >> legacy behavior of khugepaged is maintained. max_ptes_none will be sca=
led
> >> by the attempted collapse order to determine how full a mTHP must be t=
o be
> >> eligible for the collapse to occur. If a mTHP collapse is attempted, b=
ut
> >> contains swapped out, or shared pages, we don't perform the collapse. =
It is
> >> now also possible to collapse to mTHPs without requiring the PMD THP s=
ize
> >> to be enabled.
> >>
> >> When enabling (m)THP sizes, if max_ptes_none >=3D HPAGE_PMD_NR/2 (255 =
on
> >> 4K page size), it will be automatically capped to HPAGE_PMD_NR/2 - 1 f=
or
> >> mTHP collapses to prevent collapse "creep" behavior. This prevents
> >> constantly promoting mTHPs to the next available size, which would occ=
ur
> >> because a collapse introduces more non-zero pages that would satisfy t=
he
> >> promotion condition on subsequent scans.
> >
> > Hm. Maybe instead of capping at HPAGE_PMD_NR/2 - 1 we can count
> > all-zeros 4k as none_or_zero? It mirrors the logic of shrinker.
> >
>
> I am all for not adding any more ugliness on top of all the ugliness we
> added in the past.
>
> I will soon propose deprecating that parameter in favor of something
> that makes a bit more sense.
>
> In essence, we'll likely have an "eagerness" parameter that ranges from
> 0 to 10. 10 is essentially "always collapse" and 0 "never collapse if
> not all is populated".
Hi David,

Do you have any reason for 0-10, I'm guessing these will map to
different max_ptes_none values.
I suggest 0-5, mapping to 0,32,64,128,255,511

You can take my collapse_max_ptes_none() function in this series and
rework it for the larger sysctl work you are doing.

Cheers,
-- Nico
>
> In between we will have more flexibility on how to set these values.
>
> Likely 9 will be around 50% to not even motivate the user to set
> something that does not make sense (creep).
>
> Of course, the old parameter will have to stick around in compat mode.
>
> --
> Cheers
>
> David / dhildenb
>


