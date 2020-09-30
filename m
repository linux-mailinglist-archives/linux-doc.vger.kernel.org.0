Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C8627F5F2
	for <lists+linux-doc@lfdr.de>; Thu,  1 Oct 2020 01:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730763AbgI3XZn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 30 Sep 2020 19:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732228AbgI3XZn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 19:25:43 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F237AC0613D2
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 16:25:42 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e18so2310060pgd.4
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 16:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hlKJ+FfSVyIeAzaG/EkGK7Un9Pk3Wxr576MJ7E0I3IY=;
        b=nOvXiMAlZRb1yYmHnykzlJkQbKnxwV9bDYf+wWvHWfHj0HDv1wrV0dIHsJcaRF6xB9
         6IvRQ3xg0G1NMN2hzZF8NzoFqBkCXbYsA1JlYu/FAqyq4SGaLPL3KNfQ7zZK2f6xAkwC
         oVAqbFCmOv7bXjgEFR1YXgLTsGqgSRFnNEYuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hlKJ+FfSVyIeAzaG/EkGK7Un9Pk3Wxr576MJ7E0I3IY=;
        b=dIW+IltJBxZdn54Tc3Q/wtuAk9cD5RXpOeJLXBDnrZcnN5mbkf8M07ZH1PY8KGxFg5
         w/b//hfZLsvs86hOzyhX713Y7664c0i3kfmhNVclMRm3kUFeWrNDFGpn/GscLWbE+7Rp
         14HDK0HB+rdosB/XSuWPGjDLE2G/VAVHxgK+0jvcKsuP4u9QYoZajNMuUCNJQScEBJHH
         XP79QFOpJu3+VUIVT691+xz9Lu1jUIn6RpykBtVcFLSGLxHVJvajwyi8+loh+v6bMdfd
         UtyvYP3QzZriReQ7atselZP1OTmaVTBUm+O9S/5UJH846tVgDrwoUy+JYCZgEzEecW3w
         qcPw==
X-Gm-Message-State: AOAM532hr4HWlgbB5h1QkP05bO9UfBRmxuITRil6AYCd3TBduclDAKd5
        s+XkHCGsHIxOD5hvZ/K4tkHyNQ==
X-Google-Smtp-Source: ABdhPJz4E75cT8NJjYPlBQdG+MQ2UTB47oeQ8Y0P9yaLMPFMg8LU1mJHM799gXVf6QspTSWIIxJs3g==
X-Received: by 2002:a63:c04d:: with SMTP id z13mr3928899pgi.215.1601508342469;
        Wed, 30 Sep 2020 16:25:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id fz22sm3262561pjb.46.2020.09.30.16.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 16:25:41 -0700 (PDT)
Date:   Wed, 30 Sep 2020 16:25:40 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Tim.Bird@sony.com, lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Extract run_kselftest.sh and generate stand-alone
 test list
Message-ID: <202009301624.5698D652C4@keescook>
References: <20200928202650.2530280-1-keescook@chromium.org>
 <CA+G9fYtAWPuL=SEd3=K0WF3xVu6wwx4ETLadASxKKs0dMYbdWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtAWPuL=SEd3=K0WF3xVu6wwx4ETLadASxKKs0dMYbdWQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 30, 2020 at 09:47:49PM +0530, Naresh Kamboju wrote:
> On Tue, 29 Sep 2020 at 01:56, Kees Cook <keescook@chromium.org> wrote:
> >
> > v2:
> > - update documentation
> > - include SPDX line in extracted script
> > v1: https://lore.kernel.org/linux-kselftest/20200925234527.1885234-1-keescook@chromium.org/
> >
> >
> > Hi!
> >
> > I really like Hangbin Liu's intent[1] but I think we need to be a little
> > more clean about the implementation. This extracts run_kselftest.sh from
> > the Makefile so it can actually be changed without embeds, etc. Instead,
> > generate the test list into a text file. Everything gets much simpler.
> > :)
> >
> > And in patch 2, I add back Hangbin Liu's new options (with some extra
> > added) with knowledge of "collections" (i.e. Makefile TARGETS) and
> > subtests. This should work really well with LAVA too, which needs to
> > manipulate the lists of tests being run.
> >
> > Thoughts?
> 
> I have tested this patch set on LAVA with full run and it went well.

Thank you! You can include this as a tag too, so a "b4 am" will pick it
up:

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>


-Kees

> 
> >
> > -Kees
> >
> > [1] https://lore.kernel.org/lkml/20200914022227.437143-1-liuhangbin@gmail.com/
> >
> > Kees Cook (3):
> >   selftests: Extract run_kselftest.sh and generate stand-alone test list
> >   selftests/run_kselftest.sh: Make each test individually selectable
> >   doc: dev-tools: kselftest.rst: Update examples and paths
> >
> >  Documentation/dev-tools/kselftest.rst    | 35 +++++----
> >  tools/testing/selftests/Makefile         | 26 ++-----
> >  tools/testing/selftests/lib.mk           |  5 +-
> >  tools/testing/selftests/run_kselftest.sh | 93 ++++++++++++++++++++++++
> >  4 files changed, 124 insertions(+), 35 deletions(-)
> >  create mode 100755 tools/testing/selftests/run_kselftest.sh
> >
> > --
> > 2.25.1
> >
> 
> - Naresh

-- 
Kees Cook
