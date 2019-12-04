Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDEFE1120CA
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2019 01:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfLDAzZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Dec 2019 19:55:25 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44222 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLDAzZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 19:55:25 -0500
Received: by mail-wr1-f66.google.com with SMTP id q10so6377548wrm.11
        for <linux-doc@vger.kernel.org>; Tue, 03 Dec 2019 16:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e2Azc16Vw4ryTYqh29ZhrpRERgOlPUdv16uA7Ge2ox4=;
        b=oU3RI8RuGAnLzan6JzZGxTOz1LeLVBDqbni8Ea82NabY23NmjsmEKWvosJld0Nya7e
         yNhnapLfvI+dxZ93IOdQFMvKBH0/NUoAimXLZGhjxTCOVKOFjIFNZ1sqJQXHiiL0SN2A
         lyYssl2AANQxxbHpV+pxJv0U/m1euUdsRGRbveXcXt1DX9p0a66xfME1bfdZYMbNk+DW
         ElCWJ1pO4V469mxDQQhr+WcZpCyMt0GMQWRWYdw+Lgl2URh0IUewq6cfBFmfqYyzEyyE
         mfwaWFcZ2+Y0DZK3Qv257QkcYKvd/KrS1AimIrlpa667CinHXdgaR/nW/cCWdHzI1CmZ
         0bmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2Azc16Vw4ryTYqh29ZhrpRERgOlPUdv16uA7Ge2ox4=;
        b=RCCq+O8TOqRRhRc84mWDAmmdTpAxtrVfCoB1PRFJ7+MrgOmt+pVJ/GuDgYOcsWN1U8
         d8yrCBJXlt/7vHMNGgnUQgt3t4RGixWuGTxQJQra1dGGB3j6U338hFNnF9laMEdhLbXH
         kj615S8JSpC85JU02CaTxIKsyWbIMW+8UKhxTYhALMtg3BPmQERlRjzO+43rt73E/Hya
         n8rfKctlw7d0iLZnXy1BtN4GcN6WvpMdurSjfMgTG7GkWuG6G1bZtMI91gk+5E+XdiX8
         xGbXEYvcstbIRSQdkTvE6jy1qfFzf72Llqdse6gNOoTE+7a5d8jcuXc6PIt7uQXGIq7l
         OmcA==
X-Gm-Message-State: APjAAAUjGad231PevhrI4PPj03eXDP0iikeG4eYjkzYGwC8lx+jnHoI0
        2fyBW72EAYUrgroPRQ6KEMrbUGutJ95KCHh2Nc+gYw==
X-Google-Smtp-Source: APXvYqwaXcNZHm6NG4ULW38X0tHXZZUc4SvPr+46VmXZB3u1NEBvvPM0cY/ZXqxxyo3blM69EXP/X9UTvUJxLArinaA=
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr968333wrp.2.1575420923180;
 Tue, 03 Dec 2019 16:55:23 -0800 (PST)
MIME-Version: 1.0
References: <1575374868-32601-1-git-send-email-alan.maguire@oracle.com> <1575374868-32601-4-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1575374868-32601-4-git-send-email-alan.maguire@oracle.com>
From:   David Gow <davidgow@google.com>
Date:   Tue, 3 Dec 2019 16:55:11 -0800
Message-ID: <CABVgOSnEKQGdzdjLAuGDXMF1WB5ga-ePqmMzQhbCWP=2qiv7ew@mail.gmail.com>
Subject: Re: [PATCH v5 linux-kselftest-test 3/6] kunit: allow kunit tests to
 be loaded as a module
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        yamada.masahiro@socionext.com, catalin.marinas@arm.com,
        joe.lawrence@redhat.com, penguin-kernel@i-love.sakura.ne.jp,
        urezki@gmail.com, andriy.shevchenko@linux.intel.com,
        Jonathan Corbet <corbet@lwn.net>, adilger.kernel@dilger.ca,
        tytso@mit.edu, Luis Chamberlain <mcgrof@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Knut Omang <knut.omang@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 3, 2019 at 4:08 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> As tests are added to kunit, it will become less feasible to execute
> all built tests together.  By supporting modular tests we provide
> a simple way to do selective execution on a running system; specifying
>
> CONFIG_KUNIT=y
> CONFIG_KUNIT_EXAMPLE_TEST=m
>
> ...means we can simply "insmod example-test.ko" to run the tests.
>
> To achieve this we need to do the following:
>
> o export the required symbols in kunit
> o string-stream tests utilize non-exported symbols so for now we skip
>   building them when CONFIG_KUNIT_TEST=m.
> o support a new way of declaring test suites.  Because a module cannot
>   do multiple late_initcall()s, we provide a kunit_test_suites() macro
>   to declare multiple suites within the same module at once.
> o some test module names would have been too general ("test-test"
>   and "example-test" for kunit tests, "inode-test" for ext4 tests);
>   rename these as appropriate ("kunit-test", "kunit-example-test"
>   and "ext4-inode-test" respectively).
>
> Co-developed-by: Knut Omang <knut.omang@oracle.com>
> Signed-off-by: Knut Omang <knut.omang@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---

Acked-by: David Gow <davidgow@google.com> # For list-test
