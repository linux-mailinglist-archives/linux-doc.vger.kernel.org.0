Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071073CC0CC
	for <lists+linux-doc@lfdr.de>; Sat, 17 Jul 2021 04:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236105AbhGQDBx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Jul 2021 23:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbhGQDBx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jul 2021 23:01:53 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44F2C061760
        for <linux-doc@vger.kernel.org>; Fri, 16 Jul 2021 19:58:56 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id x10so12917287ion.9
        for <linux-doc@vger.kernel.org>; Fri, 16 Jul 2021 19:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=47x9Ymi/xIZW8qhaxWUdxGkotS2H57eORdaiodtNXxs=;
        b=AF1XCHuhA8nhTJo++znozASRZyrU/M9c/GDb1NcPrnBfe8JSqvJ1leXTvFT/vclguI
         tAQD9YTCbJ+Gf6knBaY2KForx1X1ESitUW8H76ZooVrOxpxEvwsDA1bQzwpSAYw9EyMu
         fZ2tKCEfQ8AXoaqz3qwFW3TGP/rMWVrI0PXdpsGjqomaItULuSUjPtcqZQyRRz+bjkBg
         cb4sbauRFzZa10tVHBmFZ9NP3lfEFFbSAQ0ZHEVU7nUImowKeMilk3iLekQGj1p/qN9f
         LjBQlP9larDZtlpbft1KBvl8PhW8+xhPs+VltNEYfMQ3PoIixbgH6gMu+WBi5HW9NTAY
         Bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=47x9Ymi/xIZW8qhaxWUdxGkotS2H57eORdaiodtNXxs=;
        b=ncZ+jKJ2lPjF/rlb2mi6quxbQA6PhujwNOQQfpqUCwlVkMBRSJqQk0zNLDv8l10m90
         kpPZ2EDp4STvZGruPBLuEhwfdVvos5pToq04MRU/8HaUd8lhfxE25NRba+hT3QkY7UrR
         M65n3ZU/dA32y+cXKPMsyAeFMWX9Cwab5rXIfvo3Jj8m60NiAN3yh3rwxebsoH8La4DB
         s6u/LC6LNm4MXzHpjlN6j+WhpiyPaWmYstBYgZ8WjnBrxrdeWjqgwR8ZUGaIFPGbKl7q
         hi6hmqE8eKAzhgxN3dXsQnSnaKuVSZHptpFvYYZ9LHNzY3uOVJUdvC8V1D47xdiTCuZr
         cyTA==
X-Gm-Message-State: AOAM5337n8JWR7DPTYpOhsF+3kQPw8qytMvykJcaTt82jeDfEuy2/bmV
        i3YzDa5S3R93mySMEqXgl0GgxwMVxdHEJszolOfHaQ==
X-Google-Smtp-Source: ABdhPJx+hHrUteqOCY+tNsE7hrkVQMh2XWLoapRd+165p+o9BiCxQOzq4l6FbCdFtFlaTD0a1Nwh2PUs6l/F/zMOx38=
X-Received: by 2002:a05:6638:35a8:: with SMTP id v40mr12029573jal.126.1626490735538;
 Fri, 16 Jul 2021 19:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210619092002.1791322-1-pcc@google.com> <YNokDwjyysHGwTy/@casper.infradead.org>
 <6c03ae36-9a4b-6646-66c3-04d4a3de9c1e@nvidia.com> <YNopY7n+DcEnLxn7@casper.infradead.org>
In-Reply-To: <YNopY7n+DcEnLxn7@casper.infradead.org>
From:   Peter Collingbourne <pcc@google.com>
Date:   Fri, 16 Jul 2021 19:58:44 -0700
Message-ID: <CAMn1gO63NgAM847X8O0mPEitVF1NYK3pGe1N9m_XRW=mSHbUTQ@mail.gmail.com>
Subject: Re: [PATCH v4] mm: introduce reference pages
To:     Matthew Wilcox <willy@infradead.org>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Jann Horn <jannh@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kernel test robot <lkp@intel.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 28, 2021 at 12:57 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Jun 28, 2021 at 12:44:22PM -0700, John Hubbard wrote:
> > On 6/28/21 12:33 PM, Matthew Wilcox wrote:
> > ...
> > >
> > > I wonder if single-byte captures enough of the useful possibilities.
> > > In the kernel we have memset32() and memset64() [1] so we could support
> > > a larger pattern than just an 8-bit byte.  It all depends what userspace
> > > would find useful.
> > >
> > > [1] Along with memset_p(), memset_l() and memset16() that aren't terribly
> > > relevant to this use case.  Although maybe memset_l() would be the right
> > > one to use since there probably aren't too many 32-bit apps that want
> > > a 64-bit pattern and memset64() might not be the fastest on a 32-bit
> > > kernel).
> > >
> >
> > And in fact, I'm also rather intrigued by doing something like 256 copies
> > of a 16-byte UUID, per 4KB page. In other words, there are *definitely*
> > useful patterns that are longer than a single byte, and it seems interesting
> > to support them here.
> >
> > Kirill's idea of an API that somehow allows various power of 2 patterns seems
> > like it would be nice, because then we don't have to pick a value that seems
> > good in 2021, but less good as time goes by, perhaps.
> >
> > Another thought is to use an entire 4KB page as the smallest pattern unit.
> > That would allow the maximum API flexibility, because the caller could
> > explicitly set every single byte in the page.
>
> That's what this patch does.  If it can be reduced to a pattern (in
> Peter's patch of a single byte; i'm proposing expanding that), then
> the page is filled with the pattern; otherwise we copy the reference
> page.

That sounds good. I propose that for now we only optimize the single
byte pattern and single MTE granule use cases, and allow future
expansion later via the size argument. Programs that use sizes with
optimizations only implemented on newer kernels will still work on
older kernels; they will just be faster on the new kernels.

Peter
