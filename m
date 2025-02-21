Return-Path: <linux-doc+bounces-38963-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9895FA3FD20
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 18:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A4547AA87D
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 17:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F2324C674;
	Fri, 21 Feb 2025 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZWCwY+GT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F82724C697
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157857; cv=none; b=tA+byqrJ1HgFFqSruw1pMhVgmpbEFJiIoAr0wNlDP3LKdfrx7OxccEk0AqtIeQcdlp38wMmAVf/ned79aE5JumDr0kHzLRfBXquxQcLYnRaHV+gEMRPPzXtYPbEgGAnc/m/8IsUc8clg0afTJ52mbFRyWy1Oz7bJ0KJFRhUGkFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157857; c=relaxed/simple;
	bh=zLivjvSwcKhzlo3svCNKQUA1a6rIcuwqxFgzLbvteDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=miKDELnxUg/n0n43UObFXhRR/QNxKauB8vu0rwbVXkIkigOC5Ykw5Yg/LzbOjsn4Aqg1JyhpfqL6H4idvAFR/ymBeFl41HzkRf5b5yLw3NLnDYVLtUxYCBAOt+fqbx32jP6ZXX4XnQRuAspCRw1XoCD9eXpgbkeXfuZ8qZNRvZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZWCwY+GT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22117c396baso183275ad.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 09:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740157854; x=1740762654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/06cutobvSL148SHg+rXF1/EKMBeC15diJi2NLvYxY=;
        b=ZWCwY+GTFO1iI+FQVPsHIwyBpRTmBQ7AxQKENZYhr1JVm/AArUyEyHaZatbtEJ4ZJk
         XaGGpLFyLhmmClseqZACnUYcxfghU/pK4dxF96CuHC7xVNQF5rBmM6hKmIJe+f0uYh0z
         VG8kiDRAiYyikaVcQpYy4OwWw4JoescXotRxPKgdqdb8rO6wcyF9IhiiW8Uer2iFripx
         aR6a+rRCu33U7ThjgnX6ri1cMtgiW4qDoLwcigOe9X58ywAq+XUfyvyBeLHEzYVr0EeB
         iwV3SIBdjEobm53uMmoG188zeGM5U0585Rrfm5qOQbcwz0Sj9VBDAde5c5CkJ++dy7sT
         +1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740157854; x=1740762654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/06cutobvSL148SHg+rXF1/EKMBeC15diJi2NLvYxY=;
        b=Xe5Q2qMYddHxvVwKRijvdy7zutFi8xYEq3X0FrzjhOIeJ3uk8KJJ8DXFjJa1xzLRmT
         1/6kp2rXsas8WG+GmY/ACepupOKG3zN/6YPS/0FKo1AlJxO/4i0s2n2oTr+I7NlTV/6f
         ofDk3VCHgjvnn79gSBAbP3wwWb1g63uvrh4vEdVtuCXdJCIhkQrv4r2D3cHra4KaKva6
         jJd5zxYihGsG9nryCKO3V7G8LA65ZgIp4NnqRJHOdRQUtjXWjEtIbQINscx4VsiiCQp3
         DDafQ6QaVP/QOG1cFIaQb5UYOYpNTaDktCoMRa2b80rTtvS9mw/O+2tWMC5B38RFqzJj
         lC+g==
X-Forwarded-Encrypted: i=1; AJvYcCXthzQtu8tuyLiFmpDnblNFMMpClFaOxEJcPPleojhgptBlR0FuyLCKcE1ManHLtjSsHvsTMnW4bXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiXI3o+X5lRDc9kqWzKEGh304wsSVHw2RYz1p0+McGlV+gavpJ
	m283KBuwGg6riDKCl2AQyIdduKNmR5oJ6s8wGXODutRCU4SoS1Ot1pLpu0zrfwUjIV+Y4et2SOO
	+AXLicX/rY5ydTUsIKoF/64mT/4Qa00kGFuHF2y+gtcckXi5ibRMr
X-Gm-Gg: ASbGncsnRhckEqATz01HayrbftVQ4kj2AOtv1W+soPJIijbll6fb+MK25Iy3OBCCxWR
	edE8DHuN8qmbw1TnzUKBA4j48B8QF/dlBxz/U935nXDiBBp5du4b7Wv9IBgWe5XClC8NVETVbaO
	44j+c5samfkRSfWV/xXGgp46H8OBS9TjIINqt3Qfm+
X-Google-Smtp-Source: AGHT+IGldTX8YPxNiHq5GCgGriPX+2NeZhhwxRgXaqAzM2MGUPniBZmpaA4CLGFWvvlR3adETlTMpcRMFGLlc6gV27Q=
X-Received: by 2002:a17:902:e5c6:b0:215:8723:42d1 with SMTP id
 d9443c01a7336-221a0417e96mr2978475ad.10.1740157854187; Fri, 21 Feb 2025
 09:10:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740139449.git.lorenzo.stoakes@oracle.com> <521d99c08b975fb06a1e7201e971cc24d68196d1.1740139449.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <521d99c08b975fb06a1e7201e971cc24d68196d1.1740139449.git.lorenzo.stoakes@oracle.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 21 Feb 2025 09:10:42 -0800
X-Gm-Features: AWEUYZnbM5nA9kkqZnhzwGTEHPz7kvvIuks0mem2iJOt7iRv8etO859ySZMIHY4
Message-ID: <CAC_TJvf-R6MuSS9e0b4orhxLrFwXTnvZV-vf3sB+BnSbEqsprw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fs/proc/task_mmu: add guard region bit to pagemap
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>, Juan Yescas <jyescas@google.com>, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 4:05=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Currently there is no means by which users can determine whether a given
> page in memory is in fact a guard region, that is having had the
> MADV_GUARD_INSTALL madvise() flag applied to it.
>
> This is intentional, as to provide this information in VMA metadata would
> contradict the intent of the feature (providing a means to change fault
> behaviour at a page table level rather than a VMA level), and would requi=
re
> VMA metadata operations to scan page tables, which is unacceptable.
>
> In many cases, users have no need to reflect and determine what regions
> have been designated guard regions, as it is the user who has established
> them in the first place.
>
> But in some instances, such as monitoring software, or software that reli=
es
> upon being able to ascertain the nature of mappings within a remote proce=
ss
> for instance, it becomes useful to be able to determine which pages have
> the guard region marker applied.
>
> This patch makes use of an unused pagemap bit (58) to provide this
> information.
>
> This patch updates the documentation at the same time as making the chang=
e
> such that the implementation of the feature and the documentation of it a=
re
> tied together.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  Documentation/admin-guide/mm/pagemap.rst | 3 ++-
>  fs/proc/task_mmu.c                       | 6 +++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/adm=
in-guide/mm/pagemap.rst
> index caba0f52dd36..a297e824f990 100644
> --- a/Documentation/admin-guide/mm/pagemap.rst
> +++ b/Documentation/admin-guide/mm/pagemap.rst
> @@ -21,7 +21,8 @@ There are four components to pagemap:
>      * Bit  56    page exclusively mapped (since 4.2)
>      * Bit  57    pte is uffd-wp write-protected (since 5.13) (see
>        Documentation/admin-guide/mm/userfaultfd.rst)
> -    * Bits 58-60 zero
> +    * Bit  58    pte is a guard region (since 6.15) (see madvise (2) man=
 page)

Should this be 6.14 ?

Other than that: Reviewed-by: Kalesh Singh <kaleshsingh@google.com>

Thanks,
Kalesh

> +    * Bits 59-60 zero
>      * Bit  61    page is file-page or shared-anon (since 3.5)
>      * Bit  62    page swapped
>      * Bit  63    page present
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index f02cd362309a..c17615e21a5d 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1632,6 +1632,7 @@ struct pagemapread {
>  #define PM_SOFT_DIRTY          BIT_ULL(55)
>  #define PM_MMAP_EXCLUSIVE      BIT_ULL(56)
>  #define PM_UFFD_WP             BIT_ULL(57)
> +#define PM_GUARD_REGION                BIT_ULL(58)
>  #define PM_FILE                        BIT_ULL(61)
>  #define PM_SWAP                        BIT_ULL(62)
>  #define PM_PRESENT             BIT_ULL(63)
> @@ -1732,6 +1733,8 @@ static pagemap_entry_t pte_to_pagemap_entry(struct =
pagemapread *pm,
>                         page =3D pfn_swap_entry_to_page(entry);
>                 if (pte_marker_entry_uffd_wp(entry))
>                         flags |=3D PM_UFFD_WP;
> +               if (is_guard_swp_entry(entry))
> +                       flags |=3D  PM_GUARD_REGION;
>         }
>
>         if (page) {
> @@ -1931,7 +1934,8 @@ static const struct mm_walk_ops pagemap_ops =3D {
>   * Bit  55    pte is soft-dirty (see Documentation/admin-guide/mm/soft-d=
irty.rst)
>   * Bit  56    page exclusively mapped
>   * Bit  57    pte is uffd-wp write-protected
> - * Bits 58-60 zero
> + * Bit  58    pte is a guard region
> + * Bits 59-60 zero
>   * Bit  61    page is file-page or shared-anon
>   * Bit  62    page swapped
>   * Bit  63    page present
> --
> 2.48.1
>

