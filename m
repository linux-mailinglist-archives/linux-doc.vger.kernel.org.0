Return-Path: <linux-doc+bounces-46470-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95469AB9B95
	for <lists+linux-doc@lfdr.de>; Fri, 16 May 2025 14:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124744A81C6
	for <lists+linux-doc@lfdr.de>; Fri, 16 May 2025 12:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21772239E7D;
	Fri, 16 May 2025 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iDRJncNL"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C0A238C1D
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396796; cv=none; b=L/KYXA4RiOZeYDomiPK/BziSRYVVvLnU/hVnKv/XOk4oCC1rZhmX5OMvCrEEtfJbtLA5OohI0fOtWrQjbs4u8pclUoMC2tMZM9PQTDj7CJXeOad+WxWDkuJPk+/ssg2Q75vTBmcwRl7vRiESHvtKKGK4PM1TIILIfXco5l4iDLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396796; c=relaxed/simple;
	bh=b90/SYVIw+dBZMEUT65DfGZIzxwPVR5WwyeqFl4BJvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbgezcU5mJvK8G3e2bziSabPpcApGQLZSbnanoG7on93TbZpJ+Cs2+btUI0xJKp7sbXQKh/8V21D3tuwGETju7aUxTFK5zBfDVYdpXQXVVUXsXVCAySdaPLaEkg2A/pjaeiyWVIlzsw1S7fgWQnb6pKvKn4SDZgxb/1cZczsD1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iDRJncNL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747396792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jV3TfuTBMPGuPU48cWyK877zQ+ap+DzX8iP1e9/vVHE=;
	b=iDRJncNL8zxbAM2QsbK/laUhH9WaFPz5kLtlijCak8OOdjJnU9YiEdq4v6qcrbrRltgGjf
	zMcqaX8U9+1jbfN9iepYMg0REcDSF99iUfW6khh/oa5rwA3I5i3TTXQ/qH8WFmYAzfsBhO
	H6lQZUcL1m6do53WB5RyHzyEZ4atemo=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-fkRemp0wPf-PWTaKMTE01Q-1; Fri, 16 May 2025 07:59:51 -0400
X-MC-Unique: fkRemp0wPf-PWTaKMTE01Q-1
X-Mimecast-MFC-AGG-ID: fkRemp0wPf-PWTaKMTE01Q_1747396790
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-708b6b57e67so31006247b3.0
        for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 04:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747396790; x=1748001590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV3TfuTBMPGuPU48cWyK877zQ+ap+DzX8iP1e9/vVHE=;
        b=ftRKPr5Zs+uhWO1MCmv+dx+QjpnWimEgyywg4oUIZ9VXjheAHkNON2Ta6LJAVpFBo4
         gmKLJt7qWszWZoeVSj1HdSxz/qwdcWVmHb7zSoPwrgAOq61uALEZ8n95HxhK9uZdc3oL
         JsB7qGVFt6XMbSxCoV1YsBm4EvrmBK4x+AIsN0LERPEuwjKm9J5uVhNkMMwpnIKst7jL
         Se5MGAlcS0N6lbez0Wc5zx421261gdhF98sf7fQ5ewpjR5+Ij2chqSxHzoFNtq37dl6Y
         9LVaKONLPqncAFpnschBpTj6pzDgUGdpKwBEAjX9XaoK8XJ9WJ8gES7L2qlg3a5E7y6T
         tkBg==
X-Forwarded-Encrypted: i=1; AJvYcCXuGJnWuk6AaWUpYbWVKoMMX4cywbNPPXe0GM+PGpdqAGWcb66oxMP478B5dV16sgb1H1zfr+Ewsz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmpYXruXmIOgP7u9bYKRnLArmO0H7aDQYWBp1wKAeUFxwlqsOf
	1N52gQ+2XPgMsNj45T6lDSyMF2xNC8N8uR7zkPzkWosVjtEkKZx54T6NlRYYd1hoHojFtvlEeCf
	K7XM8+mt6gdfr40yGXt843QGbL7cPfIuverAXT5O5oGZXUXM2d4ceSuB/u/y8auASIyfzDrrRve
	zOx4MZZ0vr9O9msep+/BtzJt/h9TLr2vRTyTJ8
X-Gm-Gg: ASbGncva6c+1hnUWAgOjF8fwI/je/X0MyjfD58FnanNTEPPEmh0IRtg6q7DUUR75Z46
	jJ1G/3cihJ2nwIEGrWhj+XaYolbg6oshfGcGiJVY/iMsKwOYr7RbAwtatp8JrGHfs/KsG1bM=
X-Received: by 2002:a05:690c:2902:b0:708:39f0:e673 with SMTP id 00721157ae682-70cab099541mr32558967b3.26.1747396790713;
        Fri, 16 May 2025 04:59:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcYYv1aKngeTdy5ir8TbnMDL+aYvllbV4F5smezS9aZSJthiJS0se5fLpqvHuQKj9tO3mUUquimR8mFmse0lE=
X-Received: by 2002:a05:690c:2902:b0:708:39f0:e673 with SMTP id
 00721157ae682-70cab099541mr32558767b3.26.1747396790429; Fri, 16 May 2025
 04:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-3-npache@redhat.com>
 <4e00b5df-e9ce-40fa-8da0-9c66fe18bfd7@linux.alibaba.com>
In-Reply-To: <4e00b5df-e9ce-40fa-8da0-9c66fe18bfd7@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Fri, 16 May 2025 05:59:24 -0600
X-Gm-Features: AX0GCFt3NyCdj_YZyS35SoBcI6yDKLZwAnHKx4ZKJFM0r8cs98JHtyZCbongSjc
Message-ID: <CAA1CXcAO5OkB=P++89q1VhcoRG6j6JR5K15m9sOaPdKwZ-LEkw@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] introduce khugepaged_collapse_single_pmd to
 unify khugepaged and madvise_collapse
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 11:50=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/5/15 11:22, Nico Pache wrote:
> > The khugepaged daemon and madvise_collapse have two different
> > implementations that do almost the same thing.
> >
> > Create khugepaged_collapse_single_pmd to increase code
> > reuse and create an entry point for future khugepaged changes.
> >
> > Refactor madvise_collapse and khugepaged_scan_mm_slot to use
> > the new khugepaged_collapse_single_pmd function.
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 96 +++++++++++++++++++++++++-----------------------=
-
> >   1 file changed, 49 insertions(+), 47 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 806bcd8c5185..5457571d505a 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -2353,6 +2353,48 @@ static int khugepaged_scan_file(struct mm_struct=
 *mm, unsigned long addr,
> >       return result;
> >   }
> >
> > +/*
> > + * Try to collapse a single PMD starting at a PMD aligned addr, and re=
turn
> > + * the results.
> > + */
> > +static int khugepaged_collapse_single_pmd(unsigned long addr,
> > +                                struct vm_area_struct *vma, bool *mmap=
_locked,
> > +                                struct collapse_control *cc)
> > +{
> > +     int result =3D SCAN_FAIL;
> > +     struct mm_struct *mm =3D vma->vm_mm;
> > +
> > +     if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
>
> I've removed the CONFIG_SHMEM dependency[1], please do not add it again.

Sorry I handled the conflict on the removal parts, forgot to handle
the addition part... my bad.
>
> [1]
> https://lore.kernel.org/all/ce5c2314e0368cf34bda26f9bacf01c982d4da17.1747=
119309.git.baolin.wang@linux.alibaba.com/
>


