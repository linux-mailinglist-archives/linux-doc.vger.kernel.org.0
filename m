Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E22B102C6D
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2019 20:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfKSTQ1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 14:16:27 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35678 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbfKSTQ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 14:16:27 -0500
Received: by mail-pl1-f196.google.com with SMTP id s10so12294877plp.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 11:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xNq8z5XtG5KO8tgWaEJzHz1qCmBffX1guY4gM/pjvEA=;
        b=eVXKgI2IjM93eDDhQ1EynosRG3oZTbq4/39Piic0R6q2ar80FuTCHo/oGwZ/kJzLF0
         xi3rp/RH27oeawYS7HnmLIZ8hwnizmGzKd5mhp/2fmEs8QJTcXsj1aoMid9QUtxHh0jS
         C58KKN9ozkId0OvoJ+Q6Ifv/oyU9uqh/b6SaIpcVeSp8uE/t1CdkzVxUO7YMth0O8b4r
         z2VYw1HEyrhpRx8pnMcLoxKq0ZnEUglLUXItBaCEv0QyAmC7SuLLiwx+H3AiS+KUFAwI
         fpL1/FMtHPHFVKxTjdxzZpxwDK43lg+okztQUOt1brBU+5xOnk74uM9BP/mPrkSdb10+
         fkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xNq8z5XtG5KO8tgWaEJzHz1qCmBffX1guY4gM/pjvEA=;
        b=kfQ6wlX/0fZo1kZFJzZbHc1iHYjPzYvJLAqzQXluTqA5lcMakg0sXdaYQ68NYv7Jjo
         7BCy/5/1XaL8c3d0jYjXgx3Ag2Gc/PCn2qjlrGMO+nZV+lGiDzEM4pY8oiYvBPYBMAO0
         5oPA0Cc5/IuvECaaFKcyjZop5Par1ONVzSq63Y2fM9HN5hrnrdkFOTYXoPzQwPKEx2my
         mBvna4RRXp5apVgoW7rHJZnwFvNmb1uhOeQWJE5qJkNXD24L2S7XsCcj4DLptSht1czK
         0HNBhM4VRfeWejcxjyFD42QwrH3stWwTMc+HPacnyQq3VCJ9epq0u5N8hGfmtSuge4Gm
         EVuQ==
X-Gm-Message-State: APjAAAWKz7obnvjHWPUc8/5BYAOYh78zQ0M1o3arPnDOTVqox/PwFLS+
        PnJYlHZxhybtnfGh/HzFxmwW8IITZuNuQJBBROplmQ==
X-Google-Smtp-Source: APXvYqyAfZ8iphdg2LYP5pGF7y4vhTOtVs4nX4gS1JEZemNK7UZsDn+akGWXkMl0CcqMxHIzqs8XhZK+6qvgtASJbBY=
X-Received: by 2002:a17:90a:ff02:: with SMTP id ce2mr8519075pjb.117.1574190985408;
 Tue, 19 Nov 2019 11:16:25 -0800 (PST)
MIME-Version: 1.0
References: <1573812972-10529-1-git-send-email-alan.maguire@oracle.com> <1573812972-10529-4-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1573812972-10529-4-git-send-email-alan.maguire@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 19 Nov 2019 11:16:14 -0800
Message-ID: <CAFd5g473rHeUk6EJ_KnvRin5LrKyW4cNQxNHXmT2zkai5V=q1w@mail.gmail.com>
Subject: Re: [PATCH v4 linux-kselftest-test 3/6] kunit: allow kunit tests to
 be loaded as a module
To:     Alan Maguire <alan.maguire@oracle.com>,
        David Gow <davidgow@google.com>,
        Iurii Zaikin <yzaikin@google.com>,
        "Theodore Ts'o" <tytso@mit.edu>, Kees Cook <keescook@chromium.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        catalin.marinas@arm.com, joe.lawrence@redhat.com,
        penguin-kernel@i-love.sakura.ne.jp, schowdary@nvidia.com,
        urezki@gmail.com, andriy.shevchenko@linux.intel.com,
        Jonathan Corbet <corbet@lwn.net>, adilger.kernel@dilger.ca,
        Luis Chamberlain <mcgrof@kernel.org>, changbin.du@intel.com,
        linux-ext4@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Knut Omang <knut.omang@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 15, 2019 at 2:16 AM Alan Maguire <alan.maguire@oracle.com> wrote:
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

Hmm...should we maybe apply this naming scheme to all the tests then?
I think Kees might have suggested this. I am actually not sure whether
or not we should and would like to get other people's input.

It is a valid point that test-test or example-test are too general of
names for modules, but if this is the case, I think that inode-test is
probably too general as well. But if we are going that far, maybe we
should rename everything *-kunit-test.c.

> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Signed-off-by: Knut Omang <knut.omang@oracle.com>
> ---
>  fs/ext4/Kconfig                |   2 +-
>  fs/ext4/Makefile               |   5 +
>  fs/ext4/inode-test.c           |   4 +-
>  include/kunit/test.h           |  35 +++--
>  kernel/sysctl-test.c           |   4 +-
>  lib/Kconfig.debug              |   4 +-
>  lib/kunit/Kconfig              |   4 +-
>  lib/kunit/Makefile             |  10 +-
>  lib/kunit/assert.c             |   8 +
>  lib/kunit/example-test.c       |  88 -----------
>  lib/kunit/kunit-example-test.c |  90 +++++++++++
>  lib/kunit/kunit-test.c         | 334 +++++++++++++++++++++++++++++++++++++++++
>  lib/kunit/string-stream-test.c |   2 +-
>  lib/kunit/test-test.c          | 333 ----------------------------------------
>  lib/kunit/test.c               |   8 +
>  lib/kunit/try-catch.c          |   2 +
>  lib/list-test.c                |   4 +-
>  17 files changed, 494 insertions(+), 443 deletions(-)
>  delete mode 100644 lib/kunit/example-test.c
>  create mode 100644 lib/kunit/kunit-example-test.c
>  create mode 100644 lib/kunit/kunit-test.c
>  delete mode 100644 lib/kunit/test-test.c
