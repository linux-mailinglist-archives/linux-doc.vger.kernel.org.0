Return-Path: <linux-doc+bounces-27499-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2C99DBF0
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 03:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3175C1C2189E
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 01:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0786A158A1F;
	Tue, 15 Oct 2024 01:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xtuIo9P0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6620117BD3
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 01:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728957497; cv=none; b=EKmCf77IKHhvZU10xyLhgXrYfhl/WMp4/9qI4m5nwEdhZOOf884z4n+NhWEwP8grcsKCcPJ4AJ0o4T/Ng1zLi9hBKd/mhAM6XChzyBwwmTgcb4dXVSzNgKbxGrXBvVWScnMjnk2bVKptjgH6kmCilnQIEFOeN7k1Yth6nGvqsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728957497; c=relaxed/simple;
	bh=eWFuuUZrOpvWo7VozKGNJBHoN3oNzSCbMJ/S2gTUF+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9QNcX0pmZ4fA+TrGCyZVHMTlL7PJTKGtRiqMHCLoFcT37hQCkcXZPstK5NzLKWkwkzAeXxtfpgabDcTgTUJxVnmzYy1Qt6nJF2vJptdc+F/xdTA4n4XkdSNrrXYrDaLCzwyaP0o7RiFFlZ/ZTk66uMWp1OJg57yBDN8aYSdURo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xtuIo9P0; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a3b3f4b2afso974295ab.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 18:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728957495; x=1729562295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWFuuUZrOpvWo7VozKGNJBHoN3oNzSCbMJ/S2gTUF+Q=;
        b=xtuIo9P0EQoVCTWyikph3GnP1diIdZinL+tMuTt+oG14RjhcepCFE6lOo5aSwCnKdc
         OB+jnYbaOhUB56Sp+Rv5uvtfdGRPW0kP0kDQPk4XVoSGxPwgUsNg7pUEHd+4Ik3uLJvV
         wGPRNNhXTr7Bp87GXLmUYTCpRyV8g/eBxCFyTWGSQXMA6gVE39rNBUzfAZ+p6Rn5TD7P
         lItEuWscQ1tIDYr1TNtfqZx5EnZ9xBtbi+yiZ6L51PoTGGQy+d7QfJW/9QeVHh+7NqnX
         HJdPB6kFgZIUd0pcA+ZtFX+mV/sxMdh5qUNSx6B6BFTYqmVFslC/2lM8J88oCRlM066P
         azCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728957495; x=1729562295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWFuuUZrOpvWo7VozKGNJBHoN3oNzSCbMJ/S2gTUF+Q=;
        b=k0R2gZfe4adqECPUVwNZPwq94B8c8nC6O85KwKZLFLAj8lQpd0+3rYgNS2rXSay6a5
         BMdsBDGEoXvWOHTu/ZXFOIC+0h2AZqV6xYDqlXO3yE7euaPGW/SOxutLuIjAiNfCW2Zz
         LvXFbsm7e4Do5p2Zu1wHhKc0YV8cHYhjyS5AhrEV6M8md9G6wt7kfUyqRDvJKzqOm6pO
         YgHWpERiYYmLFLs3ISY3gKUl31OVlvWZ5mHM9a5XA73yJm2u7vo6kbYuNv/9br5kaIuo
         e71BpI6JaBHOXo1MTs+RdxS7RqIktzsmmnYwl2aOWvMp7+P8KS2DQCzn+zoX9oyJvGBd
         Yhpw==
X-Forwarded-Encrypted: i=1; AJvYcCUluGaGvCmco6cuz8i1g1tS2RRD+L0Mg1+cYkS9OU3GaVboOzu1BxRz5nf1L6V/ByhOx0QGVZbJXJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZeDPW1jD/z4LG4zc/k93BA1A9OuxUvU6nbSqHuDLCTV6zazH
	8QoEK2u6PU6lQS2fWUbv1AllsYWuZQFKxTNconLTBqhKSjDXoymWErj7rE/rJNDxiEWx9kS1Zrh
	YEH8/hSwCC8t7F7XTT/EPPADo0pordVVaSsJh
X-Google-Smtp-Source: AGHT+IFUTrzSNCWzgxg6f1uRbvivc/cnaSRU5kEq8qHIf1qmpEoKpSwE8bxbRecx0+nraiD24B25H080NY7pzKulURA=
X-Received: by 2002:a05:6e02:12c5:b0:39f:83dd:5672 with SMTP id
 e9e14a558f8ab-3a3bd2d7347mr12465425ab.16.1728957495210; Mon, 14 Oct 2024
 18:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014203646.1952505-1-surenb@google.com> <20241014203646.1952505-6-surenb@google.com>
 <CAJD7tkY0zzwX1BCbayKSXSxwKEGiEJzzKggP8dJccdajsr_bKw@mail.gmail.com>
 <cd848c5f-50cd-4834-a6dc-dff16c586e49@nvidia.com> <CAJD7tkY8LKVGN5QNy9q2UkRLnoOEd7Wcu_fKtxKqV7SN43QgrA@mail.gmail.com>
 <ba888da6-cd45-41b6-9d97-8292474d3ce6@nvidia.com>
In-Reply-To: <ba888da6-cd45-41b6-9d97-8292474d3ce6@nvidia.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 14 Oct 2024 18:58:04 -0700
Message-ID: <CAJuCfpE4eOH+HN8dQAavwUaMDfX5Fdyx7zft6TKcT33TiiDbXQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] alloc_tag: config to store page allocation tag
 refs in page flags
To: John Hubbard <jhubbard@nvidia.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org, 
	kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, mcgrof@kernel.org, 
	rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, tglx@linutronix.de, 
	bp@alien8.de, xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	pasha.tatashin@soleen.com, souravpanda@google.com, keescook@chromium.org, 
	dennis@kernel.org, yuzhao@google.com, vvvvvv@google.com, rostedt@goodmis.org, 
	iamjoonsoo.kim@lge.com, rientjes@google.com, minchan@google.com, 
	kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 5:03=E2=80=AFPM 'John Hubbard' via kernel-team
<kernel-team@android.com> wrote:
>
> On 10/14/24 4:56 PM, Yosry Ahmed wrote:
> > On Mon, Oct 14, 2024 at 4:53=E2=80=AFPM John Hubbard <jhubbard@nvidia.c=
om> wrote:
> >>
> >> On 10/14/24 4:48 PM, Yosry Ahmed wrote:
> >>> On Mon, Oct 14, 2024 at 1:37=E2=80=AFPM Suren Baghdasaryan <surenb@go=
ogle.com> wrote:
> >>>>
> >>>> Add CONFIG_PGALLOC_TAG_USE_PAGEFLAGS to store allocation tag
> >>>> references directly in the page flags. This eliminates memory
> >>>> overhead caused by page_ext and results in better performance
> >>>> for page allocations.
> >>>> If the number of available page flag bits is insufficient to
> >>>> address all kernel allocations, profiling falls back to using
> >>>> page extensions with an appropriate warning to disable this
> >>>> config.
> >>>> If dynamically loaded modules add enough tags that they can't
> >>>> be addressed anymore with available page flag bits, memory
> >>>> profiling gets disabled and a warning is issued.
> >>>
> >>> Just curious, why do we need a config option? If there are enough bit=
s
> >>> in page flags, why not use them automatically or fallback to page_ext
> >>> otherwise?
> >>
> >> Or better yet, *always* fall back to page_ext, thus leaving the
> >> scarce and valuable page flags available for other features?
> >>
> >> Sorry Suren, to keep coming back to this suggestion, I know
> >> I'm driving you crazy here! But I just keep thinking it through
> >> and failing to see why this feature deserves to consume so
> >> many page flags.
> >
> > I think we already always use page_ext today. My understanding is that
> > the purpose of this series is to give the option to avoid using
> > page_ext if there are enough unused page flags anyway, which reduces
> > memory waste and improves performance.
> >
> > My question is just why not have that be the default behavior with a
> > config option, use page flags if there are enough unused bits,
> > otherwise use page_ext.
>
> I agree that if you're going to implement this feature at all, then
> keying off of CONFIG_MEM_ALLOC_PROFILING seems sufficient, and no
> need to add CONFIG_PGALLOC_TAG_USE_PAGEFLAGS on top of that.

Yosry's original guess was correct. If not for loadable modules we
could get away with having no CONFIG_PGALLOC_TAG_USE_PAGEFLAGS. We
could try to fit codetag references into page flags and if they do not
fit we could fall back to page_ext. That works fine when we have a
predetermined number of tags. But loadable modules make this number
variable at runtime and there is a possibility we run out of page flag
bits at runtime. In that case, the current patchset disables memory
profiling and issues a warning that the user should disable
CONFIG_PGALLOC_TAG_USE_PAGEFLAGS to avoid this situation. I expect
this to be a rare case but it can happen and we have to provide a way
for a user to avoid running out of bits, which is where
CONFIG_PGALLOC_TAG_USE_PAGEFLAGS would be used.
Thanks,
Suren.

>
> thanks,
> --
> John Hubbard
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>

