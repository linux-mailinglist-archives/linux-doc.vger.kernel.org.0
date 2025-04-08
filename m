Return-Path: <linux-doc+bounces-42631-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D933A81345
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 19:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930B37A6B60
	for <lists+linux-doc@lfdr.de>; Tue,  8 Apr 2025 17:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EA4191F79;
	Tue,  8 Apr 2025 17:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0O2lMojh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF022E3E7
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744132212; cv=none; b=fxZB9Fy/78Es4zdbmPx4Z8PburukUUZ1u5r4ujJpV9CUuxsAOFgsQohSsgftZ6RoCUCx4UZvHTgKCuo7w54U3UAl9wt9yqf8XgP+TOhBUGX8xH8HXIdT6QqyXBqTAZ69hezxZxEV5P0VrgR7TD59VAP8FZyxaU1UN2AykY3S+90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744132212; c=relaxed/simple;
	bh=LWa4XDwwo4d59kqNl51cl1TvnMbRR7e2mo28ME9GXAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBkTzWnt8/RWl5Pwt8NOsH9xMWfZm7MTP3ScL2SgRnoQ6YHdA5nbhWghp86Py8Cv3ztpc3A25wdfB+x0N7mOYYmSZ2v0RGJ2Caxd1NWv4izMHLQ8yoEpGcq+KztcFQLgmx5kWJVZqk0eJezHooWxL2YNDhjsSgGPgkPvekA2FEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0O2lMojh; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4769e30af66so5491cf.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Apr 2025 10:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744132209; x=1744737009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEavw7wISTyL0l6A7aF6Yonm10PQMT8+Weu7nHplJ2g=;
        b=0O2lMojhWmtFH6JSMiHngm4GJE7eKl79IfIP4/3XzCYzqZmSOcZwDpxEb3hxEq6shP
         MhwfXyGUbMKCJvlsdY6B06f5z/vl72IDqEhtA9Dm2G5S3cQ2ysHFDE834ChsrG+93NBz
         WZxdvR8rxLvMQlwL0jcqcc2LTAXugpWRXqFmsnItot4Si4MQ/k6J1YjJe83XufZFDf/g
         /UuUZrrbjTF4u70ME4tIOd54ZaksMUIDRNNKd22JaSRnXggbhWYKjrPFmIySCUA0kT5b
         0C9QsvcHdvV6MlbFRYx3SfSqKKpT1zs/txDcd5cpHyPwQJooMkv3NQy8UEfdFLCniQnD
         54mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744132209; x=1744737009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEavw7wISTyL0l6A7aF6Yonm10PQMT8+Weu7nHplJ2g=;
        b=nEmlOYKcPjDOv6hvUUkD0+37MHP99bc0FsZcg7fbIzPwhEdDb+EGcdNsLm/X6TpFeJ
         9ihOI3yyupL0MRGpUl4JxteKQ8BcELATPfmNC911r48NmbpFkFPj4m5KsLWjIVnSY0wm
         MR9vub/uzE/vGPE4ztDxKT0ovjHDa1ZYWLxXWFyA0u+lhfNKscFMK7RyFhcZ+FMmPd46
         j5Au8UcqrqVy4hmTC6mZCsuyQ9vdodX0MjISPhwoQebDR++p8ETzowimBjtbJuJnlv7a
         +jygLlhiZo1Spj1jW8sGkluErTPxPltXxK61F4pC3I7JRLUi/iJKkNcEi8pq/DxJmXiv
         TB3w==
X-Forwarded-Encrypted: i=1; AJvYcCVWVI/p8OdypLUbMOI4RJJojBibzz/cVQaqRA6GdMV3oG7hkBE/dGvYD52L6TXZSt1FUC7UwfWqmiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCbwXMDAbtETOR5L56g6PgijUiBCMQ82HYJZkuXlBp8VdXDdFb
	4uqDVeP5Hk4+0F+bruQQpoV1TPoHNTrIXpOvwPXFTssqLY6ZgdW+wOuueXOmgQCaYfPgA8zFB2M
	Xa4hNuytFuDg1YkibWOhx4z4KyyQubk23fYX9
X-Gm-Gg: ASbGncshdZbI0ilAXZP0EO8S80ZZX4j0yG+Zf3S2FFX9YG+xkr7xx5dArrHlsKMlbbz
	xMVO5m1O1cLwiXqYWl6ROgHtLs3uBC1hOogPPodJD25vKQoOZTqnu37Mmc+P+7v4rhjg3Loah/t
	bQPszynTqoqbNcK1AgvfGqQ+KKO0Sog2W91ehDQaKKKZV0UClyvY1YJkm/
X-Google-Smtp-Source: AGHT+IHiqT9WgiUwFoTHaax+N0RSK22VUlJB1BbpqXUuiRr9K/yDngoZwS5ZytcFEj3snPUrxhytOq9VQRJq2krmies=
X-Received: by 2002:a05:622a:11d4:b0:477:852d:ead6 with SMTP id
 d75a77b69052e-4795e9fb0a7mr811cf.0.1744132209130; Tue, 08 Apr 2025 10:10:09
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-11-surenb@google.com>
 <0d36fd53-b817-4bbd-ae38-af094bd301df@suse.cz> <40182b31-95ad-4825-9c0c-0127be1734a6@cachyos.org>
 <Z_S7yjRXWIXnVXsf@infradead.org> <3f9f8a06-a044-4bce-a4e6-f17090cb3c0f@lucifer.local>
 <182bfb4f-e856-47d8-bc54-d419109cb4ac@cachyos.org>
In-Reply-To: <182bfb4f-e856-47d8-bc54-d419109cb4ac@cachyos.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 8 Apr 2025 10:09:57 -0700
X-Gm-Features: ATxdqUFWgfdDczYIBON7DSH20Zy6f02l43BIrke5gpTYWz03ZaaKpgDrA9wykEU
Message-ID: <CAJuCfpF=pUQFpbGn4kGjpW4dObcMbo8CTFLGK09npGi4W4MCsg@mail.gmail.com>
Subject: Re: [PATCH v7 10/17] mm: uninline the main body of vma_start_write()
To: Eric Naim <dnaim@cachyos.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Christoph Hellwig <hch@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, liam.howlett@oracle.com, mhocko@suse.com, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:52=E2=80=AFAM Eric Naim <dnaim@cachyos.org> wrote=
:
>
> On 4/8/25 14:25, Lorenzo Stoakes wrote:
> > On Mon, Apr 07, 2025 at 11:01:46PM -0700, Christoph Hellwig wrote:
> >> On Tue, Apr 08, 2025 at 12:39:25PM +0800, Eric Naim wrote:
> >>> The out-of-tree NVIDIA modules seem to rely on this symbol, is it pos=
sible to use EXPORT_SYMBOL() here instead of EXPORT_SYMBOL_GPL(), below is =
the modpost error:
> >>
> >> No.  They don't have any business using this.
> >
> > What on _earth_ are they using this for? Is this just via the VMA flag
> > manipulation functions? If it's something else, it's an unintended use =
of this.
> >
> > Anyway, generally speaking - agreed, this is absolutely a no-go Eric. I=
n my view
> > we simply should not be using EXPORT_SYMBOL() for _any_ new symbols wha=
tsoever.
> >
> > Out-of-tree modules are simply a non-consideration for core mm code, th=
is is a
> > GPL open source project. If I had my way we'd simply revoke _all_
> > EXPORT_SYMBOL()'s, not add new ones.
> >
> >>
> >> In fact vma_start_write should not be exported at all, just the
> >> vm_flags_{set,clear,mod} helpers.
> >
> > Yup, I'd rather we just kept vma_start_write() mm-internal, though of c=
ourse
> > kernel/fork.c (ugh) needs it (we could probably refactor that in some w=
ay to
> > avoid), and literally just the PPC arch (again maybe we can find a way =
round
> > that).
> >
> > Maybe one for me to look at actually... hmm.
> >
> > Anyway Eric - I wonder if this is simply the nvidia OOT driver doing a
> > vm_flags_...() call and then having an issue because the lock is uninli=
ned now?
> >
> > I guess you are jut noticing this is breaking and don't know since - pr=
oprietary
> > code.
>
>
> This seems to be the case, upon looking a bit deeper it looks like the dr=
iver code
> is calling atleast one of vm_flags_set. I couldn't find any direct calls =
to {,__}vma_start_write
> at first and was bit confused.

I agree that EXPORT_SYMBOL_GPL() should be enough as far as exporting goes.

>
> >
> > Anyway in this case, the OOT driver should just write some GPL wrapper =
code or
> > something here. Or better yet - make the driver open source :)
>
> Yeah, as obvious as it seems it doesn't happen on their open-sourced code=
 :)
>
> Either way, I'm thankful for the replies. NVIDIA *should* have probably n=
oticed
> this already and it would probably fixed in the next driver or two so I'l=
l just
> let sleeping dogs lie.
>
>
> --
> Regards,
> Eric

