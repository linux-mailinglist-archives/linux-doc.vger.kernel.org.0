Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B942A361B7C
	for <lists+linux-doc@lfdr.de>; Fri, 16 Apr 2021 10:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239599AbhDPIQb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Apr 2021 04:16:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:46538 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233959AbhDPIQb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Apr 2021 04:16:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 39417AEC6;
        Fri, 16 Apr 2021 08:16:05 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
        id 09EE5607B3; Fri, 16 Apr 2021 10:16:05 +0200 (CEST)
Date:   Fri, 16 Apr 2021 10:16:05 +0200
From:   Michal Kubecek <mkubecek@suse.cz>
To:     linux-kernel@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210416081605.3m4apyornouf5p5s@lion.mk-sys.cz>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 15, 2021 at 08:58:16PM +0200, Peter Zijlstra wrote:
> 
> This; can we mercilessly break the .rs bits when refactoring? What
> happens the moment we cannot boot x86_64 without Rust crap on?
> 
> We can ignore this as a future problem, but I think it's only fair to
> discuss now. I really don't care for that future, and IMO adding this
> Rust or any other second language is a fail.

I believe this is the most important question and we really need
a honest answer in advance: where exactly is this heading? At the moment
and with this experimental RFC, rust stuff can be optional and isolated
but it's obvious that the plan is very different: to have rust all
around the standard kernel tree. (If not, why is the example driver in
drivers/char/ ?)

And I don't see how the two languages might coexist peacefully without
rust toolchain being necessary for building any kernel useful in
practice and anyone seriously involved in kernel development having to
be proficient in both languages. Neither of these looks appealing to
me.

The dependency on rust toolchain was exactly what made me give up on
building Firefox from mercurial snapshots few years ago. To be able to
build them, one needed bleeding edge snapshots of rust toolchain which
my distribution couldn't possibly provide and building them myself
required way too much effort. This very discussion already revealed that
rust kernel code would provide similar experience. I also have my doubts
about the "optional" part; once there are some interesting drivers
written in rust, even if only in the form of out of tree modules, there
will be an enormous pressure on distributions, both community and
enterprise, to enable rust support. Once the major distributions do,
most others will have to follow. And from what I have seen, you need
rust toolchain for build even if you want to only load modules written
in rust.

The other problem is even worse. Once we have non-trivial amount of rust
code around the tree, even if it's "just some drivers", you cannot
completely ignore it. One example would be internal API changes. Today,
if I want to touch e.g. ethtool_ops, I need to adjust all in tree NIC
drivers providing the affected callback and adjust them. Usually most of
the patch is generated by spatch but manual tweaks are often needed here
and there. In the world of bilingual kernel with nontrivial number of
NIC drivers written in rust, I don't see how I could do that without
also being proficient in rust.

Also, how about maintainers and reviewers? What if someone comes with
a new module under foo/ or foo/bar/ and relevant maintainer does not
know rust or just not well enough to be able to review the submission
properly? Can they simply say "Sorry, I don't speak rust so no rust in
foo/bar/"? Leaf drivers are one thing, how about netfilter matches and
targets, TCP congestion control algorighms, qdiscs, filesystems, ...?
Having kernel tree divided into "rusty" and "rustfree" zones does not
sound like a great idea. But if we don't want that, do we expect every
subsystem maintainer and reviewer to learn rust to a level sufficient
for reviewing rust (kernel) code? Rust enthusiasts tell us they want to
open kernel development to more people but the result could as well be
exactly the opposite: it could restrict kernel development to people
proficient in _both_ languages.

As Peter said, it's not an imminent problem but as it's obvious this is
just the first step, we should have a clear idea what the plan is and
what we can and should expect.

Michal
