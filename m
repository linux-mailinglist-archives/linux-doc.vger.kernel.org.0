Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCC5A28E5
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 23:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbfH2V0U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 17:26:20 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45508 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfH2V0U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:26:20 -0400
Received: by mail-pl1-f193.google.com with SMTP id y8so2184002plr.12
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ne4fb8rmErhHKddOiLagesqEGyy4GKWd57VmqftMrAE=;
        b=CpRKjFU+Fp6R1GVUINYMequFSM8Um8fr63tWRRakTxcQeRjOKG+6RgenSV1JtTqFSi
         psUdRAuIwx3v6J81J+lebdE1PygjlyCctXwOKYkgTy4+5QA/vDvajnNKsnUzqB1+6PBj
         3OJBGVir/Qu5aDjQFmrL4T/sYuHevyWXWwFaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ne4fb8rmErhHKddOiLagesqEGyy4GKWd57VmqftMrAE=;
        b=gzg2ANal12OIRj6Z/0J+K7zdBFTwtsn8LnGJcyf41ChJDIrYD9ri1e1rPEJTWVo+9A
         v4vFeqw9Pnvcf7mPa7i2Oc6lyBzGLYsa3J9hCg14+nvmxD2OGsbNUHPrwCYp8zonO9Gz
         sw+xn7IN92TjTmDIds1O7DPS4k72AhHhn6u1Moji+Ezs4zN8eaolaa1rxahg8MIu2Ege
         jGPTVhfp8/U6EzUjwmn+Y1PQ1wU1DB3hqFSk7WdYJbSas373VnHIAkl4NilG1B2jAX/v
         Noa71+hmMsQkPVNlmm0tALFZXLnotCIq7zbLVkQW23xmwe2yQbrp7HNoZe05seA7RPtC
         pkAw==
X-Gm-Message-State: APjAAAUXRYZl4KwllI4QhJ9j1ll/uzuKLzSy8ClKi3+jda7Ce7HperDj
        y3AX8uGFb7sNDXEDuAV1kov41QCdFHY=
X-Google-Smtp-Source: APXvYqzyTJnwYTYKxMPRtDoPHgvzWEYG7ODL1oxifcC9iUay2BnI9eqzjbyA2iG+svfoAf+aQpNifw==
X-Received: by 2002:a17:902:7d8b:: with SMTP id a11mr12143591plm.306.1567113979260;
        Thu, 29 Aug 2019 14:26:19 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id m4sm3178732pgs.71.2019.08.29.14.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:26:18 -0700 (PDT)
Date:   Thu, 29 Aug 2019 17:26:17 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org, byungchul.park@lge.com,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] rcu/tree: Add multiple in-flight batches of kfree_rcu
 work
Message-ID: <20190829212617.GA183862@google.com>
References: <5d657e35.1c69fb81.54250.01de@mx.google.com>
 <20190828140952.258739-1-joel@joelfernandes.org>
 <20190828204521.GU26530@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828204521.GU26530@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 28, 2019 at 01:45:21PM -0700, Paul E. McKenney wrote:
> On Wed, Aug 28, 2019 at 10:09:52AM -0400, Joel Fernandes (Google) wrote:
> > During testing, it was observed that amount of memory consumed due
> > kfree_rcu() batching is 300-400MB. Previously we had only a single
> > head_free pointer pointing to the list of rcu_head(s) that are to be
> > freed after a grace period. Until this list is drained, we cannot queue
> > any more objects on it since such objects may not be ready to be
> > reclaimed when the worker thread eventually gets to drainin g the
> > head_free list.
> > 
> > We can do better by maintaining multiple lists as done by this patch.
> > Testing shows that memory consumption came down by around 100-150MB with
> > just adding another list. Adding more than 1 additional list did not
> > show any improvement.
[snip]
> > @@ -2730,12 +2739,14 @@ static void kfree_rcu_work(struct work_struct *work)
> >  {
> >  	unsigned long flags;
> >  	struct rcu_head *head, *next;
> > -	struct kfree_rcu_cpu *krcp = container_of(to_rcu_work(work),
> > -					struct kfree_rcu_cpu, rcu_work);
> > +	struct kfree_rcu_work *krwp = container_of(to_rcu_work(work),
> > +					struct kfree_rcu_work, rcu_work);
> > +	struct kfree_rcu_cpu *krcp;
> > +
> > +	krcp = krwp->krcp;
> >  
> >  	spin_lock_irqsave(&krcp->lock, flags);
> > -	head = krcp->head_free;
> > -	krcp->head_free = NULL;
> > +	head = xchg(&krwp->head_free, NULL);
> 
> Given that we hold the lock, why the xchg()?  Alternatively, why not
> just acquire the lock in the other places you use xchg()?  This is a
> per-CPU lock, so contention should not be a problem, should it?

I realized I was being silly :(. Was trying to reduce lines of code and hence
implemented it like that as a one-liner. Locking protocol is not needed or
intended for that xchg since as pointed, a lock is held.

> >  	spin_unlock_irqrestore(&krcp->lock, flags);
> >  
> >  	/*
> > @@ -2758,19 +2769,28 @@ static void kfree_rcu_work(struct work_struct *work)
> >   */
> >  static inline bool queue_kfree_rcu_work(struct kfree_rcu_cpu *krcp)
> >  {
> > +	int i = 0;
> > +	struct kfree_rcu_work *krwp = NULL;
> > +
> >  	lockdep_assert_held(&krcp->lock);
> > +	while (i < KFREE_N_BATCHES) {
> > +		if (!krcp->krw_arr[i].head_free) {
> > +			krwp = &(krcp->krw_arr[i]);
> > +			break;
> > +		}
> > +		i++;
> > +	}
> >  
> > -	/* If a previous RCU batch work is already in progress, we cannot queue
> > +	/* If both RCU batches are already in progress, we cannot queue
> >  	 * another one, just refuse the optimization and it will be retried
> >  	 * again in KFREE_DRAIN_JIFFIES time.
> >  	 */
> 
> If you are going to remove the traditional first "/*" line of a comment,
> why not go all the way and cut the last one as well?  "//".

Will add the /* in the beginning :)

> > -	if (krcp->head_free)
> > +	if (!krwp)
> >  		return false;
> >  
> > -	krcp->head_free = krcp->head;
> > -	krcp->head = NULL;
> > -	INIT_RCU_WORK(&krcp->rcu_work, kfree_rcu_work);
> > -	queue_rcu_work(system_wq, &krcp->rcu_work);
> > +	krwp->head_free = xchg(&krcp->head, NULL);
> 
> This isn't anywhere near a fastpath, so just acquiring the lock is a
> better choice here.

My reasoning was same as above. Will change it to 2 statements since lock is
already held.

> > +	INIT_RCU_WORK(&krwp->rcu_work, kfree_rcu_work);
> > +	queue_rcu_work(system_wq, &krwp->rcu_work);
> >  
> >  	return true;
> >  }
> > @@ -3736,8 +3756,11 @@ static void __init kfree_rcu_batch_init(void)
> >  
> >  	for_each_possible_cpu(cpu) {
> >  		struct kfree_rcu_cpu *krcp = per_cpu_ptr(&krc, cpu);
> > +		int i = KFREE_N_BATCHES;
> >  
> >  		spin_lock_init(&krcp->lock);
> > +		while (i--)
> > +			krcp->krw_arr[i].krcp = krcp;
> 
> This was indeed a nice trick back in the PDP-11 days of 64-kilobyte
> address spaces, so thank you for the nostalgia!  However, a straight-up
> "for" loop is less vulnerable to code being added between the declaration
> of "i" and the "while" loop.

Ok, will do.

thanks,

 - Joel

