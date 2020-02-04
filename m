Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C4815222F
	for <lists+linux-doc@lfdr.de>; Tue,  4 Feb 2020 23:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgBDWBq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Feb 2020 17:01:46 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45091 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbgBDWBp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Feb 2020 17:01:45 -0500
Received: by mail-pl1-f193.google.com with SMTP id b22so7834885pls.12
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2020 14:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2gbLrEwk02zWD7CENpU+Y79Z4g6lABXP6G5204ZKfF0=;
        b=E0oUbKMeJ/0TYgw6tXi/MO3OscDACPIaTiAsWEZIXsQv1vNqtOobaC90NrPhXEpUYJ
         VssEyhthK9sByNSf/0MA5pn1q0+p1fv5/odVot189qFvsw1AJiFPZ1PMYV/iI4RKyOLp
         HJpmQkUZn4rwRCt+vIJZMS33fKHuIoaYsQ/BiBHFLf2hnVTthuZv7xXW53bOzIkoQXZ2
         82EOY+PI8EH9bdWbEInMwvP96+SdY1qHoHdF4wCgQ6t3r6pqFjL5pRm/JztJrnVDKGI5
         Lqtcr5XKBzE8EOobYkPpHanqQUdwU/9+0Aawc8tVHXQ0jI2uBbrwh9o6mCiu9iY0TSI1
         HlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2gbLrEwk02zWD7CENpU+Y79Z4g6lABXP6G5204ZKfF0=;
        b=XuNOk+d+7SGDsjZTmeudscHQrLfs9RyvUCp3sVxxTwrm3MX3dUDSBBOAC8C4p0E7xm
         NLn3tqX8IOuwlq2Pr9kuYqPv1lkP63Q+6JUdG6D88louo3xNCnzfrmaornBWKl+eilqT
         /FpXTAJjyoFa4CL5N4rnruERC+GaGpzsQ0wP16XpzmtmYNzCBMaXMh7LdXzwRDG6GquL
         ZRdPkEds8pkP+ef9xgDaUycSj3zdpkiEb8KOkau5Tl208XzuyDJMLUNGDOhU2CBUOSSx
         /PPVPd+rZBx3+VP7MlpmZXr7oKeMEDW/acZS7UrE0Y6OQhTcdl8LCl/PyWER19ncBEqG
         7lTw==
X-Gm-Message-State: APjAAAWXK/QqdSeUCbNioap5/uB3n2Xux2c2Ux8pBpoqggC8nCPB+E/q
        hCV0CMAQkCMWYDhCo/4FL+7wggNMGe5bxst7+j08hg==
X-Google-Smtp-Source: APXvYqxbz4sx3QIM2DYLthc3QPGt7xVW390CJ1zhH8z0BnZ3BPAOQ4lgq+vVdXkWYRiV/OfTJYB2C5zBqBukoNrw4CM=
X-Received: by 2002:a17:902:fe8d:: with SMTP id x13mr32553040plm.232.1580853704991;
 Tue, 04 Feb 2020 14:01:44 -0800 (PST)
MIME-Version: 1.0
References: <20200130230812.142642-1-brendanhiggins@google.com> <9e203718-dcca-3145-bc28-28979d41c278@gmail.com>
In-Reply-To: <9e203718-dcca-3145-bc28-28979d41c278@gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 4 Feb 2020 14:01:33 -0800
Message-ID: <CAFd5g45MQqGLY2xCjAmJz4-xxHwBo9DBPphZdnQMHDe=d-2K_Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] kunit: create a centralized executor to dispatch
 all KUnit tests
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Iurii Zaikin <yzaikin@google.com>,
        David Gow <davidgow@google.com>,
        Andrew Morton <akpm@linux-foundation.org>, rppt@linux.ibm.com,
        Greg KH <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Logan Gunthorpe <logang@deltatee.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Knut Omang <knut.omang@oracle.com>,
        linux-um <linux-um@lists.infradead.org>,
        linux-arch@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 4, 2020 at 1:18 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 1/30/20 5:08 PM, Brendan Higgins wrote:
> > ## TL;DR
> >
> > This patchset adds a centralized executor to dispatch tests rather than
> > relying on late_initcall to schedule each test suite separately along
> > with a couple of new features that depend on it.
>
> And the "couple of new features" are .... ?

Sorry, I thought I addressed that in the next section, specifically by
calling out: printing the test plan, and adding the new kernel command
line option. I will call these out here in any future cover letters.

> > ## What am I trying to do?
> >
> > Conceptually, I am trying to provide a mechanism by which test suites
> > can be grouped together so that they can be reasoned about collectively.
> > The last two of three patches in this series add features which depend
> > on this:
> >
> > PATCH 5/7 Prints out a test plan right before KUnit tests are run[1];
> >           this is valuable because it makes it possible for a test
> >           harness to detect whether the number of tests run matches the
> >           number of tests expected to be run, ensuring that no tests
> >           silently failed.
> >
> > PATCH 6/7 Add a new kernel command-line option which allows the user to
> >           specify that the kernel poweroff, halt, or reboot after
> >           completing all KUnit tests; this is very handy for running
> >           KUnit tests on UML or a VM so that the UML/VM process exits
> >           cleanly immediately after running all tests without needing a
> >           special initramfs.
> >
>
> > In addition, by dispatching tests from a single location, we can
> > guarantee that all KUnit tests run after late_init is complete, which
>
> That the tests will run after late init (and are guaranteed to do such)
> needs to be added to the documentation.

Yeah, that's reasonable. I am not sure where I should put this in the
documentation, however. This seems kind of a technical detail, and all
the pages I have now are more of how-tos, I think.

Maybe I should send a patch which adds a page detailing how KUnit works?

I would like to get some other people's thoughts on this. Such a
technical guide wouldn't provide me a lot of value, at least not now,
so I want to make sure that something like that would be valuable to
others.
