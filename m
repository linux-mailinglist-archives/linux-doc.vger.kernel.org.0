Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F3C24866A
	for <lists+linux-doc@lfdr.de>; Tue, 18 Aug 2020 15:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgHRNuZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Aug 2020 09:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgHRNuP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Aug 2020 09:50:15 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47510C061344
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2020 06:50:13 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id w9so15109172qts.6
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2020 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i3gzOAPUdUUgkW+MfJiRBZzylD1SwKDup35ranLTE+8=;
        b=gFo2tdrjm1qkUJWuDiFskzbeO0w5LJx6dyzsZOPwPfOmHDSXzdBGEcXIwDX7whrNV9
         JEgVlPiTxZyMBirBuYCHGck9cYWCBQmt5ny0jayeNQ6gfZp4LNLHaLYVZRHrSHKeUY6e
         uRSpvrjdgx5mqhJbaHjlzb+ptaePm6k7omgqsuP3hL/1RmdPdVTPoALIZZdr5eyJ54WL
         dsftHxbUTIR9tXIDvqG8jN4H2/lH+Rf1hR50Z0vtfC6A7sLoLgtiM/v15If1BpTZRwDI
         SAX24oCanz2Ny6U8qxDU6UGtpXs/jD/FGeqLm7SIrw5GSVnzTYUHBo7UfMACrG1lFPPe
         a1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i3gzOAPUdUUgkW+MfJiRBZzylD1SwKDup35ranLTE+8=;
        b=Y0fSvFfSclyjxagBPr0TLqwaSzxFyOAbjfKjFHr+pd6xyHsB7v6C7BuBtug0EHEZbB
         G7oBd/tvw+ydTozKoKp5zLt4DzRyha06lzVcMilQtUBG5xvKchSaFbeGFP/7QJiWNnNl
         frphvAh1Ef4vxHg1podVZzgJwNcpNiJ1c97/H8CiXx/TTvsLTXPwf1cuTxBsGgEq4CaV
         dy3FfyKpG/F8sLH9WVY3S3fNZGUf8HlFS28ltB98Nn6524KMeNJOCpy/ZMk6lgzU4OQ5
         6ylk8krJ6y3FhGuwTVs9u8O89pEEV10snFLLw1AISpKhFWQGmehmIoKWJsb9rWy/YXBX
         dTGA==
X-Gm-Message-State: AOAM5304Quxoj2EQQgIaAfjpQYMHAK9AY1ckEPsETqlQtq13l2BYZK5Q
        Nlttj20+DQ3IBorTHDnZZVOJ7g==
X-Google-Smtp-Source: ABdhPJw0MsM7i8bwRZrEdghN116s3dEIEMDqeIJ6VBf7FQiar70mWUPczCEi3eXDG6n3hDEhYsCK4w==
X-Received: by 2002:ac8:368f:: with SMTP id a15mr18218469qtc.288.1597758612969;
        Tue, 18 Aug 2020 06:50:12 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:8b3])
        by smtp.gmail.com with ESMTPSA id n15sm20639882qkk.28.2020.08.18.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 06:50:11 -0700 (PDT)
Date:   Tue, 18 Aug 2020 09:49:00 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     peterz@infradead.org
Cc:     Michal Hocko <mhocko@suse.com>, Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH 0/8] memcg: Enable fine-grained per process memory
 control
Message-ID: <20200818134900.GA829964@cmpxchg.org>
References: <20200817140831.30260-1-longman@redhat.com>
 <20200818091453.GL2674@hirez.programming.kicks-ass.net>
 <20200818092617.GN28270@dhcp22.suse.cz>
 <20200818095910.GM2674@hirez.programming.kicks-ass.net>
 <20200818100516.GO28270@dhcp22.suse.cz>
 <20200818101844.GO2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818101844.GO2674@hirez.programming.kicks-ass.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 18, 2020 at 12:18:44PM +0200, peterz@infradead.org wrote:
> What you need is a feeback loop against the rate of freeing pages, and
> when you near the saturation point, the allocation rate should exactly
> match the freeing rate.

IO throttling solves a slightly different problem.

IO occurs in parallel to the workload's execution stream, and you're
trying to take the workload from dirtying at CPU speed to rate match
to the independent IO stream.

With memory allocations, though, freeing happens from inside the
execution stream of the workload. If you throttle allocations, you're
most likely throttling the freeing rate as well. And you'll slow down
reclaim scanning by the same amount as the page references, so it's
not making reclaim more successful either. The alloc/use/free
(im)balance is an inherent property of the workload, regardless of the
speed you're executing it at.

So the goal here is different. We're not trying to pace the workload
into some form of sustainability. Rather, it's for OOM handling. When
we detect the workload's alloc/use/free pattern is unsustainable given
available memory, we slow it down just enough to allow userspace to
implement OOM policy and job priorities (on containerized hosts these
tend to be too complex to express in the kernel's oom scoring system).

The exponential curve makes it look like we're trying to do some type
of feedback system, but it's really only to let minor infractions pass
and throttle unsustainable expansion ruthlessly. Drop-behind reclaim
can be a bit bumpy because we batch on the allocation side as well as
on the reclaim side, hence the fuzz factor there.
