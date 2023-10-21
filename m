Return-Path: <linux-doc+bounces-758-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5867D1DD0
	for <lists+linux-doc@lfdr.de>; Sat, 21 Oct 2023 17:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 592AB1F21C24
	for <lists+linux-doc@lfdr.de>; Sat, 21 Oct 2023 15:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7751F16433;
	Sat, 21 Oct 2023 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jM6G+anD"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554E21548A
	for <linux-doc@vger.kernel.org>; Sat, 21 Oct 2023 15:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA224C433C8;
	Sat, 21 Oct 2023 15:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697901027;
	bh=9s38JpV39JHITXceHtr6xPGLgLx3TwzUq3gvISUeaoU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=jM6G+anDwT0LMCvqUzP+p4YEzvZK1wnJ1JZEJQhsIYnkY/AQ+vJsmWzAUwwpJXquk
	 9ozjaaz+ic6K7d0B7cOmulWqg6IB9lPJZRJSdQ6J1KRmnvtip/dQtdOryZOCOUC0bU
	 EGYKg4/2fN/vYqP6M4sYLAklWKeWeVyyPpXXIDFt/Lzxu7h7rERMh8RbUBsecrAT7c
	 qbL8t71/S2LETihtQkZYn2uwiuHRNBQDM+wr3woBd/j+fJUnsHe+a3JNDL46uqQEaK
	 p5RDyY+opgf8Hy9OqXb8SKvTYycc8wLVxbgIKjCsf6KFvbzCDUOhNBQJANno6HuKGy
	 fK/uhOUUGAXEg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5201ECE0ED0; Sat, 21 Oct 2023 08:10:27 -0700 (PDT)
Date: Sat, 21 Oct 2023 08:10:27 -0700
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
Message-ID: <8f2ed577-424a-4114-8c90-90ba657e08db@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ceaeba0a-fc30-4635-802a-668c859a58b2@paulmck-laptop>
 <4110a58a-8db5-57c4-2f5a-e09ee054baaa@huaweicloud.com>
 <1c731fdc-9383-21f2-b2d0-2c879b382687@huaweicloud.com>
 <f363d6e0-5682-43e7-9a3f-6b896c3cd920@paulmck-laptop>
 <b96cfbc1-f6b0-2fa6-b72d-d57c34bbf14b@huaweicloud.com>
 <2694e6e1-3282-4a69-b955-06afd7d7f87f@paulmck-laptop>
 <0bf4cda3-cc43-0e77-e47b-43e1402ed276@huaweicloud.com>
 <79233008-4be2-4442-9600-f9ac1a654312@paulmck-laptop>
 <591279ff-3316-d64b-8b25-6baefcecaad1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <591279ff-3316-d64b-8b25-6baefcecaad1@huaweicloud.com>

On Sat, Oct 21, 2023 at 03:36:21PM +0200, Jonas Oberhauser wrote:
> 
> Am 10/20/2023 um 8:13 PM schrieb Paul E. McKenney:
> > On Fri, Oct 20, 2023 at 06:00:19PM +0200, Jonas Oberhauser wrote:
> > > Am 10/20/2023 um 3:57 PM schrieb Paul E. McKenney:
> > > > On Fri, Oct 20, 2023 at 11:29:24AM +0200, Jonas Oberhauser wrote:
> > > > > Am 10/19/2023 um 6:39 PM schrieb Paul E. McKenney:
> > > > > > On Wed, Oct 18, 2023 at 12:11:58PM +0200, Jonas Oberhauser wrote:
> > > > > > > Hi Paul,
> > > > > > > [...]
> > > > > > The compiler is forbidden from inventing pointer comparisons.
> > > > > TIL :) Btw, do you remember a discussion where this is clarified? A quick
> > > > > search didn't turn up anything.
> > > > This was a verbal discussion with Richard Smith at the 2020 C++ Standards
> > > > Committee meeting in Prague.  I honestly do not know what standardese
> > > > supports this.
> > > Richard Smith
> > > Then this e-mail thread shall be my evidence for future discussion.
> > I am sure that Richard will be delighted, especially given that he
> > did not seem at all happy with this don't-invent-pointer-comparisons
> > rule.  ;-)
> 
> Neither am I :D

Why do you want to invent pointer comparisons?

From a practical standpoint, one big problem with them is that they
make it quite hard to write certain types of software, including device
drivers, memory allocators, things like memset(), and so on.

> He can voice his delightenment or lack thereof to me if we ever happen to
> meet in person.

More likely to me, but I will happily pass it on.

> > > I think this tiny rewrite makes it much more clear. Specifically it tells *why* the text is historical (and why we maybe don't need to read it anymore).
> > Good point!  I reworked this a bit and added it to both HISTORICAL
> > sections, with your Suggested-by.
> 
> The new version looks good to me!
> 
> > > > > > The longer-term direction, perhaps a few years from now, is for the
> > > > > > first section to simply reference rcu_dereference.rst and for the second
> > > > > > section to be removed completely.
> > > > > Sounds good to me, but that doesn't mean we need to compromise the
> > > > > readability in the interim :)
> > > > Some compromise is needed for people that read the document some time
> > > > back and are looking for something specific.
> > > Yes. But the compromise should be "there's a blob of text other people don't
> > > need to read", not "there's a blob of text that will leave other people
> > > confused".
> > Fair enough in general, but I cannot promise to never confuse people.
> > This is after all memory ordering.  And different people will be confused
> > by different things.
> 
> You can say that twice. In fact I suspect this is not the first time you say
> that :))

Easy for me to say, "that that that that that that that that that that"!

							Thanx, Paul

