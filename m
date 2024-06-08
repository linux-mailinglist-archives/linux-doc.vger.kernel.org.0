Return-Path: <linux-doc+bounces-18009-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B357900DFD
	for <lists+linux-doc@lfdr.de>; Sat,  8 Jun 2024 00:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 091131F22413
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 22:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08034154C12;
	Fri,  7 Jun 2024 22:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vl2mqN1W"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E46646558
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 22:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717798978; cv=none; b=LvjtZJCQ5ppgXpKD+ORuMmFHNCbW035yjFZwu9kAHUVsUN47xjo0IckIwxsNtODZcxfeiWgyVeboATbg2AjhxMlj2H1Va1xwFU9vwT9UQjcP+Zn3VRVsHHXjFwil8MqtS6Sn3hSlPKqq9a83LptL68oNGT/c4/lWZREaKKbTP/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717798978; c=relaxed/simple;
	bh=2wVKyHK/feYQNkz0G4iPw4NNrwt/KNptq1W5FU2aHxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=slXpCu4aZRmw2A3fiFhHjxUg++Q1s3CJO+hbkmSpKOZTcN49oK1Z2ViI1G4BQbA8DgU4U65kTrju9fV0RbacV5JPm/d6sW62Nsh4/Vwza3ZkqBh9wKCtAIoHASGLGFhFbTdalkA9k850mwFTrk71E/viZNJmL82szY9NamyVrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vl2mqN1W; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42163fa630aso15493705e9.3
        for <linux-doc@vger.kernel.org>; Fri, 07 Jun 2024 15:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717798975; x=1718403775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouTQPU5YyVEsaf9+24FgrOmjgrgA/NCQDAtyFoUqx6w=;
        b=vl2mqN1WEFMQFkM6HF36ACaL9yb7YBvZKLSLlu8oAlikVDYN8OuPrYD8rgolglS58r
         i+cKjvtxqHGg4nB5m5SpQMQIbtwLkrpWQgqjMYwBvUzw5ui9bymqy4rAIrckjfDj3qV1
         HvnszElNz2vMNfYJEJHKlTjxgw8z/XfwGevDNb30Uvxd3gBakGF7mgjiL77PEh55SwnQ
         2lmhvVqsrPyvTlV+QCXrfbGizVNdDKlJNLz7R7x3MJV4h/GWKeaSfbwDGVTIHdG4nE+G
         bYNcROA+jXiYrA4PC5Cp3d6NIrDRdH7dtRpHJ4elyZis0yhLwl34cbiSR176gtZbuda7
         lZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717798975; x=1718403775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouTQPU5YyVEsaf9+24FgrOmjgrgA/NCQDAtyFoUqx6w=;
        b=ZdcaEXyU8oDiECoPB7NmkzBhZKQu2qBuZqVBNVslhUjVqb7rk2uYYtaVDgc1RDXOLh
         M2e0YcLh6eILjcQwYnX+VBsN4Arq2i0OCbGcgkbtF9ujfI2mCCkGN6sWex+Jrla/MsUB
         tQ0bZLy74BC172ixdSnn3pV6PavzKz2TfzEWU8xUu8UnuK8ymg8rWh9Q8T8EwE95yPAB
         XpFWR3aDySwNEl3tSL015Wdc6CbVfdKidiwhGbVd3SMMwZD9DZYJGLM0x/cbeeKb1cNF
         +lHRZWVwqCYqZOqtDymfpPnRfqlq/YgzUR3M+XBsw0UlG+M7p12SjkD1m6ZddFNqRVZ+
         7LDg==
X-Forwarded-Encrypted: i=1; AJvYcCWzgCqOzMqbr8EF1h8HdUP21WBKFydd7+6/V55tFnnRM/wZQ+NSwEP5cRtUTLD7/j4M2zjShaUDLvmeXor+bjcnSPQlH0hOnjno
X-Gm-Message-State: AOJu0YwoCeUfZv1wwrxaD2uBiNieeZuYMfhPy2ANPbJgCO3DY/4qVwKG
	VR+L5QSDptHVcTno4JDyj1QmPySauRmM2m9czFem00UncDsGH3dDXbCbdTGrZetKYKZTciw0Ty4
	eDlQXCrh5mhe5bVF9edBMfMdFwCiBqLPQ01aH
X-Google-Smtp-Source: AGHT+IFPN9H9WFajQMarkR9dF71kl+7xMtyZUOalUgT1A2vw8tRER0AD6uQpeQtDgn3zXVOr+fDaQAS4f/qC9XF5hOE=
X-Received: by 2002:adf:e543:0:b0:35e:51cf:690d with SMTP id
 ffacd0b85a97d-35efea823afmr2588117f8f.0.1717798975238; Fri, 07 Jun 2024
 15:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531213439.2958891-1-jiaqiyan@google.com> <21841726-6427-5a92-a3d1-8aac2687c01a@huawei.com>
In-Reply-To: <21841726-6427-5a92-a3d1-8aac2687c01a@huawei.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 7 Jun 2024 15:22:43 -0700
Message-ID: <CACw3F52Ws2R-7kBbo29==tU=FOV=8aiWFZH2aL2DS_5nuTGO=w@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Userspace controls soft-offline HugeTLB pages
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: naoya.horiguchi@nec.com, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, muchun.song@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 12:19=E2=80=AFAM Miaohe Lin <linmiaohe@huawei.com> w=
rote:
>
> On 2024/6/1 5:34, Jiaqi Yan wrote:
> > Correctable memory errors are very common on servers with large
> > amount of memory, and are corrected by ECC, but with two
> > pain points to users:
> > 1. Correction usually happens on the fly and adds latency overhead
> > 2. Not-fully-proved theory states excessive correctable memory
> >    errors can develop into uncorrectable memory error.
>
> Thanks for your patch.

Thanks Miaohe, sorry I missed your message (Gmail mistakenly put it in
my spam folder).

>
> >
> > Soft offline is kernel's additional solution for memory pages
> > having (excessive) corrected memory errors. Impacted page is migrated
> > to healthy page if it is in use, then the original page is discarded
> > for any future use.
> >
> > The actual policy on whether (and when) to soft offline should be
> > maintained by userspace, especially in case of HugeTLB hugepages.
> > Soft-offline dissolves a hugepage, either in-use or free, into
> > chunks of 4K pages, reducing HugeTLB pool capacity by 1 hugepage.
> > If userspace has not acknowledged such behavior, it may be surprised
> > when later mmap hugepages MAP_FAILED due to lack of hugepages.
>
> For in use hugetlb folio case, migrate_pages() is called. The hugetlb poo=
l
> capacity won't be modified in that case. So I assume you're referring to =
the

I don't think so.

For in-use hugetlb folio case, after migrate_pages, kernel will
dissolve_free_hugetlb_folio the src hugetlb folio. At this point
refcount of src hugetlb folio should be zero already, and
remove_hugetlb_folio will reduce the hugetlb pool capacity (both
nr_hugepages and free_hugepages) accordingly.

For the free hugetlb folio case, dissolving also happens. But CE on
free pages should be very rare (since no one is accessing except
patrol scrubber).

One of my test cases in patch 2/3 validates my point: the test case
MADV_SOFT_OFFLINE a mapped page and at the point soft offline
succeeds, both nr_hugepages and nr_freepages are reduced by 1.

> free hugetlb folio case? The Hugetlb pool capacity is reduced in that cas=
e.
> But if we don't do that, we might encounter uncorrectable memory error la=
ter

If your concern is more correctable error will develop into more
severe uncorrectable, your concern is absolutely valid. There is a
tradeoff between reliability vs performance (availability of hugetlb
pages), but IMO should be decided by userspace.

> which will be more severe? Will it be better to add a way to compensate t=
he
> capacity?

Corner cases: What if finding physically contiguous memory takes too
long? What if we can't find any physically contiguous memory to
compensate? (then hugetlb pool will still need to be reduced).

If we treat "compensate" as an improvement to the overall soft offline
process, it is something we can do in future and it is something
orthogonal to this control API, right? I think if userspace explicitly
tells kernel to soft offline, then they are also well-prepared for the
corner cases above.

>
> > In addition, discarding the entire 1G memory page only because of
> > corrected memory errors sounds very costly and kernel better not
> > doing under the hood. But today there are at least 2 such cases:
> > 1. GHES driver sees both GHES_SEV_CORRECTED and
> >    CPER_SEC_ERROR_THRESHOLD_EXCEEDED after parsing CPER.
> > 2. RAS Correctable Errors Collector counts correctable errors per
> >    PFN and when the counter for a PFN reaches threshold
> > In both cases, userspace has no control of the soft offline performed
> > by kernel's memory failure recovery.
>
> Userspace can figure out the hugetlb folio pfn range by using `page-types=
 -b huge
> -rlN` and then decide whether to soft offline the page according to it. B=
ut for
> GHES driver, I think it has to be done in the kernel. So add a control in=
 /sys/
> seems like a good idea.

Thanks.

>
> >
> > This patch series give userspace the control of soft-offlining
> > HugeTLB pages: kernel only soft offlines hugepage if userspace has
> > opt-ed in for that specific hugepage size, and exposed to userspace
> > by a new sysfs entry called softoffline_corrected_errors under
> > /sys/kernel/mm/hugepages/hugepages-${size}kB directory:
> > * When softoffline_corrected_errors=3D0, skip soft offlining for all
> >   hugepages of size ${size}kB.
> > * When softoffline_corrected_errors=3D1, soft offline as before this
>
> Will it be better to be called as "soft_offline_corrected_errors" or simp=
lify "soft_offline_enabled"?

"soft_offline_enabled" is less optimal as it can't be extended to
support something like "soft offline this PFN if something repeatedly
requested soft offline this exact PFN x times". (although I don't
think we need it).

softoffline_corrected_errors is one char less, but if you insist,
soft_offline_corrected_errors also works for me.

>
> Thanks.
> .
>

