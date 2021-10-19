Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D204340C9
	for <lists+linux-doc@lfdr.de>; Tue, 19 Oct 2021 23:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhJSVv1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Oct 2021 17:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhJSVv1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Oct 2021 17:51:27 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D78C06161C
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 14:49:14 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id j190so13877545pgd.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Oct 2021 14:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OiAYKXU6LKvLzjanHYWWmXBFY+iSjfiEc6TGGYBBgEw=;
        b=fWgHoUbXW88bErHyyMVe6LR3APM6ahymvSBseUQqdQzqNkt+VvsesPzwO4RHFaBlij
         bR+sKZTBVng5lqEvY72dla3yX2mjO8Gt+0AXLjwpbl4jo26VgWOXR1irR1iKCMlkNbC0
         WdSziG/GI9LQnckxhbb+CnFrXp23KZdCwfl9T1asOJ+fnvyB0SiNuOnYqzgpPN+9E+Ma
         ttMFTp8x3CijvS2K73aQIgiNaTDVcnjVVUNIlWlip82kANLzZmDf1Tyk+pxX5WdbfP5z
         uwBvFEVPswtN+iXY5L7p63bbFAJnxlq/iOGSfjGO6+BeN94nZonUF2VIOsn5XLuPYW36
         jY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OiAYKXU6LKvLzjanHYWWmXBFY+iSjfiEc6TGGYBBgEw=;
        b=ypL1XNsLt7m7VpONMkOTKwhvDEwBJLN7Kj9oCmwdwtnEdee7lVdhWGBGZMY/cgFSHt
         k6tr829eWlAxmgYVQnAjPIrw+S/kuV4eUJJyq8i8suxfx29/XA5F8gfDRSIZ+gZuW5gq
         Vp0wsB/j78FZNra9YQSLnIEHaes12KOL9eIohjpCT1oeEwxA44UIUTDvD+4twAE73m+B
         VJHJvXvRGWOtboGissY/+qjvOn7PzT7vaYC57tDcHNA5Yqh9a5fPo7xu/9SL9aB96RNc
         qi4me3S+Ezm0Sq6yI96Otc+Pd/ax/wq162XpjDeGc7aLwtQdIQXjN8hW0M5g29xA2mNh
         qtgw==
X-Gm-Message-State: AOAM530sO1fzx/dF70PDqikacv7dFpH3N9jj4Ns/iQzcZ7VIxIaY71Cn
        SIN79m6+xGxVJqk1UQj8QkS8BpoN39dMxg8IvX8MqQ==
X-Google-Smtp-Source: ABdhPJzO56j6stRSQaNbz97xoiOoYnHEVGX7T1UKCAYsxRNSP7iPGeSgEpd1t0abktKdfZIyPYIfrsF0oddX0anc/z4=
X-Received: by 2002:a05:6a00:b95:b0:44c:7c8b:f762 with SMTP id
 g21-20020a056a000b9500b0044c7c8bf762mr2429192pfj.60.1634680153440; Tue, 19
 Oct 2021 14:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210915195306.612966-1-kaleshsingh@google.com>
 <20210915195306.612966-2-kaleshsingh@google.com> <20211019164834.465b2a53@gandalf.local.home>
 <CAC_TJvfT-1SeEhDnVjRfcv1SjKmZbcdy=cBVXYeB1GLTv+=e+w@mail.gmail.com> <20211019172600.0f211c98@gandalf.local.home>
In-Reply-To: <20211019172600.0f211c98@gandalf.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Tue, 19 Oct 2021 14:49:02 -0700
Message-ID: <CAC_TJvf63YUZ50PRJaaWSKLaOC_XOag4d7iTM0Lx+RB6qqk-ZQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] tracing: Add support for creating hist trigger
 variables from literal
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 19, 2021 at 2:26 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 19 Oct 2021 14:21:04 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > Addition and subtraction are already supported operations. The use
> > case given in Documentation/trace/histogram.rst is for calculating
> > latencies. I don't have a use case where the constants may be needed
> > in the addition/subtraction, but for simplicity and completeness we
> > support them for all operations.
>
> Perhaps we should state that it's mostly added for completeness then.

Good point. I'll update the commit message to clarify it.

Thanks,
Kalesh
>
> Thanks,
>
> -- Steve
