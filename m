Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7EF21D010B
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2020 23:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgELVnq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 May 2020 17:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726268AbgELVnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 May 2020 17:43:45 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28921C061A0E
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2020 14:43:45 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id g16so11725409qtp.11
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2020 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9Jz0N2qi039/ltHYIrFe1r2pYgMJDcOi9Hazab0EYXU=;
        b=J8S5wxrP9OdTJgIMV52j8dzoXsMsesXUxZW9T8t54cvdAUBztE1dh/QAdWEw2meILQ
         7B/M5erCff1ZFASZalwLnNtJ/RwJpxWZbqLmgxPlpYPb5n+/hNXVf+1h+4AsG/SRXEiN
         /0juhDLwgkGGOUIMtoM/nobBES0mxGVEKNIQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Jz0N2qi039/ltHYIrFe1r2pYgMJDcOi9Hazab0EYXU=;
        b=m9fK6RL8uZtOKJgHWwr4DSnKt3B1bvZcdTAiunvNdArwl4j2QFtOa/2nGhLikjFPOS
         NwCjw6p53rGXwSQ6vnqbSG5eC5EsBsehWAnbg99OZLnLFniHLxfs/7q0rnpiS7X8sUJ/
         dIV24MvGr2xSwCoPik4pwbzAlY6DVZVtqZ5coor2XkEKO5iGTW4ngzvRxhZQKyGDevJc
         utuKdngBHs/5Et1PbFCUJSymxScL+2wC6TYuSlBFZoEg5nGjpHXz5M4Whl7nP3Uas3Cz
         isn0aEqKZBrkJ0a1+hZLxy7Yw5wbEOXmkgJ5y3saIdzKsiZgUNX3unw4I10k0zRAeO6G
         N1gw==
X-Gm-Message-State: AGi0Pua3d1ADKbWo6s9ygmZk31dcJjPV1bBawwchjDJzUEBpRktjPzhJ
        LMN0/AKPuylOgqbE53l/ZCqalA==
X-Google-Smtp-Source: APiQypI1IRxHiLeOSmgZPvYgvz5Wtf6UdoSDfZ8yaONkacSf24QwSBM1uUPZeuzTJqKtQtdg70zuTQ==
X-Received: by 2002:ac8:1c3d:: with SMTP id a58mr23419689qtk.52.1589319824174;
        Tue, 12 May 2020 14:43:44 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id z65sm8500011qkc.91.2020.05.12.14.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 14:43:43 -0700 (PDT)
Date:   Tue, 12 May 2020 17:43:42 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Akira Yokosawa <akiyks@gmail.com>,
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
Subject: Re: [PATCH 4/3] docs: litmus-tests: Clarify about the RCU
 pre-initialization test
Message-ID: <20200512214342.GA89170@google.com>
References: <20200323015735.236279-1-joel@joelfernandes.org>
 <7809dbfa-7a76-8663-799a-908c4ead8d30@gmail.com>
 <21e1ba24-22d0-8083-770c-53d320ba5420@gmail.com>
 <fd7e7c6f-fda1-7f2b-19f3-a09b73b10de8@gmail.com>
 <CAEXW_YSjo2hgvg-FN_MR7FVEcp-7gH17jb0-262k+ydSuuDjuQ@mail.gmail.com>
 <20200512163022.GI2869@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512163022.GI2869@paulmck-ThinkPad-P72>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 12, 2020 at 09:30:22AM -0700, Paul E. McKenney wrote:
> On Tue, May 12, 2020 at 11:41:01AM -0400, Joel Fernandes wrote:
> > On Tue, May 12, 2020 at 11:07 AM Akira Yokosawa <akiyks@gmail.com> wrote:
> > >
> > > From 7bb979aacd8788d174df8a56e9803ba9e5b7a381 Mon Sep 17 00:00:00 2001
> > > From: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Date: Mon, 11 May 2020 22:06:46 -0400
> > > Subject: [PATCH 4/3] docs: litmus-tests: Clarify about the RCU pre-initialization test
> > >
> > > Since this test returned to tools/memory-model/, make sure that it is
> > > at least referenced from Documentation/litmus-tests/'s README.
> > >
> > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Co-developed-by: Akira Yokosawa <akiyks@gmail.com>
> > > [Alan: grammar nit]
> > > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > > ---
> > > I said in the earlier message:
> > >
> > > > The explanation under tools/memory-model/litmus-tests/README also need the same
> > > > rewording.
> > >
> > > , but obviously I was confused. It is good as is.
> > >
> > > This is on top of my earlier patch series.
> > >
> > > Joel, Alan, does this work with you?
> > 
> > Yes, thanks a lot for doing it. Paul are you Ok with it too?
> 
> Looks good to me!
> 
> Could one of you please send a patch series and instructions, which I
> -think- will be of the form:
> 
> o	Revert a5cca3485d92 ("Documentation: LKMM: Move
> 	MP+onceassign+derefonce to new litmus-tests/rcu/")
> 
> o	Apply a series of patches.

Rebased Akira's 3 and my 1 on top of your /dev branch with the ordering done as above:

Could you pull?

git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (branch for-paul-dev)

Thanks!

 - Joel

