Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6E46F524F
	for <lists+linux-doc@lfdr.de>; Wed,  3 May 2023 09:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjECHwZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 May 2023 03:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjECHwP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 May 2023 03:52:15 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07E730F7;
        Wed,  3 May 2023 00:51:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 529882230F;
        Wed,  3 May 2023 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1683100310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LbOettp3UaJGbcC185AxqMHgcSABvOiPPaXvjwmoDVE=;
        b=u+JdKhxmNSEcTLgJetAiyE5+DpLX9lfGaxfRYrwtA1OwKYk88K/+nmG6d/2esV+aCUUtPR
        h+gvAGPKGWUp3TxdEFsKmHv+uIDk2Y2kKg6agFx7Z77jX1G45rhNx3IzfsIMW/fcqrejJk
        PfnqrxsJUonlqQD4TEfvThhG0FK+lVs=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2480E1331F;
        Wed,  3 May 2023 07:51:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YvrlCJYSUmQIXAAAMHmgww
        (envelope-from <mhocko@suse.com>); Wed, 03 May 2023 07:51:50 +0000
Date:   Wed, 3 May 2023 09:51:49 +0200
From:   Michal Hocko <mhocko@suse.com>
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
        vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
        mgorman@suse.de, dave@stgolabs.net, willy@infradead.org,
        liam.howlett@oracle.com, corbet@lwn.net, void@manifault.com,
        peterz@infradead.org, juri.lelli@redhat.com, ldufour@linux.ibm.com,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
        x86@kernel.org, peterx@redhat.com, david@redhat.com,
        axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
        nathan@kernel.org, dennis@kernel.org, tj@kernel.org,
        muchun.song@linux.dev, rppt@kernel.org, paulmck@kernel.org,
        pasha.tatashin@soleen.com, yosryahmed@google.com,
        yuzhao@google.com, dhowells@redhat.com, hughd@google.com,
        andreyknvl@gmail.com, keescook@chromium.org,
        ndesaulniers@google.com, gregkh@linuxfoundation.org,
        ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
        penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
        glider@google.com, elver@google.com, dvyukov@google.com,
        shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com,
        rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
        kernel-team@android.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-modules@vger.kernel.org,
        kasan-dev@googlegroups.com, cgroups@vger.kernel.org
Subject: Re: [PATCH 00/40] Memory allocation profiling
Message-ID: <ZFISlX+mSx4QJDK6@dhcp22.suse.cz>
References: <20230501165450.15352-1-surenb@google.com>
 <ZFIMaflxeHS3uR/A@dhcp22.suse.cz>
 <ZFIOfb6/jHwLqg6M@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFIOfb6/jHwLqg6M@moria.home.lan>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed 03-05-23 03:34:21, Kent Overstreet wrote:
> On Wed, May 03, 2023 at 09:25:29AM +0200, Michal Hocko wrote:
> > On Mon 01-05-23 09:54:10, Suren Baghdasaryan wrote:
> > > Memory allocation profiling infrastructure provides a low overhead
> > > mechanism to make all kernel allocations in the system visible. It can be
> > > used to monitor memory usage, track memory hotspots, detect memory leaks,
> > > identify memory regressions.
> > > 
> > > To keep the overhead to the minimum, we record only allocation sizes for
> > > every allocation in the codebase. With that information, if users are
> > > interested in more detailed context for a specific allocation, they can
> > > enable in-depth context tracking, which includes capturing the pid, tgid,
> > > task name, allocation size, timestamp and call stack for every allocation
> > > at the specified code location.
> > [...]
> > > Implementation utilizes a more generic concept of code tagging, introduced
> > > as part of this patchset. Code tag is a structure identifying a specific
> > > location in the source code which is generated at compile time and can be
> > > embedded in an application-specific structure. A number of applications
> > > for code tagging have been presented in the original RFC [1].
> > > Code tagging uses the old trick of "define a special elf section for
> > > objects of a given type so that we can iterate over them at runtime" and
> > > creates a proper library for it. 
> > > 
> > > To profile memory allocations, we instrument page, slab and percpu
> > > allocators to record total memory allocated in the associated code tag at
> > > every allocation in the codebase. Every time an allocation is performed by
> > > an instrumented allocator, the code tag at that location increments its
> > > counter by allocation size. Every time the memory is freed the counter is
> > > decremented. To decrement the counter upon freeing, allocated object needs
> > > a reference to its code tag. Page allocators use page_ext to record this
> > > reference while slab allocators use memcg_data (renamed into more generic
> > > slabobj_ext) of the slab page.
> > [...]
> > > [1] https://lore.kernel.org/all/20220830214919.53220-1-surenb@google.com/
> > [...]
> > >  70 files changed, 2765 insertions(+), 554 deletions(-)
> > 
> > Sorry for cutting the cover considerably but I believe I have quoted the
> > most important/interesting parts here. The approach is not fundamentally
> > different from the previous version [1] and there was a significant
> > discussion around this approach. The cover letter doesn't summarize nor
> > deal with concerns expressed previous AFAICS. So let me bring those up
> > back. At least those I find the most important:
> 
> We covered this previously, I'll just be giving the same answers I did
> before:

Your answers have shown your insight into tracing is very limited. I
have a clear recollection there were many suggestions on how to get what
you need and willingness to help out. Repeating your previous position
will not help much to be honest with you.

> > - This is a big change and it adds a significant maintenance burden
> >   because each allocation entry point needs to be handled specifically.
> >   The cost will grow with the intended coverage especially there when
> >   allocation is hidden in a library code.
> 
> We've made this as clean and simple as posssible: a single new macro
> invocation per allocation function, no calling convention changes (that
> would indeed have been a lot of churn!)

That doesn't really make the concern any less relevant. I believe you
and Suren have made a great effort to reduce the churn as much as
possible but looking at the diffstat the code changes are clearly there
and you have to convince the rest of the community that this maintenance
overhead is really worth it. The above statement hasn't helped to
convinced me to be honest.

> > - It has been brought up that this is duplicating functionality already
> >   available via existing tracing infrastructure. You should make it very
> >   clear why that is not suitable for the job
> 
> Tracing people _claimed_ this, but never demonstrated it.

The burden is on you and Suren. You are proposing the implement an
alternative tracing infrastructure.

> Tracepoints
> exist but the tooling that would consume them to provide this kind of
> information does not exist;

Any reasons why an appropriate tooling cannot be developed?

> it would require maintaining an index of
> _every outstanding allocation_ so that frees could be accounted
> correctly - IOW, it would be _drastically_ higher overhead, so not at
> all comparable.

Do you have any actual data points to prove your claim?

> > - We already have page_owner infrastructure that provides allocation
> >   tracking data. Why it cannot be used/extended?
> 
> Page owner is also very high overhead,

Is there any data to prove that claim? I would be really surprised that
page_owner would give higher overhead than page tagging with profiling
enabled (there is an allocation for each allocation request!!!). We can
discuss the bare bone page tagging comparision to page_owner because of
the full stack unwinding but is that overhead really prohibitively costly?
Can we reduce that by trimming the unwinder information?

> and the output is not very user
> friendly (tracking full call stack means many related overhead gets
> split, not generally what you want), and it doesn't cover slab.

Is this something we cannot do anything about? Have you explored any
potential ways?

> This tracks _all_ memory allocations - slab, page, vmalloc, percpu.

-- 
Michal Hocko
SUSE Labs
