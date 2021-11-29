Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9E7461FEA
	for <lists+linux-doc@lfdr.de>; Mon, 29 Nov 2021 20:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238160AbhK2TNS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Nov 2021 14:13:18 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37616 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbhK2TLM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Nov 2021 14:11:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3E326B815C3;
        Mon, 29 Nov 2021 19:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE76AC53FC7;
        Mon, 29 Nov 2021 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638212871;
        bh=UGVyIY2zjpTauDswt/GV6m6Vp4apDdtw270zo6gW2PU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=M/uzRa+SD43tNKMRr4/t5K/rZVPY4elhSSOZ9/vajgAO0ZKCRB0PG6Tqio0ybvlXF
         F/ZmmrdWZKqLAi2LDIYXdT5Y+bKoyRDALacegVQJwYRf82UDGKBM7PyO76KRhvdvzf
         b9wLgNKVD5Ro0mH0BRlhZb6WdDIYQfTxYjk16q2IQP13KH9kBJMvbQUr6ksxGdEFIN
         iguyOvJ99UUZfuZgB3gLCPCJQbilVtEmKEafS9vhJe94TJd8ttMPptc6KNHu7ilXp9
         keLq56DsVG5Zv2Wdtl9x+NntIL4kdR8JEdVUmx+Yp3D7GzWDzvkc67NBUhbvOqqck2
         evlv9OCq4HBlw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id A1ADA5C0E4D; Mon, 29 Nov 2021 11:07:51 -0800 (PST)
Date:   Mon, 29 Nov 2021 11:07:51 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Martin Lau <kafai@fb.com>, Steven Rostedt <rostedt@goodmis.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-doc@vger.kernel.org, "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Joerg Roedel <jroedel@suse.de>, rcu@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>, kernelci@groups.io,
        Joel Fernandes <joel@joelfernandes.org>,
        linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: next/master bisection: baseline.dmesg.alert on
 qemu_arm64-virt-gicv3
Message-ID: <20211129190751.GM641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <61a14e72.1c69fb81.a607d.66fb@mx.google.com>
 <42cba265-2616-9382-324f-11718c8dca0c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42cba265-2616-9382-324f-11718c8dca0c@collabora.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 29, 2021 at 06:50:01PM +0000, Guillaume Tucker wrote:
> Hi Paul,
> 
> Please see the bisection report below about a new kernel alert
> message.
> 
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
> 
> Some more details can be found here:
> 
>   https://linux.kernelci.org/test/case/id/61a4f02ad5a9e3a5f218f6f6/
> 
> The bisection was run on QEMU but it seems to appear on all
> platforms as it's not an architecture-specific change.
> Presumably, none of the platforms in KernelCI is setting a value
> for rcu_task_enqueue_lim at the moment.
> 
> Alert messages normally highlight potential problems, so ideally
> they would need to be resolved.  Should the message in this case
> really be a pr_alert(), and if so what would be the recommended
> way to avoid it?

It is to be unconditionally printed, so I am queueing a fixup that
downgrades it to pr_info().  Does that work for you?

							Thanx, Paul

> Best wishes,
> Guillaume
> 
> 
> GitHub: https://github.com/kernelci/kernelci-project/issues/78
> 
> On 26/11/2021 21:15, kernelci.org bot wrote:
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> > * This automated bisection report was sent to you on the basis  *
> > * that you may be involved with the breaking commit it has      *
> > * found.  No manual investigation has been done to verify it,   *
> > * and the root cause of the problem may be somewhere else.      *
> > *                                                               *
> > * If you do send a fix, please include this trailer:            *
> > *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> > *                                                               *
> > * Hope this helps!                                              *
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> > 
> > next/master bisection: baseline.dmesg.alert on qemu_arm64-virt-gicv3
> > 
> > Summary:
> >   Start:      f30a24ed97b40 Add linux-next specific files for 20211126
> >   Plain log:  https://storage.kernelci.org/next/master/next-20211126/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
> >   HTML log:   https://storage.kernelci.org/next/master/next-20211126/arm64/defconfig+CONFIG_ARM64_64K_PAGES=y/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
> >   Result:     dc9166f1253df rcu-tasks: Use more callback queues if contention encountered
> > 
> > Checks:
> >   revert:     PASS
> >   verify:     PASS
> > 
> > Parameters:
> >   Tree:       next
> >   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >   Branch:     master
> >   Target:     qemu_arm64-virt-gicv3
> >   CPU arch:   arm64
> >   Lab:        lab-collabora
> >   Compiler:   clang-13
> >   Config:     defconfig+CONFIG_ARM64_64K_PAGES=y
> >   Test case:  baseline.dmesg.alert
> > 
> > Breaking commit found:
> > 
> > -------------------------------------------------------------------------------
> > commit dc9166f1253df20e01b0132ece22efaeb5b0a7e0
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Wed Nov 24 15:12:15 2021 -0800
> > 
> >     rcu-tasks: Use more callback queues if contention encountered
> >     
> >     The rcupdate.rcu_task_enqueue_lim module parameter allows system
> >     administrators to tune the number of callback queues used by the RCU
> >     Tasks flavors.  However if callback storms are infrequent, it would
> >     be better to operate with a single queue on a given system unless and
> >     until that system actually needed more queues.  Systems not needing
> >     more queues can then avoid the overhead of checking the extra queues
> >     and especially avoid the overhead of fanning workqueue handlers out to
> >     all CPUs to invoke callbacks.
> >     
> >     This commit therefore switches to using all the CPUs' callback queues if
> >     call_rcu_tasks_generic() encounters too much lock contention.  The amount
> >     of lock contention to tolerate defaults to 100 contended lock acquisitions
> >     per jiffy, and can be adjusted using the new rcupdate.rcu_task_contend_lim
> >     module parameter.
> >     
> >     Such switching is undertaken only if the rcupdate.rcu_task_enqueue_lim
> >     module parameter is negative, which is its default value (-1).
> >     This allows savvy systems administrators to set the number of queues
> >     to some known good value and to not have to worry about the kernel doing
> >     any second guessing.
> >     
> >     Reported-by: Martin Lau <kafai@fb.com>
> >     Cc: Neeraj Upadhyay <neeraj.iitr10@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index f1f3761fe42c8..fc5e20afaeefa 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -4813,6 +4813,14 @@
> >  			period to instead use normal non-expedited
> >  			grace-period processing.
> >  
> > +	rcupdate.rcu_task_contend_lim= [KNL]
> > +			Set the minimum number of callback-queuing-time
> > +			lock-contention events per jiffy required to
> > +			cause the RCU Tasks flavors to switch to per-CPU
> > +			callback queuing.  This switching only occurs
> > +			when rcupdate.rcu_task_enqueue_lim is set to
> > +			the default value of -1.
> > +
> >  	rcupdate.rcu_task_enqueue_lim= [KNL]
> >  			Set the number of callback queues to use for the
> >  			RCU Tasks family of RCU flavors.  The default
> > diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
> > index 0cb20e5b3e856..7da3b500fb901 100644
> > --- a/kernel/rcu/tasks.h
> > +++ b/kernel/rcu/tasks.h
> > @@ -142,6 +142,10 @@ module_param(rcu_task_stall_timeout, int, 0644);
> >  static int rcu_task_enqueue_lim __read_mostly = -1;
> >  module_param(rcu_task_enqueue_lim, int, 0444);
> >  
> > +static bool rcu_task_cb_adjust;
> > +static int rcu_task_contend_lim __read_mostly = 100;
> > +module_param(rcu_task_contend_lim, int, 0444);
> > +
> >  /* RCU tasks grace-period state for debugging. */
> >  #define RTGS_INIT		 0
> >  #define RTGS_WAIT_WAIT_CBS	 1
> > @@ -207,8 +211,11 @@ static void cblist_init_generic(struct rcu_tasks *rtp)
> >  	int lim;
> >  
> >  	raw_spin_lock_irqsave(&rtp->cbs_gbl_lock, flags);
> > -	if (rcu_task_enqueue_lim < 0)
> > -		rcu_task_enqueue_lim = nr_cpu_ids;
> > +	if (rcu_task_enqueue_lim < 0) {
> > +		rcu_task_enqueue_lim = 1;
> > +		rcu_task_cb_adjust = true;
> > +		pr_alert("%s: Setting adjustable number of callback queues.\n", __func__);
> > +	}
> >  	else if (rcu_task_enqueue_lim == 0)
> >  		rcu_task_enqueue_lim = 1;
> >  	lim = rcu_task_enqueue_lim;
> > @@ -251,6 +258,7 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
> >  {
> >  	unsigned long flags;
> >  	unsigned long j;
> > +	bool needadjust = false;
> >  	bool needwake;
> >  	struct rcu_tasks_percpu *rtpcp;
> >  
> > @@ -266,7 +274,9 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
> >  			rtpcp->rtp_jiffies = j;
> >  			rtpcp->rtp_n_lock_retries = 0;
> >  		}
> > -		rtpcp->rtp_n_lock_retries++;
> > +		if (rcu_task_cb_adjust && ++rtpcp->rtp_n_lock_retries > rcu_task_contend_lim &&
> > +		    READ_ONCE(rtp->percpu_enqueue_lim) != nr_cpu_ids)
> > +			needadjust = true;  // Defer adjustment to avoid deadlock.
> >  	}
> >  	if (!rcu_segcblist_is_enabled(&rtpcp->cblist)) {
> >  		raw_spin_unlock_rcu_node(rtpcp); // irqs remain disabled.
> > @@ -276,6 +286,15 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
> >  	needwake = rcu_segcblist_empty(&rtpcp->cblist);
> >  	rcu_segcblist_enqueue(&rtpcp->cblist, rhp);
> >  	raw_spin_unlock_irqrestore_rcu_node(rtpcp, flags);
> > +	if (unlikely(needadjust)) {
> > +		raw_spin_lock_irqsave(&rtp->cbs_gbl_lock, flags);
> > +		if (rtp->percpu_enqueue_lim != nr_cpu_ids) {
> > +			WRITE_ONCE(rtp->percpu_enqueue_shift, ilog2(nr_cpu_ids));
> > +			smp_store_release(&rtp->percpu_enqueue_lim, nr_cpu_ids);
> > +			pr_alert("Switching %s to per-CPU callback queuing.\n", rtp->name);
> > +		}
> > +		raw_spin_unlock_irqrestore(&rtp->cbs_gbl_lock, flags);
> > +	}
> >  	/* We can't create the thread unless interrupts are enabled. */
> >  	if (needwake && READ_ONCE(rtp->kthread_ptr)) {
> >  		irq_work_queue(&rtpcp->rtp_irq_work);
> > -------------------------------------------------------------------------------
> > 
> > 
> > Git bisection log:
> > 
> > -------------------------------------------------------------------------------
> > git bisect start
> > # good: [8ced7ca3570333998ad2088d5a6275701970e28e] Merge tag 'block-5.16-2021-11-25' of git://git.kernel.dk/linux-block
> > git bisect good 8ced7ca3570333998ad2088d5a6275701970e28e
> > # bad: [f30a24ed97b401416118756fa35fbe5d28f999e3] Add linux-next specific files for 20211126
> > git bisect bad f30a24ed97b401416118756fa35fbe5d28f999e3
> > # good: [d7359ce68f20102beeec57e760b746e1f76ab65c] Merge branch 'mtd/next' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
> > git bisect good d7359ce68f20102beeec57e760b746e1f76ab65c
> > # good: [6eb0c6fb36d50e66ca0b686ec0eebd7eddff811b] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
> > git bisect good 6eb0c6fb36d50e66ca0b686ec0eebd7eddff811b
> > # bad: [e62c6fa2d7d055d657c00734314d6abc664d28b5] Merge branch 'staging-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> > git bisect bad e62c6fa2d7d055d657c00734314d6abc664d28b5
> > # good: [0ebaaa3b9daaf0341c75a66b8b33399e23e40a8f] Merge branch 'edac-for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
> > git bisect good 0ebaaa3b9daaf0341c75a66b8b33399e23e40a8f
> > # bad: [556fc834ce0be2f0dbfd8ae2bfb3840326d12cb9] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> > git bisect bad 556fc834ce0be2f0dbfd8ae2bfb3840326d12cb9
> > # good: [ad3b4071d577f2779c706a22956b6d167710459b] refscale: Simplify the errexit checkpoint
> > git bisect good ad3b4071d577f2779c706a22956b6d167710459b
> > # good: [24f474cf45326225f613b58b191600311109695b] rcutorture: Cause TREE02 and TREE10 scenarios to do more callback flooding
> > git bisect good 24f474cf45326225f613b58b191600311109695b
> > # bad: [731f2830b96ce040e52b227346087e0dc3a6f5d0] Merge branch 'linux-next' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
> > git bisect bad 731f2830b96ce040e52b227346087e0dc3a6f5d0
> > # bad: [3a528960b4b5d4069e4b066a1d9278862e902abc] Merge branch 'rcu/next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
> > git bisect bad 3a528960b4b5d4069e4b066a1d9278862e902abc
> > # bad: [a106e93308b6c60944c9021fc2cad377639584a2] rcu/nocb: Remove rdp from nocb list when de-offloaded
> > git bisect bad a106e93308b6c60944c9021fc2cad377639584a2
> > # good: [a3d09240cbfd98525dbd7038a4ec1afb4bc896a2] rcu-tasks: Avoid raw-spinlocked wakeups from call_rcu_tasks_generic()
> > git bisect good a3d09240cbfd98525dbd7038a4ec1afb4bc896a2
> > # bad: [4e83e8074d198b5849926d4a7d921063b24c0250] rcutorture: Test RCU Tasks lock-contention detection
> > git bisect bad 4e83e8074d198b5849926d4a7d921063b24c0250
> > # bad: [dc9166f1253df20e01b0132ece22efaeb5b0a7e0] rcu-tasks: Use more callback queues if contention encountered
> > git bisect bad dc9166f1253df20e01b0132ece22efaeb5b0a7e0
> > # first bad commit: [dc9166f1253df20e01b0132ece22efaeb5b0a7e0] rcu-tasks: Use more callback queues if contention encountered
> > -------------------------------------------------------------------------------
> > 
> 
