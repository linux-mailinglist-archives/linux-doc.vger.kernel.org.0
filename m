Return-Path: <linux-doc+bounces-28082-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA59A59EA
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 07:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57BBF281788
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 05:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF73433A0;
	Mon, 21 Oct 2024 05:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux0k+Ewq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9587C3398E;
	Mon, 21 Oct 2024 05:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729489783; cv=none; b=DSj9Hb4Sn6hkuXH4BGCfh472Hf0xBpcbLfZEhBypAD44AjPjbHyouVwBijeG2w7f7x8kE+BQK7grnGgT4jtptNtnbHfGO/FkLWaFydiGuOnBQrm3Rc9ahDuxIkYsadhb92pcQiB/bteDJX5AufB+uP9oOUbo5fql4HjbDAag2OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729489783; c=relaxed/simple;
	bh=KTR94EdhoOTqObKtMcJjWtFWf8t7y1RjNNVP2V/N7G4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcEcEEXS0XBm5NdxfFfyG8B3bJTwVa9ufBoS5Zy+f4nv0MFj4ZdVHfj+sr8QkJ6TxiTJstr1RFVztNQFyPUpMhXWzNipyod7A7n0pkuBBZ1aEvxRnBMArHEWXYuaKdQ3KUlnY/eaTrFOyd1rbAlD9GRWEhbLbmfHjhUt7uJbvHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux0k+Ewq; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4a46fee3b16so2070078137.0;
        Sun, 20 Oct 2024 22:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729489780; x=1730094580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC/Fzf5LVO7VqDQJv1Y+GNKYd72VoygUexXVUNcG2ec=;
        b=Ux0k+EwqIe2KRRg5PRNutow6xUOOF5yAZYlM5ai+6qBzPWnavkbODtqBYEJIRuVsPx
         AUbgwOagHSydnxz3ZCaUgiYkIM8LKGUel0fHSaH2OPWo5K/YDrGCKOijTVYdAA5ULbmE
         Jq+2I5p2eN6M+afeVDuraPxeioxHcIaslM9vpII3Y+yTtCejad1yTPa1DifPqUzWEaeW
         Jotegbo+0pOFlbpl8k0GKJL74cqV6wlnTdlJBvvRw6IcUs+J0MDJUNS0l9NiBsJUfVwd
         CWikLi+ORsYa82mxHKFpJthikUrmeGvBvW5QraQpgxHZ+7Ay7/7PfNdgTiEOU7xGviKU
         31hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729489780; x=1730094580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC/Fzf5LVO7VqDQJv1Y+GNKYd72VoygUexXVUNcG2ec=;
        b=OwhslP9aQpYERHLDjaIpu0CkH3tLC7Bpk9aF3AmTWXE8x7HZHXy9FPzOiA2bEHb1Fp
         6+uawmNargOXSVvwGMVOCHaQWTPATbFMB8qrOWvhpd6EX8x55yCv2tpSHL0QB6JgXKkr
         +2BwetTcAAB+IzIo+28jImXtpYt4QTOqoGUgNKjOrQuAp+NWPVWuVcxzH5MI+T8W952W
         83dMuia6AaGPJTrRdJssPKIBijTTTODnM6Agqr4FYCOmSvUpBYQXWu71M9ZPeWIMjibt
         mPDIu6GLl377cdLkRGnykiNrFui5sLAIRcBhCrzpgN7DSNVTM16tKu+nvNAoEY56Nq/U
         DCjw==
X-Forwarded-Encrypted: i=1; AJvYcCVSCO9ese4No0Eu5X3o+QKtBzk0f06g8/aeBdA1qexSAQsA9I4LsbVhsBHIdrdIMJeBcpMsPw1iHSA=@vger.kernel.org, AJvYcCXqbH+wFU2aJI3mMB8ySVBdu/HXhSHa81p8Y7ofKlaRcb3PRcXA++VqD3EDMEwooMcsUx/uUYxmD5yUntEY@vger.kernel.org
X-Gm-Message-State: AOJu0YxXsYV631tfxboKRQy44vsiDRKtJ1K4FmFBX99I9l5orv6iPaWe
	7nGkkaWGLKvjgZ15JqL/h++ELWa7irmrx9I97c4zBE6mpPPHdwSBTasJt0GftK4+Y7AB0yEbt3Y
	28czEQfzVF+ZNeNtaQ5yATlM7XfI=
X-Google-Smtp-Source: AGHT+IFlaokaNpDuvWcjTGk5CV57Ho/WnAS8Kxyp+RDruZDlLzBfk2EJEa310elv3KNL64aNswgkXzxiSRd8dfOKuio=
X-Received: by 2002:a05:6102:4b8b:b0:4a5:b1f5:ba93 with SMTP id
 ada2fe7eead31-4a5c491efe1mr9357011137.6.1729489780332; Sun, 20 Oct 2024
 22:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018105026.2521366-1-usamaarif642@gmail.com> <20241018105026.2521366-4-usamaarif642@gmail.com>
In-Reply-To: <20241018105026.2521366-4-usamaarif642@gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 21 Oct 2024 18:49:29 +1300
Message-ID: <CAGsJ_4xyDMUDxVhi0bzZJ4jAd_Hw8Hn25+4epO9u9=iu0QMdoA@mail.gmail.com>
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

On Fri, Oct 18, 2024 at 11:50=E2=80=AFPM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
> At time of folio allocation, alloc_swap_folio checks if the entire
> folio is in zswap to determine folio order.
> During swap_read_folio, zswap_load will check if the entire folio
> is in zswap, and if it is, it will iterate through the pages in
> folio and decompress them.
> This will mean the benefits of large folios (fewer page faults, batched
> PTE and rmap manipulation, reduced lru list, TLB coalescing (for arm64
> and amd) are not lost at swap out when using zswap.
> This patch does not add support for hybrid backends (i.e. folios
> partly present swap and zswap).
>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>  mm/memory.c | 13 +++-------
>  mm/zswap.c  | 68 ++++++++++++++++++++++++-----------------------------
>  2 files changed, 34 insertions(+), 47 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 49d243131169..75f7b9f5fb32 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4077,13 +4077,14 @@ static bool can_swapin_thp(struct vm_fault *vmf, =
pte_t *ptep, int nr_pages)
>
>         /*
>          * swap_read_folio() can't handle the case a large folio is hybri=
dly
> -        * from different backends. And they are likely corner cases. Sim=
ilar
> -        * things might be added once zswap support large folios.
> +        * from different backends. And they are likely corner cases.
>          */
>         if (unlikely(swap_zeromap_batch(entry, nr_pages, NULL) !=3D nr_pa=
ges))
>                 return false;
>         if (unlikely(non_swapcache_batch(entry, nr_pages) !=3D nr_pages))
>                 return false;
> +       if (unlikely(!zswap_present_test(entry, nr_pages)))
> +               return false;
>
>         return true;
>  }
> @@ -4130,14 +4131,6 @@ static struct folio *alloc_swap_folio(struct vm_fa=
ult *vmf)
>         if (unlikely(userfaultfd_armed(vma)))
>                 goto fallback;
>
> -       /*
> -        * A large swapped out folio could be partially or fully in zswap=
. We
> -        * lack handling for such cases, so fallback to swapping in order=
-0
> -        * folio.
> -        */
> -       if (!zswap_never_enabled())
> -               goto fallback;
> -
>         entry =3D pte_to_swp_entry(vmf->orig_pte);
>         /*
>          * Get a list of all the (large) orders below PMD_ORDER that are =
enabled
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 9cc91ae31116..a5aa86c24060 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1624,59 +1624,53 @@ bool zswap_present_test(swp_entry_t swp, int nr_p=
ages)
>
>  bool zswap_load(struct folio *folio)
>  {
> +       int nr_pages =3D folio_nr_pages(folio);
>         swp_entry_t swp =3D folio->swap;
> +       unsigned int type =3D swp_type(swp);
>         pgoff_t offset =3D swp_offset(swp);
>         bool swapcache =3D folio_test_swapcache(folio);
> -       struct xarray *tree =3D swap_zswap_tree(swp);
> +       struct xarray *tree;
>         struct zswap_entry *entry;
> +       int i;
>
>         VM_WARN_ON_ONCE(!folio_test_locked(folio));
>
>         if (zswap_never_enabled())
>                 return false;
>
> -       /*
> -        * Large folios should not be swapped in while zswap is being use=
d, as
> -        * they are not properly handled. Zswap does not properly load la=
rge
> -        * folios, and a large folio may only be partially in zswap.
> -        *
> -        * Return true without marking the folio uptodate so that an IO e=
rror is
> -        * emitted (e.g. do_swap_page() will sigbus).
> -        */
> -       if (WARN_ON_ONCE(folio_test_large(folio)))
> -               return true;
> -
> -       /*
> -        * When reading into the swapcache, invalidate our entry. The
> -        * swapcache can be the authoritative owner of the page and
> -        * its mappings, and the pressure that results from having two
> -        * in-memory copies outweighs any benefits of caching the
> -        * compression work.
> -        *
> -        * (Most swapins go through the swapcache. The notable
> -        * exception is the singleton fault on SWP_SYNCHRONOUS_IO
> -        * files, which reads into a private page and may free it if
> -        * the fault fails. We remain the primary owner of the entry.)
> -        */
> -       if (swapcache)
> -               entry =3D xa_erase(tree, offset);
> -       else
> -               entry =3D xa_load(tree, offset);
> -
> -       if (!entry)
> +       if (!zswap_present_test(folio->swap, nr_pages))
>                 return false;

Hi Usama,

Is there any chance that zswap_present_test() returns true
in do_swap_page() but false in zswap_load()? If that=E2=80=99s
possible, could we be missing something? For example,
could it be that zswap has been partially released (with
part of it still present) during an mTHP swap-in?

If this happens with an mTHP, my understanding is that
we shouldn't proceed with reading corrupted data from the
disk backend.

>
> -       zswap_decompress(entry, &folio->page);
> +       for (i =3D 0; i < nr_pages; ++i) {
> +               tree =3D swap_zswap_tree(swp_entry(type, offset + i));
> +               /*
> +                * When reading into the swapcache, invalidate our entry.=
 The
> +                * swapcache can be the authoritative owner of the page a=
nd
> +                * its mappings, and the pressure that results from havin=
g two
> +                * in-memory copies outweighs any benefits of caching the
> +                * compression work.
> +                *
> +                * (Swapins with swap count > 1 go through the swapcache.
> +                * For swap count =3D=3D 1, the swapcache is skipped and =
we
> +                * remain the primary owner of the entry.)
> +                */
> +               if (swapcache)
> +                       entry =3D xa_erase(tree, offset + i);
> +               else
> +                       entry =3D xa_load(tree, offset + i);
>
> -       count_vm_event(ZSWPIN);
> -       if (entry->objcg)
> -               count_objcg_events(entry->objcg, ZSWPIN, 1);
> +               zswap_decompress(entry, folio_page(folio, i));
>
> -       if (swapcache) {
> -               zswap_entry_free(entry);
> -               folio_mark_dirty(folio);
> +               if (entry->objcg)
> +                       count_objcg_events(entry->objcg, ZSWPIN, 1);
> +               if (swapcache)
> +                       zswap_entry_free(entry);
>         }
>
> +       count_vm_events(ZSWPIN, nr_pages);
> +       if (swapcache)
> +               folio_mark_dirty(folio);
> +
>         folio_mark_uptodate(folio);
>         return true;
>  }
> --
> 2.43.5
>

Thanks
barry

