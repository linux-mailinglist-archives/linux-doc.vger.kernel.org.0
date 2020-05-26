Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7961CF972
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2020 17:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730405AbgELPkR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 May 2020 11:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgELPkQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 May 2020 11:40:16 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFF5C061A0C
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2020 08:40:16 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id 17so5588765ilj.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2020 08:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=buiAof6WRKtSirNKD9RFN2K0N5fvI2kki67MYnTnqYI=;
        b=bdcdmC5fOGsdyRNMoB3awGe4XvO1oZFII9PVWfAT6Hnk0pNlsC3+S692t3NtLhOwJ2
         yRhzmVxElawpNsCp5SGd1/uA3ZEk+PVjHAeGZiXtTdSR1GohZMgwGOIrmiv01/IqXXq1
         et9Aui/SmQpquIkSabOibWCiW3txo14BNVKVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=buiAof6WRKtSirNKD9RFN2K0N5fvI2kki67MYnTnqYI=;
        b=jHrheycUzsEFWlWMZNEl2HmWFHB9Eo6+FLgMqdfq30Bw61f9CuVLheqQu78qK+JGvq
         w0yqbs9I3OrrOApbwYZZiw3e/PjYd5vS8jA983OW6AUPRzsvUURfZHyW9ZvsIS1l6QzZ
         M6pzO3D520y/7o50NAJdoKCuG3MVj2DF6IhgxUeXzop3DvioGdD4012bzQZIvLIJYc/k
         58KtnBa/+xo+Ll7BryPVf7YEq7KHUpPPbXggWkAiIn4AhuHxNHg73PDYIL+1mtQmsvA1
         b2VGvNoMujUysf+O112TJbtyUA5eSyq/Nn3p1mcV0srTmL9bkA3Vyko/ddbCwmSPBMPG
         tkEA==
X-Gm-Message-State: AGi0PuYG7O1xoDjOtqTIXjLvrvDxHeJUxazkuszXLKi+zs8xngBWPBbP
        7AqUk89D0zoX0nz45T6a7O9MqDCDyURbMTUzWvxu5w==
X-Google-Smtp-Source: APiQypLoZjH2P99WvEMIV/Uaeurvj/6ZcrBQNQMjT0h7BcV7EXSLMSDq8qRylrHB/xNv0pEq95jnAK51Ebf7TqyFQlQ=
X-Received: by 2002:a92:bad5:: with SMTP id t82mr22740692ill.171.1589298011260;
 Tue, 12 May 2020 08:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200323015735.236279-1-joel@joelfernandes.org>
 <7809dbfa-7a76-8663-799a-908c4ead8d30@gmail.com> <21e1ba24-22d0-8083-770c-53d320ba5420@gmail.com>
 <20200511173348.GX2869@paulmck-ThinkPad-P72> <20200512021309.GA197229@google.com>
 <bff04d71-1666-a5a8-54bf-d0c9f8737b47@gmail.com> <20200512121936.GA228684@google.com>
 <20200512141944.GC2869@paulmck-ThinkPad-P72> <2ad1db9a-cd47-51a0-4bbf-5e6b64b73cbd@gmail.com>
In-Reply-To: <2ad1db9a-cd47-51a0-4bbf-5e6b64b73cbd@gmail.com>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Tue, 12 May 2020 11:40:00 -0400
Message-ID: <CAEXW_YR9xu7s0jvbu-vGpi_TtJ_NMWHHNArTNVwcu98WS1t-PA@mail.gmail.com>
Subject: Re: [PATCH 0/3] tools/memory-model, Documentation/litmus-test: Sort
 out location of litmus test and README
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Vineeth Remanan Pillai <vpillai@digitalocean.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        Daniel Lustig <dlustig@nvidia.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 12, 2020 at 10:39 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On Tue, 12 May 2020 07:19:44 -0700, Paul E. McKenney wrote:
> > On Tue, May 12, 2020 at 08:19:36AM -0400, Joel Fernandes wrote:
> >> On Tue, May 12, 2020 at 08:50:45PM +0900, Akira Yokosawa wrote:
> >> [...]
> >>>> I think on top of this patch, I'd like to add a reference to the to the
> >>>> litmus test in tools/memory-model/ from Documentation/rcu/.
> >>>
> >>> Sounds reasonable to me. But for most people, it never changes its location.
> >>> Please find inline comments below.
> >>>
> >>>>
> >>>> Just to mention my rationale for Documentation/litmus-tests/rcu/, I was
> >>>> basically looking for a central place for RCU related litmus tests in the
> >>>> kernel sources and the idea of this new directory came up.
> >>>>
> >>>> For Akira's series,
> >>>> Acked-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> >>>
> >>> Thank you!
> >>>
> >>>>
> >>>> And could we add the following patch on top of Akira's series so we still
> >>>> maintain a reference to the moved RCU test?>
> >>>> ---8<-----------------------
> >>>>
> >>>> From 52fdb57551cc769d8bd690f4f2b22de36ddece99 Mon Sep 17 00:00:00 2001
> >>>> From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
> >>>> Date: Mon, 11 May 2020 22:06:46 -0400
> >>>> Subject: [PATCH] docs: litmus-tests: Clarify about the RCU pre-initialization
> >>>>  test
> >>>>
> >>>> Since this test was moved to tools/memory-model/, make sure that it is
> >>>> at least referenced from Documentation/litmus-tests/'s README.
> >>>>
> >>>> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> >>>> ---
> >>>>  Documentation/litmus-tests/README | 6 ++++--
> >>>>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
> >>>> index ac0b270b456c1..53f09e74734a4 100644
> >>>> --- a/Documentation/litmus-tests/README
> >>>> +++ b/Documentation/litmus-tests/README
> >>>> @@ -11,7 +11,6 @@ tools/memory-model/README.
> >>>>
> >>>>  atomic (/atomic derectory)
> >>>>  --------------------------
> >>>> -
> >>>>  Atomic-RMW+mb__after_atomic-is-stronger-than-acquire.litmus
> >>>>      Test that an atomic RMW followed by a smp_mb__after_atomic() is
> >>>>      stronger than a normal acquire: both the read and write parts of
> >>>> @@ -23,8 +22,11 @@ Atomic-RMW-ops-are-atomic-WRT-atomic_set.litmus
> >>>>
> >>>>  RCU (/rcu directory)
> >>>>  --------------------
> >>>> -
> >>>
> >>> I loosely followed the convention of ReST documents in putting these empty
> >>> lines.  But I don't mind if they are removed.
> >>>
> >>>>  RCU+sync+read.litmus
> >>>>  RCU+sync+free.litmus
> >>>>      Both the above litmus tests demonstrate the RCU grace period guarantee
> >>>>      that an RCU read-side critical section can never span a grace period.
> >>>> +
> >>>> +MP+onceassign+derefonce.litmus (moved to tools/memory-model/litmus-tests/)
> >>>
> >>> As I said above, for those who don't follow developments in the lkmm branch,
> >>> MP+onceassign+derefonce.litmus stays in tools/memory-model/litmus-tests/.
> >>> So,
> >>>
> >>> +MP+onceassign+derefonce.litmus (under tools/memory-model/litmus-tests/)
> >>>
> >>> looks better to me.
> >>
> >> Yes it stays under tools/.. but is referenced here. Sounds like you agree and
> >> the only change from my follow-up patch that you want is to change "moved to"
> >> to "under".
> >>
> >> If so, Paul do you mind applying my patch and fixing this up? Or do you want
> >> to apply Akira's 3-patch series first and then have me send you another one
> >> on top?
> >
> > Let's get something that you, Akira, and Alan are good with, then I will
> > apply that, either on top of or in place of the current commits (just
> > tell me which).
>
> OK.
> I'm submitting a patch [4/3] with Alan's suggested-by and Joel's and my
> co-developed-by tags.
> The explanation under tools/memory-model/litmus-tests/README also need the same
> rewording.

Sounds good to me, thanks!!

 - Joel
