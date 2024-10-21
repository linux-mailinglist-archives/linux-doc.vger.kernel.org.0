Return-Path: <linux-doc+bounces-28195-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D39A9137
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 22:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9381F22D0C
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 20:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B651FDFBD;
	Mon, 21 Oct 2024 20:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6kGEtSV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC31FE0E1;
	Mon, 21 Oct 2024 20:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729542532; cv=none; b=bpngqciHgu1Lr82k5Qqq0Uo8U6RZFCiI8/Z7IvfNuP6RlIa3feV/s7vM+wXv1HhJ38DLVM9izBOglaZA6unneaeHa0ZHARiPqjZ9rCMf1tQGMEv0Yv+P5PVpgTWDTOItRVzebikMV8TRpaE4P2sLk9CZx+7swDAFNXMN0/juVPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729542532; c=relaxed/simple;
	bh=tgFerbJ7LJhOtAGVSIgLE4Pu306OsGxSbTc8wT3CP6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcPqTzDM+Q7uZddca/e0/o/kPfTSs40ExRHvT2hVjddG2HfQdwAMhhDsLm4OoMo+m3MOphCCNUBddb+auvOZYsRlWvi8nVtHO9Fn+FcpMEZxkbYnolQ2xu8e22CE2NedsoxK/yVMrSzDmnEo5CA+DXgzoSCQ1tQYZFLrIfoMywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6kGEtSV; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-50d55d86f95so1479381e0c.1;
        Mon, 21 Oct 2024 13:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542529; x=1730147329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1MjJjA6OBVhIpO2BaWMfxqMF/W6s2PQO/G0uTKSwnQ=;
        b=c6kGEtSVUXUFUpwMqhHYiH+kGdt1RmtdiZGDByP8+5M/Yft3RxaJVq9KHI0JHE/jth
         pHnim5PKE4TfsBOmLaHTVTWAJHyGy3UmIuJvr9tRMtuN5TY6VjiFD5yEqE14mLnWRpQ6
         pPPRFGPk8uDZIDWXLwNcfvkRWowoi8L1ai0Ty8B/rQVfYHbigqlPdKJWHcxBZ/dr8wks
         M8pK78AmnQqrVnHNjqS7HWce/ChkFkmIN46oT2fRvBw/vte61iQYUkMis0i50tt9BWld
         wKyTHDY6OQ9yQNvCfioBUQCZrEYhwXAh5LAfKqL+IGJh2rK657kX01QmtGGFWRVU3Nla
         3rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542529; x=1730147329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1MjJjA6OBVhIpO2BaWMfxqMF/W6s2PQO/G0uTKSwnQ=;
        b=CzZvNbwShLwhoyDgPgIm4iiuRnf1t1ucGFZJEoWNgE9LfvmRVRCkeAFKvVznGnsc44
         DUgfjRhKnOWQG/HLWgsBwfXkedsATIL+dqRew0FwoCy/S3C9Q0vqWxh1axFNV1DjZDdc
         kN/KnaYmhCWnBPLJ0HSwCSvWbhl0tf1h/ZtUviAcNteGwgyDZS9k2spIweGRd/uPFXFQ
         p/9bVGvjIizdH3xKYq86ZRhqnK+36FIQZxpCIM1UNY7eqX3GXbKwynGqa3TTze3AY9cV
         VFK2HuLwt5LEUJTg5jy2NOs6jhnqc2d2/B+9oDXnH1mZV0h1yv/v96ED3L9h2LDhQCy/
         DL8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6DLW3YCxW+4QA41hdGECviTEdKvNlF65Unj5AaFNVkUs3QR4k8DnguNRYBhDkHGZpRXPscUb+a+/vrYWN@vger.kernel.org, AJvYcCXeppCWC4LQFaJvmp4jlDh7tfPAg9CyQJJkXDgrB+Zy6ELwn1GApSqSVDBztokMMNioOzzYQTF9oGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEw+Wcx1Kiswu0k+BiIr8knIiNf8Ibs46DJO7sZSPDm8Y3XLCh
	hyel+ECVAHOnozlf/PDHQkMZFx53FZyBfvCobjEU4JJDqGAnO1gMNdxPx/C7yNWcGIijyNYJNmk
	UkwQe2IDs/Le3F2Q097nDKOUcjCw=
X-Google-Smtp-Source: AGHT+IHnAbkv9Z4ArBncAFrT/R18g+j7I3yE9ZwONgynN1gPNT9i0kkDPOLxkGvOVJZeCqPOu0TojT4L7bIrjPWhXJc=
X-Received: by 2002:a05:6122:a20:b0:50d:bfb2:4f2f with SMTP id
 71dfb90a1353d-50dda165e77mr8422244e0c.2.1729542529468; Mon, 21 Oct 2024
 13:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018105026.2521366-1-usamaarif642@gmail.com>
 <20241018105026.2521366-4-usamaarif642@gmail.com> <CAGsJ_4xyDMUDxVhi0bzZJ4jAd_Hw8Hn25+4epO9u9=iu0QMdoA@mail.gmail.com>
 <ca158172-a100-4af6-98de-083d77cd9ed8@gmail.com> <CAGsJ_4x9YKi9BKmzOuOfaLrjr=kpQsiog=rAP3jJY=YQJ3Fupg@mail.gmail.com>
 <ac2d47fc-9bdc-441f-8b96-fb47862cd2c6@gmail.com>
In-Reply-To: <ac2d47fc-9bdc-441f-8b96-fb47862cd2c6@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 22 Oct 2024 09:28:38 +1300
Message-ID: <CAGsJ_4xbciws3AnRFk0U8YeS5MPD=deXw6PCB6i71vgrLir8ew@mail.gmail.com>
Subject: Re: [RFC 3/4] mm/zswap: add support for large folio zswapin
To: Usama Arif <usamaarif642@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, hannes@cmpxchg.org, 
	david@redhat.com, willy@infradead.org, kanchana.p.sridhar@intel.com, 
	yosryahmed@google.com, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	ryan.roberts@arm.com, ying.huang@intel.com, riel@surriel.com, 
	shakeel.butt@linux.dev, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 1:21=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
>
>
> On 21/10/2024 11:55, Barry Song wrote:
> > On Mon, Oct 21, 2024 at 11:44=E2=80=AFPM Usama Arif <usamaarif642@gmail=
.com> wrote:
> >>
> >>
> >>
> >> On 21/10/2024 06:49, Barry Song wrote:
> >>> On Fri, Oct 18, 2024 at 11:50=E2=80=AFPM Usama Arif <usamaarif642@gma=
il.com> wrote:
> >>>>
> >>>> At time of folio allocation, alloc_swap_folio checks if the entire
> >>>> folio is in zswap to determine folio order.
> >>>> During swap_read_folio, zswap_load will check if the entire folio
> >>>> is in zswap, and if it is, it will iterate through the pages in
> >>>> folio and decompress them.
> >>>> This will mean the benefits of large folios (fewer page faults, batc=
hed
> >>>> PTE and rmap manipulation, reduced lru list, TLB coalescing (for arm=
64
> >>>> and amd) are not lost at swap out when using zswap.
> >>>> This patch does not add support for hybrid backends (i.e. folios
> >>>> partly present swap and zswap).
> >>>>
> >>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >>>> ---
> >>>>  mm/memory.c | 13 +++-------
> >>>>  mm/zswap.c  | 68 ++++++++++++++++++++++++--------------------------=
---
> >>>>  2 files changed, 34 insertions(+), 47 deletions(-)
> >>>>
> >>>> diff --git a/mm/memory.c b/mm/memory.c
> >>>> index 49d243131169..75f7b9f5fb32 100644
> >>>> --- a/mm/memory.c
> >>>> +++ b/mm/memory.c
> >>>> @@ -4077,13 +4077,14 @@ static bool can_swapin_thp(struct vm_fault *=
vmf, pte_t *ptep, int nr_pages)
> >>>>
> >>>>         /*
> >>>>          * swap_read_folio() can't handle the case a large folio is =
hybridly
> >>>> -        * from different backends. And they are likely corner cases=
. Similar
> >>>> -        * things might be added once zswap support large folios.
> >>>> +        * from different backends. And they are likely corner cases=
.
> >>>>          */
> >>>>         if (unlikely(swap_zeromap_batch(entry, nr_pages, NULL) !=3D =
nr_pages))
> >>>>                 return false;
> >>>>         if (unlikely(non_swapcache_batch(entry, nr_pages) !=3D nr_pa=
ges))
> >>>>                 return false;
> >>>> +       if (unlikely(!zswap_present_test(entry, nr_pages)))
> >>>> +               return false;
> >>>>
> >>>>         return true;
> >>>>  }
> >>>> @@ -4130,14 +4131,6 @@ static struct folio *alloc_swap_folio(struct =
vm_fault *vmf)
> >>>>         if (unlikely(userfaultfd_armed(vma)))
> >>>>                 goto fallback;
> >>>>
> >>>> -       /*
> >>>> -        * A large swapped out folio could be partially or fully in =
zswap. We
> >>>> -        * lack handling for such cases, so fallback to swapping in =
order-0
> >>>> -        * folio.
> >>>> -        */
> >>>> -       if (!zswap_never_enabled())
> >>>> -               goto fallback;
> >>>> -
> >>>>         entry =3D pte_to_swp_entry(vmf->orig_pte);
> >>>>         /*
> >>>>          * Get a list of all the (large) orders below PMD_ORDER that=
 are enabled
> >>>> diff --git a/mm/zswap.c b/mm/zswap.c
> >>>> index 9cc91ae31116..a5aa86c24060 100644
> >>>> --- a/mm/zswap.c
> >>>> +++ b/mm/zswap.c
> >>>> @@ -1624,59 +1624,53 @@ bool zswap_present_test(swp_entry_t swp, int=
 nr_pages)
> >>>>
> >>>>  bool zswap_load(struct folio *folio)
> >>>>  {
> >>>> +       int nr_pages =3D folio_nr_pages(folio);
> >>>>         swp_entry_t swp =3D folio->swap;
> >>>> +       unsigned int type =3D swp_type(swp);
> >>>>         pgoff_t offset =3D swp_offset(swp);
> >>>>         bool swapcache =3D folio_test_swapcache(folio);
> >>>> -       struct xarray *tree =3D swap_zswap_tree(swp);
> >>>> +       struct xarray *tree;
> >>>>         struct zswap_entry *entry;
> >>>> +       int i;
> >>>>
> >>>>         VM_WARN_ON_ONCE(!folio_test_locked(folio));
> >>>>
> >>>>         if (zswap_never_enabled())
> >>>>                 return false;
> >>>>
> >>>> -       /*
> >>>> -        * Large folios should not be swapped in while zswap is bein=
g used, as
> >>>> -        * they are not properly handled. Zswap does not properly lo=
ad large
> >>>> -        * folios, and a large folio may only be partially in zswap.
> >>>> -        *
> >>>> -        * Return true without marking the folio uptodate so that an=
 IO error is
> >>>> -        * emitted (e.g. do_swap_page() will sigbus).
> >>>> -        */
> >>>> -       if (WARN_ON_ONCE(folio_test_large(folio)))
> >>>> -               return true;
> >>>> -
> >>>> -       /*
> >>>> -        * When reading into the swapcache, invalidate our entry. Th=
e
> >>>> -        * swapcache can be the authoritative owner of the page and
> >>>> -        * its mappings, and the pressure that results from having t=
wo
> >>>> -        * in-memory copies outweighs any benefits of caching the
> >>>> -        * compression work.
> >>>> -        *
> >>>> -        * (Most swapins go through the swapcache. The notable
> >>>> -        * exception is the singleton fault on SWP_SYNCHRONOUS_IO
> >>>> -        * files, which reads into a private page and may free it if
> >>>> -        * the fault fails. We remain the primary owner of the entry=
.)
> >>>> -        */
> >>>> -       if (swapcache)
> >>>> -               entry =3D xa_erase(tree, offset);
> >>>> -       else
> >>>> -               entry =3D xa_load(tree, offset);
> >>>> -
> >>>> -       if (!entry)
> >>>> +       if (!zswap_present_test(folio->swap, nr_pages))
> >>>>                 return false;
> >>>
> >>> Hi Usama,
> >>>
> >>> Is there any chance that zswap_present_test() returns true
> >>> in do_swap_page() but false in zswap_load()? If that=E2=80=99s
> >>> possible, could we be missing something? For example,
> >>> could it be that zswap has been partially released (with
> >>> part of it still present) during an mTHP swap-in?
> >>>
> >>> If this happens with an mTHP, my understanding is that
> >>> we shouldn't proceed with reading corrupted data from the
> >>> disk backend.
> >>>
> >>
> >> If its not swapcache, the zswap entry is not deleted so I think
> >> it should be ok?
> >>
> >> We can check over here if the entire folio is in zswap,
> >> and if not, return true without marking the folio uptodate
> >> to give an error.
> >
> > We have swapcache_prepare() called in do_swap_page(), which should
> > have protected these entries from being partially freed by other proces=
ses
> > (for example, if someone falls back to small folios for the same addres=
s).
> > Therefore, I believe that zswap_present_test() cannot be false for mTHP=
 in
> > the current case where only synchronous I/O is supported.
> >
> > the below might help detect the bug?
> >
> > if (!zswap_present_test(folio->swap, nr_pages)) {
> >      if (WARN_ON_ONCE(nr_pages > 1))
> >                 return true;
> >      return false;
> > }
> >
>
> I think this isn't correct. If nr_pages > 1 and the entire folio is not i=
n zswap,
> it should still return false. So would need to check the whole folio if w=
e want to
> warn. But I think if we are sure the code is ok, it is an unnecessary che=
ck.

my point is that zswap_present_test() can't differentiate
1. the *whole* folio is not in zswap
2. the folio is *partially* not in zswap

in case 2, returning false is wrong.

And when nr_pages > 1, we have already confirmed earlier in
do_swap_page() that zswap_present_test() is true. At this point,
it must always be true; if it's false, it indicates a bug.

>
> > the code seems quite ugly :-) do we have some way to unify the code
> > for large and small folios?
> >
> > not quite sure about shmem though....
> >
>
> If its shmem, and the swap_count goes to 1, I think its still ok? because
> then the folio will be gotten from swap_cache_get_folio if it has already
> been in swapcache.
>
> >>
> >>
> >>>>
> >>>> -       zswap_decompress(entry, &folio->page);
> >>>> +       for (i =3D 0; i < nr_pages; ++i) {
> >>>> +               tree =3D swap_zswap_tree(swp_entry(type, offset + i)=
);
> >>>> +               /*
> >>>> +                * When reading into the swapcache, invalidate our e=
ntry. The
> >>>> +                * swapcache can be the authoritative owner of the p=
age and
> >>>> +                * its mappings, and the pressure that results from =
having two
> >>>> +                * in-memory copies outweighs any benefits of cachin=
g the
> >>>> +                * compression work.
> >>>> +                *
> >>>> +                * (Swapins with swap count > 1 go through the swapc=
ache.
> >>>> +                * For swap count =3D=3D 1, the swapcache is skipped=
 and we
> >>>> +                * remain the primary owner of the entry.)
> >>>> +                */
> >>>> +               if (swapcache)
> >>>> +                       entry =3D xa_erase(tree, offset + i);
> >>>> +               else
> >>>> +                       entry =3D xa_load(tree, offset + i);
> >>>>
> >>>> -       count_vm_event(ZSWPIN);
> >>>> -       if (entry->objcg)
> >>>> -               count_objcg_events(entry->objcg, ZSWPIN, 1);
> >>>> +               zswap_decompress(entry, folio_page(folio, i));
> >>>>
> >>>> -       if (swapcache) {
> >>>> -               zswap_entry_free(entry);
> >>>> -               folio_mark_dirty(folio);
> >>>> +               if (entry->objcg)
> >>>> +                       count_objcg_events(entry->objcg, ZSWPIN, 1);
> >>>> +               if (swapcache)
> >>>> +                       zswap_entry_free(entry);
> >>>>         }
> >>>>
> >>>> +       count_vm_events(ZSWPIN, nr_pages);
> >>>> +       if (swapcache)
> >>>> +               folio_mark_dirty(folio);
> >>>> +
> >>>>         folio_mark_uptodate(folio);
> >>>>         return true;
> >>>>  }
> >>>> --
> >>>> 2.43.5
> >>>>
> >>>
> >
> > Thanks
> > barry
>

