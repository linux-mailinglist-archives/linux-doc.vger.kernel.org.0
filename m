Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3DC4FEB3E
	for <lists+linux-doc@lfdr.de>; Sat, 16 Nov 2019 09:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfKPIVI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 16 Nov 2019 03:21:08 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46726 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfKPIVI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Nov 2019 03:21:08 -0500
Received: by mail-ot1-f65.google.com with SMTP id n23so10086070otr.13
        for <linux-doc@vger.kernel.org>; Sat, 16 Nov 2019 00:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IAbPck/tyWYpcH6q1DqU0wF9VrcqMWHjsvfsasMdJQ8=;
        b=XWnuclkqZMItq+/ksJ8Y1qa9/9oIF2fdvK7zku42Z8ODKYKzpWGUzZ/8O3BaVjf7Ag
         P71ZJ18PYDh/S+GcXJv7JbUHBfrVxcoQ8Tvy3/rDGiRsih1j0Zfw3p0aX5sUwbDmnNzp
         UJbeoNYdVfNU8lrJD/bixaoQ7gvdzCi0y77rY6eMix67aCD4LLAxKMFtrjIBZplbOSLa
         whiths2ljXaRVaJ66Ty6f/l0eqANuJrB5x+g554vTxKefToWIvkl2VMJofQLrWCYVNFN
         uMyJ4CtcCuhbdCcrnripCXXi0U9CRkogJhOh3chGjPKJVPuRp3IpvYuKiS5dSot+QvZ1
         UFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IAbPck/tyWYpcH6q1DqU0wF9VrcqMWHjsvfsasMdJQ8=;
        b=PdKPR/NV2dQW3kTHjxsIXZgJsVmlSb3vFpDlaNgM8ob267jQbGSkwcR1DEoazAT9J/
         F+iAVQg+3RKxciiQ4aitXAW8cfDsh5dsm/qk9Yy8ARw25MGInJeuD6LVMcLKwHp2Te5c
         V4qpdnRLO3kJMligCLkn4qB0VAy0HPo3zuE3ruhw8pCVoywI47GfLl3Ev/fORnzQboKA
         ngLUXnwHPL16s7Ore9KEbEaVaA0a5P8JDu68VT9C52tHZjO+nEaxeI99ukrp8CcWMNR/
         ETWqjfplUBzYr1YZcyx4859ZGpspYJlCvb742qD2Msg9Hn1YegwjcvfyMj5Ztm1FEXOT
         4oMQ==
X-Gm-Message-State: APjAAAX+KmQcziPC1aEvfaqflXHbE1c8B9DXYU1/Iy1fjaq2MLvq9E5F
        mtOXE3QbBTMWrUskpNz3i4kie7uxQrEYCoCpOk28gQ==
X-Google-Smtp-Source: APXvYqyFoD1MoXKYzcJ0ETjr8RD5raPWnHWPSZdYf70aViyP/iAqqE28rDX/p+nlWotCJAjaCdGBcwat07yGzdHKecY=
X-Received: by 2002:a9d:3d76:: with SMTP id a109mr14975357otc.233.1573892466111;
 Sat, 16 Nov 2019 00:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20191114180303.66955-1-elver@google.com> <20191114195046.GP2865@paulmck-ThinkPad-P72>
 <20191114213303.GA237245@google.com> <20191114221559.GS2865@paulmck-ThinkPad-P72>
 <CANpmjNPxAOUAxXHd9tka5gCjR_rNKmBk+k5UzRsXT0a0CtNorw@mail.gmail.com>
 <20191115164159.GU2865@paulmck-ThinkPad-P72> <CANpmjNPy2RDBUhV-j-APzwYr-_x2V9QwgPTYZph36rCpEVqZSQ@mail.gmail.com>
 <20191115204321.GX2865@paulmck-ThinkPad-P72>
In-Reply-To: <20191115204321.GX2865@paulmck-ThinkPad-P72>
From:   Marco Elver <elver@google.com>
Date:   Sat, 16 Nov 2019 09:20:54 +0100
Message-ID: <CANpmjNN0JCgEOC=AhKN7pH9OpmzbNB94mioP0FN9ueCQUfKzBQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Add Kernel Concurrency Sanitizer (KCSAN)
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     LKMM Maintainers -- Akira Yokosawa <akiyks@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alexander Potapenko <glider@google.com>,
        Andrea Parri <parri.andrea@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>, Daniel Axtens <dja@axtens.net>,
        Daniel Lustig <dlustig@nvidia.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Luc Maranget <luc.maranget@inria.fr>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-efi@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 15 Nov 2019 at 21:43, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Fri, Nov 15, 2019 at 06:14:46PM +0100, Marco Elver wrote:
> > On Fri, 15 Nov 2019 at 17:42, Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Fri, Nov 15, 2019 at 01:02:08PM +0100, Marco Elver wrote:
> > > > On Thu, 14 Nov 2019 at 23:16, Paul E. McKenney <paulmck@kernel.org> wrote:
> > > > >
> > > > > On Thu, Nov 14, 2019 at 10:33:03PM +0100, Marco Elver wrote:
> > > > > > On Thu, 14 Nov 2019, Paul E. McKenney wrote:
> > > > > >
> > > > > > > On Thu, Nov 14, 2019 at 07:02:53PM +0100, Marco Elver wrote:
> > > > > > > > This is the patch-series for the Kernel Concurrency Sanitizer (KCSAN).
> > > > > > > > KCSAN is a sampling watchpoint-based *data race detector*. More details
> > > > > > > > are included in **Documentation/dev-tools/kcsan.rst**. This patch-series
> > > > > > > > only enables KCSAN for x86, but we expect adding support for other
> > > > > > > > architectures is relatively straightforward (we are aware of
> > > > > > > > experimental ARM64 and POWER support).
> > > > > > > >
> > > > > > > > To gather early feedback, we announced KCSAN back in September, and have
> > > > > > > > integrated the feedback where possible:
> > > > > > > > http://lkml.kernel.org/r/CANpmjNPJ_bHjfLZCAPV23AXFfiPiyXXqqu72n6TgWzb2Gnu1eA@mail.gmail.com
> > > > > > > >
> > > > > > > > The current list of known upstream fixes for data races found by KCSAN
> > > > > > > > can be found here:
> > > > > > > > https://github.com/google/ktsan/wiki/KCSAN#upstream-fixes-of-data-races-found-by-kcsan
> > > > > > > >
> > > > > > > > We want to point out and acknowledge the work surrounding the LKMM,
> > > > > > > > including several articles that motivate why data races are dangerous
> > > > > > > > [1, 2], justifying a data race detector such as KCSAN.
> > > > > > > >
> > > > > > > > [1] https://lwn.net/Articles/793253/
> > > > > > > > [2] https://lwn.net/Articles/799218/
> > > > > > >
> > > > > > > I queued this and ran a quick rcutorture on it, which completed
> > > > > > > successfully with quite a few reports.
> > > > > >
> > > > > > Great. Many thanks for queuing this in -rcu. And regarding merge window
> > > > > > you mentioned, we're fine with your assumption to targeting the next
> > > > > > (v5.6) merge window.
> > > > > >
> > > > > > I've just had a look at linux-next to check what a future rebase
> > > > > > requires:
> > > > > >
> > > > > > - There is a change in lib/Kconfig.debug and moving KCSAN to the
> > > > > >   "Generic Kernel Debugging Instruments" section seems appropriate.
> > > > > > - bitops-instrumented.h was removed and split into 3 files, and needs
> > > > > >   re-inserting the instrumentation into the right places.
> > > > > >
> > > > > > Otherwise there are no issues. Let me know what you recommend.
> > > > >
> > > > > Sounds good!
> > > > >
> > > > > I will be rebasing onto v5.5-rc1 shortly after it comes out.  My usual
> > > > > approach is to fix any conflicts during that rebasing operation.
> > > > > Does that make sense, or would you prefer to send me a rebased stack at
> > > > > that point?  Either way is fine for me.
> > > >
> > > > That's fine with me, thanks!  To avoid too much additional churn on
> > > > your end, I just replied to the bitops patch with a version that will
> > > > apply with the change to bitops-instrumented infrastructure.
> > >
> > > My first thought was to replace 8/10 of the previous version of your
> > > patch in -rcu (047ca266cfab "asm-generic, kcsan: Add KCSAN instrumentation
> > > for bitops"), but this does not apply.  So I am guessing that I instead
> > > do this substitution when a rebase onto -rc1..
> > >
> > > Except...
> > >
> > > > Also considering the merge window, we had a discussion and there are
> > > > some arguments for targeting the v5.5 merge window:
> > > > - we'd unblock ARM and POWER ports;
> > > > - we'd unblock people wanting to use the data_race macro;
> > > > - we'd unblock syzbot just tracking upstream;
> > > > Unless there are strong reasons to not target v5.5, I leave it to you
> > > > if you think it's appropriate.
> > >
> > > My normal process is to send the pull request shortly after -rc5 comes
> > > out, but you do call out some benefits of getting it in sooner, so...
> > >
> > > What I will do is to rebase your series onto (say) -rc7, test it, and
> > > see about an RFC pull request.
> > >
> > > One possible complication is the new 8/10 patch.  But maybe it will
> > > apply against -rc7?
> > >
> > > Another possible complication is this:
> > >
> > > scripts/kconfig/conf  --syncconfig Kconfig
> > > *
> > > * Restart config...
> > > *
> > > *
> > > * KCSAN: watchpoint-based dynamic data race detector
> > > *
> > > KCSAN: watchpoint-based dynamic data race detector (KCSAN) [N/y/?] (NEW)
> > >
> > > Might be OK in this case because it is quite obvious what it is doing.
> > > (Avoiding pain from this is the reason that CONFIG_RCU_EXPERT exists.)
> > >
> > > But I will just mention this in the pull request.
> > >
> > > If there is a -rc8, there is of course a higher probability of making it
> > > into the next merge window.
> > >
> > > Fair enough?
> >
> > Totally fine with that, sounds like a good plan, thanks!
> >
> > If it helps, in theory we can also drop and delay the bitops
> > instrumentation patch until the new bitops instrumentation
> > infrastructure is in 5.5-rc1. There won't be any false positives if
> > this is missing, we might just miss a few data races until we have it.
>
> That sounds advisable for an attempt to hit this coming merge window.
>
> So just to make sure I understand, I drop 8/10 and keep the rest during
> a rebase to 5.4-rc7, correct?

Yes, that's right.

Many thanks,
-- Marco
