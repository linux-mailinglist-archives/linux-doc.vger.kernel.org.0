Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C09C722FA
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jul 2019 01:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbfGWX0T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Jul 2019 19:26:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41339 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726754AbfGWX0T (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Jul 2019 19:26:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4FB2485360;
        Tue, 23 Jul 2019 23:26:17 +0000 (UTC)
Received: from lorien.usersys.redhat.com (ovpn-116-134.phx2.redhat.com [10.3.116.134])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D294601B7;
        Tue, 23 Jul 2019 23:26:13 +0000 (UTC)
Date:   Tue, 23 Jul 2019 19:26:10 -0400
From:   Phil Auld <pauld@redhat.com>
To:     Dave Chiluk <chiluk+linux@indeed.com>
Cc:     Ben Segall <bsegall@google.com>, Peter Oskolkov <posk@posk.io>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Gregg <bgregg@netflix.com>,
        Kyle Anderson <kwa@yelp.com>,
        Gabriel Munos <gmunoz@netflix.com>,
        John Hammond <jhammond@indeed.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/1] sched/fair: Fix low cpu usage with high
 throttling by removing expiration of cpu-local slices
Message-ID: <20190723232609.GF2947@lorien.usersys.redhat.com>
References: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
 <1563900266-19734-1-git-send-email-chiluk+linux@indeed.com>
 <1563900266-19734-2-git-send-email-chiluk+linux@indeed.com>
 <20190723171307.GC2947@lorien.usersys.redhat.com>
 <CAC=E7cUUOfShgOWAhajVJsqxxMmyEPThd__xWqy2vdpF2xz4UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC=E7cUUOfShgOWAhajVJsqxxMmyEPThd__xWqy2vdpF2xz4UA@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 23 Jul 2019 23:26:17 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 23, 2019 at 05:12:18PM -0500 Dave Chiluk wrote:
> Thanks for all the help and testing you provided.  It's good to know
> these changes have passed at least some scheduler regression tests.
> If it comes to a v7 I'll add the Reviewed-by, otherwise I'll just let
> Peter add it.
>

Sounds good.

> Will you be handling the backport into the RHEL 8 kernels?  I'll
> submit this to Ubuntu and linux-stable once it gets accepted.
>

Yep.

> Thanks again,

Thank you :)


Cheers,
Phil

> 
> 
> On Tue, Jul 23, 2019 at 12:13 PM Phil Auld <pauld@redhat.com> wrote:
> >
> > Hi Dave,
> >
> > On Tue, Jul 23, 2019 at 11:44:26AM -0500 Dave Chiluk wrote:
> > > It has been observed, that highly-threaded, non-cpu-bound applications
> > > running under cpu.cfs_quota_us constraints can hit a high percentage of
> > > periods throttled while simultaneously not consuming the allocated
> > > amount of quota. This use case is typical of user-interactive non-cpu
> > > bound applications, such as those running in kubernetes or mesos when
> > > run on multiple cpu cores.
> > >
> > > This has been root caused to cpu-local run queue being allocated per cpu
> > > bandwidth slices, and then not fully using that slice within the period.
> > > At which point the slice and quota expires. This expiration of unused
> > > slice results in applications not being able to utilize the quota for
> > > which they are allocated.
> > >
> > > The non-expiration of per-cpu slices was recently fixed by
> > > 'commit 512ac999d275 ("sched/fair: Fix bandwidth timer clock drift
> > > condition")'. Prior to that it appears that this had been broken since
> > > at least 'commit 51f2176d74ac ("sched/fair: Fix unlocked reads of some
> > > cfs_b->quota/period")' which was introduced in v3.16-rc1 in 2014. That
> > > added the following conditional which resulted in slices never being
> > > expired.
> > >
> > > if (cfs_rq->runtime_expires != cfs_b->runtime_expires) {
> > >       /* extend local deadline, drift is bounded above by 2 ticks */
> > >       cfs_rq->runtime_expires += TICK_NSEC;
> > >
> > > Because this was broken for nearly 5 years, and has recently been fixed
> > > and is now being noticed by many users running kubernetes
> > > (https://github.com/kubernetes/kubernetes/issues/67577) it is my opinion
> > > that the mechanisms around expiring runtime should be removed
> > > altogether.
> > >
> > > This allows quota already allocated to per-cpu run-queues to live longer
> > > than the period boundary. This allows threads on runqueues that do not
> > > use much CPU to continue to use their remaining slice over a longer
> > > period of time than cpu.cfs_period_us. However, this helps prevent the
> > > above condition of hitting throttling while also not fully utilizing
> > > your cpu quota.
> > >
> > > This theoretically allows a machine to use slightly more than its
> > > allotted quota in some periods. This overflow would be bounded by the
> > > remaining quota left on each per-cpu runqueueu. This is typically no
> > > more than min_cfs_rq_runtime=1ms per cpu. For CPU bound tasks this will
> > > change nothing, as they should theoretically fully utilize all of their
> > > quota in each period. For user-interactive tasks as described above this
> > > provides a much better user/application experience as their cpu
> > > utilization will more closely match the amount they requested when they
> > > hit throttling. This means that cpu limits no longer strictly apply per
> > > period for non-cpu bound applications, but that they are still accurate
> > > over longer timeframes.
> > >
> > > This greatly improves performance of high-thread-count, non-cpu bound
> > > applications with low cfs_quota_us allocation on high-core-count
> > > machines. In the case of an artificial testcase (10ms/100ms of quota on
> > > 80 CPU machine), this commit resulted in almost 30x performance
> > > improvement, while still maintaining correct cpu quota restrictions.
> > > That testcase is available at https://github.com/indeedeng/fibtest.
> > >
> > > Fixes: 512ac999d275 ("sched/fair: Fix bandwidth timer clock drift condition")
> > > Signed-off-by: Dave Chiluk <chiluk+linux@indeed.com>
> > > Reviewed-by: Ben Segall <bsegall@google.com>
> >
> > This still works for me. The documentation reads pretty well, too. Good job.
> >
> > Feel free to add my Acked-by: or Reviewed-by: Phil Auld <pauld@redhat.com>.
> >
> > I'll run it through some more tests when I have time. The code is the same
> > as the earlier one I tested from what I can see.
> >
> > Cheers,
> > Phil
> >
> > > ---
> > >  Documentation/scheduler/sched-bwc.rst | 74 ++++++++++++++++++++++++++++-------
> > >  kernel/sched/fair.c                   | 72 ++++------------------------------
> > >  kernel/sched/sched.h                  |  4 --
> > >  3 files changed, 67 insertions(+), 83 deletions(-)
> > >
> > > diff --git a/Documentation/scheduler/sched-bwc.rst b/Documentation/scheduler/sched-bwc.rst
> > > index 3a90642..9801d6b 100644
> > > --- a/Documentation/scheduler/sched-bwc.rst
> > > +++ b/Documentation/scheduler/sched-bwc.rst
> > > @@ -9,15 +9,16 @@ CFS bandwidth control is a CONFIG_FAIR_GROUP_SCHED extension which allows the
> > >  specification of the maximum CPU bandwidth available to a group or hierarchy.
> > >
> > >  The bandwidth allowed for a group is specified using a quota and period. Within
> > > -each given "period" (microseconds), a group is allowed to consume only up to
> > > -"quota" microseconds of CPU time.  When the CPU bandwidth consumption of a
> > > -group exceeds this limit (for that period), the tasks belonging to its
> > > -hierarchy will be throttled and are not allowed to run again until the next
> > > -period.
> > > -
> > > -A group's unused runtime is globally tracked, being refreshed with quota units
> > > -above at each period boundary.  As threads consume this bandwidth it is
> > > -transferred to cpu-local "silos" on a demand basis.  The amount transferred
> > > +each given "period" (microseconds), a task group is allocated up to "quota"
> > > +microseconds of CPU time. That quota is assigned to per-cpu run queues in
> > > +slices as threads in the cgroup become runnable. Once all quota has been
> > > +assigned any additional requests for quota will result in those threads being
> > > +throttled. Throttled threads will not be able to run again until the next
> > > +period when the quota is replenished.
> > > +
> > > +A group's unassigned quota is globally tracked, being refreshed back to
> > > +cfs_quota units at each period boundary. As threads consume this bandwidth it
> > > +is transferred to cpu-local "silos" on a demand basis. The amount transferred
> > >  within each of these updates is tunable and described as the "slice".
> > >
> > >  Management
> > > @@ -35,12 +36,12 @@ The default values are::
> > >
> > >  A value of -1 for cpu.cfs_quota_us indicates that the group does not have any
> > >  bandwidth restriction in place, such a group is described as an unconstrained
> > > -bandwidth group.  This represents the traditional work-conserving behavior for
> > > +bandwidth group. This represents the traditional work-conserving behavior for
> > >  CFS.
> > >
> > >  Writing any (valid) positive value(s) will enact the specified bandwidth limit.
> > > -The minimum quota allowed for the quota or period is 1ms.  There is also an
> > > -upper bound on the period length of 1s.  Additional restrictions exist when
> > > +The minimum quota allowed for the quota or period is 1ms. There is also an
> > > +upper bound on the period length of 1s. Additional restrictions exist when
> > >  bandwidth limits are used in a hierarchical fashion, these are explained in
> > >  more detail below.
> > >
> > > @@ -53,8 +54,8 @@ unthrottled if it is in a constrained state.
> > >  System wide settings
> > >  --------------------
> > >  For efficiency run-time is transferred between the global pool and CPU local
> > > -"silos" in a batch fashion.  This greatly reduces global accounting pressure
> > > -on large systems.  The amount transferred each time such an update is required
> > > +"silos" in a batch fashion. This greatly reduces global accounting pressure
> > > +on large systems. The amount transferred each time such an update is required
> > >  is described as the "slice".
> > >
> > >  This is tunable via procfs::
> > > @@ -97,6 +98,51 @@ There are two ways in which a group may become throttled:
> > >  In case b) above, even though the child may have runtime remaining it will not
> > >  be allowed to until the parent's runtime is refreshed.
> > >
> > > +CFS Bandwidth Quota Caveats
> > > +---------------------------
> > > +Once a slice is assigned to a cpu it does not expire.  However all but 1ms of
> > > +the slice may be returned to the global pool if all threads on that cpu become
> > > +unrunnable. This is configured at compile time by the min_cfs_rq_runtime
> > > +variable. This is a performance tweak that helps prevent added contention on
> > > +the global lock.
> > > +
> > > +The fact that cpu-local slices do not expire results in some interesting corner
> > > +cases that should be understood.
> > > +
> > > +For cgroup cpu constrained applications that are cpu limited this is a
> > > +relatively moot point because they will naturally consume the entirety of their
> > > +quota as well as the entirety of each cpu-local slice in each period. As a
> > > +result it is expected that nr_periods roughly equal nr_throttled, and that
> > > +cpuacct.usage will increase roughly equal to cfs_quota_us in each period.
> > > +
> > > +For highly-threaded, non-cpu bound applications this non-expiration nuance
> > > +allows applications to briefly burst past their quota limits by the amount of
> > > +unused slice on each cpu that the task group is running on (typically at most
> > > +1ms per cpu or as defined by min_cfs_rq_runtime).  This slight burst only
> > > +applies if quota had been assigned to a cpu and then not fully used or returned
> > > +in previous periods. This burst amount will not be transferred between cores.
> > > +As a result, this mechanism still strictly limits the task group to quota
> > > +average usage, albeit over a longer time window than a single period.  This
> > > +also limits the burst ability to no more than 1ms per cpu.  This provides
> > > +better more predictable user experience for highly threaded applications with
> > > +small quota limits on high core count machines. It also eliminates the
> > > +propensity to throttle these applications while simultanously using less than
> > > +quota amounts of cpu. Another way to say this, is that by allowing the unused
> > > +portion of a slice to remain valid across periods we have decreased the
> > > +possibility of wastefully expiring quota on cpu-local silos that don't need a
> > > +full slice's amount of cpu time.
> > > +
> > > +The interaction between cpu-bound and non-cpu-bound-interactive applications
> > > +should also be considered, especially when single core usage hits 100%. If you
> > > +gave each of these applications half of a cpu-core and they both got scheduled
> > > +on the same CPU it is theoretically possible that the non-cpu bound application
> > > +will use up to 1ms additional quota in some periods, thereby preventing the
> > > +cpu-bound application from fully using its quota by that same amount. In these
> > > +instances it will be up to the CFS algorithm (see sched-design-CFS.rst) to
> > > +decide which application is chosen to run, as they will both be runnable and
> > > +have remaining quota. This runtime discrepancy will be made up in the following
> > > +periods when the interactive application idles.
> > > +
> > >  Examples
> > >  --------
> > >  1. Limit a group to 1 CPU worth of runtime::
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 036be95..00b68f0 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -4316,8 +4316,6 @@ void __refill_cfs_bandwidth_runtime(struct cfs_bandwidth *cfs_b)
> > >
> > >       now = sched_clock_cpu(smp_processor_id());
> > >       cfs_b->runtime = cfs_b->quota;
> > > -     cfs_b->runtime_expires = now + ktime_to_ns(cfs_b->period);
> > > -     cfs_b->expires_seq++;
> > >  }
> > >
> > >  static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
> > > @@ -4339,8 +4337,7 @@ static int assign_cfs_rq_runtime(struct cfs_rq *cfs_rq)
> > >  {
> > >       struct task_group *tg = cfs_rq->tg;
> > >       struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(tg);
> > > -     u64 amount = 0, min_amount, expires;
> > > -     int expires_seq;
> > > +     u64 amount = 0, min_amount;
> > >
> > >       /* note: this is a positive sum as runtime_remaining <= 0 */
> > >       min_amount = sched_cfs_bandwidth_slice() - cfs_rq->runtime_remaining;
> > > @@ -4357,61 +4354,17 @@ static int assign_cfs_rq_runtime(struct cfs_rq *cfs_rq)
> > >                       cfs_b->idle = 0;
> > >               }
> > >       }
> > > -     expires_seq = cfs_b->expires_seq;
> > > -     expires = cfs_b->runtime_expires;
> > >       raw_spin_unlock(&cfs_b->lock);
> > >
> > >       cfs_rq->runtime_remaining += amount;
> > > -     /*
> > > -      * we may have advanced our local expiration to account for allowed
> > > -      * spread between our sched_clock and the one on which runtime was
> > > -      * issued.
> > > -      */
> > > -     if (cfs_rq->expires_seq != expires_seq) {
> > > -             cfs_rq->expires_seq = expires_seq;
> > > -             cfs_rq->runtime_expires = expires;
> > > -     }
> > >
> > >       return cfs_rq->runtime_remaining > 0;
> > >  }
> > >
> > > -/*
> > > - * Note: This depends on the synchronization provided by sched_clock and the
> > > - * fact that rq->clock snapshots this value.
> > > - */
> > > -static void expire_cfs_rq_runtime(struct cfs_rq *cfs_rq)
> > > -{
> > > -     struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
> > > -
> > > -     /* if the deadline is ahead of our clock, nothing to do */
> > > -     if (likely((s64)(rq_clock(rq_of(cfs_rq)) - cfs_rq->runtime_expires) < 0))
> > > -             return;
> > > -
> > > -     if (cfs_rq->runtime_remaining < 0)
> > > -             return;
> > > -
> > > -     /*
> > > -      * If the local deadline has passed we have to consider the
> > > -      * possibility that our sched_clock is 'fast' and the global deadline
> > > -      * has not truly expired.
> > > -      *
> > > -      * Fortunately we can check determine whether this the case by checking
> > > -      * whether the global deadline(cfs_b->expires_seq) has advanced.
> > > -      */
> > > -     if (cfs_rq->expires_seq == cfs_b->expires_seq) {
> > > -             /* extend local deadline, drift is bounded above by 2 ticks */
> > > -             cfs_rq->runtime_expires += TICK_NSEC;
> > > -     } else {
> > > -             /* global deadline is ahead, expiration has passed */
> > > -             cfs_rq->runtime_remaining = 0;
> > > -     }
> > > -}
> > > -
> > >  static void __account_cfs_rq_runtime(struct cfs_rq *cfs_rq, u64 delta_exec)
> > >  {
> > >       /* dock delta_exec before expiring quota (as it could span periods) */
> > >       cfs_rq->runtime_remaining -= delta_exec;
> > > -     expire_cfs_rq_runtime(cfs_rq);
> > >
> > >       if (likely(cfs_rq->runtime_remaining > 0))
> > >               return;
> > > @@ -4602,8 +4555,7 @@ void unthrottle_cfs_rq(struct cfs_rq *cfs_rq)
> > >               resched_curr(rq);
> > >  }
> > >
> > > -static u64 distribute_cfs_runtime(struct cfs_bandwidth *cfs_b,
> > > -             u64 remaining, u64 expires)
> > > +static u64 distribute_cfs_runtime(struct cfs_bandwidth *cfs_b, u64 remaining)
> > >  {
> > >       struct cfs_rq *cfs_rq;
> > >       u64 runtime;
> > > @@ -4625,7 +4577,6 @@ static u64 distribute_cfs_runtime(struct cfs_bandwidth *cfs_b,
> > >               remaining -= runtime;
> > >
> > >               cfs_rq->runtime_remaining += runtime;
> > > -             cfs_rq->runtime_expires = expires;
> > >
> > >               /* we check whether we're throttled above */
> > >               if (cfs_rq->runtime_remaining > 0)
> > > @@ -4650,7 +4601,7 @@ static u64 distribute_cfs_runtime(struct cfs_bandwidth *cfs_b,
> > >   */
> > >  static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun, unsigned long flags)
> > >  {
> > > -     u64 runtime, runtime_expires;
> > > +     u64 runtime;
> > >       int throttled;
> > >
> > >       /* no need to continue the timer with no bandwidth constraint */
> > > @@ -4678,8 +4629,6 @@ static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun, u
> > >       /* account preceding periods in which throttling occurred */
> > >       cfs_b->nr_throttled += overrun;
> > >
> > > -     runtime_expires = cfs_b->runtime_expires;
> > > -
> > >       /*
> > >        * This check is repeated as we are holding onto the new bandwidth while
> > >        * we unthrottle. This can potentially race with an unthrottled group
> > > @@ -4692,8 +4641,7 @@ static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun, u
> > >               cfs_b->distribute_running = 1;
> > >               raw_spin_unlock_irqrestore(&cfs_b->lock, flags);
> > >               /* we can't nest cfs_b->lock while distributing bandwidth */
> > > -             runtime = distribute_cfs_runtime(cfs_b, runtime,
> > > -                                              runtime_expires);
> > > +             runtime = distribute_cfs_runtime(cfs_b, runtime);
> > >               raw_spin_lock_irqsave(&cfs_b->lock, flags);
> > >
> > >               cfs_b->distribute_running = 0;
> > > @@ -4775,8 +4723,7 @@ static void __return_cfs_rq_runtime(struct cfs_rq *cfs_rq)
> > >               return;
> > >
> > >       raw_spin_lock(&cfs_b->lock);
> > > -     if (cfs_b->quota != RUNTIME_INF &&
> > > -         cfs_rq->runtime_expires == cfs_b->runtime_expires) {
> > > +     if (cfs_b->quota != RUNTIME_INF) {
> > >               cfs_b->runtime += slack_runtime;
> > >
> > >               /* we are under rq->lock, defer unthrottling using a timer */
> > > @@ -4809,7 +4756,6 @@ static void do_sched_cfs_slack_timer(struct cfs_bandwidth *cfs_b)
> > >  {
> > >       u64 runtime = 0, slice = sched_cfs_bandwidth_slice();
> > >       unsigned long flags;
> > > -     u64 expires;
> > >
> > >       /* confirm we're still not at a refresh boundary */
> > >       raw_spin_lock_irqsave(&cfs_b->lock, flags);
> > > @@ -4827,7 +4773,6 @@ static void do_sched_cfs_slack_timer(struct cfs_bandwidth *cfs_b)
> > >       if (cfs_b->quota != RUNTIME_INF && cfs_b->runtime > slice)
> > >               runtime = cfs_b->runtime;
> > >
> > > -     expires = cfs_b->runtime_expires;
> > >       if (runtime)
> > >               cfs_b->distribute_running = 1;
> > >
> > > @@ -4836,11 +4781,10 @@ static void do_sched_cfs_slack_timer(struct cfs_bandwidth *cfs_b)
> > >       if (!runtime)
> > >               return;
> > >
> > > -     runtime = distribute_cfs_runtime(cfs_b, runtime, expires);
> > > +     runtime = distribute_cfs_runtime(cfs_b, runtime);
> > >
> > >       raw_spin_lock_irqsave(&cfs_b->lock, flags);
> > > -     if (expires == cfs_b->runtime_expires)
> > > -             lsub_positive(&cfs_b->runtime, runtime);
> > > +     lsub_positive(&cfs_b->runtime, runtime);
> > >       cfs_b->distribute_running = 0;
> > >       raw_spin_unlock_irqrestore(&cfs_b->lock, flags);
> > >  }
> > > @@ -4997,8 +4941,6 @@ void start_cfs_bandwidth(struct cfs_bandwidth *cfs_b)
> > >
> > >       cfs_b->period_active = 1;
> > >       overrun = hrtimer_forward_now(&cfs_b->period_timer, cfs_b->period);
> > > -     cfs_b->runtime_expires += (overrun + 1) * ktime_to_ns(cfs_b->period);
> > > -     cfs_b->expires_seq++;
> > >       hrtimer_start_expires(&cfs_b->period_timer, HRTIMER_MODE_ABS_PINNED);
> > >  }
> > >
> > > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > > index 802b1f3..28c16e9 100644
> > > --- a/kernel/sched/sched.h
> > > +++ b/kernel/sched/sched.h
> > > @@ -335,8 +335,6 @@ struct cfs_bandwidth {
> > >       u64                     quota;
> > >       u64                     runtime;
> > >       s64                     hierarchical_quota;
> > > -     u64                     runtime_expires;
> > > -     int                     expires_seq;
> > >
> > >       u8                      idle;
> > >       u8                      period_active;
> > > @@ -556,8 +554,6 @@ struct cfs_rq {
> > >
> > >  #ifdef CONFIG_CFS_BANDWIDTH
> > >       int                     runtime_enabled;
> > > -     int                     expires_seq;
> > > -     u64                     runtime_expires;
> > >       s64                     runtime_remaining;
> > >
> > >       u64                     throttled_clock;
> > > --
> > > 1.8.3.1
> > >
> >
> > --

-- 
