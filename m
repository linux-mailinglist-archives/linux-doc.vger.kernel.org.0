Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239042868FE
	for <lists+linux-doc@lfdr.de>; Wed,  7 Oct 2020 22:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgJGU1O (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Oct 2020 16:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgJGU1J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Oct 2020 16:27:09 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D67AC061755
        for <linux-doc@vger.kernel.org>; Wed,  7 Oct 2020 13:27:08 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id d197so3950431iof.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2020 13:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jsu69see/ykpRTWpB/TurSUR1RWSN5aWLuA2sK2xflc=;
        b=I7WbYcmyJqf8fv/sv7FMD8j8itfvYnuusksGD+fa2j5dPcuvcMJFl4mQ1HyoTPytJC
         UqVSY/VgsrZlIQ/iXu0PwnBXzxyLZvOu8hpMxPpZBIhGoJj2OsURX6RzFuH6mIYogMfj
         qg6FhAx0LkZTiLOZzedL+IOz76GtKuR/ybyzOalLQxcef9+6n047D6e5qkRapSIFwc9X
         9lEpi9BR3nwh3thvrqZ6sMQDtXc6cRD209iglZDhXizbzZhRjThD8RI9e6TFVQFWx/P8
         pd8n+Kl5SVn3VvqWXMXJJJIPNXy2KPuw2UrfIjitOLnCRtl8YwkANiKk1iNjPK72gq3D
         xasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jsu69see/ykpRTWpB/TurSUR1RWSN5aWLuA2sK2xflc=;
        b=SDi0VzMXcNCCm/cTx/oGxUMW+c7O5X2t5HKXbFq7moLo7HMVyvMSPnzkk87UXNN+9K
         DsDDGH370Kc/BBPavGGWtItwg58lo+D1sQbx82ORRFsfqj9x2F+9QEIGyb0qpLx82zfv
         AdIjiA7f5992N/zqlKrQahTxkQtKQ+PslGBMr+nHlkRrGkSi/V42KfYOt+Oik0DjlSQs
         A2Ibde5HKYCehwpyjpTZNOfsn8g1ghdufR2vC6Ek1UexWhny6WmU8ZS2BPZ3u+ZjfJ8M
         y7wEBoajW6xMRdt6g2ETqzpkvUUpX/5Y4zTSmLx9r6dCyFyXxegxwzUTVZIHU1cHvedZ
         Yndw==
X-Gm-Message-State: AOAM531kgLvvgYNOloT9hiJZMt3CZA6086CJ38shYA7nq0CootKoGvH/
        PFljdoWZH+OH6iqHVUEBYg9RVktK/kNd0TuG+0X49w==
X-Google-Smtp-Source: ABdhPJwKDITkhtnb1bBPjzzWzphT/6zII4nnHVHrCMzFx5QFoNu7CLkAp0eVioGGpDu77ns5Mh22d719nbzC3MM/+Oo=
X-Received: by 2002:a6b:fa0e:: with SMTP id p14mr3646512ioh.208.1602102426919;
 Wed, 07 Oct 2020 13:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200924065606.3351177-1-lokeshgidra@google.com>
In-Reply-To: <20200924065606.3351177-1-lokeshgidra@google.com>
From:   Lokesh Gidra <lokeshgidra@google.com>
Date:   Wed, 7 Oct 2020 13:26:55 -0700
Message-ID: <CA+EESO7kCqtJf+ApoOcceFT+NX8pBwGmOr0q0PVnJf9Dnkrp6A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Control over userfaultfd kernel-fault handling
To:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Daniel Colascione <dancol@dancol.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Kalesh Singh <kaleshsingh@google.com>,
        Calin Juravle <calin@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Nick Kralevich <nnk@google.com>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Shaohua Li <shli@fb.com>, Jerome Glisse <jglisse@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        Nitin Gupta <nigupta@nvidia.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 23, 2020 at 11:56 PM Lokesh Gidra <lokeshgidra@google.com> wrote:
>
> This patch series is split from [1]. The other series enables SELinux
> support for userfaultfd file descriptors so that its creation and
> movement can be controlled.
>
> It has been demonstrated on various occasions that suspending kernel
> code execution for an arbitrary amount of time at any access to
> userspace memory (copy_from_user()/copy_to_user()/...) can be exploited
> to change the intended behavior of the kernel. For instance, handling
> page faults in kernel-mode using userfaultfd has been exploited in [2, 3].
> Likewise, FUSE, which is similar to userfaultfd in this respect, has been
> exploited in [4, 5] for similar outcome.
>
> This small patch series adds a new flag to userfaultfd(2) that allows
> callers to give up the ability to handle kernel-mode faults with the
> resulting UFFD file object. It then adds a 'user-mode only' option to
> the unprivileged_userfaultfd sysctl knob to require unprivileged
> callers to use this new flag.
>
> The purpose of this new interface is to decrease the chance of an
> unprivileged userfaultfd user taking advantage of userfaultfd to
> enhance security vulnerabilities by lengthening the race window in
> kernel code.
>
> [1] https://lore.kernel.org/lkml/20200211225547.235083-1-dancol@google.com/
> [2] https://duasynt.com/blog/linux-kernel-heap-spray
> [3] https://duasynt.com/blog/cve-2016-6187-heap-off-by-one-exploit
> [4] https://googleprojectzero.blogspot.com/2016/06/exploiting-recursion-in-linux-kernel_20.html
> [5] https://bugs.chromium.org/p/project-zero/issues/detail?id=808
>
> Changes since v3:
>
>   - Modified the meaning of value '0' of unprivileged_userfaultfd
>     sysctl knob. Setting this knob to '0' now allows unprivileged users
>     to use userfaultfd, but can handle page faults in user-mode only.
>   - The default value of unprivileged_userfaultfd sysctl knob is changed
>     to '0'.
>
Request reviewers and maintainers to please take a look.

> Changes since v2:
>
>   - Removed 'uffd_flags' and directly used 'UFFD_USER_MODE_ONLY' in
>     userfaultfd().
>
> Changes since v1:
>
>   - Added external references to the threats from allowing unprivileged
>     users to handle page faults from kernel-mode.
>   - Removed the new sysctl knob restricting handling of page
>     faults from kernel-mode, and added an option for the same
>     in the existing 'unprivileged_userfaultfd' knob.
>
> Lokesh Gidra (2):
>   Add UFFD_USER_MODE_ONLY
>   Add user-mode only option to unprivileged_userfaultfd sysctl knob
>
>  Documentation/admin-guide/sysctl/vm.rst | 15 ++++++++++-----
>  fs/userfaultfd.c                        | 12 +++++++++---
>  include/uapi/linux/userfaultfd.h        |  9 +++++++++
>  3 files changed, 28 insertions(+), 8 deletions(-)
>
> --
> 2.28.0.681.g6f77f65b4e-goog
>
