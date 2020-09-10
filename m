Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE9A265246
	for <lists+linux-doc@lfdr.de>; Thu, 10 Sep 2020 23:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgIJVNn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Sep 2020 17:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbgIJVLG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 17:11:06 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C29AC061756
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 14:11:06 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id q13so10792247ejo.9
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d2Fjne8H+Cg3bJEd1GSB4j314ZebR7pleObLwl830fs=;
        b=ScYVsVHCZlVh7Ci/3ehi1uakHdj9qnQ9FYyz9hPXQc/e9uvw9Ybg77wJD3gWPHx/lN
         oJjcajaLilUV00ZbqRFWOpGIIQ/pjS4ge040nFK/Xnk29BGf0AppVDAfW35o0selWBxs
         tv7s7bV3wkeNz2hD8ble8Y8voryZA384+K8+25DS+W99uS2fsFg8XFJrUo3mpG+GfVnt
         aVzMV9vnMTnLydG4qmxB0KE8A3WS2zYUGC2Vot/PZ5zf7tU3uF2exEpFDr/G3k8aVvGt
         XOuqUkU/7QvKAeWJhVePl/f3EZFBRyvcTs/HTzLQ9NYVNxAYa6ERfH86Hw3qAF0dRy2W
         Uphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d2Fjne8H+Cg3bJEd1GSB4j314ZebR7pleObLwl830fs=;
        b=Fno4gTbziuWD8nMOtAMxscG1K+T4p9jhdVE3kZXQfSe3KDSGLb7enfku5FVFddWUXS
         5mqrxq+bhaECPry4XQKKn2LyUom+oP9e584F+Lb/EH3pjTpIh/eibfZ+V3LMNpJL/tTc
         YYtW3ZV9baANOLuXcQuZLFFF+Tg1Quf2d0IvlGfAV6O6WZ85EoATVgZOpt17buzbEM8A
         qRJbzZf5oxRMepYb7d8RekZ+e/7s+Yq8JW79i4oVgGNZV91+GWWRWZMRGGyltDNxwEBT
         Ye11hXWAsBx8NRPRDbShnghdFIQ0qo+rLli5Qw5RQh+JNU/BkuJRPAKrIzDCpfXt13L4
         hKPA==
X-Gm-Message-State: AOAM5324J5y8wFlsQsR1IcXAePWtaLoHe3otUOktKemUt75GIhcArxUk
        rFu1WAn/NNnOe33Gq440RA5KmhnYSs+AATU4u5WgPQ==
X-Google-Smtp-Source: ABdhPJyNcf3ROxrc5CjvX9eqcm/Jags1MQ2ChzI30b0vpomzdYZOF0LTDDEZynORXIJAbG2ZaBuePa4L+nucdti2Xdg=
X-Received: by 2002:a17:907:94cf:: with SMTP id dn15mr11296236ejc.114.1599772264641;
 Thu, 10 Sep 2020 14:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200910202107.3799376-1-keescook@chromium.org> <20200910202107.3799376-6-keescook@chromium.org>
In-Reply-To: <20200910202107.3799376-6-keescook@chromium.org>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 10 Sep 2020 23:10:38 +0200
Message-ID: <CAG48ez1gbu+eBA_PthLemcVVR+AU7Xa1zzbJ8tLMLBDCe_a+fQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] security/fbfam: Detect a fork brute force attack
To:     Kees Cook <keescook@chromium.org>
Cc:     Kernel Hardening <kernel-hardening@lists.openwall.com>,
        John Wood <john.wood@gmx.com>,
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

On Thu, Sep 10, 2020 at 10:22 PM Kees Cook <keescook@chromium.org> wrote:
> To detect a fork brute force attack it is necessary to compute the
> crashing rate of the application. This calculation is performed in each
> fatal fail of a task, or in other words, when a core dump is triggered.
> If this rate shows that the application is crashing quickly, there is a
> clear signal that an attack is happening.
>
> Since the crashing rate is computed in milliseconds per fault, if this
> rate goes under a certain threshold a warning is triggered.
[...]
> +/**
> + * fbfam_handle_attack() - Fork brute force attack detection.
> + * @signal: Signal number that causes the core dump.
> + *
> + * The crashing rate of an application is computed in milliseconds per fault in
> + * each crash. So, if this rate goes under a certain threshold there is a clear
> + * signal that the application is crashing quickly. At this moment, a fork brute
> + * force attack is happening.
> + *
> + * Return: -EFAULT if the current task doesn't have statistical data. Zero
> + *         otherwise.
> + */
> +int fbfam_handle_attack(int signal)
> +{
> +       struct fbfam_stats *stats = current->fbfam_stats;
> +       u64 delta_jiffies, delta_time;
> +       u64 crashing_rate;
> +
> +       if (!stats)
> +               return -EFAULT;
> +
> +       if (!(signal == SIGILL || signal == SIGBUS || signal == SIGKILL ||
> +             signal == SIGSEGV || signal == SIGSYS))
> +               return 0;

As far as I can tell, you can never get here with SIGKILL, since
SIGKILL doesn't trigger core dumping and also isn't used by seccomp?

> +
> +       stats->faults += 1;

This is a data race. If you want to be able to increment a variable
that may be concurrently incremented by other tasks, use either
locking or the atomic_t helpers.

> +       delta_jiffies = get_jiffies_64() - stats->jiffies;
> +       delta_time = jiffies64_to_msecs(delta_jiffies);
> +       crashing_rate = delta_time / (u64)stats->faults;

Do I see this correctly, is this computing the total runtime of this
process hierarchy divided by the total number of faults seen in this
process hierarchy? If so, you may want to reconsider whether that's
really the behavior you want. For example, if I configure the minimum
period between crashes to be 30s (as is the default in the sysctl
patch), and I try to attack a server that has been running without any
crashes for a month, I'd instantly be able to crash around
30*24*60*60/30 = 86400 times before the detection kicks in. That seems
suboptimal.

(By the way, it kind of annoys me that you call it the "rate" when
it's actually the inverse of the rate. "Period" might be more
appropriate?)



> +       if (crashing_rate < (u64)sysctl_crashing_rate_threshold)
> +               pr_warn("fbfam: Fork brute force attack detected\n");
> +
> +       return 0;
> +}
> +
> --
> 2.25.1
>
