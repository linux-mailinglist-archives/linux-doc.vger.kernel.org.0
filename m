Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07E31CF436
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2020 14:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgELMTj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 May 2020 08:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729928AbgELMTj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 May 2020 08:19:39 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D369BC061A0E
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2020 05:19:38 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 190so7671999qki.1
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2020 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W4NZ1llF0Z4m92e/kA7fGUhN8rsyumccC9AKXYP2kR0=;
        b=bg++uZ5k4M5kSyTUV7gHN4O99kUGciYssmUCs/DOQHIiZTKHWwj46w23RrfM1bgPIG
         tVDIlusLdtDoZ8clb+u2IBFuMMShX8f+PKwS4rtVBZXuT7ISjyMNpsqJvigdc6ebQNqV
         3pEFeh+6iPaflpIYP3ExPKYjxm3Yl+VHX1NkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W4NZ1llF0Z4m92e/kA7fGUhN8rsyumccC9AKXYP2kR0=;
        b=iG+eSiLZJkRfe23fHqCeBIKis3z7NUuk5d+H3Sdfy/SjojYs8CbVU9cvSJ3PhQSNFI
         atGNQl05Js9U+3TufSuT9NmY2a250AEc57iaG+3vaQPJvSJy3VyQVl4iX1ikewq62TwV
         igFLWdbxJZ3YbeDTbibzujUPb3OsrhuVOZhClaeJG8r4JAyJZsGCSYnE3xaxTDrYfJtb
         6AFt1gM7Ty08F34xNyzUgjcHZ/oUr/4Ac8PI5QUl8O5swzFW9wYUoxEDnKIyPwnOk3f2
         1m4Lg5a4X9E5arWHvvp4anNBaXaKQPpdW0VEnMoaDgiqMhXar4FI/svTIHbmu911i+ea
         fB6g==
X-Gm-Message-State: AOAM533sUv3O6RrZzaYipfehzbj1bAQsTgiynyXFasccXIpgnwBtY3dH
        X9d4aShq04DA4OytnIAuTLHNSA==
X-Google-Smtp-Source: ABdhPJzv8HD4dJUXpJ+U5r5Gao7XD0PronwOYFLF37I24f5ovq7ClbaKFJULydngog0uxSXRbBVNTw==
X-Received: by 2002:ae9:f50f:: with SMTP id o15mr7169609qkg.177.1589285977953;
        Tue, 12 May 2020 05:19:37 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id c24sm11657414qtp.44.2020.05.12.05.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 05:19:37 -0700 (PDT)
Date:   Tue, 12 May 2020 08:19:36 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        linux-kernel@vger.kernel.org, vpillai@digitalocean.com,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        Daniel Lustig <dlustig@nvidia.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/3] tools/memory-model, Documentation/litmus-test: Sort
 out location of litmus test and README
Message-ID: <20200512121936.GA228684@google.com>
References: <20200323015735.236279-1-joel@joelfernandes.org>
 <7809dbfa-7a76-8663-799a-908c4ead8d30@gmail.com>
 <21e1ba24-22d0-8083-770c-53d320ba5420@gmail.com>
 <20200511173348.GX2869@paulmck-ThinkPad-P72>
 <20200512021309.GA197229@google.com>
 <bff04d71-1666-a5a8-54bf-d0c9f8737b47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bff04d71-1666-a5a8-54bf-d0c9f8737b47@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 12, 2020 at 08:50:45PM +0900, Akira Yokosawa wrote:
[...]
> > I think on top of this patch, I'd like to add a reference to the to the
> > litmus test in tools/memory-model/ from Documentation/rcu/.
> 
> Sounds reasonable to me. But for most people, it never changes its location.
> Please find inline comments below.
> 
> > 
> > Just to mention my rationale for Documentation/litmus-tests/rcu/, I was
> > basically looking for a central place for RCU related litmus tests in the
> > kernel sources and the idea of this new directory came up.
> > 
> > For Akira's series,
> > Acked-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> Thank you!
> 
> > 
> > And could we add the following patch on top of Akira's series so we still
> > maintain a reference to the moved RCU test?> 
> > ---8<-----------------------
> > 
> > From 52fdb57551cc769d8bd690f4f2b22de36ddece99 Mon Sep 17 00:00:00 2001
> > From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
> > Date: Mon, 11 May 2020 22:06:46 -0400
> > Subject: [PATCH] docs: litmus-tests: Clarify about the RCU pre-initialization
> >  test
> > 
> > Since this test was moved to tools/memory-model/, make sure that it is
> > at least referenced from Documentation/litmus-tests/'s README.
> > 
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > ---
> >  Documentation/litmus-tests/README | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
> > index ac0b270b456c1..53f09e74734a4 100644
> > --- a/Documentation/litmus-tests/README
> > +++ b/Documentation/litmus-tests/README
> > @@ -11,7 +11,6 @@ tools/memory-model/README.
> >  
> >  atomic (/atomic derectory)
> >  --------------------------
> > -
> >  Atomic-RMW+mb__after_atomic-is-stronger-than-acquire.litmus
> >      Test that an atomic RMW followed by a smp_mb__after_atomic() is
> >      stronger than a normal acquire: both the read and write parts of
> > @@ -23,8 +22,11 @@ Atomic-RMW-ops-are-atomic-WRT-atomic_set.litmus
> >  
> >  RCU (/rcu directory)
> >  --------------------
> > -
> 
> I loosely followed the convention of ReST documents in putting these empty
> lines.  But I don't mind if they are removed.
> 
> >  RCU+sync+read.litmus
> >  RCU+sync+free.litmus
> >      Both the above litmus tests demonstrate the RCU grace period guarantee
> >      that an RCU read-side critical section can never span a grace period.
> > +
> > +MP+onceassign+derefonce.litmus (moved to tools/memory-model/litmus-tests/)
> 
> As I said above, for those who don't follow developments in the lkmm branch, 
> MP+onceassign+derefonce.litmus stays in tools/memory-model/litmus-tests/.
> So,
> 
> +MP+onceassign+derefonce.litmus (under tools/memory-model/litmus-tests/)
> 
> looks better to me.

Yes it stays under tools/.. but is referenced here. Sounds like you agree and
the only change from my follow-up patch that you want is to change "moved to"
to "under".

If so, Paul do you mind applying my patch and fixing this up? Or do you want
to apply Akira's 3-patch series first and then have me send you another one
on top?

thanks,

 - Joel

