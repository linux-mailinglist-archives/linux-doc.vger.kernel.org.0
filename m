Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 323AB1010B1
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2019 02:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbfKSBYr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Nov 2019 20:24:47 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:43830 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbfKSBYr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Nov 2019 20:24:47 -0500
Received: by mail-pj1-f65.google.com with SMTP id a10so2042294pju.10
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2019 17:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u+EElGaeg7B4NHLzEdMEmecs3hx9HYQQt4MBfsxoGp4=;
        b=Uvv+qMR/YvSIV89+KOuySyIJSm4e4O8lhyJ4qzs92d2olMqEp9kxbAHwujSp/QcdyY
         1ikn1NyGEK1bTHUCPN2ReOTEP4BwNPd/W2fYw82oR5zuyyok3HUHSlXiwDRO5DvqNeQK
         kXUorqKAnxgoZ+vVnQLRK2tiy77SYX6dLHf7WUdBfG1dFN3EYNwGl1MLezFQtxNfWCeO
         FKCqQjRgAyWT3IhJ50fwUNjk5H2d5C5PrJ2bWdo8gzNdc1s6uMMEHft0PoI8IRCuCumK
         UzLRPVaBr4MFBZBOpTZguBQJBX6qjjqVFu0HFirRUDHSE9/fpX4v+Yf0mCoEJpa5jZDq
         F8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+EElGaeg7B4NHLzEdMEmecs3hx9HYQQt4MBfsxoGp4=;
        b=sMiu9hK0NAhvt/L9lJ1qlezASWf0Cipy9zCshPS8yUhS7ZTSX5IcdFdYjcs/eJbiLY
         cNaxh/Gf6X9dZlGdgTtYrjcjAywHMKRaOs93eYsuOtAbMw3MoqvfxX5l6UBGTnSFgdgU
         mmZWFxSUKhuw92Rsmj5r1ShOv6T3KcENGQhGyMvFMDNKl3ZsIMXBuobYc0vZSCy09ep7
         J0sDcm5VyHfgnCMobWrZ9BfTjQcpM5TWpTn5P7JuekK18qEqy2awH2wOVkgLQ05ovU3u
         dN2Yh83w3RpiB8SAFNvQkO6OQDi68FG75XssU3OMmDEVDdMDYhD4RZ7jnNektxr9I7Pl
         U+gQ==
X-Gm-Message-State: APjAAAVh4JEc5aMo8QsxFD9X/7q1aiKDoGQaMDaPm73VjnJCyS6N3ZI6
        5EbhjAyXQqpcGFhXIIFqTK/j/FLsTHu18EmVT9Y7aQ==
X-Google-Smtp-Source: APXvYqyQ0yIu5BJfhnGVAf7ZY450gOCdnTPdioyEqCBN6cL7YR/zlO5q8oTmMwfOkenfyH5sRhoTBLvV7xDeXBn6IOg=
X-Received: by 2002:a17:902:be14:: with SMTP id r20mr31102887pls.297.1574126685459;
 Mon, 18 Nov 2019 17:24:45 -0800 (PST)
MIME-Version: 1.0
References: <1573812972-10529-1-git-send-email-alan.maguire@oracle.com>
 <1573812972-10529-5-git-send-email-alan.maguire@oracle.com> <20191118220958.GS11244@42.do-not-panic.com>
In-Reply-To: <20191118220958.GS11244@42.do-not-panic.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 18 Nov 2019 17:24:33 -0800
Message-ID: <CAFd5g46PQ_kWERgoVC--QAUNOWT6p9AwsJPTV4sM7uv6L+iB2g@mail.gmail.com>
Subject: Re: [PATCH v4 linux-kselftest-test 4/6] kunit: remove timeout
 dependence on sysctl_hung_task_timeout_seconds
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Alan Maguire <alan.maguire@oracle.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        catalin.marinas@arm.com, joe.lawrence@redhat.com,
        penguin-kernel@i-love.sakura.ne.jp, schowdary@nvidia.com,
        urezki@gmail.com, andriy.shevchenko@linux.intel.com,
        Jonathan Corbet <corbet@lwn.net>,
        "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca,
        changbin.du@intel.com, linux-ext4@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Knut Omang <knut.omang@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 18, 2019 at 2:10 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Fri, Nov 15, 2019 at 10:16:10AM +0000, Alan Maguire wrote:
> > In discussion of how to handle timeouts, it was noted that if
> > sysctl_hung_task_timeout_seconds is exceeded for a kunit test,
> > the test task will be killed and an oops generated.  This should
> > suffice as a means of debugging such timeout issues for now.
> >
> > Hence remove use of sysctl_hung_task_timeout_secs, which has the
> > added benefit of avoiding the need to export that symbol from
> > the core kernel.
> >
> > Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> > Signed-off-by: Knut Omang <knut.omang@oracle.com>
>
> This seems like a workaround for sysctl_hung_task_timeout_secs not being
> exported. If true, this can be addressed by creating a symbol namespace
> (new) and using that namespace on this path.

It is; as discussed on in v3[1]. I don't really feel strongly one way
or the other, I can see arguments for either side. Still, I don't want
to give Alan the run-around. I think this is the 3rd or 4th time he
has tried to address this issue.

[1] https://lore.kernel.org/linux-kselftest/CAFd5g44esDP6WFmkjOiH+my_4iBeqMpFoScMCm_hQ0aFwNS9qw@mail.gmail.com/
