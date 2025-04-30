Return-Path: <linux-doc+bounces-44965-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E18AAA53F3
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 20:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE789165123
	for <lists+linux-doc@lfdr.de>; Wed, 30 Apr 2025 18:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079542750E0;
	Wed, 30 Apr 2025 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C1m5TLto"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4226018024
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038612; cv=none; b=H0ZGCPn5fT2a7+S4lXL17MK+0pWq7LQC4MsJKlk6pjXVPErjqUJWbswj3HaXP9/Rn2SQ47WU1QkGYjlFFO+pWc6z5Jy8Tcir9MiW+SfdoUZIQ8fZ0hKQf1hriv6wlxlLxEN0G591y9QbnzdEbfQzKabaW6CmmEQf+c0qcTXosqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038612; c=relaxed/simple;
	bh=nwMy4TfEjOLeyl5MmrHOSLVf52aNii4S6d88xbFYX+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upYL958oP/nFPaV7+PxjgDguUirtg+GBjefDvML+ZlwYPe4tKoUR33HmoPWwTtIs6ujjTfDKs5/oCihxxPrKSr4Pbe4aZqODSLzj5M1UTBunf9uKjfmILNbcHvVYYN1lkNXBPmG4aosDFq/bKkeGW5BII2JZXPhlCS922u4XjhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C1m5TLto; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746038610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGtyvAblPdq5h4RDZn9A53olL+bKAgVIn20wqzqV2vo=;
	b=C1m5TLtorFiTSlC9UZcrH0bJ3FZeZsPUNnOCbnlDdzPZF6bYE7fstNff9xLOX482rDCyIY
	pWq6Dvkr60JoB0uA8c5WlevEAIB8wia9nxVtA84HlpVSsJul+WZUDLz6e5xm8OaGu0gdTN
	gNsxk06KCIJjrnihUSwNtphs+Nhlkro=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-odrW6zE1M1SqfMRMPp4ZmQ-1; Wed, 30 Apr 2025 14:43:28 -0400
X-MC-Unique: odrW6zE1M1SqfMRMPp4ZmQ-1
X-Mimecast-MFC-AGG-ID: odrW6zE1M1SqfMRMPp4ZmQ_1746038608
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7071dd5dbc1so3252067b3.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038608; x=1746643408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGtyvAblPdq5h4RDZn9A53olL+bKAgVIn20wqzqV2vo=;
        b=g7RY7GGrI6QhJLmy5ZyhuNmYANWvxozk5OpRhVbw4aeVN0+Jg6kb4jzsqlcd0X7CLr
         OTdYsqoP0RX787m0RQkaoBfeHXcSSH/HY6TnETdzS85guFyRvikZOvPZGe419PqFLkAo
         IfeJxrmuc9l+8Wm4P0agn5g3qP/u1rKwzbK/obdiQblgS/cA+DP664HVpNmCZS8SAGM9
         LnANHs5qJ6yE/bHUyDB2ejaXqGjl/kiSGxrnxAaeMUqdEat858p5RF4Vhh1hm8SzViFy
         w0EGvNPPEKo8mDEf1ZsjKvWik7yM1VpDWalrk0vrffm0fjdku7esM5p9/gO+IyLsZTfw
         6byQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1GMkZqdlTK7OZbB8Jq5kcRHZkECPQvnPKW7+7wTSuTpabUy+VaZKrJy9w5ocIR12hFZHLtOOjpLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlNHm+OfnRkU2CS/obq37oRBY1ArQzHPpYIAMTpI/TtA5bfTWa
	FMaMM7q2wuU6DOOXQN/IkCHuC57cgWJ9g/F9HKdGL3mAzU3WgumfjbFX7904wF7AQVtvAMkg2Cy
	7xffyav4zhRn7WoxrLtQQ0P16olcZ2Uwq2/NMmquPd9Fke4lFRo4N9n9KkPLM37sZ4xS/6eWxc8
	+wY3YSi2ISeUGh3w9EfXJlpP8infyCqWCo
X-Gm-Gg: ASbGncuLYDFMtSaOLerTPnBxlV5G72oflT5cSwuD5UisV2UF4V16Cd6QDmgOS0072W+
	pyUXgWhuYG4dHdJc+EQ2vhqvoZbubyrxcqglQvnOnRMVBGL6P2zuizmz/HLnpg7tULNAsaze6Na
	vB5ypZ5Lc=
X-Received: by 2002:a05:690c:6e01:b0:6ef:5097:5daa with SMTP id 00721157ae682-708abe4b425mr66866057b3.34.1746038608280;
        Wed, 30 Apr 2025 11:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsC2vZql3Dxhu844riBX0qx5iUsGKJcDpqIjlHOQ18tsV7lZm4AquyInHqSFrwH5gRENp1Np1sxc9yUD6IIdY=
X-Received: by 2002:a05:690c:6e01:b0:6ef:5097:5daa with SMTP id
 00721157ae682-708abe4b425mr66865567b3.34.1746038608003; Wed, 30 Apr 2025
 11:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428181218.85925-1-npache@redhat.com> <20250428181218.85925-10-npache@redhat.com>
 <ba59d6aa-ade3-4440-a0ed-ef276b45f9d2@linux.alibaba.com>
In-Reply-To: <ba59d6aa-ade3-4440-a0ed-ef276b45f9d2@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 30 Apr 2025 12:43:01 -0600
X-Gm-Features: ATxdqUFWtHWq5aUrqZ9Adf9gtcRPQJMwNnkBweD5j20SDmerE4jyu4OMpWWRzi8
Message-ID: <CAA1CXcAqGxVHdwos4bdZ8kR3PS=iqs2UgQ+DKdTejo5jUm_5ww@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] khugepaged: avoid unnecessary mTHP collapse attempts
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, ryan.roberts@arm.com, willy@infradead.org, 
	peterx@redhat.com, ziy@nvidia.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	dev.jain@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com, 
	rdunlap@infradead.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 4:12=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/29 02:12, Nico Pache wrote:
> > There are cases where, if an attempted collapse fails, all subsequent
> > orders are guaranteed to also fail. Avoid these collapse attempts by
> > bailing out early.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 86d1153ce9e8..5e6732cccb86 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1365,6 +1365,23 @@ static int khugepaged_scan_bitmap(struct mm_stru=
ct *mm, unsigned long address,
> >                               collapsed +=3D (1 << order);
> >                               continue;
> >                       }
> > +                     /*
> > +                      * Some ret values indicate all lower order will =
also
> > +                      * fail, dont trying to collapse smaller orders
> > +                      */
> > +                     if (ret =3D=3D SCAN_EXCEED_NONE_PTE ||
> > +                             ret =3D=3D SCAN_EXCEED_SWAP_PTE ||
> > +                             ret =3D=3D SCAN_EXCEED_SHARED_PTE ||
> > +                             ret =3D=3D SCAN_PTE_NON_PRESENT ||
> > +                             ret =3D=3D SCAN_PTE_UFFD_WP ||
> > +                             ret =3D=3D SCAN_ALLOC_HUGE_PAGE_FAIL ||
> > +                             ret =3D=3D SCAN_CGROUP_CHARGE_FAIL ||
> > +                             ret =3D=3D SCAN_COPY_MC ||
> > +                             ret =3D=3D SCAN_PAGE_LOCK ||
> > +                             ret =3D=3D SCAN_PAGE_COUNT)
> > +                             goto next;
> > +                     else
> > +                             break;
>
> Better to merge this patch into patch 6, which can be helped to
> understand your logic.
Sounds good, it wasnt part of the original logic/RFCs so i separated
it out to get some review on it.
>


