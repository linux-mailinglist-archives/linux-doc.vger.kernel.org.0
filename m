Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF8F45AA4EF
	for <lists+linux-doc@lfdr.de>; Fri,  2 Sep 2022 03:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235083AbiIBBSG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 1 Sep 2022 21:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234867AbiIBBSF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 21:18:05 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCDEA3D5C
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 18:18:04 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id j6so698125vsr.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Sep 2022 18:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=rTzDP//vpfHx0nVWxJbV0HFrI6D0C5HQYNSPKTmQmqc=;
        b=UWgThLj5qQy1WVf4h5Ch3hkbBGqp3/CtfM0uY0BEiBrEmfKmoOMhR9TKodXHXQ8UZI
         Nps5eH9fwSuxS1+/Kpa/4rK/MRM5r5tRDduhRCq8fKqe8yv0MTE5YWK6lJZr7U3Jolcb
         8ZeQtzQywmft38Mjk6K0YLw6peWxrRLhr7EWznpYO3b4hO0iexzPpulNjFSfTQZxKspw
         XpfMEuCDg7sCgaYl9UdRJUa36ssv+biiXphvOPD6fo0JdXpQUVd4pLJ0Y4/SyNJhRTHC
         j9MbKYChOijhjoCVpKNC/fLAUPWifHdbz2EqRZrbosyYkPYxfMGuUMyUiKg+WkmZWK4Y
         tBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rTzDP//vpfHx0nVWxJbV0HFrI6D0C5HQYNSPKTmQmqc=;
        b=tThzOy0v6QQdZDC5S3mssDZ1ncwfXzF5Wnr7biREZzi7w8zMT0XSaPs/ivtH/Pxfvn
         /In7ZWs0zVgJ7RAHiv1SZLDpuFBYZSwyjR+r0GwqRmW1izg42VW9P/w6WBmXBF8+cNq+
         +KEHeUVCBYj6aX0kfNsd/mCkxy0iUbRPQ/n+TWnyIkl1OrmhugmSTDk+N8rDEjEOq+R8
         MxwtjFI+/O+9NnIJ0Gvfswc9SOHxhEMNiufFoGq85Oj0Wgk6eNlv0v153xrMVOi54wr2
         FVOnDJcrbryVsfJizTj2y8TQaWLdDSdsPtGZPJ01iRcrmXLHLLeMOiwCNeKeOFb/fSxA
         /sYw==
X-Gm-Message-State: ACgBeo3VufqZPAFqm4xU036/ynz7cVGQwJsxKd+Kvl2lqxqjuAO2ZVWT
        DI+IeSISQl58BFHmyrgyJAh3DPwt5MDtVlbz9LkB8g==
X-Google-Smtp-Source: AA6agR7Tip6gCheFWRsDQxtd28hkc6ZUgXtTAsFe4eAmn5ExZQLdjvj3BoPN4Q/OdMBoJts2UxkQZmxs+NLu6F9s1wI=
X-Received: by 2002:a67:d512:0:b0:390:db32:a96 with SMTP id
 l18-20020a67d512000000b00390db320a96mr8270856vsj.15.1662081482992; Thu, 01
 Sep 2022 18:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com> <20220815071332.627393-8-yuzhao@google.com>
 <0F7CF2A7-F671-4196-B8FD-F35E9556391B@gmail.com>
In-Reply-To: <0F7CF2A7-F671-4196-B8FD-F35E9556391B@gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Thu, 1 Sep 2022 19:17:26 -0600
Message-ID: <CAOUHufZ6LGyBoPBkniB63-77r5=1POWpEWmUTESFtJo2bwbi-w@mail.gmail.com>
Subject: Re: [PATCH v14 07/14] mm: multi-gen LRU: exploit locality in rmap
To:     Nadav Amit <nadav.amit@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>, X86 ML <x86@kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        Barry Song <baohua@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 1, 2022 at 3:18 AM Nadav Amit <nadav.amit@gmail.com> wrote:
>
>
>
> > On Aug 15, 2022, at 12:13 AM, Yu Zhao <yuzhao@google.com> wrote:
> >
> > Searching the rmap for PTEs mapping each page on an LRU list (to test
> > and clear the accessed bit) can be expensive because pages from
> > different VMAs (PA space) are not cache friendly to the rmap (VA
> > space). For workloads mostly using mapped pages, searching the rmap
> > can incur the highest CPU cost in the reclaim path.
>
> Impressive work. Sorry if my feedback is not timely.
>
> Just one minor point for thought, that can be left for a later cleanup.
>
> >
> > +     for (i =3D 0, addr =3D start; addr !=3D end; i++, addr +=3D PAGE_=
SIZE) {
> > +             unsigned long pfn;
> > +
> > +             pfn =3D get_pte_pfn(pte[i], pvmw->vma, addr);
> > +             if (pfn =3D=3D -1)
> > +                     continue;
> > +
> > +             if (!pte_young(pte[i]))
> > +                     continue;
> > +
> > +             folio =3D get_pfn_folio(pfn, memcg, pgdat);
> > +             if (!folio)
> > +                     continue;
> > +
> > +             if (!ptep_test_and_clear_young(pvmw->vma, addr, pte + i))
> > +                     continue;
> > +
>
> You have already checked that the PTE is old (not young) so this check
> seems redundant.

You are right, for x86, which belongs to category 1: hardware and
OS share the same paging data structure.

> I do not see a way in which the access-bit can be cleared
> since you hold the ptl.

There is also category 2: the OS paging data structure is a shadow of what
hardware actually uses, e.g., POWER9 radix.

To make both categories work, the general rule is that the OS paging
data structure must be more strict, i.e., it can have A/D bits set
while the hardware paging data structure may not. The opposite is not
allowed, even for the A bit, because the A bit can also be used to
determine whether a TLB flush is required. The Linux kernel doesn't do
this but there are other OSes that do.

For prefaulted PTEs, we generally mark them young unless
arch_wants_old_prefaulted_pte() returns true (currently only ARMv8.2+
do). On POWER9, we'd see those PTEs pass the first check but fail the
second.

> IOW, there is no need for the =E2=80=9Cif" and =E2=80=9Ccontinue".
>
> Makes me also wonder whether having a separate ptep_clear_young() can
> slightly help, since anyhow the access-bit is more of an estimation,
> and having a separate ptep_clear_young() can enable optimizations.
>
> On x86, for instance, if the PTE is dirty, we may be able to clear the
> access-bit without an atomic operation, which should be faster.

Agreed.
