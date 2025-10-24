Return-Path: <linux-doc+bounces-64470-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63253C07F43
	for <lists+linux-doc@lfdr.de>; Fri, 24 Oct 2025 21:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2BE554F0804
	for <lists+linux-doc@lfdr.de>; Fri, 24 Oct 2025 19:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5602C2ACE;
	Fri, 24 Oct 2025 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6wDnyQg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F592C15BE
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761335304; cv=none; b=N16VpP2OkSHGI466oLAnIBSpZdwBYvneewUgSuphqy0kw0vdz2PCIN02qZXwkwKQggDjpPAHE6B1KqtscaP/dXlxu69hGDeTVkQcw5lhs8G4yGlI0ZLD/dxlCniubWmY8JJRfRYiaTP6dsSRl+8v9c/WcyFqP8sL2MvA+JOvs2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761335304; c=relaxed/simple;
	bh=fuOYLw1PsYlQeJgDBx80FvVTqRBTg0jzKUjvWtGfBmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dU7E1xJ0fIhAM9tb/+wDklGBjciUYYXAi+XIp87BZY4Xgept3JAY4o32/VjY9d5m6slgsCMHOZo7dUej8Bi5FosY3sIr6mSZJG2/ZvngKKKk3g5xij/tG8vnZfWAC4k69mx1+OpNeVH8k7tr6WxVILZmSrgWf9Blsl1+SehL7TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6wDnyQg; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-890cc9b6bbbso317230485a.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 12:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761335301; x=1761940101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXL+Hu6HNILeLevcEmTlTrT5mGO7UORsDNusHMc7/mU=;
        b=B6wDnyQgeDkukWtvDsyE0eHHafOIcinEgDc/Bp6Lg07WCnm1rBlENLALoDRO2PmnUm
         x6puzOFuFme9d+GA30zVqukW3D4AVX6+sLkMTOLzxyw6Q4hZrAZakmT5gXacqFIeWLfu
         HWlss7Ln6YAH7rOndRjtuemgUujwyUjnraCCkvuwAqcUUrORmb3Cu8K837QQGYR2N4HF
         BJIrPs1xur6uBkwN+fThwYYwe6+dJ8rNVctyHRDb2i2eEmeVvzoEGCWTsMgrELm3c0zc
         SthPRGu5UuVPJYlyXpyLBkXhJBd09dGeVRcjdd7TFeMdo8ahOZZSC+D5SU0pTunjUpT6
         X+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761335301; x=1761940101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXL+Hu6HNILeLevcEmTlTrT5mGO7UORsDNusHMc7/mU=;
        b=nSSFvRbDjFBN6AI8KAw6gE2p8fWjgbWxmko2A1enNzpPFcLFIJAEze8xjlN82rtxkk
         C7X/fO84+brjzsaIqa/TrWuNA9cY8BTFci6AqwSrnz90yvxblfvMydtp4u0xmAFppwOm
         n2xp103raTToJW1fUp3GS+060tpX1G0CZr8qXrDaCC1iAmxpGk2BblfvOtsHkt2st1lS
         4KllOxDxEGDXCrykeHTa2ZpMAXBf3TB8BzI06My9dEaLUF9UAPTw4S9icj3CLUI6zz4/
         8OIY1Z+4JgfIUxEnj3ksEspOtUDCvTY1vOcJHAg05lzK4gtjQemSBVsaSUBp/AQZ2yb4
         u3jg==
X-Forwarded-Encrypted: i=1; AJvYcCV2OfZTgY08EXYrz3PFQ5/qxwX7RqQyDA15G/RnrRpvtR5bIvWZWNqhKL4g/NUyBub53nVqYRgtQhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx08igOaeECD5lhs+VJXJ9+NVxr+GVg/UX/ZEjXhshQhHONmpU
	T6KKIvp6kBHShyz/yQTymi7uOGE3OKwwy6w4t+dGzNg3ng4hTvhKCWdoz0Z54DVkxHAp53uMIqU
	x827awwjoGfpzuPsFbSMaVabjuait3D4=
X-Gm-Gg: ASbGncttnDkB9+QJ3d09RN31bjK4pq+gKPTQSmHxoiqKvPRCgCl6yN4aiLMAYWNzn9C
	3pEGq7QjwNxS5FftQHvTWK2aj3cdGWa4W9wfLF+AG6yYviqwVLKojd6gVIaOmxy0c+9SDK4YwCd
	BsSZfTzX/joPtbgBca9+5b6Em6zD+VmzOKrxhKvsXN6/95T5qjFznXLrvcqikxtp5rq9jG8VJBS
	DcJNjH1spWz3BJ8BRESkNuNZxRuzXFCXRO2AlqqNejf9deF7yK4LROjSguk9HsBT0UQ381m/UPG
	VLjbZYZd30Ht350=
X-Google-Smtp-Source: AGHT+IFA80mSU92rtRbV9UuI42Axn+KjupRObQQEU4AOkaqRuAcR5Dqvasu5x5WflmV4z8hPWzuXx/NOYjJa+6i7EGE=
X-Received: by 2002:a05:622a:1187:b0:4e8:a332:ba93 with SMTP id
 d75a77b69052e-4e8a9d0a927mr362501081cf.76.1761335300915; Fri, 24 Oct 2025
 12:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926002609.1302233-1-joannelkoong@gmail.com>
 <20250926002609.1302233-8-joannelkoong@gmail.com> <aPqDPjnIaR3EF5Lt@bfoster>
 <CAJnrk1aNrARYRS+_b0v8yckR5bO4vyJkGKZHB2788vLKOY7xPw@mail.gmail.com>
 <CAJnrk1b3bHYhbW9q0r4A0NjnMNEbtCFExosAL_rUoBupr1mO3Q@mail.gmail.com> <aPuz4Uop66-jRpN-@bfoster>
In-Reply-To: <aPuz4Uop66-jRpN-@bfoster>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 24 Oct 2025 12:48:10 -0700
X-Gm-Features: AS18NWAV-t2BsaOLd-eN2LOeLauCX-oLTi7xf6Ow48M0MfPwAA3NHDoMRARJ3GQ
Message-ID: <CAJnrk1bqjykKtpAdsHLPuuvHTzOHW0tExRZ8KKmKYyfDpuAsTQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] iomap: track pending read bytes more optimally
To: Brian Foster <bfoster@redhat.com>
Cc: brauner@kernel.org, miklos@szeredi.hu, djwong@kernel.org, 
	hch@infradead.org, hsiangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 10:10=E2=80=AFAM Brian Foster <bfoster@redhat.com> =
wrote:
>
> On Fri, Oct 24, 2025 at 09:25:13AM -0700, Joanne Koong wrote:
> > On Thu, Oct 23, 2025 at 5:01=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > On Thu, Oct 23, 2025 at 12:30=E2=80=AFPM Brian Foster <bfoster@redhat=
.com> wrote:
> > > >
> > > > On Thu, Sep 25, 2025 at 05:26:02PM -0700, Joanne Koong wrote:
> > > > > Instead of incrementing read_bytes_pending for every folio range =
read in
> > > > > (which requires acquiring the spinlock to do so), set read_bytes_=
pending
> > > > > to the folio size when the first range is asynchronously read in,=
 keep
> > > > > track of how many bytes total are asynchronously read in, and adj=
ust
> > > > > read_bytes_pending accordingly after issuing requests to read in =
all the
> > > > > necessary ranges.
> > > > >
> > > > > iomap_read_folio_ctx->cur_folio_in_bio can be removed since a non=
-zero
> > > > > value for pending bytes necessarily indicates the folio is in the=
 bio.
> > > > >
> > > > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > > > Suggested-by: "Darrick J. Wong" <djwong@kernel.org>
> > > > > ---
> > > >
> > > > Hi Joanne,
> > > >
> > > > I was throwing some extra testing at the vfs-6.19.iomap branch sinc=
e the
> > > > little merge conflict thing with iomap_iter_advance(). I end up hit=
ting
> > > > what appears to be a lockup on XFS with 1k FSB (-bsize=3D1k) runnin=
g
> > > > generic/051. It reproduces fairly reliably within a few iterations =
or so
> > > > and seems to always stall during a read for a dedupe operation:
> > > >
> > > > task:fsstress        state:D stack:0     pid:12094 tgid:12094 ppid:=
12091  task_flags:0x400140 flags:0x00080003
> > > > Call Trace:
> > > >  <TASK>
> > > >  __schedule+0x2fc/0x7a0
> > > >  schedule+0x27/0x80
> > > >  io_schedule+0x46/0x70
> > > >  folio_wait_bit_common+0x12b/0x310
> > > >  ? __pfx_wake_page_function+0x10/0x10
> > > >  ? __pfx_xfs_vm_read_folio+0x10/0x10 [xfs]
> > > >  filemap_read_folio+0x85/0xd0
> > > >  ? __pfx_xfs_vm_read_folio+0x10/0x10 [xfs]
> > > >  do_read_cache_folio+0x7c/0x1b0
> > > >  vfs_dedupe_file_range_compare.constprop.0+0xaf/0x2d0
> > > >  __generic_remap_file_range_prep+0x276/0x2a0
> > > >  generic_remap_file_range_prep+0x10/0x20
> > > >  xfs_reflink_remap_prep+0x22c/0x300 [xfs]
> > > >  xfs_file_remap_range+0x84/0x360 [xfs]
> > > >  vfs_dedupe_file_range_one+0x1b2/0x1d0
> > > >  ? remap_verify_area+0x46/0x140
> > > >  vfs_dedupe_file_range+0x162/0x220
> > > >  do_vfs_ioctl+0x4d1/0x940
> > > >  __x64_sys_ioctl+0x75/0xe0
> > > >  do_syscall_64+0x84/0x800
> > > >  ? do_syscall_64+0xbb/0x800
> > > >  ? avc_has_perm_noaudit+0x6b/0xf0
> > > >  ? _copy_to_user+0x31/0x40
> > > >  ? cp_new_stat+0x130/0x170
> > > >  ? __do_sys_newfstat+0x44/0x70
> > > >  ? do_syscall_64+0xbb/0x800
> > > >  ? do_syscall_64+0xbb/0x800
> > > >  ? clear_bhb_loop+0x30/0x80
> > > >  ? clear_bhb_loop+0x30/0x80
> > > >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > > RIP: 0033:0x7fe6bbd9a14d
> > > > RSP: 002b:00007ffde72cd4e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000=
010
> > > > RAX: ffffffffffffffda RBX: 0000000000000068 RCX: 00007fe6bbd9a14d
> > > > RDX: 000000000a1394b0 RSI: 00000000c0189436 RDI: 0000000000000004
> > > > RBP: 00007ffde72cd530 R08: 0000000000001000 R09: 000000000a11a3fc
> > > > R10: 000000000001d6c0 R11: 0000000000000246 R12: 000000000a12cfb0
> > > > R13: 000000000a12ba10 R14: 000000000a14e610 R15: 0000000000019000
> > > >  </TASK>
> > > >
> > > > It wasn't immediately clear to me what the issue was so I bisected =
and
> > > > it landed on this patch. It kind of looks like we're failing to unl=
ock a
> > > > folio at some point and then tripping over it later..? I can kill t=
he
> > > > fsstress process but then the umount ultimately gets stuck tossing
> > > > pagecache [1], so the mount still ends up stuck indefinitely. Anywa=
ys,
> > > > I'll poke at it some more but I figure you might be able to make se=
nse
> > > > of this faster than I can.
> > > >
> > > > Brian
> > >
> > > Hi Brian,
> > >
> > > Thanks for your report and the repro instructions. I will look into
> > > this and report back what I find.
> >
> > This is the fix:
> >
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index 4e6258fdb915..aa46fec8362d 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -445,6 +445,9 @@ static void iomap_read_end(struct folio *folio,
> > size_t bytes_pending)
> >                 bool end_read, uptodate;
> >                 size_t bytes_accounted =3D folio_size(folio) - bytes_pe=
nding;
> >
> > +               if (!bytes_accounted)
> > +                       return;
> > +
> >                 spin_lock_irq(&ifs->state_lock);
> >
> >
> > What I missed was that if all the bytes in the folio are non-uptodate
> > and need to read in by the filesystem, then there's a bug where the
> > read will be ended on the folio twice (in iomap_read_end() and when
> > the filesystem calls iomap_finish_folio_write(), when only the
> > filesystem should end the read), which does 2 folio unlocks which ends
> > up locking the folio. Looking at the writeback patch that does a
> > similar optimization [1], I miss the same thing there.
> >
>
> Makes sense.. though a short comment wouldn't hurt in there. ;) I found
> myself a little confused by the accounted vs. pending naming when
> reading through that code. If I follow correctly, the intent is to refer
> to the additional bytes accounted to read_bytes_pending via the init
> (where it just accounts the whole folio up front) and pending refers to
> submitted I/O.
>
> Presumably that extra accounting doubly serves as the typical "don't
> complete the op before the submitter is done processing" extra
> reference, except in this full submit case of course. If so, that's
> subtle enough in my mind that a sentence or two on it wouldn't hurt..

I will add some a comment about this :) That's a good point about the
naming, maybe "bytes_submitted" and "bytes_unsubmitted" is a lot less
confusing than "bytes_pending" and "bytes_accounted".

Thanks,
Joanne

>
> > I'll fix up both. Thanks for catching this and bisecting it down to
> > this patch. Sorry for the trouble.
> >
>
> No prob. Thanks for the fix!
>
> Brian
>
> > Thanks,
> > Joanne
> >
> > [1] https://lore.kernel.org/linux-fsdevel/20251009225611.3744728-4-joan=
nelkoong@gmail.com/
> > >
> > > Thanks,
> > > Joanne
> > > >
> >
>

