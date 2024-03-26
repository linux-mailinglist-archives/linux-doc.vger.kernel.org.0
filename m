Return-Path: <linux-doc+bounces-12695-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8235E88BA5C
	for <lists+linux-doc@lfdr.de>; Tue, 26 Mar 2024 07:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA8FF1C2D4F0
	for <lists+linux-doc@lfdr.de>; Tue, 26 Mar 2024 06:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04781446BA;
	Tue, 26 Mar 2024 06:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iOJWERdO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3BF12AAE2
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 06:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711434219; cv=none; b=dEqFYRtY21cLQYr5qSfrrtE6HTshut1LnFmqTPAELUEGy4XgYj0l83dFyp3D2090wcaEUeE+BO5QS91/61Q7kvjrH7V0LcmMJIe4GyTLj+jcgvPnUtddp7WN09I+/8zsD38KmZwX3KPA39FgrO2Sr2iGSAof/QxbqBlGCMAVgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711434219; c=relaxed/simple;
	bh=1vPnDmB9pDj0OJfEqjDZCv6xNP3XvTJ8rn8qLgfyVhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFkU6Zi/9AvtQD/TZHRin5cEDy87EouERNVNrMvCuPGtcPktk4tWmnWzOuFC0ilw2LNflQX6eAfBht0K/UzG+2MBbIZxyKWvfNYGTmvFv15vlOaxEppN+TOSx8ESF3NXE7ZZq2TJ8IYZacoWKjn4L3h3X7J5Gi1Fy06kO4KMn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iOJWERdO; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dbed0710c74so4269239276.1
        for <linux-doc@vger.kernel.org>; Mon, 25 Mar 2024 23:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711434216; x=1712039016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY2WNNA6khj/wLxlBTVDg0e/YVgDEc7zpROxMWd3xhs=;
        b=iOJWERdOqSxevG4YebMTI4ggPr0uZw6klcfS+Upol/qe1IIkw26Tb85sS6L2lFZq6R
         7u/T+OfxkI/9mr46BJmcRRCSq9aaKDHrKJaoU88D5TNDd4mDEfXTCZsME+nAX4TWiq4h
         hCTapPU7Z2uhyTQ1m+UAXhLVDvU7OsFrwbmLvjHrBSkjzdhYjachF1tCNRvGEn+lnMM3
         vCkRYpsnyjGvXQFNTDsI4PQ0K4wOXY4myt8Ce93SeO6aRbTfpY0rHbZ0tqasHTHjWMM/
         uW09WK173s9e61MNV6m+RTpNkEyIV11d6kgmAdmwD+4Co8lPDjDN0zh364Zyh4U9A2JD
         EaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711434216; x=1712039016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY2WNNA6khj/wLxlBTVDg0e/YVgDEc7zpROxMWd3xhs=;
        b=tws1pdNtuL4VU56ZKF+GU0oIQmxtLkFVIf5dbDJTt5ariHOOF50V9JPdNRPisIuZgG
         NNmlTXakviTcRAQ8Hlqc6Kp19ux75WK9sVpsp5jdDXzPp1y8SOn733V+IZUDyVEAzvww
         xHVBICrlx4NkucpK1wcjXxj8PDfQR58WYEzfg53SLquTJrZmbNNRZy47NAJvK7+HKHuF
         POFnz2jNplS6oi7R0nvc8hXSFz5Z2pzEnTpFEXY+pQT9nqvw5UB5PFvqi1x9FwI2mEIY
         TbCBwwwGsNUFP3Q/g865wBZoy3gGxz0pPd4icxsfFjXOPignNj9sKflQebpNpf9j1+eM
         c++g==
X-Forwarded-Encrypted: i=1; AJvYcCVC7txOeUL25nE/0OCQdfmDVtChaji0DvSrSVIfq4FfxNQft6gksJIAAKq2mSm6PmzNIQD7z4NtatwFzAvfmWGttCgNPBV+pqOU
X-Gm-Message-State: AOJu0YztSRptgm/keo496HjQZfd9RaXzNM3nSOtzn5SlEfIDAUBYEUsa
	enYRuBjmpvpR2U0GaqStKfRM9gklJ0eXzS3At3mub3oX6cPfIQa0z2ULzMAw7FNsSAtQT/EiOGc
	EySWYHrV+DOEIbswvHItPFf+2fdtlIM7QvOqW
X-Google-Smtp-Source: AGHT+IG0Gky/CBeJB0rm/0hu0j5w1H7Rs/NYjEm4sYKK7iwNm6xWETNlnSAhCMgOK//6yiQJTSFCTE29ikghtZ8wfEk=
X-Received: by 2002:a05:6902:4d3:b0:dc6:d457:ac92 with SMTP id
 v19-20020a05690204d300b00dc6d457ac92mr7166050ybs.31.1711434216382; Mon, 25
 Mar 2024 23:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321163705.3067592-1-surenb@google.com> <20240321163705.3067592-15-surenb@google.com>
 <ZgI9Iejn6DanJZ-9@casper.infradead.org>
In-Reply-To: <ZgI9Iejn6DanJZ-9@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 25 Mar 2024 23:23:25 -0700
Message-ID: <CAJuCfpGvviA5H1Em=ymd8Yqz_UoBVGFOst_wbaA6AwGkvffPHg@mail.gmail.com>
Subject: Re: [PATCH v6 14/37] lib: introduce support for page allocation tagging
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, jhubbard@nvidia.com, tj@kernel.org, 
	muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 8:12=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Thu, Mar 21, 2024 at 09:36:36AM -0700, Suren Baghdasaryan wrote:
> > +++ b/include/linux/pgalloc_tag.h
> > @@ -0,0 +1,78 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * page allocation tagging
> > + */
> > +#ifndef _LINUX_PGALLOC_TAG_H
> > +#define _LINUX_PGALLOC_TAG_H
> > +
> > +#include <linux/alloc_tag.h>
> > +
> > +#ifdef CONFIG_MEM_ALLOC_PROFILING
> > +
> > +#include <linux/page_ext.h>
> > +
> > +extern struct page_ext_operations page_alloc_tagging_ops;
> > +extern struct page_ext *page_ext_get(struct page *page);
> > +extern void page_ext_put(struct page_ext *page_ext);
>
> Why are you duplicating theses two declarations?
>
> I just deleted them locally and don't see any build problems.  tested wit=
h
> x86-64 defconfig (full build), allnoconfig full build and allmodconfig
> mm/ and fs/ (nobody has time to build allmodconfig drivers/)

Ah, good eye! We probably didn't include page_ext.h before and then
when we did I missed removing these declarations. I'll post a fixup.
Thanks!

