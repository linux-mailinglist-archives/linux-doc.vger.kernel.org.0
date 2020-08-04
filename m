Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45C623B298
	for <lists+linux-doc@lfdr.de>; Tue,  4 Aug 2020 04:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgHDCLM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Aug 2020 22:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgHDCLL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Aug 2020 22:11:11 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D78C06174A
        for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2020 19:11:11 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id g20so8025247uan.7
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2020 19:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k9EPoA/TZ6oFdobQPbI92mloUpSocVCmYhmgQ9XTICk=;
        b=QADiLWYDVY5sDxEYuLEuvcCNAPfU3goGeGw7YEgVuEfcRmX+WQZUvyrbIKtcB7k7iQ
         YxtIg+05jbwODdVdONyVxvmTrVZkmGIM0V8YH0Opo5g6s04ssZ+E7raI4lMc6wipoLsR
         mtgY7uBETHz6kZN968nSb549MAS66ZiRjzYJIBh4V2KqbBYjvi0sk8NkJGObyROZ26Rz
         wr0T342klm0lF2dZp+0E7GYYrZV1oLV7ImOHoLhAfA2b6vuOhpxgD4QGTMNTY6xao7VS
         tnWQeeqa1y9yCWAdCkdmUq6sTQ5PXziy0Z7S8lVg41R2Av1E7muXD5VKHWwh+4EHg+RB
         Rqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k9EPoA/TZ6oFdobQPbI92mloUpSocVCmYhmgQ9XTICk=;
        b=YGsq/KzFqQ7LT14BNEtE60mJDOTBgIzkdHHWT068lbJcazyf2MCMrbZJep3++SqG5X
         UyvJrZXDBoLhaIZMP7oKP8M3ol8JpD+AlcYx4yU3RlJafoG0MaAaeZ0fq8G92TKBPRZR
         lwMZj3BWjgPA3Zm7+QegS3Uu52Fu5vqgCj2/YdYQAZ8m73VLNUb43BPU3nCmnnTbq/I+
         YeTJD2S/0KuC8NzDkF5R0textcwk4i1w/WyNWcr4DL/whTtIbDgpm//0DBLjPuJZUkNl
         yrO3qmlLzoeKrdQyMvGwg4I4uRfs4hrIiGq8v+6bdbY1yHI6FYBtj9rvrV3t/6csoIku
         VoGw==
X-Gm-Message-State: AOAM530tMvIiUM/0/r0tIi06+Kz+5igiW/S8CW7lQfjzgUgB30G22vK4
        DbOxrp8U0NS1g6If2oqlJuu3+nEChrnD8/DIEW6CXQ==
X-Google-Smtp-Source: ABdhPJxsSSJwioh1fipswY2Sg0TuZ8kexPdrIAJWw0UnM4xG9WSpH2NU05FlGdWBuHZgMZ+Mu0VvpeSV2QDEBT1mDD8=
X-Received: by 2002:ab0:5eaa:: with SMTP id y42mr13300969uag.118.1596507070267;
 Mon, 03 Aug 2020 19:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com> <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
 <20200803161230.GB23808@casper.infradead.org> <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
 <20200803222831.GI1236603@ZenIV.linux.org.uk> <20200804010913.GA2096725@ZenIV.linux.org.uk>
In-Reply-To: <20200804010913.GA2096725@ZenIV.linux.org.uk>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 3 Aug 2020 19:10:59 -0700
Message-ID: <CAJuCfpE3fqCDfNmKphg6ZkHVb-B07_jvhquVgwgPHPi1CTupmw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
        Hridya Valsaraju <hridya@google.com>,
        Ioannis Ilkos <ilkos@google.com>,
        John Stultz <john.stultz@linaro.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 3, 2020 at 6:09 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Aug 03, 2020 at 11:28:31PM +0100, Al Viro wrote:
>
> > IOW, what the hell is that horror for?  You do realize, for example, that there's
> > such thing as dup(), right?  And dup2() as well.  And while we are at it, how
> > do you keep track of removals, considering the fact that you can stick a file
> > reference into SCM_RIGHTS datagram sent to yourself, close descriptors and an hour
> > later pick that datagram, suddenly getting descriptor back?
> >
> > Besides, "I have no descriptors left" != "I can't be currently sitting in the middle
> > of syscall on that sucker"; close() does *NOT* terminate ongoing operations.

Thanks for your feedback, Al. I see your points and sorry for not
realizing these shortcomings.

> >
> > You are looking at the drastically wrong abstraction level.  Please, describe what
> > it is that you are trying to achieve.
>
> _IF_ it's "who keeps a particularly long-lived sucker pinned", I would suggest
> fuser(1) run when you detect that kind of long-lived dmabuf.  With events generated
> by their constructors and destructors, and detection of longevity done based on
> that.

That is the intention here. IIUC fuser(1) would require root access to
collect this information from a process other than the caller. Ideally
what we would like to have is a non-root process with specific
capabilities (in our case a process that can access BPF maps) to be
able to obtain the information on dma-buf users.
However, it might make more sense to track dma-buf usage from
dma_buf_getfile, dma_buf_get and dma_buf_put since these calls are the
ones that affect file refcount. Will dig some more into this.
Thanks for your time and sorry for not thinking it through beforehand.

>
> But that's only a semi-blind guess at the things you are trying to achieve; please,
> describe what it really is.
