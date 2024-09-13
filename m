Return-Path: <linux-doc+bounces-25209-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B58978873
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2024 21:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA1001F2386E
	for <lists+linux-doc@lfdr.de>; Fri, 13 Sep 2024 19:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26CD1459E4;
	Fri, 13 Sep 2024 19:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SGe2R29G"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA512AAC6
	for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 19:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726254316; cv=none; b=AMK9yPZEIxa/9n3qT4peeYPGv46oadJ6sZwpAvfTSDBJM2hH5oRsBQNb3GidmN9ZY1byk2U3O1snWsikx1IdGVZnWJFGupAzw2CR49EM78iegby8bcVfJ3jUVvtfXcLDvRNqgjhn7wEzOgRouagV112PVg5s93+VTOwQH1YLsFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726254316; c=relaxed/simple;
	bh=+6S0/RgELVdUJel/cUWVNUFvKDxxASFqNiNWuuAIlOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7irdZfr+/qDnkOesGUXlKgiqLda1OHhy/pto2Zh9OW0w0POSuRGFuQTdop6TFNAbMMC0RaxQt5NmLtPzva4rE25kEvncH9RmyYKd5NKwRs0vX7ZrALsk2u+5ceaNgdxhPWxldmuhjLHkNFt/GBpmxTJrfSN7pHwVe+MX6+96wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SGe2R29G; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d4979b843so336178666b.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2024 12:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726254313; x=1726859113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WoHxTe60RAKB/6oAK3V+qyyYMmqcduoEZhn+8jgBzQ=;
        b=SGe2R29GaMaMC/NjyrOjbkh+zI3QoUlIuRXmbN+ZJgRWsW8f9ewqK1+j8VoSv/UAfq
         nX2Z+efSSXrA9gCNIxRZkmtDHM6L+wchOy9XNQD0PiTiT/fhC7dM1zJddHz/hoPHeluN
         YCzIWuAKjDzS2n2l+LbPO7VmbyZzg7lz2jEghBF/6bKd6JQVBgpnksxFkxFU81N7j8hs
         RTzYEt/9F5o9dNpsR4H5Y7KCjwktaPr3BKaKjMX5jIJjP5US87oKNzWpEVYk52zhtICb
         gjnYAzOjq6e0frPy1u/1V7TkFSA6vTbFNfrQ+2pwhCJcSR+LSyIG3JkQ9r24QcQ6u4OS
         RqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726254313; x=1726859113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WoHxTe60RAKB/6oAK3V+qyyYMmqcduoEZhn+8jgBzQ=;
        b=R9AcHRp2bxwrafTEeLbtNCpLKx9yaM2JRE6euKeJV8lM+4yHdX3rdwhaQaMpo6iZFV
         Be7i0Dy2s5A6hgUMtfHdVFtHdvoeG/ArNKFpU818dWDTGrL6BuPrFOeOkxm5tOrcFX4p
         SL/7qHDFXPXWqYTMlfeLPdjUNBvC5tySTtjaTKaVULi9BFFJKBs9Tx4yh/kMJPdscVPv
         b1hXfKOujv68a+zUS7LW1wnja/XD/KFimsCVDA5+6Qe9eEmGa8HxJepxU51EdiP78tPd
         h+m3MZ9FddWPRBqWELvabvLrSZe1Q2ug5bGdgW3xdgSGQWgbzzAqZ8O1tEpEFR+QTqcU
         1fIw==
X-Forwarded-Encrypted: i=1; AJvYcCXXKY/2LR2WnIADDyUegojlQWcFFpW8oiBrcGMHESr1ZFZah6iD0WnvPyGKuZstPBoSxeoBX+lB0QY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJM/MNV4iMuTx+S3sjp7dA1ySWfgkAm20d4n8o4GwZGXgAX7e
	QDRW8ccnn43KgX/ocwKFPMHwEvkldWOSvjvA63/hSZG0yHKOr2kgvp0WD6BrHYlpG2euKu3oSkB
	28fZc+6xsT5cojC5ZgF/TiIKoKDm9hnYeBtc=
X-Google-Smtp-Source: AGHT+IG59IuCCkmHhT+Rulyrhsmm8XAw4Ppz/CVDh2Em59N1I4OU70I4N7kTlFoJUR58V4SEALGhnWnRyRvV9d3fR0Y=
X-Received: by 2002:a17:906:c14c:b0:a8a:9054:83b8 with SMTP id
 a640c23a62f3a-a9029619a16mr727817566b.46.1726254312497; Fri, 13 Sep 2024
 12:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913-mgtime-v7-0-92d4020e3b00@kernel.org> <20240913-mgtime-v7-1-92d4020e3b00@kernel.org>
 <CANDhNCof7+q+-XzQoP=w0pcrS_-ifH9pmAmtq8H++tbognBv1A@mail.gmail.com>
In-Reply-To: <CANDhNCof7+q+-XzQoP=w0pcrS_-ifH9pmAmtq8H++tbognBv1A@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 13 Sep 2024 12:05:01 -0700
Message-ID: <CANDhNCogb5014XM0UDd6FJNth=Oot+thb4m4M6Oq1zMndMz_dQ@mail.gmail.com>
Subject: Re: [PATCH v7 01/11] timekeeping: move multigrain timestamp floor
 handling into timekeeper
To: Jeff Layton <jlayton@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jonathan Corbet <corbet@lwn.net>, 
	Chandan Babu R <chandan.babu@oracle.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Chris Mason <clm@fb.com>, 
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chuck Lever <chuck.lever@oracle.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:59=E2=80=AFAM John Stultz <jstultz@google.com> w=
rote:
>
> On Fri, Sep 13, 2024 at 6:54=E2=80=AFAM Jeff Layton <jlayton@kernel.org> =
wrote:
> >
> > For multigrain timestamps, we must keep track of the latest timestamp
> > that has ever been handed out, and never hand out a coarse time below
> > that value.
> >
> > Add a static singleton atomic64_t into timekeeper.c that we can use to
> > keep track of the latest fine-grained time ever handed out. This is
>
> Maybe drop "ever" and  add "handed out through a specific interface",
> as timestamps can be accessed in a lot of ways that don't keep track
> of what was returned.
>
>
> > tracked as a monotonic ktime_t value to ensure that it isn't affected b=
y
> > clock jumps.
> >
> > Add two new public interfaces:
> >
> > - ktime_get_coarse_real_ts64_mg() fills a timespec64 with the later of =
the
> >   coarse-grained clock and the floor time
> >
> > - ktime_get_real_ts64_mg() gets the fine-grained clock value, and tries
> >   to swap it into the floor. A timespec64 is filled with the result.
> >
> > Since the floor is global, we take great pains to avoid updating it
> > unless it's absolutely necessary. If we do the cmpxchg and find that th=
e
> > value has been updated since we fetched it, then we discard the
> > fine-grained time that was fetched in favor of the recent update.
> >
> > To maximize the window of this occurring when multiple tasks are racing
> > to update the floor, ktime_get_coarse_real_ts64_mg returns a cookie
> > value that represents the state of the floor tracking word, and
> > ktime_get_real_ts64_mg accepts a cookie value that it uses as the "old"
> > value when calling cmpxchg().
> >
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  include/linux/timekeeping.h |  4 +++
> >  kernel/time/timekeeping.c   | 81 +++++++++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 85 insertions(+)
> >
> > diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
> > index fc12a9ba2c88..cf2293158c65 100644
> > --- a/include/linux/timekeeping.h
> > +++ b/include/linux/timekeeping.h
> > @@ -45,6 +45,10 @@ extern void ktime_get_real_ts64(struct timespec64 *t=
v);
> >  extern void ktime_get_coarse_ts64(struct timespec64 *ts);
> >  extern void ktime_get_coarse_real_ts64(struct timespec64 *ts);
> >
> > +/* Multigrain timestamp interfaces */
> > +extern u64 ktime_get_coarse_real_ts64_mg(struct timespec64 *ts);
> > +extern void ktime_get_real_ts64_mg(struct timespec64 *ts, u64 cookie);
> > +
> >  void getboottime64(struct timespec64 *ts);
> >
> >  /*
> > diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> > index 5391e4167d60..ee11006a224f 100644
> > --- a/kernel/time/timekeeping.c
> > +++ b/kernel/time/timekeeping.c
> > @@ -114,6 +114,13 @@ static struct tk_fast tk_fast_raw  ____cacheline_a=
ligned =3D {
> >         .base[1] =3D FAST_TK_INIT,
> >  };
> >
> > +/*
> > + * This represents the latest fine-grained time that we have handed ou=
t as a
> > + * timestamp on the system. Tracked as a monotonic ktime_t, and conver=
ted to the
> > + * realtime clock on an as-needed basis.
> > + */
> > +static __cacheline_aligned_in_smp atomic64_t mg_floor;
> > +
> >  static inline void tk_normalize_xtime(struct timekeeper *tk)
> >  {
> >         while (tk->tkr_mono.xtime_nsec >=3D ((u64)NSEC_PER_SEC << tk->t=
kr_mono.shift)) {
> > @@ -2394,6 +2401,80 @@ void ktime_get_coarse_real_ts64(struct timespec6=
4 *ts)
> >  }
> >  EXPORT_SYMBOL(ktime_get_coarse_real_ts64);
> >
> > +/**
> > + * ktime_get_coarse_real_ts64_mg - get later of coarse grained time or=
 floor
> > + * @ts: timespec64 to be filled
> > + *
> > + * Adjust floor to realtime and compare it to the coarse time. Fill
> > + * @ts with the latest one. Returns opaque cookie suitable for passing
> > + * to ktime_get_real_ts64_mg().
> > + */
> > +u64 ktime_get_coarse_real_ts64_mg(struct timespec64 *ts)
> > +{
> > +       struct timekeeper *tk =3D &tk_core.timekeeper;
> > +       u64 floor =3D atomic64_read(&mg_floor);
> > +       ktime_t f_real, offset, coarse;
> > +       unsigned int seq;
> > +
> > +       WARN_ON(timekeeping_suspended);
> > +
> > +       do {
> > +               seq =3D read_seqcount_begin(&tk_core.seq);
> > +               *ts =3D tk_xtime(tk);
> > +               offset =3D *offsets[TK_OFFS_REAL];
> > +       } while (read_seqcount_retry(&tk_core.seq, seq));
> > +
> > +       coarse =3D timespec64_to_ktime(*ts);
> > +       f_real =3D ktime_add(floor, offset);
> > +       if (ktime_after(f_real, coarse))
> > +               *ts =3D ktime_to_timespec64(f_real);
> > +       return floor;
> > +}
> > +EXPORT_SYMBOL_GPL(ktime_get_coarse_real_ts64_mg);
> > +
> > +/**
> > + * ktime_get_real_ts64_mg - attempt to update floor value and return r=
esult
> > + * @ts:                pointer to the timespec to be set
> > + * @cookie:    opaque cookie from earlier call to ktime_get_coarse_rea=
l_ts64_mg()
> > + *
> > + * Get a current monotonic fine-grained time value and attempt to swap
> > + * it into the floor using @cookie as the "old" value. @ts will be
> > + * filled with the resulting floor value, regardless of the outcome of
> > + * the swap.
>
> I'd add more detail here to clarify that this can return a coarse
> floor value if the cookie is stale.

Additionally, for these two new interfaces, since they are so
specifically tuned to this particular need in the vfs, it might be
good to add a comments in the kerneldoc here that they are special
case interfaces for the vfs and should be avoided outside that space.

That probably would alleviate my main worries, and we can polish the
details around cookie or no cookie later if needed.

thanks
-john

