Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C26E951103A
	for <lists+linux-doc@lfdr.de>; Wed, 27 Apr 2022 06:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357709AbiD0EmF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Apr 2022 00:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346280AbiD0EmD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Apr 2022 00:42:03 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C62237DF
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 21:38:54 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id u19so195109uaw.11
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 21:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QyA2j5YWnnHSq+E6+k1LtPGM4F7JMOWL5Umjq8NWOZU=;
        b=fJc1sFC+KaEbDT52YAwBOcpuBPFqYTsvvtUsoq/i8rRcDE/JHxlrqr4Fms+bdBSaI/
         3Ea+dZvOJqA9OAGAumAOisSeRiDefSIesuv7K+gQDq7pY2YqqM/59ZX9chmp2P02guy1
         jcDY4GzIA7XoOKJhytnJfcln7/O3AYV9OBB2bK+3usiOCeldS3yQjA6nsFpsr3Wvh1tS
         ZS7J34aWeCYbZ0QMWawmeS23YjLJqVtt2nloqwAlOmiCkMUSOoi9UOtyOPnuJXG14YJe
         cI3JnQaGwz+tX8rwsd2jTGNB/cjxMlzFpxc9DT5qNVHXrZefdnV4kl/4eh5jKcFM3PfG
         fe0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QyA2j5YWnnHSq+E6+k1LtPGM4F7JMOWL5Umjq8NWOZU=;
        b=CVNyu/SD0if251Ev0c3715NJZwbatKKClEk3/rwLfGUqMD9kqdoqz4pB1P3/+r0KNb
         CL1iqJIaOGpLWpt4KS7eQxamDudTXv9lWBhHV491iLJNpLPYa+V+1nt1d0yx+zT9Lybi
         BugexpW+Ws4UL8thYMxA2iSaowtVFznczb4hRgTdzrDynajf29tghaDaqaoibSTwyXMB
         usW3SkGF7uwcFOzrYO8JmWH5D8HiDVQHdWboA53GUFYZW/1lB82HCc/z/Me1zBaD9hO5
         IxmURvckv1KrPt5ccdBiYJXBF+dl/Pmq0BumB/kH5mHv0Y5D6CD7E2OuQush5bcW0Ih2
         b60Q==
X-Gm-Message-State: AOAM533a7Je6WsZkAWRluVMrVgo8bH2ujiW0E7aa5qgP8iyVbrAb5h90
        GWt0GmFnZC6rta/kP5LZItiObcqCV9csSuhrM4EDJQ==
X-Google-Smtp-Source: ABdhPJxHD3BYt5S/qVBOCInQm78QAkxFOSpFhr9I5suJsqS9ztd+4m9D0NbzkMWLJIkB+jHL9jCTsXEpCJALSL1q70c=
X-Received: by 2002:ab0:2695:0:b0:352:5fc9:4132 with SMTP id
 t21-20020ab02695000000b003525fc94132mr8054004uao.29.1651034333089; Tue, 26
 Apr 2022 21:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-8-yuzhao@google.com>
 <87zgk7xi13.fsf@linux.ibm.com>
In-Reply-To: <87zgk7xi13.fsf@linux.ibm.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 26 Apr 2022 22:38:17 -0600
Message-ID: <CAOUHufbRLUg8274At8ZkUMUz2ghuGs52AvJsMkjQR=6-pusEhw@mail.gmail.com>
Subject: Re: [PATCH v10 07/14] mm: multi-gen LRU: exploit locality in rmap
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
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
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 26, 2022 at 10:33 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Yu Zhao <yuzhao@google.com> writes:
>
> ....
>
>  diff --git a/mm/rmap.c b/mm/rmap.c
> > index fedb82371efe..7cb7ef29088a 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -73,6 +73,7 @@
> >  #include <linux/page_idle.h>
> >  #include <linux/memremap.h>
> >  #include <linux/userfaultfd_k.h>
> > +#include <linux/mm_inline.h>
> >
> >  #include <asm/tlbflush.h>
> >
> > @@ -821,6 +822,12 @@ static bool folio_referenced_one(struct folio *folio,
> >               }
> >
> >               if (pvmw.pte) {
> > +                     if (lru_gen_enabled() && pte_young(*pvmw.pte) &&
> > +                         !(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ))) {
> > +                             lru_gen_look_around(&pvmw);
> > +                             referenced++;
> > +                     }
>
> Is it required to update referenced here? we do that below after
> clearing the young bit. Or is the goal to identify whether we found any
> young pte around?

referenced++ is needed because lru_gen_look_around() also clears the
young bit in pvmw.pte. And ptep_clear_flush_young_notify() will return
false unless mmu notifier returns true.

> > +
> >                       if (ptep_clear_flush_young_notify(vma, address,
> >                                               pvmw.pte)) {
> >                               /*
