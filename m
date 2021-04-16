Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58307361784
	for <lists+linux-doc@lfdr.de>; Fri, 16 Apr 2021 04:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238206AbhDPCWs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Apr 2021 22:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbhDPCWr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 22:22:47 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC8DC061574
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 19:22:22 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id w7-20020a1cdf070000b0290125f388fb34so13165090wmg.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 19:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RDRWGt7xOekmwUKUE2JEVIaFGKRBsEO59DpsTnWgs/0=;
        b=ZfOxa43AWeSHjHBGW3m2xxgRn0MKBaCittzuqp5UzO77kBOKY+usslGnGnAr/bGr9r
         Y/FlasLuieWL3Lhp+NU27g3OBnXe07L7YygtbptzZRtIj+cm6dx2dOyRfgtMiScUNN3W
         Qm0cSyWf8oYh8NRjHjanPlsTr3KlqE2xCblcaA7wbs5sauhyiW6t8wqTVxa8/bdxETOj
         DJFHBnwCjdVHdB7lQFpVM/1+0fwY/FFQGmF6ec7cG08xt6EQkbgRa0ZDbgvWCY3AZa01
         t/eax8nlE9M8mgTwNUtBaHqr4JuErCH+9oM60bW2CZrMcCT/7nlOiovQwH3V7tGcuk6w
         A+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RDRWGt7xOekmwUKUE2JEVIaFGKRBsEO59DpsTnWgs/0=;
        b=SoYhml4v+ZbODJbJIEHdCBlb/Tl30RAW4GygYXy/fk6/RXjIxLv3MS77C63gJV5ahC
         L2Znt68SoFtxvaoIEEWvAOUf1Bl959abrWwb4SwOEStNWJhAV5p0vR34UZKXujpMKknf
         GEoB7l/OeJL2UFZab7x1pCxdsmtjCSeTx+M1ZxLNnvTUae9FA/xyQclzMmhrJe+7chxX
         U6TrqJ5O9qmMz8gMae9oYIvSFu8/GpOmYlo+Vw6HVTZ8NDqS6bLDbo6qgopnDxGG+0bh
         x4mXRPKb8b/gymEC8kXi1Nt0ZiFB7z7YDTd76v7wcOWUfXkoPHN6Rh1wpdpUnEceMu/c
         MPCA==
X-Gm-Message-State: AOAM530JnMBsYbOFlzz4YbAliwL2SgUHeHGDVwc/pM4CTsTPnqWynm9p
        rOWvJ3Icl1vTALbiJT+BvQJB
X-Google-Smtp-Source: ABdhPJxQj64FHzBBkB1XlDKKfuP/omZD2DU9RupOiJ3vBjtuXY1JXoOhozJ3FC0KYuffL3O4FaGA8Q==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr5790600wmk.63.1618539741456;
        Thu, 15 Apr 2021 19:22:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:9d22:ab98:31ab:7a9d])
        by smtp.gmail.com with ESMTPSA id f7sm3679602wrp.48.2021.04.15.19.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 19:22:21 -0700 (PDT)
Date:   Fri, 16 Apr 2021 03:22:16 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHj02M3jMSweoP4l@google.com>
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
> On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:
> 
> > Rust is a systems programming language that brings several key
> > advantages over C in the context of the Linux kernel:
> > 
> >   - No undefined behavior in the safe subset (when unsafe code is
> >     sound), including memory safety and the absence of data races.
> 
> And yet I see not a single mention of the Rust Memory Model and how it
> aligns (or not) with the LKMM. The C11 memory model for example is a
> really poor fit for LKMM.

We don't intend to directly expose C data structures to Rust code (outside the
kernel crate). Instead, we intend to provide wrappers that expose safe
interfaces even though the implementation may use unsafe blocks. So we expect
the vast majority of Rust code to just care about the Rust memory model.

We admittedly don't have a huge number of wrappers yet, but we do have enough to
implement most of Binder and so far it's been ok. We do intend to eventually
cover other classes of drivers that may unveil unforeseen difficulties, we'll
see.

If you have concerns that we might have overlooked, we'd be happy to hear about
them from you (or anyone else).

> HTML is not a valid documentation format. Heck, markdown itself is
> barely readable.

Are you stating [what you perceive as] a fact or just venting? If the former,
would you mind enlightening us with some evidence?

> It is really *really* hard to read. It has all sorts of weird things,
> like operators at the beginning after a line break:
> 
> 	if (foo
> 	    || bar)
> 
> which is just wrong. And it suffers from CamelCase, which is just about
> the worst thing ever. Not even the C++ std libs have that (or had, back
> when I still did knew C++).
> 
> I also see:
> 
> 	if (foo) {
> 		...
> 	}
> 
> and
> 
> 	if foo {
> 	}
> 
> the latter, ofcourse, being complete rubbish.

There are advantages to adopting the preferred style of a language (when one
exists). We, of course, are not required to adopt it but I am of the opinion
that we should have good reasons to diverge if that's our choice in the end.

"Not having parentheses around the if-clause expression is complete rubbish"
doesn't sound like a good reason to me.
