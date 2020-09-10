Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D5026510A
	for <lists+linux-doc@lfdr.de>; Thu, 10 Sep 2020 22:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgIJUke (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Sep 2020 16:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgIJUjh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 16:39:37 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB93C061757
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 13:39:32 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l17so7683989edq.12
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 13:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QYmngQGxhwrP1IO10+U44hIuDR+Bh29FacWTWPCzifs=;
        b=WH2gIvD2kocNW47TzoJUq8vy8koxj0ikTiqTurIt6Osqva8P4NIsbGtJVGwywUIjkq
         xe3qkruoqIuEPaS3xmqhN2h7V3FGdVjN/fZNXtAtjbUs+ii6wOWOxYBwlihrbKA6Dsi2
         ZcxxkAAiqBfwAJnSmslWIncB3hpPqqLBsQnucMZPZcNa3susHR1gFRdjKlEQ6Zwl4evT
         Ngj6/THEyDfAL+bxEhBtLcLnD1Efcq5a03Byz8i2VKTt0P9PSzdVa+iwn8BOcmkqFZjj
         WKCR+bEgC/b8wFZGdDbKxyU2GcFt1zleojRTJ6mzpqrmZfP30xuKihxrC7oSbqE+O1e4
         z6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QYmngQGxhwrP1IO10+U44hIuDR+Bh29FacWTWPCzifs=;
        b=k9EOYmmkI+pdbglAhYEB+zmZVu2eQt8vIKRqO+h09SDn2G0kBhZtFOqU3V4EG7gFJb
         YJww2SACRf0hxnPkiOjT+bMzYUsJK40607YuqThKKvX+Xk5qxCyhluTVv2rJfcn9QnZd
         NC4//I3xCVzOuJnpFv85YWZiZAWlNDq2feG1ez/0iNxvBaLhUgPPaB+MUdhOmSez+AqN
         RZ7JvcY+0pw/SHIXfR+6yQhdYYZJK4Aj8cinZLv/mTbjmhdeZJUCSqRxNxealPxxU4W+
         bCSyXz6vir8zwdFvewmG25h7Mqo04Hqm9jq+OwDTT8wEUcddW9aKMEo0Nm5FgwkobSLv
         r5Uw==
X-Gm-Message-State: AOAM531uD5WlO9cHdP7lVy7FElqSgGQ0127SDYymQ2vlKhhl7fyMLOgE
        XZU9YP75Ru6+MZOokRlAYIyMxqMtHbRXQnxF3JVTuQ==
X-Google-Smtp-Source: ABdhPJzQ6i+tHlAxsWiND/QkNM3WvkTC+Ju6Mk1rDHZmgMyEa8UX1fZqVV5xbVt8ItiYrZl+V7nr/bCNAXGD3jgXwtk=
X-Received: by 2002:a05:6402:7d2:: with SMTP id u18mr11556708edy.69.1599770370678;
 Thu, 10 Sep 2020 13:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200910202107.3799376-1-keescook@chromium.org>
In-Reply-To: <20200910202107.3799376-1-keescook@chromium.org>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 10 Sep 2020 22:39:04 +0200
Message-ID: <CAG48ez0WzMpTqaTgtZwQ9MenCoWuyFn1yRhL9R0+s+=pbonTQA@mail.gmail.com>
Subject: Re: [RESEND][RFC PATCH 0/6] Fork brute force attack mitigation (fbfam)
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
> [kees: re-sending this series on behalf of John Wood <john.wood@gmx.com>
> also visible at https://github.com/johwood/linux fbfam]
[...]
> The goal of this patch serie is to detect and mitigate a fork brute force
> attack.
>
> Attacks with the purpose to break ASLR or bypass canaries traditionaly use
> some level of brute force with the help of the fork system call. This is
> possible since when creating a new process using fork its memory contents
> are the same as those of the parent process (the process that called the
> fork system call). So, the attacker can test the memory infinite times to
> find the correct memory values or the correct memory addresses without
> worrying about crashing the application.

For the next version of this patchset, you may want to clarify that
this is intended to stop brute force attacks *against vulnerable
userspace processes* that fork off worker processes. I was halfway
through the patch series before I realized that.
