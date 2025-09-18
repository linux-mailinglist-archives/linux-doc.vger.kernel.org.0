Return-Path: <linux-doc+bounces-59782-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C9B51F27
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 19:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01D8E4461B2
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 17:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414271E3DD7;
	Wed, 10 Sep 2025 17:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESkeav3L"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E972D0C91
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757526102; cv=none; b=UKjFL65iIUdvhaObPePfvMo5FYQUol2DX8srkhQhg+NAA10FBZ7fuD1idJXgmksKIJy86XeJD9f4C6vh7Xf/ErlIOwpJU3RD8OuXok/E4no5zFlFppfWZ/XNsoXYvVxHB4GwgEhXZjQ6AEx9C+cBVkscQr9yUzqD5hLnbLHD720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757526102; c=relaxed/simple;
	bh=ya3nCeHXX4cIOcVB3zT+qGwqtNq6bvInaVnCb1Wx2VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWdgUUP9pyBd7Vns7Kozr1r0OFfx2AW0B0pMGFuD0iszgr7L3WOl7Gn7YO91juRCEU/5kl3DGEWdm0KwwbdXdwqxzZkHEqX7D76AOtaZMr/SzDthJKd1OQbnKWMMcyTk7Qn4L3Lxtjz72O7fIqRaSdBop+92arIHbdNf8Uza87Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESkeav3L; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b5f6ad78e4so48649181cf.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 10:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757526099; x=1758130899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHT+u2S9m3RVDHyPVmpZb2IEdtnx3gNXVCQQWQ1AuyM=;
        b=ESkeav3L1JysDAQu8Z3qVss0OcDtwx/8+xGNo7tA6jAl5WtvBeNZ2PFPmetQKo8gdW
         WKmVgT/Mw3VUSuwX8FKdgCH18t8zs3IR8wSMXzj+wRJnzId51LIca5ArJ+Ge5CCTr3Hr
         W7hvwTimN3YbCFyo3nnGahUakdOPSQTSOkrBl8XW6VCkru6Zlh9wpesSU4cDcIWJmPkE
         IZi3Qy3nE5eMKg2KLPssYRXY2RtWMF640hkYA0c3+50ndWVzKdzTCEWavaEIgwNGX1gu
         Pe6wMZ5nreXtx/eJ7Go71KLSCN8vuTHOhSeaIZtpOX6u5bLf+B1DN3Dpm7rzx0C7gST5
         E+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757526099; x=1758130899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHT+u2S9m3RVDHyPVmpZb2IEdtnx3gNXVCQQWQ1AuyM=;
        b=dndyS70AMrLpXbnyr/Fk4CQ7oU20Mlg3Bn2/Ra/EoHEVWZZoB1HpuDH1UOXr82tcJn
         Hxj+w5fF6z92rwG/vH70q5pVT7z0QMA4pP79kaistdbFmqVhP9XvINewdX89ZF/57y8k
         /tPEnekyVwCwRbJsi1hPKfiny/DIt51ygGFFHHMrMCxWdE4i3VLNpgNAf8rwpWqcUGwm
         RsrtVH5/2GJEWX5fHhyO1Db2FKSbrYNcwnVzFz4Zy+yrfWYfwAfzCtoE5ZIj8cSnOhTH
         dZyn7uDa/wZpAlDXKodMYyu9RT9lEdw3XyUMfqxX1PgKzdhj1OUsXpqNahch7grLyE64
         ozwA==
X-Forwarded-Encrypted: i=1; AJvYcCUM0fxhUf1Up+0NJ7HIpPlYEtf85bbe7ox0yLEYiYoTDXPtAu5joEvDSy6l3sfuWtRiKomCAPferiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMdW0+mqb73QfiPRdC+PkE1TDlJkfvCgyuRCmldxeSa6/CpHK1
	RkwV7lYshOaePsIRs481lvx9B9/vQIoXOD1XRLjF4Nrkv/86R6TfeWojxHTnqRPQs1/Wc/ZiCvk
	K6lB0BXEfy7M+ihGC2yNy0/tDo1hytD4=
X-Gm-Gg: ASbGncvcXrCR8KDQWGnQ24Z11B2Pt/OsLBVPtWUUxVw4d6kaqfz29ooTB1jt1RZEfwA
	mVC91pplSuAH/u1DTemOgriDuIEzvadbYlhyvasHRYObkf1MLyi36JZNc6k8DRldL09RREXKeXe
	hndnzT9Co/vxO23qQBQG2vVaYJ5aD/S1GFSu0yQx1l43J9hSyf7cEdZUsrMPNQOiLxOB+L3aiSa
	ZIZqjtfw9E4fza1Chn4yGgO7rTZUcRilw==
X-Google-Smtp-Source: AGHT+IGM4v8CCbZik1kELSMXAYG/GKBchBBFALBliyv/onlKWZFY2W1P7n4z7sWDqXgSFcqrmLLSXIe+ROn9OwqKnI0=
X-Received: by 2002:ac8:5f14:0:b0:4b3:50b0:d7f with SMTP id
 d75a77b69052e-4b5f8464d8amr161064711cf.61.1757526099174; Wed, 10 Sep 2025
 10:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908185122.3199171-1-joannelkoong@gmail.com>
 <20250908185122.3199171-12-joannelkoong@gmail.com> <aL9xb5Jw8tvIRMcQ@debian>
 <CAJnrk1YPpNs811dwWo+ts1xwFi-57OgWvSO4_8WLL_3fJgzrFw@mail.gmail.com> <488d246b-13c7-4e36-9510-8ae2de450647@linux.alibaba.com>
In-Reply-To: <488d246b-13c7-4e36-9510-8ae2de450647@linux.alibaba.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 10 Sep 2025 13:41:25 -0400
X-Gm-Features: Ac12FXx3f2gw2O3qOKT1Xmh_ecXNa2Ke7YGwp9bTrR6B-OHcqgL5c7RB1qg35NQ
Message-ID: <CAJnrk1a5af-BMPUM3HfGwKZ=zoN4bcmbViLBWMtLao1KfK2gww@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] iomap: add caller-provided callbacks for read
 and readahead
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: djwong@kernel.org, hch@infradead.org, brauner@kernel.org, 
	miklos@szeredi.hu, linux-block@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 7:21=E2=80=AFPM Gao Xiang <hsiangkao@linux.alibaba.c=
om> wrote:
>
> Hi Joanne,
>
> On 2025/9/9 23:24, Joanne Koong wrote:
> > On Mon, Sep 8, 2025 at 8:14=E2=80=AFPM Gao Xiang <xiang@kernel.org> wro=
te:
> >>
> >> Hi Joanne,
> >>
> >> On Mon, Sep 08, 2025 at 11:51:17AM -0700, Joanne Koong wrote:
> >>> Add caller-provided callbacks for read and readahead so that it can b=
e
> >>> used generically, especially by filesystems that are not block-based.
> >>>
> >>> In particular, this:
> >>> * Modifies the read and readahead interface to take in a
> >>>    struct iomap_read_folio_ctx that is publicly defined as:
> >>>
> >>>    struct iomap_read_folio_ctx {
> >>>        const struct iomap_read_ops *ops;
> >>>        struct folio *cur_folio;
> >>>        struct readahead_control *rac;
> >>>        void *private;
> >>>    };
> >>>
> >>>    where struct iomap_read_ops is defined as:
> >>>
> >>>    struct iomap_read_ops {
> >>>        int (*read_folio_range)(const struct iomap_iter *iter,
> >>>                               struct iomap_read_folio_ctx *ctx,
> >>>                               loff_t pos, size_t len);
> >>>        int (*read_submit)(struct iomap_read_folio_ctx *ctx);
> >>>    };
> >>>
> >>
> >> No, I don't think `struct iomap_read_folio_ctx` has another
> >> `.private` makes any sense, because:
> >>
> >>   - `struct iomap_iter *iter` already has `.private` and I think
> >>     it's mainly used for per-request usage; and your new
> >>     `.read_folio_range` already passes
> >>      `const struct iomap_iter *iter` which has `.private`
> >>     I don't think some read-specific `.private` is useful in any
> >>     case, also below.
> >>
> >>   - `struct iomap_read_folio_ctx` cannot be accessed by previous
> >>     .iomap_{begin,end} helpers, which means `struct iomap_read_ops`
> >>     is only useful for FUSE read iter/submit logic.
> >>
> >> Also after my change, the prototype will be:
> >>
> >> int iomap_read_folio(const struct iomap_ops *ops,
> >>                       struct iomap_read_folio_ctx *ctx, void *private2=
);
> >> void iomap_readahead(const struct iomap_ops *ops,
> >>                       struct iomap_read_folio_ctx *ctx, void *private2=
);
> >>
> >> Is it pretty weird due to `.iomap_{begin,end}` in principle can
> >> only use `struct iomap_iter *` but have no way to access
> >> ` struct iomap_read_folio_ctx` to get more enough content for
> >> read requests.
> >
> > Hi Gao,
> >
> > imo I don't think it makes sense to, if I'm understanding what you're
> > proposing correctly, have one shared data pointer between iomap
> > read/readahead and the iomap_{begin,end} helpers because
>
> My main concern is two `private` naming here: I would like to add
> `private` to iomap_read/readahead() much like __iomap_dio_rw() at
> least to make our new feature work efficiently.
>
> >
> > a) I don't think it's guaranteed that the data needed by
> > read/readahead and iomap_{begin,end} is the same.  I guess we could
> > combine the data each needs altogether into one struct, but it seems
> > simpler and cleaner to me to just have the two be separate.
> >
> > b) I'm not sure about the erofs use case, but at least for what I'm
> > seeing for fuse and the block-based filesystems currently using iomap,
> > the data needed by iomap read/readahead (eg bios, the fuse
> > fuse_fill_read_data) is irrelevant for iomap_{begin/end} and it seems
> > unclean to expose that extraneous info. (btw I don't think it's true
> > that iomap_iter is mainly used for per-request usage - for readahead
> > for example, iomap_{begin,end} is called before and after we service
> > the entire readahead, not called per request, whereas
> > .read_folio_range() is called per request).
>
> I said `per-request` meant a single sync read or readahead request,
> which is triggered by vfs or mm for example.
>
> >
> > c) imo iomap_{begin,end} is meant to be a more generic interface and I
> > don't think it makes sense to tie read-specific data to it. For
> > example, some filesystems (eg gfs2) use the same iomap_ops across
> > different file operations (eg buffered writes, direct io, reads, bmap,
> > etc).
>
> Previously `.iomap_{begin,end}` participates in buffer read and write
> I/O paths (except for page writeback of course) as you said, in
> principle users only need to care about fields in `struct iomap_iter`.
>
> `struct iomap_readpage_ctx` is currently used as an internal structure
> which is completely invisible to filesystems (IOWs, filesystems don't
> need to care or specify any of that).
>
> After your proposal, new renamed `struct iomap_read_folio_ctx` will be
> exposed to individual filesystems too, but that makes two external
> context structures for the buffer I/O reads (`struct iomap_iter` and
> `struct iomap_read_folio_ctx`) instead of one.
>
> I'm not saying your proposal doesn't work, but:
>
>   - which is unlike `struct iomap_writepage_ctx` because writeback path
>     doesn't have `struct iomap_iter` involved, and it has only that
>     exact one `struct iomap_writepage_ctx` context and all callbacks
>     use that only;
>
>   - take a look at `iomap_dio_rw` and `iomap_dio_ops`, I think it's
>     somewhat similiar to the new `struct iomap_read_ops` in some
>     extent, but dio currently also exposes the exact one context
>     (`struct iomap_iter`) to users.
>
>   - take a look at `iomap_write_ops`, it also exposes
>     `struct iomap_iter` only. you may say `folio`, `pos`, `len` can be
>     wrapped as another `struct iomap_write_ctx` if needed, but that is
>     not designed to be exposed to be specfied by write_iter (e.g.
>     fuse_cache_write_iter)
>
> In short, traditionally the buffered read/write external context is
> the only unique one `struct iomap_iter` (`struct iomap_readpage_ctx`
> is only for iomap internal use), after your proposal there will be
> two external contexts specified by users (.read_folio and .readahead)
> but `.iomap_{begin,end}` is unable to get one of them, which is
> unlike the current writeback and direct i/o paths (they uses one
> external context too.)
>
> Seperate into two contexts works for your use case, but it may
> cause issues since future developers have to decide where to
> place those new context fields for buffer I/O paths (
> `struct iomap_iter` or `struct iomap_read_folio_ctx`), it's still
> possible but may cause further churn on the codebase perspective.
>
> That is my minor concern, but my main concern is still `private`
> naming.

Hi Gao,

In my mind, the big question is whether or not the data the
filesystems pass in is logically shared by both iomap_begin/end and
buffered reads/writes/dio callbacks, or whether the data needed by
both are basically separate entities but have to be frankensteined
together so that it can be passed in through iter->private. My sense
of the read/readahead code is that the data needed by iomap begin/end
vs buffered reads are basically logically separate entities. I see
your point about how the existing code for buffered writes and dio in
iomap have them combined into one, but imo, if the iomap_iter data is
a separate entity from the data needed in the callbacks, then those
pointers should be separate.

But I also am happy to change this back to having it the way it was
for v1 where everything just went through iter->private. I don't feel
strongly about this decision, I'm happy with whichever way we go with.

Thanks,
Joanne

>
> Thanks,
> Gao Xiang
>
> > Thanks,
> > Joanne
> >
> >>
> >> Thanks,
> >> Gao Xiang
>

