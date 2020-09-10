Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210EB2652BA
	for <lists+linux-doc@lfdr.de>; Thu, 10 Sep 2020 23:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgIJVWz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Sep 2020 17:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbgIJVW1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 17:22:27 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19632C0613ED
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 14:22:26 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id gr14so10891909ejb.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 14:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N10c9+tEMvd+V1v5/kjFg7uIplbi+YryLR/t+QNnqsU=;
        b=Pmbtzx/w5PJRKpuyzWZgUthB5SqsFujhymQl5gJo8f6W3hvApNoms7SWH1Ie3t+Xhv
         G4BzucZpRgNaCDRkBPiUSWCjEuLpi8agAsdGI/QBUu92rYGZ8Pp3MkAt2a24+m/S5x3B
         6epqPgVItTvZ5dHCiaBsFReRRMDht3h8fKCaRGh1IkHnw2lateEx0y9mDjHKtpX8Y8Nz
         pj8E/O7vvbiRPAFHA3pzg1fCXA5Q5JExBVpXPTHZUF0gtsfus/hcwcxmf9RfgHDwtSxq
         1bx0ofN7Nm21fcXiPRlbKh/d5ruR2ePp3ji5Py5uWlztcfvuDu+7GtC29bjR7vEOzNWS
         NI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N10c9+tEMvd+V1v5/kjFg7uIplbi+YryLR/t+QNnqsU=;
        b=cFTTiI+L1rxg/cZu4gUkBxZpMTBmr7VrlKj2r6AvkIO2lLWYgQS2pgHZ74WdqijLP3
         1r5u5UyTwDDSj0ApqU5RQ067zADBpPq1JQnyY7mfv5UwBylUzsnBPG0Y5PyBxsNGd1M+
         qbZG+fw3DT5NY0kP4nQci6qRLwl2YMe4vYeP6SWO3ctLAlSjWr+fxmHddU5iB93V0PnC
         I8lzfKSbo1BwYoIeQsLoMCtPIMq2H8mmXaooKNj1esnrQw04P+EUKR7lwd5OXQGAcEGf
         JNPY2L1xyWY0XcdelIOJbs4wjQXzcad7bRy0FdKljrrWk4riDDN4ijwNFTl2BXFqIIh1
         VY1w==
X-Gm-Message-State: AOAM531nr8Ly6WYwOtiAsADOy2z4A3Aqy2Z6hL2sQ2k+AhYX6xUbY59d
        rwDDGac/EfVW/P8GBeoEUoeUE+t9yexgiadlej0k7A==
X-Google-Smtp-Source: ABdhPJz1ZXFqvRU0UEmWsJMjbaIMk2L+dkrdUn+tEviQSYc6CnuQg/EudEOu/jzT2CS0AbLrfEZiZReKFnSsXFJuWYE=
X-Received: by 2002:a17:906:4088:: with SMTP id u8mr11408126ejj.184.1599772945031;
 Thu, 10 Sep 2020 14:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200910202107.3799376-1-keescook@chromium.org> <20200910202107.3799376-2-keescook@chromium.org>
In-Reply-To: <20200910202107.3799376-2-keescook@chromium.org>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 10 Sep 2020 23:21:58 +0200
Message-ID: <CAG48ez1V=oVczCCSuRaWX=bbN2cOi0Y9q48=e-Fuhg7mwMOi0A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] security/fbfam: Add a Kconfig to enable the fbfam feature
To:     Kees Cook <keescook@chromium.org>, John Wood <john.wood@gmx.com>
Cc:     Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Iurii Zaikin <yzaikin@google.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-doc@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 10, 2020 at 10:21 PM Kees Cook <keescook@chromium.org> wrote:
> From: John Wood <john.wood@gmx.com>
>
> Add a menu entry under "Security options" to enable the "Fork brute
> force attack mitigation" feature.
[...]
> +config FBFAM

Please give this a more descriptive name than FBFAM. Some name where,
if a random kernel developer sees an "#ifdef" with that name in some
random piece of kernel code, they immediately have a rough idea for
what kind of feature this is.

Perhaps something like THROTTLE_FORK_CRASHES. Or something else that
is equally descriptive.

> +       bool "Fork brute force attack mitigation"
> +       default n

"default n" is superfluous and should AFAIK be omitted.

> +       help
> +         This is a user defense that detects any fork brute force attack
> +         based on the application's crashing rate. When this measure is
> +         triggered the fork system call is blocked.

This help text claims that the mitigation will block fork(), but patch
6/6 actually kills the process hierarchy.
