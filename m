Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EFA2E2296
	for <lists+linux-doc@lfdr.de>; Wed, 23 Dec 2020 23:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgLWWyz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Dec 2020 17:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgLWWyz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Dec 2020 17:54:55 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13397C06179C
        for <linux-doc@vger.kernel.org>; Wed, 23 Dec 2020 14:54:15 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o19so1027659lfo.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Dec 2020 14:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=toS9/UXOgygIv5/JsFXSLZjtZRcGltwDge5uvyW+ZWE=;
        b=G6K+frm4usiDNsy54nqovFvsVKgDfwnlcqwizLUB2sMkLMPHlYnxgfuXUHsOojVXFw
         /xt2oZRbXSu5CI8DX5+rRvzw4S9LW+Xj/Nc7JSgAoW8ivJkV45cWCKrLTf7PxLxxx+Cx
         zI9Wm8nTWe1MMOuXTFlce9/yjl8z85vEMsRETL370DlXbffiE1ivHgPADKgCqZwgtqDg
         0LcU6uoZKF6W6BUO1wtPdKNyDZLyWe38U3Svmx06IfXYwGPUreI5Omz+Bg1G+IrGOhLF
         lMfckB64+SM8Xa8ny/ivZLlqJpHPuzr94Aqf+oMcRLV8kMeb5FdyS2AmK/NtXoAU3WCf
         ocBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=toS9/UXOgygIv5/JsFXSLZjtZRcGltwDge5uvyW+ZWE=;
        b=Y0eKwFOb5Emd0CoQra7zOq+amqT304t5urmr7Ucf3jgNOcJYl4zOBzpoLpEKsISvm7
         5Wh3Bl+j4Ddz9yFbuEh9WsLSaBK5n3YU/SsHCbXgQesZ/H1IO46unUIV7WUnCyjScvEH
         dCVweEM9A/YZlXN/NuvKIQanYlNax/HUTqUJzY+58M6SlpfQ8wX+ACEn/dLrDh+oX8VM
         /hgpYe8VctjKOqMOwq5qz+Jv0V/SmQ40/0UzkDgbdur3x/BIl3Y0gXrfuOegCI8rWnhi
         AITsHmL3P/t9dEkdRvraHkzVzEKXxHRrerToFKpIOvYZ1e5Js5fVtCVKmnDYpkk8w6sQ
         lgBg==
X-Gm-Message-State: AOAM533XA1mfSvev8IAZ4Hycq42bN7hN0FDV8+J2QUGXXq0tkUic3Av6
        CraDU76zVjVrQ+SYHLGDKdRup+y4Fj3gBfK8znzqjA==
X-Google-Smtp-Source: ABdhPJy/Kuiq5nYL/CE16WSk/6X+m/pQAohwMoamwxyWTJjm6Ssj0NyAucKyNP7cAy7nAgBmnP0B7IFJsfjl51hpq9c=
X-Received: by 2002:ac2:46d4:: with SMTP id p20mr11066331lfo.299.1608764053186;
 Wed, 23 Dec 2020 14:54:13 -0800 (PST)
MIME-Version: 1.0
References: <CALvZod4i=gBc2mL_ZmF5zE9udYnEKctPk3KBguj=nwzC5cLRNA@mail.gmail.com>
 <20201223164700.29723-1-sjpark@amazon.com>
In-Reply-To: <20201223164700.29723-1-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 23 Dec 2020 14:54:02 -0800
Message-ID: <CALvZod6ReV=vTWZu_k2p9p3ZWOLM1z4SZ-kwoTv_a73iYFZj0g@mail.gmail.com>
Subject: Re: [PATCH v23 05/15] mm/damon: Implement primitives for the virtual
 memory address spaces
To:     SeongJae Park <sjpark@amazon.com>
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        Andrea Arcangeli <aarcange@redhat.com>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendan.d.gregg@gmail.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Qian Cai <cai@lca.pw>,
        Colin Ian King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, Greg Thelen <gthelen@google.com>,
        Ian Rogers <irogers@google.com>, jolsa@redhat.com,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Mark Rutland <mark.rutland@arm.com>,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, sblbir@amazon.com,
        Shuah Khan <shuah@kernel.org>, sj38.park@gmail.com,
        snu@amazon.de, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Huang Ying <ying.huang@intel.com>, zgf574564920@gmail.com,
        linux-damon@amazon.com, Linux MM <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 23, 2020 at 8:47 AM SeongJae Park <sjpark@amazon.com> wrote:
>
[snip]
> > [snip]
> > > +
> > > +static bool damon_va_young(struct mm_struct *mm, unsigned long addr,
> > > +                       unsigned long *page_sz)
> > > +{
> > > +       pte_t *pte = NULL;
> > > +       pmd_t *pmd = NULL;
> > > +       spinlock_t *ptl;
> > > +       bool young = false;
> > > +
> > > +       if (follow_pte_pmd(mm, addr, NULL, &pte, &pmd, &ptl))
> > > +               return false;
> > > +
> > > +       *page_sz = PAGE_SIZE;
> > > +       if (pte) {
> > > +               young = pte_young(*pte);
> > > +               if (!young)
> > > +                       young = !page_is_idle(pte_page(*pte));
> > > +               pte_unmap_unlock(pte, ptl);
> > > +               return young;
> > > +       }
> > > +
> > > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > > +       young = pmd_young(*pmd);
> > > +       if (!young)
> > > +               young = !page_is_idle(pmd_page(*pmd));
> > > +       spin_unlock(ptl);
> > > +       *page_sz = ((1UL) << HPAGE_PMD_SHIFT);
> > > +#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> > > +
> > > +       return young;
> >
> > You need mmu_notifier_test_young() here. Hmm I remember mentioning
> > this in some previous version as well.
>
> Your question and my answer was as below:
>
>     > Don't you need mmu_notifier_clear_young() here?
>
>     I think we don't need it here because we only read the Accessed bit and PG_Idle
>     if Accessed bit was not set.
>
> I should notice that you mean 'test_young()' but didn't, sorry.  I will add it
> in the next version.
>

I should have said mmu_notifier_test_young() instead of
mmu_notifier_clear_young().

> >
> > BTW have you tested this on a VM?
>
> Yes.  Indeed, I'm testing this on a QEMU/KVM environment.  You can get more
> detail at: https://damonitor.github.io/doc/html/latest/vm/damon/eval.html#setup
>

Hmm without mmu_notifier_test_young() you should be missing the kvm
mmu access updates. Can you please recheck if your eval is correctly
seeing the memory accesses from the VM?
