Return-Path: <linux-doc+bounces-3739-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B623080069B
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 10:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56425B2105E
	for <lists+linux-doc@lfdr.de>; Fri,  1 Dec 2023 09:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D451CF87;
	Fri,  1 Dec 2023 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pbXKQSDQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8536A1717;
	Fri,  1 Dec 2023 01:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uuTfC7LltumjIuorAoDhjpS1ezX1h1/rIhUFVBb3G/4=; b=pbXKQSDQZB2DxYksiyazj01ETF
	iqdRK3Ll/buaD/c/As0vJzdmXeowdjXVC0tUEd3UPARN6jmGzJ8rNZ4zb81nrVK9O0PQxfurow9rR
	6l3tC+Mv8OdWg7KHTmLI3t+7sxijDns/olys/R5dSmOxVmfM+PPcvW9j2HePO6664YRyI10zPrT3q
	/H/htn8o4pXtJRp8TfRwRLCHKR1q7oKiFitUCPljNPizonvmyK+0BlGsMfZVSryrUKsAYb73TZ504
	dRUkgbOKGAVB6qRLBMmpUmK4PmDFzY2PSNKA3OhnS1Rnyex7XFMMAkFnn8+sWW5rqJcV6boz5n/Mq
	MxJ8P7pQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r8zXE-00FNki-Se; Fri, 01 Dec 2023 09:10:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DAE4230040C; Fri,  1 Dec 2023 10:10:07 +0100 (CET)
Date: Fri, 1 Dec 2023 10:10:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jann Horn <jannh@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] locking: Document that mutex_unlock() is non-atomic
Message-ID: <20231201091007.GG3818@noisy.programming.kicks-ass.net>
References: <20231130204817.2031407-1-jannh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130204817.2031407-1-jannh@google.com>

On Thu, Nov 30, 2023 at 09:48:17PM +0100, Jann Horn wrote:
> I have seen several cases of attempts to use mutex_unlock() to release an
> object such that the object can then be freed by another task.
> My understanding is that this is not safe because mutex_unlock(), in the
> MUTEX_FLAG_WAITERS && !MUTEX_FLAG_HANDOFF case, accesses the mutex
> structure after having marked it as unlocked; so mutex_unlock() requires
> its caller to ensure that the mutex stays alive until mutex_unlock()
> returns.
> 
> If MUTEX_FLAG_WAITERS is set and there are real waiters, those waiters
> have to keep the mutex alive, I think; but we could have a spurious
> MUTEX_FLAG_WAITERS left if an interruptible/killable waiter bailed
> between the points where __mutex_unlock_slowpath() did the cmpxchg
> reading the flags and where it acquired the wait_lock.
> 
> (With spinlocks, that kind of code pattern is allowed and, from what I
> remember, used in several places in the kernel.)
> 
> If my understanding of this is correct, we should probably document this -
> I think such a semantic difference between mutexes and spinlocks is fairly
> unintuitive.

IIRC this is true of all sleeping locks, and I think completion was the
explcicit exception here, but it's been a while.


> index 78540cd7f54b..087716bfa7b2 100644
> --- a/Documentation/locking/mutex-design.rst
> +++ b/Documentation/locking/mutex-design.rst
> @@ -101,6 +101,12 @@ features that make lock debugging easier and faster:
>      - Detects multi-task circular deadlocks and prints out all affected
>        locks and tasks (and only those tasks).
>  
> +Releasing a mutex is not an atomic operation: Once a mutex release operation

Well, it very much is an atomic store-release. That is, I object to your
confusing use of atomic here :-)

