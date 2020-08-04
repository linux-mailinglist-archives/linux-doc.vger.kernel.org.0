Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7E823BD6C
	for <lists+linux-doc@lfdr.de>; Tue,  4 Aug 2020 17:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgHDPo5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Aug 2020 11:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbgHDPo4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Aug 2020 11:44:56 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25891C06179E
        for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2020 08:44:56 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 125so7201446vsg.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2020 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H4JQaTkH18iHZhr5mRcUoCQ7w0Oz4NhHM6QKGzTo1bo=;
        b=ldFkcUFp7ri+IazwVWH1DnJFGu4x0mPAE5c8LizFVx2rdt1FE7sAuwon3cwzJKF5LL
         ZNJqk1Re7Ztm4LTRTSxLIblqxv1Tdv3kmXSjg7auDZuvC8yZ0w69Nn/DGRo8tp0Eil14
         jFciSc7TK05orgQRJRd7XKd6eTpBBIMNXzVXQ2Jed9/2SZYXTu2h73RR/N6qsNl/Pca7
         9+8tv7nrB+KevcGtu4bJtd0lxUtz9q8jECfBtEGtUXeOl6f4BACUpXlr/k4Faqg/qrCp
         Hx6izzJsxcomSTRM+gxPrYoa/pz+vZQZOFj3Rncam1GLYEBX+eB0thlPgKUiM/AR0tKS
         NIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H4JQaTkH18iHZhr5mRcUoCQ7w0Oz4NhHM6QKGzTo1bo=;
        b=T5CFBTajgk1B/FB9s1WBDVsWIHLyBiMzfDoMtwV4rznJ1qXwiLeMg4wBuGExbybneK
         hyc7dfJ9QCDdGYVQTpcU4P9+LfPkW89L2CA8/is5uj3uGs4tmAuzfZlJR6u1h8g9Q1wI
         I+2w6qHgvsEzB3jwwx5eviq4aO6fj0QGBoEC1uWN4zTDbKp57uZmFhDZnbmYvm6fB6uq
         aObug/io8gwn46TSOyMVJwCSSZ/1G+M2i3V2m6vHR+RI4rnQF99Co4VuZmSputBEYRCN
         3QS/hQxfFqdT9NTyZ6zFmJi3rWPxfsGnrEiiwYB+vE13HhI7KDwnjlrZm0JglYiq0DG7
         n3Aw==
X-Gm-Message-State: AOAM530SWLulXTp1gfy4qclHlaWs65nPTlCoQapicr4CTda/AaemoK3w
        TDw3lYzRdYqnc7/8hBPJm7J9yw==
X-Google-Smtp-Source: ABdhPJyukknUS02GVsM5w7GzAW9AGOdf699gjZwqpksqLXYiV70ZhFCdPmPPK94v0vzmxZDb4/5nug==
X-Received: by 2002:a67:ef81:: with SMTP id r1mr8018212vsp.37.1596555894889;
        Tue, 04 Aug 2020 08:44:54 -0700 (PDT)
Received: from google.com (182.71.196.35.bc.googleusercontent.com. [35.196.71.182])
        by smtp.gmail.com with ESMTPSA id b138sm3212924vka.48.2020.08.04.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 08:44:54 -0700 (PDT)
Date:   Tue, 4 Aug 2020 15:44:51 +0000
From:   Kalesh Singh <kaleshsingh@google.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
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
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
Message-ID: <20200804154451.GA948167@google.com>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
 <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
 <20200803161230.GB23808@casper.infradead.org>
 <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
 <20200803222831.GI1236603@ZenIV.linux.org.uk>
 <20200804010913.GA2096725@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804010913.GA2096725@ZenIV.linux.org.uk>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 04, 2020 at 02:09:13AM +0100, Al Viro wrote:
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
> > 
> > You are looking at the drastically wrong abstraction level.  Please, describe what
> > it is that you are trying to achieve.

Hi Al. Thank you for the comments. Ultimately what we need is to identify processes
that hold a file reference to the dma-buf. Unfortunately we can't use only
explicit dma_buf_get/dma_buf_put to track them because when an FD is being shared
between processes the file references are taken implicitly.

For example, on the sender side:
   unix_dgram_sendmsg -> send_scm -> __send_scm -> scm_fp_copy -> fget_raw
and on the receiver side:
   unix_dgram_recvmsg -> scm_recv -> scm_detach_fds -> __scm_install_fd -> get_file

I understand now that fd_install is not an appropriate abstraction level to track these.
Is there a more appropriate alternative where we could use to track these implicit file
references?

> _IF_ it's "who keeps a particularly long-lived sucker pinned", I would suggest
> fuser(1) run when you detect that kind of long-lived dmabuf.  With events generated
> by their constructors and destructors, and detection of longevity done based on
> that.
> 
> But that's only a semi-blind guess at the things you are trying to achieve; please,
> describe what it really is.
