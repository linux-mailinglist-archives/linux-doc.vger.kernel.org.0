Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4208110953F
	for <lists+linux-doc@lfdr.de>; Mon, 25 Nov 2019 22:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbfKYVq1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Nov 2019 16:46:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:34736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbfKYVq1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 25 Nov 2019 16:46:27 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9405E20706;
        Mon, 25 Nov 2019 21:46:26 +0000 (UTC)
Date:   Mon, 25 Nov 2019 16:46:25 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
Cc:     Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@joelfernandes.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [RFC v2 2/2] docs: ftrace: Fix typos
Message-ID: <20191125164625.01101109@gandalf.local.home>
In-Reply-To: <20191125123709.5eff70a9@gandalf.local.home>
References: <cover.1574655670.git.frank@generalsoftwareinc.com>
        <a843617511989679b29fbd62b1b8b3e991f2101e.1574655670.git.frank@generalsoftwareinc.com>
        <20191125123709.5eff70a9@gandalf.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 25 Nov 2019 12:37:09 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Sun, 24 Nov 2019 23:38:41 -0500
> "Frank A. Cancio Bello" <frank@generalsoftwareinc.com> wrote:
> 
> > --- a/Documentation/trace/ring-buffer-design.txt
> > +++ b/Documentation/trace/ring-buffer-design.txt
> > @@ -37,7 +37,7 @@ commit_page - a pointer to the page with the last finished non-nested write.
> >  
> >  cmpxchg - hardware-assisted atomic transaction that performs the following:
> >  
> > -   A = B iff previous A == C
> > +   A = B if previous A == C  
> 
> This wasn't a typo. "iff" means "if and only if" which is a standard
> notation. That is, this is shorthand for:
> 
>   A = B if previous A == C
>   previous A == C if A = B

Although thinking about this more, this may not be correct. If
previous A == B, then A = B, thus the "iff" notation is not actually
accurate.

This wouldn't then be a typo fix, but a real fix to the logic ;-)

-- Steve

> 
> 
> >  
> >     R = cmpxchg(A, C, B) is saying that we replace A with B if and only if
> >        current A is equal to C, and we put the old (current) A into R
> > --   

