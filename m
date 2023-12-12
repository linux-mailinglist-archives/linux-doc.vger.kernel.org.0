Return-Path: <linux-doc+bounces-4868-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B880FBA3
	for <lists+linux-doc@lfdr.de>; Wed, 13 Dec 2023 00:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F04951C20CDF
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 23:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3214365A9B;
	Tue, 12 Dec 2023 23:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXN29BNc"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AB6472A
	for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 23:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C4BC433CC
	for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 23:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702425504;
	bh=hPz99cd9ncMhdqhEOW52ymvh41nJ6piVW+kmsgXYUQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uXN29BNc1wW3MHydt/a5ostC/bbsjV9exXkmVGhzvYs3RaWt1pypq/i80IgN7pNWp
	 TtFL/mP+MUvAuLX++eFkZTYJF9o9dUT9N2eEH5UNwFAkHGvdIa18qmE3+uTS6Rw93i
	 Vz7IbGdITYVBWtB2enE7Pb6OM8no+764vOz+N8z5fTHipSqjRVxeyx5bIYrNIfnhBo
	 Gd9B6gXfyR32S0854xczVTAxjZO1j131Zi0ov2X/TO4r0AfDvWiKVPa9FH1a+BbFlw
	 NV0bqdODbe5IPdiFeOhpAyoi1L4Df17OmL/51GfOaw6nOiOvcBFphD/6PqOcY/daLD
	 +sezSRrJ/uDWw==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-77f3c4914e5so336206885a.3
        for <linux-doc@vger.kernel.org>; Tue, 12 Dec 2023 15:58:24 -0800 (PST)
X-Gm-Message-State: AOJu0Yxg+BLqN/8y6BzoxIQekTOj8ywlXHrC87wrjGgHA/2Hi1/u+O+o
	KiYAmesDFNiNZ0J0K6bX6FL4wfsersw06aUg6wdUiQ==
X-Google-Smtp-Source: AGHT+IGOTnckQME+eVCsPSoeGOyMFBoqjkzOWlCwSBsc7t+BIufubWB0ct9OeR4xELFwTaEK+N63aLRDaYUgcs98klw=
X-Received: by 2002:a05:6358:7296:b0:170:17ea:f4e4 with SMTP id
 w22-20020a056358729600b0017017eaf4e4mr8579237rwf.49.1702425483026; Tue, 12
 Dec 2023 15:58:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <CAF8kJuPEKWbr_1a-OzqrYKSPmuty==KhC2vbTPAmm9xcJHo4cg@mail.gmail.com>
 <CAKEwX=Oj0Rur8i9Oo7y2Py7svx-g11sEj3GKQfMVL62x=4hvdA@mail.gmail.com>
 <CAF8kJuNpnqTM5x1QmQ7h-FaRWVnHBdNGvGvB3txohSOmZhYA-Q@mail.gmail.com>
 <20231209034229.GA1001962@cmpxchg.org> <ZXeTb_ACou7TEVsa@google.com>
In-Reply-To: <ZXeTb_ACou7TEVsa@google.com>
From: Chris Li <chrisl@kernel.org>
Date: Tue, 12 Dec 2023 15:57:51 -0800
X-Gmail-Original-Message-ID: <CAF8kJuNzFcBRW=2CbgG=seA=CNgyzD8DNXNY02uy0HUsLbg9JQ@mail.gmail.com>
Message-ID: <CAF8kJuNzFcBRW=2CbgG=seA=CNgyzD8DNXNY02uy0HUsLbg9JQ@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Minchan Kim <minchan@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, 
	tj@kernel.org, lizefan.x@bytedance.com, cerasuolodomenico@gmail.com, 
	yosryahmed@google.com, sjenning@redhat.com, ddstreet@ieee.org, 
	vitaly.wool@konsulko.com, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeelb@google.com, muchun.song@linux.dev, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, david@ixit.cz, Kairui Song <kasong@tencent.com>, 
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Minchan,

On Mon, Dec 11, 2023 at 2:55=E2=80=AFPM Minchan Kim <minchan@kernel.org> wr=
ote:

> > > 3) Android has some fancy swap ideas led by those patches.
> > > https://lore.kernel.org/linux-mm/20230710221659.2473460-1-minchan@ker=
nel.org/
> > > It got shot down due to removal of frontswap. But the usage case and
> > > product requirement is there.
> > > +Minchan
> >
> > This looks like an optimization for zram to bypass the block layer and
> > hook directly into the swap code. Correct me if I'm wrong, but this
> > doesn't appear to have anything to do with per-cgroup backend control.
>
> Hi Johannes,
>
> I haven't been following the thread closely, but I noticed the discussion
> about potential use cases for zram with memcg.
>
> One interesting idea I have is to implement a swap controller per cgroup.
> This would allow us to tailor the zram swap behavior to the specific need=
s of
> different groups.
>
> For example, Group A, which is sensitive to swap latency, could use zram =
swap
> with a fast compression setting, even if it sacrifices some compression r=
atio.
> This would prioritize quick access to swapped data, even if it takes up m=
ore space.
>
> On the other hand, Group B, which can tolerate higher swap latency, could=
 benefit
> from a slower compression setting that achieves a higher compression rati=
o.
> This would maximize memory efficiency at the cost of slightly slower data=
 access.

That is a very solid usage case. Thanks for sharing this swap backend
usage story. It goes beyond my original memory.swap.teires idea as
well.

We can have some zram specific knobs to control what compression
setting is using. Moving data between different compression settings
would be an interesting topic. It might fit the swap.tiers usage model
as well. I am just thinking it out loud. Maybe define different
compression settings as different tiers and then allow the cgroup to
enroll into one of the tiers list.

>
> This approach could provide a more nuanced and flexible way to manage swa=
p usage
> within different cgroups.
>

That is again very wonderful insight.

Thanks

Chris

