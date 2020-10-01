Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED2927F8E7
	for <lists+linux-doc@lfdr.de>; Thu,  1 Oct 2020 07:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730660AbgJAFKC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 1 Oct 2020 01:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgJAFKB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 01:10:01 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DF0C061755
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 22:10:01 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id m7so4318259oie.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 22:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zfiXEz/Yp7QnacqOD0Bzaygm1o0QXJVF3bzwVd/E22Q=;
        b=Uz+lMmvfUS1+tFLwnQ2LlW/OVHuHJghfAGtFQ6AJ2KGeGLhy1Qky5mnDJwmzbAbpKb
         v7jfYo3oD29S7aGY7clc2Gq9wRpmItDqHfH1GVygOnbaQvgz8ez1XJHACveGMW+v2Pkz
         8PsriqINqCg2XRIaDmvD0VZWhLMRGfypdMvwcLxgWBqJRkf5lvDwAdb+XnVtrmFiMotM
         V8fUdTkREETmdPW7/XkRmjMdWtbJuWLL6y4W4PayDpTK7bIB/RGRZEFGJmcrBULqNU9H
         DuZW+PYMLdDinRJntfZBzT73jAtCISezkDzN1iRG5JrsuSk9LCQhoHbKAcqneS2KZdXV
         Si9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zfiXEz/Yp7QnacqOD0Bzaygm1o0QXJVF3bzwVd/E22Q=;
        b=IoJ4apSl7sdwMehI/+/kxQws9u4gJY4Gs/R/el/o65qWejpRWQjbMFhxPeK9vs4Ra3
         gd+el6fM8W8cgfx/CMwC5Mj1sxXLAQ0I0+xrXFLAUoZ912fRE+CCmtQa8rgy+X11kpo1
         1i7xNMFTr0dcNTiRDdCixhDQEG7yy9wAsNBs1niijui6x5pjX72qQcvrIXNUlfKZyUz4
         R9qpUUalZgEpQ+Y7I2Af5YEa8QxQHWz1dpD3noV1UiNuontPdcaImwoKpIxKzYDF2Ipx
         RC3KEfX8yPGfSdiSHMCBDxrPn33f6aUcKxLs88K4RmaQfnOJF/SHt+l/aeDSiLRpeGHB
         NRJw==
X-Gm-Message-State: AOAM532CMmDczSh5pfMlM5WbwhDmtIt4Xb111PiM6hexfIwzLlUq4flq
        4rZowHz4fpXQw104irUzLzDCn5QZMVZyxkxTH9jlRA==
X-Google-Smtp-Source: ABdhPJzQ6h/KHKuHn3/SzwzefC4Qb4baLReVpfD338TkNEHJRp7rh7ry3lxoUZOLw48LBreyERso58n2djRLzIXnL88=
X-Received: by 2002:aca:4142:: with SMTP id o63mr3062971oia.167.1601529001163;
 Wed, 30 Sep 2020 22:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202650.2530280-1-keescook@chromium.org> <20200928202650.2530280-3-keescook@chromium.org>
In-Reply-To: <20200928202650.2530280-3-keescook@chromium.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 1 Oct 2020 10:39:50 +0530
Message-ID: <CA+G9fYtLQN_dMXUE0zVbWmtYjpu16hbShMb+mxQh3tiedwrXuQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] selftests/run_kselftest.sh: Make each test
 individually selectable
To:     Kees Cook <keescook@chromium.org>
Cc:     Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Tim.Bird@sony.com, lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Sep 2020 at 01:56, Kees Cook <keescook@chromium.org> wrote:
>
> Currently with run_kselftest.sh there is no way to choose which test
> we could run. All the tests listed in kselftest-list.txt are all run
> every time. This patch enhanced the run_kselftest.sh to make the test
> collections (or tests) individually selectable. e.g.:
>
> $ ./run_kselftest.sh -c seccomp -t timers:posix_timers -t timers:nanosleep
>
> Additionally adds a way to list all known tests with "-l", usage
> with "-h", and perform a dry run without running tests with "-n".
>
> Co-developed-by: Hangbin Liu <liuhangbin@gmail.com>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

- Naresh
