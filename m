Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94FB4007A1
	for <lists+linux-doc@lfdr.de>; Fri,  3 Sep 2021 23:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbhICV5e (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Sep 2021 17:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235222AbhICV5d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Sep 2021 17:57:33 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219ECC061575
        for <linux-doc@vger.kernel.org>; Fri,  3 Sep 2021 14:56:33 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id a93so1093009ybi.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Sep 2021 14:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zG5/7AV9BzevEKzJQKSrnmTBIp1ROnBD6nq2xHoY4wg=;
        b=kFkSIiu5R2dx6dF1mtriwDnLYB3riLPv3xSIambOd/wio1cGYvXWPu65Mk4C6WBuN+
         mRcqBD34nOnJdi1ZkqeLWw6Al9MkAvElp6zXiUx/gZBqb1plytyUGRay7F72mEEyfHLw
         qPGLVGfxwreGIUCMBQ1dA24p/Nih73FDf5fMOSlNkcyu1zsiMYqYKM6xENDs9mRNSfrt
         qiaPu2cOc7NANF/FcEXMkaZEAu2abAIKsLtuf7xiDLmsv7SRB57+q3x3ErQl3ZfdGF+K
         mIrLanpaYYWSqCGILhdt06H1ZytO5wpkX8rf6ALNMKThmri0pCz2viNiA4S7KAEx0JSe
         sorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zG5/7AV9BzevEKzJQKSrnmTBIp1ROnBD6nq2xHoY4wg=;
        b=sViMynEY316u8EivgeSnP4yWJ1POnertOnGGTJgdl/wsHDjuZLm+1uS1OR1ehtXSd5
         V4HD3NcI9yN9JUaM608ZF4ClzeDcQr3dpnysM11L3geVmb6PsJ0J1zJ7z2Ot/H4av57f
         7CRpr1jEh0CuQ4lNtZUyfRtr3UJMzSwuUndKvipxRTUcrMAmIAYjjYytLurGs+LVLAab
         RXXdFXpZPSef2LrPf4nU0Ge73TCcywk22iYhAhTTyzNnLKVEjU3M/znL4/A8kh+3yYdO
         7LFY7RqD80OKe8JTiNcxZKDMs1pvSU5WP9xZm/bkp40LWTd8gQyJVwDgRJnKF1/LGcDS
         uBJg==
X-Gm-Message-State: AOAM531GbPii8SL5ijELR5SrG/4wT+OFrbA6ZrKvU6taDDMixOSQgpkr
        R36ZBNOaLDh4NcwcVueQwEbnPv25ounLMh9X+EkdwQ==
X-Google-Smtp-Source: ABdhPJzz7uw4W54vK73OFEef5oMMxi0ghWudIDn5FIoOhEpBC3oPOTJGuoQEDqHr84k9mmpwgrr/M+gaBSMIwsQF2bY=
X-Received: by 2002:a05:6902:1247:: with SMTP id t7mr1542942ybu.161.1630706192001;
 Fri, 03 Sep 2021 14:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210902231813.3597709-1-surenb@google.com> <20210902231813.3597709-2-surenb@google.com>
 <202109031439.B58932AF0@keescook>
In-Reply-To: <202109031439.B58932AF0@keescook>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Fri, 3 Sep 2021 14:56:21 -0700
Message-ID: <CAJuCfpEQAJqu2DLf5D5pCkv4nq+dtVOpiJSnsxwGrgb9H6inQA@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] mm: add a field to store names for private
 anonymous memory
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
        Dave Hansen <dave.hansen@intel.com>,
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
        John Hubbard <jhubbard@nvidia.com>,
        Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        Hugh Dickins <hughd@google.com>, feng.tang@intel.com,
        Jason Gunthorpe <jgg@ziepe.ca>, Roman Gushchin <guro@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com,
        chris.hyser@oracle.com, Peter Collingbourne <pcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org,
        Rolf Eike Beer <eb@emlix.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 3, 2021 at 2:47 PM Kees Cook <keescook@chromium.org> wrote:
>
> (Sorry, a few more things jumped out at me when I looked again...)
>
> On Thu, Sep 02, 2021 at 04:18:12PM -0700, Suren Baghdasaryan wrote:
> > [...]
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index 72c7639e3c98..25118902a376 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -2299,6 +2299,64 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
> >
> >  #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
> >
> > +#ifdef CONFIG_MMU
> > +
> > +#define ANON_VMA_NAME_MAX_LEN        256
> > +
> > +static inline bool is_valid_name_char(char ch)
> > +{
> > +     /* printable ascii characters, except [ \ ] */
> > +     return (ch > 0x1f && ch < 0x5b) || (ch > 0x5d && ch < 0x7f);
> > +}
>
> In the back of my mind, I feel like disallowing backtick would be nice,
> but then if $, (, and ) are allowed, it doesn't matter, and that seems
> too limiting. :)

It's not used by the only current user (Android) and we can always
allow more chars later. However going the other direction and
disallowing some of them I think would be harder (need to make sure
nobody uses them). WDYT if we keep it stricter and relax if needed?

>
> > +
> > +static int prctl_set_vma(unsigned long opt, unsigned long addr,
> > +                      unsigned long size, unsigned long arg)
> > +{
> > +     struct mm_struct *mm = current->mm;
> > +     const char __user *uname;
> > +     char *name, *pch;
> > +     int error;
> > +
> > +     switch (opt) {
> > +     case PR_SET_VMA_ANON_NAME:
> > +             uname = (const char __user *)arg;
> > +             if (!uname) {
> > +                     /* Reset the name */
> > +                     name = NULL;
> > +                     goto set_name;
> > +             }
> > +
> > +             name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
> > +
> > +             if (IS_ERR(name))
> > +                     return PTR_ERR(name);
> > +
> > +             for (pch = name; *pch != '\0'; pch++) {
> > +                     if (!is_valid_name_char(*pch)) {
> > +                             kfree(name);
> > +                             return -EINVAL;
> > +                     }
> > +             }
> > +set_name:
> > +             mmap_write_lock(mm);
> > +             error = madvise_set_anon_name(mm, addr, size, name);
> > +             mmap_write_unlock(mm);
> > +             kfree(name);
> > +             break;
>
> This is a weird construct with a needless goto. Why not:
>
>         switch (opt) {
>         case PR_SET_VMA_ANON_NAME:
>                 uname = (const char __user *)arg;
>                 if (uname) {
>                         name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
>                         if (IS_ERR(name))
>                                 return PTR_ERR(name);
>
>                         for (pch = name; *pch != '\0'; pch++) {
>                                 if (!is_valid_name_char(*pch)) {
>                                         kfree(name);
>                                         return -EINVAL;
>                                 }
>                         }
>                 } else {
>                         /* Reset the name */
>                         name = NULL;
>                 }
>                 mmap_write_lock(mm);
>                 error = madvise_set_anon_name(mm, addr, size, name);
>                 mmap_write_unlock(mm);
>                 kfree(name);
>                 break;

Yeah, I was contemplating one way or the other (less indents vs clear
flow) and you convinced me :) Will change in the next rev.
Thanks for the review!

>
>
> --
> Kees Cook
