Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82691D7E75
	for <lists+linux-doc@lfdr.de>; Mon, 18 May 2020 18:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgERQ3Q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 May 2020 12:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgERQ3P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 May 2020 12:29:15 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9692FC05BD0A
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2020 09:29:15 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id e18so11224979iog.9
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2020 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wsQWTsWX2nHX19luhaDiip7r8CGCfrYXEJqyS+xYi/4=;
        b=bSPZNJ/+RFq4gD7fvba2WfPjrN7uJ1zq1w02BSYWZKYEPt/dPqB4b+WVzCZJrIi4nk
         zF1iLf6Y30e9ZEjEoza+2119f0YSs3e7TccHKRPO+w95GXhahxL2m7k7eAx+jgFrHePp
         zSWxnBkWAPtAWHQ4W6AnAXC4JdK1paRaYXaTRqUKzE8PZS+UXgo1B/CVjmCs0fYb6ZvI
         1MvnuXwousaFRSF0P4r/Wut/FQ3OsKp7KuHJeGko4uaTqBhhAUBDapIQ+hicvzLuYnZr
         wyDqQrhO+jWo4AWF23p9rxYcrwBwU3tx9d9tjkhvqeIHgz0mhNcW+kNFWRsqgC7JVJRR
         U+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wsQWTsWX2nHX19luhaDiip7r8CGCfrYXEJqyS+xYi/4=;
        b=d/qfdHEv7V2mRjF0tXdjGofNioNpTxKxnxbqFnLDuq2jhlhVfr9CVE5nHVyRyiusH2
         I4Bra6NrOislWKx9JMG3xlRsa8UlHQxI6DovLHZEADibbY8gMb5S/Zj9/KGb2G7OsAlk
         qIF8uv1RiLfRS9GQUTzCwzqPxsLqFtvq4lbU4ktWJSmaGxauibDgTaeB5nqdhNR3BFfB
         ZFkOG0HvFdJX1Jd3P2nThINY7r3w7wg4KPLJN/TAZyEuIQlRSDWWFhYa1SgJJxrRcw8K
         NbvxKZTEQF3iZJJjN/ubUGBBmb0MdiwovDuCsAd7yXv/gGOvSgxsXvJTXyNo34+YOvPK
         f1xQ==
X-Gm-Message-State: AOAM531DMBBJ7o3+ZuA0a/WM6e6SnhSxx+ck/AWkdy4MoAi6ebyjhlD9
        SWNJTJQnjwr8MUxEPmUMBEWhnvOQdWXRyoSSPQ/7Gg==
X-Google-Smtp-Source: ABdhPJwTWrU223OxJ1S7Jka4xPxM5BduJ3BBeoknX5KQJj3Em1XW1bG2YaoM6S0FyuZtIXVzvDeiVOju1MNmBizB8LA=
X-Received: by 2002:a5d:8257:: with SMTP id n23mr14198274ioo.165.1589819354158;
 Mon, 18 May 2020 09:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200424200135.28825-1-mathieu.poirier@linaro.org> <DB6PR0402MB2760B52EDFD1DB20AE0BDE3588B80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB2760B52EDFD1DB20AE0BDE3588B80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 18 May 2020 10:29:03 -0600
Message-ID: <CANLsYkyMOxmM_4c-v1iiHfrrQ3HmbS2Yyr5PVWPRJcSULxrmxg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] remoteproc: Add support for synchronisaton with rproc
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "loic.pallardy@st.com" <loic.pallardy@st.com>,
        "arnaud.pouliquen@st.com" <arnaud.pouliquen@st.com>,
        "s-anna@ti.com" <s-anna@ti.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 18 May 2020 at 07:28, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: [PATCH v3 00/14] remoteproc: Add support for synchronisaton with
> > rproc
>
> What's the status of this thread? Will this be applied or requires a new v4?

It will not be applied as more work needs to be done.  As one of the
people this feature will benefit, it would be really nice if you could
take the time to comment on the solution that is brought forward.

>
> Thanks,
> Peng.
>
> >
> > This is the third revision of this series that tries to address the problem of
> > synchronising with a remote processor with as much flexibility as possible.
> >
> > Two things to pay attention to:
> >
> > 1) Function rproc_actuate() has been abandoned to avoid creating another
> >    way to start a remote processor from a kernel driver.  Arnaud expressed
> >    the opinion that it is semantically questionnable to synchronise with a
> >    remote processor when calling rproc_boot().  We could rename
> >    rproc_boot() to rproc_actuate() but I'll wait to see what other people
> >    think before doing so.
> >
> > 2) The allocation of the synchronisation states has been split from the
> >    remote processor allocation.  A new function rproc_set_state_machine()
> >    does all the work now.  Proceeding this way has made the patchset a
> >    lot more simple.
> >
> > Other than the above I have tried to address all the comments made on the
> > second revision.  If a comment was not addressed it simply fell through the
> > cracks rather than ignored.  In such a case please reiterate your point
> > of view and I'll be sure to address it.
> >
> > Applies cleanly on rproc-next (305ac5a766b1).
> >
> > Best regards,
> > Mathieu
> >
> > Mathieu Poirier (14):
> >   remoteproc: Make core operations optional
> >   remoteproc: Introduce function rproc_alloc_internals()
> >   remoteproc: Add new operation and flags for synchronistation
> >   remoteproc: Refactor function rproc_boot()
> >   remoteproc: Refactor function rproc_fw_boot()
> >   remoteproc: Refactor function rproc_trigger_auto_boot()
> >   remoteproc: Introducting new start and stop functions
> >   remoteproc: Call core functions based on synchronisation flag
> >   remoteproc: Deal with synchronisation when crashing
> >   remoteproc: Deal with synchronisation when shutting down
> >   remoteproc: Deal with synchronisation when changing FW image
> >   remoteproc: Introducing function rproc_set_state_machine()
> >   remoteproc: Document function rproc_set_state_machine()
> >   remoteproc: Expose synchronisation flags via debugfs
> >
> >  Documentation/remoteproc.txt             |  17 ++
> >  drivers/remoteproc/remoteproc_core.c     | 197
> > +++++++++++++++++++----
> >  drivers/remoteproc/remoteproc_debugfs.c  |  21 +++
> > drivers/remoteproc/remoteproc_internal.h | 123 +++++++++++++-
> >  drivers/remoteproc/remoteproc_sysfs.c    |  24 ++-
> >  include/linux/remoteproc.h               |  27 ++++
> >  6 files changed, 372 insertions(+), 37 deletions(-)
> >
> > --
> > 2.20.1
>
