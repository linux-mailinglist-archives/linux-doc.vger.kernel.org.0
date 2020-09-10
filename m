Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69800264BE3
	for <lists+linux-doc@lfdr.de>; Thu, 10 Sep 2020 19:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgIJRlw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Sep 2020 13:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgIJRl3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 13:41:29 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027FCC061757
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 10:41:17 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id n2so6750327oij.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 10:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ATdJdtrrGQs40AB3pAJaPiKELI+qIaGQiGwD413skg=;
        b=s1IboDV+5v/GRORnn7PeYV0l5Wu9lL1nSqTQFlmFaPKFJLXtecqcf/fF8tE8/TBzFO
         wwko5dfbZDLn4eQwiMdwMtaeAwbxcyMcNSrcmwcMOn3OhK75W+2R0JMdzJurCcZrbJkP
         Aj26foauya/lB6hvQxoJ9UV6SIiv7Wx7xQdQab6tQZiOH9gLwtyGWJ0sfxvcTvHLfm+n
         tsSey7Dl8WMXWipZQv8iolcq6jQBRRRGCvoNk4C55Q5vbgBS3P+t47LwGafvHf+8cbD9
         tEYY2rXnyqBrxsujG5V89lCiwKjUHnQBSjuWeBKEtLaiZF0sc5GaRbmgOg3XZZyh/Aq0
         b5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ATdJdtrrGQs40AB3pAJaPiKELI+qIaGQiGwD413skg=;
        b=i1dmhlgzmAFRyDsQXEZm634MNlAxvhQHkW9BANCHLcFzbo/2LVp+7hIS+A/PZVdxs/
         /SCDj/2WZX7Qzc5p2ueR6quLMqJm9gs7XyYlj+ev2lSCTarXz6p1OumYt9IopEYIHtYk
         o5ZBVdCDDw/VFZP/Zy3Y+6W9YwayDuVJKKylyBE+G6H65dimAo1KO71DWZGngVRPJilH
         dI7k3fNMSykvld1Vtw+vjXtKkAJF1JvJaq7YDdUKNLRWFnQhG+bTHKD1C3+vs9Bo0nd2
         yP3BjCaB1K1iGvuxJenjWycEif5DjZG4PrYlWEp496S3Qm7CNLRTIyItFX8dGQbqVWpz
         xPog==
X-Gm-Message-State: AOAM533LLkbApQZJu/mxFV4uiyUQFLuDpa/nH74auKeR+H88OvP+HkMQ
        EVyQ0uNMx7I6b40xAZWA05tu4tduXFXMCp7FUwXLNQ==
X-Google-Smtp-Source: ABdhPJzLL0bwB+luoUJV/L6Tg/d9FthCbcG3Z5v/fHjAGvSmsEKDMAUcDV0H7RwYClSVyOq990hNd20DUyp67bzsrQw=
X-Received: by 2002:aca:5158:: with SMTP id f85mr709168oib.121.1599759676956;
 Thu, 10 Sep 2020 10:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com> <20200907134055.2878499-2-elver@google.com>
 <CACT4Y+bfp2ch2KbSMkUd3142aA4p2CiMOmdXrr0-muu6bQ5xXg@mail.gmail.com>
 <CAG_fn=W4es7jaTotDORt2SwspE4A804mdwAY1j4gcaSEKtRjiw@mail.gmail.com> <CACT4Y+awrz-j8y5Qc8OS9qkov4doMnw1V=obwp3MB_LTvaUFXw@mail.gmail.com>
In-Reply-To: <CACT4Y+awrz-j8y5Qc8OS9qkov4doMnw1V=obwp3MB_LTvaUFXw@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 10 Sep 2020 19:41:05 +0200
Message-ID: <CANpmjNOTJsZeH_sMx=3XNZuvCih+A9m3uTeSGcmpNH9YbiF2sQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/10] mm: add Kernel Electric-Fence infrastructure
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@lca.pw>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 Sep 2020 at 19:11, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Thu, Sep 10, 2020 at 6:19 PM Alexander Potapenko <glider@google.com> wrote:
> >
> > On Thu, Sep 10, 2020 at 5:43 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> >
> > > > +       /* Calculate address for this allocation. */
> > > > +       if (right)
> > > > +               meta->addr += PAGE_SIZE - size;
> > > > +       meta->addr = ALIGN_DOWN(meta->addr, cache->align);
> > >
> > > I would move this ALIGN_DOWN under the (right) if.
> > > Do I understand it correctly that it will work, but we expect it to do
> > > nothing for !right? If cache align is >PAGE_SIZE, nothing good will
> > > happen anyway, right?
> > > The previous 2 lines look like part of the same calculation -- "figure
> > > out the addr for the right case".
> >
> > Yes, makes sense.
> >
> > > > +
> > > > +       schedule_delayed_work(&kfence_timer, 0);
> > > > +       WRITE_ONCE(kfence_enabled, true);
> > >
> > > Can toggle_allocation_gate run before we set kfence_enabled? If yes,
> > > it can break. If not, it's still somewhat confusing.
> >
> > Correct, it should go after we enable KFENCE. We'll fix that in v2.
> >
> > > > +void __kfence_free(void *addr)
> > > > +{
> > > > +       struct kfence_metadata *meta = addr_to_metadata((unsigned long)addr);
> > > > +
> > > > +       if (unlikely(meta->cache->flags & SLAB_TYPESAFE_BY_RCU))
> > >
> > > This may deserve a comment as to why we apply rcu on object level
> > > whereas SLAB_TYPESAFE_BY_RCU means slab level only.
> >
> > Sorry, what do you mean by "slab level"?
> > SLAB_TYPESAFE_BY_RCU means we have to wait for possible RCU accesses
> > in flight before freeing objects from that slab - that's basically
> > what we are doing here below:
>
> Exactly! You see it is confusing :)
> SLAB_TYPESAFE_BY_RCU does not mean that. rcu-freeing only applies to
> whole pages, that's what I mean by "slab level" (whole slabs are freed
> by rcu).

In the case here, we have to defer freeing the object, because unlike
real SLAB_TYPESAFE_BY_RCU slabs, our page here may get recycled for
other-typed objects. We can update the comment to be clearer.
