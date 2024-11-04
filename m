Return-Path: <linux-doc+bounces-29881-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B999BC09A
	for <lists+linux-doc@lfdr.de>; Mon,  4 Nov 2024 23:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C738B21716
	for <lists+linux-doc@lfdr.de>; Mon,  4 Nov 2024 22:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B2C1FCF5F;
	Mon,  4 Nov 2024 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uSLckBCh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E271FCC69
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 22:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730758129; cv=none; b=vCwp0fkHI/BD2QMeJ0evlj9vwUP9FuSsL5rVi3GT9o2/CxkAkSgvmGnyyj9cK67O7Mz1clS2hq7h7DffTYUzOdQO/zZNRd7RU6v8MT22ZmHMZhDlJyBgAv3n0NnzmVelbe/0qNwnlRZn/s/4UIzOtdNt3Q//D0Uu8PRfVXhCDEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730758129; c=relaxed/simple;
	bh=9yjeDW7FoGcBbhm0devgQq4gJaurLSzw3WjNMqN4Dig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Es1h2HO2QBpilM9AWTMdGHKjjSkJPYX+lwjsEpyay2ZCGY2/WNZzIHgcC/J5M7AI2RYWuEA3OBved8WneQVF8UC0wzq+/JrB2kyZpKLLvnBw/+ZF0K3Xs493hMyLMLUpRDTM9CChwTho/obaL90Fa0/d3K7FzIFpLEvPEk2QEZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uSLckBCh; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5ebc1af8e91so2221942eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 14:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730758127; x=1731362927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZeJLhuGWwBpR2tgn/q1fig0IFTgvv0Juwu0EbDl2cM=;
        b=uSLckBChR4CZ8NkFOf1nqPO2CHNER3OOygaKDRVqNGI/tJY4BKAa0mSQFMk8wxDWSB
         dwyv4NE/cnoJXExoJGNyMn+NJGdgl5ybRDbMR6KTWbVqTl/IyZVm4V5k7gkzhqRr2rRf
         xUceynD4sniCFgI1dThsELe9pb4QHfGBZ9s+AbZxOWDvbDqfatPrE2y04NZMuD1xesG7
         nlbhfm5zm/evzmaZNTVY0QilLB76DoxcRKGLTVsokzz/1bRLG3SzoTmxIF1pvtGbLkPk
         Jt6VaDAJajmmnEe870TxtCoRryRic9MDfZi+YAfBy/guqVZ12Ktb36DLrwmWdFpl6vbj
         9oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730758127; x=1731362927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZeJLhuGWwBpR2tgn/q1fig0IFTgvv0Juwu0EbDl2cM=;
        b=tGeAZGKX23Gyjibae4FNOIkIput9aWA2b3UMRtRqK11OtompLOoOXb3hlnh2oc0NBa
         y1jsFLB+dv6FN4ZVnDEHy2+/gut3xyoPtxNTO+u1nEr26BRgD1sG8jHTFwPKGSkcUMTc
         6Do8i31K7Z/vAROMO9cDBDseScFGapnpD2sO5nDwCJdLnnsQO/fnoCe1YjbQsKsmlEFx
         3ljE++ooBKEbiE050HQpbzmbpecpUn8hKbj40B1BPKZCHpcG01yHJE/uq6wheoa3OqH+
         P/WKP9HotplWsuceSIXDV4cP/qDRTj/cS6wGAjQn7oqn4hO28ha18+4O0v7Ftp2bI6PF
         8y+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzLvO/yPRptUsbMpYOV852aYrvSe0EpnB98IZg2FudOFHEyvNX7xQsF/7aO5CZ/92tAzMHnIBsclk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYh1i5uLLjpBOGf/OgavpBVLye9ImiJOG37IsUfA5KyUnwBlME
	AD1Am5ktD4I3XH1QoeWLlQwNC3auWcDM6AjhhcobEhnT60YT1QReysEKoTSBuKcl8IcfGTjGTci
	QnHFqU+4qEkRZXsBvBWypLwVXUUUOUhC+4BJV
X-Google-Smtp-Source: AGHT+IFln5ARziviEZ5W8gZPhQEpbPGFJcy1tmyEkI9GsLY6a3qE2HayVDbKUpLBXHlxdIKA1VRIzX1NSAfBlC47kKc=
X-Received: by 2002:a05:6358:7254:b0:1ad:10eb:cd39 with SMTP id
 e5c5f4694b2df-1c3f9f7979amr1643843155d.26.1730758126978; Mon, 04 Nov 2024
 14:08:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025012304.2473312-1-shakeel.butt@linux.dev>
 <20241025012304.2473312-6-shakeel.butt@linux.dev> <iwmabnye3nl4merealrawt3bdvfii2pwavwrddrqpraoveet7h@ezrsdhjwwej7>
 <CAOUHufZexpg-m5rqJXUvkCh5nS6RqJYcaS9b=xra--pVnHctPA@mail.gmail.com>
 <ZykEtcHrQRq-KrBC@google.com> <20241104133834.e0e138038a111c2b0d20bdde@linux-foundation.org>
 <CAOUHufbA6GN=k3baYdvLN_xSQvX0UgA7OCeqT8TsWLEW7o=y9w@mail.gmail.com>
In-Reply-To: <CAOUHufbA6GN=k3baYdvLN_xSQvX0UgA7OCeqT8TsWLEW7o=y9w@mail.gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 4 Nov 2024 15:08:09 -0700
Message-ID: <CAOUHufZ=SMN=GWMjvpDxiXxyMAvDDc4eEzYvAWP4=7atT7SX7g@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] memcg-v1: no need for memcg locking for MGLRU
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 3:04=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Mon, Nov 4, 2024 at 2:38=E2=80=AFPM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Mon, 4 Nov 2024 10:30:29 -0700 Yu Zhao <yuzhao@google.com> wrote:
> >
> > > On Sat, Oct 26, 2024 at 09:26:04AM -0600, Yu Zhao wrote:
> > > > On Sat, Oct 26, 2024 at 12:34=E2=80=AFAM Shakeel Butt <shakeel.butt=
@linux.dev> wrote:
> > > > >
> > > > > On Thu, Oct 24, 2024 at 06:23:02PM GMT, Shakeel Butt wrote:
> > > > > > While updating the generation of the folios, MGLRU requires tha=
t the
> > > > > > folio's memcg association remains stable. With the charge migra=
tion
> > > > > > deprecated, there is no need for MGLRU to acquire locks to keep=
 the
> > > > > > folio and memcg association stable.
> > > > > >
> > > > > > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> > > > >
> > > > > Andrew, can you please apply the following fix to this patch afte=
r your
> > > > > unused fixup?
> > > >
> > > > Thanks!
> > >
> > > syzbot caught the following:
> > >
> > >   WARNING: CPU: 0 PID: 85 at mm/vmscan.c:3140 folio_update_gen+0x23d/=
0x250 mm/vmscan.c:3140
> > >   ...
> > >
> > > Andrew, can you please fix this in place?
> >
> > OK, but...
> >
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -3138,7 +3138,6 @@ static int folio_update_gen(struct folio *folio=
, int gen)
> > >       unsigned long new_flags, old_flags =3D READ_ONCE(folio->flags);
> > >
> > >       VM_WARN_ON_ONCE(gen >=3D MAX_NR_GENS);
> > > -     VM_WARN_ON_ONCE(!rcu_read_lock_held());
> > >
> > >       do {
> > >               /* lru_gen_del_folio() has isolated this page? */
> >
> > it would be good to know why this assertion is considered incorrect?
>
> The assertion was caused by the patch in this thread. It used to
> assert that a folio must be protected from charge migration. Charge
> migration is removed by this series, and as part of the effort, this
> patch removes the RCU lock.
>
> > And a link to the sysbot report?
>
> https://syzkaller.appspot.com/bug?extid=3D24f45b8beab9788e467e

Or this link would work better:

https://lore.kernel.org/lkml/67294349.050a0220.701a.0010.GAE@google.com/

