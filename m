Return-Path: <linux-doc+bounces-45017-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC70BAA666C
	for <lists+linux-doc@lfdr.de>; Fri,  2 May 2025 00:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4129A005E
	for <lists+linux-doc@lfdr.de>; Thu,  1 May 2025 22:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE8825333F;
	Thu,  1 May 2025 22:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rzr9WJ31"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840021ADC2
	for <linux-doc@vger.kernel.org>; Thu,  1 May 2025 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140045; cv=none; b=rjOg3ttUy8kIHK58Zs4kFlGU8sZB/tw9TUz8uJPoR19Cs/uTEkIkDmJhI52qqOiMEZyQ4IU/LIKPFmAjVUhqt60SPpKv6h1goy9HwXOhbfeQHu6iTL/GkklseNNbOHrVSp4LVolpcyN6sH3tIU9vPS+20bMIICAr7PdUyUdJCKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140045; c=relaxed/simple;
	bh=7EqN3p0cTkX1ZI/wbSjgHj4rbRQELoTOTq2bsNwW5k8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTJnov0f0mE60HnOcZdiyZEglGvNVebmu3lAk11BjGoqrqUZa1YH7Is1Y3kFkO55GZlw69X0WevhA/JhdfxzrmHf0lh7JSoQqMbghn/WXl09jxBDGp3xiPdkmN5rYl6ZmaECTNwNA8ceQ21pRNsSjdbvdni3aWeRPWzi14Sl2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rzr9WJ31; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746140042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KtLg0B1vrzZBeuo/C7fy1HGxDtxIeRaGRM5T8fcaxh0=;
	b=Rzr9WJ31vCRyHJCBM9qqcQM3QQui2ALwJSkGfjuo7N6g5l+SZ8ZMr+LDwejWoD0TZrL1FF
	G3Q2vUzExePy0TvBt6PIVSzHlkCmeixiTze4B1vdpcxA0nEJGZXk1UWoXm5rBuv22EJqQL
	GKMOOsj5RM9Su03HrX9hkmilip+iYVw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-9synvUw8MPKvV177IpjJUg-1; Thu, 01 May 2025 18:54:01 -0400
X-MC-Unique: 9synvUw8MPKvV177IpjJUg-1
X-Mimecast-MFC-AGG-ID: 9synvUw8MPKvV177IpjJUg_1746140041
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-703b133f6bbso22743897b3.1
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 15:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140041; x=1746744841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtLg0B1vrzZBeuo/C7fy1HGxDtxIeRaGRM5T8fcaxh0=;
        b=V4ays9v0qbGoDA89wvO9jjWe+wGUNSmkyIYtIMwqVdvyLpnDk11xwNGB7AkuYZFQ9k
         NHeZ+X6a6Gf+4uZULJaVrlUS/Niobj/TZNIQp8JKsQMz4cgiOaUM4DGl9WLFFxoNYHRH
         e5OtKMQ8E8OsXxEsdNUnXVGfdSuz4sQ17uNN79mJloUyDVTDO+56E8mwvmWui/bTp0CJ
         goRIGNvv8tBWkJP4G+WGbQnkWKJhpK08FwutwNuCwHcVZHqe05L7Qgc6CuKonmdyax0S
         KZQdFlXNIV34TgHjQ78RT1lqVS00XL5bnF5RUNYyPsbgwUg7N/rXBFTNbSBe7HoBFHcT
         koqg==
X-Forwarded-Encrypted: i=1; AJvYcCUGeLuhMIpLAe1MG4f1GOcRWczzNqcUUaJf97CP+slS2wlPrwThlxskKsabZAsMLbSt1OOR4EtvfBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8+TDaqHQ/rp1YrNoegT1F7C++nWWuF6HqJolt5V/pfYlqyrj
	Eaq72Ua5YUh3f/Yu+045bTb3boSjxQiCNdcTDCfotf3Z8OiF32imtJf46y5fROvuG8tSV4DazdI
	cMFhoSp3HT29swg9/GfKZ+ZLH43bbi8eI5Z5LA+FkGoc5DGd/zcj4IZCymzRLv/MPF9KIWOGqmI
	sHNSlRLx0NY7WJ4TMYT9Ahr2jnHYjsorYc
X-Gm-Gg: ASbGncuYua1Noja2tTziXATSChu+KXnqSXVItcaRI5IqoGdZosbe7o0N+iBtPxcwJbN
	EXJ2jKRs6gg7b7kD033wPyM1KceMJLoIjLNZMnKyqe6aHrEf59JGSNPZ7Q8D7fVC6Tze2SRESCn
	glYmlLLhs=
X-Received: by 2002:a05:690c:6892:b0:708:15dd:712 with SMTP id 00721157ae682-708cee0d4e0mr15576487b3.32.1746140040870;
        Thu, 01 May 2025 15:54:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGPElw1UZQRMg/NB24PlPPnaQvolOetsYL1qWqN2H/DAHnfrkNvMouRvuxZDqL6cOU1L++ooR/hLBGonde+Go=
X-Received: by 2002:a05:690c:6892:b0:708:15dd:712 with SMTP id
 00721157ae682-708cee0d4e0mr15576337b3.32.1746140040523; Thu, 01 May 2025
 15:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428182904.93989-1-npache@redhat.com> <20250428182904.93989-4-npache@redhat.com>
 <BE08D7F9-716B-4EE8-AC4E-2D9F4C5D4A05@nvidia.com>
In-Reply-To: <BE08D7F9-716B-4EE8-AC4E-2D9F4C5D4A05@nvidia.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 1 May 2025 16:53:34 -0600
X-Gm-Features: ATxdqUG3EUSAuZQcIBHamAtOStWW2NfUYwlhaLO5OYc6mM0jjaysT4fqAsR4EYU
Message-ID: <CAA1CXcBM5210TqVn_bE0yAxo0SR=_g4GAgZoopwSDbyFYL+pqw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] khugepaged: add defer option to mTHP options
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	willy@infradead.org, peterx@redhat.com, shuah@kernel.org, 
	wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com, 
	vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com, 
	yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com, 
	aarcange@redhat.com, raquini@redhat.com, dev.jain@arm.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 2:34=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On 28 Apr 2025, at 14:29, Nico Pache wrote:
>
> > Now that we have defer to globally disable THPs at fault time, lets add
> > a defer setting to the mTHP options. This will allow khugepaged to
> > operate at that order, while avoiding it at PF time.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  include/linux/huge_mm.h |  5 +++++
> >  mm/huge_memory.c        | 38 +++++++++++++++++++++++++++++++++-----
> >  mm/khugepaged.c         |  8 ++++----
> >  3 files changed, 42 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index 57e6c962afb1..a877c59bea67 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -96,6 +96,7 @@ extern struct kobj_attribute thpsize_shmem_enabled_at=
tr;
> >  #define TVA_SMAPS            (1 << 0)        /* Will be used for procf=
s */
> >  #define TVA_IN_PF            (1 << 1)        /* Page fault handler */
> >  #define TVA_ENFORCE_SYSFS    (1 << 2)        /* Obey sysfs configurati=
on */
> > +#define TVA_IN_KHUGEPAGE     ((1 << 2) | (1 << 3)) /* Khugepaged defer=
 support */
>
> Why is TVA_IN_KHUGEPAGE a superset of TVA_ENFORCE_SYSFS? Because khugepag=
ed
> also obeys sysfs configuration?
Correct! The need for a TVA_IN_KHUGEPAGED is to isolate the "deferred"
mTHPs from being "allowed" unless we are in khugepaged.
>
> I wonder if explicitly coding the behavior is better. For example,
> in __thp_vma_allowable_orders(), enforce_sysfs =3D tva_flags & (TVA_ENFOR=
CE_SYSFS | TVA_IN_KHUGEPAGE).
I'm rather indifferent about either approach. If you (or any others)
have a strong preference for an explicit (none-supersetted) TVA flag I
can make the change.
>
> >
> >  #define thp_vma_allowable_order(vma, vm_flags, tva_flags, order) \
> >       (!!thp_vma_allowable_orders(vma, vm_flags, tva_flags, BIT(order))=
)
> > @@ -182,6 +183,7 @@ extern unsigned long transparent_hugepage_flags;
> >  extern unsigned long huge_anon_orders_always;
> >  extern unsigned long huge_anon_orders_madvise;
> >  extern unsigned long huge_anon_orders_inherit;
> > +extern unsigned long huge_anon_orders_defer;
> >
> >  static inline bool hugepage_global_enabled(void)
> >  {
> > @@ -306,6 +308,9 @@ unsigned long thp_vma_allowable_orders(struct vm_ar=
ea_struct *vma,
> >       /* Optimization to check if required orders are enabled early. */
> >       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>
> And code here becomes tva_flags & (TVA_ENFORCE_SYSFS | TVA_IN_KHUGEPAGE).
or just (enforce_sysfs & vma_is_anon)  like you mentioned. Then we
check for the TVA_IN_KHUGEPAGED before appending the defer bits.
>
> Otherwise, LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>
Thanks !
>
> --
> Best Regards,
> Yan, Zi
>


