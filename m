Return-Path: <linux-doc+bounces-1649-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A87DFC7C
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 23:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E887A1C20F23
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 22:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CBD21373;
	Thu,  2 Nov 2023 22:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFdqAowQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12471DFD9
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 22:40:30 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AD7B7;
	Thu,  2 Nov 2023 15:40:29 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3594c100735so4419275ab.1;
        Thu, 02 Nov 2023 15:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698964828; x=1699569628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc8asfYOeO/AOwc/brrfBGOOvr6zT/uDTRraWYt21O4=;
        b=YFdqAowQLwabt2w2zzPeDWLSwP0gaJFysRShrtpeiElZUZDmjEyojza/kijnCjEGdG
         gqJCL+z48Jc9fdonjD83jaAEUXQrCRAph7e7m/Zdg/saOn+zUBPzd1MyceFw/DzLAn/n
         YLrTCHU80l9z4ELEehIOOXD8j8IlQS0fHEJJx3KfcUd56fulDkOzwRxkc87qe21ksxUp
         KvNiGPILeLqzSP0GOb3cFcWkWCrGRlTZljGtu2XKYS8ccwoTT8OHPlYvfzRcqdMfa6Ot
         7ZGQDE8tdG3uGbZ1U+W7/0vMlMz5+8c/3PRNitMwUcTU+mEPK1hqneae1xwqzPgju9RE
         UO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698964828; x=1699569628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qc8asfYOeO/AOwc/brrfBGOOvr6zT/uDTRraWYt21O4=;
        b=tGjtZ7VHXOP0Niwq/GOmgLLmjbMDbeMvsUiakbsFOp9ktv7WLcR/yw04OuoS1itesw
         Q9L01yAqMfDLtb5H2H+no98PiWpRjjNAHk5/gh9vw7e4yMtLj0RNmqlHZrRmMejtUXEN
         beF65feuvcfNIhNH9FdoMgPX45jvWKtxr6OQYCw4jyqk7b4VRBVANaTBkdRMySP3lAFd
         4Dwpqhpc8W+RiBRErZ6najSz/m4Roj60DY2ikEDbyJKKeUizu6/ncYcnEnjoMswJ4e7A
         b2Kxb6onmRE+3GxodfHnJefQa/+JwYGBuNmKoOOPUuFP01SEc9bYAI0IJdIZHzm/7BfX
         5C5Q==
X-Gm-Message-State: AOJu0YxBmicHXPFqkErHYaXfGlytN5aqcfeqTdBlMan5zICrkJVRIf9Q
	dtH+IvINElNcSaWxHA/zUJoFGWZN1cJ4yKGTttc=
X-Google-Smtp-Source: AGHT+IEAD4K9sHQRK7LJB/PKdoDtBLxq6pbnMYlsV5/1F/rg1Wi1wcKDZddZCjp5HWhGR6oag/OCQe+mARwPp1pjcfY=
X-Received: by 2002:a92:d74b:0:b0:359:3ff:17c6 with SMTP id
 e11-20020a92d74b000000b0035903ff17c6mr943748ilq.4.1698964828290; Thu, 02 Nov
 2023 15:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231102200202.920461-1-nphamcs@gmail.com> <CAJD7tkY8iPBo99+1gdsSRMNDu4jkVKz8rb=W+xk9=GE0y=kSuw@mail.gmail.com>
 <20231102205022.GA3265934@cmpxchg.org> <CAJD7tkacw52fwr6bUk5frepaRN071mmCeGke4s-jMwAXjKqSPg@mail.gmail.com>
In-Reply-To: <CAJD7tkacw52fwr6bUk5frepaRN071mmCeGke4s-jMwAXjKqSPg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 2 Nov 2023 15:40:17 -0700
Message-ID: <CAKEwX=MwNE_q3m+in8gO7XnjE5uhdFOpUyGzdteimSP1FJN7hg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] zswap: memcontrol: implement zswap writeback disabling
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, akpm@linux-foundation.org, tj@kernel.org, 
	lizefan.x@bytedance.com, cerasuolodomenico@gmail.com, sjenning@redhat.com, 
	ddstreet@ieee.org, vitaly.wool@konsulko.com, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeelb@google.com, muchun.song@linux.dev, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, 
	senozhatsky@chromium.org, rppt@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 1:54=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com> =
wrote:
>
> On Thu, Nov 2, 2023 at 1:50=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.or=
g> wrote:
> >
> > On Thu, Nov 02, 2023 at 01:27:24PM -0700, Yosry Ahmed wrote:
> > > On Thu, Nov 2, 2023 at 1:02=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> =
wrote:
> > > > @@ -201,6 +201,12 @@ int swap_writepage(struct page *page, struct w=
riteback_control *wbc)
> > > >                 folio_end_writeback(folio);
> > > >                 return 0;
> > > >         }
> > > > +
> > > > +       if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio))=
) {
> > > > +               folio_mark_dirty(folio);
> > > > +               return AOP_WRITEPAGE_ACTIVATE;
> > > > +       }
> > > > +
> > >
> > > I am not a fan of this, because it will disable using disk swap if
> > > "zswap_writeback" is disabled, even if zswap is disabled or the page
> > > was never in zswap. The term zswap_writeback makes no sense here tbh.
> > >
> > > I am still hoping someone else will suggest better semantics, because
> > > honestly I can't think of anything. Perhaps something like
> > > memory.swap.zswap_only or memory.swap.types which accepts a string
> > > (e.g. "zswap"/"all",..).
> >
> > I had suggested the writeback name.
> >
> > My thinking was this: from a user pov, the way zswap is presented and
> > described, is a fast writeback cache that sits on top of swap. It's
> > implemented as this lookaside thing right now, but that's never how it
> > was sold. And frankly, that's not how it's expected to work, either.
> >
> > From the docs:
> >
> >   Zswap is a lightweight compressed cache for swap pages.
> >
> >   Zswap evicts pages from compressed cache on an LRU basis to the
> >   backing swap device when the compressed pool reaches its size limit.
> >
> > When zswap is enabled, IO to the swap device is expected to come from
> > zswap. Everything else would be a cache failure. There are a few cases
> > now where zswap rejects and bypasses to swap. It's not a stretch to
> > call them accelerated writeback or writethrough. But also, these
> > represent failures and LRU inversions, we're working on fixing them.
> >
> > So from a user POV it's reasonable to say if I have zswap enabled and
> > disable writeback, I don't expect swapfile IO.
>
> Makes sense (although now you had me thinking whether
> memory.zswap.writethrough is a better name).

Hmmm I lean towards writeback because it's already used in zswap
context. Users not familiar with the writethrough concept might be
confused by the naming.

>
> >
> > But yes, if zswap isn't enabled at all, this shouldn't prevent pages
> > from going to swap.
>
> Right, at least mem_cgroup_zswap_writeback_enabled() should always
> return true if zswap is disabled.

Sure enough! In the next version, I'll always return true in this case.

>
> One more unrelated thing,  I think we should drop the
> cgroup_subsys_on_dfl() check there. I understand the interface is only
> exposed in v2, but I don't see any reason why it wouldn't work in v1.
> Let's not make it harder for anyone who tries to expose this in v1
> (whether upstream or in an internal patch).

I don't have anything against cgroup v1 per se :) I just happened to
notice that zswap charging is not available in v1, so I just played it
safe here.

If nobody objects I can unguard this feature from v1. Seems
reasonable to me tbh.

