Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EF7240F7E
	for <lists+linux-doc@lfdr.de>; Mon, 10 Aug 2020 21:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbgHJTWj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Aug 2020 15:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729311AbgHJTWi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Aug 2020 15:22:38 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC125C061787
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2020 12:22:37 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id y11so4801721qvl.4
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2020 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WwZk/jQSrhtFMjtWr1S/O6qX6d5wxDfE1OWHLpSfbPk=;
        b=H6dVBdBPnzC61+O+TCCIWE9zqW6owuKWHNwRDQthVrmZTQvA2wyarfe0fTz2XFbpiw
         B3vHHEKOSy1heF69daoHQwsYZH4hP1ffC95Pnq8Korv5X7BB3NhveF8VswqaL44Ph407
         F4zcPEzbHeRiLrDnx+eo2cOFUgGFZUillep6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WwZk/jQSrhtFMjtWr1S/O6qX6d5wxDfE1OWHLpSfbPk=;
        b=kRVJbwFbiR8MdoAro+Tr7tzo+D1t+NhBqZTi07vtsoA/J1RNs3epKNzCWOFbdXRYTb
         Yl6iUDziESJGZLaiOIw84A1Tl5Dz0KjIHURSBMlXMghMxhdZFBCmb2sJkJmsNXkDVo8D
         fGnBugGG2gUcTFiZAGKNCUtPejZzvaKGp/85WXyR1ljS+MWpxNpYq2JEbc5Ck4IEXR3e
         xvUX/KoAJn8ECatxiK9okoN6ifpyWpXo0D9TpnlI+u74RNFa0q4KdQXqO0BSdj6c0tJ9
         gxD0lEgU5CXMySOOoVa2hNP68AxRGNtO8sWPP49G/Iy7LoakUe24TUgE92AivnLnHqfg
         1aew==
X-Gm-Message-State: AOAM530XnMqbxpkAtGs8aEjBB/7akJAGeATWLjLjkpZHwG4RmIY9b/ls
        rE4By9UB9iAYfw9s9NIyvO6VUQ==
X-Google-Smtp-Source: ABdhPJwwzKXkvlNB6D+Kk9LwCWohyX8lh0wLeySAiGQPzt79MU/gZuJptIns/UDduplhPRvBSSzoIQ==
X-Received: by 2002:a0c:e9c7:: with SMTP id q7mr30561935qvo.195.1597087355190;
        Mon, 10 Aug 2020 12:22:35 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:cad3:ffff:feb3:bd59])
        by smtp.gmail.com with ESMTPSA id 71sm15123021qkk.125.2020.08.10.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 12:22:34 -0700 (PDT)
Date:   Mon, 10 Aug 2020 15:22:34 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        neeraju@codeaurora.org, peterz@infradead.org,
        Randy Dunlap <rdunlap@infradead.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>, tglx@linutronix.de,
        vineethrp@gmail.com
Subject: Re: [PATCH v4 2/5] rcu/tree: Clarify comments about FQS loop
 reporting quiescent states
Message-ID: <20200810192234.GC2865655@google.com>
References: <20200807170722.2897328-1-joel@joelfernandes.org>
 <20200807170722.2897328-3-joel@joelfernandes.org>
 <20200810180647.GN4295@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810180647.GN4295@paulmck-ThinkPad-P72>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 10, 2020 at 11:06:47AM -0700, Paul E. McKenney wrote:
> On Fri, Aug 07, 2020 at 01:07:19PM -0400, Joel Fernandes (Google) wrote:
> > At least since v4.19, the FQS loop no longer reports quiescent states
> > for offline CPUs unless it is an emergency.
> > 
> > This commit therefore fixes the comment in rcu_gp_init() to match the
> > current code.
> > 
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > ---
> >  kernel/rcu/tree.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > index a49fa3b60faa..2fb66cdbfa25 100644
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -1701,9 +1701,11 @@ static bool rcu_gp_init(void)
> >  
> >  	/*
> >  	 * Apply per-leaf buffered online and offline operations to the
> > -	 * rcu_node tree.  Note that this new grace period need not wait
> > -	 * for subsequent online CPUs, and that quiescent-state forcing
> > -	 * will handle subsequent offline CPUs.
> > +	 * rcu_node tree. Note that this new grace period need not wait for
> > +	 * subsequent online CPUs, and that RCU hooks in the CPU offlining
> > +	 * path, when combined with checks in this function, will handle CPUs
> > +	 * that are currently going offline or that go offline later. Refer to
> > +	 * RCU's Requirements documentation about hotplug requirements as well.
> >  	 */
> >  	rcu_state.gp_state = RCU_GP_ONOFF;
> >  	rcu_for_each_leaf_node(rnp) {
> 
> Very good!  I pulled this in with light edits as shown below.
> Please let me know if I messed something up.

Yes, looks good, thanks!

 - Joel


> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit a6117399840b963f90cc5322ef9ea7c52de639b2
> Author: Joel Fernandes (Google) <joel@joelfernandes.org>
> Date:   Fri Aug 7 13:07:19 2020 -0400
> 
>     rcu/tree: Clarify comments about FQS loop reporting quiescent states
>     
>     Since at least v4.19, the FQS loop no longer reports quiescent states
>     for offline CPUs except in emergency situations.
>     
>     This commit therefore fixes the comment in rcu_gp_init() to match the
>     current code.
>     
>     Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index bcc6160..59e1943 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -1730,10 +1730,13 @@ static bool rcu_gp_init(void)
>  	raw_spin_unlock_irq_rcu_node(rnp);
>  
>  	/*
> -	 * Apply per-leaf buffered online and offline operations to the
> -	 * rcu_node tree.  Note that this new grace period need not wait
> -	 * for subsequent online CPUs, and that quiescent-state forcing
> -	 * will handle subsequent offline CPUs.
> +	 * Apply per-leaf buffered online and offline operations to
> +	 * the rcu_node tree. Note that this new grace period need not
> +	 * wait for subsequent online CPUs, and that RCU hooks in the CPU
> +	 * offlining path, when combined with checks in this function,
> +	 * will handle CPUs that are currently going offline or that will
> +	 * go offline later.  Please also refer to "Hotplug CPU" section
> +	 * of RCU's Requirements documentation.
>  	 */
>  	rcu_state.gp_state = RCU_GP_ONOFF;
>  	rcu_for_each_leaf_node(rnp) {
