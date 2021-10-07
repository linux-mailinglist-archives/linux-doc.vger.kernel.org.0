Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B60E425759
	for <lists+linux-doc@lfdr.de>; Thu,  7 Oct 2021 18:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242476AbhJGQGQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 7 Oct 2021 12:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242442AbhJGQGP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Oct 2021 12:06:15 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEF2C061762
        for <linux-doc@vger.kernel.org>; Thu,  7 Oct 2021 09:04:21 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id s64so14449251yba.11
        for <linux-doc@vger.kernel.org>; Thu, 07 Oct 2021 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=idsd5mctgolloTq522mlXra0iGlPTwRxJgNy/gnn+wQ=;
        b=kXYYisjK1xNhb3JOoFrAhJNoJOkeGU9DaJyxG2fvBrDNVdaOmc6g3jNa//6kthDqeG
         zQxMuDKUOyw9KSRu50Aj3rQlprQSM3QiPHY/4v/gfs/jtmBqZD25r1t8w2gpbY224vgR
         xOMfkCe7Yx1sFQvabb2bpd3/Zfqv1ZftfZMd+RgN9itmzWRuej+FJ9ZqMlTnWcL0qy1E
         MXMJUEoVQnMz3Qoxc3FVeY2vG5GGww+t6HbNg1oqLu41PlRbignDbA32LJ+u3yp3Ywe5
         GYnqJsOJVUBfC+PJaNS6AhT4w3FcDiuVHdNrQuBDl/qY7WauvSAvbPtSzjCehbYqkNhM
         AowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=idsd5mctgolloTq522mlXra0iGlPTwRxJgNy/gnn+wQ=;
        b=fsXGrUHzn65JIVgz5GL/96RdbcEf+/SncfVxvc7qffVy3mzhBlZ8ScmOAgACgKG+GJ
         IsC4zNFXS2EVEa8NdBudQv1L759gjkEjoiUTy0GIM7rThLSqCu/JYDioQzKY25fh55wh
         5lS8yTkvkaJW8E/PJmoyhIjowGE9zd+5JS5VwPg3wkzgqfotiEskyydq80Q+RISVEnoT
         1l+pg3NqKAvy2IQK/QZhrQe17a68dZMuJtjmT3OPNKOYZ/GjWf9YhXp7hkAn3Z6tujrW
         IPYKX/aRl4OW5+jpg5pKN/kXIUIXwTlOhrxQASdEyzw4E+E4idm/TQB56Dp1+//67BIe
         tJKQ==
X-Gm-Message-State: AOAM531mx0ncug2avbdWTHppMQGQtun7s9rhAUeRMeTwKiQsSIK4Mt59
        1Pzu9SMT19ZIM6pPRowQ2dWqsoqN4hYKTeFVnI7ihA==
X-Google-Smtp-Source: ABdhPJxRZSNNPrKdHDus3HcjlavGjc70+r39LVG0FYYUgfxFDkbPBxwLgqcMcnfSqqkSgGqKj0vntbBJ/ETTWgkukL0=
X-Received: by 2002:a25:5646:: with SMTP id k67mr5923693ybb.127.1633622660245;
 Thu, 07 Oct 2021 09:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211005200411.GB19804@duo.ucw.cz> <CAJuCfpFZkz2c0ZWeqzOAx8KFqk1ge3K-SiCMeu3dmi6B7bK-9w@mail.gmail.com>
 <efdffa68-d790-72e4-e6a3-80f2e194d811@nvidia.com> <YV1eCu0eZ+gQADNx@dhcp22.suse.cz>
 <6b15c682-72eb-724d-bc43-36ae6b79b91a@redhat.com> <CAJuCfpEPBM6ehQXgzp=g4SqtY6iaC8wuZ-CRE81oR1VOq7m4CA@mail.gmail.com>
 <20211006175821.GA1941@duo.ucw.cz> <CAJuCfpGuuXOpdYbt3AsNn+WNbavwuEsDfRMYunh+gajp6hOMAg@mail.gmail.com>
 <YV6rksRHr2iSWR3S@dhcp22.suse.cz> <92cbfe3b-f3d1-a8e1-7eb9-bab735e782f6@rasmusvillemoes.dk>
 <20211007101527.GA26288@duo.ucw.cz>
In-Reply-To: <20211007101527.GA26288@duo.ucw.cz>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Thu, 7 Oct 2021 09:04:09 -0700
Message-ID: <CAJuCfpGp0D9p3KhOWhcxMO1wEbo-J_b2Anc-oNwdycx4NTRqoA@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] mm: add anonymous vma name refcounting
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Peter Xu <peterx@redhat.com>, rppt@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        vincenzo.frascino@arm.com,
        =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= 
        <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
        Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        Hugh Dickins <hughd@google.com>, feng.tang@intel.com,
        Jason Gunthorpe <jgg@ziepe.ca>, Roman Gushchin <guro@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com,
        Chris Hyser <chris.hyser@oracle.com>,
        Peter Collingbourne <pcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org,
        Rolf Eike Beer <eb@emlix.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 7, 2021 at 3:15 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > >> Hmm, so the suggestion is to have some directory which contains files
> > >> representing IDs, each containing the string name of the associated
> > >> vma? Then let's say we are creating a new VMA and want to name it. We
> > >> would have to scan that directory, check all files and see if any of
> > >> them contain the name we want to reuse the same ID.
> > >
> > > I believe Pavel meant something as simple as
> > > $ YOUR_FILE=$YOUR_IDS_DIR/my_string_name
> > > $ touch $YOUR_FILE
> > > $ stat -c %i $YOUR_FILE

Ah, ok, now I understand the proposal. Thanks for the clarification!
So, this would use filesystem as a directory for inode->name mappings.
One rough edge for me is that the consumer would still need to parse
/proc/$pid/maps and convert [anon:inode] into [anon:name] instead of
just dumping the content for the user. Would it be acceptable if we
require the ID provided by prctl() to always be a valid inode and
show_map_vma() would do the inode-to-filename conversion when
generating maps/smaps files? I know that inode->dentry is not
one-to-one mapping but we can simply output the first dentry name.
WDYT?

> >
> > So in terms of syscall overhead, that would be open(..., O_CREAT |
> > O_CLOEXEC), fstat(), close() - or one could optimistically start by
>
> You could get to two if you used mkdir instead of open.
>
> > > YOUR_IDS_DIR can live on a tmpfs and you can even implement a policy on
> > > top of that (who can generate new ids, gurantee uniqness etc...).
> > >
> > > The above is certainly not for free of course but if you really need a
> > > system wide consistency when using names then you need some sort of
> > > central authority. How you implement that is not all that important
> > > but I do not think we want to handle that in the kernel.

Ideally it would be great if $YOUR_IDS_DIR/my_string_name entries
could be generated by the kernel in response to userspace calling
prctl(..., name) but I haven't looked into complexity of doing that,
so I would not propose that at this point.
Thanks for sharing the ideas!
Suren.

> >
> > IDK. If the whole thing could be put behind a CONFIG_ knob, with _zero_
> > overhead when not enabled (and I'm a bit worried about all the functions
> > that grow an extra argument that gets passed around), I don't mind the
> > string interface. But I don't really have a say either way.
>
> If this is ever useful outside of Android, eventually distros will
> have it enabled.
>
> Best regards,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek
