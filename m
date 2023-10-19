Return-Path: <linux-doc+bounces-674-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136AF7D018D
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 20:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBDC0282235
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 18:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E0B39850;
	Thu, 19 Oct 2023 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LY7h3J+T"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27DA39852
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 18:31:30 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495E5121;
	Thu, 19 Oct 2023 11:31:29 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-77acb04309dso408039f.2;
        Thu, 19 Oct 2023 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697740288; x=1698345088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FATldl0l8mttX55l07QCYkeMIDaJdk8BK4gw4WswyLw=;
        b=LY7h3J+TDQrPR+IyNuqABCvXgoKBQiy0GtqXZsuVV4xJyx8LDUoA0HS/X5kQtzXw0c
         4/2ulEChySeWqCxq/LcNjzzWZVZVR6jZVATTlS9xNf2c1JXEq0PNKFalkrDvoCz03KGt
         uDXjUGcms4O0vwBUbT03T0qGnBn+UWmoV8g8Tvo/pI0RDHoTwLwnVcUf+Cz5ytqQNYoE
         hHrICEWBf5B/PwgXvzEJ/wIQKlIec6zhD0Y352ca8HwbADa1yZdkIQwvtRiO0+ChFSRN
         O8PaJIym4pDZ93pZoC576fnAuAyP/VY39ALKDo9r5vDTr2y42mvLfG9dxM79t14Knnxo
         odSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697740288; x=1698345088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FATldl0l8mttX55l07QCYkeMIDaJdk8BK4gw4WswyLw=;
        b=KFELtXmQVKY9aMD+8mEPsAux0M90iQ8f3VFaPUG47skhlc7NeWWCEXKN1LCzV16NZ8
         O+0BvLYbqwIUySyKutMeRCjuHBg/frkUKVgR6YR7iRTl4aSk7BURmW1DCFWBOZnoKij6
         wukd5gib0M1EaUa05HNjd9kJEKzf+1rGt/7gaa0yo/Ln2f2OWNrcryugK2DHvWRaE3BD
         HZztHVxqoyTaS6D5DwZQCjTh5z5E89dv8CZIlbCvNrcFimfH+MWF8JH+x/TL+vm8S/wS
         Dgo1r5Xyp0YnStzhqrMyniKAL6OrU4yBlN5oUz9SlVlQDEoJ7lHw0FH6QnbNIJCqr74R
         yHUA==
X-Gm-Message-State: AOJu0YzsWv+0dg86f4LX/fbSIYiMRRPGSNGXff7vxX747GZos1886u7J
	n0Xy41QSm/JFZtBFoByQbAgMvBHSwpAnEUHfncU44gAnt3s=
X-Google-Smtp-Source: AGHT+IGo+8NPtVX5fb+D7jnXSCuJVS3j4eo9EyDPP79ozV2p34OA4XsPalOD6Wj2OQxipW14FJDZNZE6XoUZ7d58zBs=
X-Received: by 2002:a05:6602:3f94:b0:79a:b53c:d758 with SMTP id
 fb20-20020a0566023f9400b0079ab53cd758mr3507073iob.1.1697740288418; Thu, 19
 Oct 2023 11:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231019101204.179a9a1d2c7a05b604dad182@linux-foundation.org>
 <CAJD7tkYZ826ysjnoSbYnTH3h7eWKOE=ObHNCADb78c4x7NBHzg@mail.gmail.com>
In-Reply-To: <CAJD7tkYZ826ysjnoSbYnTH3h7eWKOE=ObHNCADb78c4x7NBHzg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 19 Oct 2023 11:31:17 -0700
Message-ID: <CAKEwX=PyoBfaGqH9sb07ZgjLnsGmssCDvWQo34T7brrqfZJAvg@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] workload-specific and memory pressure-driven zswap writeback
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org, 
	cerasuolodomenico@gmail.com, sjenning@redhat.com, ddstreet@ieee.org, 
	vitaly.wool@konsulko.com, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeelb@google.com, muchun.song@linux.dev, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 10:34=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
> On Thu, Oct 19, 2023 at 10:12=E2=80=AFAM Andrew Morton
> <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 17 Oct 2023 16:21:47 -0700 Nhat Pham <nphamcs@gmail.com> wrote:
> >
> > > Subject: [PATCH v3 0/5] workload-specific and memory pressure-driven =
zswap writeback
> >
> > We're at -rc6 and I'd prefer to drop this series from mm.git, have
> > another go during the next cycle.
> >
> > However Hugh's v2 series "mempolicy: cleanups leading to NUMA mpol
> > without vma" has syntactic dependencies on this series and will need
> > rework, so I'd like to make that decision soon.
> >
> > Do we feel that this series can be made into a mergeable state within
> > the next few days?
>
> There are parts of the code that I would feel more comfortable if
> someone took a look at (which I mentioned in individual patches). So
> unless this happens in the next few days I wouldn't say so.
>

I'm not super familiar with the other series. How big is the dependency?
Looks like it's just a small part in the swapcache code right?

If this is the case, I feel like the best course of action is to rebase
the mempolicy patch series on top of mm-unstable, and resolve
this merge conflict. I will then send out v4 of the zswap shrinker,
rebased on top of the mempolicy patch series.

If this is not the case, one thing we can do is:

a) Fix bugs (there's one kernel test robot it seems)
b) Fix user-visible details (writeback counter for e.g)

and just merge the series for now. FWIW, this is an optional
feature and disabled by default. So performance optimization
and aesthetics change (list_lru_add() renaming etc.) can wait.

We can push out v4 by the end of today and early tomorrow
if all goes well. Then everyone can review and comment on it.

How does everyone feel about this strategy?

> >
> > Thanks.

