Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9432C700D91
	for <lists+linux-doc@lfdr.de>; Fri, 12 May 2023 19:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237751AbjELRDe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 May 2023 13:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjELRDd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 May 2023 13:03:33 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5FEBBEB;
        Fri, 12 May 2023 10:03:31 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78744D75;
        Fri, 12 May 2023 10:04:15 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.57.221])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66D9F3F663;
        Fri, 12 May 2023 10:03:29 -0700 (PDT)
Date:   Fri, 12 May 2023 18:03:26 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org, akiyks@gmail.com,
        linux-doc@vger.kernel.org, kernel-team@meta.com,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH locking/atomic 18/19] locking/atomic: Refrain from
 generating duplicate fallback kernel-doc
Message-ID: <ZF5xXuPsrZEgAEEE@FVFF77S0Q05N>
References: <19135936-06d7-4705-8bc8-bb31c2a478ca@paulmck-laptop>
 <20230510181717.2200934-18-paulmck@kernel.org>
 <ZF0haDfyL3At3Ijw@FVFF77S0Q05N.cambridge.arm.com>
 <2a8b310c-3145-462b-a4c4-a130939da862@paulmck-laptop>
 <ZF48uBYKczItubrU@FVFF77S0Q05N>
 <b5498819-c2d4-414d-ba01-5373e749dc52@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5498819-c2d4-414d-ba01-5373e749dc52@paulmck-laptop>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 12, 2023 at 09:01:27AM -0700, Paul E. McKenney wrote:
> On Fri, May 12, 2023 at 02:18:48PM +0100, Mark Rutland wrote:
> > On Thu, May 11, 2023 at 12:12:16PM -0700, Paul E. McKenney wrote:
> > > On Thu, May 11, 2023 at 06:10:00PM +0100, Mark Rutland wrote:
> > > > I think that we can restructure the ifdeffery so that each ordering variant
> > > > gets its own ifdeffery, and then we could place the kerneldoc immediately above
> > > > that, e.g.
> > > > 
> > > > 	/**
> > > > 	 * arch_atomic_inc_return_release()
> > > > 	 *
> > > > 	 * [ full kerneldoc block here ]
> > > > 	 */
> > > > 	#if defined(arch_atomic_inc_return_release)
> > > > 	/* defined in arch code */
> > > > 	#elif defined(arch_atomic_inc_return_relaxed)
> > > > 	[ define in terms of arch_atomic_inc_return_relaxed ]
> > > > 	#elif defined(arch_atomic_inc_return)
> > > > 	[ define in terms of arch_atomic_inc_return ]
> > > > 	#else
> > > > 	[ define in terms of arch_atomic_fetch_inc_release ]
> > > > 	#endif
> > > > 
> > > > ... with similar for the mandatory ops that each arch must provide, e.g.
> > > > 
> > > > 	/**
> > > > 	 * arch_atomic_or()
> > > > 	 *
> > > > 	 * [ full kerneldoc block here ]
> > > > 	 */
> > > > 	/* arch_atomic_or() is mandatory -- architectures must define it! */
> > > > 
> > > > I had a go at that restructuring today, and while local build testing indicates
> > > > I haven't got it quite right, I think it's possible:
> > > > 
> > > >   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=atomics/fallback-rework
> > > > 
> > > > Does that sound ok to you?
> > > 
> > > At first glance, it appears that your "TODO" locations have the same
> > > information that I was using, so it should not be hard for me to adapt the
> > > current kernel-doc generation to your new scheme.  (Famous last words!)
> > 
> > Great!
> > 
> > > Plus having the kernel-doc generation all in one place does have some
> > > serious attractions.
> > 
> > :)
> > 
> > > I will continue maintaining my current stack, but would of course be
> > > happy to port it on top of your refactoring.  If it turns out that
> > > the refactoring will take a long time, we can discuss what to do in
> > > the meantime.  But here is hoping that the refactoring goes smoothly!
> > > That would be easier all around.  ;-)
> > 
> > FWIW, I think that's working now; every cross-build I've tried works.
> > 
> > I've updated the branch at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=atomics/fallback-rework
> > 
> > Tagged as:
> > 
> >   atomics-fallback-rework-20230512
> 
> Thank you very much!
> 
> I expect to send v2 of my original late today on the perhaps unlikely
> off-chance that someone might be interested in reviewing the verbiage.

I'll be more than happy to, though I suspect "late today" is far too late today
for me in UK time terms, so I probably won't look until Monday.

> More to the point, I have started porting my changes on top of your
> stack.  My thought is to have a separate "."-included script that does
> the kernel-doc work.

I was thinking that we'd have a gen_kerneldoc(...) shell function (probably in
atomic-tbl.sh), but that's an easy thing to refactor after v2, so either way is
fine for now!

> I am also thinking in terms of putting the kernel-doc generation into
> an "else" clause to the "is mandatory" check, and leaving the kernel-doc
> for the mandatory functions in arch/x86/include/asm/atomic.h.

My thinking was that all the kernel-doc bits should live in the common header
so that they're all easy to find when looking at the source code, and since if
feels a bit weird to have to look into arch/x86/ to figure out the semantics of
a function on !x86.

That said, if that's painful for some reason, please go with the easiest option
for now and we can figure out how to attack it for v3. :)

Thanks,
Mark.
