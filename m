Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71AA4A6A86
	for <lists+linux-doc@lfdr.de>; Wed,  2 Feb 2022 04:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243738AbiBBD0l (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Feb 2022 22:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242941AbiBBD0l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Feb 2022 22:26:41 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7BAC06173D
        for <linux-doc@vger.kernel.org>; Tue,  1 Feb 2022 19:26:40 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id n8so37885795lfq.4
        for <linux-doc@vger.kernel.org>; Tue, 01 Feb 2022 19:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+SKILI7HGRrVf/hkaIAvXfAqMW5LQDJ9EGnfwOuZpgw=;
        b=pEwd8f9PeaSBB8Zj1gTlGnPqR8mR45BFmL4xqnUTWk0C7A+YFsMiFY1TLnv62qpG9/
         NY5q5Bwmix8tnK7IjShuSaoj6T37K45bZanxgdjfH3To44VbI2I9dQidVmqiEwFHKY2C
         Uy8DFo+waX+fzxKt4XOoAhq8WzeT5o9HbsvqdVUasRjXOUgLbzVEv+l74IGCxSOnYYnv
         27OpZa0is284mKbWKXE+3YqLjBHQmC1kdrq1a+lDr91hqd5wABJPcMG0q881pHlPQ+bd
         k0yEmxZTrYaJh/tDhPRd6iamiuT9bq5v2ED+TUCYqujERZ7KT+KNKzDxsPM9/G3Uadxy
         57QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+SKILI7HGRrVf/hkaIAvXfAqMW5LQDJ9EGnfwOuZpgw=;
        b=Qm9D3TU1q43IWiAEzbehEFHF1tEhDy/KXuA5Q2cxc6DJJLZsuvIHnPJRUTC+H/yfHV
         DSAFts1mujo2hDZWyohIZEVYaj9xis8ioRHYd0ilLpsIAUlwfG8wIvKoHR7mZMqzyAli
         w5RJy6gEbUqJF9Ov9nOtsQl3dXJV14Iv1A3wHWinrMf+kCys7RzJBJlSBH+LaCEL/cnn
         skdGXQeHa/Lt/oknWhVYwUknHUGdx1/VbCWxobzNcEpdbmDhF9X15uT5dVniGJ8ukGPt
         GdsWmW1Va9hnLK/DWb8Ju9kMJDF2bIWB2UFeDsAClHdoc8T0dv7o8o4Lsahwnc3Y+pnT
         KNBg==
X-Gm-Message-State: AOAM532avcz4ECFkjDsBrQ5RIKFFryFHd+5cQx6LQdc8BB1Blj7opRND
        nnCB2if9Dk+oseGpGZOaZNdPC0eKlEFLHl4v6ZqPUw==
X-Google-Smtp-Source: ABdhPJzGCzxLyCiuASMGhG1nk+TgDdnzDKTuBGX5bUzbsZYiFbOtvOzGpw/xfC6/TIPrTSSNiEARR0XQqyI8sOvsKc0=
X-Received: by 2002:ac2:4e10:: with SMTP id e16mr22367013lfr.444.1643772398308;
 Tue, 01 Feb 2022 19:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20220131225250.409564-1-ndesaulniers@google.com>
 <CAMj1kXHz9psgjP7qQpusLOOL5Nm7TO+LauD_-mK=Fxe_g7mmsQ@mail.gmail.com>
 <CAKwvOdnkGfeBBE2NW_FKSzmZSjCJXc2801qvvOuyu+JL+m+VZQ@mail.gmail.com> <CAMj1kXFnUuWLyy5q-fAV1jwZobTCNHqhKSN3mF98frsJ4ai4Ow@mail.gmail.com>
In-Reply-To: <CAMj1kXFnUuWLyy5q-fAV1jwZobTCNHqhKSN3mF98frsJ4ai4Ow@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 1 Feb 2022 19:26:25 -0800
Message-ID: <CAKwvOdn0C4Mt=Nb-HjLQtrsJ=X6zqgMssVHT_2QeZpnjb=-HhA@mail.gmail.com>
Subject: Re: [PATCH] docs/memory-barriers.txt: volatile is not a barrier() substitute
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev,
        Kees Cook <keescook@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Len Baker <len.baker@gmx.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 1, 2022 at 2:15 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 1 Feb 2022 at 20:40, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Tue, Feb 1, 2022 at 1:32 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Mon, 31 Jan 2022 at 23:53, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > > >
> > > > +     around an asm statement so long as clobbers are not violated. For example,
> > > > +
> > > > +       asm volatile ("");
> > > > +       flag = true;
> > > > +
> > > > +     May be modified by the compiler to:
> > > > +
> > > > +       flag = true;
> > > > +       asm volatile ("");
> > > > +
> > > > +     Marking an asm statement as volatile is not a substitute for barrier(),
> > > > +     and is implicit for asm goto statements and asm statements that do not
> > > > +     have outputs (like the above example). Prefer either:
> > > > +
> > > > +       asm ("":::"memory");
> > > > +       flag = true;
> > > > +
> > > > +     Or:
> > > > +
> > > > +       asm ("");
> > > > +       barrier();
> > > > +       flag = true;
> > > > +
> > >
> > > I would expect the memory clobber to only hazard against the
> > > assignment of flag if it results in a store, but looking at your
> > > Godbolt example, this appears to apply even if flag is kept in a
> > > register.
> > >
> > > Is that behavior documented/codified anywhere? Or are we relying on
> > > compiler implementation details here?
> >
> > https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Volatile
> > "Note that the compiler can move even volatile asm instructions
> > relative to other code, including across jump instructions."
> >
>
> That doesn't really answer my question. We are documenting here that
> asm volatile does not prevent reordering but non-volatile asm with a
> "memory" clobber does, and even prevents reordering of instructions
> that do not modify memory to begin with.
>
> Why is it justified to rely on this undocumented behavior?

I see your point.  You're right, I couldn't find anywhere where such
behavior was specified.  So the suggestion to use barrier() would rely
on unspecified behavior and should not be suggested.

Probably worth still mentioning that `volatile` qualifying an asm
statement doesn't prevent such reordering in this document somehow,
and perhaps that it's (currently) unspecified whether a barrier() can
prevent re-ordering with regards to non-memory-modifying instructions.
-- 
Thanks,
~Nick Desaulniers
