Return-Path: <linux-doc+bounces-4528-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBEF80A918
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 17:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BA67B20AE5
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 16:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD5938DE9;
	Fri,  8 Dec 2023 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="OabM06Rl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272831987
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 08:34:58 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-77f44cd99c6so117489985a.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 08:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1702053297; x=1702658097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2+AmVgLDfypwxW3Bljg7Nlcki/DDdvlAbwDqkv78IU=;
        b=OabM06RlsYoH86rqmIKGTAdN71vEzChKz6ljpozBVUCt0L86n4wDHJx/nFGzSoBKpr
         FSUWASqiUGEzGOtiH0I+cTWDNp7me3owCN8jNNoacBmSyE+uc9JIVGYcBI3vapKb9jFo
         tNoz/tqLEaJY3v0PLxg1ctYBlVd8V4A16sApFS8WRGyEdw4dYCxBYoSJ3iSH0SeaHazh
         Rc9oke+rIT4pYLfXPfGtfdXVZ01DGuOkXQVYoQmibATsEFpTISQ68/MDxAo8ArVg6G4a
         9OydwkNyzT7KxSjkzG7SWK0uKX+2Vakd6hjMTPVmbo8mTs10VUf3BDN0wkZ+GsvhBU2j
         SMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702053297; x=1702658097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2+AmVgLDfypwxW3Bljg7Nlcki/DDdvlAbwDqkv78IU=;
        b=kvowIkhzaOQl6WVxfrO8Sz1gwBJ3jvpWbyuCEDVu3ZYvQmX+MkJ0f/sMYTqLOde5/6
         onL45KX0KlEGDdBXeQIKVy+1qTNO7ZUPkM/rX83wQRQ133tynU5w2p8ozAtuHYHv0ZBq
         US5L27FXpCssEHgmkBUdAhnVToq2/00E5o/kwbkHaPVRPbV2JD5eQ+JFyTZBst4GOmuh
         hxTRct8zdB8YTNG9cHUyXlP3IdIskwNfNlLwMMUuP+juWx7F8Lb9zdTcy63XTQXVRyEJ
         iyo4vocPuFmS1GOlX8IolpQAg8Ee8S4lGSY9h+he4464ihR8xR05yOU0czkQXdiYOZah
         ALBA==
X-Gm-Message-State: AOJu0YyJf8musbTj80f9wKitMqyV0q0XGRs4H0hI7wqdHf0q0zUw1OX1
	A25Q5PA8m8qjcnbYdfTdzFyRlQ==
X-Google-Smtp-Source: AGHT+IFe1Xg0qwccEDuPPnzdLWZ8EYqrBETcx+Lf9yWWCpT5/NmbxdDEr56PRuW1STtBLXxRVw3QKg==
X-Received: by 2002:a05:620a:2187:b0:77e:ffb5:271a with SMTP id g7-20020a05620a218700b0077effb5271amr1661333qka.44.1702053297239;
        Fri, 08 Dec 2023 08:34:57 -0800 (PST)
Received: from localhost (2603-7000-0c01-2716-da5e-d3ff-fee7-26e7.res6.spectrum.com. [2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id rc3-20020a05620a8d8300b0077dc7a029bfsm802254qkn.100.2023.12.08.08.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:34:56 -0800 (PST)
Date: Fri, 8 Dec 2023 11:34:51 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Chris Li <chrisl@kernel.org>,
	akpm@linux-foundation.org, tj@kernel.org, lizefan.x@bytedance.com,
	cerasuolodomenico@gmail.com, sjenning@redhat.com, ddstreet@ieee.org,
	vitaly.wool@konsulko.com, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeelb@google.com,
	muchun.song@linux.dev, hughd@google.com, corbet@lwn.net,
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
Message-ID: <20231208163451.GA880930@cmpxchg.org>
References: <20231207192406.3809579-1-nphamcs@gmail.com>
 <CAF8kJuPEKWbr_1a-OzqrYKSPmuty==KhC2vbTPAmm9xcJHo4cg@mail.gmail.com>
 <CAKEwX=Oj0Rur8i9Oo7y2Py7svx-g11sEj3GKQfMVL62x=4hvdA@mail.gmail.com>
 <CAJD7tkaHaji=0sVobJKajc4hOmOui2U+bZK+1DQ6gbAsQgGLRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD7tkaHaji=0sVobJKajc4hOmOui2U+bZK+1DQ6gbAsQgGLRw@mail.gmail.com>

On Thu, Dec 07, 2023 at 05:12:13PM -0800, Yosry Ahmed wrote:
> On Thu, Dec 7, 2023 at 5:03 PM Nhat Pham <nphamcs@gmail.com> wrote:
> > On Thu, Dec 7, 2023 at 4:19 PM Chris Li <chrisl@kernel.org> wrote:
> > > I am wondering about the status of "memory.swap.tiers" proof of concept patch?
> > > Are we still on board to have this two patch merge together somehow so
> > > we can have
> > > "memory.swap.tiers" == "all" and "memory.swap.tiers" == "zswap" cover the
> > > memory.zswap.writeback == 1 and memory.zswap.writeback == 0 case?
> > >
> > > Thanks
> > >
> > > Chris
> > >
> >
> > Hi Chris,
> >
> > I briefly summarized my recent discussion with Johannes here:
> >
> > https://lore.kernel.org/all/CAKEwX=NwGGRAtXoNPfq63YnNLBCF0ZDOdLVRsvzUmYhK4jxzHA@mail.gmail.com/
> >
> > TL;DR is we acknowledge the potential usefulness of swap.tiers
> > interface, but the use case is not quite there yet, so it does not
> > make too much sense to build up that heavy machinery now.
> > zswap.writeback is a more urgent need, and does not prevent swap.tiers
> > if we do decide to implement it.
> 
> I am honestly not convinced by this. There is no heavy machinery here.
> The interface is more generic and extensible, but the implementation
> is roughly the same. Unless we have a reason to think a swap.tiers
> interface may make it difficult to extend this later or will not
> support some use cases, I think we should go ahead with it. If we are
> worried that "tiers" may not accurately describe future use cases, we
> can be more generic and call it swap.types or something.

I have to disagree. The generic swap types or tiers ideas actually
look pretty far-fetched to me, and there is a lack of convincing
explanation for why this is even a probable direction for swap.

For example,

1. What are the other backends? Where you seem to see a multitude of
   backends and arbitrary hierarchies of them, I see compression and
   flash, and really not much else. And there is only one reasonable
   direction in which to combine those two.

   The IOPs and latencies of HDDs and network compared to modern
   memory sizes and compute speeds make them for the most part
   impractical as paging backends.

   So I don't see a common third swap backend, let alone a fourth or a
   fifth, or a multitude of meaningful ways of combining them...

2. Even if the usecases were there, enabling this would be a ton of
   work and open interface questions:

  1) There is no generic code to transfer pages between arbitrary
     backends.

  2) There is no accepted indirection model where a swap pte can refer
     to backends dynamically, in a way that makes migration feasible
     at scale.

  3) Arbitrary global strings are somewhat unlikely to be accepted as
     a way to configure these hierarchies.

  4) Backend file paths in a global sysfs file don't work well with
     namespacing. The swapfile could be in a container
     namespace. Containers are not guaranteed to see /sys.

  5) Fixed keywords like "zswap" might not be good enough - what about
     compression and backend parameters?

None of these are insurmountable. My point is that this would be a
huge amount of prerequisite code and effort for what seems would be a
fringe usecase at best right now.

And there could be a lot of curve balls in both the software design as
well as the hardware development between now and then that could make
your proposals moot. Is a per-cgroup string file really going to be
the right way to configure arbitrary hierarchies if they materialize?

This strikes me as premature and speculative, for what could be, some
day.

We don't even do it for *internal API*. There is a review rule to
introduce a function in the same patch as its first caller, to make
sure it's the right abstraction and a good fit for the usecase. There
is no way we can have a lower bar than that for permanent ABI.

The patch here integrates with what zswap is NOW and always has been:
a compressing writeback cache for swap.

Should multiple swap tiers overcome all the above and actually become
real, this knob here would be the least of our worries. It would be
easy to just ignore, automatically override, or deprecate.

So I don't think you made a reasonable proposal for an alternative, or
gave convincing reasons to hold off this one.

