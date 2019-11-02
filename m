Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F25ECFD4
	for <lists+linux-doc@lfdr.de>; Sat,  2 Nov 2019 17:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfKBQ5g (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 2 Nov 2019 12:57:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfKBQ5g (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 2 Nov 2019 12:57:36 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [65.158.186.218])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EFA332080F;
        Sat,  2 Nov 2019 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572713855;
        bh=sCSzN0j4ndjW1wmV67lyOCJuzz7xM6bympbSIeZ2kSw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JiLRgY4KmiXoPcO663a561jCcl5FYvJVW5fhaHcsCtkxS8iBGimsGmxgwts0IzsKg
         ccU+ihY8kJiXdKzu8GwKLuNyELOH02yY+vIYVmgrKQ3B6hLcc4UcTd4bKR/KHk0ts4
         DHstTD6nHpxpa3PFcsld7uiBWO9o2RLo9VWu+BE8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id A302735204A2; Sat,  2 Nov 2019 09:57:34 -0700 (PDT)
Date:   Sat, 2 Nov 2019 09:57:34 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Amol Grover <frextrite@gmail.com>
Cc:     Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        madhuparnabhowmik04@gmail.com, tranmanphong@gmail.com
Subject: Re: [PATCH] Documentation: RCU: rcu_dereference: Convert to
 rcu_dereference.rst
Message-ID: <20191102165734.GS20975@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191102080107.GA3066@workstation-kernel-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191102080107.GA3066@workstation-kernel-dev>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Nov 02, 2019 at 01:31:07PM +0530, Amol Grover wrote:
> This patch converts rcu_dereference.txt to rcu_dereference.rst and
> adds it to index.rst
> 
> Signed-off-by: Amol Grover <frextrite@gmail.com>

Queued and pushed for review and testing.  Assuming all goes well, I will
push it for the v5.6 merge window.

Could you please take a look at the similar commits from Madhuparna and
Phong?  No time like the present to also gain experience with review
and testing!

							Thanx, Paul

> ---
>  Documentation/RCU/index.rst                   |  1 +
>  ...cu_dereference.txt => rcu_dereference.rst} | 75 ++++++++++---------
>  2 files changed, 42 insertions(+), 34 deletions(-)
>  rename Documentation/RCU/{rcu_dereference.txt => rcu_dereference.rst} (88%)
> 
> diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> index 627128c230dc..585f3d8abd76 100644
> --- a/Documentation/RCU/index.rst
> +++ b/Documentation/RCU/index.rst
> @@ -8,6 +8,7 @@ RCU concepts
>     :maxdepth: 3
>  
>     arrayRCU
> +   rcu_dereference
>     rcu
>     listRCU
>     NMI-RCU
> diff --git a/Documentation/RCU/rcu_dereference.txt b/Documentation/RCU/rcu_dereference.rst
> similarity index 88%
> rename from Documentation/RCU/rcu_dereference.txt
> rename to Documentation/RCU/rcu_dereference.rst
> index bf699e8cfc75..c9667eb0d444 100644
> --- a/Documentation/RCU/rcu_dereference.txt
> +++ b/Documentation/RCU/rcu_dereference.rst
> @@ -1,4 +1,7 @@
> +.. _rcu_dereference_doc:
> +
>  PROPER CARE AND FEEDING OF RETURN VALUES FROM rcu_dereference()
> +===============================================================
>  
>  Most of the time, you can use values from rcu_dereference() or one of
>  the similar primitives without worries.  Dereferencing (prefix "*"),
> @@ -8,7 +11,7 @@ subtraction of constants, and casts all work quite naturally and safely.
>  It is nevertheless possible to get into trouble with other operations.
>  Follow these rules to keep your RCU code working properly:
>  
> -o	You must use one of the rcu_dereference() family of primitives
> +-	You must use one of the rcu_dereference() family of primitives
>  	to load an RCU-protected pointer, otherwise CONFIG_PROVE_RCU
>  	will complain.  Worse yet, your code can see random memory-corruption
>  	bugs due to games that compilers and DEC Alpha can play.
> @@ -25,24 +28,24 @@ o	You must use one of the rcu_dereference() family of primitives
>  	for an example where the compiler can in fact deduce the exact
>  	value of the pointer, and thus cause misordering.
>  
> -o	You are only permitted to use rcu_dereference on pointer values.
> +-	You are only permitted to use rcu_dereference on pointer values.
>  	The compiler simply knows too much about integral values to
>  	trust it to carry dependencies through integer operations.
>  	There are a very few exceptions, namely that you can temporarily
>  	cast the pointer to uintptr_t in order to:
>  
> -	o	Set bits and clear bits down in the must-be-zero low-order
> +	-	Set bits and clear bits down in the must-be-zero low-order
>  		bits of that pointer.  This clearly means that the pointer
>  		must have alignment constraints, for example, this does
>  		-not- work in general for char* pointers.
>  
> -	o	XOR bits to translate pointers, as is done in some
> +	-	XOR bits to translate pointers, as is done in some
>  		classic buddy-allocator algorithms.
>  
>  	It is important to cast the value back to pointer before
>  	doing much of anything else with it.
>  
> -o	Avoid cancellation when using the "+" and "-" infix arithmetic
> +-	Avoid cancellation when using the "+" and "-" infix arithmetic
>  	operators.  For example, for a given variable "x", avoid
>  	"(x-(uintptr_t)x)" for char* pointers.	The compiler is within its
>  	rights to substitute zero for this sort of expression, so that
> @@ -54,16 +57,16 @@ o	Avoid cancellation when using the "+" and "-" infix arithmetic
>  	"p+a-b" is safe because its value still necessarily depends on
>  	the rcu_dereference(), thus maintaining proper ordering.
>  
> -o	If you are using RCU to protect JITed functions, so that the
> +-	If you are using RCU to protect JITed functions, so that the
>  	"()" function-invocation operator is applied to a value obtained
>  	(directly or indirectly) from rcu_dereference(), you may need to
>  	interact directly with the hardware to flush instruction caches.
>  	This issue arises on some systems when a newly JITed function is
>  	using the same memory that was used by an earlier JITed function.
>  
> -o	Do not use the results from relational operators ("==", "!=",
> +-	Do not use the results from relational operators ("==", "!=",
>  	">", ">=", "<", or "<=") when dereferencing.  For example,
> -	the following (quite strange) code is buggy:
> +	the following (quite strange) code is buggy::
>  
>  		int *p;
>  		int *q;
> @@ -81,11 +84,11 @@ o	Do not use the results from relational operators ("==", "!=",
>  	after such branches, but can speculate loads, which can again
>  	result in misordering bugs.
>  
> -o	Be very careful about comparing pointers obtained from
> +-	Be very careful about comparing pointers obtained from
>  	rcu_dereference() against non-NULL values.  As Linus Torvalds
>  	explained, if the two pointers are equal, the compiler could
>  	substitute the pointer you are comparing against for the pointer
> -	obtained from rcu_dereference().  For example:
> +	obtained from rcu_dereference().  For example::
>  
>  		p = rcu_dereference(gp);
>  		if (p == &default_struct)
> @@ -93,7 +96,7 @@ o	Be very careful about comparing pointers obtained from
>  
>  	Because the compiler now knows that the value of "p" is exactly
>  	the address of the variable "default_struct", it is free to
> -	transform this code into the following:
> +	transform this code into the following::
>  
>  		p = rcu_dereference(gp);
>  		if (p == &default_struct)
> @@ -105,14 +108,14 @@ o	Be very careful about comparing pointers obtained from
>  
>  	However, comparisons are OK in the following cases:
>  
> -	o	The comparison was against the NULL pointer.  If the
> +	-	The comparison was against the NULL pointer.  If the
>  		compiler knows that the pointer is NULL, you had better
>  		not be dereferencing it anyway.  If the comparison is
>  		non-equal, the compiler is none the wiser.  Therefore,
>  		it is safe to compare pointers from rcu_dereference()
>  		against NULL pointers.
>  
> -	o	The pointer is never dereferenced after being compared.
> +	-	The pointer is never dereferenced after being compared.
>  		Since there are no subsequent dereferences, the compiler
>  		cannot use anything it learned from the comparison
>  		to reorder the non-existent subsequent dereferences.
> @@ -124,31 +127,31 @@ o	Be very careful about comparing pointers obtained from
>  		dereferenced, rcu_access_pointer() should be used in place
>  		of rcu_dereference().
>  
> -	o	The comparison is against a pointer that references memory
> +	-	The comparison is against a pointer that references memory
>  		that was initialized "a long time ago."  The reason
>  		this is safe is that even if misordering occurs, the
>  		misordering will not affect the accesses that follow
>  		the comparison.  So exactly how long ago is "a long
>  		time ago"?  Here are some possibilities:
>  
> -		o	Compile time.
> +		-	Compile time.
>  
> -		o	Boot time.
> +		-	Boot time.
>  
> -		o	Module-init time for module code.
> +		-	Module-init time for module code.
>  
> -		o	Prior to kthread creation for kthread code.
> +		-	Prior to kthread creation for kthread code.
>  
> -		o	During some prior acquisition of the lock that
> +		-	During some prior acquisition of the lock that
>  			we now hold.
>  
> -		o	Before mod_timer() time for a timer handler.
> +		-	Before mod_timer() time for a timer handler.
>  
>  		There are many other possibilities involving the Linux
>  		kernel's wide array of primitives that cause code to
>  		be invoked at a later time.
>  
> -	o	The pointer being compared against also came from
> +	-	The pointer being compared against also came from
>  		rcu_dereference().  In this case, both pointers depend
>  		on one rcu_dereference() or another, so you get proper
>  		ordering either way.
> @@ -159,13 +162,13 @@ o	Be very careful about comparing pointers obtained from
>  		of such an RCU usage bug is shown in the section titled
>  		"EXAMPLE OF AMPLIFIED RCU-USAGE BUG".
>  
> -	o	All of the accesses following the comparison are stores,
> +	-	All of the accesses following the comparison are stores,
>  		so that a control dependency preserves the needed ordering.
>  		That said, it is easy to get control dependencies wrong.
>  		Please see the "CONTROL DEPENDENCIES" section of
>  		Documentation/memory-barriers.txt for more details.
>  
> -	o	The pointers are not equal -and- the compiler does
> +	-	The pointers are not equal -and- the compiler does
>  		not have enough information to deduce the value of the
>  		pointer.  Note that the volatile cast in rcu_dereference()
>  		will normally prevent the compiler from knowing too much.
> @@ -175,7 +178,7 @@ o	Be very careful about comparing pointers obtained from
>  		comparison will provide exactly the information that the
>  		compiler needs to deduce the value of the pointer.
>  
> -o	Disable any value-speculation optimizations that your compiler
> +-	Disable any value-speculation optimizations that your compiler
>  	might provide, especially if you are making use of feedback-based
>  	optimizations that take data collected from prior runs.  Such
>  	value-speculation optimizations reorder operations by design.
> @@ -188,11 +191,12 @@ o	Disable any value-speculation optimizations that your compiler
>  
>  
>  EXAMPLE OF AMPLIFIED RCU-USAGE BUG
> +----------------------------------
>  
>  Because updaters can run concurrently with RCU readers, RCU readers can
>  see stale and/or inconsistent values.  If RCU readers need fresh or
>  consistent values, which they sometimes do, they need to take proper
> -precautions.  To see this, consider the following code fragment:
> +precautions.  To see this, consider the following code fragment::
>  
>  	struct foo {
>  		int a;
> @@ -244,7 +248,7 @@ to some reordering from the compiler and CPUs is beside the point.
>  
>  But suppose that the reader needs a consistent view?
>  
> -Then one approach is to use locking, for example, as follows:
> +Then one approach is to use locking, for example, as follows::
>  
>  	struct foo {
>  		int a;
> @@ -299,6 +303,7 @@ As always, use the right tool for the job!
>  
>  
>  EXAMPLE WHERE THE COMPILER KNOWS TOO MUCH
> +-----------------------------------------
>  
>  If a pointer obtained from rcu_dereference() compares not-equal to some
>  other pointer, the compiler normally has no clue what the value of the
> @@ -308,7 +313,7 @@ guarantees that RCU depends on.  And the volatile cast in rcu_dereference()
>  should prevent the compiler from guessing the value.
>  
>  But without rcu_dereference(), the compiler knows more than you might
> -expect.  Consider the following code fragment:
> +expect.  Consider the following code fragment::
>  
>  	struct foo {
>  		int a;
> @@ -354,6 +359,7 @@ dereference the resulting pointer.
>  
>  
>  WHICH MEMBER OF THE rcu_dereference() FAMILY SHOULD YOU USE?
> +------------------------------------------------------------
>  
>  First, please avoid using rcu_dereference_raw() and also please avoid
>  using rcu_dereference_check() and rcu_dereference_protected() with a
> @@ -370,7 +376,7 @@ member of the rcu_dereference() to use in various situations:
>  
>  2.	If the access might be within an RCU read-side critical section
>  	on the one hand, or protected by (say) my_lock on the other,
> -	use rcu_dereference_check(), for example:
> +	use rcu_dereference_check(), for example::
>  
>  		p1 = rcu_dereference_check(p->rcu_protected_pointer,
>  					   lockdep_is_held(&my_lock));
> @@ -378,14 +384,14 @@ member of the rcu_dereference() to use in various situations:
>  
>  3.	If the access might be within an RCU read-side critical section
>  	on the one hand, or protected by either my_lock or your_lock on
> -	the other, again use rcu_dereference_check(), for example:
> +	the other, again use rcu_dereference_check(), for example::
>  
>  		p1 = rcu_dereference_check(p->rcu_protected_pointer,
>  					   lockdep_is_held(&my_lock) ||
>  					   lockdep_is_held(&your_lock));
>  
>  4.	If the access is on the update side, so that it is always protected
> -	by my_lock, use rcu_dereference_protected():
> +	by my_lock, use rcu_dereference_protected()::
>  
>  		p1 = rcu_dereference_protected(p->rcu_protected_pointer,
>  					       lockdep_is_held(&my_lock));
> @@ -410,18 +416,19 @@ member of the rcu_dereference() to use in various situations:
>  
>  
>  SPARSE CHECKING OF RCU-PROTECTED POINTERS
> +-----------------------------------------
>  
>  The sparse static-analysis tool checks for direct access to RCU-protected
>  pointers, which can result in "interesting" bugs due to compiler
>  optimizations involving invented loads and perhaps also load tearing.
> -For example, suppose someone mistakenly does something like this:
> +For example, suppose someone mistakenly does something like this::
>  
>  	p = q->rcu_protected_pointer;
>  	do_something_with(p->a);
>  	do_something_else_with(p->b);
>  
>  If register pressure is high, the compiler might optimize "p" out
> -of existence, transforming the code to something like this:
> +of existence, transforming the code to something like this::
>  
>  	do_something_with(q->rcu_protected_pointer->a);
>  	do_something_else_with(q->rcu_protected_pointer->b);
> @@ -435,7 +442,7 @@ Load tearing could of course result in dereferencing a mashup of a pair
>  of pointers, which also might fatally disappoint your code.
>  
>  These problems could have been avoided simply by making the code instead
> -read as follows:
> +read as follows::
>  
>  	p = rcu_dereference(q->rcu_protected_pointer);
>  	do_something_with(p->a);
> @@ -448,7 +455,7 @@ or as a formal parameter, with "__rcu", which tells sparse to complain if
>  this pointer is accessed directly.  It will also cause sparse to complain
>  if a pointer not marked with "__rcu" is accessed using rcu_dereference()
>  and friends.  For example, ->rcu_protected_pointer might be declared as
> -follows:
> +follows::
>  
>  	struct foo __rcu *rcu_protected_pointer;
>  
> -- 
> 2.20.1
> 
