Return-Path: <linux-doc+bounces-668-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6DA7CFFC3
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 18:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CDA1B2116D
	for <lists+linux-doc@lfdr.de>; Thu, 19 Oct 2023 16:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912D432C6B;
	Thu, 19 Oct 2023 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6on/NJd"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A3232C75
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 16:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15EFC433C8;
	Thu, 19 Oct 2023 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697733591;
	bh=ZexdEiNNC+LPRHxIe+2g3JjtbdL/fbrUvs+KMs1hAvQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=N6on/NJddQzika1XMcjbHj7toTNRJyuR5KMRzPvp7mA8LgX+IY8GvugaHVCy8Hzel
	 rNFneoedbIvB2CQR7cczq3CPe3P83aryz7sCMA9uqJh3XCNYeXNVbkUGBykaLyiLOb
	 r2A2UooAjRrfk/UetsSuxAJqx4xzh6yeaepQR8pGGmVyjM7np6xSrfncQ+REhCfVM1
	 oHTHI4vBzhnYuNzjDm//El38reWyxjJ2N/HfEhLUp1e/evBBN1KX+SKt+2i+tvqCNt
	 GBva0BVUyySgpUl6P35iC0kLE8DzcFih3R/xXqMEX1lVY0eloheMEX6uuY5GjrunOb
	 Ux+QZo26gYhkQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6DA82CE041E; Thu, 19 Oct 2023 09:39:51 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:39:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH memory-model] docs: memory-barriers: Add note on compiler
 transformation and address deps
Message-ID: <f363d6e0-5682-43e7-9a3f-6b896c3cd920@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ceaeba0a-fc30-4635-802a-668c859a58b2@paulmck-laptop>
 <4110a58a-8db5-57c4-2f5a-e09ee054baaa@huaweicloud.com>
 <1c731fdc-9383-21f2-b2d0-2c879b382687@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c731fdc-9383-21f2-b2d0-2c879b382687@huaweicloud.com>

On Wed, Oct 18, 2023 at 12:11:58PM +0200, Jonas Oberhauser wrote:
> Hi Paul,
> 
> on a second thought. Why can't the compiler always do, e.g.,
> 
> ��� int *p = READ_ONCE(shared_ptr);
> 
> ��� assert (*p == 0);
> 
> ~>
> 
> ��� int *p = READ_ONCE(shared_ptr);
> 
> ��� int val = x; // x is some object that definitely won't segfault, but may
> very well be owned by another thread right now
> ��� if (p != &x) val = *p;

The compiler is forbidden from inventing pointer comparisons.

> ��� assert (val == 0);
> 
> and in case p == &x, the address dependency is elided

But yes, this is one reason why Documentation/RCU/rcu_dereference.rst
warns about pointer comparisons.

> Best wishes,
> 
> jonas
> 
> Am 10/6/2023 um 6:39 PM schrieb Jonas Oberhauser:
> > Hi Paul,
> > 
> > The "more up-to-date information" makes it sound like (some of) the
> > information in this section is out-of-date/no longer valid.

The old smp_read_barrier_depends() that these section cover really
does no longer exist.

> > But after reading the sections, it seems the information is valid, but
> > discusses mostly the history of address dependency barriers.
> > 
> > Given that the sepcond part� specifically already starts with a
> > disclaimer that this information is purely relevant to people interested
> > in history or working on alpha, I think it would make more sense to
> > modify things slightly differently.
> > 
> > Firstly I'd remove the "historical" part in the first section, and add
> > two short paragraphs explaining that
> > 
> > - every marked access implies a address dependency barrier

This is covered in rcu_dereference.rst.  Or is something missing there?
Please note that the atomic_read() primitives operate on integers
rather than pointers, so are off the table.  Yes, in theory, some of
the value-returning atomic read-modify-write operations could head a
dependency chain, but these things are sufficiently heavyweight that
most situations would be better served by an _acquire() suffix than by
a relaxed version of such an atomic operation.

> > - address dependencies considered by the model are *semantic*
> > dependencies, meaning that a *syntactic* dependency is not sufficient to
> > imply ordering; see the rcu file for some examples where compilers can
> > elide syntactic dependencies

There is a bunch of text in rcu_dereference.rst to this effect.  Or
is there some aspect that is missing from that document?

The longer-term direction, perhaps a few years from now, is for the
first section to simply reference rcu_dereference.rst and for the second
section to be removed completely.

> > Secondly, I'd not add the disclaimer to the second section; there's
> > already a link to rcu_dereference in that section ( https://github.com/torvalds/linux/blob/master/Documentation/memory-barriers.txt#L634
> > ), and already a small text explaining that the section is historical.

The problem is that people insist on diving into the middle of documents,
so sometimes repetition is a necessary form of self defense.  ;-)

But I very much appreciate your review and feedback, and I also apologize
for my slowness.

							Thanx, Paul

> > Best wishes,
> > 
> > jonas
> > 
> > 
> > Am 10/5/2023 um 6:53 PM schrieb Paul E. McKenney:
> > > The compiler has the ability to cause misordering by destroying
> > > address-dependency barriers if comparison operations are used. Add a
> > > note about this to memory-barriers.txt in the beginning of both the
> > > historical address-dependency sections and point to rcu-dereference.rst
> > > for more information.
> > > 
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > > 
> > > diff --git a/Documentation/memory-barriers.txt
> > > b/Documentation/memory-barriers.txt
> > > index 06e14efd8662..d414e145f912 100644
> > > --- a/Documentation/memory-barriers.txt
> > > +++ b/Documentation/memory-barriers.txt
> > > @@ -396,6 +396,10 @@ Memory barriers come in four basic varieties:
> > > � � �� (2) Address-dependency barriers (historical).
> > > +���� [!] This section is marked as HISTORICAL: For more up-to-date
> > > +���� information, including how compiler transformations related to
> > > pointer
> > > +���� comparisons can sometimes cause problems, see
> > > +���� Documentation/RCU/rcu_dereference.rst.
> > > � ������ An address-dependency barrier is a weaker form of read
> > > barrier.� In the
> > > ������ case where two loads are performed such that the second
> > > depends on the
> > > @@ -556,6 +560,9 @@ There are certain things that the Linux kernel
> > > memory barriers do not guarantee:
> > > � � ADDRESS-DEPENDENCY BARRIERS (HISTORICAL)
> > > � ----------------------------------------
> > > +[!] This section is marked as HISTORICAL: For more up-to-date
> > > information,
> > > +including how compiler transformations related to pointer
> > > comparisons can
> > > +sometimes cause problems, see Documentation/RCU/rcu_dereference.rst.
> > > � � As of v4.15 of the Linux kernel, an smp_mb() was added to
> > > READ_ONCE() for
> > > � DEC Alpha, which means that about the only people who need to pay
> > > attention
> 

