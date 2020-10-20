Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813A5281EF1
	for <lists+linux-doc@lfdr.de>; Sat,  3 Oct 2020 01:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgJBXPD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Oct 2020 19:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJBXPD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 19:15:03 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206D4C0613D0
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 16:15:03 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id d197so3317333iof.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 16:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YfdsfR+vxnsAijYLXa6tOfA8KqdB4WmlnZuQhX/Ct4U=;
        b=saZdfCSzMzpYeJMISnJ7OJgpgSkR3+dgqgr4x7aqFlkgmCFEB5WQMLMXbvty5IZrfL
         oGcm1OkS3ioUuJSCsT6K3mKOgLMbujc0eMb/GgU34MS2ynpi0gTY74sS2EGavQ4LW9sv
         hS7nfUFrE/cHESWXEEih7Al6VHHM86PkPAX/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YfdsfR+vxnsAijYLXa6tOfA8KqdB4WmlnZuQhX/Ct4U=;
        b=pc5E3NaD+tnhtAIQqWdGdygTH24oqU/WfjVRu19GgYPjQ/KUC2WpXafGdNd94y24mH
         erEoRFek8XEqkvFfJUyDwBmDCb5mWUcPg0KRHWVgK0mJfKzyLkNY8Yh2X3ND62G8/0wf
         H4yMlrb0FmlgGY5YT4cp3OmXJfkrw/TZ2lZpjcRaLb64pNW+HwUHCgfGPsZ/dn/FWcz7
         tLDx90B/q+Co3u433B8GvC0zXDLPDEKceqXCxWAa4iZB8LBp3Jhu479/QoQi8XI2p5KC
         0MADoECMI55JxmCOm8kENFltB6CwVXEE1PPcxH4yZhmBwVxfgh5DGHmVc1aPaXd4Z0xx
         vCvw==
X-Gm-Message-State: AOAM531Ze+I3qSyUeXV/3kbByNDxacG5qzcXucCzKCj3U2z9aRgPUVro
        gdxoxivYiJHLikB0Nj3tziBcvlXPc00nd4QXGlEre4+a5XU=
X-Google-Smtp-Source: ABdhPJzI3tVlu8aSdAJm7W9AygkHAmLMflTi68aK8h4yRkfUXN/4nhsLC04yylzq/scPxqwON/RaPiy4CQkoxK+Fepw=
X-Received: by 2002:a5d:80d6:: with SMTP id h22mr3677082ior.154.1601680502289;
 Fri, 02 Oct 2020 16:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200929192928.3749502-1-joel@joelfernandes.org>
 <20200929192928.3749502-2-joel@joelfernandes.org> <20200929193248.GA3749988@google.com>
 <20201002193412.GJ29330@paulmck-ThinkPad-P72>
In-Reply-To: <20201002193412.GJ29330@paulmck-ThinkPad-P72>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Fri, 2 Oct 2020 19:14:49 -0400
Message-ID: <CAEXW_YR=2K_E24k9BNXwEhuNCawaH8kQUPtMrx-xkmd+hjVzMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: Update RCU's hotplug requirements with a bit
 about design
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        rcu <rcu@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 2, 2020 at 3:34 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Tue, Sep 29, 2020 at 03:32:48PM -0400, Joel Fernandes wrote:
> > Hi Paul,
> >
> > On Tue, Sep 29, 2020 at 03:29:28PM -0400, Joel Fernandes (Google) wrote:
> > > RCU's hotplug design will help understand the requirements an RCU
> > > implementation needs to fullfill, such as dead-lock avoidance.
> > >
> > > The rcu_barrier() section of the "Hotplug CPU" section already talks
> > > about deadlocks, however the description of what else can deadlock other
> > > than rcu_barrier is rather incomplete.
> > >
> > > This commit therefore continues the section by describing how RCU's
> > > design handles CPU hotplug in a deadlock-free way.
> > >
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > ---
> > >  .../RCU/Design/Requirements/Requirements.rst  | 30 +++++++++++++++++--
> > >  1 file changed, 28 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
> > > index 1ae79a10a8de..e0413aa989dd 100644
> > > --- a/Documentation/RCU/Design/Requirements/Requirements.rst
> > > +++ b/Documentation/RCU/Design/Requirements/Requirements.rst
> > > @@ -1929,8 +1929,10 @@ The Linux-kernel CPU-hotplug implementation has notifiers that are used
> > >  to allow the various kernel subsystems (including RCU) to respond
> > >  appropriately to a given CPU-hotplug operation. Most RCU operations may
> > >  be invoked from CPU-hotplug notifiers, including even synchronous
> > > -grace-period operations such as ``synchronize_rcu()`` and
> > > -``synchronize_rcu_expedited()``.
> > > +grace-period operations such as. However, the synchronous variants
> > > +(``synchronize_rcu()`` and ``synchronize_rcu_expedited()``) should not
> > > +from notifiers that execute via ``stop_machine()`` -- specifically those
> >
> > The "should not from notifiers" should be "should not be used from
> > notifiers" here. Sorry and hope you can fix it up.
>
> Thank you, and queued for further review.  How does the below look
> for a general fixup?

Looks great, thanks!

 -Joel



>
>                                                 Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit a93716177eeac726037828b28e6b1a45e828688a
> Author: Joel Fernandes (Google) <joel@joelfernandes.org>
> Date:   Tue Sep 29 15:29:28 2020 -0400
>
>     docs: Update RCU's hotplug requirements with a bit about design
>
>     The rcu_barrier() section of the "Hotplug CPU" section discusses
>     deadlocks, however the description of deadlocks other than those involving
>     rcu_barrier() is rather incomplete.
>
>     This commit therefore continues the section by describing how RCU's
>     design handles CPU hotplug in a deadlock-free way.
>
>     Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>
> diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
> index 1ae79a1..98557fe 100644
> --- a/Documentation/RCU/Design/Requirements/Requirements.rst
> +++ b/Documentation/RCU/Design/Requirements/Requirements.rst
> @@ -1929,16 +1929,45 @@ The Linux-kernel CPU-hotplug implementation has notifiers that are used
>  to allow the various kernel subsystems (including RCU) to respond
>  appropriately to a given CPU-hotplug operation. Most RCU operations may
>  be invoked from CPU-hotplug notifiers, including even synchronous
> -grace-period operations such as ``synchronize_rcu()`` and
> -``synchronize_rcu_expedited()``.
> -
> -However, all-callback-wait operations such as ``rcu_barrier()`` are also
> -not supported, due to the fact that there are phases of CPU-hotplug
> -operations where the outgoing CPU's callbacks will not be invoked until
> -after the CPU-hotplug operation ends, which could also result in
> -deadlock. Furthermore, ``rcu_barrier()`` blocks CPU-hotplug operations
> -during its execution, which results in another type of deadlock when
> -invoked from a CPU-hotplug notifier.
> +grace-period operations such as (``synchronize_rcu()`` and
> +``synchronize_rcu_expedited()``).  However, these synchronous operations
> +do block and therefore cannot be invoked from notifiers that execute via
> +``stop_machine()``, specifically those between the ``CPUHP_AP_OFFLINE``
> +and ``CPUHP_AP_ONLINE`` states.
> +
> +In addition, all-callback-wait operations such as ``rcu_barrier()`` may
> +not be invoked from any CPU-hotplug notifier.  This restriction is due
> +to the fact that there are phases of CPU-hotplug operations where the
> +outgoing CPU's callbacks will not be invoked until after the CPU-hotplug
> +operation ends, which could also result in deadlock. Furthermore,
> +``rcu_barrier()`` blocks CPU-hotplug operations during its execution,
> +which results in another type of deadlock when invoked from a CPU-hotplug
> +notifier.
> +
> +Finally, RCU must avoid deadlocks due to interaction between hotplug,
> +timers and grace period processing. It does so by maintaining its own set
> +of books that duplicate the centrally maintained ``cpu_online_mask``,
> +and also by reporting quiescent states explictly when a CPU goes
> +offline.  This explicit reporting of quiescent states avoids any need
> +for the force-quiescent-state loop (FQS) to report quiescent states for
> +offline CPUs.  However, as a debugging measure, the FQS loop does splat
> +if offline CPUs block an RCU grace period for too long.
> +
> +An offline CPU's quiescent state will be reported either:
> +1.  As the CPU goes offline using RCU's hotplug notifier (``rcu_report_dead()``).
> +2.  When grace period initialization (``rcu_gp_init()``) detects a
> +    race either with CPU offlining or with a task unblocking on a leaf
> +    ``rcu_node`` structure whose CPUs are all offline.
> +
> +The CPU-online path (``rcu_cpu_starting()``) should never need to report
> +a quiescent state for an offline CPU.  However, as a debugging measure,
> +it does emit a warning if a quiescent state was not already reported
> +for that CPU.
> +
> +During the checking/modification of RCU's hotplug bookkeeping, the
> +corresponding CPU's leaf node lock is held. This avoids race conditions
> +between RCU's hotplug notifier hooks, the grace period initialization
> +code, and the FQS loop, all of which refer to or modify this bookkeeping.
>
>  Scheduler and RCU
>  ~~~~~~~~~~~~~~~~~
