Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D124680CA
	for <lists+linux-doc@lfdr.de>; Sat,  4 Dec 2021 00:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383538AbhLCXpk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Dec 2021 18:45:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383563AbhLCXpj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Dec 2021 18:45:39 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFCAC061751
        for <linux-doc@vger.kernel.org>; Fri,  3 Dec 2021 15:42:15 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so5408321otg.4
        for <linux-doc@vger.kernel.org>; Fri, 03 Dec 2021 15:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4JwQlDJ0eW7f9hYvr2thOhENg/qO/ZaZzGs6+sDFshM=;
        b=AJ/TTnwyVYSX6l2dbIpeBUSjXxXc1p865vm+D2RhGu04FOd1dojH/S075xAjkHvREE
         CX63gNQpg8eFmDqxN/+1Qwah0kEZdrJU5IZLuEmukgMBSbGT8ZVsX87ACdVvxTvnXDBK
         mZYWElg8rD4PTchWPB7nykjdZkyxRmpHBGGNR8kqpq8vCZXDfxbqez7uIQ5NdV7hMoCV
         Lf3SWZgqQW1MzTH/UOTBSje7705REt9thTaNdYmeUjFBEC9AlYqm2gHhrWgfoy3hsGkp
         iLaT99dRzBy0QEyguUM6y79ZuC6inrGFlSDfBARE+En7rgXRrfkwyxOXfrRn2Ukcdd0x
         ZlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4JwQlDJ0eW7f9hYvr2thOhENg/qO/ZaZzGs6+sDFshM=;
        b=yuyp2RBCt3BoaWifv4BjFOQNIWf+RCaUc7mYy7R4ZttQZ22s5kZVBh0NC5hsnesHa6
         wjM5K4P3Yut1brk9pne/5QJQNzghBKNDgPyUqIUz00KUYBKaN3L8SBk2eEonjhRc6mrJ
         yfHtZXyzjp+0m0zPyMzkBhH9D9Mk0xzQyksz1go6steu6TeNV4/02mFBDXK1Lh85eQZq
         wuxvFkb6eXV+th3oSJKWj0YEfeDYznTvScD77JkkpHymtoWtQz8Um6M3sPrj0uIE/nFD
         xKOQimjgMjCZ0y9mMgA6w8iBjxAmAjeLFLQ7uSQLfft7caxtrlyNF4jWa0sKs8fnWHJP
         xHLQ==
X-Gm-Message-State: AOAM533B63eok2zOcuAyIJQbbDYiF0sUG8nhSoPpb7ixEP3xuwFnUbBi
        99W1WWpGJA/LqTJZCITCIg7XWqnxNL3jAPMg4DwNAQ==
X-Google-Smtp-Source: ABdhPJzmeHxYPCJX3eYijPp8C1oQT6JTRLMS+qeYs0OAMS77tBDynJpAjMPOmqpeKVSmDxkzBYLKtTfkIQWBc6uaOn0=
X-Received: by 2002:a9d:7548:: with SMTP id b8mr18387018otl.92.1638574934196;
 Fri, 03 Dec 2021 15:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com> <20211130114433.2580590-5-elver@google.com>
 <YanbzWyhR0LwdinE@elver.google.com> <20211203165020.GR641268@paulmck-ThinkPad-P17-Gen-1>
 <20211203210856.GA712591@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211203210856.GA712591@paulmck-ThinkPad-P17-Gen-1>
From:   Marco Elver <elver@google.com>
Date:   Sat, 4 Dec 2021 00:42:02 +0100
Message-ID: <CANpmjNM0X1iAgz4vHTH4FSzdWdr1PiQQnoyFt-zoT2_VonFvVA@mail.gmail.com>
Subject: Re: [PATCH v3 04/25] kcsan: Add core support for a subset of weak
 memory modeling
To:     paulmck@kernel.org
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, llvm@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 3 Dec 2021 at 22:09, Paul E. McKenney <paulmck@kernel.org> wrote:
[...]
> A few quick tests located the following:
>
> [    0.635383] INFO: trying to register non-static key.
> [    0.635804] The code is fine but needs lockdep annotation, or maybe
> [    0.636194] you didn't initialize this object before use?
> [    0.636194] turning off the locking correctness validator.
> [    0.636194] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.16.0-rc1+ #3208
[...]
> When running without the new patch series, this splat does not appear.
>
> Do I need a toolchain upgrade?  I see the Clang 14.0 in the cover letter,
> but that seems to apply only to non-x86 architectures.
>
> $ clang-11 -v
> Ubuntu clang version 11.1.0-++20210805102428+1fdec59bffc1-1~exp1~20210805203044.169

Good catch! That would be lockdep telling me off for putting test
locks on the stack. :-/

I thought I had tested this with lockdep, but it seems the set of
semi-automated tests I run didn't (yet) generate a config with
KCSAN_WEAK_MEMORY + LOCKDEP.

This should be fixed by:
https://lkml.kernel.org/r/20211203233817.2815340-1-elver@google.com

Thanks,
-- Marco
